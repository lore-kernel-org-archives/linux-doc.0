Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1082D29B7
	for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 17:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756573307; cv=none; b=fjGRz1jAEJJJnDoU7vlqf7FmoHe0NIRqGsTaz622P7nGVIf/R7txSn7yRi8//snZvpZMzRejSbCfCHPu3X5SPew//2PGRkMr0395h4mSXDhpc8e6maZVeU5uIid3TG99qXv/5FbXJ1xNsLaHlKpaVVwhjEfk0M1AObNEq1FvWlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756573307; c=relaxed/simple;
	bh=Mm6dPzbCGrYp7NOKQqOt4c6Q9WVh5eKB/fmj+/iIeGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rf6z1ZKI98fWQpviQSYnHuTwcQkGflZN6oOx4snBGIHJFSZv8kK7bS3QGEHqqd4X7GrFBypjELL2fsYb2KWEXBV9rvG8Q1cI4ysUPn4MhTVIc5FChNndHPRv0TBpcF+5aiKHDHPioaEVpuG9lz7AhZApRIBtznkP/RlHoh/4SKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Jx+oKwz6; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Jx+oKwz6"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-30cce86052cso1825179fac.1
        for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 10:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756573303; x=1757178103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lZ8rHo3FcLWq24Fv6wUv0Ic3V8ZID+9DE16OLXV2DO8=;
        b=Jx+oKwz6+kv2SLQ8Mbk/L/2Ii/I6yOtwycksxtw1L1OdfkD/P2ytT46dddb8C0yepv
         f3+QCKycQcBm/ugbheXDQ33NR39lpy+oOaB9zr2jZ5+vDl8SfSV/wlhe4drBm0eBCAUb
         oEtczSfmYcXpqJ53XpSgz/ZPvUv3lU7EbJlDq9o4JImYuqWLlpxYqnxqOqyt8afB9iV5
         7NOFGnT/P3I41nn2Iq7ak2IxSGiDG4HdY0UFQjI720nVI19DVASASFTqJE6Acb/9MqX2
         2QuYrQ6G2D2AJe8z5PsNqng6hQt3oI0XUV2xR33rpuiRP924EUa0AXCzn06LsPMtcfqP
         MM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573303; x=1757178103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ8rHo3FcLWq24Fv6wUv0Ic3V8ZID+9DE16OLXV2DO8=;
        b=ABnNGLdP28PZykeUEvqxno+saRxl3m8dHmV9c5WetCp28KOvvqgSGhko/j3VJp2NKe
         4Lb4EuvDgzaSH645L7PAtXysjrYPRGxYaOJjZV9JYWIKd8ZZ6Jtf+BQHmzF/OG4DACVN
         6JDXv6g4FR5xiHuL7s5Ot4hTWB37mDKw3pXOSVNjyfiZ0SRAx0TVcrEKAm9rsLJlZVwF
         MEaDcKrY/3QcejQr/1MsLow4pepaP43XmQ9kLTqIqPcWEf9Vr9q1jiRvyunxBKRfaIT+
         YbWLoCRz5BCw+w/HsOECRB8A/h94OYLspDFbfUacQ2AaVeNx5+J/KQw3J719yMPyAMUt
         1cDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK0R+axZVJSWjuMj416AL/Ok9TsSy8L2Nbp7wlNk+nth28VDZmNfBdkf4ntC19yuu1HX/jBM7jaQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVzqxZKpoKkawG2Gn5tJ7I0L7ppLeNcn3dBy0BLhlsJMJ/ksCy
	TnZzsN+dQcn9kEb656ZPTEWPO3+0lLbVauLEK0hU1gpyQBxrAb6glgE3t+cdH6cbBNU=
X-Gm-Gg: ASbGncviv7j7KuEwIdACnT+yxamlA4N69bNHncMlqzvt0V8Wbb9snsQTyItPH4ND2W0
	+/mDlauGmOzx3lSEzkgOLCi5ckUNMOcfXxrVfoq+P/qMmNlowLuSsJO0Zm/nzeU/y3iRzpownJZ
	nzOzbtqGz+01DC9oPFT3N42kbqEOucZQWrClBHaUnE08DMzKbjINCkAxS/Z986MZPe1qz1sTgqw
	aMSJNydqfbROs1uz5J9Dp+qVhSM49yFeP/82od4KS7g4fSZW223LRbeB5mkUJVGYMLDs7au/v3w
	jOACvKX17WIylSac0ThIYk3TUP38SRYqWQe+humDaLmIGlG8nK/6k49BsUT9j92tj6sPqf2/AV4
	xE4/Xb3El9JMychPtz+FfrEHgePLFGI9oIx8AalzCWYa4Ff13s/kqLg88Qk23Ht6h8W+RD4J3rm
	YDjsJLVLaDkw==
X-Google-Smtp-Source: AGHT+IGHNUyJ4TCJxNG47MECcIZsw4FC2AQEtkAuaCiRR+hyvUUod2VXPA0L2L/lSblMr9WtEHFaFg==
X-Received: by 2002:a05:6870:d9b:b0:2ff:abf6:d269 with SMTP id 586e51a60fabf-3196307ef5emr936430fac.9.1756573303518;
        Sat, 30 Aug 2025 10:01:43 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:f7b4:dfbd:5110:c59d? ([2600:8803:e7e4:1d00:f7b4:dfbd:5110:c59d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3196d46d8a6sm356575fac.18.2025.08.30.10.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 10:01:43 -0700 (PDT)
Message-ID: <b2688cb1-1ec4-46ac-89e3-dae4f919a177@baylibre.com>
Date: Sat, 30 Aug 2025 12:01:42 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] dt-bindings: iio: adc: adi,ad4030: Add 4-lane per
 channel bus width option
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org
Cc: jic23@kernel.org, Michael.Hennerich@analog.com, nuno.sa@analog.com,
 eblanc@baylibre.com, andy@kernel.org, corbet@lwn.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
 Jonathan.Cameron@huawei.com, andriy.shevchenko@linux.intel.com,
 ahaslam@baylibre.com, marcelo.schmitt1@gmail.com
References: <cover.1756511030.git.marcelo.schmitt@analog.com>
 <8011cd2b2f2fe6fd162bc4b4b75ec64255516a87.1756511030.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <8011cd2b2f2fe6fd162bc4b4b75ec64255516a87.1756511030.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/25 7:43 PM, Marcelo Schmitt wrote:
> AD4630 has two input channels and each of them can have it's data output in
> 4 dedicated lines, resulting in a total of 8 data lines used by the device.
> Document the option that specifies the case where AD4630 and similar ADCs
> provide data through 8 SPI lines.

It is true that there are 8 serial data out lines, but not all lines
work the same way. spi-rx-bus-width describes the quad-spi-like lines
for sending multiple bits of one word from one channel at the same time.

The second set of 4 lines is for sending data from a separate channel
at the same time, so it doesn't work with an octal SPI without scrambling
data between to two channels.

Instead, I am proposing that we consider the second channel (the 2nd set
of 4 lines) as a second SPI bus on the same SPI controller. I am currently
working on implementing this in the AXI SPI Engine and the AD7380 driver.
There is still some HDL work to finalize for this before I can submit it
to the mailing lists though. 

It will use the bindings proposed in [1] rather than spi-rx-bus-width.
So we should drop this patch and wait for the other work to be done
before supporting reading both channels at the same time on AD4630.

[1]: https://lore.kernel.org/linux-spi/20250616220054.3968946-1-sean.anderson@linux.dev/

> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> index 564b6f67a96e..bee85087a7b2 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> @@ -39,7 +39,7 @@ properties:
>      maximum: 102040816
>  
>    spi-rx-bus-width:
> -    enum: [1, 2, 4]
> +    enum: [1, 2, 4, 8]
>  
>    vdd-5v-supply: true
>    vdd-1v8-supply: true

