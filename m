Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B441BDEA
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 17:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KTb9lPR9"
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E20CD73
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 10:26:06 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507a62d4788so5643016e87.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698081964; x=1698686764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiki+rx48OzrXJWoYglYJgoiu/eOXoM93dwbSSnqdNw=;
        b=KTb9lPR90aGmOcHXsr9BVWarK2n0+7rrAbbIcRNZpRS8Cg/N7/frU0uXdkA7JwQKjp
         9a+2+mHs3SQ6vX7XcHdMT1rH30qG2NUHgmgAl9rAy8PqtTUbY6cCYhYQU1hQHpAHiHRY
         WISm2RG+OCfi0zMnvFH19fDD6zeM+bVGLNpAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698081964; x=1698686764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiki+rx48OzrXJWoYglYJgoiu/eOXoM93dwbSSnqdNw=;
        b=FO1JTano38veZrgQT4aHxMmvqpEHk5x7fhR0fxYtU1XrzZl1ZeU+nXzlVPd4zDKvvb
         aWMl6BonBYrzgVGLsukY+1l+MD8oQe6rKv0W09DrreS3TLBCx4vouKwFgVVDTzETnlcK
         YGfqJV7r4V9gqb2Txf9dGzpO3zgyxixDQDGKwZAk6Zh/DC4TL7tbAQSSH60/Rj6Z1qfw
         Lqz6y0nObtdH6WRZLzLktOYwjeemVN/z3iRgzqtR9aMhLQscBmUsN0XiSthb/nNxfpGU
         gHWdcZfEAYkslad3mBsEUDLO7IR7jpYMdhvwsHTFcKk2Lusl3aH3RdK25T8PBr5UHT4m
         IibA==
X-Gm-Message-State: AOJu0YwynNUmPTTEBvpmxTBjMHTAmxSdwBZIH7+TtO6qjlN9UXUepMh8
	StjxTQJorW+87exSvdwoPERjhRksNgRlWI2wmy2hyA==
X-Google-Smtp-Source: AGHT+IGMRQXhVlsrvamIr89FIqlmZ6A7LkSyGCKaAJV5X9uvKBLSwXqETI3KB7rSB3KSoLvnN7G4FA==
X-Received: by 2002:a19:6455:0:b0:507:9ff7:2ed4 with SMTP id b21-20020a196455000000b005079ff72ed4mr6613169lfj.43.1698081964327;
        Mon, 23 Oct 2023 10:26:04 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906354c00b0098f33157e7dsm6869909eja.82.2023.10.23.10.26.03
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 10:26:03 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40837124e1cso6355e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 10:26:03 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1b:b0:404:74f8:f47c with SMTP id
 m27-20020a05600c3b1b00b0040474f8f47cmr5652wms.5.1698081963601; Mon, 23 Oct
 2023 10:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Oct 2023 10:25:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
Message-ID: <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
Subject: Re: [PATCH] drm: docs: Remove item from TODO list
To: Yuran Pereira <yuran.pereira@hotmail.com>
Cc: airlied@gmail.com, neil.armstrong@linaro.org, sam@ravnborg.org, 
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 23, 2023 at 9:31=E2=80=AFAM Yuran Pereira <yuran.pereira@hotmai=
l.com> wrote:
>
> Since "Clean up checks for already prepared/enabled in panels" has
> already been done and merged [1], I think there is no longer a need
> for this item to be in the gpu TODO.
>
> [1] https://patchwork.freedesktop.org/patch/551421/
>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>  Documentation/gpu/todo.rst | 25 -------------------------
>  1 file changed, 25 deletions(-)

It's not actually all done. It's in a bit of a limbo state right now,
unfortunately. I landed all of the "simple" cases where panels were
needlessly tracking prepare/enable, but the less simple cases are
still outstanding.

Specifically the issue is that many panels have code to properly power
cycle themselves off at shutdown time and in order to do that they
need to keep track of the prepare/enable state. After a big, long
discussion [1] it was decided that we could get rid of all the panel
code handling shutdown if only all relevant DRM KMS drivers would
properly call drm_atomic_helper_shutdown().

I made an attempt to get DRM KMS drivers to call
drm_atomic_helper_shutdown() [2] [3] [4]. I was able to land the
patches that went through drm-misc, but currently many of the
non-drm-misc ones are blocked waiting for attention.

...so things that could be done to help out:

a) Could review patches that haven't landed in [4]. Maybe adding a
Reviewed-by tag would help wake up maintainers?

b) Could see if you can identify panels that are exclusively used w/
DRM drivers that have already been converted and then we could post
patches for just those panels. I have no idea how easy this task would
be. Is it enough to look at upstream dts files by "compatible" string?

I've gotten side-tracked at the moment so I haven't been driving
progress on this very quickly. I still plan to poke some of the
drm_atomic_helper_shutdown() patches eventually...


[1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b2=
34f89613b5cec0f14@changeid
[2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.or=
g
