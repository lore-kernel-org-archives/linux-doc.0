Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C16015686D
	for <linux-doc@vger.kernel.org>; Wed, 24 Apr 2024 05:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713937731; cv=none; b=UNNuwUtTT6uw30lNJu/U9NtlgHsLnGQ28BaLR+44mZko7ofwfWNFKcHiJLK9DtP1NnEEi7VFNV5GWuFRrD3m43Vf7te9FDl9nbFUjNt93rxaGtAUPr86R/ZyxzxurAoF9yyp+iYo4Cul20SHSNVZ3sm1EAqytqmAw4dN9c+3nMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713937731; c=relaxed/simple;
	bh=OhGB6aeiRBED6PcnORU7BJxjBdjdb8vvp3O9u1ho3eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHj9Dy18dWlCM+OYY3QWhO6fzl0TBZTEAt+1QA54gH0bEIxKbJ8zIl+7ogWuVcZAYY28TXTTmsslzbPihC14o16C4YyGehwDzraLt6nf5w4sZt3DJ/20zCG1UoGigyBsnD/bRAHyRlqoI74qx71EnsHhDFNAYIGe3W3smbhlsIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tv7aVJ8N; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tv7aVJ8N"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-436ed871225so138411cf.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 22:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713937728; x=1714542528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCgt+2CHtyKZaPY3pxG44Q6DoASj67IoLOhcREfYHl0=;
        b=tv7aVJ8N0ayEsvm+ZnqeBG1p4/3G1bKUYirHXB6+VqiHO8+iGqrWYe/OHsC5LM2HbR
         +emPqxuIqC9/vgeVyrV71as4J6ECluimSGK6IiXGr/eLNCZFHIb8A+gIIM+VrMFp74QL
         NmnsYfXU6D7t8yzYkMciOj2aEPBaa3jaEvrnpUcPWkZwVXUoyJg8ybwUGZDcti2bjEiC
         hBU7mQBSiNA5nPvpuL+yZcxMsbcjnsa7VtAGew4KwWMhwPVZnxnrgOeZ7dbw6CQBsj8h
         EEhxVIwHaT4h714/yHHiV4go4MMJjbVYpcdosfPxTx8x1N3ZjOUIWpXbg4kCh1U8erWu
         WWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713937728; x=1714542528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCgt+2CHtyKZaPY3pxG44Q6DoASj67IoLOhcREfYHl0=;
        b=WGoUK81wfPUzvf5vYTniab2hyGYAWrvKDooKcLEHVNAOM5ig90nA8vc+9oCC2HQyNc
         OKDaMOcP0+z+hMpm+EZt4gIde/WcHUzN3DCJcbm0z6xbnlu8MAxFaVhLHGyv1SWaK7qg
         GOv2UfSwMwpyLrXFMDASxhOk1b+Ma+f5fX7nhxkKoZtpuujtC2jSQVGpF4y1xuxapL1E
         B5j1CAaTBqzXIRXiYh7I1tSDjgUh9hgOQ+yUstBmuKGFl7vsbrZLeSUXznNRmymthkEh
         M4tZjiEx/cYU4Vd/byJSqsj84fanCPDF0qaIy8pYFU8xXabCjMoXlkxm8jOPbwRe+0yZ
         xPJg==
X-Forwarded-Encrypted: i=1; AJvYcCUCqcOpDaAWwjwIWLZyxkhaXmCfLOoi8hMUE+h2V1i8sDgUyMVQs9BlvYB/IY+Q7GyQkSdsyExI2E6UMqdb7I6HSDU5vmKPDcbd
X-Gm-Message-State: AOJu0YxUJQVyr5BqaqqNFlM/d16gpdoR0R9Lctsj4dkoRpAhISOThWp0
	Opi8YiCeI9jVo32LXnEysgG9CU8MZp5oIxIPjfCpw6wSLk6uZtTbZf29RPaXXS431oU1NnHcKcW
	KF+Bpwtcfnj7fZxfOTtIM0eLw34r9G9j0O3zK
X-Google-Smtp-Source: AGHT+IE73h/d8DsMoF+sSXT6PcKG1fQZeZZbPEgvcmLjY0siy1ogX34+yH9o0AEKJKyvzzKUVhE+PgrjJElEuSg2Uzc=
X-Received: by 2002:ac8:6606:0:b0:439:ad3:a627 with SMTP id
 c6-20020ac86606000000b004390ad3a627mr130618qtp.5.1713937727823; Tue, 23 Apr
 2024 22:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240414-feature_poe-v8-0-e4bf1e860da5@bootlin.com> <20240414-feature_poe-v8-2-e4bf1e860da5@bootlin.com>
In-Reply-To: <20240414-feature_poe-v8-2-e4bf1e860da5@bootlin.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 23 Apr 2024 22:48:12 -0700
Message-ID: <CAGETcx-fZ4uuYsgpWcPFsuNKAkBarwC19_Ld=WX5EhYJ3Lovig@mail.gmail.com>
Subject: Re: [PATCH net-next v8 02/17] of: property: Add fw_devlink support
 for pse parent
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Mark Brown <broonie@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, Dent Project <dentproject@linuxfoundation.org>, 
	kernel@pengutronix.de, Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2024 at 7:21=E2=80=AFAM Kory Maincent <kory.maincent@bootli=
n.com> wrote:
>
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
>
> This allows fw_devlink to create device links between consumers of
> a PSE and the supplier of the PSE.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

As the fw_devlink, I'd have preferred to be CC'ed on this patch before
it got pulled in. Especially since Andrew thought this might get
fw_devlink in a knot.

-Saravana
> ---
>
> Changes in v3:
> - New patch
> ---
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index a6358ee99b74..cc064151853e 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1252,6 +1252,7 @@ DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
>  DEFINE_SIMPLE_PROP(panel, "panel", NULL)
>  DEFINE_SIMPLE_PROP(msi_parent, "msi-parent", "#msi-cells")
>  DEFINE_SIMPLE_PROP(post_init_providers, "post-init-providers", NULL)
> +DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>
> @@ -1357,6 +1358,7 @@ static const struct supplier_bindings of_supplier_b=
indings[] =3D {
>         { .parse_prop =3D parse_backlight, },
>         { .parse_prop =3D parse_panel, },
>         { .parse_prop =3D parse_msi_parent, },
> +       { .parse_prop =3D parse_pses, },
>         { .parse_prop =3D parse_gpio_compat, },
>         { .parse_prop =3D parse_interrupts, },
>         { .parse_prop =3D parse_regulators, },
>
> --
> 2.34.1
>
>
