// 示例领域模块：订单计价。用来演示决策表和属性测试，确认骨架可用后可以删除。
// 金额一律用整数“分”表示，避免浮点误差。

export type Tier = 'standard' | 'gold'

export interface OrderLine {
  unitPriceCents: number
  quantity: number
}

export interface PricingInput {
  tier: Tier
  lines: readonly OrderLine[]
  couponCents: number
}

const THRESHOLD_CENTS = 10_000
const THRESHOLD_DISCOUNT_CENTS = 1_000
const GOLD_RATE_PERCENT = 95

export function subtotalCents(lines: readonly OrderLine[]): number {
  return lines.reduce((sum, line) => sum + line.unitPriceCents * line.quantity, 0)
}

/** 先扣优惠券，再判断满减，金卡最后打九五折并四舍五入到分。 */
export function totalCents(input: PricingInput): number {
  const afterCoupon = Math.max(0, subtotalCents(input.lines) - input.couponCents)
  const afterThreshold =
    afterCoupon >= THRESHOLD_CENTS ? afterCoupon - THRESHOLD_DISCOUNT_CENTS : afterCoupon
  return input.tier === 'gold'
    ? Math.round((afterThreshold * GOLD_RATE_PERCENT) / 100)
    : afterThreshold
}
