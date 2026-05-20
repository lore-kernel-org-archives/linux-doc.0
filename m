Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B183C661A
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277575; cv=pass; b=MqatEMrORR3aqLuhJRpBC571AuFY01WERpOQB9SbAHysEs3+mKf299YJF7HZZNmoSfOprzp04a7Xf6zg0liHsDJ7z1+yFLHUGu7BjMh+fNJ3C9uejqrru+o5Fz+4z0dT94ESt5Kx+zatWTW05GgEOP7Yzmt9/5Wazs9ETHpbQOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277575; c=relaxed/simple;
	bh=mwQC2VpgPcAOO/eSiXMuOlKGLERJ6tVL0QZy3DdZeqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c74um4Ilhvf0C7fWLbaHy5T4EXdu0Jcbxw+z4cVYvg+hthc8//aG7hYO2sGj6nO6kcwvbWOjlixkeZ+QAK6rg5OWQrermcfkCx/UVdtjV97TX2QkUDjVc6r055ZTj7lmM7Nf9Zu1vHS17B7PW8aAJ7W8dVEg7AjLmrjtd2JAUkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLLFzq1N; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLLFzq1N"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65c5361142fso4643796d50.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 04:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779277573; cv=none;
        d=google.com; s=arc-20240605;
        b=cLXdjygXb+RJT2BrXtxByA4c2zn+2Mv+6Vsa2ZUGAYrPqCxJwjvliAsx3YZ5K5dJXK
         Q50nq1kxsIO7co3Au7gDbhj8BXdrYFdhGGXfYq9dph7TF4XVwh3PAQCRhqLYtjMozjRz
         pUwxoYBsRJwcBcr4YBkqci49e9OJWhzdavwBeyNka51DeValectfgiBaPH/l5dEvxvEP
         B1TGhAd21JE4bW8ABKyWBi1kMCKzVwHqk5MikpvI5um1T04F8yBhzRXyyS+zuABdDokE
         g17USnWxqC7ox8dpksHoXbRosgePnCmr02REb+vULagzbWAUSX0neLntfUhr6AY/8Sa0
         05vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mwQC2VpgPcAOO/eSiXMuOlKGLERJ6tVL0QZy3DdZeqg=;
        fh=a43vw78E8asFGEaLWKR7+cE5WLeik45PNet4MydxmM8=;
        b=bEUrJVzezM4lG9peD8gdQd/CQo2zA04lMTct5CLcz1Ty3hrAk2n1HnBtstiiw+4uqH
         fg3jtG7+oI8FRJYEaEofGk7YQlABct84aY4/71JYW4kYemV+zP0Fu7djw3RPgIgnaprM
         GZnUJFCOeqeJrsCtdqga5joY77nMq4XwiS8n6RUazzr9EsB5XXGvdoxsKbXN3zJhY6Ud
         2wJpZzqsvZoKDHYsapAdVJvPARdHGdYBPzJ5sQNsiNa5qao6mIPBjONuw3nRizzVFjbW
         sEQ8dUAwIcwriArR5F2M+66ZorwqSQhKW2PgyF/M2oZTLiuNhhTIp1ZH6gZtkzfsK/Nu
         uA9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779277573; x=1779882373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwQC2VpgPcAOO/eSiXMuOlKGLERJ6tVL0QZy3DdZeqg=;
        b=DLLFzq1NI/jlE0KjxAF+xBgYr0bijFFLMLnQXRF9R+yg2s3RjBXBZQNjb/M41Ql3EQ
         +ZheyYRDDN9kkHa9dnnqjzyXzQj/lZippxiK1tSuOwMhmI2qy9lMle+0b22N0RKRFbu7
         lv+r5D+s6/LoQMztNtN2U69qRAjas2hZcCwd7hgqtUfMh+fIafWtQKACTWfQrn6UHGdy
         Ru4qqJpuDWEMTgAfRByrjP2/ckcxnn3QmrX/lMngpYgC4lgHEVJ2w3xGDq20PHZNs8O5
         g/JaTcX5f093Iga9G9Go7DUID3PH1u3ZyXMSGCnglb1l46M+eAwY/p9mJXVmhrxjRmv/
         U52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277573; x=1779882373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwQC2VpgPcAOO/eSiXMuOlKGLERJ6tVL0QZy3DdZeqg=;
        b=OicqU48Dsi9QHw0h26VUHX4Yo+F2DF4x3j4Zrs9+HDYBgRLOB+c5CWtVoDouGDuaCX
         cdFhDaAUb+Snu/iwVRYB8i2M7XZjfu35dFNgZYl8AR2BGdKK4dFbih/UOoNNGXSiJLAn
         mMrbYH/LF6c+cnJftwen434DENjW5S1jObaapHzVfhWtvLnRSwNQDCbgSFaYzQhkA6oK
         V1giUE8wVg8UFp9xzy468QOQBTUwSSfAi162Ljfnao+fc2Bo1cn6DcOJ9iuAUsWPM8AC
         IC0iMgAB4CBxH/EdypR4t7tlm4thlD08blOmnegEBBkifEvtliYIoeqzCt01ZPkSxPza
         5TCw==
X-Forwarded-Encrypted: i=1; AFNElJ/I4B9YBvzVRTY23IJRdRvJVfqK4IflW6uVhQG1ExNRZBmFnNykysU0lCqzzPbfK3BMjwts0TUrkoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRN41p+ydrO2VabaFmD6HG2ZivUKGJQNa/Z5mS6r6096AZM7Os
	+BPhQQKi3d/GJDv2Q9TCSIb1DAOJDrzgTOj5pxbnzTaOvDf6d/I1epAh6QGSy3xEG//fBrS7SOG
	Zfhz8qVO12Ou0BPdGmbwE5Sid4PTll60=
X-Gm-Gg: Acq92OFAYANQ94ThfV30Cz1Xp1B5hRcbftlqhUOT32VmJt/V2bpm5VsjBnHlLhHlhPw
	t8CjihieMarQdExOi0enva0i2XuoqZctroP8ly5qD5pLq9m448BCapaaVQZvLSj6c22de1f6onZ
	80wLDilrCvG272oFOQ618CXHgMuPljH+yGWKHy7MHENoM0IC9YOMhU/wsQaf39LXi0K9N2NzUYW
	IkPPiejpiLUUQOsGVSBPZq7Lt2tESWpOX2cYVsje8F5gjJqEpJkv7HM/rWHnvfc97KK2LENhOOr
	eGESrnqNzpjGnruXecDmsDd0Jzu0AI/DvRZiW1Vf0BeLSaKA
X-Received: by 2002:a05:690e:1487:b0:65e:4b06:f89b with SMTP id
 956f58d0204a3-65e4b06fd2cmr14416343d50.51.1779277572905; Wed, 20 May 2026
 04:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com> <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com> <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
 <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com> <CAHijbEWHp960qvZFoK7+9ppHAqkAR7=UQhtMUccqWzGd_pFPQA@mail.gmail.com>
 <5ee6d5af-ac48-41d7-a19f-e08a3c5b7d19@amd.com> <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
 <dff60378-4e47-4753-8878-feec6e1c2690@amd.com> <385a4d4f-fe22-41a7-8d4b-4dc6bc9930d3@mailbox.org>
 <1e94106a-f72e-447e-9885-2d2cc8f8e722@amd.com>
In-Reply-To: <1e94106a-f72e-447e-9885-2d2cc8f8e722@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Wed, 20 May 2026 13:46:00 +0200
X-Gm-Features: AVHnY4JZYLaQrAuUqg_r9R4xrt_7B8lof_FLZgmpinm1lpd54PV11HWLkp9qJk4
Message-ID: <CAHijbEWSnwm5_uTAbRDYOkMFwu+X3_xGHxjHyK-XeaO15KTGOQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
	Xaver Hugl <xaver.hugl@kde.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 1:21=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/20/26 10:13, Michel D=C3=A4nzer wrote:
> > On 5/19/26 18:00, Christian K=C3=B6nig wrote:
> >> On 5/19/26 17:31, Xaver Hugl wrote:
> >>> Am Di., 19. Mai 2026 um 15:29 Uhr schrieb Christian K=C3=B6nig
> >>> <christian.koenig@amd.com>:
> >>>>> 1. This series makes the ability to manipulate syncobjs available
> >>>>> independently of attached hardware.
> >>>>> 2. It makes it available under a consistent path /dev/syncobj.
> >>>>
> >>>> Exactly that is a big no-go. This has to be under /dev/dri.
> >>> FWIW udmabuf is also under /dev directly, but I don't think any
> >>> compositor developer would complain about a different path.
> >>> What are the rules for that? Could this simply be put in /dev/dri/syn=
cobj?
> >>
> >> The syncobj are actually the DRM specific way of doing things. The gen=
eral kernel wide way is to use sync files (see drivers/dma-buf/sync_file.c)=
.
> >>
> >> But there has already been tons of problems with those sync files. E.g=
. they doesn't support your use case at all since they don't have wait befo=
re submit behavior.
> >>
> >> So there are already ways to do this, but the Linux kernel so far told=
 everybody that this is forbidden. The DRM syncobj wait before signal funct=
ionality is much better, but then basically the second try to do this.
> >
> > I'm not quite sure what you're getting at here, just to be clear though=
:
> >
> > While the syncobj Wayland protocol extension supports wait-before-submi=
t behaviour at the Wayland protocol level, it doesn't need or cause wait-be=
fore-submit behaviour for DMA fences in the kernel. The usual rules apply t=
o fences attached to syncobj timeline points. The wait-before-submit behavi=
our at the Wayland protocol level comes from allowing submit before a fence=
 is attached to the acquire timeline point.
>
> Yeah I know. I'm one of the people who came up with the idea of doing wai=
t before signal this way in the drm_syncobj.
>
> What I wanted to say is that a lot of people used the dma_fence to implem=
ent wait before signal before and got a bloody nose from that.
>
> > (It took me a while to realize this distinction, before which I mistake=
nly thought the kernel's DMA fence rules would prohibit wait-before-submit =
behaviour at the Wayland protocol level as well)
>
> This is what surprised me.
>
> The drm_syncobj implementation solved the wait before signal for the kern=
el, but my last feedback was that we basically just moved the issue to user=
space and Wayland compositors would have quite some overhead to implement i=
t correctly.
>
> That compositors now use eventfd to simplify that was news to me but make=
s totally sense in hindsight.
>
> But anyway, we need to somehow simplify the drm_syncobj -> eventfd usage =
in the compositor.

That is not the only usage in the compositor. Compositors use all of
the following operations on syncobjs:

- creating syncobjs
- waiting for points synchronously
- signaling points without a sync file
- querying points
- transferring sync files between points
- exporting sync files
- importing sync files

Which you can see by looking at the userspace code linked in the cover
letter. Bypassing the handle in one ioctl would gain compositors
nothing since they would still have to convert to handles and manage
their lifetime for all other ioctls.

> That requirement is perfectly justified and avoiding importing the drm_sy=
ncobj fd into any DRM driver should actually be really easy to implement.

That is what this series does.

>
> Regards,
> Christian.
