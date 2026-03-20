export const lifetimeDeal = {
  title: 'Lifetime Deal (Limited time)',
  subtitle: 'Pay once and own it forever.',
  price: 99,
  period: 'One-time payment',
  items: [
    { description: '60 seconds Testimonial Engine' },
    { description: 'Full Setup for you!' },
    { description: 'Automated Testimonial Collection' },
    { description: 'Beautiful Widget for your Website' },
    { description: 'No subscription, ever!' },
    { description: 'Includes All Future Updates' },
    { description: 'Zero Risk. 100% Satisfaction Guaranteed!' },
  ],
  callToAction: {
    target: '_blank' as const,
    text: 'Get the Forever Plan ( Limited time only )',
    href: '#', // Add your payment link here
    variant: 'success', // ADDED THIS LINE
  },
};
