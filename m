Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC873264FD
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 01:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315059; cv=pass; b=epTxd6bhdzRSLzjUZqSBSzkJ528fd/EG4sRJouufwufgBF7wGc9jxvKX7cIrgOe7Y3MC/nQ8SU+O79X/bsJLckRuzqf+Fhs3UHaw+wJ/vMMiH0+Tn5MY4XXbf4aUjDoQBxA8WK5SzT/JmgBXx+lb5szGRVcrcuXQduEDWolmUXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315059; c=relaxed/simple;
	bh=TgqMFATpHhW+nEiJqSEEUReQS498sWbvY8+dfg1d0lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdNzuxcKzaYfCeEwBcOiehRnQ20IiOL/uxkQJhJ4Lpwv0547asRZkrHLrUOVPKE+q2pJGRG4qb0vWy/qWTxVtof34zP1Fp7vWLmdvZT7lmIHdxW+lH20LlAr4tq7A1K2nBGFXrXaFFcBe1IsTjdqsAlJddxLvlWAdpGxmFONbBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vvgZn9Gt; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vvgZn9Gt"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38bdb4b8e66so26854761fa.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 18:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774315055; cv=none;
        d=google.com; s=arc-20240605;
        b=eQHu4ybsISaoHBsW8TKEqaVNK+zgadLrmmo1FBbKqHYvuZV/HavclonDeaRqzGC3zn
         Z+d7Wu+qOs9lV1ds0EJBha5CEY4ZnJKVKutQevuzJTwZ1pdpwgKt+AIVXgr1I8r1vHnD
         2/V2vpRhXc9YQckPbibFCk+fu7xfDsyAxrpaL5lzD7npiGnGm29vNXi+FO8qfOx+2xkI
         +WqEOk0jcDC6YWA3tB74uP2tV5xmqNkuii6zaRqhibihxKNAp+q1uzTkp1NJPeXfCjK9
         E91TlY2vcZmRGgn35YfbopXf1gk2qFNymmRmS+5reKfc9mrr8sBjH6rgoeLMIE7LRk/L
         FkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqS1obwMLm1mQjysDeySwbfzBM57UQ5jcj3yckCXI/0=;
        fh=dKmtl06KSetZ7uMbMzkKUYR1B482c+JvAx8ofxtfYQY=;
        b=VIpWpt10Gjbv0Kqiswbtp0yLdEL/pG1BcTDeYtDSaW0pciQkLNqf2nutNq8+vzc5tg
         0ya3q0fZmZuGa3PbeJ8O2xGrQiBSTpUuZL9EMdpsWK8+qDq1hl9luU6zN1k1WzY/zwDo
         A/HR3TDMpX8CgdVelqbp04rJyc7XfRbnGnst8UAsiCu1H9xR+SfTCtZbQk3Kv9Y1NS6F
         jYBg+o9c3Y4lBUhLHIBxYs5SSeuThYMiIFzZYSxzdlRGuf1JJttrCDu7rTtdtfDymRBL
         39qSHpoQfuibvgZTqXpEWb5t/wYmr60LyHA5K70aQZnea2leT3ptzjfyKsFW4rooDKJI
         +nxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774315055; x=1774919855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqS1obwMLm1mQjysDeySwbfzBM57UQ5jcj3yckCXI/0=;
        b=vvgZn9Gt0bNMu6GOdlDS9AOVNUllGJtTVkw0sXEMaONMD+IejYnJuYCB3uQDmX4sls
         otMcxQZd8w7QR8dSbEmONY5m1plWutWA4f9jON804oyK08LJt7i61Nv2hesFbP0rpYqT
         STToKFphq1AN/euxb34koCN1lUkwLfwgs2GT0PlZTWT4DvSahDTQ6Ww1F017jZ/wVLIY
         gZZrqhL9eCqmkJscd9nhuMzH3xuVAaKGa2bJ3uaIaDtlrEzGMEImmwg6K+gay7RCnoBo
         5dRHL5qcAd5ONvXdIZWKVfSejPCZPOJlhmnI86r9XOT3e1SGQT+dve4e6LbT6DBwFlef
         doxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774315055; x=1774919855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqS1obwMLm1mQjysDeySwbfzBM57UQ5jcj3yckCXI/0=;
        b=iQj3kenz4WAcSkw3o17U9OiK+oHkpZyH52hXDh+q+QGhSps941Ke9qtTFKJQ50IB0r
         c/Ru7F0yCmfeFnhlkW+LYz7mmhvuRC6YuN6vDga1JjADjM9H7MTa7CniqtwF5gM2pm6b
         muimizFBEQvE3cdiArWi9cjIpM3HHdHL+rdsFqvCIXV4Oah4SQxLIFz7MnYYbNqi+d73
         7XE88d8JrMkGckabHlYy5nSfvN9E4wvOepXgR+I6C6uW2BIORxLSQydzrFGEGxJ67tRZ
         KAZoP/82QJ9NmXAfAyyMqSFUWugntQPlgLPjNe/OvJNEmCkNgeiv0UInBnZr5Iiq4gLJ
         MHFw==
X-Forwarded-Encrypted: i=1; AJvYcCWs5eFSI/kI1UL5M40Og/8WcCQ9RPu0XCCYDBF4FPV+EBMNRxf9yAIQ4ost21L2jpK3Qjjk8JV692k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqzNRV+eMS/nigZZSrCKVFmukJKxYIXeu20ra9Ebla+3gKZt+L
	6IexKdh/k8pue+ENck391ybDI/Vmd2Wc0YUVJp2ZOycgbRSzHNFELdkEm+/8GNtY8J0rxvpqago
	jIzAM/aDilVUpOBtiXAwSYsR5SoiHP0VurA+CnEluMA==
X-Gm-Gg: ATEYQzx+hF8CdMZd5QPD8CLXHbchSzN0npKUsD79QRzuPvw6/kWGE0cN0PioTyL7Jhw
	kv4r5GGRU6TnATYe0mBlAKamd08EOjZ6tJjRgf14wKikkK/EUOECiauQYqGopTitZGDpsff6HUn
	t1miZsTYfwCM6wYjoz2CVjxC5HpO2V+57Z6t0PPpjXicFWxWONE/RXrvL7tRAnVwdTNtpFB4y5L
	S0AFGMunj7NvNR3/fOFSZLDCw/vGp4CxM8BASCdLgkQpqkAXuUZ0yo49u3FZ3DKGqhcyi7HrWJk
	ynvNGcyh5CuhhQiyVJBNbr3HZCaSJPmDr2yGwjI0c8+/XhzzNKLSCfRrwHJa0645fo4=
X-Received: by 2002:a2e:9850:0:b0:383:20cd:52fe with SMTP id
 38308e7fff4ca-38bf9703849mr32962451fa.17.1774315054476; Mon, 23 Mar 2026
 18:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
 <20260217081203.1792025-3-sbogdanov@baylibre.com> <326f3dad-b2d4-44fb-a4b1-d09fb0dc5024@roeck-us.net>
In-Reply-To: <326f3dad-b2d4-44fb-a4b1-d09fb0dc5024@roeck-us.net>
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
Date: Tue, 24 Mar 2026 03:17:23 +0200
X-Gm-Features: AaiRm50e7_vyqNaw6KGozZtyUIdxEAYNqIIQFD0h6In8lfXt_wnxCUYyWj3o8V4
Message-ID: <CAJ83Ew5RN2LPXzezqGEgneajS6RWDK-cGNej_DM8ukYc7fz1WA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
To: Guenter Roeck <linux@roeck-us.net>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 7:31=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Tue, Feb 17, 2026 at 10:12:02AM +0200, Stoyan Bogdanov wrote:
> > Add device compatible support for TPS1689
> >
>
> The title and description of this patch are really misleading
> since they don't mention that support is added to ti,tps25990.yaml.
>

I will add in next revision

> Also, the "title" field in the .yaml file still refers to "Texas
> Instruments TPS25990 Stackable eFuse" which isn't really accurate
> anymore.

I thought it should stay as is since driver is still tps25590, but yes
it make sens
to be changed. I believe this should be acceptable

title: Texas Instruments Stackable eFuses



> Guenter
>
> > Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml          | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> > index f4115870e450..973ee00c2c49 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> > @@ -16,7 +16,9 @@ description:
> >
> >  properties:
> >    compatible:
> > -    const: ti,tps25990
> > +    enum:
> > +      - ti,tps1689
> > +      - ti,tps25990
> >
> >    reg:
> >      maxItems: 1
