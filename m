Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C949D14F11E
	for <linux-doc@vger.kernel.org>; Mon, 16 Sep 2024 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726487566; cv=none; b=uh3YruSB8fd/moBELNtpKBWC3VCW0U5j5Gy5pwsK0nhhnfcpA5YGWWy5gX+s205XnIzVeuyUkAoeMtULpr34iYoiBfuvNP6X+qQanUd4dF0IcK5WUOsasopHZJGBJ6AGCgTAd2fh51KFPWtqCeG83+v1PE4M8754ZzfbQNvIVP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726487566; c=relaxed/simple;
	bh=iM6Elp/sm3jXr84spvTro9yvti0Z6xFLw//7YQzRUs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZDlwvVYFEyzUKmOpVB3BFyYA0bY6AdwYbIRhRY8BRpJ/wvYb1MEZd4Q0kYsVm+/IqYfbqOkT+H4s+n0jkadCvlMxIiimM9MVsKVe5t/Cb1dKzk/4N0iHP0zh6c1N/HXHTgLpcbq/2Rg+SYiLQhVpqryH1VgYprk5Fcr/FqTUmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SJ4uTYFX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SJ4uTYFX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso43145195e9.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Sep 2024 04:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726487563; x=1727092363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Nnm0NJxECZsYKIxc66BOTbDGAWNLQfv5K6G4LcFfNA=;
        b=SJ4uTYFX0Zh2r1Vv45Q5qpWhroKBTnXtb6kbmHrYxALyKbX7Dgkw5toBv4jQAxN4fc
         9WWJwvD47I03nP36UNLHK2eYFVo8kmJqMLhGuysJ2hxqGy03mGiIdHeEjdfWX5Tvak2q
         smwz4tke9sZAJiVtXsfaWb8W2k9K8n/7+H0keWMOYlKGcpJOLupuTNr1AHa3545uHVox
         YRBCtnrec1XOOHzxbHe7cwC/Hwi2n0DIemUKyNZrc5rQnRf3wsFZYtF3n4gS513Al8ro
         yM+SqFwZ7hXQ+6fPfbHgbpM2yTUQwi0d0zBEL3pw7EKuckPfH/DtiJ0MMvGjhaJoP+d0
         4DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726487563; x=1727092363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Nnm0NJxECZsYKIxc66BOTbDGAWNLQfv5K6G4LcFfNA=;
        b=TI8hLnH4gy3C+/ZW/Z6NTCavGVy6+qS8iInzK6XOec+WDEsuzgPrc9uROr3a6H2XaH
         76knOTzzqQ3vhuEieeNcfor+//krhEFOrDLFwYVrW0oyvQ5ptCVX5uVtbEL1+TK/OYm/
         HTyoyxw04at2QIZl3oOd9tQNygpwtWNYSvBKHh9rMZOWstEJVgvXGU9EI/86eBoiQ3oe
         gSBa0ZCBVtOlCpmPeBBgQPV8czw9q2dncSpJ74Cg0J0iWqdAiWeQ8uM8tQnyOwD9Coek
         UqLKB1O5lvk5/WvBJVbHLCFEJk+mCluZQRkgfQWJ0xaM48i/lyG58PnvQFb2qjV+3Hzf
         FngQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUJbuOfWGvcuj8rrvH7Ibt1o/pkFvx4n0c0jGKZPULk1hVN5UsMvcLtZHfym7r62J+Q02C7XFOqe8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/oOn+LvGgmX5yF1XeQahOa4H+y3EgxPp6OOKt/m7BJtcvHolF
	qLNZET0QoSmDZlmf9usXnt6rc13AI8m8m5p0TUDMj/iHLsxWBUYsw+LlnkkAkNo=
X-Google-Smtp-Source: AGHT+IG+nB/JdmngCxxwK51J6HLRZl6BCx93nl5weA40RhBfhLNEyVA/mVGYlSIHIPjNtSUAWAfihA==
X-Received: by 2002:a05:600c:4709:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-42cdb59148emr112642275e9.30.1726487562944;
        Mon, 16 Sep 2024 04:52:42 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71f068esm7128543f8f.3.2024.09.16.04.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 04:52:42 -0700 (PDT)
Date: Mon, 16 Sep 2024 13:52:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/3] iio: adc: add new ad7625 driver
Message-ID: <6f5sqahnu6nxmzzxfj56432eogjcgell7c5sth5c2arvekl4sx@ndf2tdl73glx>
References: <20240909-ad7625_r1-v5-0-60a397768b25@baylibre.com>
 <20240914182848.34edc5e3@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cxgr57ac724varkl"
Content-Disposition: inline
In-Reply-To: <20240914182848.34edc5e3@jic23-huawei>


--cxgr57ac724varkl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jonathan,

On Sat, Sep 14, 2024 at 06:28:48PM +0100, Jonathan Cameron wrote:
> Uwe: From a quick look at [1], looks like you plan to queue that lot up
> after the merge window.  Would you mind doing an immutable branch for
> me to pull into IIO?

Yeah, I intend to put the changes that are necessary for Trevor's series
into next after the merge window closes. I'll let them cook a bit there
in case some issue pops up, but then I can create an immutable branch
for you of course.

Best regards
Uwe

--cxgr57ac724varkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmboHAYACgkQj4D7WH0S
/k502Qf9HWLuQ3QzDMRhm1T2ncwqa6goKIw+Re/Bc9REUzdTrbP12nnNzS4elX5L
qrrNMwWiIjR/r1wlUYEanG96TZ14Znfjh21TkCMfFbMXlH470Q2SyWmSuorltMPe
wqyYx221eZ1vJnDfHted0R/zZj14nGLoXS9hwYNDagPaQ0Qaxi6fvrqf82TU0MeW
gKI+FYp8Gx8Tx4XOVAnxVIUaEcPfEDlq7BpD39WqwsyvN2Iu3Cg4Gs67igZunYaZ
Lgyb90e4lVDOH3cqycTDE3zt6ZAczriM9Q3Sa+rDssSGx+hs9yBxPjtUEztywTKk
8A0QJgrIo+TVEbAule7yiCkyALxAiA==
=zCsY
-----END PGP SIGNATURE-----

--cxgr57ac724varkl--
