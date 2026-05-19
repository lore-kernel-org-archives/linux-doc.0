Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F7F348C47
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196779; cv=pass; b=RPnxUUvP9ZCtq0sVSvssH0SeDrWLvaIFkh46Oa3Gq6QGFJlYx0sBgmJOC3QaBes9RN0bIVl9NzMDZuh261SPIVKtYSw3hjKZe2Yq1P+3Z2GvMrzdPdTIGVttUPXO+Y4upcLNu8i2DoVC07+isrtP6vfZm6LGgQXTAyhM9HdnmXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196779; c=relaxed/simple;
	bh=d+tNP9HiaB7786A6QlxY1NJuf5fPzSCRaviYw3QklB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyukSmq826mPfeYXrFc+2Ww8FfqI4slwcL+25P2pIQnirtWgDIlPQdaBmGqHM9QrjaZnJma8twCu1GlUPJ30Qobq0jR3vtqeHj8qVdablfbZiROwS/ZkvUakqw2+ElGXyj+rCxFcnUBrOQXN05UJSL8mwck2oGj8FNnCG7jI1sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qruJVos6; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qruJVos6"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65c7a459105so3725270d50.0
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779196776; cv=none;
        d=google.com; s=arc-20240605;
        b=iuYHbIVufhJPmZs/ue7uRRBhP8Ol6j3rOKNOfv20Z2a8WAJmvrXadt9ExOtP/pvIFs
         qOK1tZX42WvTjmPiMOT0rU+7eWpII1Wi+TK/qHcW0FDS970+LxvD3Ht/FDcZPYWveCx6
         GvRD0MrfKXnScpPRom9Jkt1v4VLPTqi/KdyU3CWmpXk90TYWIofRXbSvOnMHVuJKpVIA
         5lHKNlIxHfCU1LpErGkedrOWYlqPFbExk2ZKCNELYsn8EuDL6jfsmrwg23afhdRd/CPr
         6qFBqIc7EoV9+BIZ9YABJc/9AzOk3NOIXMecVEO6ZlLa7vS5tjLNHOlTYJuyCIRKUGeR
         rgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d+tNP9HiaB7786A6QlxY1NJuf5fPzSCRaviYw3QklB4=;
        fh=XNF26nUeoj3CH7fGhUcGoPVtE0XP4jcdMwZ//QKixVU=;
        b=aNFXKbhRPvsBuntnUiSJq+XHvxZWQLBupZXLA9m1YMe6HU0SHDu6TGAo2bZGegodSO
         AySkEwjyfzJSZQao1R2Vg3FtlbazO8FX+ftrFUVhReBZwC5FpUJJGrnJV330Hi5lRus/
         mcPXAsdzTuI99bZKPIC2P9hPYxAmcpWjqMIvm1xurqta4T4W7qCjLsqXWLtUnS3wFXLS
         RSPpVNaFHhlGE6RRMz+6k/OgCwZCnAwIYehEDYTJnpJo4bD+8N/rymQ3KcePNpQgIK3y
         eRTRggOp8yjOXRmipmmwKA2onYBnImipSI2oqOj3PNccC2CbgjhxOiNSfCBb/SvOc9gV
         u5/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779196776; x=1779801576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+tNP9HiaB7786A6QlxY1NJuf5fPzSCRaviYw3QklB4=;
        b=qruJVos61xVMVt3WX1+AILX6svsASTmEAKwudnn8sC+UCx5fors56J0PlNIzAgHta6
         moUXR59K9ZKzJL8xMstpIwrubZmzxgABpPjBKIdd/8qfFNNxWryg9EAPgNmQYSDEdRGS
         uCER9DMkUViPoJr+O4RTw5yRn6zmFiGnTVVtJSWblJ/IYs/docuEaPOg8KhzMXPKO155
         K90Eho7JA5MBbpSCRbLDL69DL4I1fJZTKUIeOSlehXMIUnL9pAETv5HDV/nDJZbjYBlQ
         TaDSsZOeG0QNWTu/RIbHES4ENS/ri2Ng6xaVmKZCUWrtuJCsmq5u6agkGDVC4jSZVTwQ
         ho+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196776; x=1779801576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+tNP9HiaB7786A6QlxY1NJuf5fPzSCRaviYw3QklB4=;
        b=HuyohRkJ2oz2xHRgISca3nvahVy7+cmah+XptewQkxEi6u6WLdQQllcltofjW7vCMM
         0N2IvZMe5s9dMBXYYQ1MfZEUYQbQok+b5l2X2NpCCfnwQVl2ABciEx3yGofCYQJ2E3BX
         xvAj6Ew4pm50+rfb15eULiUk39sfx+AHZJLVAWJghTsLbExFg9vZ4v2X+v1QS7CRx9Af
         WApezdpDiRtN0qDsYKTvHU013ynnMUR3XNm+n5wCZXpbxLojHtIXDCrlsixyI9rQGadf
         mhh2niiB6O0EMVym4lbmZmJ4GdiU+gL/mTBNAqRB4SBN9KbFLbWGtCNFOqOTdxVY0JGx
         UmKA==
X-Forwarded-Encrypted: i=1; AFNElJ8zMqDKgNuMQNohH8aMIQGk7Vs9J0IWVhMNmhm6Z4lPYcVyIioFzOeTO/JlvyQN3CTZfZwWakZ11cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtNVo0pNaQJUccB/jybRMF5o11dXQ0zd3uIBBa7/S2vtMKfk20
	JXN5ZWX2O68mZHXw9fVjhvzpOGrG+ILm/MsggbiXVHmAaBeUyYnUkrk9dpqx5OI/ZHZUWJG4Z2g
	K5ANrasWJcph3Mi0CZv0OAqUM9/J24Nw=
X-Gm-Gg: Acq92OFICJ3+nlsVzqQFCNOLN/PXaU9EBMUFayqqoB520jeyLFUfWuPxk+9esSctK5M
	AgYbQUfymgHZkICfRRQ3GQ6yv19Y6gaOkInXOy6C3CYn9HC8F/00O0F6KDLUaVjzNCc8LpSQBV0
	UdXiehgGcULrrwNTldchtzp/A3j4JZVbUqMFG6iBh/x1xRZ3zT4c7sqYpwDur0VWNuSWhcKRdWB
	aurs5/HptjtpTkrYuHuGvepqNo1MNcIIZ6se4ofFwSA+V2Bjvqf+kszFQ+gAjRueEOtRB88Ylch
	sB/EchgXfsnZeKy6TbA33xUJXmyaXwU4sUKIueYNM/jPGk03
X-Received: by 2002:a53:d005:0:b0:65c:6f05:ae25 with SMTP id
 956f58d0204a3-65e216d83d6mr14649417d50.30.1779196776397; Tue, 19 May 2026
 06:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com> <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com> <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
 <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com>
In-Reply-To: <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 19 May 2026 15:19:24 +0200
X-Gm-Features: AVHnY4LOerIoiS4EJslI_YZhkER_543_y_7-NPEIgz5Ez-WK_fluwXi0cmnkr5s
Message-ID: <CAHijbEWHp960qvZFoK7+9ppHAqkAR7=UQhtMUccqWzGd_pFPQA@mail.gmail.com>
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

On Tue, May 19, 2026 at 10:18=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/18/26 14:58, Julian Orth wrote:
> > On Mon, May 18, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> ...
> >> It could be that we have eventfd integration for that as well now, but=
 in that case you could give the compositor an eventfd instead of a drm_syn=
cobj fd in the first place.
> >
> > Yes, all compositors use the DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to wait
> > async for the timeline point to materialize and/or be signaled. The
> > wayland protocol was the motivation for that ioctl.
> >
> >>
> >> So as far as I can see using drm_syncobj for software rendering really=
 doesn't make sense, eventfd is a much better fit for that use case.
> >
> > Using eventfd has some disadvantages:
> >
> > - We've just added syncobj support to vulkan:
> > https://github.com/KhronosGroup/Vulkan-Docs/issues/2473#issuecomment-44=
46117280.
> > For eventfd we would not only have to add yet another extension, that
> > would realistically only be exposed by llvmpipe, but also every
> > compositor and every client would have to support both extensions.
> > - Similarly, a new wayland protocol would need to be designed to
> > support sync over eventfd.
> > - Eventfd does not support timeline semantics. Meaning that you would
> > have to send two eventfds over the wire for each commit, one for the
> > acquire point and one for the release point. Whereas with syncobj you
> > only need to send two integers per commit.
> >
> > I don't see the advantage when drm_syncobj already does everything we n=
eed.
> >
> > You seem to believe that compositors would not be ready for this and
> > from that perspective I can understand your apprehension. But I can
> > assure you that compositors are already fully set up to support all of
> > the usecases I've described: The wayland protocol requires the
> > compositor to support wait before signal.
> Yeah that's much better than I thought it would be.
>
> And that eventfds don't support timeline points is indeed a pretty good a=
rgument.
>
> But I still don't see much justification for creating a /dev/syncobj devi=
ce, this is clearly something DRM specific.

The justification is given in the cover letter. To repeat them briefly:

1. This series makes the ability to manipulate syncobjs available
independently of attached hardware.
2. It makes it available under a consistent path /dev/syncobj.
3. It removes the need to translate between syncobjs fds and handles.

>
> What about using VGEM for this?

If the vgem render node were made available unconditionally under,
say, /dev/vgem and DRIVER_SYNCOBJ_TIMELINE were added to the driver,
then maybe that could solve points 1 and 2 above.

But it would not solve point 3 and it sounds like a hack to me to have
a render node available outside of /dev/dri.

>
> Regards,
> Christian.
>
> >
> >>
> >> Regards,
> >> Christian.
