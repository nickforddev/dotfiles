import * as Uebersicht from 'uebersicht'
import * as DataWidget from './data-widget.jsx'
import * as DataWidgetLoader from './data-widget-loader.jsx'
import * as Icons from '../icons.jsx'
import * as Settings from '../../settings'
import * as Utils from '../../utils'
import useWidgetRefresh from '../../hooks/use-widget-refresh'

export { micStyles as styles } from '../../styles/components/data/mic'

const settings = Settings.get()
const { widgets, micWidgetOptions } = settings
const { micWidget } = widgets
const { refreshFrequency } = micWidgetOptions

const DEFAULT_REFRESH_FREQUENCY = 20000
const REFRESH_FREQUENCY = Settings.getRefreshFrequency(refreshFrequency, DEFAULT_REFRESH_FREQUENCY)

export const Widget = () => {
  const [state, setState] = Uebersicht.React.useState()
  const [loading, setLoading] = Uebersicht.React.useState(micWidget)
  const { volume: _volume, input: _input } = state || {}
  const [volume, setVolume] = Uebersicht.React.useState(_volume && parseInt(_volume))
  const [input, setInput] = Uebersicht.React.useState(_input)
  const [active, setActive] = Uebersicht.React.useState(!!volume)

  const setMic = async (volume) => {
    if (volume === undefined) return
    // mute built-in mic to prevent conferencing apps from listening while muted
    await Uebersicht.run('SwitchAudioSource -s "Built-in Microphone" -t input')
    await Uebersicht.run(`osascript -e 'set volume input volume ${volume}'`)
    await Uebersicht.run(`SwitchAudioSource -s "${input}" -t input`)
  }

  const getMic = async () => {
    const input = (await Uebersicht.run('SwitchAudioSource -c -t input')).replace('\n', '')
    const volume = await Uebersicht.run(`osascript -e 'set ovol to input volume of (get volume settings)'`)
    setState({ volume: Utils.cleanupOutput(volume), input })
    setInput(input)
    setLoading(false)
  }

  useWidgetRefresh(micWidget, getMic, REFRESH_FREQUENCY)

  Uebersicht.React.useEffect(() => {
    const newVolume = active ? 100 : 0
    setVolume(newVolume)
    setMic(newVolume, input)
  }, [active])

  Uebersicht.React.useEffect(() => {
    if (_volume && parseInt(_volume) !== volume) {
      setVolume(parseInt(_volume))
    }
  }, [_volume])

  if (loading) return <DataWidgetLoader.Widget className="mic" />
  if (!state || volume === undefined || _volume === 'missing value') return null

  const Icon = !volume ? Icons.MicOff : Icons.MicOn

  const onMouseUp = () => {
    setActive(!active)
  }

  const classes = Utils.classnames('mic')

  return (
    <DataWidget.Widget classes={classes} disableSlider onClick={onMouseUp}>
      <div className="mic__display">
        <Icon />
      </div>
    </DataWidget.Widget>
  )
}
