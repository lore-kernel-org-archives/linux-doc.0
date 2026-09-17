Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8C2FFF89
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608049; cv=pass; b=ed+uc5PgaZ0yb+iuzvrPe4Hd7lEHVpTgtUFD0OM+PatHcFlI39P3A6Y47yC8WijQsajYjgNrjOb/3ApMyS38HzZqKZxWRoJEOUWBa1+/RgHJuMp3TfyrRdZisb0JMSBJHA/UJmGqAirA1X3pfkg/QJNZqUbQptIp/wbZok1oJyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608049; c=relaxed/simple;
	bh=JE6JhFt7uwibX+/JwtwXQf+od6j4Kxf+0SEGWI7CQAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3st6OpRZcKP76meU/lju488JPHa3QhcaKAtMZde+xNPDdRP5EQNlWWniwPnl+jo0ZhSkPLp4ug6hsycecT21aZrdefbfFy9FOj1xCeJzkcCA/gW5bs/LU/1W+k7R6XfzJuf1MTadtkzLCdBBXyZ9VUTZRPjtJeGXEWAhiHQbOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvgdmQjr; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvgdmQjr"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so2532111fa.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 18:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789608046; cv=none;
        d=google.com; s=arc-20260327;
        b=UjWh2ZdxyDv1ZfXDfHYiu+bLRL3XdsO9RTJIQxUVJa6OFhOM8LzZ26um/Q9wJbqKGD
         oXzBE8ghoUTKRVFPvBmov1O76/k0Xoo6BcXZ9X+4V1G8d8gUPlxLFor9sRSZFLmoAayv
         TsaCrKOkt0pxAZdU8cf44MFilDk9n8Wfm3r3bp/fnZVyy55PjI+sqrClHtwI/eDPZ88p
         Gi3pOPFkvPWQ9tGUTJIDapAyFmEiV6rjITey7ZLya66C8daZiXrh4kekZL3OkMat06KT
         Hn1VOLyZKDKC8g9I6F4J01EokASwZhDlwx5TWf+4nkiIuuemaq85Igre6Tpe+O56XI2Z
         nhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        fh=F/ZPhVjPzxTVXs4P2AlhJLHvB0qh8uWHaYfL+gWfm2g=;
        b=OTyEROSrS36bUn8piIuAIHhhmc5yLFGl1Kl/Ba/+J2N/HHDDGASXxA/t3JQpdPNQBa
         Rx2QhXuW0FSeWy2Sd4wvjAEkZ1F8QKTlyHZDZ+FkugWU1tMeaPMJwyKAS0nOMdyIMhg1
         d3JWiOe03lmpb+HlvITp+c1CRsHkGOIRjYva2an5WG+1IEP5gwCnBiq25qo36smU4zOe
         nH5KbAnPUxcZoEDzuucIn8LzCGHnkeRyWf0bhYGTOlo76Q2hw671MY0QCl0Xz8GEU850
         l4E2qJpswN74dbL01SQQXasHpoL0yv3eJneIhUJk4HMmlOPfYSwVQrbgNk4vMJSO5n4w
         mSqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789608046; x=1790212846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        b=dvgdmQjrb1SXh7DQfch2NI+Wmlnb/4wTBgmBRnr7A8k/LlGOtY2X2bSagtfGEzJq6l
         fRDRuk/dhYSQ/QpTgzK/wgEFGDuSQzuLeCHKBrYW4YS+8nylX7Fd7IM9dFdLmSx3K2FI
         NGrw31WenG4IQ3MMICRGJuTMEF56Cthio/+kt4SBV8PeFnn6xezAtOoClYQpseo50uax
         2UhKzRqYg5qn1lvTqmcJXY5/ZdnCGc/kBLiZbReqSqFraGDqGXaLRCBV1Hii8soQadr6
         frT2sNCtv5uJzKNL98ZDHFbrTpAcYIW982z/+ZumgSe7fL4ooX58xxriv9KipAtraGaH
         TWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608046; x=1790212846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        b=S4fEJVmcVBFuNR5WdIJdukUnpwJ42BCGPv/QYfDh3OGOaPZ9ddDiNvsjgYA7nW77fT
         jDNXC5SoudSRl7gIJwxsVgYbQSyq9sX1onpQGlGRS1pciqcpE/j1aNWi+tHDyI1MJFPT
         Ps2SkK6I97hyocaIcZ9jtS6ZNS1v+9vP0i2pJpclaVyWhajCZW5n4ZOna50ErL/OXkAQ
         E24TEqVPO7v23VL9xQBWTK5dvi4gbBeS/6do4ykf8DTpLGFkIK2VDptvqwC1IPLePsGx
         891gKdEUFEIRjPY/BvRyLndYoHQjemL+FMLR8FIIrbPfJiIe9iOdJ1jRtrhyeAiomTC+
         e5Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzTFguSmnwY1dYbckPL7TnoC0MWgEX2Qf96tXssfrPVBKClIB8pvvbr556VQ61IhZAsligfhJk7hBM=@vger.kernel.org
X-Gm-Message-State: AFuF++mL5sl0ZfRwYdaAPBh+71RkREZeHWib17MQpQURKTPims6+w76S
	T15yDmZM3ts5u/oX/Ukc3V4aZ8DXyHFXna5p0gT21R3f/92jL73R7dJeZXPR7XSH0N4ox3f4L2n
	hVkM58MwBIA+762QiGcp7eagxOBONppQ=
X-Gm-Gg: AYBFou0eiQ6wa4nSWg/d/2ChbX+bMHnCRwmzcXm6e23eU+NyhAUAkMVDLIVV1v+ZOKi
	kG25LWTO64rAnvjVs8fW4EcjEs4qGV7dqikmR3ehXyyosHYQTl6W+IobZRy0nGtOQxr2sYuOkib
	2XWA6TscLPhSPLVmZRYF1wiQ097fDrGvDY4qzjKy8t41xpFN5x8cbQhi+QU33AqQ5bJNzByn2K9
	bQbWuY+/xcLnHnS3uFvSE26uNQoZKJqgQayvqvktz+8tfIvJA8yxx4WMjheKJdngwPDph4xhieX
	Zhvqgy42NLY+SNVIrNDoSb4bd1FF1rQCdinOPb1MbBgZ5cG1kWW0u2wo0DXMbyXjgdp/sassqJm
	En9jWWF5A002vyQ==
X-Received: by 2002:a2e:bc1e:0:b0:3a5:f041:d7c4 with SMTP id
 38308e7fff4ca-3a5f041da54mr299311fa.17.1789608045973; Wed, 16 Sep 2026
 18:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915052021.6959-1-syhuang3@nuvoton.com> <f60a440e-1b9d-457b-865f-b3c4778d966b@roeck-us.net>
In-Reply-To: <f60a440e-1b9d-457b-865f-b3c4778d966b@roeck-us.net>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Thu, 17 Sep 2026 09:20:33 +0800
X-Gm-Features: AcwNN1UXSRHVsaDtbTNimMW42Y1gjHq9uS4TxC2W27XMSX28femBTxPDTsjGqk0
Message-ID: <CACW=pY7u2wOzgc05gHfRVJFx12CXGvZe7fCwgPZ_y8dSo02PSQ@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2026=E5=B9=B49=E6=9C=8815=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:37=E5=AF=AB=E9=81=93=EF=BC=9A

> > @@ -1129,7 +1147,8 @@ static int lm75_suspend(struct device *dev)
> >   {
> >       struct lm75_data *data =3D dev_get_drvdata(dev);
> >
> > -     return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTD=
OWN, LM75_SHUTDOWN);
> > +     return regmap_update_bits(data->regmap, LM75_REG_CONF,
> > +                               LM75_SHUTDOWN, LM75_SHUTDOWN);
>
> Drop this change.
>

Thank you for pointing this out. I will address it in the next patch.

Thanks,
Sheng-Yuan Huang
