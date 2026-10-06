Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7B2E737E
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 06:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267214; cv=pass; b=oE7JsMlqiF73xMLXmHy7TOn+d18+3E9bUA7g48bDSSlAjMyeS7DDALgemsIKi3LZ2og7OqUV5OIZ6Q1NijgUY+Ix3atGjOuR6Xgr//RKDOCuLj5wqP+52CimoT9zIMunOcaxhiYQwxMaTwEBc2txGEG7kpt7NKvkdAyvi7T1ReU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267214; c=relaxed/simple;
	bh=tUmcbY2LGjhuvkOD8Wnif+BGx0U4Ife6GiX/aWsmJ5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAhKNx4ZKG3GCl4I3eb7mUnOFDL0wmDjHwBGr/LUirThMZGjdztngqgdm181xCgvuU+VBqTk9VDvFLe0HWap1x5AunqpUodgjwsHrf5q6i3uReDI1TrIu+8t0UwvMLvVSBz4VHLmliYOFcuu6cBOEXo/t/MMB3TUtpDSeID/35s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9p66PZp; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9p66PZp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso22022085e9.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 23:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791267210; cv=none;
        d=google.com; s=arc-20260327;
        b=Jw2on7yBJk8vJcMA9YcSWoBEMNyB7zJdPgVf7rgdd5CWvy71n3v45S/1dHX8t5Gkt3
         zAQEJz/KJ+FPCmn8nULNTlYuGw4boDMxv2ufmuFEkF9W0G73hMhcnKGEqMbR+VoXnOxn
         WgnMotGuOtn8qcTGGx0Gy6IzyBMQ3/Xl+vwc9WOOCHgpmFzPofuruFkt0LYy4VFsKvu8
         ZIE/WzrxXPV9EOHvypOy0RnQzKOIBAWOji2JihOiOpoH8oT4ppGiYSMAC6yM6h6OPpWG
         V1D87EP4Bq8TVeX0mEeT5Re0vLkwzZMxNsq2QQ8A727NqLv8ztZLIt2mCoq3rJTUdirf
         x0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDVYF6o0gmAoJIiHellWQW2xAg271OU0hbLK0g0y5g8=;
        fh=4TOQdEickUGpy1I837SM4FUR1gh+V0Ot/uebzH9tYlY=;
        b=CI0bQUpv1jS2hgQhlRhmySBEwAmBGyLMF8pkDZp+Zp5MR3/wWpL7zNz7VyAa8IRUw8
         Mw76JTj7n/6zYbfOuQFCaVBYijtezGTPESEw69eKb3PRcqNMLu2lXyf2THKNbquj6wAd
         VtAMYriQmqeEeMm5sRNcZnVbbdkt1FtTNDFn2T9fJaAnQO/+GsUgcNgo8+Q+vNHWaVKR
         ESVJ1SxhAmdG+ym5R7zfMrpJqkyp4ZxQtB269juP6ji6fZZik7ZR55bjoypdnAW1aJ7q
         Y5vrANhd3HEBLS7Wv2eZhu+2TF9JZCBdNwUvUTMB7Di2lSn4D9CWrpllE5Fqbikbpefv
         eR0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267210; x=1791872010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kDVYF6o0gmAoJIiHellWQW2xAg271OU0hbLK0g0y5g8=;
        b=Z9p66PZpB1A8HeBmsoZ+zMO6SwjezS2D3QwwuhHRpD/G+s9y9Rv3/vglxRNuQEDRS0
         rE0Clk5YP0N5QnF0FNoKDaBHMF3zkj/eULH2eY3LrEWtMmt2Q2BLK6Nb/kMapjLeAvpF
         MJJcQRkyVAlJ8298Rdh2Lq5JiR2pTEvbs7KqBUSD1KoJJidzuD1IgI5wpSt2EkdOSljK
         2UNOEEHytJbt7MSY0gM8KMcVF5fLGdyyOacLxbS4vLcehwxCUwZQYNuv4IsxWv72W58v
         1OiFM9XvBxhO3flD7TEIXPvmgCD41ZYqFSfl6k2HjtQNTLMi3tXIgZOc3GIlwMPNlzv+
         gFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267210; x=1791872010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDVYF6o0gmAoJIiHellWQW2xAg271OU0hbLK0g0y5g8=;
        b=YeJBow3Ac6uRTzS4I4mRuqjc6lr91NgsBsN8jC0uZtCzvcnBlcNHp31KiCC2h0wXHQ
         87Nl6vn2VXFXUHm8QAc3Tkr5KeggegC+qXzmllu8RxHFeOWdWgpWPa9S6yPRn1olrGFv
         rP3R2Okzbr2JkSIlTdicQtGQxQjOjhrJqpu8SJ0YjITXuEegOT7V917fDqvKqtNJCg/q
         kOhdgVXEeGg+tCo4VIwEKrvnksNSGpY9Ef9mBbOHpF/6QiV8m0lkSgm+vehqF/VaX0CP
         G8eEHpVbAtNPylEFyMPe4lgSHzW7EAsfnA5sSEKAiYLzKIqX8apn01M2AxCDMP8IKF4y
         Vb6A==
X-Forwarded-Encrypted: i=1; AKwUvBwwS57BzvfH+2ezC0/uq+9RfsAvdB3G4xCaLwyHDsB1XCPBv2ZlhX05nw14kNJH44SngoQJh2GNFig=@vger.kernel.org
X-Gm-Message-State: AFuF++nyadumiiNNEdfUYknYeakI2NejwMHUPG3K43FRB76HehvTOJJa
	kH+ndLilglKrgN0Zs/1MOmhj1Sp3R4l1CyVgcLIyNrBjiqtBRxJsDorqQTp7g+iu4Q03OFOulad
	Su/53SRqJs88mtNAWwvCJrUIsd9R6C5g=
X-Gm-Gg: AYBFou1kTTbsLEce/I4FygbHwKOI4yHyuXnDTfH9+HcThGVppU+Iv2Uz43bejvbSesD
	GBkCPk/HOA8Q/aZkntQEL8I8r1Wo2QBrujKjdrdVkaSpBYx4KVUQdFZxokF6MRFizE5I/X6TDZX
	IrDuVUBdn23+6SG/8sJAZgEWMCMkR/kDVFK8Y5UN/opS3gTVhEHHlgZIOGkpD6GkXfxp4Y9sJ8L
	F0q8ZXOcn0CHi5niqRn+xLh0+GcuMKDOeKJGmuRmHNNBq+fmMM1HED5rmfoPruKdQdolzEH1f/z
	eNGanF43RtZaHM7V4ygwFTKHn/y+haRr8WsQWubWBwiIBQtuMGqgzk1sHQL/V0q6XNtA
X-Received: by 2002:a05:600c:3ba0:b0:4a0:236c:8601 with SMTP id
 5b1f17b1804b1-4a17b4b6c82mr7463485e9.0.1791267208960; Mon, 05 Oct 2026
 23:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
 <20261005171529.1378809-3-kunwu.chan@gmail.com> <bedc399a-151c-42e5-b33e-d78221702fa5@efficios.com>
In-Reply-To: <bedc399a-151c-42e5-b33e-d78221702fa5@efficios.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 6 Oct 2026 14:13:15 +0800
X-Gm-Features: AclHuK_ppGKVx44qdjA5Rxwn4Zvoh7x1d62IrHMgogUx403i6VttKqXBF_sphJI
Message-ID: <CAN_Opa-ngHYkvssm1dqdUUsOoECES5eGtCTyfKJ0Qsyx-sB5KQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 02/15] hazptr: use Bloom filter for shared scan waiters
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, lianux.mm@gmail.com, stern@rowland.harvard.edu, 
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org, 
	boqun@kernel.org, npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 1:51=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-10-05 13:15, Kunwu Chan wrote:
> > Replace the per-waiter exact-match scan with a shared Bloom filter
> > built during the second drain pass: each observed non-wildcard
> > address sets three bits, so a waiter whose address hashes to an
> > unset bit can be completed without another slot walk.
> >
> > A Bloom filter has no false negatives, so an address absent from
> > the final drain scan cannot be held by an observed slot; false
> > positives only delay completion to a later scan cycle.
> >
> > The filter uses a one-page bitmap with three multiply-shift hash
> > functions.  It lives in the hazptr_scan_state and is only touched
> > by the scan kthread, so waiter state remains on the caller's stack
> > and no dynamic allocation is needed.
> >
> > Suggested-by: Boqun Feng <boqun@kernel.org>
>
> I actually suggested that to Boqun in the first place. Feel
> free to add my suggested-by tag as well. :)
>

Thanks, Mathieu. I wasn't aware that you originally suggested the Bloom
filter idea to Boqun. I'll add your Suggested-by tag.

> Did you run your Bloom filter in a test program on the side to
> see how it behaves with pointers, and confirm that the false
> positive rate is not too high due to hashing algorithm/constants
> concerns ?
>

I haven't run a standalone Bloom filter test yet. I'll test the actual
hash functions
and constants from the patch with pointer-like and aligned address
distributions,
and measure the false-positive rate for representative numbers of
observed addresses.

The in-kernel tests currently pass, including hazptr.sh and rcuscale,
but I agree that
these don't directly characterize the Bloom filter's false-positive rate.
I'll add the standalone test results to the next version.

Thanks,
Kunwu

> Thanks!
>
> Mathieu
>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >   kernel/hazptr.c | 93 +++++++++++++++++++++++++++++++++++++++++++-----=
-
> >   1 file changed, 83 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/hazptr.c b/kernel/hazptr.c
> > index 9e274a691af5..900ba35de2cb 100644
> > --- a/kernel/hazptr.c
> > +++ b/kernel/hazptr.c
> > @@ -7,6 +7,7 @@
> >    */
> >
> >   #include <linux/hazptr.h>
> > +#include <linux/bitops.h>
> >   #include <linux/percpu.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/mutex.h>
> > @@ -16,6 +17,7 @@
> >   #include <linux/kthread.h>
> >   #include <linux/swait.h>
> >   #include <linux/sched.h>
> > +#include <linux/bitmap.h>
> >
> >   /*
> >    * The current hazard pointer wildcard. Flips between 1UL and 2UL to =
guarantee
> > @@ -213,6 +215,55 @@ void hazptr_scan_period(void *addr, void *scan_wil=
dcard)
> >       }
> >   }
> >
> > +/* Number of hash functions for the Bloom filter. */
> > +#define HAZPTR_BLOOM_HASHES 3
> > +
> > +/* Number of bits in the Bloom filter bitmap: one page. */
> > +#define HAZPTR_BLOOM_NBITS (PAGE_SIZE * 8)
> > +
> > +struct hazptr_bloom {
> > +     unsigned long map[PAGE_SIZE / sizeof(unsigned long)];
> > +};
> > +
> > +/*
> > + * Multiply @addr by a per-hash odd constant and use the high bits
> > + * as the Bloom filter index.
> > + */
> > +static unsigned long hazptr_bloom_hash(void *addr, unsigned int i)
> > +{
> > +     static const u64 mult[HAZPTR_BLOOM_HASHES] =3D {
> > +             0x9E3779B97F4A7C15ULL,
> > +             0xC2B2AE3D27D4EB4FULL,
> > +             0x165667B19E3779F9ULL,
> > +     };
> > +     u64 hash =3D (u64)(unsigned long)addr * mult[i];
> > +
> > +     return hash >> (64 - ilog2(HAZPTR_BLOOM_NBITS));
> > +}
> > +
> > +static void hazptr_bloom_reset(struct hazptr_bloom *bloom)
> > +{
> > +     bitmap_zero(bloom->map, HAZPTR_BLOOM_NBITS);
> > +}
> > +
> > +static void hazptr_bloom_add(struct hazptr_bloom *bloom, void *addr)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < HAZPTR_BLOOM_HASHES; i++)
> > +             __set_bit(hazptr_bloom_hash(addr, i), bloom->map);
> > +}
> > +
> > +static bool hazptr_bloom_contains(const struct hazptr_bloom *bloom, vo=
id *addr)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < HAZPTR_BLOOM_HASHES; i++)
> > +             if (!test_bit(hazptr_bloom_hash(addr, i), bloom->map))
> > +                     return false;
> > +     return true;
> > +}
> > +
> >   struct hazptr_waiter {
> >       struct list_head node;
> >       void *addr;
> > @@ -226,17 +277,26 @@ struct hazptr_scan_state {
> >       struct mutex lock;
> >       struct list_head pending;
> >       struct list_head scanning;      /* kthread only */
> > +     struct hazptr_bloom bloom;      /* kthread only */
> >   };
> >   static struct hazptr_scan_state hazptr_scan;
> >
> >   /*
> > - * Check per-CPU slots before overflow-list slots to match the
> > - * acquisition ordering of promoted slots.
> > + * Walk all slots and return true if @watch is present.  If @bloom
> > + * is non-NULL, record observed non-wildcard addresses in it.
> > + *
> > + * Per-CPU slots are examined before overflow-list slots on each CPU
> > + * to preserve the acquisition ordering required by the promote path:
> > + * synchronize must observe the per-CPU slot release before the
> > + * overflow-list entry can be missed.
> >    */
> > -static bool hazptr_value_present(void *val)
> > +static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom)
> >   {
> >       int cpu;
> >
> > +     if (bloom)
> > +             hazptr_bloom_reset(bloom);
> > +
> >       for_each_possible_cpu(cpu) {
> >               struct hazptr_percpu_slots *percpu_slots =3D per_cpu_ptr(=
&hazptr_percpu_slots, cpu);
> >               struct hazptr_overflow_list_flip *overflow_list_flip =3D =
per_cpu_ptr(&percpu_overflow_list_flip, cpu);
> > @@ -244,10 +304,14 @@ static bool hazptr_value_present(void *val)
> >
> >               for (idx =3D 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
> >                       struct hazptr_slot_item *item =3D &percpu_slots->=
items[idx];
> > +                     void *v;
> >
> >                       /* Pairs with smp_store_release in hazptr_release=
(). */
> > -                     if (smp_load_acquire(&item->slot.addr) =3D=3D val=
)
> > +                     v =3D smp_load_acquire(&item->slot.addr);
> > +                     if (v =3D=3D watch)
> >                               return true;
> > +                     if (bloom && v && !is_wildcard(v))
> > +                             hazptr_bloom_add(bloom, v);
> >               }
> >               for (int i =3D 0; i < 2; i++) {
> >                       struct hazptr_overflow_list *list =3D &overflow_l=
ist_flip->array[i];
> > @@ -256,11 +320,16 @@ static bool hazptr_value_present(void *val)
> >
> >                       raw_spin_lock_irqsave(&list->lock, flags);
> >                       hlist_for_each_entry(b, &list->head, overflow_nod=
e) {
> > +                             void *v;
> > +
> >                               /* Pairs with smp_store_release in hazptr=
_release(). */
> > -                             if (smp_load_acquire(&b->slot.addr) =3D=
=3D val) {
> > +                             v =3D smp_load_acquire(&b->slot.addr);
> > +                             if (v =3D=3D watch) {
> >                                       raw_spin_unlock_irqrestore(&list-=
>lock, flags);
> >                                       return true;
> >                               }
> > +                             if (bloom && v && !is_wildcard(v))
> > +                                     hazptr_bloom_add(bloom, v);
> >                       }
> >                       raw_spin_unlock_irqrestore(&list->lock, flags);
> >               }
> > @@ -276,7 +345,7 @@ static bool hazptr_value_present(void *val)
> >    */
> >   static void hazptr_drain_wildcard(void *wc)
> >   {
> > -     while (hazptr_value_present(wc))
> > +     while (hazptr_scan_walk(wc, NULL))
> >               cond_resched();
> >   }
> >
> > @@ -309,12 +378,16 @@ static void hazptr_scan_do_cycle(void)
> >       WRITE_ONCE(hazptr_wildcard, scan_wildcard);
> >       old_wildcard =3D flip_wildcard(scan_wildcard);
> >
> > -     /* Pass 2: drain the old wildcard. */
> > -     hazptr_drain_wildcard(old_wildcard);
> > +     /*
> > +      * Pass 2: drain the old wildcard while collecting observed
> > +      * addresses into the Bloom filter.
> > +      */
> > +     while (hazptr_scan_walk(old_wildcard, &hazptr_scan.bloom))
> > +             cond_resched();
> >
> > -     /* Complete waiters whose address is no longer held by any slot. =
*/
> > +     /* Complete waiters whose address is not in the filter. */
> >       list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
> > -             if (!hazptr_value_present(w->addr))
> > +             if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr))
> >                       list_move(&w->node, &done);
> >       }
> >
>
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
