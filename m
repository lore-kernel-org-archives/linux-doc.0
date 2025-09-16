Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4610D2D641D
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 18:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758046628; cv=none; b=MZTr/pO1fCCQK1+VvCbnXAbB0v4yW8nhjNuXpC4uO0Kwstgz7esk37im8S/BOBwQ7nOBOKDZeyoZ5XGUGc0g57XvBPwtqxpao6YsT2twfupM26PQ6jiKFXxUD5gLle8qK76anPcEQ3tEjVxRSS0mVfr3e00UYqnXRSbZR/WHEa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758046628; c=relaxed/simple;
	bh=MVPzMTONaBJT5N+hHaYmRy0C3P3AER6E6H5SQzBvo3E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WjrG1iX/jM8RH3eGtJITb93RQ5U63YxR4QmjgKe72zV1i15a6N7HKIuNTTKT3yLvN8Noht9Qx8q9Il+TgC4F0th/OHXXWr6MuLgGOPzU2tBBZaL9VcZuv/TkuTrqA6vUVGNqHLfD0QCwd/AR0iSBinCWDRnbvhfqAwBWvy3nVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ix1q3Hq3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ix1q3Hq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758046626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiJbWUk9iK3Va6WQUOfyxO/yZVMoTNTnNrKsRMOKeVQ=;
	b=ix1q3Hq3cglxgBFdGtZsrExevc/93QcbZRYkA8FR6Rj1CGa/A1FhlzpWp68FFDQWoSMzjh
	btYKyvdbiYKF+/JLslMzwJJrxaeLhn3f3ExhhQ9GYbKPgWIiGvQ9ke8y2hhhMNjBo/n8Oj
	LceEq1Qpa06LoNcochnmD6ieg9d9eMo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-VhcOdW8nMNyFkiPihCGveQ-1; Tue, 16 Sep 2025 14:16:59 -0400
X-MC-Unique: VhcOdW8nMNyFkiPihCGveQ-1
X-Mimecast-MFC-AGG-ID: VhcOdW8nMNyFkiPihCGveQ_1758046619
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b07cc3f115aso143642966b.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 11:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758046619; x=1758651419;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HiJbWUk9iK3Va6WQUOfyxO/yZVMoTNTnNrKsRMOKeVQ=;
        b=s/udvWQrRgh4B/cM6mr2K1y2wZEni1eKabIHRDCd8cXSth1vJHUXhdNPpnN8NVtQ5Q
         iZeAtx/oiQ2nq7SRZvSKOGskEyWSMC8rryOgQ+HM8ggsrbzMmG/nzt/I7X/0ckQpQMg1
         z8ZwSsvZ4qm1ATnECdh0zsgICg0QnypVjO3J0b2Z0XnqCbYnIU4cl+Y+71wU+mYxZ0wR
         eo7FwqpRvJSorWUa30ZqK4+L/P0yy67MuGz/IZWr1Z2U+Kjc8bFGPeWI/WRcTIqGS8KY
         si5ZXrF+2EfC37V0FSa+3BzG1CxpODN1tFFDk8DGjGT7lwrBLBHieQZlCdRlm3K/FDoy
         NX5A==
X-Forwarded-Encrypted: i=1; AJvYcCWmHiot5w0wqtT1YOax6sxTLqHTrFZDYS94S20Zi2LEqLYfsfUcqVe4SEEjl4vPs+gw7dmp4VS83iM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKIb0O/7QLHoXFWP6U8PjAqHBV0UvXj75ZNccbHefmMKImBoX
	HWeIwe5lKzOsT5lYx7DBrTt9Mt1jctUWLQq/YEghD5j50cjV55OYOVLoDGJHGcFN8CXukyncnHb
	1bILzDy7s7bMJ57JEayEjwX98tuI9rx4fWLD5uZBfP1E5xeb9ISleR6JjSEL3FA==
X-Gm-Gg: ASbGncuLhY0TucwnHUV8F3oDt2YvQgqlpAcs19IjC1/wGc/kJyh7rxcBV9nmwPHiieF
	bI7pvNbUvzuuDW6SfpS/iLyiX8KJrpYXu36MZsu0mpgTorZxl7vZ80AiLPuLFyDfNbzfB0nbZgp
	5uroBpGWTjF0KMoRGir7jeLX+k0bpHBvMX4cEcOH+zhaBpUpkq/Ru32YwkK2Io2g7OC4yQiNbV5
	yo6J9eiGF5X2mVy5y6avYfOWYjwB9d/OB8KfPobTwwllnHn1vwngJ2lmR0aFkiNGGkfNnUuzz1c
	XIIDM9apTb6Pn3f3x6qLNt0dq+MIxytOKOotsLlpzH+6k7NG
X-Received: by 2002:a17:906:dc91:b0:b04:37ca:77e7 with SMTP id a640c23a62f3a-b07c365da98mr1673684366b.44.1758046618705;
        Tue, 16 Sep 2025 11:16:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIt2e9AJy51nO/jH/HTJfy0/9Ihn7bnnuR/FCs8J9Z85sjlp5JxyE81WyYIgw5qXRrUm+sBA==
X-Received: by 2002:a17:906:dc91:b0:b04:37ca:77e7 with SMTP id a640c23a62f3a-b07c365da98mr1673681666b.44.1758046618304;
        Tue, 16 Sep 2025 11:16:58 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a00:e580:bf11:1:ad04:3f07:f046:aa35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3347b6fsm1217873466b.111.2025.09.16.11.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 11:16:57 -0700 (PDT)
Date: Tue, 16 Sep 2025 20:16:57 +0200
From: Ivan Vecera <ivecera@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: netdev@vger.kernel.org, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_v2=5D_dpll=3A_zl3073x=3A_Allow?=
 =?US-ASCII?Q?_to_use_custom_phase_measure_averaging_factor?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250915164641.0131f7ed@kernel.org>
References: <20250911072302.527024-1-ivecera@redhat.com> <20250915164641.0131f7ed@kernel.org>
Message-ID: <FA93EFB9-954B-421E-97B2-AE9E0A0A4216@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 16, 2025 1:46:41 AM GMT+02:00, Jakub Kicinski <kuba@kernel=2E=
org> wrote:
>cc: Arkadiusz
>
>On Thu, 11 Sep 2025 09:23:01 +0200 Ivan Vecera wrote:
>> The DPLL phase measurement block uses an exponential moving average,
>> calculated using the following equation:
>>=20
>>                        2^N - 1                1
>> curr_avg =3D prev_avg * --------- + new_val * -----
>>                          2^N                 2^N
>>=20
>> Where curr_avg is phase offset reported by the firmware to the driver,
>> prev_avg is previous averaged value and new_val is currently measured
>> value for particular reference=2E
>>=20
>> New measurements are taken approximately 40 Hz or at the frequency of
>> the reference (whichever is lower)=2E
>>=20
>> The driver currently uses the averaging factor N=3D2 which prioritizes
>> a fast response time to track dynamic changes in the phase=2E But for
>> applications requiring a very stable and precise reading of the average
>> phase offset, and where rapid changes are not expected, a higher factor
>> would be appropriate=2E
>>=20
>> Add devlink device parameter phase_offset_avg_factor to allow a user
>> set tune the averaging factor via devlink interface=2E
>
>Is averaging phase offset normal for DPLL devices?

I don't know=2E=2E=2E I expect that DPLL chips support phase offset
measurement but probably implementation specific=2E

>If it is we should probably add this to the official API=2E

The problem in case of this Microchip DPLL devices is that this
parameter is per ASIC=2E It is common for all DPLL channels
(devices) inside the chip=2E That's why I chose devlink=2E

>If it isn't we should probably default to smallest possible history?

Do you mean the default value?

Ivan 

