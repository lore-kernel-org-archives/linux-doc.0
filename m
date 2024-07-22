Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B368F70
	for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721664296; cv=none; b=j6fnFJgTSij9OrKwOfEe//1SmfNQB9CsnK+fIOa27PEaTh9m3F2e4CP3/f/2bazTT4bzKi8tWU9/nQ7zddci4qrffgM2l1nDDaMANQYWGLF3zC0/D0aZaXusWTRA0XwuD9JkGVenidcmLVcBwg6z/cBDHpJfeDEjPvaREHVzEBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721664296; c=relaxed/simple;
	bh=rQbxOM51vH4ibgfugK0CH/M44jL+8voR1MLXSuCsgaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8q9MxOerRuAYCblIh/mi9rTBpVLThbmysmGLssjoA/2BYADl5So/o/l7Abd0IxF0gP2Xe1PoTEletQjc2myKIHJipcnYAs4DnQxUt7F7fPV+xskTg6hmGu1T1zjF0cqrc9cdqqToxmBy7r2wJ+iUm/rATCy1hdofOrLB4tYPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CMoMipQq; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CMoMipQq"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-79f16c85da0so252603285a.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721664292; x=1722269092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4INEQmSnM7kqm2imq9xjeA+11nYffi0tKfMBiA4YWB8=;
        b=CMoMipQq2qO1DnsI9DExeHLCrI2V3W9eY31/WJp9IvKIzeuACCvXJFAtV/r5qv9mua
         H0vfAUGM54wpvPrJULmHFocWCS0dNzWBF/t7K8zR60ozBxKs1FPyJiBjYoM0Xcsjz5wZ
         Te7vrxOl9VNcC4jN3PXjwg4vEtvHN81z6lS3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664292; x=1722269092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4INEQmSnM7kqm2imq9xjeA+11nYffi0tKfMBiA4YWB8=;
        b=eB7ZLqkAkR0eTTXQOw17P/rBYu192K/a9ONuuBDUlC4za497aqOu5aoHnDuAOoCM8l
         ccm1E7ndT8P5ChABwaYKy8++i0juP+h/WjsFemkAWuKxgI5rx0Q18+h/Q7W0NGkbovzs
         8mnSSxKspAQqXbrxQvokNluesY0RWuyR4dCpATZedn/ZH+zBZ7SiVgYGbCCgnanANqjS
         4SrEMHXA64eDZZxF5xrEWmdL5dWF1zpblX74I2NjTd/LqjkxZfXWP6XlMseK+wrzBhwg
         0WZHjxIwUkf/VI2AlgU0QSdzrE3yG43YakVTnsPxZJ4t2bJ0afzuKp47dQfKBdNYkZli
         JaXA==
X-Forwarded-Encrypted: i=1; AJvYcCXUaqgSvnw54upFNqONKRfNF4xNSdQn+USacL+KsW0EWG9rhlYvmlgeIM+vooEPUhXGV+keSgCLwOGI/zDrx7/3Qeacrxy5sjiH
X-Gm-Message-State: AOJu0YzLdcnPzBg/gGfzQjdfZH+CVnfZMBAkWeswOeCFS4Qx8DFDfHCb
	RIVwg36UxnRKdaESe0iPlEwiuZoLCWwfFHhX+YyBXgD9xa2VtA3gagx3wSi4xO39OYBTMzMkJ14
	=
X-Google-Smtp-Source: AGHT+IE1VZaE6/nf3xItBNx0vs69UHAbWlNsskjCo+UZ5ZvorXeM3mG+epujJq8K2mdJofcSP+2iGA==
X-Received: by 2002:a05:620a:4611:b0:79f:1162:b296 with SMTP id af79cd13be357-7a1a132c954mr919957485a.19.1721664292205;
        Mon, 22 Jul 2024 09:04:52 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1990136f1sm374223485a.71.2024.07.22.09.04.51
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 09:04:51 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44f9d7cb5c5so742701cf.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 09:04:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXoZdc3S8fMt7tPFnEePdFh6mlNkiaJlE1PCAypUqq2T6v7Bp4leqd6Zyu6Q8DLHupeL05NBhimjMP2jDlAF+aCJTxyxi7XF+sO
X-Received: by 2002:ac8:5d55:0:b0:447:e6c6:bd3 with SMTP id
 d75a77b69052e-44faaa60cb7mr4844271cf.21.1721664290605; Mon, 22 Jul 2024
 09:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com> <CAD=FV=UdsuEiyPK2K3sYdQm50WNukA5pxD=wUaEAVQStNnNA_A@mail.gmail.com>
In-Reply-To: <CAD=FV=UdsuEiyPK2K3sYdQm50WNukA5pxD=wUaEAVQStNnNA_A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 09:04:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6hjNkzD-_4m4B8GaKP+gJK2jKMp+jeqtLdBnx69==jw@mail.gmail.com>
Message-ID: <CAD=FV=W6hjNkzD-_4m4B8GaKP+gJK2jKMp+jeqtLdBnx69==jw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Yuran Pereira <yuran.pereira@hotmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 15, 2024 at 9:40=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Jun 21, 2024 at 1:46=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Jun 21, 2024 at 1:45=E2=80=AFPM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > >
> > > At shutdown if you've got a _properly_ coded DRM modeset driver then
> > > you'll get these two warnings at shutdown time:
> > >
> > >   Skipping disable of already disabled panel
> > >   Skipping unprepare of already unprepared panel
> > >
> > > These warnings are ugly and sound concerning, but they're actually a
> > > sign of a properly working system. That's not great.
> > >
> > > We're not ready to get rid of the calls to drm_panel_disable() and
> > > drm_panel_unprepare() because we're not 100% convinced that all DRM
> > > modeset drivers are properly calling drm_atomic_helper_shutdown() or
> > > drm_helper_force_disable_all() at the right times. However, having th=
e
> > > warning show up for correctly working systems is bad.
> > >
> > > As a bit of a workaround, add some "if" tests to try to avoid the
> > > warning on correctly working systems. Also add some comments and
> > > update the TODO items in the hopes that future developers won't be to=
o
> > > confused by what's going on here.
> > >
> > > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > This patch came out of discussion on dri-devel on 2024-06-21
> > > [1]. NOTE: I have put all changes into one patch since it didn't seem
> > > to add anything to break up the updating of the TODO or the comments
> > > in the core into separate patches since the patch is all about one
> > > topic and all code is expected to land in the same tree.
> > >
> > > Previous versions:
> > > v0: https://lore.kernel.org/r/20240604172305.v3.24.Ieb287c2c3ee3f6d3b=
0d5f49b29f746b93621749c@changeid/
> > > v1: https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f=
49b29f746b93621749c@changeid
> > >
> > > [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=3Ddri-dev=
el&date=3D2024-06-21
> > >
> > >  Documentation/gpu/todo.rst           | 35 +++++++++++++-------------=
--
> > >  drivers/gpu/drm/drm_panel.c          | 18 ++++++++++++++
> > >  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++-------
> > >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++-------
> > >  4 files changed, 68 insertions(+), 37 deletions(-)
> >
> > Ugh! I realized right after I hit "send" that I forgot to mark this as
> > V2 and give it version history. Sorry! :( Please consider this to be
> > v2. It's basically totally different than v1 based on today's IRC
> > discussion, which should be linked above.
> >
> > If I need to send a new version I will send it as v3.
>
> Is anyone willing to give me a Reviewed-by and/or Acked by for this
> patch? ...or does anything want me to make any changes? Given all the
> discussion we had, it would be nice to get this landed before we
> forget what we agreed upon. :-P

Landed in drm-misc-next with Neil and Linus W's tags.

[1/1] drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
      commit: f00bfaca704ca1a2c4e31501a0a7d4ee434e73a7

-Doug
