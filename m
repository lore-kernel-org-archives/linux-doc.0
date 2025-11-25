Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFF32824B
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084412; cv=none; b=Ok5c1+u0rJlRDyqc/T1kf8uVBogaJCNf9m4GU92F0zgY1dveKx2fa3DX6PH9LHtCtGb9hjNpqUr3MYczUhg5JC7pkTUD7ak0SyC/MghyYYJGJ1lb6gwzRx5e/9iE/zoqFYOjm4yAy+H/scnVMLNNmJAie5tn9NHwjWw6zUhnD9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084412; c=relaxed/simple;
	bh=GGkXuVhW5d2HmPdrO7UtjfY83b3fGHQxRBrk96HIXmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGoDHRHxlM12oXLMxZ4nl5K9pMF3u/nASxARlakxm+YQcc39A7loFYm3LQFzOtpyo153dxE6khmcPXqyWhp9rZMtZDjegBwtsF4IZliJnnknxSB9A1Xda/ktI0ed8Ij/akXsCm20oYzJ+3veALzB2X4IwKw4fAoyqgLCAzhn7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C3qgYV9V; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C3qgYV9V"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b739b3fc2a0so165684766b.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 07:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764084407; x=1764689207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCZdld6CYrWFXkrUxJ5abCqUL/Pa1DX9edqJLOysax8=;
        b=C3qgYV9VN8ZjK4m/5GRagJtt9FGG+yRqcO5GfhKOuesi6NHSb5/8uC6zS3M3/pAV5g
         kwLVzaKiKmuNH4IDKShpzgsgVQSrN0XSltsy8vVsRr5V/Ou4Sn7wFcqdOhRJYpMnbWou
         yS5gfsAjuQEamvphMRMr66eSYhTbiZ0KaPU4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764084407; x=1764689207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCZdld6CYrWFXkrUxJ5abCqUL/Pa1DX9edqJLOysax8=;
        b=HZU5P7RQm64rmUGtaSyML3t3K2+ix7rQZ6e06rIaFxYmMH9w0gomixM9NFwnfwBbA/
         ClAxJwEwGW0Gwj3tII1lVJsuOy0mJb8RWlq78JThpzySNq+hwrEtMkQnvdUX+Ef3eEg9
         l6hg7OLw6Ef6MmOpNMe5JyoLg7ENOj0WkSEoD7Sd6XAd5+DdOUKdbIm94YTBn/D1f7GQ
         5nUJo6OcSak9z9OaepzR2mMaAZZZ7t9vcR1+eCAOO6yCaBw8ad0BPAGaLIgiJajb8kQO
         Lqk6UPDkS4KdbLiDvG+3lj+x4t90ORirsKO9y3jI75Z280Rh+rej+dQSP4ku+vyy249a
         TFXw==
X-Forwarded-Encrypted: i=1; AJvYcCUlceOm73uYo/bKz/v8vvgMd37Mlvksxj/shnikIFVRUZfob4m6IrYysKVkmVY6j8n/qoxO3/kuCvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdZmpFf4fy+vuj3AvNgoGd7mkOUrs+KBChvKz3BxGsIVjtaGHx
	o75VS4ibklVbDbSzHjXBHuAxtLUkeP5coArtzBObFehwFecCNiifW2sV1tzApM+zWOGJMsa/ax4
	J7d/xaUdM
X-Gm-Gg: ASbGncsLz1JoXQbqT259Pz9s4WbArVep9FTLQLLNjdWsKOi3M0MoPsg1Bc4yzWFvvZg
	s9puSmx6XzBHzhfLzaY6uun/lwx8JptSImU+3Z3YGZAeCd26NOO3j7dq2/2lOdh0k1TW9268ICf
	cN0ZA4w5+Ly2PZRZizZglelDmkSy99wYsooTrXDxL7cJ8h/ZobHPyIroPDsdJcdR3m2Jj1r/hHy
	BVls7aqHJAqvaY2mQuSRzMlfy/QPRswgS0vN6QCzscFomxeDNcY/+6Zdr0AgzGQYNBJL0vpEtl/
	zXB8QuSFQwViqG+tECQGfT6reM6E+sRsmfTsl8a/j8+DfMNTweWn4JeFZS0Sp2s+7esyDSC/sBp
	2bYbjfNyn2aIrJa1Ui9myUlRgGQD+9fCihE5Zlr4QWHEacymwYISPiVAGUZvOY8OMIDHidjgX1W
	CQBRHg4Jrj1R5IjHBExHOb/H6pfSTgTgDXg7SC9vAkH+EmnA==
X-Google-Smtp-Source: AGHT+IFWJ3g7IbXo7EuYtOWCzVxiM/RjIXvZ0yh24ZsUW2/hPnmbCrowt9DLuElSRZRYSz2Gy2u40g==
X-Received: by 2002:a17:906:c142:b0:b70:b700:df98 with SMTP id a640c23a62f3a-b76c5356501mr323557366b.5.1764084407020;
        Tue, 25 Nov 2025 07:26:47 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b766d386665sm1318041566b.53.2025.11.25.07.26.46
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 07:26:46 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b31507ed8so4793189f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 07:26:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWP2DasPnCFd65KD9FSEj/6eURLBF5ZYfH7NTVI7rp+BrjNqQctIlYfWr/QNMeyuiPw5b7AMLHmrGU=@vger.kernel.org
X-Received: by 2002:a05:6000:381:b0:42b:3ad7:fdd3 with SMTP id
 ffacd0b85a97d-42e0f21e953mr3395597f8f.18.1764084405547; Tue, 25 Nov 2025
 07:26:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125130634.1080966-1-tzimmermann@suse.de>
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Nov 2025 07:26:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
X-Gm-Features: AWmQ_bldhiBpRCqVYkj0GufunmE0LiqT8gw4vCTv4PiT8j1h28du9Cx4NWXFEj8
Message-ID: <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com, 
	christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de, 
	mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	jason.wessel@windriver.com, danielt@kernel.org, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nir Lichtman <nir@lichtman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 25, 2025 at 5:06=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Remove the rest of the kbd support from DRM. Driver support has been
> broken for years without anyone complaining.
>
> Kdb cannot use regular DRM mode setting, so DRM drivers have to
> implement an additional hook to make it work (in theory). As outlined
> by Sima in commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for
> atomic drivers") from 2017, kdb is not compatible with DRM atomic mode
> setting. Non-atomic mode setting meanwhile has become rare.
>
> Only 3 DRM drivers implement the hooks for kdb support. Amdgpu and
> nouveau use non-atomic mode setting on older devices. But both drivers
> have switched to generic fbdev emulation, which isn't compatible with
> kdb. Radeon still runs kdb, but it doesn't work in practice. See the
> commits in this series for details
>
> Therefore remove the remaining support for kdb from the DRM drivers
> and from DRM fbdev emulation. Also remove the hooks from fbdev, as
> there are no fbdev drivers with kdb support.
>
> If we ever want to address kdb support within DRM drivers, a place to
> start would be the scanout buffers used by DRM's panic screen. These
> use the current display mode. They can be written and flushed without
> mode setting involved.
>
> Note: kdb over serial lines is not affected by this series and continues
> to work as before.
>
> Thomas Zimmermann (5):
>   drm/amdgpu: Do not implement mode_set_base_atomic callback
>   drm/nouveau: Do not implement mode_set_base_atomic callback
>   drm/radeon: Do not implement mode_set_base_atomic callback
>   drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
>   fbcon: Remove fb_debug_enter/_leave from struct fb_ops

Personally, I've never worked with kdb over anything other than
serial, so this won't bother any of my normal workflows. That being
said, at least as of a year ago someone on the lists was talking about
using kdb with a keyboard and (presumably) a display. You can see a
thread here:

http://lore.kernel.org/r/20241031192350.GA26688@lichtman.org

Daniel may also have comments here?

-Doug
