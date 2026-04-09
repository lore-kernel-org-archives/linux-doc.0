Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E63A544E
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722747; cv=pass; b=MagWsaOvDqNkcDB3H7frBfVfZSNAWHcvbnzVzeiCJhBGX8C+tiCk2go25CoJ7mJdywtmdrgHxQf3QnshSUBVRDKCjCzhQ3TfUf30Zyya50rAhobhAS+Nm09W0CChD/EJ1Ity37zFXddNX0o5iXA0g/9BMKC5ty1iv5IHGTqDCnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722747; c=relaxed/simple;
	bh=GtUkGmQN4EL5h2rkR5WgfM1JZC8AEtqZRGbgJ5anoLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSTrF1Wlk41zQBXp9np8/hYFhY35aS/cncmRno3LRZDTUc/3H2gDsaGhgH2ZYNxsfPf+XnbBlYO5KXifGFFNQgf249woegmEBBjg8nsVi9IYPFZe72PUwEPqU2nn5pI7pV/2Wfe92qH2HfYEdGnbUNs8feZzVuTVP32gVEYH+io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNuxb3OW; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNuxb3OW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d9749c26dso633396a91.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 01:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775722744; cv=none;
        d=google.com; s=arc-20240605;
        b=A5ThI46GcTVp5YnO8HRSYtkkJAISIxOowQ2rnKsYUHh+KOup59garHjJ4gOdbQTQxz
         zFuMymJ/gAOCyV55aQuDBiJpJeWlHewIZI0stIbOsAfdCfNpahVMWlRHo2GsHysWKz3i
         AHr+vF9OiVufOBfIB4sSqI/hIvI8mmEbcM/I4iphqZ10eRHHocgpPDtr2dw0nRpON+VC
         sO15VqtB7rX6/vnbckSs0MqYr0HawXHj8/vVwG5fpOAHK67sYNFJ4sPIb8OhCGh9BWZs
         SCsVUD+f6FvIiGcZlrnyZ90LTdoEobliMWGqUymgkgMsvgaUGzx5Ksr64/bBSszuInTQ
         owKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HxaRZLSN39qvxIV0ix/Q0XZyFLIVhPcJo8ZKpZblht0=;
        fh=YnmrqcvnxO0TYJSUbRqAIz8YUZlsvBCLAurVrLjOdko=;
        b=hEjS8O6dAcTnXGyHgYji39iDKftQQG9ySGErI91+S1CasnYGi8IJTRfWV0jpyZ+0a6
         Q8X0jNjTlMAeuTuuzLyDn7eUXAK41klmD8fNwNnfMoj/Y84QmyIHo3onT0uT7uKwxPAN
         jf+OP5GgLOAGpBx0ZO6wNiacyAzm9kjgUjpylmbj7j72A8AFxBunExDRmqfVQi59VP/h
         xhcHax9tpeVs8g3/g4ctPibzP+hG7WoD9C3tN4JkUk+pQN9drCQ5SlZL2phKUKTX+pgO
         V+of2Ii+PDE0tsgXZtMaJPLwkPouP3VIe7MI9Hxr/CJhVqvTVoZpzfvNpgEfMHFOtXmK
         1xAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775722744; x=1776327544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxaRZLSN39qvxIV0ix/Q0XZyFLIVhPcJo8ZKpZblht0=;
        b=aNuxb3OWSm7AxwAOpoY0MjpWL6+TIljVkCAHFMqeFKtn/gLMrWkV5+yp4E6aVf9eKo
         MyTeEdMavTgFAtEvhi1/eniuOfjiLxi8DKrwIRu+qkcluB11uxTLZAgCJurRkrql33CR
         GW7dnKGgKWDh51izTBxr7cuURIkoEdXnLRwInI+0x55FseYKoo37nZz9kHGPe3AM6Q1I
         XkenLNdBWLSEYhKC9wzc1DaCyVbL2hfhYnq9cOcynx8Cx1UscPI9HX35Ik7TdoBmlQpG
         1VAoTiIQlmc/TDa53a5o2PDFB66mNSJUFSkJ+9XdxrfbGsKf8471oDEwaIxPzMN8o0fm
         nfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722744; x=1776327544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HxaRZLSN39qvxIV0ix/Q0XZyFLIVhPcJo8ZKpZblht0=;
        b=WTXELUKeYij52WXYZNAG8vmQ6RbQs6qkPsedTyXUzsSdR2Y2Ddwa0AkOyIdPaBGOpq
         gyvKMknhzpQugon8OC0oGxvUearG4nRRg9JcsaoR5JxrR0TqUshdA3PwwB71POUZ0PGh
         aqL80Ble1w2bVvzWt1GdHaEHmPRRuanA308o1V2fm6QEsRgGopiHgwwIYdT30b/06C6m
         LkEljuFxLvOWvWQ3YFK4GrD+ETLLdVPeO4xhkQL6gaArcKakKm5H6n6b7OEKOnM1Qvkx
         0TFsz43xEyAQUB8YlvvjtxUCZXHiZb5oEp0rftAXoYyxIVb255zoqqsyUh1zH9QLiD3S
         CCwA==
X-Forwarded-Encrypted: i=1; AJvYcCV0PDRwbNtaDk3A4RkVuobY6GBw8AUluZM75lHLuIei64tYeyHLV72ttNTnDkQqhzgC4ffEt0uQ3lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvwoIi/+xGvABD75Xh3OlNZhWv+dCXge+rQoc3XSbbvVnnXWD9
	tklzdLge3R77sYYgk5T5SAyhLrcbJBKBP635tuD7q8IvIIkuD8T05vtL75qkdykU7IKwjR3yyoo
	IW3sPkJyBo1wz+r4m62T25CBmkPLo6yk=
X-Gm-Gg: AeBDievw5XFDRiyJoM1q0EjZJUqiSMc4it8mP9aqSaU4AKgYETY+sFBszE9nbtm1HnE
	WVeR26itIOk9xiYbkLIq14Ref6fycvNVOnZTZSYLmLYYwH4UObe5xF1Sb3/YWImRHG6ie+EYwVu
	+FVis66NecFKB5A5zLZbfi/gksgrW4lrhveZyjeK81Oy5S9gVncgs6oqqT9M054pfcIGFsTdFaE
	sro7Hg6OEEEJpssI3I0jdChlnJqPck2sPjKM2XuFNuwCvj+Gh0YBMsfrnEYHGFlrZYhjeVHa/Ew
	jiW1m+q4gLO1850dUH2+jyryvy56M8+O/i472NS8
X-Received: by 2002:a17:90b:5583:b0:35d:95eb:87a1 with SMTP id
 98e67ed59e1d1-35de67daa63mr23825380a91.3.1775722744531; Thu, 09 Apr 2026
 01:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403210343.1380437-1-eugene.shalygin@gmail.com>
 <05e9870a-5d8c-410d-99ed-6ef9470b2ff7@roeck-us.net> <CAB95QATxrJa0koMq=BCjnXvLHJ5boRBUA+76FwqWJhmhEi-Tqg@mail.gmail.com>
 <25bbdd98-656e-407a-ada7-da2bdacb1aea@rxtx.cx>
In-Reply-To: <25bbdd98-656e-407a-ada7-da2bdacb1aea@rxtx.cx>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Thu, 9 Apr 2026 10:18:51 +0200
X-Gm-Features: AQROBzDHSH2nSG-G3TRcvkXFHA35V3bkCM5TDnwJBo1p0NXqcv6DGpUkDODdnGU
Message-ID: <CAB95QAQfXs4VDr35UiuszqD2J5EmtKeqqHZh0K9_50X-T2MBbg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI
To: Veronika Kossmann <nanodesu@rxtx.cx>
Cc: Guenter Roeck <linux@roeck-us.net>, Veronika Kossmann <nanodesuu@gmail.com>, 
	Veronika Kossmann <desu.git@rxtx.cx>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Veronika,

On Wed, 8 Apr 2026 at 22:29, Veronika Kossmann <nanodesu@rxtx.cx> wrote:
>
> Of course:
>
> $sensors asusec-isa-000a
> asusec-isa-000a
> Adapter: ISA adapter
> CPU:          +37.0=C2=B0C
> Motherboard:  +38.0=C2=B0C
> VRM:          +51.0=C2=B0C
>
> These are relevant to actual temperatures.
>

Thanks! So, there is no output for CPU current and chipset
temperature. Could you, please, test that CPU current displays
reasonable values with the following additional change:

diff --git a/asus-ec-sensors.c b/asus-ec-sensors.c
index 47e6c2db8b97..4a0b80012a6d 100644
--- a/asus-ec-sensors.c
+++ b/asus-ec-sensors.c
@@ -284,6 +284,7 @@ static const struct ec_sensor_info
sensors_family_amd_600[] =3D {
   EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
 [ec_sensor_temp_t_sensor] =3D
   EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
+ [ec_sensor_curr_cpu] =3D EC_SENSOR("CPU", hwmon_curr, 1, 0x00, 0xf4),
 [ec_sensor_fan_cpu_opt] =3D
   EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 [ec_sensor_temp_water_in] =3D

At least it should correlate with CPU load.

And we need to replace SENSOR_SET_TEMP_CHIPSET_CPU_MB with
SENSOR_TEMP_CPU | SENSOR_TEMP_MB.

Cheers,
Eugene
