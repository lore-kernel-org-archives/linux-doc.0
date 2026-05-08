Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DC0384223
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778228451; cv=pass; b=OG+S6EJuzZHdE1CCvIDcaupn16wBx6xjZBVkay+jagt+buj+IerW50xK8tjs4C5WkqI0ZeXrf+maUM0M7fT+py0MxjNfRB+tP6shOJiAC0/ztpb43d5kz9DWpFtql3va8FQcJ9rXN5/Iovg31Q+v+WdHNEGBEgQCnW0acYuQ3Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778228451; c=relaxed/simple;
	bh=lTkF7Xj1pPLGJApccu/V8Mry4PVrzP0dv5SU+hphSqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOwSPNCPBDmi156y1526+jwPtco6uzFMx8CCu15TLvcQZnZMxZaZdPC+BiBHZ3hZCEIcex5aySQLBPz35RZKAx7xV1ilOQcNRkNCtWzukrUCf2zhSpBqfOPc2wh7hXRFt0N4d7Tn42hUUkLxKt2tX15nwQZHBBmcWWaP3k+NEZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovy7WJKb; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovy7WJKb"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so505817241.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778228448; cv=none;
        d=google.com; s=arc-20240605;
        b=jfoUGDcFF5QobTXqpH5moxTgwLkugrG3UlLbr2+QjsvOP/bogo4cqPuOcvNGhPu1HZ
         uf05pUIhx50CKmM4g76FGMeLEszJztKXTdbR4Ojc18fXKq4St+q2eyexuRzzCu8pTRdF
         cEeIPie4n5U/NR1UtQEUroPdngwLbFpCPetJDxFJTDMt1BPIwdzRYEA+NgQT6y0rg0sS
         r1SFH8R3IyBKTy/e1Dq1pooFzRdR88kGgA3EQU5hy6c+/DxR/+gOgw3Q2NnJztAcbk7V
         O04sj08DXSKj40zx/bsDCo1W/qv2l7Pv0lZ9mf0YfIXXk9mpVWXhtejjQUhdkiC691q6
         DjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HHvqc5QQlNg6QfQkGnDzkz4AP6jx9Mcp6qm5SqdJ5gs=;
        fh=jUfzAr6MaYnDa3HUeE1lTabd2G4OyIjN6s8fIqzsNcQ=;
        b=ci54rty1QXMrJVu+9ZI0rY6+aA5JOAmh3vfz26H2vsespnsUoK5C1X7Nscx0WdL/ie
         F0HFM6VnlsUco9ZiyYhLuCXN6F7NXEkIhCQU3vMP1NYzmIGkS59/i+sTiURdk85tAUOA
         AI0Q2Pi2go8JR0tPYHX7GPoSF6U8GCFg9mS7iq5c/yvayLNsDF0XCjmYnwusJ5QNzoP0
         /SiaRmEFi+6PJwtlp7WNiho6yJ4oNgwHpP9IG3D4ctQPTXICmw3d3rcOnEbdg/vaVUZ5
         tu6SqBgBC0Ey8SwtLjMUiOKT1gbbT2fa88TM2nlCmUYuXHUCK1mIl7HiHdVD8sglUFol
         5J9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778228448; x=1778833248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHvqc5QQlNg6QfQkGnDzkz4AP6jx9Mcp6qm5SqdJ5gs=;
        b=ovy7WJKbLUXUpfS9AK2nUoxnoJ9aJC6emEzi+YmThLXN3+ZEuEXrvBzJQGuVY42x+C
         LrikbL6KCjLDmFV54CKsT+eLXen8f96b8TRh0qwRS6iuazJxpaZNiPO1+t8ZqeSG01/3
         iKVptjKvNT8Ac62at3juk15Mcc/wEYp4PFs2E/Tg6YnohqQT5LrWCYWyLOir8aqkAtBu
         1xHn1s36xFW+mmiaqKn7KH6MsGDm1rWMU2X+H9DUfZfP/4G+KgHqTsUiVi0q2TexHLqD
         rvEigLzLkD5gXEU2j9fTz4cY8ohLJvXfyb/Z2FMKo1iZKvkd1sDYlOkbVki1Umxcskep
         60+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228448; x=1778833248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHvqc5QQlNg6QfQkGnDzkz4AP6jx9Mcp6qm5SqdJ5gs=;
        b=FPCnbgHCdN4k3zUADTsPyq6utAVLGYhUMVEdr4id3YpOE+nf7wE6b51F87kus+ZBL0
         Ef557EyuzGIrc7csH4vdoDnDy/CcYFpXBfCv7tJDVWgPr0MDXJly/o4CTV00G06wT/Uo
         4y3S5EiMLbxCah/wcF8W0qJfK1ddKBVFvYh9CVpeGuOI2Hps919FfJMzHIIEx447M5CG
         VzBhMyhlOSFNkOxGZQIo1K7O8s93mWF2EKKzIENU4H1IqdiWHtbkMQ6ZgInyRq1u3LDE
         x9cLGWr6SjXgLfHjjP73SIZSPUitYAF0NsBOiwtJtTilidaCwhC22cUiL4BMhua9+9BM
         PtPA==
X-Forwarded-Encrypted: i=1; AFNElJ+8af+99EO8kVQHHcGPiiMZg7Z5+z/pSBnAnFLJ/Wijb/mmei4ybXhar/nz13gL21XvaLpq07k4jVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP4b2+DCK1qJK4l9DOh6JopnqkFlcSvbVvfbqm1o2fgjxZWH8k
	fUU+3uN0et1F50t/xD6fB7Y/N5uneZT3LMXdEym+ItpBJ/NnqQHSE4Fbs6tVo7bl6HnowfBXKow
	bKr4rWd0KyskwaeUseALBZ5SxKKxvDL4=
X-Gm-Gg: Acq92OGFXFk3g14MVb2AluLG2UDigSyTPQPxZ5aN3e7ds4GYzRc3nKds1B9RwgX7l6r
	Gd0/0no09EOR4mYjGgcAFEbpJmqPiGFfez/sv+rpkf+Fvd7MoaaRwnmd2yPROLietNBrdr32RVK
	xLj3MDiNxlT4+G5RQ0aP2V/lXgaDRReZrA8Dhb2Fsf88wzABK4brzBPZSPR5NAaY+hC4qtFd1Dd
	NlXSkTwYWdtsnKEFAzuaasO7MIcWpQyrcsakvz6/h6OiOZMQZd0Lqtc6tnpcjIrhnY42RjNXjZN
	vDdOaha5vvHuBAs9
X-Received: by 2002:a05:6102:26d1:b0:608:6b33:5bc2 with SMTP id
 ada2fe7eead31-630f8fc123emr6203272137.18.1778228448423; Fri, 08 May 2026
 01:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-add-e50sn12051-v4-0-ff2b3768ac7e@gmail.com>
 <20260507-add-e50sn12051-v4-1-ff2b3768ac7e@gmail.com> <20260507-squealing-vanish-16fea3c114f5@spud>
In-Reply-To: <20260507-squealing-vanish-16fea3c114f5@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 8 May 2026 16:20:37 +0800
X-Gm-Features: AVHnY4LY8-27TKesI70xHAUIFe9rb9_MdP2mFDNPu7z3TNgg0dnTs4zeU01pEIQ
Message-ID: <CAPBH0A_D3siq+_CMM5Ouqemn56eJhU8U7KuL5gTC8h_tvL7kXQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051 binding
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Chang <kevin.chang2@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B45=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:07=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, May 07, 2026 at 01:12:26PM +0800, Colin Huang via B4 Relay wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree binding documentation for the Delta E50SN12051
> > PMBus-compliant device.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/delta,e50sn12051.yaml     | 42 ++++++++++++++=
++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn1=
2051.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.=
yaml
> > new file mode 100644
> > index 000000000000..72aefe212d17
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.ya=
ml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/delta,e50sn12051.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Delta E50SN12051 PMBus Sensor
> > +
> > +maintainers:
> > +  - Kevin Chang <kevin.chang2@amd.com>
> > +
> > +description: |
> > +  Delta E50SN12051 is a non-isolated 1/8th brick DC-DC power module.
> > +  It is a PMBus-compliant device accessible via an I2C/SMBus interface
> > +  and provides standard telemetry such as voltage, current, and
> > +  temperature measurements.
> > +
> > +properties:
> > +  compatible:
> > +    const: delta,e50sn12051
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C bus address of the PMBus device
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> With only these two properties, shouldn't this be in trivial-devices?
Thanks for your comment.
I will remove this file, delta,e50sn12051.yaml,
and add device into trivial-devices.yaml.
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        power-module@40 {
> > +            compatible =3D "delta,e50sn12051";
> > +            reg =3D <0x40>;
> > +        };
> > +    };
> >
> > --
> > 2.34.1
> >
> >
