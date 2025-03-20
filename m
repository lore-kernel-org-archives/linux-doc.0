Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5751E520B
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 20:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742503676; cv=none; b=u1jpU2Ys2FUnU0dYeTsdGKuToNL+ZAghYyCgFhDDnLqaq7fHmY3fOB/gYwwjFkw1FiFlIsSHrzHYOf7LqOlGPrvQcHNXxkfhVFVeeOe/EDFWrQ9zEaZVrwvp/QDzxbnB24bTlrKKnatwYE2PNkWkdk9UZ5FHROeLuOYaHjqK11o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742503676; c=relaxed/simple;
	bh=akoUxBA1ighux8JnAPCyxwHFsZb1eSOKkYyJaXVZOXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdC1a62wEJfgL4XNKOlqDYAAn7soPW1zOIfqnSaoF0vgGZk3p9S/4MoRBAPPMGl7vcWZpdbjD1M5L9hVPm6xC71WPOLwHfaQVNk2kirpAtcL4mF6xJYwq24A4mngHKwqoFez5PUj8/qyKeqJCzs8aqwaSoCC9dVBZIlVhV6z0+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=o2GWLK/0; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o2GWLK/0"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2b8e26063e4so597472fac.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742503674; x=1743108474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FoUUte5ljdke831I8NU54sFFz01ai2RoggYX+/lHrQo=;
        b=o2GWLK/0sLKSttky6n4Lb0jVfgW93gv7yebzrhiM46GyPTd971+MJaaBFJJNeo2Jd0
         EOfnfsWoRl1A0u82xZZyqhasrPKwbI6xa6K9qvDkOjrbbcKdEP96z2jV3+DA4oA2xFty
         MkbOohVAPkUFs7ydzuiAl11pwsW+q+4NvEQ9fDyKhkIAOqru7gr8AyYRMiuuNaBv4Dlc
         Vd8h2wiKo5Gfnn3BnOcxNu5UVNbN03vJkWKj5vcLYwe5PV7ayamcGpz75bq8te5cuN7R
         ZLcZU2w/E9pVBaDPwQAuRmezGmpUcuqyyZ1lNEtytLIlT33j/LZ0umgXNQQPONASRwz7
         Ycgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742503674; x=1743108474;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FoUUte5ljdke831I8NU54sFFz01ai2RoggYX+/lHrQo=;
        b=J6e2X/kvyUp5ZEFVcnHBSbc1ELWhEkGP9Z6YknDMcDV4S6hoZe21nH6cC2npreKoZb
         vooqBL/AkD0cbAxebU3ODxs7wpRJmql6MCnlT0e6kVOr5fvCb9o8S1fCXSjHi8n5g7G8
         RWOi6XtASvnUkgIwST5oXjxcTDowIfi3gWP4325Ee0JKoW8Oh8+jxaVXmvZOPXk7soTO
         vwStsju3NzdZowPiGtQI9Ft3CVmLnnX+ltG2iGhInW3zg3Bd7CEa7f0yTb02jUjTrv+D
         onb/z2trvikDcWfKBF4+O97DkwA3IKezdcO/6gLIKEVAn0EhkSmRsi8Ug5FsCaxICNYu
         Wfeg==
X-Forwarded-Encrypted: i=1; AJvYcCXnDys2CE4fvP4rLyvRr0maEQHZRRvlWrnxiSGNaY+ywO3/yqh2bVMDGZO/05bvTkYeD2SwtoDqRk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/djk0PBovlcbMCrlFN8qKRvX8zFhdY+cErs4xA7JoJzqwUrF5
	OVsm9bM23xBlkcHAxqg6IRpV4eoFjuKu21KwNFp7MINtP5LmiNugvxbzfp0N4/o=
X-Gm-Gg: ASbGncvF6r6IImclVN59B1VRTp8dojY9pTheMp47v+32oXLUHhMVa9TFsN27Rdpjbhe
	JasJ/PSlZPRDaWa4FXVS4sNaOfeMUW5s4kRAVLROStcEwLLkF6JjjR7kZfG7mv2pFW1o5D7zyu0
	K2a7Uvqsh//O4jgveQNg69+N5IGZRWhbhKpXADZ1UDv6NremdFkyvri7D0lbpXjPKzWsD9YAlbg
	8iXXEp4LJVdZDM9UjhQmRqKd/KjD1M/wNp4SGqN+KZ2qBtit/sa5zR1Gy6ATzIsdjNwRZf7ELc2
	zpO60T/8VtMIxyO14edfwkPRRmhHr3ofNnKBePGEMl2m9YCwzMY9d2sXqbIzsTGM3i2jpPucBlk
	MgI4dwg==
X-Google-Smtp-Source: AGHT+IEThj26dBTP4Z2xXCcKfq3Tre3BUTf1MdLUxFhzND7kG9B2/mI5ooNOAggoJaMyQPPsgC+yqQ==
X-Received: by 2002:a05:6870:f70f:b0:2c1:4d78:57b8 with SMTP id 586e51a60fabf-2c78043942fmr646118fac.28.1742503673607;
        Thu, 20 Mar 2025 13:47:53 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c77f05ec85sm132955fac.32.2025.03.20.13.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 13:47:53 -0700 (PDT)
Message-ID: <1b544061-4b5c-4a69-98c3-265f9d1e32ec@baylibre.com>
Date: Thu, 20 Mar 2025 15:47:52 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] Documentation: iio: ad4000: Add new supported
 parts
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742394806.git.marcelo.schmitt@analog.com>
 <4ad6c3d6dbfac9d5e9321a23a647cf333d7f96b6.1742394806.git.marcelo.schmitt@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <4ad6c3d6dbfac9d5e9321a23a647cf333d7f96b6.1742394806.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/25 9:57 AM, Marcelo Schmitt wrote:
> Commit <c3948d090080> ("iio: adc: ad4000: Add support for PulSAR devices"),
> extended the ad4000 driver supports many single-channel PulSAR devices.
> 
> Update IIO ad4000 documentation with the extra list of supported devices.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

