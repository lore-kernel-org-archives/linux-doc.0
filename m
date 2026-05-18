Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6076C3F1645
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105790; cv=pass; b=a3g7LjnVYvHoQ82khHGfXN0fH3HnyVfK5ce/4VQ8v8aawCRwUElyo30MWKHkB2pzC3n3y6GsiBY4q2VqjfHYcBrNqx8g9hHnnShBkH4Yn18HX0DzKTu8Yu0dvyegCGLKnqDEKauIgsJeu1VdyGyQ1WtR0T43NvvNLyVJ7tJM/sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105790; c=relaxed/simple;
	bh=CIL2dYcCy6pyiuOQOFaduBB+E5eqMEsHA9bpVm3m//Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgAXmd4UNGTP8O4HoUEqqHSYCzj4GhYPKXgbfkcOs+s8WFUZ9MMITf0xGKAhPPkT0oS5360UGdNCHQP7fTOIHha5CWziiVE1ZVnjcmlJfJVfA4kDZj3pgVYdrdg77Alw/6qJRDjHjN99j/w1kog87LuARUkHXcLGWZ7Xdfc0peA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9wqCwKN; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9wqCwKN"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65c3ea2ebf7so2495898d50.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 05:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779105787; cv=none;
        d=google.com; s=arc-20240605;
        b=PDhra9iP8BQ6sQURoLIzRjHNGw8ktXNDCeRz2KzRrhMF6re8eiebMrAthtu8kTkYtW
         cqUKnZvXZOXnd8TV8i+y7BW6P/IgLPyvkPRkUUhgXlghiYR3q0J3sgqjE7fO9eFEM6x9
         rDWKQtDnxaqAAwXQnkqQnJ8MIrhBjuYDUIUNkIVx8eAboxrPU5KFYo+Hs5m3F5Iu3IUW
         WQ0lfSJJH0V7lq467Wo1uwMbp7F8471sbjWOoqv9ifCyr8xiS9LUY22PNQ16QdLlrEhZ
         NfJXkSwAw3Es+fdjiAJi5kjWPnjX+36Deac5DeuhmHiu0x7PPVyvA71QOWzwvL/Go9WJ
         RQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nQfhxPsXqrqiZeeyVw9wkJXgorhextrPmIU5IhGc6HM=;
        fh=XY394nUe/8EPlldWwyOcLtNInWCjAcnxKTVitFb2/mQ=;
        b=XrcOkzfZ8A2gK0XceLo+42X+PdCyo/z3+0UKtoXlSWDANnsIanQPAwgtYPv2ZJnl0c
         6M1cXEIr78iAI7PhS+V9pe0JfLH/mRQ+UDcT+K/imzN2yHZiHVxwoXnLRfPAD2pO4ioW
         dBAfRu6gh73L0Vx1jZfkcgAjNyztnKhXZh0O1eOCZ0368SFL9RujRH8reSZfjJrSL7Nr
         IUhgPDK+sFz6uRhEtZt5sI0vLiQ+/7706kQu+pxrp+N2PG5O9q8bdns13DnH+tiK6R92
         9vIi9HPLDSsAGpoAi1IdzrlEcd1Y+wtZQehT9q6g7l3mDEvcBEjvZ801QeApmGNfCp2b
         bYDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779105787; x=1779710587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQfhxPsXqrqiZeeyVw9wkJXgorhextrPmIU5IhGc6HM=;
        b=k9wqCwKNs5fou+RJaGyhXcmC8nb5lMXspADbSPivjmvVgJ3GpyWvusun5LaKSGKWDT
         dIc46FYjxAGdcGjG/kAKNx+HQRIx7J1zVuFLgVhs+ozKFu1pO9aDJpUu1qdcWmPZp9Tp
         YwOQYNM/NPX4qC3yibG+asLbVs0VkagZEf9sYYjBPjENc/DnRKUa/u5vHjbpjSmzfVoo
         Iqo6IqsadjAGL8nDGsUhaanXpmcHltsthxTiXOVqfE/51a4q6z8/EcVypvsgdFeAubSJ
         hLkp36jXENOTesndLZ8UuWpcBtX/YC46CVL0afDFFrqlgeiCl84Ve14PjqFDx+YhiilB
         LE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779105787; x=1779710587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQfhxPsXqrqiZeeyVw9wkJXgorhextrPmIU5IhGc6HM=;
        b=Mn47J/boThZNDNInrD7KIYA4+JyND9ig/cC5jHAC3evSqYQ7kxhxDr5mCSk6kd4/aU
         7gy29TSWK7gdaWaGnTMlVyOLhEvrXKr8dtOBc7XoQZaXHh2jzNqyEn1b2M90h1nQWSgU
         d9bVbx2ajsTrQIphxSwJDbhT+2LGbfYSzkoYn0QDIkQZNXISmiCnoounJHsGZ5UUq4sp
         rtt5uI9oR4rWCmPrRkp1AP5er0pTCk83t86bzPOPLq9b9C7HudLc2aVAmN3LlwskGOEa
         Gg2xJK7os5ZLyJzi3VN+3Q6Pp2hUyEHWGKTAJKyvdxWTCjavrbINTSDgVdZWqlGIcQcl
         mAFw==
X-Forwarded-Encrypted: i=1; AFNElJ9jmekrmjljdpZOqriVzQmIwNexQktaalaSgOCmUwP2/RpwO22Qx8Qr6E2cWraDRWreTOeAYuSqv/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMYyPc1i82LabM9GtSvGB1WlYZPl4yyJ4wGsSpcpWBvq4cLYF2
	TRkXkKVquobtmGGRG745wyy8Kb+4v6N2J8DlEesdmNLCoBhR1HvXbTOFUr8/Fvi5BKIcxmt1HSp
	aKGArMFHFtAKSOj/9z0hjbJlrgXpFElg=
X-Gm-Gg: Acq92OFNUSg2S0lu0cYrfuzW3q4bzJ45SkFX5dxKAC5Ez+KooN5kKupkeU1xNHMdrf/
	PQ//zil9d+SZcVXJ2ySNdPPquJrOvdeywYtynqi2oSS0j1ck/R48EWIrJuhDLYaFXleXj8zE7OM
	tw42+NhFRGy8jLMJ+EDMeY/VPh0KrAtkmhvNR2v6HQqTmil/ywlfq826iCXpnZtGS2zJ6ggGma6
	X1yyC2spIodRGBt3I0mtZFIAV+yDpv5KiU75HHx7C25/l43+1dxl7NWIGrwnRV+EqGKECmA9QFL
	Bx2XujCzxnFOGqp9ICH7iTo9crUsB3wF5m8EcLhpA4ozcp1H
X-Received: by 2002:a05:690e:d4c:b0:64e:d622:9d1a with SMTP id
 956f58d0204a3-65e22663ef0mr13926928d50.4.1779105787361; Mon, 18 May 2026
 05:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com> <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
In-Reply-To: <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Mon, 18 May 2026 14:02:56 +0200
X-Gm-Features: AVHnY4KJe2qI5pXNXCOzwBarOTRKtwJTNVIpdIJzUsAV6Iz4wL27sHKB6tNYDng
Message-ID: <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 1:58=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/16/26 13:06, Julian Orth wrote:
> > This series adds a new device /dev/syncobj that can be used to create
> > and manipulate DRM syncobjs. Previously, these operations required the
> > use of a DRM device and the device needed to support the DRIVER_SYNCOBJ
> > and DRIVER_SYNCOBJ_TIMELINE features.
> >
> > There are several issues with the existing API:
> >
> > - Syncobjs are the only explicit sync mechanism available on wayland.
> >   Most compositors do not use GPU waits. Instead, they use the
> >   DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied to
> >   DRM devices means that compositors cannot consistently offer this
> >   feature even though no device-specific logic is involved.
>
> Well the drm_syncobj is a container for device specific dma fences.

Not necessarily. The DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL ioctl attaches
some kind of dummy fence that is already signaled. I don't believe
this is device specific. That is also the path that llvmpipe would
use.

>
> What could be possible instead is to pass an eventfd into Wayland, but th=
at is something userspace needs to decide.
>
> > - llvmpipe currently cannot offer syncobj interop because it does not
> >   have access to a DRM device. This means that applications using
> >   llvmpipe cannot present images before they have finished rendering,
> >   despite llvmpipe using threaded rendering.
>
> Yeah, but that is completely intentional. You *CAN'T* use a dma_fence as =
completion event for llvmpipe rendering. See the kernel documentation on th=
at.
>
> What could be possible is to use the drm_syncobjs functionality to wait b=
efore signal, but that has different semantics.
>
> Regards,
> Christian.
>
> > - Clients that do not use the Vulkan WSI need to manually probe /dev/dr=
i
> >   for devices that support the syncobj ioctls in order to use the
> >   wayland syncobj protocol.
> > - Similarly, clients that want to use screen capture have no equivalent
> >   to the WSI and are therefore forced into that path.
> > - Having to keep a DRM device open has potentially negative interaction=
s
> >   with GPU hotplug.
> > - Having to translate between syncobj FDs and handles is troublesome in
> >   the compositor usecase since syncobjs come and go frequently and need
> >   to be cleaned up when clients disconnect.
> >
> > /dev/syncobj solves these issues by providing all syncobj ioctls under =
a
> > consistent path that is not tied to any DRM device. It also operates
> > directly on file descriptors instead of syncobj handles.
> >
> > The series starts with a number of small refactorings in drm_syncobj.c
> > to make its functionality available outside of the file and without the
> > need for drm_file/handle pairs.
> >
> > The last commit adds the /dev/syncobj module. I've added it as a misc
> > device but maybe this should instead live somewhere under gpu/drm.
> >
> > An application using the new interface can be found at [1].
> >
> > [1]: https://github.com/mahkoh/jay/pull/947
> >
> > ---
> > Julian Orth (12):
> >       drm/syncobj: add drm_syncobj_from_fd
> >       drm/syncobj: add drm_syncobj_fence_lookup
> >       drm/syncobj: make drm_syncobj_array_wait_timeout public
> >       drm/syncobj: add drm_syncobj_register_eventfd
> >       drm/syncobj: have transfer functions accept drm_syncobj directly
> >       drm/syncobj: add drm_syncobj_transfer
> >       drm/syncobj: add drm_syncobj_timeline_signal
> >       drm/syncobj: add drm_syncobj_query
> >       drm/syncobj: fix resource leak in drm_syncobj_import_sync_file_fe=
nce
> >       drm/syncobj: add drm_syncobj_import_sync_file
> >       drm/syncobj: add drm_syncobj_export_sync_file
> >       misc/syncobj: add new device
> >
> >  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
> >  drivers/gpu/drm/drm_syncobj.c                      | 374 +++++++++++++=
+-----
> >  drivers/misc/Kconfig                               |  10 +
> >  drivers/misc/Makefile                              |   1 +
> >  drivers/misc/syncobj.c                             | 404 +++++++++++++=
++++++++
> >  include/drm/drm_syncobj.h                          |  21 ++
> >  include/uapi/linux/syncobj.h                       |  75 ++++
> >  7 files changed, 795 insertions(+), 91 deletions(-)
> > ---
> > base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
> > change-id: 20260516-jorth-syncobj-d4d374c8c61b
> >
> > Best regards,
> > --
> > Julian Orth <ju.orth@gmail.com>
> >
>
