import * as Pywal from './pywal'
import * as PywalFull from './pywal-full'

export const colors = {
  main: Pywal.variables.background,
  mainAlt: Pywal.variables.function,
  minor: Pywal.variables.function,
  accent: Pywal.variables.result,
  red: Pywal.variables.operator,
  green: Pywal.variables.result,
  yellow: Pywal.variables.cursor,
  orange: Pywal.variables.scrollbar,
  blue: Pywal.variables.matched,
  magenta: Pywal.variables.variable,
  cyan: Pywal.variables.function,
  focusRing: `0 0 0 3px ${PywalFull.variables.colors.color6}`,
  hoverRing: `0 0 0 3px ${Pywal.variables.variable}`,
}
