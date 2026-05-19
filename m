Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C372459D1
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 00:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151013; cv=pass; b=nDIHx8W5/8muG0B+n6GN/tYuTD7pwx3bZH4vQxycEZBnfjM1ZREtFfwZWmZROcP1JO9jYFI8cGCkhAdwwri7XCZAWGCCodrR2XNkLgVlNNeX5TPoDpu/G27sYYWCxVEn9Ppalu+S2gppqalKEFwaSrceWWsqBmEMPATRTimKts8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151013; c=relaxed/simple;
	bh=is7j9dVhsZcyR/N2wfaZNxzetAOIpBVHYKZcZ7kuiDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yuop24cgYjNqPkDbiNJEV7UDSme4uStLe0Sqq3sEjdkpd7BSv6ZUj7P08eT5rjwt+xaihWi9QWblHoTOO2qNlmxA6pkyWh6qdzVX+P62aVB76/bkK68HSmaPTXmIcVCBeEiLkVIx0Y2Tvuq9+UzRHdmxq7o0x1B++/OVgQNEB4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGckjcFU; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGckjcFU"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7cb345cb5bfso18876017b3.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 17:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779151011; cv=none;
        d=google.com; s=arc-20240605;
        b=FkaG4FQ68I2v871tshIm6V7KhsDQT4A2W05XvgvYlTUxTM6Rz1gngrp7tCmgI1BPg1
         cZCrdv7b9zoDUSHgYafckQXlsVohybKYh+O1bCmCo/KkLQsdEarH+SEwY9NFhzhdlc5N
         Fr21pIfd4aoqg2siseuBOS8t95SWPy0seG5LbRyyZDtFtQNA/hfg9vQM3rViFXVBPdnX
         LURVjjmV9UvqH2B83aKmqwQICZZSGyJYpgk3di5VoApD1mezQKSBuT05C00rEpEQ52m1
         R2qFPVuElESqBj+26y/0rG1vpQ3MSEqIBMquRT0uXYbi+3wA8PbVHzDEjW/rvEuIQ2VV
         742Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        fh=ijxz1rYwIsaWggXDImtD6CML61xkpNEyTbKQjeBHuLo=;
        b=Ep2jN1h4DlnxNMNEHIdn1LeCfaX9aWrdedd3K8KC1t3ePqOGfJgRXdZ0QM6csitGdw
         6fSafRZplG89tnOuHptfgx03DSHSR9jpkfuLLPiR4XPxRqjTkGnsWIFrAzhyFIMxCBKe
         TQs5Zvld8j6mVp76LOlLfPSEhmXvKRjeLIY85bOHptI/bUs0g8GRMk8wcZM9VopkwoEA
         ZZHeeYfPk9przkVdWabY5kOmOQ+lorqT0QZ9iW7n9ZeduTaY3YfSxL52f4UZicAD3JP7
         ebhpm0rK2YqD71kIMUcafoL/uS6g01DEMSgpj4yAegZ8tMTgBMknf60Ur3yWfs5zilGz
         yryQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151011; x=1779755811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        b=jGckjcFUDmuvg3/zpS4Zh10+M/gqT6NeUW2vPZ9C1QdbL7vssWjGGwIf38oo0syXXO
         a+zQ4TVNWidWTV4WnuDz0Xm5Kew0eaSqIdyZYgCaY7z/9LJ3c5HfWPneNs+cZPCuDeLz
         NbPD6qbEuw6jLqXYRY5GFatzg+VinnvHUoxky80sQf1ng5KbaikyLEtB5/JnL0f8MunC
         5SqNyPKFBtWOmZsT0+LyyH4ADT6YGo2AYPD7CKzhg1Z2YC8oCwdzOaC89D5v1rfBTRFv
         j2Ji7HWOKG1yj7O0WfyGl5hN6IuuQ/3UeMMryoAXJNMbSPYhIx9IObgeviK9mzZhz5n8
         vnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151011; x=1779755811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        b=AyOuXqAeXL9v/O1GxsXLlM73RrapoDlMBS1nc/iBIYqJEUu3z2EgMv7kvtvNsOgLHw
         Y4BFgYHox1fblcpKQUDen5BRs9Z9sHRaEAnyiIp/qE5lywqypYUVjxnZNmoRw9z//HfY
         uU/24fqMPoSXrXpGitf7nabDHGx3tjIldZ7NsPv+Ppg9+VNJlBuTVz4RSerSnWka5WpF
         jfhRC1lzj7391FSwZriaHoCHXBiCZdJi6M/fsEs9IHF4DweOsOOMRXor6tozgZHAsepS
         vwc5bGzJSfxd3EaLPY3eDL8XDtdLoUmy2/fTX5+S8MoeT8O4w1s9kZkYVwiCZ6P090T8
         CbRg==
X-Forwarded-Encrypted: i=1; AFNElJ9DZ3G4q+RBXO/hZpIpXSumbpPsXhlDat00lB5Fw+ELSXf6gRSURBnVjX8LwT9gRVpUn5hSSxA6gPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8y4MVx78TaGv3dBzZmln5vMFdNlh37PlMxPYVHVpro0X1567
	nE3p8HXCt1W1io4akAjb2N6hKNo3JbjEbRmLgQhhrDgSKO83YyZPBWUstT3SR60UriqogFCBVSE
	1E6PGvcmgycCubCfqcmZcKKnDvctsLqA=
X-Gm-Gg: Acq92OEFa6Rc+OXHOsLNj1GWR0A10/meRCRxf6jV8cwrAxdVXP9KTe+4rQGDmpxB0Hx
	PF3YgjUSV6l76Nh8e7hTcKRy9xsF4vpOvjBWDdhCOteFY/s0xDJfK9At3sewLgYYUfccpOqdUc5
	K32CTUwOxmLXCDsDaDjhiBFyda+7rbunHOs/LRE0awXUGnOXyCL9DtSLPf+wMniQyK/1CyHi6s2
	OJbsiN/tPzsvhu97TiNPBG5MPEbqWjT5MJITnymNp3CHUeuu38YYe0Q9Gbn6YX+GBiJIe1z2u/q
	7J0S6jm8UhaROo3NtJR63+L3XRYiyZiOpBhSm7UZ7PFBM8lV3hBdFY/j7LvO6rOIDwyZvXOc
X-Received: by 2002:a05:690c:19:b0:7bd:5cc4:3e49 with SMTP id
 00721157ae682-7c9597a969fmr213746077b3.12.1779151010945; Mon, 18 May 2026
 17:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com> <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com> <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607> <20260512161111.0cb7000e@fedora>
 <agNJasayW8VCHTiU@e142607> <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
 <20260518091650.5a7a4f4a@fedora>
In-Reply-To: <20260518091650.5a7a4f4a@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 18 May 2026 17:36:40 -0700
X-Gm-Features: AVHnY4L_pqXJyhSchHbjEJHIXbJa2yYodKfZcbmSmhWAfddYBdzbaPZTcjMiQrU
Message-ID: <CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
	Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 12:16=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 13 May 2026 12:31:32 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.co=
m> wrote:
> > >
> > > On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> > > > On Tue, 12 May 2026 14:47:27 +0100
> > > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > > >
> > > > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > > > >
> > > > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wro=
te:
> > > > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panth=
or_device *ptdev)
> > > > > > > > >                     return ret;
> > > > > > > > >     }
> > > > > > > > >
> > > > > > > > > +   /* If a protected heap name is specified but not foun=
d, defer the probe until created */
> > > > > > > > > +   if (protected_heap_name && strlen(protected_heap_name=
)) {
> > > > > > > >
> > > > > > > > Do we really need this strlen() > 0? Won't dma_heap_find() =
fail is the
> > > > > > > > name is "" already?
> > > > > > >
> > > > > > > If dma_heap_find() will fail, then the whole probe with fail =
too.
> > > > > > > This check prevents that.
> > > > > >
> > > > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > > > currently probe and boot the FW even though we never setup the
> > > > > > protected FW sections, so why should we defer the probe here? C=
an't we
> > > > > > just retry the next time a group with the protected bit is crea=
ted and
> > > > > > fail if we can find a protected heap?
> > > > >
> > > > > The problem we have with the current firmware is that it does a n=
umber of setup steps at "boot"
> > > > > time only. One of the steps is preparing its internal structures =
for when it enters protected
> > > > > mode and it stores them in the buffer passed in at firmware loadi=
ng. We cannot later run the
> > > > > process when we have a group with protected mode set.
> > > >
> > > > No, but we can force a full/slow reset and have that thing
> > > > re-initialized, can't we? I mean, that's basically what we do when =
a
> > > > fast reset fails: we re-initialize all the sections and reset again=
, at
> > > > which point the FW should start from a fresh state, and be able to
> > > > properly initialize the protected-related stuff if protected sectio=
ns
> > > > are populated. Am I missing something?
> > >
> > > Right, we can do that. For some reason I keep associating the reset w=
ith the
> > > error handling and not with "normal" operations.
> > I kind of hope we end up with either
> >
> >  - panthor knows the exact heap to use and fails with EPROBE_DEFER if
> > the heap is missing, or
> >  - panthor gets a dma-buf from userspace and does the full reset
> >    - userspace also needs to provide a dma-buf for each protected
> > group for the suspend buffer
> >
> > than something in-between. The latter is more ad-hoc and basically
> > kicks the issue to the userspace.
>
> Indeed, the second option is more ad-hoc, but when you think about it,
> userspace has to have this knowledge, because it needs to know the
> dma-heap to use for buffer allocation that cross a device boundary
> anyway. Think about frames produced by a video decoder, and composited
> by the GPU into a protected scanout buffer that's passed to the KMS
> device. Why would the GPU driver be source of truth when it comes to
> choosing the heap to use to allocate protected buffers for the video
> decoder or those used for the display?
I don't think the GPU driver is ever the source of truth. If the
system integrator wants to specify the source of truth (SoT) from
kernel space, they should use the device tree (or module params /
config options). If they want to specify the SoT in userspace, then we
don't really care how it is done other than providing an ioctl.
Panthor is always on the receiving end.

If we don't want to delay this functionality, but it takes time to
converge on SoT, maybe a solution that is not a long-term promise can
work? Of the options on the table (dt, module params, kconfig options,
ioctls), a kconfig option, potentially marked as experimental, seems
like a good candidate.

>
> >
> > For the former, expressing the relation in DT seems to be the best,
> > but only if possible :-). Otherwise, a kconfig option (instead of
> > module param) should be easier to work with.
> >
> > Looking at the userspace implementation, can we also have an panthor
> > ioctl to return the heap to userspace?
>
> Yes, it's something we can add, but again, I'm questioning the
> usefulness of this: how can we ensure the heap used by panthor to
> allocate its protected FW buffers is suitable for scanout buffers
> (buffers that can be used by display drivers). There needs to be a glue
> leaving in usersland and taking the decision, and I'm not too sure
> trusting any of the component in the chain (vdec, gpu, display) is the
> right thing to do.
The heap returned by panthor is only for panfrost/panvk. It says
nothing about compatibility with other components on the system.
