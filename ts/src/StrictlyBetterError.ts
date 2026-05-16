
import { Context } from './Context'


class StrictlyBetterError extends Error {

  isStrictlyBetterError = true

  sdk = 'StrictlyBetter'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  StrictlyBetterError
}

