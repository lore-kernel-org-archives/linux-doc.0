Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40140B379
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 21:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361205; cv=none; b=MXI8Ux0uJVVIGuGLY1RFZJALzv5zBVNN/hS5s85tgs4VJCvak5l1EHsozLf/hEZbDyreYQQ+dUl/NMznfXK/nNB0RiHtw5txI3Sw3QpwLqaZzn2c7vXwx5l1nDGaKlxrNxmqHXkE4H3zk1dzssNednohpJaYl8iG3tKkR/6r+KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361205; c=relaxed/simple;
	bh=9DCe5l+RMdzIky2GyIi+0Ksfo59MslthuX/VTCcR/ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAT2amjN/IOFxnDQPqsQ3g7ve16kB7BrwkiT2Nm72PbQujmjT7vJJ6/v9FrQoGocyh0vM5ZS85aNGn0mIwg3B+116z4h4UQhRPXGHJbrCKYhV6mmpjEENo0nN0tSplZVUzP0BaYtnEder7NofwWATzPreDyuQ7fGQYHjheFi9nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T2OrQg2c; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="T2OrQg2c"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4518ad44e83so979921fac.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 14:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785361202; x=1785966002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1c9/5KPmcV+l1Jp7+hRXQDRlqBfhfCFzAoiMmQn8lR8=;
        b=T2OrQg2cE7xcQxnI0O4BydHj8yXfMQevniBTqiz965PkVMdnFKMb+3sBx5ZgFyllBH
         j/sMG0RimQrlBz9mrda+IWe7NTgyXKlWXT1EMLCbqIu+EvwdjDR4VLJRTzrCwoLwxpQN
         MaHbzeD1VdIjWnOgffDAgc64hYYBoQPqMOOa3mVtdicT8zHvNGRyzzTROP1XYlk0pFmc
         vmiKaTLmzgAK2tShCMxctpNUtQYqtWdq/vOCeB7lnEvdo4CPhhfUmK06sp0Y3J2Wyrke
         In51x6GHtD/J4N4FmVCgLHZfyix8CCUD3T47XMXivhCATBaFuWWwABjkfi4mJwLH9kB+
         bx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785361202; x=1785966002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1c9/5KPmcV+l1Jp7+hRXQDRlqBfhfCFzAoiMmQn8lR8=;
        b=jmafu0ule34EnpVDXMMd+yq3UQ0e3Jsm9CVsoNZf8Cyq8G6rOUyR5JLCqeqA2U2cmI
         eAyIQJkcn5ZCe5snbNr3Ij8QkE/5TxNuvLjxXA/MHBigvYm+FkywB1pmpFb5BpYJcA/f
         SvAD5ZokRanymi3XdM+heD+SrvBOGxX+xis/BMq2rS/ZqoMRaS1Yi5u/SgVkUzhYy1Rl
         YyHLa8Q2jg/wStQxzSsrf3Xt1W17dK9NWjAaUVLCicD3g3ID6/740obdvAPOmEu+3Ite
         a90Ul3bUuP2TPun8W8HMDoEHODeiA44/SLwTnSCf5wPmTukcPnUrlVAX0/R/GpIEd3fV
         BRGw==
X-Forwarded-Encrypted: i=1; AHgh+RraYSPc7+mbWvAHFh49mZlKjyg7/A96n1tPbYOWDUxtu9HxbZcUUgbjDLryWK2fFQM+rg5cqiASRgo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4BC2nSd6bkyNO0Oug8eydu+9PMzRxmPaRz2LZJWQd9Z6Oj483
	8qJQHKRgXBegs0sEqL01njZSjfqZ1uthGhh+ERPYz4QI1nt9mqWyFp1f0LnawZQO2a8=
X-Gm-Gg: AR+sD12HqhP1p7g/fE+qfGtl4EAd6dvN7TiBCWM5q4nPnd1Wo4bAaiGGfVwbFrI5vR/
	BYnjvqKvy14sCXIJbqWoIER+vidnVyi6FZTXC7KnbiqZjG5oJB/gYIDrO7G262Y7ibEgAtOhi7T
	Ijty//1Y+PEBNVFLtmIToXPG2DpLuGqmxs7n4pvqNUROSVJgDvXUoAzkYJ60J20FJPYzkv4T0z7
	ytJrh04A53EjI2Q65s5uH6cgVj0hfC6PDSlxgHGG+MktIDpRq/ehZm8FJRGIdoqEAx7UsMsozi1
	+ikDMwoF0NmnaaNQ6uYkA6iwvWW1T/5Jhvbrhzqb6OJt5N6SGhVXl5KqnrOIJISFknLH1HhquRy
	k62uSAuM2IsHTsmx+mYchQfJ4r4HvLHKz/OtsYRyADowaNbVAu4EjBQeIoDJPG2FuHUWkFWZ+3o
	FmajPu8pspzwuXSCvfgER6t3UUFMcMVvUAJKHvUZv5Amo4TCAjJwHp0jjApV3QFsY5mVIOqsNNU
	JVBVN38q6PYyTUFEpDzAhvy56Wd1eE7f2HAACI=
X-Received: by 2002:a05:6870:8271:b0:448:9d5b:6393 with SMTP id 586e51a60fabf-458c0dc6a14mr63345fac.14.1785361202134;
        Wed, 29 Jul 2026 14:40:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:ea38:c35b:7ec6:8152? ([2600:8803:e7e4:500:ea38:c35b:7ec6:8152])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c0df60fasm79258fac.13.2026.07.29.14.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 14:40:01 -0700 (PDT)
Message-ID: <ea9c043f-27c9-4095-9488-e81e0bbb5273@baylibre.com>
Date: Wed, 29 Jul 2026 16:40:00 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] dt-bindings: iio: adc: microchip,mcp3564: Add
 spi-device-addr
To: Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marius Cristea <marius.cristea@microchip.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>,
 linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-2-7781cd74ad75@analog.com>
 <cb4098c1-4bad-4a11-9a6f-a833e554f197@baylibre.com>
 <20260725230739.63ff7000@jic23-huawei>
 <20260728-patronize-thwarting-56fab2e11077@spud>
 <20260728221719.7f668a73@jic23-huawei>
 <20260729-hundredth-suffice-f28afa67bc06@spud>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260729-hundredth-suffice-f28afa67bc06@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/29/26 3:47 PM, Conor Dooley wrote:

...

> Only going to reply to this for now, I'll reply to the other thread of
> this conversation later so as not to end up duplicating discussion, but
> I am thinking of things like what if someone puts a mcp3654r and an
> ad5529r on the same chip select? I think that's actually perfectly
> functional on a hardware level, provided the fuses/pins are set up
I'm not sure this works in general since SPI devices aren't going to
have a standard way to specify the address.

For example, ad5529r has the address at bits [14:12] in a 16-bit
"instruction phase" while mcp3654r has the address at [7:6] in the
"command byte".

An ad5529r instruction could inadvertently be interpreted as a
command by mcp3654r. So I don't think they could exist on the
same CS.

> correctly (and if it is not, mixing the microchip devices is possible
> and probably mixing future ADI ones will be too).
> 

Yes, I suppose this could be possible, but I don't think they would
be considered a single logical device in that case. So would be
covered by the device@cs,spi-addr binding that we already discussed.

Example:

adc@0,0 {
    compatible = "adi,adc1";
    ...
};

adc@0,1 {
    compatible = "adi,adc2";
    ...
};
