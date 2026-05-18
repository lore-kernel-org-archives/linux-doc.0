Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE144D6B2
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109142; cv=pass; b=SjzaV42iXIT/yeU9NrbaKE3m1dZdGMihBCGGqPLKr7mgFZC28SHh/2srjXemcKzU6CTRf4Iny1836bElFDyXIZcVzrSohFqIOof4d8XEmSZXGNtM06VzXtATxm1GcXDRfkwx9ppT8c5aCwcCTdBqHuN+DqPnOLZNA++3DKfgjAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109142; c=relaxed/simple;
	bh=1nJ299rs5r4aCk+S/C4PRmUegyebAnCdRZjhKGuNQUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVyoYT8s1URgG6LUQSPXVzn41GW5QMSfovX0zKGeDEl6Bwl7+S70tBQgroJFP6nxHlN/VB2MYDk2A/slBkJeP8lJqMaXXGU/YmfFWHl6oEO9JKHnsJ6nJcKZmUH/s2/AVEENtV8QqYKmdUZTx/n9fVUhpxayefnQiIxDsjSFJ58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mh5tCe+v; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mh5tCe+v"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-651c5d525f6so2227530d50.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 05:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779109136; cv=none;
        d=google.com; s=arc-20240605;
        b=TV8jKpkmmymOVldPyOnVfzjTI/IYHgi2Awtc4NbayDZ6nuC4ugUP5OEe5Uh98tqLTx
         6i9khLEr+4Tm00rbZtUCfxC18rfpuunuHAq8Z0+8y2+HYyFqGzkY8g+Bd7kCVJL9YXuY
         P0YYr7FY913OvAf+1JNOIhMD5i99GBgD81bFXGgy6b1e0lTWsrsnuLbgYhhoXzuw9ufn
         UgDYFMGm7HV8dUD9nXCT0w7rKwb8A/4mdykCVU44av/dijNulbXo/USQi5onhVCq8LUl
         rFvnYK5JFOCTf2QpuBfrzduaeP9JNtp7avFp/9ni8M+CBcsruQC4kckCWAVl4mm+1NLF
         YKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=43XOKwod7lkr/JFAt6gp70bo5/ubw+AmY3hOZjjU4ZM=;
        fh=TUGBNwMXy77FuVixJLXer35mGzQGB9JeQ9rSsA9EBrE=;
        b=UJsTHnJR1/FFwIhXT8g8beDEK0x9wHR3McYXcLFuH1S0g5/s17yy/EuEMOiInb1gL8
         YdW5EZnPA/BvWgwHckh6fwZFlnX/sm5fgwbUElQMaeALZNUdj7YD0mxgtlRRzklF9nKL
         uuI7TPp3IjabCN1sLlarBGtZMg9oYMTEJTsQoVgHNM2TuzN76QISgIOvx+0LV+cJVvQ7
         bJPaOds2ZWNs1FPhYaimnrIsY/5y9J8sVzKha/AzeyjH2jT6RQgeb3bTd7Zek8WwsiiF
         bgU01Aocrem5orCWnbnlucOcl5Bopy5hogx7ZzH6l8NJZytiRlaU5S/BYYVw/1MT25WH
         Mv3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109136; x=1779713936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43XOKwod7lkr/JFAt6gp70bo5/ubw+AmY3hOZjjU4ZM=;
        b=mh5tCe+vg53WMlRSrCdKaPNgWOq84RijlzhXH3CmNXloRLf+qKjqFNz9v+0fXCmuWB
         5Y2pklaHF2Wa4rtPLTnaFAQiGE+C75fliToJD3UPQuvxYqI1MBJeFAzHDKPY3qc/TLaR
         uP7+mPMkRQdUcYkU0bSZ16d3nDX/+1OQC6sAqrG2g67iUI9NgE6uBAKrvjq+rcWS0It1
         7c9yv6YJafhWzoTv/LNikU6Pnbwz3365UnQS/rO6BZvQ7a0pAntPc6Zn5HWkODNdVR5H
         kDlPOSDDpTTpQLskHrmasebubKKgsWfPNazz87jGAhQW2r76I8n8FQ/EmcD78UsrwSKh
         4SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109136; x=1779713936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43XOKwod7lkr/JFAt6gp70bo5/ubw+AmY3hOZjjU4ZM=;
        b=riLxFMbJGkpxPtN0d6YFjMPCcQLf+YlPS5HdkgdyDyMEFNo2WA1+gSym1eGBVZn5qn
         xHsxiCzVIvM4IGMpljJoZp8yNooJ2wT026nsMEdbF6HX0biY0EuqvgR51HdsBGXUbFZ6
         8vECtQV8c/lTv+5IlZMzV4cs90L4d04Je/A8VQSAFYpBGG7ggLID2aXMmeNp0DIceypx
         HRSBDg6WPjTBryWYV1iSlRSQkWW0bj6WnQj5oNJ9mudzm2swABvRKIXvPbZ0+jdNxFFA
         VeCKaG3mq+omKJ9xRgHkGuk+gzIoDivN5zM/R0jZ3+5DnccKa/Ubw8B0JJgVGDesh5Y2
         4ulw==
X-Forwarded-Encrypted: i=1; AFNElJ+7gNmYXbl0mUA3j7dwoTX0yLfFijpcyxFyRNCNOFeYwFwBYJrn33j/nG9VnhachriyODKP29NaFpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu9mevMs3hgK0LFz4IDP9PJJt+AosrHgPOav2uCVrVLdt/2G6f
	3BI6SgLlRb8q4vhb1PLn6slZkvFBgshoy1Xympci5h6w+u2XaukiYIPJfSiQBZMKKoHiZDNjmzY
	EJenas6Ffi7cDSqy2jPVI2xk5I3OxLSU=
X-Gm-Gg: Acq92OFCkkyxJo5jH03BYBbbuBsZQSDdYU53Ajig+Fpdv4BBAmEmebcYei9xeNHBsn5
	wvxp6cXuAErBJXJhL1MgqyufuKtlN24eZpbaiu1Jc6mHb/lfMiVKdTrxVwyhvuPJgQ9/qZwFRZJ
	XjCK4kxiyKOUDtkZ6AgWX3vg4ODOcankCs8qCFVQ/iGFn3l1yAN7gHLPmgtkQy67jSQcSeF9INO
	eJTLZVzA24p6d2rnluBohyQ32+AvHR9KBSqlKPuLodNPY0SuFTqGq9eFAaou+R7kVzBm7mZTodN
	L2rb4AoyANTVXnTgxFdqSPPRLG9oE1Low+Ym+gI7fnwoZhVq
X-Received: by 2002:a05:690e:1589:20b0:64a:ce9a:ace2 with SMTP id
 956f58d0204a3-65e228a2c9amr12243832d50.56.1779109135713; Mon, 18 May 2026
 05:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com> <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
In-Reply-To: <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Mon, 18 May 2026 14:58:44 +0200
X-Gm-Features: AVHnY4LKZxHnUpuDd83fvxh1z7FeQsObNJnWqmF56ZyeBHGI_r4jDsz0bjbgq4Y
Message-ID: <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, 
	=?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/18/26 14:02, Julian Orth wrote:
> > On Mon, May 18, 2026 at 1:58=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/16/26 13:06, Julian Orth wrote:
> >>> This series adds a new device /dev/syncobj that can be used to create
> >>> and manipulate DRM syncobjs. Previously, these operations required th=
e
> >>> use of a DRM device and the device needed to support the DRIVER_SYNCO=
BJ
> >>> and DRIVER_SYNCOBJ_TIMELINE features.
> >>>
> >>> There are several issues with the existing API:
> >>>
> >>> - Syncobjs are the only explicit sync mechanism available on wayland.
> >>>   Most compositors do not use GPU waits. Instead, they use the
> >>>   DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied t=
o
> >>>   DRM devices means that compositors cannot consistently offer this
> >>>   feature even though no device-specific logic is involved.
> >>
> >> Well the drm_syncobj is a container for device specific dma fences.
> >
> > Not necessarily. The DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL ioctl attaches
> > some kind of dummy fence that is already signaled. I don't believe
> > this is device specific. That is also the path that llvmpipe would
> > use.
>
> Yeah I feared that.
>
> This is the wait before signal path and if I'm not completely mistaken th=
at one is not supported by a lot of compositors.

I believe this is supported by all compositors.

>
> The last time I looked for GPU support the compositor needs to spawn a se=
parate thread for each client to support this approach.
>
> It could be that we have eventfd integration for that as well now, but in=
 that case you could give the compositor an eventfd instead of a drm_syncob=
j fd in the first place.

Yes, all compositors use the DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to wait
async for the timeline point to materialize and/or be signaled. The
wayland protocol was the motivation for that ioctl.

>
> So as far as I can see using drm_syncobj for software rendering really do=
esn't make sense, eventfd is a much better fit for that use case.

Using eventfd has some disadvantages:

- We've just added syncobj support to vulkan:
https://github.com/KhronosGroup/Vulkan-Docs/issues/2473#issuecomment-444611=
7280.
For eventfd we would not only have to add yet another extension, that
would realistically only be exposed by llvmpipe, but also every
compositor and every client would have to support both extensions.
- Similarly, a new wayland protocol would need to be designed to
support sync over eventfd.
- Eventfd does not support timeline semantics. Meaning that you would
have to send two eventfds over the wire for each commit, one for the
acquire point and one for the release point. Whereas with syncobj you
only need to send two integers per commit.

I don't see the advantage when drm_syncobj already does everything we need.

You seem to believe that compositors would not be ready for this and
from that perspective I can understand your apprehension. But I can
assure you that compositors are already fully set up to support all of
the usecases I've described: The wayland protocol requires the
compositor to support wait before signal.

>
> Regards,
> Christian.
>
> >
> >>
> >> What could be possible instead is to pass an eventfd into Wayland, but=
 that is something userspace needs to decide.
> >>
> >>> - llvmpipe currently cannot offer syncobj interop because it does not
> >>>   have access to a DRM device. This means that applications using
> >>>   llvmpipe cannot present images before they have finished rendering,
> >>>   despite llvmpipe using threaded rendering.
> >>
> >> Yeah, but that is completely intentional. You *CAN'T* use a dma_fence =
as completion event for llvmpipe rendering. See the kernel documentation on=
 that.
> >>
> >> What could be possible is to use the drm_syncobjs functionality to wai=
t before signal, but that has different semantics.
> >>
> >> Regards,
> >> Christian.
> >>
> >>> - Clients that do not use the Vulkan WSI need to manually probe /dev/=
dri
> >>>   for devices that support the syncobj ioctls in order to use the
> >>>   wayland syncobj protocol.
> >>> - Similarly, clients that want to use screen capture have no equivale=
nt
> >>>   to the WSI and are therefore forced into that path.
> >>> - Having to keep a DRM device open has potentially negative interacti=
ons
> >>>   with GPU hotplug.
> >>> - Having to translate between syncobj FDs and handles is troublesome =
in
> >>>   the compositor usecase since syncobjs come and go frequently and ne=
ed
> >>>   to be cleaned up when clients disconnect.
> >>>
> >>> /dev/syncobj solves these issues by providing all syncobj ioctls unde=
r a
> >>> consistent path that is not tied to any DRM device. It also operates
> >>> directly on file descriptors instead of syncobj handles.
> >>>
> >>> The series starts with a number of small refactorings in drm_syncobj.=
c
> >>> to make its functionality available outside of the file and without t=
he
> >>> need for drm_file/handle pairs.
> >>>
> >>> The last commit adds the /dev/syncobj module. I've added it as a misc
> >>> device but maybe this should instead live somewhere under gpu/drm.
> >>>
> >>> An application using the new interface can be found at [1].
> >>>
> >>> [1]: https://github.com/mahkoh/jay/pull/947
> >>>
> >>> ---
> >>> Julian Orth (12):
> >>>       drm/syncobj: add drm_syncobj_from_fd
> >>>       drm/syncobj: add drm_syncobj_fence_lookup
> >>>       drm/syncobj: make drm_syncobj_array_wait_timeout public
> >>>       drm/syncobj: add drm_syncobj_register_eventfd
> >>>       drm/syncobj: have transfer functions accept drm_syncobj directl=
y
> >>>       drm/syncobj: add drm_syncobj_transfer
> >>>       drm/syncobj: add drm_syncobj_timeline_signal
> >>>       drm/syncobj: add drm_syncobj_query
> >>>       drm/syncobj: fix resource leak in drm_syncobj_import_sync_file_=
fence
> >>>       drm/syncobj: add drm_syncobj_import_sync_file
> >>>       drm/syncobj: add drm_syncobj_export_sync_file
> >>>       misc/syncobj: add new device
> >>>
> >>>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
> >>>  drivers/gpu/drm/drm_syncobj.c                      | 374 +++++++++++=
+++-----
> >>>  drivers/misc/Kconfig                               |  10 +
> >>>  drivers/misc/Makefile                              |   1 +
> >>>  drivers/misc/syncobj.c                             | 404 +++++++++++=
++++++++++
> >>>  include/drm/drm_syncobj.h                          |  21 ++
> >>>  include/uapi/linux/syncobj.h                       |  75 ++++
> >>>  7 files changed, 795 insertions(+), 91 deletions(-)
> >>> ---
> >>> base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
> >>> change-id: 20260516-jorth-syncobj-d4d374c8c61b
> >>>
> >>> Best regards,
> >>> --
> >>> Julian Orth <ju.orth@gmail.com>
> >>>
> >>
>
