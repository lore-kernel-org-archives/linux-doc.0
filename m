Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C83A1A0
	for <linux-doc@vger.kernel.org>; Tue,  9 Jan 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="EioTJ+sw"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2057f388b2dso632253fac.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jan 2024 07:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1704813969; x=1705418769; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LrLYI16OgzxKgYJ1jGYpx/Mfzuzfk7qGCLrN1GbNKCw=;
        b=EioTJ+swFa4R+I3gshoPIRJDwZIyeh06wIezGDjbaO5XLAvbn5fhf9VUGOVoBjAce7
         l18F+rGeAyU4bZXGFzJ3LS3sV2LUkOM6S9ylsYryKPT0CHeNJJ8yVzf3P2YJ++opMjKj
         ytgFCElk7/M8oM6xA18Y/z6Xs7LKee11hPJmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704813969; x=1705418769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrLYI16OgzxKgYJ1jGYpx/Mfzuzfk7qGCLrN1GbNKCw=;
        b=JHTC8SJL037kDe1ZxcSweo+q/GLjlGbePSdD2h5EuYHjnzCAkKp0n+gwDw67E7mKzB
         BcTrQTwhTEpsDeFa8peP2z7SHxXSjKjOx8Il75uPcPPS7Kx+A7xxlI73q27bWalQrP7Q
         XR1oWtkUab65zfQ51CSN/nesi5W2W+bQ8I13siY7PrPCPlBMCriUjlPykxdko/3LmIUn
         iodvwVH0wQzvdMVfBodC/6IPQBdhbOa2IHfb7sgYVQzbt71i5YhYB6t9d0lWzVzKrjN+
         YWoHSwwiB2IZjGHesBPLu73rIxSaKaIgDWfSIWUS6fsYJPHpfOkK2iOZ1TfZE6eE4ykQ
         4xBQ==
X-Gm-Message-State: AOJu0YwUaHTZ6LGDEj5oZrUZfsFAz7sHcr1uQ9+mADm/1z4oBjO34LBf
	MC43znSmm6HAue3pcqXhCu/VBiCVjOXoa31euti9+hzcvaNhBg==
X-Google-Smtp-Source: AGHT+IFmDDUKIijRu0PcUyrPxdiy93SWEgCYr7vhP/J/b/SeA02LnXFUq67GlFuakTKaGZysPkX7JwemNYknY/AAFpc=
X-Received: by 2002:a05:6870:e256:b0:206:16d9:e76d with SMTP id
 d22-20020a056870e25600b0020616d9e76dmr8562714oac.5.1704813968983; Tue, 09 Jan
 2024 07:26:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106032957.1195-1-rdunlap@infradead.org> <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
 <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org> <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
 <CAKMK7uFbjQ1apr3-XrnWTH=TwRqW_9TDZ-21QAwJtiNB5FZ8dA@mail.gmail.com> <10b6ec8a-8b58-43a0-a3f8-c6d354b71ee4@infradead.org>
In-Reply-To: <10b6ec8a-8b58-43a0-a3f8-c6d354b71ee4@infradead.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Jan 2024 16:25:57 +0100
Message-ID: <CAKMK7uHwcXq+gSBx1RdJ84OVS0BheyDJp-c7byhR7EfJ0s+qQA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vram-helper: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jan 2024 at 16:23, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 1/9/24 05:42, Daniel Vetter wrote:
> > On Tue, 9 Jan 2024 at 13:59, Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Mon, Jan 08, 2024 at 01:10:12PM -0800, Randy Dunlap wrote:
> >>> Hi Thomas,
> >>>
> >>> On 1/8/24 00:57, Thomas Zimmermann wrote:
> >>>> Hi,
> >>>>
> >>>> thanks for the fix.
> >>>>
> >>>> Am 06.01.24 um 04:29 schrieb Randy Dunlap:
> >>>>> Remove the @funcs entry from struct drm_vram_mm to quieten the kernel-doc
> >>>>> warning.
> >>>>>
> >>>>> Use the "define" kernel-doc keyword and an '\' line continuation
> >>>>> to fix another kernel-doc warning.
> >>>>>
> >>>>> drm_gem_vram_helper.h:129: warning: missing initial short description on line:
> >>>>>   * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >>>>> drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'
> >>>>>
> >>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>>> Cc: dri-devel@lists.freedesktop.org
> >>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>> Cc: Maxime Ripard <mripard@kernel.org>
> >>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> ---
> >>>>> v2: Add commit description
> >>>>>
> >>>>> base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
> >>>>>
> >>>>>   include/drm/drm_gem_vram_helper.h |    3 +--
> >>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>>>>
> >>>>> diff -- a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> >>>>> --- a/include/drm/drm_gem_vram_helper.h
> >>>>> +++ b/include/drm/drm_gem_vram_helper.h
> >>>>> @@ -126,7 +126,7 @@ drm_gem_vram_plane_helper_cleanup_fb(str
> >>>>>                        struct drm_plane_state *old_state);
> >>>>>     /**
> >>>>> - * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >>>>> + * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
> >>>>
> >>>> Did something change wrt. doc syntax? I think this used to work without warnings. About this 'define': we don't use is in another docs. Can we leave it out here or is this the new syntax?
> >>>>
> >>>
> >>> There are no doc syntax changes that I know of. This is not
> >>> new syntax. It has been around since 2014:
> >>>   cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
> >>
> >> I had no idea this exists, thanks a lot for this TIL :-)
> >>
> >> I guess the issue here is that this exists, yay, but it's not documented
> >> with the other here:
> >>
> >> https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation
> >>
> >> I guess a patch to kernel-doc.rst would be great. Adding some kernel-doc
> >> folks.
> >
> > Ok I went ahead and typed that patch (just we don't waste effort),
> > just waiting for the sphinx build to finish to make sure it looks nice
> > before I send out the patch.
> > -Sima
>
> I sent one a few days ago:
>
> https://lore.kernel.org/lkml/20240107012400.32587-1-rdunlap@infradead.org/

Could you please also add documentation for function-like macros,
since that's also missing? With that acked-by: me.

Cheers!
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
