// 示例领域模块：订单状态流转。用来演示状态机测试，确认骨架可用后可以删除。

export type OrderStatus = 'created' | 'paid' | 'shipped' | 'cancelled' | 'refunded'
export type OrderAction = 'pay' | 'ship' | 'cancel'

const TRANSITIONS: Record<OrderStatus, Partial<Record<OrderAction, OrderStatus>>> = {
  created: { pay: 'paid', cancel: 'cancelled' },
  paid: { ship: 'shipped', cancel: 'refunded' },
  shipped: {},
  cancelled: {},
  refunded: {},
}

export function canApply(status: OrderStatus, action: OrderAction): boolean {
  return TRANSITIONS[status][action] !== undefined
}

export class OrderLifecycle {
  #status: OrderStatus = 'created'

  get status(): OrderStatus {
    return this.#status
  }

  apply(action: OrderAction): void {
    const next = TRANSITIONS[this.#status][action]
    if (next === undefined) {
      throw new Error(`订单处于 ${this.#status} 状态，不能执行 ${action}`)
    }
    this.#status = next
  }
}
