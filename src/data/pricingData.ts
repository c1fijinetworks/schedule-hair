export const lifetimeDeal = {
  title: 'Vanity Booking Plan (First 300 Salons)',
  subtitle: 'Lock in your $99 forever deal today.<br/><strong class="text-red-600 dark:text-red-400 text-lg">Price increases to $29/mo after the first 300 spots are gone.</strong>',
  price: 99,
  period: 'One-time payment',
  items: [
    { description: 'Premium Vanity URL (yoursalon.schedule.hair)' },
    { description: 'Boutique Branding & Custom Setup' },
    { description: 'Real-time Calendar & Booking' },
    { description: 'Mobile-First User Experience' },
    { description: 'Social & Google Business Integration' },
    { description: 'No monthly SaaS tax, ever!' },
    { description: 'White-Glove Tech Support Included' },
  ],
  callToAction: { target: '_blank' as const, text: 'Order Now Same Day', href: '#', variant: 'success' },
  hasRibbon: true,
  ribbonTitle: 'Selling Fast',
};
