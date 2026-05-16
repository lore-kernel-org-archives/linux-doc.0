Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6193D6691
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933337; cv=pass; b=ssdXTLssgGTawzy3njI2pX6XG88FzIB5OZxuliuH2jmk8wdVi9mmd3t8E3MK5EPleAkl+/qZLEhgg1vFz3igy0SjFGNRiNy/iCStCUyOLQXdBLdoCP2CjLg7ntk0f6OQ0y1x6H2jQ+OxPiRIvzwAuS6wgmhyq42qs9WNA0Ham6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933337; c=relaxed/simple;
	bh=UnZHnr16Ldb8b7+gY3OvT6xRffrGcqKrfxvcPgb6SRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nd+0dVDJtm3ZSE7nbJyQCwjCdybbpqKK/HyQBLQFLUp0COXWr0aPKMBXaFXCCQabI0/l8+ByhI0ywaw5cx20QnBHUk/CrBV61RtWAU1DLfE5CowZbue4YsaGr0D0vB8aPqw1ZWefD/Uvwog77RSAeQe08mymfU/yBZizxHG/N6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUMu2dqp; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUMu2dqp"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6563f83ae9fso1080656d50.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 05:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778933335; cv=none;
        d=google.com; s=arc-20240605;
        b=Okk9iKoME8VLy2oGGLNnQ5xeWXGftQ2pQEAqambw7S15qJQYqzSlP0yd8rPcp0AC7p
         /ETHjh9oanaO+KZJeLhf88+nRL+/bxs7mi/QQDPoRQQ5U+iB1Cip9CCH23tDWDU93cUg
         60Lroje8lEfLIlgo/khxdKfgAshNsBytmjvAPRx2AnIEY5v7brCnChO6HwWwu5nBuRCr
         8g9Z5ABGZIgeZK1UsPNMKWIdWxJWKpr06y6GfCGqmBkiO/tzXvjiQvY7foVTqYLFkT50
         C1iAcJnYJD9LagCzIceBmtT7ACmgFDj74IHh/0o6WNTm0i31I+WougxJsnvy5sgmgoyq
         /iJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXKN0MkYU+n3rTPZHnEN2kaQtyY3hF+mGwCAYWY3s6g=;
        fh=l4YCxDTiUYvZVAHiP+uoVtSp8iCpD3YFi2LL9wJzVqU=;
        b=eDs2a4CcmL/eeqXj9ckOxgkzIBmr8kLa3WciPXSo3IkMKS4ihXX8dMxKnsT1kyPylJ
         LcHp8p79+23q9dYqRLkFq9EuQvUzYbAf5EOTBd1mR1S56SYRSiAh3yt/QtvqcwpE1fXM
         gdoLpCF7v0KLQqqH738M95uh8dwHM8Kj7wRjdK8v9WLFlTPW5AFXds2DEM7ok3WFurl+
         wcicFdJ7b9C3zFtXZd6VEWzwkkaltt5MJL+nFF66IY02C+Eds55DjWQtWn1zWeWkCblX
         KxgBeKh6ngtFjTbPkuT7G89RCF6RZ989GQwEOxsdB3+q5Bw2DqybLS5UwK43x2ryW+KP
         3H+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778933335; x=1779538135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXKN0MkYU+n3rTPZHnEN2kaQtyY3hF+mGwCAYWY3s6g=;
        b=VUMu2dqpcYG/XSzkhzXBHSbpFNtoHjl/UpICA4xG/acFuVpLV/UR5+FSRQIku0OFXu
         kFs9o4jDLrtti2Y8bJ+f9Exf37dHstAKNSr7B3UJc7ZyMUqvtibf3KPnlSgVgUVWFZMI
         KmTfzI9A4mWyLV4HYfqOP98okxgISzjeiPl/HiEhQG+TUJ+NeeBLn4Jiavj55gJQPxqW
         bVmHOiTMOgVtAJ8bCe7Wafl9PPzAvBLVhn4Ph/xazGLbFd3CwYLRNOv4LxxJfy2NaPme
         Haztj0m/AZ/3LcncGduWOAFvZ6SOlGkCHPO8xWz5wT20xZ0bbR4GXJy5/ZYE/QdDlSPz
         kI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778933335; x=1779538135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXKN0MkYU+n3rTPZHnEN2kaQtyY3hF+mGwCAYWY3s6g=;
        b=HZlES+1dWNCAeAvSFHuyF0dIAXDjGktTptDoNM9PS9rQOI5huSDeE+CQ0nkWR3os/V
         sevwc6ygY6fdX6nacoaiu3zwLj4qlBzhAykgC3VMzrxszJm/zsniPhbt5VeVIoeheqQN
         aPr1nqWQlzv35GRGh1oGptCAehUJcXOoaZe31UHgsrb7hlb516Rq5YpHkhGzXe1eZ4vZ
         r+twKfsAqwn1/0ec5iG6O49Vp3h/mSFNVIRHBDCOJzm4rPqDhhISuiVLnlIUAVQuIWwc
         YaG3jZbieqxMwqnd56fHXZOh90S1hT8nhOiImZfapuD5eDt9tktQSQmeXd7vlvxDccQ1
         F09A==
X-Forwarded-Encrypted: i=1; AFNElJ8mXFrhBnyCQpoDi/MYgoSFUAn3S8y00yY4Zkhd45b73Qm2UWM71e11k1vS/cT3AvdCupFkpiTh/mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKx6OJ1rfdMLAXYzGuLIFMY7aRNRiS97t965Xh2pUKcX/E+cN
	JVda3i2o7YklzmcOA/WxGLQtSGqn796sjUlrEQIMgvP+h4osFKh1s1peRLs/COHEtQ5PmfJvYG4
	ziONnVcamTkmOkc+kBWZ0/U8hcy4RoTc=
X-Gm-Gg: Acq92OHD/YaIPvGVYYvewXsFl/HJmXFvgLYx8RVejydSAtNqJMXrER3lJHMTD14XJV4
	+50r/4Mffj02+tV+t4+tgFAu1mhbV7uvatpINiGCpEV2jzuz67N2WbJCpb6xvhY9ap0yYV3yC8j
	ngGC83EUKopJ2e26RlzR6ZHSrnytXqT1hNNoywdTs1NbTi9e3Uf29TGxYYKK9bP/neTWtCb201k
	WGewIPFa502kuq1c3aiCveKRFGZshlnJ20jdvX+ErvXKbxlQGUVg9z5u9LPIAud8PqbMDIteurn
	sD63hD/WCFR88h9a+Jdzv6WLKlI5gYkEUNR3+o1j0dXZ/bvqs5k7Mq1NanM=
X-Received: by 2002:a53:d015:0:b0:651:c29e:f0b0 with SMTP id
 956f58d0204a3-65e22701655mr7274124d50.4.1778933335045; Sat, 16 May 2026
 05:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <20260516-jorth-syncobj-v1-12-88ede9d98a81@gmail.com> <2026051652-pork-omission-b762@gregkh>
In-Reply-To: <2026051652-pork-omission-b762@gregkh>
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 14:08:44 +0200
X-Gm-Features: AVHnY4LliAXwIRGSinLMXXpk0k3pE4bCMnvt3uyz5Wz7sqrJHyVxIP5cb_UqBE8
Message-ID: <CAHijbEU3+3ZoxTuUCkJx=a75_yNxt2Nn3UKU7gbS-Xf1bPqBUg@mail.gmail.com>
Subject: Re: [PATCH 12/12] misc/syncobj: add new device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 1:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, May 16, 2026 at 01:06:15PM +0200, Julian Orth wrote:
> > This device makes the DRM_IOCTL_SYNCOBJ_* ioctls available via a
> > dedicated device. This allows applications to use syncobjs without
> > having to open device nodes in /dev/dri, on systems that don't have any
> > such nodes, or on systems whose devices don't support the
> > DRIVER_SYNCOBJ_TIMELINE feature.
> >
> > Wayland uses syncobjs as its buffer synchronization mechanism. Most
> > compositors use the DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a pure
> > CPU wait for syncobj point. DRM devices are not involved in this proces=
s
> > except insofar that a DRM device needs to be used to access the ioctl.
> >
> > Similarly, a software-rendered client might perform rendering on a
> > dedicated thread and use the wayland syncobj protocol to submit frames
> > before they finish rendering. Again, this does not involve DRM devices
> > except insofar ... as above.
> >
> > As an added benefit, this device removes the need to translate between
> > file descriptors and handles.
> >
> > Signed-off-by: Julian Orth <ju.orth@gmail.com>
> > ---
> >  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
> >  drivers/misc/Kconfig                               |  10 +
> >  drivers/misc/Makefile                              |   1 +
> >  drivers/misc/syncobj.c                             | 404 +++++++++++++=
++++++++
> >  include/uapi/linux/syncobj.h                       |  75 ++++
> >  5 files changed, 491 insertions(+)
>
> As this is a bunch of user-facing code, why not do this in rust to at
> least get some semblance of proper parsing of user data sanity?  Or is
> the api to the drm layer just to complex for that at the moment?

I didn't consider using rust because I'm not familiar with rust in the kern=
el.

But even if I had considered it, I probably would not have done it
because drm_syncobj currently has no rust bindings. The driver as-is
is just a thin layer around drm_syncobj.c so if drm_syncobj gains rust
bindings it should be easy to convert the driver.

>
> Just curious, not a criticism of this in C at all.
>
> thanks,
>
> greg k-h
