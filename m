Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBDA17E0
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225051; cv=none; b=qhwPuS/ZF9C/XfyKPsLBWVZUl4NQArFdXBo7fLWKpshNHtEt7JMFMpF9X8dZme/awySZ7y/hLTUCmiLGeAdxe+hUklP6kPZ04+f6I3pF6r5M1dmCDNXOJdANIBR1bm1sYmvnITh+meBiuGw6+M8w1oA8XN0ObYFDNgRCI4UknNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225051; c=relaxed/simple;
	bh=HHO9BAc/GcPnikXW7sVULetVQkeYVPNZhR0BOkGedsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKhjaRZrbFYXrk2k0P0R0OFYpYvXnr64CPVVFyDvQpJqpPYnQBOm7vS3q89FYnZdcnlsqm4bceP3TYoSObVIWHR0nwdSd9hXmcZhZIwY+Yw0+lYV/fAMyfjLKCfHUZJ9wcpZs+uimUM/O5RoQQ1G5fOoggLsUHTqVEAYy25L2VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eva9AvEv; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eva9AvEv"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-330d1565844so831400fac.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 12:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758225047; x=1758829847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/njUCFRX0+Zez5Vbxzl7crkS7bqMoDfnLtzR1RdZo4=;
        b=eva9AvEvBIFnQI8mWist/SQpcXqkGSpmqlwiCGWUgrvC4NXsjyvmI+ZFzEMNAUwTq9
         Xlur5BY5bjZtazgcym+P40KEYcEJrtZ23S4os3mJ8rWiWYu4w8w1vqd9pPBO0is9vmzj
         5j7ck9vwCdwU0u1QaBk/dxCCTxPtxcbJI+lLlXeikpwczgj0KpWDOSt2+XoNZky0i/Br
         aDj81b7GQbsHgW4QUu3E4q5Hwlr7bv2v7DR+nYMAD624yPFgyCie/t4/iq0qH1JS1X4q
         FdJo4bh1TnEa+PShp5gj9DHaMnrcrARpaOIZ7MnhmpJ1QwUH9ta6VQMK6jSJppOks/5q
         hQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225047; x=1758829847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/njUCFRX0+Zez5Vbxzl7crkS7bqMoDfnLtzR1RdZo4=;
        b=w4adeemsaWsyzoQR/iTCy9nsWNZ4O5k+LAv9DaRFpcZlv8ufRNTfN7x9ovHQtvjhPo
         LeFcQQLDGuphJ7/XRiria3Kcze8Notit9T277wXtr5S9Z0Ra/8ypBprNlaug477EFwgv
         gEyOnoQn8esRrb+PDQvORLAl/ixC9DwvAozy1RQPqL/iTTpL5KNO3VMdW3N5urvR7uGs
         FUWCeUSFaG3Kgk814mTtN2411Y2OED6nd3xBSiZEnZzZ11QZ0W5FRCMKn0GYMNAmv0SJ
         I4yRintnI6yd0grL3bOQwSL+/F++HluUc9E6x1SjBwONPN7L3xPgi82n1QIHpuXKie5o
         rx2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0ftoEx8PYuvMym4ulpYncISN2kGPz0rUZFjmAwAa2+agpjbRkLEPm+aXBgCmGhS4PXnhcxhg9M9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtsmW7hOW69/WFfk22RF9se2xTIloVoF3Ak4c/qRNNiUnOCFYw
	sr0IMXxH6lpVXpoJWClJQZxhi8uDrFZWrCMpamX0xd4V2RYTGiW/bQYN4xVpcUxdRJ8=
X-Gm-Gg: ASbGncuVFBv5wNLU/w+1D7xTDdCCLOIOZ9a/ImejnNINNMapPQbeyBFbcMeYMOVLfll
	XaB4k6wwUGK04TYaPo0T4eZVd874WosK2kIhgQUpOI62joZu/tqZ2W7KwbuMKnzFqZ+wZ8axDyj
	rS2xcEeYlCxZAFYOIRApB92t/k9i8/MAqJXuOTW53bcc5hjfn12NuPaGuF28k8iU5FaSQNzwFdl
	WFTewaL/K3ZW/OSzqXhvbpuNoqrtuKipo9MMY//oRAge7hqER9y7+bqkJRL0joG8MM6vXz0NJmD
	8L7dGVB4HsLlSJZoaEZhMZEEVbdPXDVNB1MmJuLFmNOOY+gPA8q4dYGBpXBlAdfKLJIzGMoNp+1
	nF/pmbQA7ifmdB7RalPzCQHaVZpZ1qgOvZuXQWcTRbsFGfgVfIs67BFgvBwHvAJ9Be9WduugjYq
	66gyyKxQhRy4DKoYeVATdCHdFxOH2g
X-Google-Smtp-Source: AGHT+IEHVxGf2yhLB3b35LtxkKozvBgxsFWLkSjfMAnEfJuFnLKkmmbeQcAg1qXyYA+/yqoKPs96RA==
X-Received: by 2002:a05:6870:9f81:b0:315:bb13:5709 with SMTP id 586e51a60fabf-33bb4965597mr508926fac.47.1758225046732;
        Thu, 18 Sep 2025 12:50:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:55b7:b662:4c5b:a28e? ([2600:8803:e7e4:1d00:55b7:b662:4c5b:a28e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-336e5a2ab2esm1789178fac.17.2025.09.18.12.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:50:46 -0700 (PDT)
Message-ID: <62989891-e166-419b-b6ab-cf1eca781b32@baylibre.com>
Date: Thu, 18 Sep 2025 14:50:45 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] Documentation: iio: ad4030: Add double PWM SPI
 offload doc
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, michael.hennerich@analog.com, nuno.sa@analog.com,
 eblanc@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1758214628.git.marcelo.schmitt@analog.com>
 <4f3b1c516f8148e0b7e1c430bb184a2db12ade3c.1758214628.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <4f3b1c516f8148e0b7e1c430bb184a2db12ade3c.1758214628.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Could use docs: instead of Documentation: in the subject to
make it a bit shorter. Seems common enough.

On 9/18/25 12:38 PM, Marcelo Schmitt wrote:
> Document double PWM setup SPI offload wiring schema.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
> Change log v1 -> v2
> - Swapped PWM numbering.
> - Expanded double PWM description and capture zone description.
> 
>  Documentation/iio/ad4030.rst | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/iio/ad4030.rst b/Documentation/iio/ad4030.rst
> index b57424b650a8..9501d3fee9bb 100644
> --- a/Documentation/iio/ad4030.rst
> +++ b/Documentation/iio/ad4030.rst
> @@ -92,6 +92,41 @@ Interleaved mode
>  In this mode, both channels conversion results are bit interleaved one SDO line.
>  As such the wiring is the same as `One lane mode`_.
>  
> +SPI offload wiring
> +^^^^^^^^^^^^^^^^^^
> +
> +.. code-block::
> +
> +    +-------------+         +-------------+
> +    |         CNV |<-----+--| GPIO        |
> +    |             |      +--| PWM0        |
> +    |             |         |             |
> +    |             |      +--| PWM1        |
> +    |             |      |  +-------------+
> +    |             |      +->| TRIGGER     |
> +    |          CS |<--------| CS          |
> +    |             |         |             |
> +    |     ADC     |         |     SPI     |
> +    |             |         |             |
> +    |         SDI |<--------| SDO         |
> +    |         SDO |-------->| SDI         |
> +    |        SCLK |<--------| SCLK        |
> +    +-------------+         +-------------+
> +
> +In this mode, both the ``cnv-gpios`` and a ``pwms`` properties are required.
> +The ``pwms`` property specifies the PWM that is connected to the ADC CNV pin.
> +The SPI offload will have a ``trigger-sources`` property to indicate the SPI
> +offload (PWM) trigger source. For AD4030 and similar ADCs, there are two
> +possible data transfer zones for sample N. One of them (zone 1) starts after the
> +data conversion for sample N is complete while the other one (zone 2) starts 9.8
> +nanoseconds after the rising edge of CNV for sample N + 1.
> +
> +The configuration depicted in the above ASCII art is intended to perform data

Could say "diagram" instead of "ASCII art" if you want to be more formal.

> +transfer in zone 2. To achieve high sample rates while meeting ADC timing
> +requirements, an offset is added between the rising edges of PWM0 and PWM1 to
> +delay the SPI transfer until 9.8 nanoseconds after CNV rising edge. This
> +requires a specialized PWM controller that can provide such an offset.
> +

Could add a link to the HDL project as an example of such hardware.

>  SPI Clock mode
>  --------------
>  

Good enough as it is.

Reviewed-by: David Lechner <dlechner@baylibre.com>
