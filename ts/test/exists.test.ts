
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { StrictlyBetterSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await StrictlyBetterSDK.test()
    equal(null !== testsdk, true)
  })

})
