Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665D4331A44
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 22:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782858927; cv=pass; b=lPUHvehbMcc1DrxH0Ygzd9ej5jV+1Bb8OmTC8+ogjexGM8KhoK4K2g6pUfnG7uyu1iKQqvOY/kOGKKaXnpIO5TN7hayCtXYbEqSO39Vwex6PNm/i8G4Bckq7OGAEh4gjErC4rUJUCshC00CbYznIB46meU/oNnblTXaR7oF2ZFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782858927; c=relaxed/simple;
	bh=IIH6gb9Aspc978S77GNhCcY8LVqXRyGmxXPBoO9kTVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxthELNlmbkDLM9IuLj/D4vIJJ9mbCjVm9S2ysKNvCIlQlsLhmoM7yFpQQcTY3saswpx1mmUQDJqe93Micbx3aGJnqM+eWyk42bQSmAZXfxdep9n8upUr78d4fBcMV3Da7XXK1vYAtZnynW686bckGO7rDPeU9dKyhBWhs1HMqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tIU74OsF; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tIU74OsF"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-139a5f4ca15so6219897c88.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 15:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782858923; cv=none;
        d=google.com; s=arc-20260327;
        b=qe8pHHZE89TfLDEo0RaYoDnDDzaruGDRizo8kZKkQE00OMVmHKdw79cqo3grg8EwN/
         eZ0l0fvJjuxRCNi8kboWZCXRFyELMhu01PwQrvblTdhEpgKY+QwoVh8rc9PptfqKFXOz
         K941yN95oMbgWTtXkqt4PX5WOaTQaFmJMBggk4Sp9zoCrTeLYqMxARAbtYPYji1hljxx
         OTGa5wyLSZ3w8dzIgawVfssBSDkdLBbKVV2TghWAyG+TWlA8txHYGa/aqI6hesO7We5h
         ziKTwLtjCGhFDDo/5ulgwqiOfbtXJXFYote+GszNBOKYZLPTADxUQCFwawcVbAenCG4e
         Yqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OLXeb8c7iyYBBm1u3dFIHz9SDW0xbbNuKTG6qGPD7go=;
        fh=wPcOBMrVHcWeRXkjr+235xaHvOeNf2FfENsKd/8esII=;
        b=QDtGncRhhOKLtGpLVt7hFX7hXoD9mb1qh7f0MEY7yZoUXP23JdVY5zd/yj+QGKiioT
         tMo1x4H5LZfCjd/zn6Ga2GH2UyT3TUl1z5KVm+giRXxjuVSaAcusVc5YjT0A945ez/aI
         SmwKLwAg3c7g1QX9I8hA0Xs8g57MfLIt2isVJBwjmeXG/UhRuhtkHTIWWpmGbRnAzsMp
         tDWzA9pVsTkQF5OIqX57/ChhWuCU8HoymWHjH+7KAlw5XdM9gipLlTE2a9ZBIQCQbRlP
         y22JaUE3aEbv9KpDLsZmuLWqrPzcwqpwWFT4Co1KrtKjut5vV0ZmYfZB++KyGNQRq4yo
         WXDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782858923; x=1783463723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLXeb8c7iyYBBm1u3dFIHz9SDW0xbbNuKTG6qGPD7go=;
        b=tIU74OsFUlV3w0RTbXhocTIMXQyGIfdxV4w2f0/ZyNa30O5QCKoAji2YPY6tUioxzw
         buympSlkGYL6Bpn4SaMaEvcx4JTonwICxKPb1ktbWYiyCbn9r8dd7bGW/jX4QJdqsLLe
         gqRKdDNMnEQHh5gJ6pV/TDeTpHyjMYiMdEXAQWByHY1FKAR0p74n3fJ1iv6etIpHbDLc
         HsPkgXZDMaVb9vXoBwpdsXd5hV8ojGNHFpXzQEz2Q4sP/8xrEY4SxKtyEBwxWvDp05+T
         0yMU3daHBKYyhevq2Hut6rfWQvHVZiKaB5i47V++4rRCr/c7hTUxE1iOUPqiAWx4OY2g
         08Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782858923; x=1783463723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OLXeb8c7iyYBBm1u3dFIHz9SDW0xbbNuKTG6qGPD7go=;
        b=h1G3o7nDVn9qX1qsZPdILJQHteZasgdYaBTjx0ScGNvepJzLL5rOesGxYBw7y7up0K
         SJAjJUElSOawi6r5Pnnws6VsLeu25SlyWqjIKKtc1sNv1TzyUQTiChr8xIceB3QfGWVK
         xFGQs2EiCcWlGJxNcJs+Q9nPvx2T4EU/jn4I0e5MAYIxabP1lHJ+PexsBeWe0dZvoLHS
         Qb1ShON1pUkg+nHiiISGCWOFbPWT0kCzRNgmjgLf2qCJZKdGD55gLbIW6g6zq43p5t3c
         Q/RhJQRLAB0F1WmOxvqhZaE4HJXAKjNMaskRUd8i0cnmpFEOcmwbeCVn4+RbT55BYSoK
         kViA==
X-Forwarded-Encrypted: i=1; AFNElJ/we7oOA79CQpcA+JI4zBF3lRyNxtcPyVJis+h+Yts2QLdI4RZzZhE4PHC1Lf6ZqBIdHqM1bOTQqJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwkC3DmO6b8MlpoCifyiZDtWyk/72ysQDf+HyMyAb2uN8XteqI
	KsmHCG7syQJ0v7DaDHwFKDCFPkWL9Xu2UWI4bCSHC2MEObCD126vQM33wz3ADMF0NAlbCbQmIsE
	XkcOhr1yBPjcY3MCVEFCD5cqmF4B9vqG5yYvXLWq8
X-Gm-Gg: AfdE7cm91yd0v1YyxYJj43NwTlHS2Hy/NF7K5OM3olfogoazNEl+SHyEzSaN8gKiYrR
	Ggf15ElgF89yKxKYVv+JclBbAIhuIovcGL2injfWBPaesYXxhYTnoQ8WxH0cdCEV9aNPqJbeYyM
	ZpP2FxTRCkcDp+PqLnSRpBF6kYGPdYf7rjNRtAK1U97ai1kaN1PX49ZeoHYgnN5T97qGu9x7wpX
	wAKFXg7QXK9YY53qzlP42vT8ec97243LS/Syp5Xf1loxRyOJycN6Qbh03EEuXI/y1H5TE8m
X-Received: by 2002:a05:7022:f690:b0:139:ed59:4b8e with SMTP id
 a92af1059eb24-13b2a1c7f1dmr3156303c88.50.1782858922721; Tue, 30 Jun 2026
 15:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522202410.3104264-1-dmatlack@google.com> <20260522202410.3104264-10-dmatlack@google.com>
 <aiaoc6Y6qeF_5Wn9@google.com> <20260608181906.GP1962447@nvidia.com>
In-Reply-To: <20260608181906.GP1962447@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 30 Jun 2026 15:34:56 -0700
X-Gm-Features: AVVi8Cd-vdSCkwSqwAz2qbX9b8clCFCtpt-XfTl_1BZFKIa6zUmlOyUobbTWOp8
Message-ID: <CALzav=eGkCom7rM0Mj_AEhcvfryLctRWghPaGkD2V5_bMiXTEg@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] PCI: liveupdate: Inherit ARI Forwarding Enable
 on preserved bridges
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 11:19=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Mon, Jun 08, 2026 at 11:33:07AM +0000, Pranjal Shrivastava wrote:
> > On Fri, May 22, 2026 at 08:24:07PM +0000, David Matlack wrote:
> > > Inherit the ARI Forwarding Enable on preserved bridges and update
> > > pci_dev->ari_enabled accordingly during a Live Update. This ensures t=
hat
> > > the preserved devices on the bridge's secondary bus can be identified
> > > with the same expanded 8-bit function number after a Live Update.
> > >
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > ---
> > >  drivers/pci/liveupdate.c | 18 ++++++++++++++++++
> > >  drivers/pci/liveupdate.h |  6 ++++++
> > >  drivers/pci/pci.c        |  8 +++++++-
> > >  3 files changed, 31 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > > index a93b7ef065f2..701276ef6cfb 100644
> > > --- a/drivers/pci/liveupdate.c
> > > +++ b/drivers/pci/liveupdate.c
> > > @@ -128,6 +128,10 @@
> > >   *    way after Live Update and ensures that IOMMU groups do not cha=
nge. Note
> > >   *    that a device will use its inherited ACS flags for the lifetim=
e of its
> > >   *    struct pci_dev (i.e. even after pci_liveupdate_finish()).
> > > + *
> > > + *  * The PCI core inherits ARI Forwarding Enable on all bridges wit=
h downstream
> > > + *    preserved devices to ensure that all preserved devices on the =
bridge's
> > > + *    secondary bus are addressable after the Live Update.
> > >   */
> > >
> > >  #define pr_fmt(fmt) "PCI: liveupdate: " fmt
> > > @@ -756,6 +760,20 @@ int pci_liveupdate_enable_acs(struct pci_dev *de=
v)
> > >     return 0;
> > >  }
> > >
> > > +int pci_liveupdate_configure_ari(struct pci_dev *dev)
> > > +{
> > > +   u16 val;
> > > +
> > > +   guard(rwsem_read)(&pci_liveupdate.rwsem);
> > > +
> > > +   if (!dev->liveupdate.incoming)
> > > +           return -EINVAL;
> > > +
> > > +   pcie_capability_read_word(dev, PCI_EXP_DEVCTL2, &val);
> >
> > Again, I might be thinking out loud here, but since these are
> > hot-pluggable devices, with some FW / SW running on them, I'm a little
> > worried while assuming the HW registers can be trusted across a kexec.

This is, in-part [*], why I explicitly read the capability rather than
caching what the previous kernel thinks it was in struct pci_dev_ser.

In other words, the kerenl does not assume that hardware registers
remain unchanged across kexec. It reads them after kexec to determine
what state the device is in and inherits that.

[*] The other reason is just to keep the ABI as minimal as possible.

> > Say, if the bridge experiences a reset (e.g. link drop etc) during the
> > kexec blackout, the PCI_EXP_DEVCTL2 register could revert to its defaul=
t
> > state, meaning the ARI bit will be 0.
>
> This does seem like something to be concerned about, but realistically
> I think if you get a PCIe error I'm not sure the incoming kernel is
> equipped to handle it at all :\
>
> Just resuming the driver is going to fail too, I don't know how VFIO
> can learn and forward the event, and so on..
>
> But maybe it is worth being a little more defensive here

If this were to happen, the kernel would see that ARI is disabled on
the bridge after kexec and proceed with that state (ARI disabled).
Devices (devfn) 8+ on the bus would not be available to use or restore
(the kernel would not discover them during scanning). It should be
fairly obvious to the user that something went wrong (devices they are
trying to restore do not even exist) and they can reboot at that point
to recover.

This should be extremely rare though as it requires a PCIe error that
affects the bridge to race with kexec.

This seems like a reasonable way to handle this scenario, at least in
the initial version. We can always look at more gracefully handling
PCIe errors during kexec for Live Update if-and-when there is value.
