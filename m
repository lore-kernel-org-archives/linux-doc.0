Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422E409124
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210438; cv=pass; b=RivzeuOsDjar+ZWkM2gw4LdX7rDHuC6ry+QNWCZOBTVYQ1ypeL8myRyhxbb3p6gfNXMYR78FkwRBAC+UeHztBH0v/1JUX5P/CTYayZVM5xld2jWyRSwgCP/1ipQWs0sIm9lYLVkDzRKRUq/NL9WaTgrja04HaBZJoQuIH086jqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210438; c=relaxed/simple;
	bh=N93580etNJRtcaCh5k+CIi1IiYnZgvuNwGKzusUmj60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SO83PTxnjg21Ey2IE3tgDE3rg+N0zvUgU13ZBI/g+biOccjPEFB7Pf1DSRd8YA5aVKLlPXBMYx1UhA6uODhkT4pt4MLCKq1C0saZimrrfUjFtBX4V0LoVRMABKLBeEc732J15DflIU9xdWM9k5i/PZdeDDuoYYU/p/P+GfwCBgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddkyPKXk; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddkyPKXk"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7c04749d739so24544027b3.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 10:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779210436; cv=none;
        d=google.com; s=arc-20240605;
        b=ijEOb0KkFoSfBBmxJ+NGiKtTB3U2DDa8+UVX9OOlF6MCRd/GuyiKj3LVoTdpjFGkZp
         HksVqenyxgTlEHDcITK4rC+QElmGphC/jqJbNoqHHRDxPuGkRLx4Jf7xV0WA03j+Wp+O
         6tqkmBkHpobv61IPJu86L2TbWM/HE7e9z559hXjnhjHaCHwENjyF3RPnML2EsB/JiwDn
         kCcrex4SouLXXqonr8q51pVv/BbimGyHsCtXy+0RIrFqGlyOL7eRqN+V9839+it7nzOw
         51qIn2suRlckuFEPQCYPbA55igNybxCWEeXa86cnCkj2S4gcEhM5Q9ujtS0wPDIabq3y
         xjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEsZwdKUK4CjM7jLOh90h5kzKd0IJynt1iGHOkr4Mv0=;
        fh=p5iBhmruW7Af9zPeTWUOu81Hbi1lLo1UK8dnI9nDD2s=;
        b=ZlYglh0iBP/ZnIojhIyuGoqQLkh1uPoMrifwVLdpQnhVfUbY73WCoRT628bPo3jP7Z
         KqTiUSALg511/dnyDJQSsR8VHKM2CbPcL8UccT1ohcAoyNo89X+3/l8nIHC5Fi2DU6uT
         gOE4lu2iCp+PMOp/kEgf7LhS0YmxxMpMbbakqk+euf2Gi7HP2JaUR2RTFrOwtm1HeI82
         lbxpRQhDO742ZHxUykMYyaWP5lqU5g2WVjlkWFeUakz7g7LYooB5gosutSjD3/RJrmlB
         vwFx0vjilhjuXuUqMafnVAJid0auAamVmi6lNAz/6yWmlPAwmlAmuCgZdf7T0hU0gUNL
         8JJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779210436; x=1779815236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEsZwdKUK4CjM7jLOh90h5kzKd0IJynt1iGHOkr4Mv0=;
        b=ddkyPKXkKmY9nmcTdhfZCGdmo+wJsEedx39GIfKBOJIJQqCwv92yFsOy+BiT4m+0nH
         ea8rfXvPG67LN+QzJTw0wp2a1kXkJWfASC4HL83l9bX22PbGTt5QdL5g8RtVN7Tigu5N
         +OuyA7ySUg8bzRPVPO1jRKpinAfN+kTQb+ulRxD+r4hxjNGA4IPcSN+5N6E5rEq0/oV1
         HTxlu0/DO36XxkyqVVfkdqX/ugfzQXlrdQzsQz3/0kWjPsEQpK1aqk8sqYHWK0vkVZXw
         FEg6nQjS9H7FHQ79EjFZv/fWll7ldGeZo4xwOJTnCDAyhvPorO6S+aV2Kl6YnXHYCDVg
         O/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210436; x=1779815236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oEsZwdKUK4CjM7jLOh90h5kzKd0IJynt1iGHOkr4Mv0=;
        b=nlNbtIsxRfrGSPbHywRAhi4JYUKSSIFkhsAQtKCkTMbYgusyfgS/fPwSulDUNUeBWL
         MxTnsrOAzNYqwKM/7cDCBvoeOgMUkyKwmf7rlyr64ej2uYaAH6QlN8+q3ZNnqpWDOjKB
         hw3eO8Iqexdw6BmXOc7yKRtDePCNbpACePOmAe1ld/UvJ2yA9lub0lvc4w7x0prkOFyq
         GmaQkJ0YVH2HOC1PIBIGrfCKgIbJKtG0uZoLMESd3qIN9b4y8kVgoeHzhAuSo9orTmkV
         3j0j8WqkgKQocQ+ZBX+pipUU411ZvgM4OgqwpyseNSSJkeXSy1vDJVgmSN9vKGJCXdCt
         IA0A==
X-Forwarded-Encrypted: i=1; AFNElJ9SPJvYOC1f1smysLtKs9Kqicd9GJxDSZO/IY9ug1KUb+J8ayhc0fLjF1FC2CBfeDNvOyqzTGO7F1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTQovEb9TzfqFIsOQMLJJoUc1EauZcAT4c2MzmjspGAYWmLk9I
	38iJhAx62p2QQbh4fVI9ukRuKK3JFLa54PyL7JlsG4TN/MNUyfxRxiSPF/zKBeOTWMM4Tp/9Lkd
	xMMkZwTq72E06fQ4hySt7nVCuUX//wJQ=
X-Gm-Gg: Acq92OFqQyODs20N2lv+Y0eevPH1s/dEtFGJkR03Jdg+J0nfa9IHnbHGoHgBBdDoQOa
	askcgfTeoaCW2RRzQtA5ACFI1x2Mr8Y1YzHWIGbKjkbitGrh867NFwR7iVBEcaeWDNvqe3jZTXx
	Or7z8r7Q7ChurybjDKm10PMPZTHJV8JSrAm98nYTQgv3+nCc0tRoCaw0VTAqHiYLTY4EgTiVqoP
	fvJ7K3mej6uxYQmOnZzBqvHvXA7397yn5uNhczhgn9Gl6xry8CA5/xI8grZGAx9WZpyxUhEcWiY
	Cged2VkSAJho4FARfAmbILm9oyOHZwReY8+IWgpbWzZup05ByaMYNaVpbpz4DsafGcZ9U9QJ
X-Received: by 2002:a05:690c:38a:b0:79a:5fb9:62ad with SMTP id
 00721157ae682-7c95c2f76d2mr234627707b3.43.1779210435344; Tue, 19 May 2026
 10:07:15 -0700 (PDT)
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
 <20260518091650.5a7a4f4a@fedora> <CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
 <20260519093955.448ff899@fedora> <8f0b1750-a853-4895-9672-73a75f6dbd84@arm.com>
In-Reply-To: <8f0b1750-a853-4895-9672-73a75f6dbd84@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 19 May 2026 10:07:02 -0700
X-Gm-Features: AVHnY4KPVoHRfmRDqkq-IVKhKn_YZaF7RwhfpWAK0UOEyzKcth-8E_oZBwz-wzI
Message-ID: <CAPaKu7T7JZRmsS+D_3zFZtyhJk9mNXjL=xpAQ-UNGbm0vztyRg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	=?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
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

On Tue, May 19, 2026 at 1:49=E2=80=AFAM Ketil Johnsen <ketil.johnsen@arm.co=
m> wrote:
>
> On 19/05/2026 09:39, Boris Brezillon wrote:
> > On Mon, 18 May 2026 17:36:40 -0700
> > Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> >> On Mon, May 18, 2026 at 12:16=E2=80=AFAM Boris Brezillon
> >> <boris.brezillon@collabora.com> wrote:
> >>>
> >>> On Wed, 13 May 2026 12:31:32 -0700
> >>> Chia-I Wu <olvaffe@gmail.com> wrote:
> >>>
> >>>> On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm=
.com> wrote:
> >>>>>
> >>>>> On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> >>>>>> On Tue, 12 May 2026 14:47:27 +0100
> >>>>>> Liviu Dudau <liviu.dudau@arm.com> wrote:
> >>>>>>
> >>>>>>> On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> >>>>>>>> On Thu, 7 May 2026 11:02:26 +0200
> >>>>>>>> Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> >>>>>>>>
> >>>>>>>>> On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote=
:
> >>>>>>>>>>> @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_d=
evice *ptdev)
> >>>>>>>>>>>                      return ret;
> >>>>>>>>>>>      }
> >>>>>>>>>>>
> >>>>>>>>>>> +   /* If a protected heap name is specified but not found, d=
efer the probe until created */
> >>>>>>>>>>> +   if (protected_heap_name && strlen(protected_heap_name)) {
> >>>>>>>>>>
> >>>>>>>>>> Do we really need this strlen() > 0? Won't dma_heap_find() fai=
l is the
> >>>>>>>>>> name is "" already?
> >>>>>>>>>
> >>>>>>>>> If dma_heap_find() will fail, then the whole probe with fail to=
o.
> >>>>>>>>> This check prevents that.
> >>>>>>>>
> >>>>>>>> Yeah, that's also a questionable design choice. I mean, we can
> >>>>>>>> currently probe and boot the FW even though we never setup the
> >>>>>>>> protected FW sections, so why should we defer the probe here? Ca=
n't we
> >>>>>>>> just retry the next time a group with the protected bit is creat=
ed and
> >>>>>>>> fail if we can find a protected heap?
> >>>>>>>
> >>>>>>> The problem we have with the current firmware is that it does a n=
umber of setup steps at "boot"
> >>>>>>> time only. One of the steps is preparing its internal structures =
for when it enters protected
> >>>>>>> mode and it stores them in the buffer passed in at firmware loadi=
ng. We cannot later run the
> >>>>>>> process when we have a group with protected mode set.
> >>>>>>
> >>>>>> No, but we can force a full/slow reset and have that thing
> >>>>>> re-initialized, can't we? I mean, that's basically what we do when=
 a
> >>>>>> fast reset fails: we re-initialize all the sections and reset agai=
n, at
> >>>>>> which point the FW should start from a fresh state, and be able to
> >>>>>> properly initialize the protected-related stuff if protected secti=
ons
> >>>>>> are populated. Am I missing something?
> >>>>>
> >>>>> Right, we can do that. For some reason I keep associating the reset=
 with the
> >>>>> error handling and not with "normal" operations.
> >>>> I kind of hope we end up with either
> >>>>
> >>>>   - panthor knows the exact heap to use and fails with EPROBE_DEFER =
if
> >>>> the heap is missing, or
> >>>>   - panthor gets a dma-buf from userspace and does the full reset
> >>>>     - userspace also needs to provide a dma-buf for each protected
> >>>> group for the suspend buffer
> >>>>
> >>>> than something in-between. The latter is more ad-hoc and basically
> >>>> kicks the issue to the userspace.
> >>>
> >>> Indeed, the second option is more ad-hoc, but when you think about it=
,
> >>> userspace has to have this knowledge, because it needs to know the
> >>> dma-heap to use for buffer allocation that cross a device boundary
> >>> anyway. Think about frames produced by a video decoder, and composite=
d
> >>> by the GPU into a protected scanout buffer that's passed to the KMS
> >>> device. Why would the GPU driver be source of truth when it comes to
> >>> choosing the heap to use to allocate protected buffers for the video
> >>> decoder or those used for the display?
> >> I don't think the GPU driver is ever the source of truth. If the
> >> system integrator wants to specify the source of truth (SoT) from
> >> kernel space, they should use the device tree (or module params /
> >> config options). If they want to specify the SoT in userspace, then we
> >> don't really care how it is done other than providing an ioctl.
> >> Panthor is always on the receiving end.
> >
> > Okay, we're on the same page then.
> >
> >>
> >> If we don't want to delay this functionality, but it takes time to
> >> converge on SoT, maybe a solution that is not a long-term promise can
> >> work? Of the options on the table (dt, module params, kconfig options,
> >> ioctls), a kconfig option, potentially marked as experimental, seems
> >> like a good candidate.
> >
> > If Panthor is only a consumer, I actually think it'd be easier to just
> > let userspace pass the protected FW section as an imported buffer
> > through an ioctl for now. It means we don't need any of the
> > modifications to the dma_heap API in this series, and userspace is free
> > to choose its SoT (efuse, DT, ...) and pass the info back to mesa/GBM
> > somehow (envvar, driconf, ...). The only thing we need to ensure is if
> > lazy protected FW section allocation is going to work, but given the
> > current code purely and simply ignores those sections, and the FW is
> > still able to boot and act properly (at least on v10-v13), I'm pretty
> > confident this is okay, unless there's some trick the MCU can do to
> > detect that the protected section isn't mapped (which I doubt, because
> > the MCU doesn't know it lives behind an MMU).
I set up MMU to map non-protected memory to the protected section the
other day. The FW still booted fine. I didn't get access violation
until the FW executed PROT_REGION and panthor requested
GLB_PROTM_ENTER in response.

This was on v13, but I also doubt it will become an issue. Can ARM help cla=
rify?

> >
> > Of course, once we have a consensus on how to describe this in the DT,
> > we can switch Panthor over to "protected dma_heap selection through DT"=
,
> > and reflect that through the ioctl that exposes whether protected
> > support is ready or not (would be a DEV_QUERY), such that userspace can
> > skip this "PROTM initialization" step.
> >
> > We're talking about an extra ioctl to set those buffers, and a
> > DEV_QUERY to query the state (ready or not), the size of the global
> > protected buffer (protected FW section) and the size of the protected
> > suspend buffer. The protected suspend buffer would be allocated and
> > passed at group creation time (extra arg passed to the existing
> > GROUP_CREATE ioctl). So, overall, I don't consider it a huge liability
> > in term of maintenance cost.
>
> If we can avoid the dma-heap changes, then that would surely help!
> I can try to implement this in the next version unless someone finds a
> reason why it is a bad idea.
Yeah, that sounds good to me too.

Will the extra ioctl require root? On a system with true protected
memory, the FW cannot write to non-protected memory. It seems ok to
allow any client to make the ioctl call. But on systems without true
protected memory, it can be problematic.

>
> >>>> For the former, expressing the relation in DT seems to be the best,
> >>>> but only if possible :-). Otherwise, a kconfig option (instead of
> >>>> module param) should be easier to work with.
> >>>>
> >>>> Looking at the userspace implementation, can we also have an panthor
> >>>> ioctl to return the heap to userspace?
> >>>
> >>> Yes, it's something we can add, but again, I'm questioning the
> >>> usefulness of this: how can we ensure the heap used by panthor to
> >>> allocate its protected FW buffers is suitable for scanout buffers
> >>> (buffers that can be used by display drivers). There needs to be a gl=
ue
> >>> leaving in usersland and taking the decision, and I'm not too sure
> >>> trusting any of the component in the chain (vdec, gpu, display) is th=
e
> >>> right thing to do.
> >> The heap returned by panthor is only for panfrost/panvk. It says
> >> nothing about compatibility with other components on the system.
> >
> > Okay, if it's used only for internal buffers, I guess that's fine.
>
> --
> Ketil
