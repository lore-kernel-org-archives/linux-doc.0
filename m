Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16654AD27
	for <linux-doc@vger.kernel.org>; Sun, 23 Mar 2025 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742756540; cv=none; b=peEAwCmfCvKT0rWfFtOdXfVgcWSWaZ6e91fwb9asDdcFUKozeYlte1vCnXZhEOAT6q7dHxcH4tuv2PqthgwmDhC8Q3YhvZjQXXLi2rLXGm4RVluGcrOOXpYAld5uIrt/IbxDW+uTjlj3tYYw2RjwL/e15mStCA0F+GEdYpFWu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742756540; c=relaxed/simple;
	bh=tDa9vpNu/b8nQeMcsn/2LF0GMloBDuo9YzrQSkldP8Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u/QsUpKu+MS4dBAkwZSh8ELsiBimqTv7w2Ykti70uSnJ+cFBgpd0KP9BLQeNODSb/h/t8J8E7hALkyaDB0BiL22pcJeR/iafye8AF91pry4z2AZ8B8l61XU8mOBs9UqATngNbItpNpsA2eMOE763hVKQOLT4LJGncRjgQliHEkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rkagMSux; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rkagMSux"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6af1e264so10318267a91.3
        for <linux-doc@vger.kernel.org>; Sun, 23 Mar 2025 12:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742756538; x=1743361338; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RuNRgEM1/VSSZOP8AP4UeKswwiKQNT+cWOtWKPuUrmU=;
        b=rkagMSuxRsQn7+0LkxmjtFs7DEOGvu02Wd+ek3J8WMS8dyuLVar0abAhUPSUClOWpF
         dhX7YdcsKnmB+HUlglrob2dqx9EDR6cNTrKD/M7Hh7DTF9WhO3J27mVtL6lNMsYsqcju
         zC1wVa/EiEgCQ7Ly6/A2DWCzvMEPqsaLv5sBY9t05cEN/gxxKiFw3oQtwZs6c5r+00g0
         qhI5AFaLehU8jEws4OeWrXW43Y6JFVQ/z33cjRZgWdwTB0+S5i8xZ9eYIhOz7saPWii4
         Jti+aUWiVmQv2GrrM7pJHdAmV3oobz3h1qyLyDqnWzuLyjoj48HGHEc2qZ+6FYboEmNQ
         wM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742756538; x=1743361338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuNRgEM1/VSSZOP8AP4UeKswwiKQNT+cWOtWKPuUrmU=;
        b=KjPZnzsnIXb8PpwzAqonlkvQw8kveSFVzIqzcu1i9WwnL5HX3HcIDAjQY0CCHT4k2a
         tnCjLXtHKL8OOMoK4QDAoybVQ6LB0yU7VgOlKIVT5CquQwSoOLAxDsXPaI86skegUnTo
         PSb+CBJHCbSfVbypzsOAVkeQHYcd3kPTwwnzwX8xmjTPEDVPPDMtnkfBLhCOC5S3FRHS
         hF33jVjDbC6hueSAAEtQEvmtkfenFREWI6kAulxvvbKHlPaHTvo//uxFr+TZ5qSxDfWm
         YWUyIIZfkXSsgq3gaed7Hv/SPRGXIi8zkCpThP5MVa0fx4MhPlq5BkJC8wgs1/bzq/Wl
         pWlg==
X-Forwarded-Encrypted: i=1; AJvYcCWxjigQGyr8tNJFiLtyvX0vcUQo1j8k4LGAy/iAOvRGixhr/02OTM+d7TZCn65909oxKu4/fS0pekU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPi0AKoXfuFmkUeL7FEbYddl3B7pR5pIioDKt1LWUodl0poF8
	Mci+pDEkxxZey2vPSRXIlaklU1M5Idt6IRMNSBUa4ir5NAtHgPPTUfKC9VVacLR5/qJtT2IIJKq
	rJmG8rHa6JeT5G+wa7A==
X-Google-Smtp-Source: AGHT+IHqKpRChgtgDh49YPKj5euGR0CZLSvO9CAU4Y43PCYdmIBq9tlLyCyLELbaKPjbaTiHWY1Fon3WmY7MX6oI
X-Received: from pjbok3.prod.google.com ([2002:a17:90b:1d43:b0:301:1bf5:2f07])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d008:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-3030ff08de9mr20652493a91.33.1742756538347;
 Sun, 23 Mar 2025 12:02:18 -0700 (PDT)
Date: Sun, 23 Mar 2025 12:02:04 -0700
In-Reply-To: <20250321133447.GA251739@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250321133447.GA251739@nvidia.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250323190204.742672-1-changyuanl@google.com>
Subject: Re: [PATCH v5 07/16] kexec: add Kexec HandOver (KHO) generation helpers
From: Changyuan Lyu <changyuanl@google.com>
To: jgg@nvidia.com
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, changyuanl@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org, dwmw2@infradead.org, 
	ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, 
	kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, 
	robh+dt@kernel.org, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason, thanks for reviewing the patchset!

On Fri, Mar 21, 2025 at 10:34:47 -0300, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Wed, Mar 19, 2025 at 06:55:42PM -0700, Changyuan Lyu wrote:
> > From: Alexander Graf <graf@amazon.com>
> >
> > Add the core infrastructure to generate Kexec HandOver metadata. Kexec
> > HandOver is a mechanism that allows Linux to preserve state - arbitrary
> > properties as well as memory locations - across kexec.
> >
> > It does so using 2 concepts:
> >
> >   1) State Tree - Every KHO kexec carries a state tree that describes the
> >      state of the system. The state tree is represented as hash-tables.
> >      Device drivers can add/remove their data into/from the state tree at
> >      system runtime. On kexec, the tree is converted to FDT (flattened
> >      device tree).
>
> Why are we changing this? I much prefered the idea of having recursive
> FDTs than this notion copying eveything into tables then out into FDT?
> Now that we have the preserved pages mechanism there is a pretty
> direct path to doing recursive FDT.

We are not copying data into the hashtables, instead the hashtables only
record the address and size of the data to be serialized into FDT.
The idea is similar to recording preserved folios in xarray
and then serialize it to linked pages.

> I feel like this patch is premature, it should come later in the
> project along with a stronger justification for this approach.
>
> IHMO keep things simple for this series, just the very basics.

The main purpose of using hashtables is to enable KHO users to save
data to KHO at any time, not just at the time of activate/finalize KHO
through sysfs/debugfs. For example, FDBox can save the data into KHO
tree once a new fd is saved to KHO. Also, using hashtables allows KHO
users to add data to KHO concurrently, while with notifiers, KHO users'
callbacks are executed serially.

Regarding the suggestion of recursive FDT, I feel like it is already
doable with this patchset, or even with Mike's V4 patch. A KHO user can
just allocates a buffer, serialize all its states to the buffer using
libfdt (or even using other binary formats), save the address of the
buffer to KHO's tree, and finally register the buffer's underlying
pages/folios with kho_preserve_folio().

> > +int register_kho_notifier(struct notifier_block *nb)
> > +{
> > +	return blocking_notifier_chain_register(&kho_out.chain_head, nb);
> > +}
> > +EXPORT_SYMBOL_GPL(register_kho_notifier);
>
> And another different set of notifiers? :(

I changed the semantics of the notifiers. In Mike's V4, the KHO notifier
is to pass the fdt pointer to KHO users to push data into the blob. In
this patchset, it notifies KHO users about the last chance for saving
data to KHO.

It is not necessary for every KHO user to register a
notifier, as they can use the helper functions to save data to KHO tree
anytime (but before the KHO tree is converted and frozen). For example,
FDBox would not need a notifier if it saves data to KHO tree immediately
once an FD is registered to it.

However, some KHO users may still want to add data just before kexec,
so I kept the notifiers and allow KHO users to get notified when the
state tree hashtables are about to be frozen and converted to FDT.

> > +static int kho_finalize(void)
> > +{
> > +	int err = 0;
> > +	void *fdt;
> > +
> > +	fdt = kvmalloc(kho_out.fdt_max, GFP_KERNEL);
> > +	if (!fdt)
> > +		return -ENOMEM;
>
> We go to all the trouble of keeping track of stuff in dynamic hashes
> but still can't automatically size the fdt and keep the dumb uapi to
> have the user say? :( :(

The reason of keeping fdt_max in the this patchset is to simplify the
support of kexec_file_load().

We want to be able to do kexec_file_load()
first and then do KHO activation/finalization to move kexec_file_load()
out of the blackout window. At the time of kexec_file_load(), we need to
pass the KHO FDT address to the new kernel's setup data (x86) or
devicetree (arm), but KHO FDT is not generated yet. The simple solution
used in this patchset is to reserve a ksegment of size fdt_max and pass
the address of that ksegment to the new kernel. The final FDT is copied
to that ksegment in kernel_kexec().
The extra benefit of this solution is the reserved ksegment is
physically contiguous.

To completely remove fdt_max, I am considering the idea in [1]. At the
time of kexec_file_load(), we pass the address of an anchor page to
the new kernel, and the anchor page will later be fulfilled with the
physical addresses of the pages containing the FDT blob. Multiple
anchor pages can be linked together. The FDT blob pages can be physically
noncontiguous.

[1] https://lore.kernel.org/all/CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com/

Best,
Changyuan
