Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F086C431E5D
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 23:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784588897; cv=pass; b=gq/MI9Wp/1BhzJPXQV6HCgmH/kYEu9nK9KQjo++Sr9ZcErHd8McX8Yi9EMJbwQE14EippTi5uqeSDkXYg4C8wWqvTf9zWInSGzrDaVkIQ/uCfLJgGjF2gfsstwA1D/xZ1Evq1iTWjrLGhKb8kpciEsGlOW9Z134mkgCLCx/sJCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784588897; c=relaxed/simple;
	bh=RJckoFrJ/AFTsMTnla+l6jc1ydOdgDCm7q2LZm4mL/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvZRu3fruz5+TJFJA9bbdA7ZYUILEPGtrqv2BtpIf7qcfaDR1kGJxhpjDknn26jpkWhz99Ytt7KYGNuWagf8iNl3lu+VXFSUfaJIQE4M1QD4XzHDBbRXp36QYpkNrWsA6x902f/ASjYhTtgAvhExR03RJkCGUmxuXRzwz+9w/mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDo7dqBB; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDo7dqBB"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dcbade417so8833016a91.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 16:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784588895; cv=none;
        d=google.com; s=arc-20260327;
        b=P1W2W6n7V7iLkmD4212XBNOsGzRX67QQTrz7f2B5x2NM58p5oYx7wo+mWeCFId30LQ
         zIW1cdeNoA0hdLfYnq2XeSww1V7lk95Om0khaMZOdCgY738ZL7p3dq6MITiCeXbLM7iP
         n5u6jpPs8ox8UFN+Pi/AS0i636cFcCLgkGGXdtsNhIInbFfyPMjs9SlQngFTopQibKgU
         AGllyrhoh2sanJmqrRPvxhZ92/M30J30hd7qUf7j1yiq2s6Aa+uSy4Lx6EFtyhCMZW/n
         6bsYx0uQMFkxfSEnNVMHwZlcaB85w+3hvTmiwlcqMs2TAt7KPJBXCcUHltJ5/cDQuR9z
         S8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSz2hdMIpgZEgySIqZijvekD49+PJVVZ/pNOTGmHIyg=;
        fh=ufi3rzS+jkVqoYeVBoyNAqMgGLHhLzLWokLDlsZ/Ojk=;
        b=WFWT+qVSEnrAHFE00sSYiIVcwOAvjP2hkngFC/AixLvtJ1zsbKUOi9KrmhLcZE+a8H
         gYVxJSW8meIyJ8xfuZztOd0CzVLXNIdLqHchUxN1I2JjYNPEIHEQtUMaxpKlRQup00/c
         ITxSX6E/uhh00BV7ANKDIVkItaU6tOyOcon99OVJTnaU8xohqxSxdiwFGIFqVm+GosEG
         7XTl/JrIYKGEgiWFCd9pOrmVfecB92Hh46QjBBcV2lbvURw7uOO1YBDNjRp1c2UFzL/b
         c/bgA+YqN9G2JiNa6zphjDvJ5MRRHKSxnygK0GN2v3gB2B9bnN8D5cY+iubDlpXSXaFV
         /9jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784588895; x=1785193695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSz2hdMIpgZEgySIqZijvekD49+PJVVZ/pNOTGmHIyg=;
        b=aDo7dqBB6S9M+oIR8b6iQLzFv6bIKQregAEY/2oOZRrCaipIJbPmGz5ey9ViC8ucyS
         Is5qZvwxshFtzZSX5Ji5R5o7x0CF8E0qWjL7pW7leKs2DXy5zPSC+WRNE6w9PJBjCbuj
         uqUH3I7N0VimMPqvZxHuqab7vsOxBYUaOVaTOqFZ0/YrEXeOUrRh5MerQPLOZnw2u4Mm
         QccIicXjmbzdmu/aam9saE6zFVp1XAbIFBxzSjLYJENIwHEn/1MaVSgSfdWQ9th6E8dQ
         m1GMvI99cZLigaKCaAtP4lPr6gTcIyyEy7ie0ErjndTZcme8rRQCJIe91ifxewDjlwD9
         RQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784588895; x=1785193695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSz2hdMIpgZEgySIqZijvekD49+PJVVZ/pNOTGmHIyg=;
        b=pOa2rrprkASkYDkhXZQtQ7vsnc/evyn5YkAWGnPVzKID8ggdTfbApJC54bTtOL6YJo
         FHLVp4sUFsr2FgTv00J1VRd9/8VvGRay6UKiLv8jghpGt1nA/B1grvbPDzyuuPbz6GEL
         fZJO0iATuKPHCMvb2VZ6JgrXWHGKQo8QdAaOaowYDVkoTTH8yUKkparGZPKN3Md3BUpo
         HyNziZTYZ92O3kNPuldK2mQtcSpI9qC37K/iarx480FuazvqwlwrlhU/IoELlPjbBFh9
         9c7GtY/Dkwd6Zj7i1jL2/mpB8WqP79gONHXYIiHbKibfHDRGxYeTGlOcOPqrRfMuIpK3
         Ljqw==
X-Forwarded-Encrypted: i=1; AHgh+RpDUEm30uctkZ2ashwhoWkjIyjkjMGBYk3PGmvsC+g2PXUuH6FXmeKAjcXcKaTyzTWIOtZHTCX3v98=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdrBGTFsetnZNbAk+8Yd3oElGOJZ+jrSyvEQgp9nBpzHamF7+l
	yZjj8G4wqV7ISbarlYidQbs5L+IDNqau19ps7aSsRn1BqhDL6S7eeL+Z6/s8BN4MYCmMl3ZlxLp
	6GGudpZdsyw/9h2ONRtmUESXIo1g0Qilkl6Bd/2Qc
X-Gm-Gg: AR+sD101uuxxKENxGX/DlvqrZhge1WninhGjAsfEuWd3RG1Br3Z8s/HdXo1hTxZO/0v
	3IX8XRcBVj49glsKK7N0IFwvNgoZ0kWQsZVFZUN0Kt8u2UFgUzC1mQaBzRwIz6KlvaY1awzjiWi
	WiJpHESJHIgn6agdqX/6MRnyNZ3t543gbiT5c/ntpdAUtE7IuGUNodz/AK9bpOfv9fuRObnyJHo
	uJhwvk9ymONaeu6SQhG660KCjSq/dCDkw+xv3TPE0aEMPZyNuLCxf3p0NQdqg==
X-Received: by 2002:a17:90b:2703:b0:37f:9cdf:f0ab with SMTP id
 98e67ed59e1d1-38e4b53898fmr16254011a91.26.1784588894581; Mon, 20 Jul 2026
 16:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-4-dmatlack@google.com>
 <178432481253.189683.3297727348836286619.b4-review@b4> <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>
 <178458744511.332171.13770778781241262180.b4-reply@b4>
In-Reply-To: <178458744511.332171.13770778781241262180.b4-reply@b4>
From: David Matlack <dmatlack@google.com>
Date: Mon, 20 Jul 2026 16:07:47 -0700
X-Gm-Features: AUfX_mw2b0MAZqdoOYi7muREPJHZr01uIkETTrQ-nKl4vTsYC1YtP48BRUt3g1Y
Message-ID: <CALzav=fjTOnyg2++GFFe5B17rHqNCWW=afjsD0A=EEjycPW7Sg@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 3:44=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On 2026-07-20 14:54:51-07:00, David Matlack wrote:
> > On Fri, Jul 17, 2026 at 2:47=E2=80=AFPM Pasha Tatashin
> > <pasha.tatashin@soleen.com> wrote:
> >
> > > On Fri, 10 Jul 2026 21:26:06 +0000, David Matlack <dmatlack@google.co=
m> wrote:
> > >
> > > I am confused by this. Each preserved PCI device must have an associa=
ted
> > > FD preserved with it via LUO. I.e., vfiofd would need to be preserved=
. If
> > > the vfiofd was not reclaimed, and finish is not possible, that vfiofd
> > > would still be owned by LUO, and therefore PCI FLB refcount would sta=
y
> > > positive.
> > >
> > > However, if finish is possible, and this is the last vfiofd that is
> > > finished, FLB will be freed as soon as the reference count reaches ze=
ro,
> > > which I would think is the expected behavior.
> > >
> > > What is the point of holding a reference here, instead of only for th=
e
> > > duration of FLB access, i.e. to make sure we are accessing a valid da=
ta?
> >
> > The duration of the access is from here until pci_liveupdate_finish()
> > because that it when the pointer (dev->liveupdate.incoming) is
> > cleared. So that is why the PCI core holds the reference from here
> > until pci_liveupdate_finish().
> >
> > We could avoid this by deleteing dev->liveupdate.incoming and,
> > instead, fetching the incoming FLB and doing the xarray lookup every
> > atime the PCI core needs to access the device's incoming ser struct,
> > but that would be inefficient.
>
> Thanks for the explanation. As I understand, the most straightforward
> way to avoid holding the permanent reference is indeed to delete
> dev->liveupdate.incoming entirely and perform an xarray lookup on every
> access, like this:
>
> bool pci_liveupdate_is_incoming(struct pci_dev *dev)
> {
>         ...
>         incoming =3D pci_liveupdate_flb_get_incoming();
>         ...
>         dev_ser =3D xa_load(&incoming->xa, key);
>         ...
>         pci_liveupdate_flb_put_incoming();
>         return dev_ser && dev_ser->refcount > 0;
> }
>
> However, as you note, this is inefficient because it affects every
> single device and adds lookup overhead to every access (not sure about
> the actual cost though, xarray access is pretty fast!).
>
> We can, however, still avoid tinkering with the lifecycle of the FLB,
> and instead treat dev->liveupdate.incoming as a "hint" that we validate
> on access with a fast, liveness check:

Can you tell me more about your concern about FLB lifetime?

The lifetime of the FLB will not be affected by this reference unless
there is a bug in the driver where it fails to call
pci_liveupdate_finish() during it's file handler finish callback.

>
> 1. At Setup: In pci_liveupdate_setup_device(), we do the xarray lookup
> once, cache the pointer in dev->liveupdate.incoming, and immediately
> call pci_liveupdate_flb_put_incoming(). We do not hold a permanent
> reference.
>
> 2. On Access: When an accessor runs, instead of doing a full xarray
> lookup, it just validates the cached pointer's liveness by temporarily
> securing the FLB:
>
> static struct pci_flb_incoming *pci_liveupdate_get_incoming(struct pci_de=
v *dev)
> {
>         struct pci_flb_incoming *incoming;
>
>         incoming =3D pci_liveupdate_flb_get_incoming();
>         if (!incoming)
>                 return NULL;
>
>         if (dev->liveupdate.incoming)
>                 return incoming;
>
>         pci_liveupdate_flb_put_incoming();
>         return NULL;
> }
>
> * If get_incoming() returns NULL (the FLB has already finished/freed),
>   the hint is invalid and the device is no longer incoming.

This avoids the xarray lookup but still requires taking the incoming
FLB mutex twice (once for get and once for put) on every access. And
if there's no incoming PCI FLB, the LUO will iterate over all incoming
FLBs under the mutex to find it.

>
> * If it returns a valid pointer, the FLB is guaranteed to be alive, so
>   we can immediately use the cached dev->liveupdate.incoming pointer
>   without xarray lookups. The accessor then puts the transient
>   reference when done.
>
> 3. In Finish/Cleanup: We can simply clear dev->liveupdate.incoming,
> and decrement ser->nr_devices.
>
