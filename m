Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141AF42BC35
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 23:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785194562; cv=pass; b=Cg3H7AqnlA+aDHpgkMmqxJqLBQjD2s9/WuNVuxZIMUhkwR+5UG1NoO/H9E/PZxdH6gvFAnjWUh1Eaa2RRlRP7g7gICAII3/1wVMyRZtdrXUvZ5wSBN4UbAGkvzbpkIEuJmJjpuc9V1SbjNhd2w6J4FHXS+D/1NMqJDrgI/XwsPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785194562; c=relaxed/simple;
	bh=x2YfyQuuYptbEm86xUEJU9QONiWzDVBm4tEBFRHih5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtlPrPp6ADC/ET+UEdW4RqvKMOUARzBmAjC0/CHyugvVoO4HIdzCLr+gGsgyVTfUo47LwlUOfv/l2Dfbcdw4+cRanigQNj0BHV+YJEED5BBCLLkANu3R4a8e5Hu9df6nSOMrbHOcVy7lasQT4ieDP+Mc0NKP0pYchvALQ8Fo9gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NEXWFnpr; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NEXWFnpr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2363744a91.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 16:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785194560; cv=none;
        d=google.com; s=arc-20260327;
        b=euOYsMIkkVKJ/hksN18Td3nUij0bMh2uzKk4ZR5z0JTin18zdqOisd3fGEV8td9di7
         uSSCWiIOxbEaDlMg1iPIq23+D7ARqAfPdwsExnykzJKbVqEGXv1PztKnZ1LXL9zUtR4m
         GpS/piwOeNpYFpP/LenTiru+bLdKhbkNf3/ZBvckttZ6ZBncMSPRuL2ol34kwYfAC3l5
         oG4Jsw0N8RQpx+VEoEaFu5+DJOwqneVkNhqcD7g5IFfWq1mE+v/p63/Cjyt6s7iYfbZr
         7kazGaDFK2tZcxQqt8ixOkoJQ1eIi7mW4fIdIIg5P+ewdq9DEnaTSRoDMX8HVxSPNh1/
         DQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aH9fxD7OeNQpvbALLCFcfoa0nXkldfT8Qxn7YBj/IBU=;
        fh=ByQFHvKth7MKzF4agnFeGFyCgTjwVHX21E7SPfw+0/U=;
        b=mzaJFDkAdq8eKgLRoRPHEykcqgFcGJSYWwQ7iccvl7/6o55k1JNQUmhdxV1BD433Ab
         Uc6q8dstv5XFSZHSoFdRDn0mVbxGtm05fkkXLjV99IXppRN7S8qWarsJjIwP8PGilFoS
         ptrQ8FBvVzApVzKUextSnO+JQLqideOOWwbS/+y2GsQ2QdHf+2FDzj4kN8q8TCml7psK
         JBp/KUUJ5SQpZfyf+l6DinJOsN9tCd7Eu3f1oHPEfrihKkjGyIWkZm5ZgjBcZdta23Zv
         T6XFyfhFW7rCKeu12+a+frzARfWBl2T51p3A/EAMknyTRZ8sIvZsyjIPunvvvMFt0v0o
         uDEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785194560; x=1785799360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aH9fxD7OeNQpvbALLCFcfoa0nXkldfT8Qxn7YBj/IBU=;
        b=NEXWFnprkB3n+HTEybyyO043edD2Ldzqzz/FKPFolA/66oNACtuIEg/Y2OnUTBEx0Q
         37z68PeLTdCP1YnF1DukeMeF7F23ysGiB3gCo2F0SldGOCpcGh0TCSrT/IbuJQriNSU2
         ypB5HBtPcfzdFJMkNW03+8LIIPh5mqXaBxIJ7FOJkGUN2Bva6Ccm9t1GMdOWvq4TwDVl
         6CetUp4DdGXd8mbSIvIJjUTE88iXgB2cTozgZOozWo47YyzKzTxv3Sg1OVEFMOQ2w5zQ
         9LtoijvBiJA8mExVG8dzY1qwBPUlGZWSHcZd6A6aQzcR26nXgIY4hzEdV1sgcp+YNLGe
         CKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785194560; x=1785799360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aH9fxD7OeNQpvbALLCFcfoa0nXkldfT8Qxn7YBj/IBU=;
        b=QERVQqRtyocuIUfmpwraYt1R5554qO4b8ie2QccYWA3gyfFKsJqwry4YWpx7hB5vwo
         Iw5/P3jNHpQnr32dr+cuK/4mUKzyIC8W10YFfVqoZdMyI3j3l7jn7K6bt1N68XoVEszO
         T75VqGXh2NUl6+d3aidmdE+kNND7+R++1k3veObkvMb7kPUlJWFxfBGyssdj6EnsrgAK
         0DWu/uljFREdavibVAHS/PeZwFx7GbRghfkLM9/53wExdCuiyLkD8XtoHafBXRNLa90v
         UB3lAAFpzKnVZD3UhzOngd7wQaEkDKZ3Ou0sN9x5pu3SncV4Jcc9YecT8ZJ5BnUSnCqb
         kQJg==
X-Forwarded-Encrypted: i=1; AHgh+RobVqTm8W+AwGYTe7OKci+YsatcmJqf1ZCEBBTdIbidQ+XDR+TKFY1qoTXZcBXKEWxppZ/yY1ztVNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLaiHpmkeDhNm5s0yS67FJAJGq3YTy3oRu19LL8KybKajAxA7h
	m340ZgSuXntJ1IQwMgrM8mHad4wtVE6Q48brk1c4Z+cc8APjXL9MDWy4qTU/TbQ5QmKxMYSJ+D+
	BLMrL6OJkf/g7V8wnIDASzE9nnGvkjIbK0xmJeS1r
X-Gm-Gg: AR+sD12NSnTxU5LFRu+hq6jZHo15vsqXGGq5L7iDy9IitwOut/ZDK5V7RH7AZs2pIsP
	w6ojKz8rLUre66zZprbOuyFL6xmxhUmuxCyMAmfYvu6QR2L4q5TB9orJFiJWCZaY45/JLBlL37G
	fy4KynM8qDOAbzW94sfLdV9lqKkSy1l2l/5bJhWfU9OwjMUrciboqfiE/PkNryZP3xi0bTdqJjD
	Hpfpy00E+RMsJcLg3BXKK/ukf9LSd4y2AYxwL0pdPrKJ+uT9seUdx1QeqFDsA==
X-Received: by 2002:a17:90b:2487:b0:38e:5c6:4db9 with SMTP id
 98e67ed59e1d1-38f6a030477mr10389a91.11.1785194559678; Mon, 27 Jul 2026
 16:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-10-dmatlack@google.com> <20260727230740.GA1273350@bhelgaas>
In-Reply-To: <20260727230740.GA1273350@bhelgaas>
From: David Matlack <dmatlack@google.com>
Date: Mon, 27 Jul 2026 16:22:12 -0700
X-Gm-Features: AUfX_myIRjJ65ll44x1imgmZse5x82nFT62Po-YqpjuwILzl8FbHo5wgsdHMnzc
Message-ID: <CALzav=dHdtHPKJVbtnc1BwzccKuGSPxKH9Gvpv1ZVw4z2-0txg@mail.gmail.com>
Subject: Re: [PATCH v7 09/12] PCI: liveupdate: Inherit ARI Forwarding Enable
 on preserved bridges
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 4:07=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Jul 10, 2026 at 09:26:12PM +0000, David Matlack wrote:
> > Inherit the ARI Forwarding Enable on preserved bridges and update
> > pci_dev->ari_enabled accordingly during a Live Update. This ensures tha=
t
> > the preserved devices on the bridge's secondary bus can be identified
> > with the same expanded 8-bit function number after a Live Update.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  drivers/pci/liveupdate.c | 18 ++++++++++++++++++
> >  drivers/pci/liveupdate.h |  6 ++++++
> >  drivers/pci/pci.c        |  8 +++++++-
> >  3 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index a95bfe5eff77..74a11e520f0d 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> > @@ -128,6 +128,10 @@
> >   *    way after Live Update and ensures that IOMMU groups do not chang=
e. Note
> >   *    that a device will use its inherited ACS flags for the lifetime =
of its
> >   *    struct pci_dev (i.e. even after pci_liveupdate_finish()).
> > + *
> > + *  * The PCI core inherits ARI Forwarding Enable on all bridges with =
downstream
> > + *    preserved devices to ensure that all preserved devices on the br=
idge's
> > + *    secondary bus are addressable after the Live Update.
> >   */
> >
> >  #define pr_fmt(fmt) "PCI: " KBUILD_BASENAME ": " fmt
> > @@ -816,6 +820,20 @@ int pci_liveupdate_enable_acs(struct pci_dev *dev)
> >       return 0;
> >  }
> >
> > +int pci_liveupdate_configure_ari(struct pci_dev *dev)
> > +{
> > +     u16 val;
> > +
> > +     guard(rwsem_read)(&pci_liveupdate.rwsem);
> > +
> > +     if (!dev->liveupdate.incoming)
> > +             return -EINVAL;
> > +
> > +     pcie_capability_read_word(dev, PCI_EXP_DEVCTL2, &val);
> > +     dev->ari_enabled =3D !!(val & PCI_EXP_DEVCTL2_ARI);
> > +     return 0;
> > +}
>
> I'm guessing we're going to see a lot of this pattern, so it will
> eventually become familiar, but it's not familiar yet ;)  This doesn't
> "configure" anything (I do understand that avoiding configuration in
> the new kernel is really the main point of liveupdate).
>
> Maybe a comment is the solution.  Or maybe a rename to
> "pci_liveupdate_ari_preserved" or something?  That would have to
> reverse the sense of return values, but I think something like this in
> the callers would read better:
>
>   if (pci_liveupdate_ari_preserved(dev))
>     return;
>
> or maybe:
>
>   if (pci_liveupdate_preserve_ari(dev))
>     return;

I do think a better naming and return value convention is needed.

Perhaps "adopt" or "inherit" as the verb? i.e. "adopt/inherit the
state of the device established by the previous kernel"

if (pci_liveupdate_adopt_ari(dev))
  return;

or

if (pci_liveupdate_inherit_ari(dev))
  return?

>
> >  /**
> >   * pci_liveupdate_is_incoming() - Check if a device is incoming-preser=
ved
> >   * @dev: The PCI device to check
> > diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
> > index 4e8a01bcb4bb..6f21ec50927b 100644
> > --- a/drivers/pci/liveupdate.h
> > +++ b/drivers/pci/liveupdate.h
> > @@ -18,6 +18,7 @@ bool pci_liveupdate_scan_bridge_begin(struct pci_bus =
*bus, struct pci_dev *dev,
> >  void pci_liveupdate_scan_bridge_end(struct pci_dev *dev, int pass);
> >  void pci_liveupdate_init_acs(struct pci_dev *dev);
> >  int pci_liveupdate_enable_acs(struct pci_dev *dev);
> > +int pci_liveupdate_configure_ari(struct pci_dev *dev);
> >  #else
> >  static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
> >  {
> > @@ -46,6 +47,11 @@ static inline int pci_liveupdate_enable_acs(struct p=
ci_dev *dev)
> >  {
> >       return -EINVAL;
> >  }
> > +
> > +static inline int pci_liveupdate_configure_ari(struct pci_dev *dev)
> > +{
> > +     return -EINVAL;
> > +}
> >  #endif
> >
> >  #endif /* DRIVERS_PCI_LIVEUPDATE_H */
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 739ecaab2e76..e0c133b66a35 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -3528,7 +3528,7 @@ void pci_configure_ari(struct pci_dev *dev)
> >       u32 cap;
> >       struct pci_dev *bridge;
> >
> > -     if (pcie_ari_disabled || !pci_is_pcie(dev) || dev->devfn)
> > +     if (!pci_is_pcie(dev) || dev->devfn)
> >               return;
> >
> >       bridge =3D dev->bus->self;
> > @@ -3539,6 +3539,12 @@ void pci_configure_ari(struct pci_dev *dev)
> >       if (!(cap & PCI_EXP_DEVCAP2_ARI))
> >               return;
> >
> > +     if (!pci_liveupdate_configure_ari(bridge))
> > +             return;
> > +
> > +     if (pcie_ari_disabled)
> > +             return;
> > +
> >       if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ARI)) {
> >               pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
> >                                        PCI_EXP_DEVCTL2_ARI);
> > --
> > 2.55.0.795.g602f6c329a-goog
> >
