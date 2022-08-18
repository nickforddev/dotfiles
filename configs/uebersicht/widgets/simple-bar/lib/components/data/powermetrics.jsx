import * as Uebersicht from 'uebersicht'
import * as DataWidget from './data-widget.jsx'
import * as DataWidgetLoader from './data-widget-loader.jsx'
import * as Icons from '../icons.jsx'
import useWidgetRefresh from '../../hooks/use-widget-refresh'
import * as Utils from '../../utils'
import * as Settings from '../../settings'

export { powerMetricsStyles as styles } from '../../styles/components/data/powermetrics'

// const settings = Settings.get()
// const { widgets, batteryWidgetOptions } = settings
// const { batteryWidget } = widgets
// const { refreshFrequency, toggleCaffeinateOnClick, caffeinateOption } = batteryWidgetOptions

const DEFAULT_REFRESH_FREQUENCY = 30000
// const REFRESH_FREQUENCY = Settings.getRefreshFrequency(refreshFrequency, DEFAULT_REFRESH_FREQUENCY)


export const Widget = () => {
  const [state, setState] = Uebersicht.React.useState()
  const [loading, setLoading] = Uebersicht.React.useState(true)
  const [isMetric, setMetric] = Uebersicht.React.useState(true)

  const getCpuTemp = async () => {
    const [cpuUsageOutput, cpuTempOutput] = await Promise.all([
      Uebersicht.run(`top -l 1 | grep -E "^CPU"`),
      Uebersicht.run(`sudo powermetrics -n 1 --samplers smc | grep -i "CPU die temperature"`)
    ])
    const cpuUsageOutputArray = cpuUsageOutput.trim().split(' ')
    const cpuUsage = cpuUsageOutputArray[cpuUsageOutputArray.length - 2]

    const cpuTempOutputArray = cpuTempOutput.split(' ')
    const cpuTemp = cpuTempOutputArray[cpuTempOutputArray.length - 2]
    setState({
      cpuTemp: isMetric ? cpuTemp : parseFloat(((cpuTemp * 1.8) + 32).toFixed(2)),
      cpuUsage: (100 - parseFloat(cpuUsage)).toFixed(2)
    })
    setLoading(false)
  }

  useWidgetRefresh({}, getCpuTemp, DEFAULT_REFRESH_FREQUENCY)

  if (loading) return <DataWidgetLoader.Widget className="powermetrics" />
  if (!state) return null

  const { cpuTemp, cpuUsage } = state
  const isHighTemp = cpuTemp > 80
  // const isLowBattery = !charging && percentage < 20

  const classes = Utils.classnames('powermetrics', {
    'powermetrics--cpu-temp-high': isHighTemp,
  })

  const onClick = async (e) => {
    setMetric(!isMetric)
    getCpuTemp()
  }

  // const onClickProp = toggleCaffeinateOnClick ? { onClick } : {}
  const onClickProp = { onClick }

  const Icon = () => (
    <div className="powermetrics__icon">
      <Icons.Thermostat className="powermetrics__temp-icon" />
    </div>
  )

  // Icon={Icon}

  return (
    <DataWidget.Widget Icon={Icon} classes={classes} disableSlider {...onClickProp}>
      {/* {caffeinate.length > 0 && <Icons.Coffee className="battery__caffeinate-icon" />} */}
      CPU: {cpuTemp}°{ isMetric ? 'C' : 'F' }, { cpuUsage }%
    </DataWidget.Widget>
  )
}
