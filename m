Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795073160;
	b=SbEjDbou9nLeMhFo+bDLkoYWkijBmubdQy2qAA5yQkix4YlNym1yFRR9NPj2JsA12fE1
	 hghNbGf2r4gOHlAv7hslIhzIUopQxMkRruSrQMOjp4inHIWJXsXwufwS1NC9CbATooqBj
	 dp5+ZZyueKhXfowXaQxLAb2wwyhvmf8oBrhUAgZPL4yhrWYWzTsEawQvzCtgUO5CuT1+s
	 ErwPA5ZJHG7GSsa0zr8v3b5Qxi0OY27Uh7lZw88NTIHhTLvWLnRG5owJJ7IfShUCmdyIH
	 VKQGtSVTjUE5MoEnjQxgFO9na36znEUWyLPRtNTofVpSumeINXDpCjjhBTC7Hr7AD7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
	b=AxeMTopilz3OihaqsnI+xVC4laqnSMzKjksHSalfnjWPIn3OuFmozrPtwwbnhIOIyfTC
	 B5b2qHANHen5U80jiwkDRuf7Hr8whmY1MnxETAmWgFB31pDHXC0Ti39EIVlJe39jmgVGZ
	 EDtMCp02fm9TUiCDtqVXTKule7dcuG+ohm8d2lCrBrx2xyV6OFsKow2oEfIJsBXfvrnIT
	 bQm3dl7OrJfmB/N2/hYbW6Hl7k9izw0lF2ib2rx6LMXjR6oF1Af9stKSWRX+vNZi5Z6vj
	 KxcY/5z0ib6O+WkbTgC8PGc3BQUdSJnRrTMNeAxh/Kj4FKLC3wx/Y9GBAntmzS/Jzyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC8Id32C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74181606A325
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 07:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74181606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC8Id32C
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso2472919a12.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 23:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795073159; cv=none;
        d=google.com; s=arc-20260327;
        b=VRRo/8ktehjdpJcWBMkINyPRa1IKZVt4Lrw9KsTXWK9dEBOK1ilOldfMVb9YShMfT7
         z/hoi8v0Oa9qaC1rYnS+wE/O/EwMIHGV1wSMFTvBmzm+ugWl+IbCPoUS3RH323H88gJ4
         uP9yybiy1edR7C3uOOU0w8+kiUZKWdydCu4EKpHHJkKUNwZ1SluiUzGMNitGFSJ9eB4V
         p+57x0BoDfnIR7GAqqeS9lIM83lPd7qO2kOt73+VEEK5ebVaKwcs6AJnBvX2UFA825bP
         woyyttuGxo7s05FrrT6e9NyoNEFsBviUoIprZYyWOPXrDcsdXjExOA7349hGMyVhVpVE
         A7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        fh=zRHJ6tRegZvjHjgnfqvmxy3hEHSSKAito460QivyIfg=;
        b=b29/NsmsioEgyFyaOZtEzA4jmww6xFU301zw/0xTkH1tfmfThfrNiWmTCNpsndg6ss
         JoIP2SVCvzGoeDBtdaX8DgcysfHomXrRwOknwPn853GHz9OKhwZimI7c1Et6DVWXsFa8
         RaDNje7rBPyI20nlZRaPlr8mDm1XCP3s0ceDVeTfs2BCNl+H/1uB6cAD/Ot+2fHcbmZH
         islgnxVTnaUcmP62rOG4VLWknd/dTM1HKwIa8KBzBy62O7ic8Jy6l+N4QjOQ3U9FTRiE
         gZ8jmDh3oPnUlXQ7xATDUR0BY1NdsuCZNoOIa3oGQKvSd+jY+PyRYwxpOFr0mfCCIxIw
         J4hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795073159; x=1795677959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        b=HC8Id32C7RWMZBoXz82YJl81D1EqvihefSHlq5h8EUvLSFNV9QpAdr3ptsjLkhST3j
         zfeLncnprzaUqqgGCoJpffiGs1ll7ni4xogqY0TsPwmm0Iup0b0FIc/aDmk8ow4x7R8X
         NkEozZ084pCEcLtx8z3iF/CHKNhBmGYUkZTvTGRge93vS+FXkrk3854Fl+zvjjuBe84q
         pP2RWLoRXjx82FqmnOZ51tgibYjy1PqAQU3Fpw1C0PQ+zmOZ6TLMRnoy1iZL25Jq0hxI
         6RgD/BUnuFcHkkck/TOxfpseKYnGcK6NEFHAQ45r6dKn8UZwicceVJgsfhzDZZyn1jHP
         YPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073159; x=1795677959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        b=v8MZGOk0a2JQiRoHgLjo+H5uu56ldYm0DoyLUdn11HzFZGIGQoRh9opGyajz7kMdoL
         GBUjjAo1cyr1FeAJs7R779tl2NqWoPP/7D0MXdpyY2fGyYVcLMdUl/mNrwqHKqfFzytw
         34RN1CzBLcQyo2XcRnbcvD+EvxNuYeNkBZb2OdvVMF5r0GiIU3ykjSjITEVW/oLAC5IC
         anFPN2Xitp0JqR+pZJz34jX232O1nXLGV/c09T8H4T8ZKcHPP3qni8P5ApIkDD8Ll2Am
         D5FW4jI2vo9R/7dXTysdFp+YAJjkM3wP9vfxliqYuZZejTJEI1qgQgr1FrczuxwTTYLl
         ytTg==
X-Forwarded-Encrypted: i=1; AL+hErEP26PULe+rhhecQvnKGmE+c8qfzMkxeuy0PB9VrQUxrw+9pd1jKCILAftUgLbyBtFSlBFP6irKLbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yYyKPLl4COywLKYMgwb5NViq553UNx6ttjQibLdDViam28H1Q
	cvhHxecKv4ZNrWqucdWxYtZEyxTPEIxU2egPqGpa9DIuSLKJ52sy8zyxShvpnMJTTLzqQr5w5XE
	lGIRkQYErFt/JPnVRDweZwqZ52CdsnJk=
X-Gm-Gg: AYBFou1/ZpqVV+nG0D+fDS8qQLEjZDKKYzIBLXAbbXMeLX97+kGYVvMp9gvf53CE9aV
	zEzFW+EepLw2cJsldim3nzmBoDiFp2kCNtBcaaO5f78D5MYFM2ebLbeBmVRhGtxi9/Jj1B2jO1i
	vQySUO2ATfjJUe3dhHEYjbbavyxE/xZjaIG9fQysriIeKwsYqQTul1Lwu1p4E9svVj081T7hNoD
	RXRNjQLjK/0F6w2gt+HRxLq9uXEQpUu+U/9g98zqXeEsCpu2hmYg2NFvCRjp4bw/8s1V+reUZuI
	sUZIaaN6v+FoBtE0rvow87luCoEaoPpwN8oXhsCS3Xni658RUiFKNcUOA4tYGrkqHT1EqkMMtmp
	0TMRR1olA6wuvXKVMyxLyBekYMmOUVe4x5JdB9Z8TGhTlSRLfI/f43O79Q1RUrPe6ujvOoGSMCV
	cjcOU2BFk9Au7wEZHRNLcUnmaozdovRjfB+F7Uvz6i3eWL
X-Received: by 2002:a05:6402:2350:b0:6ba:137c:70f9 with SMTP id
 4fb4d7f45d1cf-6ba137c7371mr579765a12.13.1795073158722; Wed, 18 Nov 2026
 23:25:58 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-6-200317e496c2@gmail.com> <c212df8a-6ff7-4a4f-a90e-7bb6c073f617@roeck-us.net>
In-Reply-To: <c212df8a-6ff7-4a4f-a90e-7bb6c073f617@roeck-us.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 19 Nov 2026 08:25:47 +0100
X-Gm-Features: AclHuK8PPneiYACCRObBpglxAjEW3linYDQRjYYK3WkE2RlBOYGn_Zv-GNu7UxI
Message-ID: <CA+=Fv5TteAQNLesw83Z+p8GFYiM+Bs_JYdVJyp9bGPEP8s+w7Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Thu, Nov 19, 2026 at 5:17=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/18/26 16:09, Matt Turner wrote:
> > The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> > ES80 and ES47, monitors temperatures, fans, voltages and power supplies=
.
> > The SRM console describes each sensor as a packet in a power and
> > environment node of its config tree (GCT), and fills in the readings
> > when asked to refresh the node. The packet layout was taken from Tru64
> > UNIX.
> >
> > The firmware gives each temperature, fan and voltage sensor a warning
> > limit and a failure limit, and reports the sensor in the warning or
> > failure state once its reading reaches one. Neither state means that th=
e
> > sensor is broken: a temperature past its failure limit is too high, not
> > faulty. Power supplies are either working or failed, with the cause
> > (AC, POK, overtemperature, fan) logged by the firmware.
> >
> > Export the sensors through hwmon. A temperature's warning and failure
> > limits become max and crit, with max_alarm set in either state and
> > crit_alarm in the failure state. A fan's warning limit becomes min, wit=
h
> > min_alarm set in either state and fault in the failure state, which is
> > when the firmware counts the fan as failed. A voltage exports its
> > reading, with min_alarm or max_alarm set in either state and lcrit_alar=
m
> > or crit_alarm in the failure state, depending on which side of its
> > nominal voltage it reads. The console gives the nominal voltage and onl=
y
> > one other limit, so the voltage limits are not exported. A power supply
> > is a voltage channel with only a fault attribute.
> >
> > A refresh keeps the boot CPU in the console with interrupts disabled fo=
r
> > up to 300 ms per node, so refresh a node at most once every 10 seconds.
> > The hwmon core serializes the callbacks, which also
> > serializes the refreshes.
> >
> > The console callback lives in core_marvel.o, which generic kernels
> > built with ALPHA_LEGACY_START_ADDRESS leave out.
> >
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> I assume thqat the series will be applied through an Alpha tree.
> Please let me know if I should apply this and the next patch
> through the hwmon-next tree.
>
> Thanks,
> Guenter
>

Yes, I plan to take the whole series through the Alpha tree.

Thanks a lot for your review and feedback, and for the ack.

Magnus
