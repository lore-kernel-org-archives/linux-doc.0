Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826FC233709
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 18:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422453; cv=none; b=IfUSpRSeNI+fM5bDrgFpacaYPt3LJMEYqQXS0EqAXVDumAX5pLclfwTjlB7Fm7j/4XDllBXku6Qy39qdv84szDUyRXi01rO2IpCAK34qgsa8qbMQPfQWS+mw954Dlq3wfh4VOp+8aQO4gD3BYBx3jZhRoqV6bDBFwAFIRaHOMww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422453; c=relaxed/simple;
	bh=UCTg3g/tkcfH1gJmx3kVcTsAp9a72p1V4y77QyBKanE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mialpt1dA1eVAC9usPZl1yBdj/44J3kO/psvsHXukVyPIZhV2LvPx8OM3WIbuAU5vgetOFtq9v31YX+bNqu6SFfNpjqgJ2Ea2dcnHVisMwTnxszgnGB+iOHHINOgEx3AmwBHapzCUdFtGc1751EJdmdk5rYJ8m8dVjQJoTuQsRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b/tjjrmw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b/tjjrmw"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54622940ef7so5398379e87.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 10:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740422445; x=1741027245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCTg3g/tkcfH1gJmx3kVcTsAp9a72p1V4y77QyBKanE=;
        b=b/tjjrmwpk36KA2YMgdOk4Em707MMUEtELL6rmsRb3D27pMbNbAYNHuq3CHSmeDgPF
         wPtni3wI0Yg79yt7G1C+rZZnzFsuNLUOD7ts6Fw1xrpkPDn28aYkPZNndOLNExkJiNes
         ldlXoO4xEH5b+YkyZjxTWeEVJGFAxz264p8o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422445; x=1741027245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCTg3g/tkcfH1gJmx3kVcTsAp9a72p1V4y77QyBKanE=;
        b=pLfieYeOpzKXUJdYUHVXSorPDZyQwFDRp48QCZuTVwJjAGvELmNSs9oOUGWmg1/J7i
         +3+/Sd3h0SHcZZxS/kVW24VrCJ9nihHTUHCyr3Q0IUTtDS8SMlIEvyUflZlARIC1LgkH
         RqbNUgSFPL3hu6H8OEQO+mQJEVkFA6cw1IL6No6papPxXRpWW9BnwTcobQ/wSjED07GC
         nlyAGdEW1KQrWwPjh2iUz4wKC4t6wWAm4RzqrM8tTuI6RSkEU9QjQSiX6ns1q1BpIP6q
         RXUqBA3e83U2B4iHKAACh9gtgcx7hS/w4RrWViU8OvqowCmhKJzRvmpDxoMQGDcuQzfq
         ePpA==
X-Forwarded-Encrypted: i=1; AJvYcCU3BETaMo5NZ91B78nWy13XO4WcLUzFF+HlOyMqZzcMUlLmFtl1nt89LVCuzX+D/jg0dOf9jHoYFNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQJGH1j7BHL/sNAbFzW1sySCexGvjSLRA3opQkZMUPtVxBiJH
	dTSkqNSGMY+6YjbEoQWjk0hPkKrptfTkqLr8LTWeyUSXv2znX8/PrPZNTxXi/adcWBo1UVE3o4D
	Vag==
X-Gm-Gg: ASbGncsq4FkWmwmZbtiQDbcExowYmWQpSZRFpDV/dKVeJlpOnU8YOnh9my/02UXFet2
	zsapr1BWQ8a/vaHY2vVGr/5dAYBr7pLk6TaTP6hYMqIU+1wxVzY3Y8rQZ4y9d0tazabyuq1Ugh2
	MNvTS2UmhhuNWDtF4piV+7ow/KlYcXBRTs8t972ZfhTLUD/pcN53F7CgfH5JcxPlSCTHri6OOot
	k6or26LZmpk/1LFDmeKGymLW7r8gOQirI/ZgSv/EYS3x8LwCpzuRJmDq3YQcovxdqqt+i1A4yiH
	wVHYnNAXPfCum3E2XzRHFZluRORP0ZxyXhcUdxsHup7316Px8M7ONt8UlaaOC9wjpA==
X-Google-Smtp-Source: AGHT+IHjsvsZZxRe1SRgPKYDo2YMPjaEJ+ZA/AoBPrGo0s5itVhK1dTanDxzyjShb3ZFNQRkya3Mug==
X-Received: by 2002:a05:6512:2347:b0:542:6d01:f55c with SMTP id 2adb3069b0e04-54838ede909mr5539729e87.3.1740422444551;
        Mon, 24 Feb 2025 10:40:44 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819ebe4fsm62981fa.34.2025.02.24.10.40.41
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 10:40:43 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5462ea9691cso5278628e87.2
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 10:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTa1a+rz3pBmDw/JjdM0Ue6d4Z7dnyI93ggbmuiar5mZTDyYwazH13m/ExpvMkVTEng53DqVuxFkY=@vger.kernel.org
X-Received: by 2002:a05:6512:e99:b0:545:c51:4a0f with SMTP id
 2adb3069b0e04-54838edd8e6mr6201702e87.4.1740422441508; Mon, 24 Feb 2025
 10:40:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com> <20250218-fabulous-agile-corgi-9a5ee0@houat>
In-Reply-To: <20250218-fabulous-agile-corgi-9a5ee0@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 10:40:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UPY-VGr0qWnHcmdJpVGo-xqJyT81FxqJVp3qcrhcii2A@mail.gmail.com>
X-Gm-Features: AWEUYZn5kJ7jvupKGMyzFLJ3TnjjiDiS2fSx64zjhWAkyHi1oX6mHN7o3rYIme8
Message-ID: <CAD=FV=UPY-VGr0qWnHcmdJpVGo-xqJyT81FxqJVp3qcrhcii2A@mail.gmail.com>
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Selvaraj <jo@jsfamily.in>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, Jianhua Lu <lujianhua000@gmail.com>, 
	Robert Chiras <robert.chiras@nxp.com>, Artur Weber <aweber.kernel@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Tejas Vipin <tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 18, 2025 at 1:55=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> > I also questioned whether this really made sense to try to do with a
> > Coccinelle script and I still don't think so. It looks like Dmitry has
> > already reviewed the first few of your patches and has repeated my
> > advice. If you want to help with the effort of addressing this TODO
> > item then that's great, but I'll stop reviewing (and start silently
> > deleting) any future submissions of yours that say that they're done
> > entirely with a Coccinelle script unless you address this point and
> > convince me that your Coccinelle script is really smart enough to
> > handle all the corner cases. I'll also assert that you should review
> > Tejas's submissions to see how these conversions are expected to go.
>
> I couldn't find that in your first answer though. What corner cases do
> you have in mind, and why do you think coccinelle can't handle them?

My gut says that it is a difficult problem to make this kind of change
purely with Coccinelle. That's not to say I couldn't be convinced if
someone gave some good evidence showing some amazing patches generated
by a Cocinelle script. To show this, I would expect someone to
understand what Tejas has been doing and then compare that to what the
script can produce. In theory, you could even run the script on an old
version of panels (before Tejas's fixes) and compare what the script
does. If you can make the results nearly the same then that's amazing.


> Also, why do you think ignoring a contributor after a second mistake is
> a reasonable reaction?

Just to be clear, I said that "unless you address this point and
convince me...". My problem was that I brought up the questions of the
suitability of Cocinelle for this problem in response to v1. Then I
saw v2 posted without any reply to my concerns and with the same types
of problems. I was simply saying that if a v3 was posted in the same
vein then I would ignore it. I'm more than happy to have a
conversation, but if I start getting new versions that ignore previous
feedback and no response saying why feedback was ignored then I will
start ignoring new versions. That feels pretty reasonable to me.
