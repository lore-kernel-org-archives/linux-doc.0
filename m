Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854523C3C15
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782758965; cv=pass; b=i9dRzSNdAJtxBjPeJddnXRiSQrBQXotilVPPl6QnejSA5cDimGrvl4Y1leHmZbcnJ3qOprltUkKz8bZrIiC8HruDB7ePXd0JHthmvmHnTxP4dRgIAIafIRZdHtwbrd+P6f3cPn4r9ZA5TFHDE0g57/n+IuI8hyPLTUZQ+ewnGPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782758965; c=relaxed/simple;
	bh=gjkwCD9KgKGHy8EtAtCOPoXjV5xDJqzXABt3GGvQ5js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pwj7hNtDtF8n3iJ12lGNG/XjP8uVyiN9m43khdihM3Tcmr+A2dqDWv7Ly7Z/+HTXzm7GdzFrEY0ym/FGCZoBt6EgW4TTC63r6qA3WW9HkUY1f/736TU1qNFQJkUca+5w2wdFnT6+Hb66i9SG5Kwu0WeGRZbZkJp7fkQ4hXAkki4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SUz25hiz; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SUz25hiz"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137335bc3caso7505796c88.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782758963; cv=none;
        d=google.com; s=arc-20260327;
        b=p0NlKDhjiA3+oCdkpCmjsLy+Q5FKw7cBOYYQJ1OTJj3VdlFOOXAx4/qxZ33o8s0gmn
         ed+SNxbVDHPBzxHgZzncSkieHJ9xnxtI/6K5flR1copOS3dMDHKB6fs+sxWBcGL/VsKP
         6zxuZJ3AGG3YNBrOaaXc+SpSGZwH28dLkRkSSKQRhlob+osFPea/1Bf8LD+VLofPHM8r
         SfuKB2h2V1II+dZFOyGW1axP8YO+EFSkewNuyTamGkntEymmg5rDD/7GejYRilmLMWh3
         MC8IBZCWRSvoBQg6pzW9rSptodgUNyMqwoMCTumEq5Azub1yvx6Mw8Fhny73RaLlH0xa
         l/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VpmUvFbjkT4TIDiuBxTmd8SHESx8y5cMZtvBxkjxfFU=;
        fh=pr9xGB/MYP5W4jLU9M6pHC7wZ+3lU2Xp50NIF3hffb0=;
        b=bSzyIBceaEhWIUI5nCdUdJgmYWIWK2zOq/KdtvvXKy3eoibKX1amC6/JhP5UsLomw8
         e7QWQ/3/EuLFw0v4wHRUsgLtd7wrWOoa20hrYZttit6M1PWdig4W6ZxudreV5OSnmwjt
         a+QRGRZe+j6hCwyvplw4zLnQlDhxWitr6m07iO4tWCLaGV4jl8jfV/l33eTbyQ+FMT8J
         6AB1j7aizFHXfzuIWEQ+hcVzZCja/z6ankGd/GjdhiLOgk4fvI6R5NGnLUOe25oWOfqG
         ktgCU8CUaSR0qtfAjgsIIHtn26T4EEvET2Xt0syFZPTlPyhqpuRLZ9HkmjMCrqTRhyHd
         S59A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782758963; x=1783363763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpmUvFbjkT4TIDiuBxTmd8SHESx8y5cMZtvBxkjxfFU=;
        b=SUz25hiz759chD3xNIzc0sJx+q/299X+xY/QGMSIw9rKs4N49ktSpjxz4qDoOoY44/
         jdhLH6ceBcHNOAIz6o/5OT+cCoCQcLXuT/oX2gXMJHChOhjXrbwar4IKF7G66linW72U
         ro9N6SMeLZPoyuaV02oDeS9eehQLjO3flGqj8wBIo3jx/iO1a2orGYtFvxITu1FgrgiO
         DqS8cUK7YpujZ1QFdqcNedH/vBax7hE77z6ZK7xVMBMSLoQ3rK/xKAEZb+abZEVIlgjZ
         mKmi0hqCt4kzKDNPFIk1IsFUKsEsM9R94C5/dLIpGdtvf16eHwpBCqbckOEhPeT1Pr3J
         01EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782758963; x=1783363763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VpmUvFbjkT4TIDiuBxTmd8SHESx8y5cMZtvBxkjxfFU=;
        b=kQ6a1yGHbDgYIuRqARmIso/xI/anxIUlMKz9G3IIEpux+CPrIG7yeuNq9VlXaS989P
         3igmr0WX7lOPWupAVooUxJP6CL6VKrMmBLXGylU4skQdVd9yp22MgOKLXCvZe2e30ILH
         vrGBe0YoLvvn2hnxj2Y4Y9hjkXDSFjcsRAEJ1xJoqoBcY21Ghpksz1aZ3c6WQySYZMID
         c2yP2iNdu6KZyHfqjpuvikORKLe/mUozpXOdUjVK3uqWh0y1NO6I/e68bvVom8PDUU+8
         TK2vq7NG7b3rpn1Ny64MbNg5SkDmtGAgkegGRWj5K8lsHUxdfczrpsRKaeu/ZNjp0jKr
         vsHg==
X-Forwarded-Encrypted: i=1; AFNElJ8JBzZno0g4gtp47QEig35ttvak8nUoAnTSN/vk6OK4U7N+eJgMY2F3LFZXNOL7g3PJrv/893hC0fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrYS+kSe16auk/usssiZxsaIrsT292h2FuPibd1G7+EolGsZ7H
	z6bONuZ+YyoEupKIJgJNYMZ5z8laSzYBB7usiOUryXP3SZBV2ammTbVJwRpkHODJaxbBWPXJB+h
	SqgJ4X/h2t2iywQMoQjYue6pCvJ+2JrhejPDp/kAV
X-Gm-Gg: AfdE7cnhkyzSOycT4CKPB3R2ibpidxjrkCoM72Q7FyJWwmzeNPZ+sq2FPLkmZDcdArZ
	tI//V6tjCWpdZw7bby81yVkmWmpuZgXOC5Cj8mZCo1EGt01pHutoY0DXe+wKwVLfr6gjQ4FY9IZ
	Cp9ylMqyGjs0gLGQnxzd7Cr9HLXiVxtUd8E70Rqu9MUAARqnYNtd8N9y2DqvB6nsFObn/RpFDLD
	B3R8XGpdflw8wAiqKLGxf/2WJicTu8sRK0gDX1/5VIAL+NgIAQtBqIzvipUMuRM/nc1PaABWInc
	hjDfwpQ=
X-Received: by 2002:a05:7022:6620:b0:136:c443:80e5 with SMTP id
 a92af1059eb24-13b2a13e510mr391503c88.6.1782758962590; Mon, 29 Jun 2026
 11:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522202410.3104264-1-dmatlack@google.com> <20260522202410.3104264-4-dmatlack@google.com>
 <178144432039.1257322.9644414453415904478.b4-review@b4> <ajBgj_aSuzMZG47e@google.com>
 <2vxzechulmcp.fsf@kernel.org>
In-Reply-To: <2vxzechulmcp.fsf@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Mon, 29 Jun 2026 11:48:55 -0700
X-Gm-Features: AVVi8CddGN9A_Ob4R4wlMhPsXSn8oI36PZ00eW8upPHQmIA_C2z2tuBHbPtHPrY
Message-ID: <CALzav=fN8m9+rso7RSLR35bozZpNKv6McOR3jv1-ngxApM1BCg@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 7:35=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> Hi David,
>
> On Mon, Jun 15 2026, David Matlack wrote:
>
> > On 2026-06-14 01:38 PM, Pasha Tatashin wrote:
> >> On Fri, 22 May 2026 20:24:01 +0000, David Matlack <dmatlack@google.com=
> wrote:
> [...]
> >> > +  }
> >> > +
> >> > +  pci_info(dev, "Device was preserved by previous kernel across Liv=
e Update\n");
> >> > +  dev->liveupdate.incoming =3D dev_ser;
> >> > +
> >> > +  /*
> >> > +   * Hold the ref on the incoming FLB until pci_liveupdate_finish()=
 so
> >> > +   * that dev->liveupdate.incoming does not get freed while it is i=
n use.
> >> > +   */
> >>
> >> How would that work? If finish is not called FLB stays around until th=
e
> >> next reboot.
> >
> > True... I think if the PCI core trusts drivers to call
> > pci_liveupdate_finish() then we don't need to hold onto the incoming
> > reference here.
>
> That was my point when I was arguing against refcounts on outgoing FLBs.
> This is very easy to abuse, especially when we are talking about device
> drivers. And this refcounting mechanism makes the FLB no longer
> file-lifecycle-bound, since now it is entirely up to drivers to decide
> the lifecycle of this data.

The PCI core holds a reference to the incoming FLB for as long as it
maintains a pointer to that FLB in struct pci_dev
(dev->liveupdate.incoming). The lifetime of that pointer is aligned
with the lifetime of the file as long as the driver calls
pci_liveupdate_finish() in its file finish() callback.

If there is a bug in the driver that causes it to not call
pci_liveupdate_finish() then the FLB will leak past the file yes. But
the alternative would be to leak a pointer to freed memory in
dev->liveupdate.incoming, which could lead to UAF.

Leaking the FLB seems safer than UAF, which is why I went for the
refcounting approach.

Another approach entirely would be to drop the
dev->liveupdate.incoming and do the xarray lookup everytime instead.

>
> I have been thinking about this a bit more in the last couple days, and
> I wonder if we are doing this right. Here's an idea I have been thinking
> of.
>
> We should make live update a first class citizen in PCI. Instead of
> patching in liveupdate via the liveupdate.incoming field, and letting
> drivers figure out when to use it, we should separate out probe and
> retrieve paths entirely.
>
> Probe and retrieve are fundamentally different operations. While they
> may share some common initialization logic for the _software_ state, how
> they interface with the hardware is completely different. I think mixing
> the two will result in driver code being more spaghetti by having
> liveupdate checks sprayed out all over.

We are only planning on supporting Live Update for VFIO drivers for
the forseeable future. The VFIO work during probe is almost entirely
software state setup. The only hardware logic we need to "if" out in
the vfio-pci driver's probe() is putting the device into a low-power
mode via the runtime power manager. So I don't think we will get any
benefit from this approach, and it would be a lot more intrusive to
both the PCI core driver framework, and VFIO itself, to support this.

> This series doesn't add support for any drivers, but looking at some of
> the code we have downstream, I see this problem. The liveupdate code is
> all over the place in the driver and it is very hard to wrap one's head
> around how the device is actually retrieved.

You can find the vfio-pci driver changes here:

  https://lore.kernel.org/kvm/20260511234802.2280368-1-vipinsh@google.com/

Let's keep the discussion focused on upstream VFIO drivers since that
is all we are planning to support right now due to LUO's requirement
of file-based preservation. The downstream driver changes we are
carrying is not reflective of what we want to support upstream.

> So I think PCI core should track preserved devices, and if the device is
> preserved, it should skip the probe and wait for retrieve. Retrieve does
> the full initialization of the device. This fits in with the LUO model
> as well. You can make retrieve a callback of struct pci_driver and do
> some wrappers to talk with LUO, so device drivers don't directly
> interface with LUO at all.
>
> We should do similar things on the shutdown path. Shutdown is a
> fundamentally different operation from freeze, and so we should separate
> them out as well.

This is speculative. In practice, we haven't needed to change VFIO's
shutdown() or probe() functions so far. The only change I anticipate
needing is skipping runtime power management "put" during probe() I
mentioned above.

If we actually made retrieve() a first-class callback and used that
instead of probe(), VFIO would internally just call its probe()
function because that would be the cleanest way to set up all the
software state it needs to manage the device.

> This solves the lifetime problem as well. When PCI core is initializing,
> it knows for sure that no retrievals are going to happen. That's because
> none of the drivers have registered yet. So it can safely access the FLB
> and initialize its state. After that, drivers can register themselves
> and start accepting retrieve() calls. Once the last driver goes away,
> the FLB is freed automatically.

It's not so simple. The PCI core does not really initialize itself.
Scanning devices gets triggered externally, e.g. by ACPI, device
trees, runtime hotplug events, etc., and that is when the PCI core
gets notified about a device. None of this is synchronized with "when
drivers have registered", which I assume you are referring to
registering with LUO.

>
> I am sorry for suggesting a big refactor at v6, but the early versions
> looked good to me at the time, and I only thought more deeply about this
> when trying to figure out how we can make the lifetimes cleaner.
>
> What do you think? Does this make sense?
>
> --
> Regards,
> Pratyush Yadav
