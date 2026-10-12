Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD15489FCB
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809353; cv=none; b=Q48CPNGwcMHq2XwqASw0W1IUaKgrzHzn/6tW+FNDLMP2WYp5XyjMTgzOcykLH08vhDjW5nzX31m9R3rJFy4DMG2IQ2ewCmqaFL0JQAwf/4YFxB0lFt3wu6cd8tB7QZLUhz+VHKXKUtWDrJeMP2gL2SW6Rc+qr8vkl8jhXu10iLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809353; c=relaxed/simple;
	bh=14phVvYRrJPhd267XL2Fy1Y5N819k4Yyec3jG7Q2YLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewG+gSB9IXp6zpqOnBodXl7KvDnAq1gM6BIDciyWEyRhZtDwoCYcEPVwU9w4CIPt5Eb6lCiIO5R6+tY4MH1DsUu+zEX1JOZ71cl3xPZGOTwkHdT4q527Qwkn/o+vrh2HpF1u93jGmzKZrtTt4qUfuS02CNJiVWaNRwO+7CAcJkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=n17K2Z3s; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="n17K2Z3s"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1790839f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 05:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791809350; x=1792414150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aJj4Wm615H/imfpMwNI2qT79o5fgFKI50ixCq2u6D9Q=;
        b=n17K2Z3sCsrvRyCFf3XCqLh0PNSd40bmMvV3lmOzu3+V59KUsn8qhBTVd1IIwiqYem
         zt1NEQ6L7l54SBCAgL10DkSfF4k7Ofdqh+lUb4FDnlId0CrWJnzW6g09yYdIBIyvL/jB
         gG4+8nfWMTpcHVsbgdNjeprKD2RvXpaY/B/FlJaOHzgOwYmDT+ihz2IkLNzfEg3g2FZR
         8HI4QpFNzlFUMKt1wKecqqhYvRQpk2c3LZrVIaWgo1/u1BLPhGPMF88JWL7z09eHTXSg
         988D/7eiVFvcSJaPMrW/HHrcIa8xgKY8Bp5OhBlcbDK4X/ny0dzNWK49DSulVoXVyHp/
         VLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809350; x=1792414150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJj4Wm615H/imfpMwNI2qT79o5fgFKI50ixCq2u6D9Q=;
        b=F/jmt+7F8AXf0wPkXLnWQilcc6zbrtF9Z0d8G27Ob9OF8waMGNPiZWp3YjVtxMY7X9
         1AaJy9Nbkz/Tj4dWZ9e8TdEexVhTf+9MYawDWYCzDhorzzA9UqNIgJzr5EkR+4X/XQ9k
         sWDYjrQFLnyX+DFAdt3/z8xCNqJfCHdwRg2+cRegoU2cj5se3ISJodkymWA5qB+3DSU8
         r5ISdXuSsZtsAIv4rqpxvTBpQbTaZSiKKn+R9nfxdPGLQuNdeTHftwSJEN3hTz7RfsjA
         2JMGvKTa2mVJountUAFBVRtnUue79Qy2lOZBg/ODzUx3tWu8/p+E1Zw4zrHbm46GsROT
         47+g==
X-Forwarded-Encrypted: i=1; AKwUvBy3+Xljsm327nJK3pS89nTkuOBBLZYDYqAqddvYHlKAgvMz0oeQK3TMG6UYKqkY02oictT206Zl3uA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL68oT4UVnua4I4pvXkamjeF0+A5kYukdA4uisQomjuOoPdKnaL
	AGcsONMbT9iffqBDqE+VHwzqlXjqGkDHoQfGwhIuqzXeTGhWP5ATbKAI/RmkSYiFUXI=
X-Gm-Gg: AYBFou18fI+M5ufibks1mKz4Ojp8yyEqR+kj9hDh5qg1bYPSMxgfI8/4k55lZy1qEZO
	Gj0EccBLA9ZyCm6eqMT6UfcnX0/tFK35IgoNT1ZN8lqiZDECKZP6eM/y70c89oh8Tn4kTEH9GeM
	dn9MVf8s3z5nJDE4Ry/qfe1TeDESAgoj5eeAm9YW5PXDZjP+yzcuL6Zs6o9ukOlf6ZurRgzOrty
	16j7CQJBNOclT5r4/W+oN7vlDXWGqajH3YZhTB4ANkENkHU8jIQBTHf5dj8Bws8TClAl7xoGhI4
	/6I9/nzKk4O387FcZ+Vb7k4ApOwAYal/u4CMUTCJt5/237QoGRnI87aBozniebk0ijTTY+1q1Fr
	GbAqIkaRwMu8y8udz0q8fMMarLYmKWpmi1c0oFS+E7UCTSFxocpe/6kv8JiyDsl8Rzspi89EZc/
	KxNLerWT6N32BLYTOtWC9/Akyd8zMWVmlh6m9NLsfloqBkk9qW5q0uYUksRKJk
X-Received: by 2002:a5d:43c4:0:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48dbaae8e33mr13956577f8f.37.1791809348520;
        Mon, 12 Oct 2026 05:49:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48db97ce3aasm19818827f8f.21.2026.10.12.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:49:07 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:49:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jingyuan Liang <jingyliang@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, hbarnor@chromium.org, 
	tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
	Jarrett Schultz <jaschultz@microsoft.com>, Dmitry Antipov <dmanti@microsoft.com>
Subject: Re: [PATCH v5 08/11] HID: spi-hid: add device tree support for HID
 over SPI
Message-ID: <aszWnnc6RR9d5SYw@monoceros>
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-8-384af01da3ee@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ey244vnbkokc4rpq"
Content-Disposition: inline
In-Reply-To: <20261009-send-upstream-v5-8-384af01da3ee@chromium.org>


--ey244vnbkokc4rpq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 08/11] HID: spi-hid: add device tree support for HID
 over SPI
MIME-Version: 1.0

Hello,

On Fri, Oct 09, 2026 at 10:25:33PM +0000, Jingyuan Liang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/spi/spi.h>

Drop <linux/mod_devicetable.h>, the spi header already provides the
needed *_device_id with less dependencies.

> +static const struct of_device_id spi_hid_of_match[] = {
> +	{ .compatible = "hid-over-spi", .data = &timing_data },
> +	{}

{ } please

> +};
> +MODULE_DEVICE_TABLE(of, spi_hid_of_match);
> +
> +static const struct spi_device_id spi_hid_of_id_table[] = {
> +	{ "hid", 0 },
> +	{ "hid-over-spi", 0 },
> +	{ }
> +};

Please use named initializers and drop the unused zeros.

> +MODULE_DEVICE_TABLE(spi, spi_hid_of_id_table);
> +
> +static struct spi_driver spi_hid_of_driver = {
> +	.driver = {
> +		.name	= "spi_hid_of",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = spi_hid_of_match,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.dev_groups = spi_hid_groups,
> +	},
> +	.probe		= spi_hid_of_probe,
> +	.remove		= spi_hid_core_remove,
> +	.id_table	= spi_hid_of_id_table,

Very inconsistent alignment of =, if you ask me, just use a single space
before a =.

> +};

Best regards
Uwe

--ey244vnbkokc4rpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrM1z8ACgkQj4D7WH0S
/k5u4wf8DQCuk6roFME/n1pKDY6+qOflxre3Nf6NmaZ05olJWzf7xMLHiGj0xlvH
rCXdQWSaJaWnBK8rKxyK28S+MmDDqDnW+WAK6FXQVv8Srv4/7Uiy7+5hoTWAw9CP
Vxuzr9RagEgpRyi0DyMZlaoFh3bqtZmx/IDNDD22FCwEJcVhvEpBv4TVYHn9L/wj
XXmPB4PiOuJszPGD+WIhrsdC1Zz17JoO0v9K42vVKKAkYir7a9ABA4fxMMjVxgqf
ixRyg7HTQo8ggOzmpFjoj/atoZ3XOBVYSQ7RLbU8ZgRcEu4xgL4yKP96cUXwQ334
ebpZbkR6VGklGZOq1SeOk7zN55irKQ==
=nzgN
-----END PGP SIGNATURE-----

--ey244vnbkokc4rpq--
