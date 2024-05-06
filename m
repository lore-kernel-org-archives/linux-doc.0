Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC20347F4A
	for <linux-doc@vger.kernel.org>; Mon,  6 May 2024 06:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714976561; cv=none; b=okEtTmdV6L/JQjHm3OmZusrkAuG/HoIPdKfxJtYoBYyBsbnYYUaxBZ+EjtT1yzpwCgK37yr5wk3b4gyIffaxWsy4a+wmS0hi08UaUEJMDCoD7Xpp0Sn61pACF5fWXLmdU2h/XSGZjmmvqgMJ1+dwyXvP0JD7UvB8ncop3Wt4l+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714976561; c=relaxed/simple;
	bh=ASZY3sO9TthL1S1IUjkTKbcukLzic6teWrFlyJrkjt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhVlNKgR4So1EgCjLMA44+hSDsVesmtcDRCmvnaVw/J1Uq+TNvA+ppjEGAcazxNh2YIA7p9fxGaEoIjsP7Gta7DZmukCLj3FBanm7odSEJbu9rzm8URnbobhffxVLVgyKSWNPBklJRgEwArZAYqQbiZiliu3UB0W1KE7Udcej0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XIqSHEK/; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XIqSHEK/"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-de6074a464aso1655313276.0
        for <linux-doc@vger.kernel.org>; Sun, 05 May 2024 23:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714976558; x=1715581358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsyQW7L2aio+heYVCfqR/1RRN8HWBrCF5UqXa3eqZP0=;
        b=XIqSHEK/cCMaphhM7b2GRoVy+NTbYwITZ7A6kgN8/6DUMozv6TQcGHsAJrWZIWIKCQ
         q1F6l0/L4XxJ+O/f2zSGNuhek6kkK0d3xdnKIEovA462WTKJVp+AuwuumH4P4K/ou+58
         HyBU01SdfJn87dyF323eU2FusCdaYwr8F7pqxgYs+8kepxZmVbKQA76uodU/qYXMKp3R
         xc9eiy/zt0iH+DgE4AUK3FFaS2efFi31kWAJJbR3tN78SE7ZY5pV9RFxBTKSR0ReWPSc
         CscFzXtF3Aql5Zf3iJp/F8JfauRj+Mo+c052C4CAd6y+xsu4mf9N3iKxhdd7DmyMj4ty
         5ALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714976558; x=1715581358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsyQW7L2aio+heYVCfqR/1RRN8HWBrCF5UqXa3eqZP0=;
        b=UIqmA4ZT1cqeFSGkYDh1r7F76NqTBVAKgVMHzZ9lMosCAQzy8e0plAkwmxKH6FEVKU
         Px08wCXFr7ka6f9rJgC2l/fo9f5Y5Js9SQpef9irsa/krFL+zKrRU62YNsGsxwzIp48x
         8dKI5BhtnEUTP+rD94qsGFSfNglyFtaWb9rVFWwK8GfZBLoJVkEQ96H9xELlMHZxwSD4
         6H3OPWgCKZHwcelSr0FTeXjpNiRn3XVD+SOlUtiLHSeAsOhctU7/ru4MR5EWy6WUe2er
         zp5t+iBFqr0pcDLGb4X1OCp5N97ly4/z86BU60jxO/PQit8fiabG967ItSAftHVg1+BL
         XePQ==
X-Forwarded-Encrypted: i=1; AJvYcCV43U8fjYi1RMfl3QGDK6fGqkyUHhklXLMQtvp9SI5YodrPiP6nk71bICdNDEuJrxLuZuKf8oJC/ocTHsrUw8G4vKo3P06rneqL
X-Gm-Message-State: AOJu0YyxWcYUrU8vSxMiTZwmmI3E2yvMV7QeWADiaG6+F/UmRsrFG1bW
	MhA846uhjvd7LLcGdP7vKyMmNbnU8NxfI86zfEKxEanNH4YRH4hqpviw3vzAvE0nXvE5cWySXPo
	TRhW+EQ4UEhh7fAkuQzagZCOnWiF6EeC0k9cJkA==
X-Google-Smtp-Source: AGHT+IHhnbYB4Y/mCi0Q2ow0OOu4GhCtAaAQViwXJiKQsef06HGb9cy5NOz+s1L52l57coXzWT+UHOZOcpP6gpDsjb4=
X-Received: by 2002:a25:6b47:0:b0:de6:17eb:3cb5 with SMTP id
 o7-20020a256b47000000b00de617eb3cb5mr9929018ybm.10.1714976558680; Sun, 05 May
 2024 23:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org> <20240501084109.v3.5.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
In-Reply-To: <20240501084109.v3.5.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:22:27 +0200
Message-ID: <CACRpkdZ-M_7q+PxTSHeD5QoaH2-tM-3cQEtgUi6P9XUA-VWyUA@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Hsin-Yi Wang <hsinyi@google.com>, 
	Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 5:43=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:

> The current mipi_dsi_*_write_seq() macros are non-intutitive because
> they contain a hidden "return" statement that will return out of the
> _caller_ of the macro. Let's mark them as deprecated and instead
> introduce some new macros that are more intuitive.
>
> These new macros are less optimal when an error occurs but should
> behave more optimally when there is no error. Specifically these new
> macros cause smaller code to get generated and the code size savings
> (less to fetch from RAM, less cache space used, less RAM used) are
> important. Since the error case isn't something we need to optimize
> for and these new macros are easier to understand and more flexible,
> they should be used.
>
> After converting to use these new functions, one example shows some
> nice savings while also being easier to understand.
>
> $ scripts/bloat-o-meter \
>   ...after/panel-novatek-nt36672e.ko \
>   ...ctx/panel-novatek-nt36672e.ko
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-988 (-988)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init                6236    5248    -988
> Total: Before=3D10651, After=3D9663, chg -9.28%
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
