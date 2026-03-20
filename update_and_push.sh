#!/bin/bash

# 1. Update Navigation and Footer
cat << 'INNER' > src/navigation.ts
import { getPermalink } from './utils/permalinks';
export const headerData = {
  links: [
    { text: 'Features', href: getPermalink('/#features') },
    { text: 'How It Works', href: getPermalink('/#howitworks') },
    { text: 'The Story', href: getPermalink('/about') },
    { text: 'Grab Your Vanity URL', href: getPermalink('/pricing') },
  ],
  actions: [{ text: 'Get Started - $99', variant: 'primary', href: '/pricing' }],
};
export const footerData = {
  links: [{ title: 'Schedule.Hair', links: [
    { text: "Claim Your Spot – $99", href: getPermalink('/pricing') },
    { text: 'Why We Love Salons', href: getPermalink('/about') },
    { text: 'Support', href: getPermalink('/contact') },
  ]}],
  secondaryLinks: [
    { text: 'Terms of Service', href: getPermalink('/terms') },
    { text: 'Privacy Policy', href: getPermalink('/privacy') },
  ],
  socialLinks: [],
  footNote: \`
    <div class="inline-flex items-center justify-center flex-wrap">
      <img class='w-5 h-5 mr-2 rounded-sm align-middle' src='/images/footer-icon.webp' alt='Schedule Hair' loading='lazy'>
      <span class="align-middle">✂️ Fill your chairs. | © \${new Date().getFullYear()} <a class="text-blue-600 underline dark:text-muted" href="#">Schedule.Hair</a></span>
    </div>\`,
};
INNER

# 2. Update Pricing Data
cat << 'INNER' > src/data/pricingData.ts
export const lifetimeDeal = {
  title: 'Vanity Booking Plan (Lifetime)',
  subtitle: 'One-time payment for a professional edge.',
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
  callToAction: { target: '_blank' as const, text: 'Claim My Vanity URL Now', href: '#', variant: 'success' },
};
INNER

# 3. Update Homepage (index.astro)
cat << 'INNER' > src/pages/index.astro
---
import Layout from '~/layouts/PageLayout.astro';
import Header from '~/components/widgets/Header.astro';
import Hero2 from '~/components/widgets/Hero2.astro';
import Features from '~/components/widgets/Features.astro';
import Steps2 from '~/components/widgets/Steps2.astro';
import Content from '~/components/widgets/Content.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { headerData } from '~/navigation';
import FAQs from '~/components/widgets/FAQs.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = {
  title: 'Schedule.Hair | Boutique Web Development for Salons',
  description: 'Replace generic links with a beautiful scheduling page on your own professional domain. Fill your chairs on autopilot.',
  ignoreTitleTemplate: true,
};
---
<Layout metadata={metadata}>
  <Fragment slot="header"><Header {...headerData} isSticky /></Fragment>
  <Hero2
    tagline="Boutique Web Development for Salons"
    title='<span class="text-accent dark:text-white">Fill Your Chairs with a Pro Booking Link.</span>'
    subtitle="We replace clunky generic links with a beautiful scheduling page on your own professional vanity URL (yoursalon.schedule.hair). Same-day setup, premium hosting included."
    actions={[
      { variant: 'primary', text: 'Get Your Booking Link Today', href: '/pricing/' },
      { text: 'See How It Works', href: '#howitworks' },
    ]}
    video="/images/hero-animation.mp4" 
    poster="/images/hero-poster.webp" 
    testimonial={{ quote: "Generic links feel cheap. Switching to schedule.hair made my brand look high-end instantly. My clients love the new flow!", name: "Sarah L., Salon Owner" }}
  />
  <Features
    id="features"
    title="Luxury Booking, Simplified"
    subtitle="We handle the tech. You focus on the hair."
    columns={2}
    items={[
        { title: 'Custom Salon Branding', description: 'Your booking page perfectly matches your logo, colors, and unique salon vibe.', icon: 'tabler:palette' },
        { title: 'Frictionless Scheduling', description: 'Easy-to-use calendar booking designed for high conversion and zero friction.', icon: 'tabler:calendar-check' },
        { title: 'Social Integration', description: 'Perfect to link directly to Google Business Profile, Instagram, and TikTok.', icon: 'tabler:share' },
        { title: 'Professional Hosting', description: 'We handle all the tech, hosting, and domains—you just get ready for appointments.', icon: 'tabler:world' },
    ]}
  />
  <Content
    items={[
        { title: 'Real-time Availability', description: 'Synced directly with your schedule to avoid double bookings.', icon: 'tabler:clock' },
        { title: 'Service-Based Pricing', description: 'Displays your custom price list and durations clearly for clients.', icon: 'tabler:coin' },
        { title: 'Vanity Booking URLs', description: 'Professional addresses like velvet.schedule.hair that clients trust.', icon: 'tabler:link' },
    ]}
    image={{ src: '/images/testimonial-2.webp', alt: 'Stylist using booking app' }}
  >
    <Fragment slot="content"><h3 class="text-2xl font-bold tracking-tight sm:text-3xl mb-2">The booking experience your clients deserve.</h3></Fragment>
  </Content>
  <div id="howitworks" class="scroll-mt-20">
    <Steps2
      title="Three Steps to a Full Calendar"
      items={[
        { title: '1. Send Us Your Info', description: 'Share your logo and services. We tailor the app to fit your brand.', icon: 'tabler:number-1' },
        { title: '2. We Build & Host', description: 'We build your custom engine and host it on your professional vanity domain.', icon: 'tabler:number-2' },
        { title: '3. Start Getting Booked', description: 'Add your new link to your bio and watch the appointments roll in.', icon: 'tabler:number-3' },
      ]}
      image={{ src: '/images/testimonial-6.webp', alt: 'Scheduling interface' }}
    />
  </div>
  <Pricing title='<span class="text-accent">Invest Once. Fill Your Schedule.</span>' prices={[lifetimeDeal]} />
  <FAQs
    title="Frequently Asked Questions"
    items={[
        { title: 'What is a Vanity URL?', description: 'A custom, clean link like "yoursalon.schedule.hair" instead of messy generic codes.', icon: 'tabler:help' },
        { title: 'Do I have to pay monthly?', description: 'No. Our $99 lifetime deal covers setup and hosting for life. No recurring "SaaS tax".', icon: 'tabler:pig-money' },
    ]}
  />
</Layout>
INNER

# 4. Update Announcement
cat << 'INNER' > src/components/widgets/Announcement.astro
<div class="dark text-sm bg-black hidden md:flex items-center justify-center overflow-hidden px-3 py-2 relative text-ellipsis whitespace-nowrap">
  <div class="flex items-center gap-2">
    <span>✨ </span><span class="text-white font-medium">Claim your professional <strong>yoursalon.schedule.hair</strong> vanity URL today.</span>
  </div>
  <div class="absolute right-4 top-0 h-full flex items-center"><span class="text-white font-medium">Same-day setup. Just $99</span></div>
</div>
INNER

# 5. Update About Page
cat << 'INNER' > src/pages/about.astro
---
import Hero2 from '~/components/widgets/Hero2.astro';
import Content from '~/components/widgets/Content.astro';
import Layout from '~/layouts/PageLayout.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { lifetimeDeal } from '~/data/pricingData';
const metadata = { title: 'Our Story | Schedule.Hair', ignoreTitleTemplate: true };
---
<Layout metadata={metadata}>
  <Hero2 tagline="The Story" title='Elevating the <span class="text-accent">Salon Experience</span>' subtitle="We built Schedule.Hair to eliminate the administrative headache of the beauty industry. You create the art; we build the tech that fills your chair." video="/images/hero-animation.mp4" />
  <Content items={[{ title: 'Professionalism', description: 'We help stylists stand out in a sea of generic apps.', icon: 'tabler:star' }]} image={{ src: '/images/testimonial-4.webp', alt: 'Salon Artistry' }} />
  <Pricing prices={[lifetimeDeal]} />
</Layout>
INNER

# 6. Update PayPal Fields
sed -i 's/HairTestimonial QR Review Engine/Schedule.Hair Vanity Booking Engine/g' src/components/widgets/Pricing.astro
sed -i 's/HTFP99/SHURL99/g' src/components/widgets/Pricing.astro

# 7. Update Metadata on Pricing page
sed -i 's/review system/booking system/g' src/pages/pricing.astro

# 8. Git Push
git add .
git commit -m "Refactor to Schedule.Hair: Vanity URLs and Boutique Booking App Concept"
git push

echo "SUCCESS: Concept refactored to Schedule.Hair and pushed to Github."
