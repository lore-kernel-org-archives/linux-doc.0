Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399DE14D28C
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 16:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739550383; cv=none; b=pIy9Ho/OvG+tno1/bJIt0v1D3OhyiKP3Q/AB8yaJnzRU9osxeanhSRYkWKgid1PmsEaB3xUzlWFsjBomU57iB5sdn53OA2vO5Lmv3iYFQJ4+h3u9HM4bpw4tJ6pDKWrGuxl0DdnL+G7bUR/+P7/AobIjo6lvaKzPde9C8bNHdUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739550383; c=relaxed/simple;
	bh=RdevOzly6prF9MIZ2eWFLCR3amtfHr8cOSz/Kq6PTf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DimmCFhGEBHXx5FdDWb7Q0A+PLmYEY0QXwsRdXLPhcXZlNhbMs+QG8dkvzrVttPnmYBg/IaSy3Y7ST6SSmuASMpMc91wI74BJePdgp9gk2wlF702PlvJ0hLCNZ8/Fq9YhumodgAryplCW7Ydpsb28XFCbBF+iDzuLw98xcBzex4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M6rE+ieh; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M6rE+ieh"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54504bf07cdso2215427e87.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 08:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739550376; x=1740155176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRwOfh6tgHaZL3+E0zLATKEm7zWEPnAJi4nv5EHJNOA=;
        b=M6rE+iehW35zgIn79hV+5pWMqAfi4H1+yzaysEw1kLordizBalX8ObmWRHoFusehHS
         vUNti38QPXcaOLPZVAYQYBGgr/j/OP0eNWevjitkz7dV0yiDBRUk428OHj+KQ9VFymIV
         S1W6QDITiEe/asJwr852+819z7fQWnT3X/sn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739550376; x=1740155176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRwOfh6tgHaZL3+E0zLATKEm7zWEPnAJi4nv5EHJNOA=;
        b=EwgcNPJgzmUJcSoQQrDJyzTW2lDArva8LdM/pgZGvYcrJKBwdXCQ/MeZVhE84sxnav
         y7UFVi+VptVZyjrY9h6iwrwT4u1aM3ndJnfe0IZvAewRgbr2W8CDj7M2BkCGMM5qbGnn
         zlRMq9FLMfGrr7lwL5nlHjLwiritdJoI1geID+fka9wgFTFRgwNfkh4gqpRUhwpTSyMG
         DYTiVACDwC2AzTkF9veo2l34RnnLS9GkynVRkWnRg6p2ManlTpOL6CNUpIWcQNyMjm3v
         xzQZ7zpQ23duuw+eb27b3OUQLXgTgfDxl/bO/2zbzRR2qtigNGiZM+S73kn8flDOHFuN
         LvIw==
X-Forwarded-Encrypted: i=1; AJvYcCWSGhSBUBIjUtss1I68PFMKuQqZ74Ww5AzwpDUGhcEFupKgkhENli3ze3jUK9UzI4F69XAI2rxZ3bU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp1F1+k5EUPtcWRFTOQVdcSbnFHDprqNWNtaREJ37leiAKZx3u
	nbqg9eTAJICxu7SaLZMe8x36ZzAzErxYccwjdNajFHlsiVtpZ4IuvCg42L/Navjxr6JDb+W0Zog
	2uw==
X-Gm-Gg: ASbGnctP+LMnbrSIb2IRLVQ+o7E4rpaTGxeC0ujZT6kLDaSnWRzJdsSioh6IQKIOYmz
	MAOLa+kZDwwEWjaOQ7C6FXe1WCVQlm9EBNmkdgKJXxJseG+eajpV3ILXGXbmY08+LOmIAnlghqO
	9Y+fT85r/+Gc5X11Mu0AFdmz6heY7klu/UnrW0Lon4g01b7PzJqfk4cFXap7IpMfgvd99sXlu/6
	AC7msqXsgISt4ZF6lsatf+ai/LSDT7QsmYv6VwxvoPpY2KiBOxW3i8yGrj5BBp1Pt8fh/HK9xRx
	DEayTBOdA53rj9ilwP8DEY6V/0n19X25aLM/OmmnoF5jqe7BHBhFH04Aoag=
X-Google-Smtp-Source: AGHT+IGN8BU/I5WZO4m1urL/3fpkwKZtKGwKawEPUFjNX+1JbLJWBGwOLUPkHUYq67IkucuokKh2TQ==
X-Received: by 2002:a05:6512:e97:b0:545:2a96:34fc with SMTP id 2adb3069b0e04-5452a96365cmr1181042e87.31.1739550376211;
        Fri, 14 Feb 2025 08:26:16 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f1156absm566230e87.209.2025.02.14.08.26.14
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 08:26:14 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-308f71d5efcso22208761fa.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 08:26:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSNsmrn1dLJOMiE3yIsFJ7yzAQrirdRU+RgfpM//SQjuGe+amjisAqNeiQZtoY4K23rM4jx0kndMM=@vger.kernel.org
X-Received: by 2002:a2e:a163:0:b0:2ff:a89b:4210 with SMTP id
 38308e7fff4ca-30927a2e355mr545351fa.8.1739550374272; Fri, 14 Feb 2025
 08:26:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
In-Reply-To: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 08:26:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
X-Gm-Features: AWEUYZl2UQnH588l_o4dR5jYVzX-zOJ9t0dVCpEUG6Ly_Dd5CIEQRbUnuFK0DTE
Message-ID: <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jianhua Lu <lujianhua000@gmail.com>, 
	Robert Chiras <robert.chiras@nxp.com>, Artur Weber <aweber.kernel@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Tejas Vipin <tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 13, 2025 at 12:44=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.c=
om> wrote:
>
> A lot of mipi API are deprecated and have a _multi() variant
> which is the preferred way forward. This covers  TODO in the
> gpu Documentation:[1]
>
> An incomplete effort was made in the previous version
> to address this[2]. It removed on the mipi_dsi_dcs_write_seq()
> and mipi_dsi_generic_write_seq_multi() with the respective
> replacemts and not the rest of the API.

You didn't seem to take most of the suggestions I gave in response to
your v1 [3]. Specifically:

a) I asked that you CC Tejas. I've added him again.

b) I asked that you CC me on the whole patch series, which you didn't
do. I can find them, but I'd find it convenient in this case for them
to be in my Inbox.

The first patch conflicts with what Tejas already landed in
drm-misc-next. See commit 8025f23728e9 ("drm/panel:
xinpeng-xpp055c272: transition to mipi_dsi wrapped functions"). The
second patch _also_ conflicts with what Tejas already landed. See
commit f4dd4cb79f9e ("drm/panel: visionox-r66451: transition to
mipi_dsi wrapped functions"). Later patches also also conflict. See
commit 0d6c9edf9e5b ("drm/panel: ebbg-ft8719: transition to mipi_dsi
wrapped functions"), commit ce8c69ec90ca ("drm/panel:
samsung-s6e88a0-ams452ef01: transition to mipi_dsi wrapped
functions"), and commit 7e3bf00047cd ("drm/panel: sharp-ls060t1sx01:
transition to mipi_dsi wrapped functions"). Maybe you should sync up
with drm-misc-next before submitting.

I also questioned whether this really made sense to try to do with a
Coccinelle script and I still don't think so. It looks like Dmitry has
already reviewed the first few of your patches and has repeated my
advice. If you want to help with the effort of addressing this TODO
item then that's great, but I'll stop reviewing (and start silently
deleting) any future submissions of yours that say that they're done
entirely with a Coccinelle script unless you address this point and
convince me that your Coccinelle script is really smart enough to
handle all the corner cases. I'll also assert that you should review
Tejas's submissions to see how these conversions are expected to go.

[3] https://lore.kernel.org/r/CAD=3DFV=3DWkPefg00R_TAQQA6waRqGdD+3e84JXfPLk=
2i9BRzW6Yg@mail.gmail.com
