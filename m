Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152C1DA0E1
	for <linux-doc@vger.kernel.org>; Sat, 20 Dec 2025 18:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766253942; cv=none; b=Iqd3FWGYNvbs/lfGdtOrtZ7p+mJ16Ay04tQR8N6okXE8gH6ra+UU+qKqs9oyhoP7uPY3y+340eAVt1kKfkQvG9JcLei84+YNL3qTv86feMBQW2U+4Nu8LT1OJDFT6RjGcnmxQ1hOq3G5Ybcnqts+/i7K5d5Pzt8p95Z7uPA1ug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766253942; c=relaxed/simple;
	bh=ION7h3GiimdnrChMZfYJ4FJw5Q0+r+Pu4ixf/ze1IGg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDBwMOEBkiHRlmc01wUxCqJaDMyiPSRkxmzyArO0nlkPElZUUUu2Ac7axhAWHoT1z3I0LDXA740otv9Qst8S0TPpX1lMAUkOwHlPQh6nh4tTVjlXapBkaPr00o8iaFJ5ldwuX9DZvbMUjsk+hu9uvlY6U+zZV57K54rqKHda1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOYHFivu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOYHFivu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso1779653f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 20 Dec 2025 10:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766253939; x=1766858739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ION7h3GiimdnrChMZfYJ4FJw5Q0+r+Pu4ixf/ze1IGg=;
        b=lOYHFivuvy/kA+SQDrYDMUwxTuMvxgUOcbu7wjsTMR6tQ4hXDSszzWK2E4oTdoIhOC
         vxQm+fv6SMp6xX9f8hcicy0lz7ud32UiqFxHX5dXUSCDaLP0Ef49a3ZYuZhur34opY40
         fPnHuMWDrnAV4R+5QUv1md081Rm5oGzxVMbdxI155AD5nn4tZ8trdzENUkbTOmVFOgWH
         023776+yDW16lg7T4yXHKks1taQnjO+cmlIM0oiZNJevQCAk4ixYBkiM5FMtlEUycI7W
         rGVfLB3C1E6pckpziE7YebQ5muDyGxpPnKPsnDdbFccGDAdCAyCA/q3GO9/JNnqwpd5p
         +i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766253939; x=1766858739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ION7h3GiimdnrChMZfYJ4FJw5Q0+r+Pu4ixf/ze1IGg=;
        b=XZ9Kffm779GeyF2uwok6UG82h9MI/s1v733nBoc1cnwuFK4cZ9XxeUvdbuTCfaSbVA
         l6riHHpXDpTxN2e9AXhE862/DDxnrlCdZcwx53xjCBoXLhcKZlleHN1PQqXLZ1ZFfEBf
         spkGEBRZg3XWs2q6i6LzU3Oi3EOmemn5GpsPTtuKFJMnhLJqzQuVdxJPH6hJUXMMTU5a
         k3029qOGgIvzlCDwXA/WA81fWNjG3U/SHqv8IcMkdJuhU2t6Uxr4JAp5jCNFJwQOHQiz
         WJg1+1PVJRKImrj6YotmRYFOoC6GsqvERKSEUd+qCQHTRLmdNN2lmF2iKMbna9TfPg1Q
         5IvA==
X-Forwarded-Encrypted: i=1; AJvYcCX0wnPIm4xov34G67v6GwBOVkYjRhAvFuIGonIYqgmfi5IzKFWqgbMoJ2HkIfb+54F4+udPGeQWJHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMaP2tB+DK9O4MRAP/W5hxAwP70YriIThI+DRGgiRgNvb+k0B
	Tba4tum1AN5Q7YGY3lRHoQETQP0slPvGpSYobDOBxqib2dRSHXIafitSKvD8BA==
X-Gm-Gg: AY/fxX5l7PlLslf8MjA4rdpFFspgrXk1aZNr8BXd09UVYUhzhvShsOyy+UMk08q49aP
	JTbxpjryKWmGoNrvoNggjC/AMTJnFzEZr3Rxo+ikDZYO4YKGdXEedK8GlWIKDDIDNELlZfowK0R
	IKTorA8pdMS1nZ6T8rH25JAF9cJ4x2+6r1P3TEvCh4P3bFfjEUVt1OgklGeM9SMc/+7SpNB6au1
	Oc4TeqN01ZoPlhXBM80iFzCsCsiVPHD4fxK8gHQydIXVMlh/nFLQFcuH+ziSQoWk98AKMKjHGKf
	nu/OuG44JeIayjrMetq58ve2f2AdVs7WPO5UaQZ9Ibv8JsY2DuEH3WfKlvXm1l4HlbtSdRBthcV
	Eqk2eR/1u+PJ06BFZDS2CUo7Rcg0rNmvBV/YXmbVTsVJ/wLh8hoWqVwYESicNd5VHS6/8Vhd/39
	dmCivS9iDM4lK/kclm764ACjr2qwYxIRty4T4bf779DtmbW8X4BtrrO8TQfVxZejBqpL5qf6jNO
	C5pEGeFMql2obI=
X-Google-Smtp-Source: AGHT+IFdh7686Hic2EQT/ge0CqMXmqAJuelRm9kiOsqQ7eXjvB0HmW7I0JGYyXOswbWut1zyR+Yt7w==
X-Received: by 2002:a05:6000:40db:b0:430:fa52:9eaf with SMTP id ffacd0b85a97d-4324e70ecf1mr7519861f8f.60.1766253938486;
        Sat, 20 Dec 2025 10:05:38 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82e9fsm12234440f8f.26.2025.12.20.10.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 10:05:37 -0800 (PST)
From: 455.rodrigo.alencar@gmail.com
X-Google-Original-From: rdealenc@rdealenc-l01.ad.analog.com
Date: Sat, 20 Dec 2025 18:05:34 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/6] dt-bindings: iio: frequency: add adf41513
Message-ID: <gz36kmewv4bhwqz6d3xqatcx65uzukqcgsvfbwhr7c3yhw225z@edeggfhjws2h>
References: <20251219-adf41513-iio-driver-v2-0-be29a83d5793@analog.com>
 <20251219-adf41513-iio-driver-v2-1-be29a83d5793@analog.com>
 <20251220-bouncy-perky-tarantula-d9b3be@quoll>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-bouncy-perky-tarantula-d9b3be@quoll>

Hi Krzystof,

thanks for taking a look into this again. It was my first patch it didn't want
to draw more attention or discussion to the V1 patch as it was declared not ready
at its very first review.

On 25/12/20 10:21AM, Krzysztof Kozlowski wrote:
> On Fri, Dec 19, 2025 at 12:34:48PM +0000, Rodrigo Alencar wrote:
> > dt-bindings for ADF41513, an ultralow noise PLL frequency synthesizer that
> > can be used to implement local oscillators (LOs) as high as 26.5 GHz.
> > Most properties refer to existing PLL driver properties (e.g. ADF4350).
>
> What is "existing PLL driver"? I know about motor drivers, but can you
> drive PLL?
>
> And how is ADF4350 related to this binding. I do not see ADF4350
> compatible here at all. Describe hardware, a real one.

ADF4350 is an older one, and its bindings can be found at:
Documentation/devicetree/bindings/iio/frequency/adi,adf4350.yaml
It is a similar part, but yet very different.

>
> Nothing improved.
>
> You ignored comments, did not bother to respond to them and then sent
> the same.

Sorry for not responding on the V1 thread, but the previous patch had to be reviewed internally
first. It is not true that nothing is improved, in fact, it has changed a lot, here are some notes:
* adi,power-up-frequency is not carrying the -hz postfix because it forces to be a uint32 by
the dt-bindings check. For that variable it needs to be uint64 as the part supports up to 26.5 GHz > 2^32
* The properties related to the reference input signal path: reference-div-factor, reference-doubler-enable
reference-div2-enable are declared here because they are constraints for the PFD frequency definition,
which is the frequency that the output signal is updated, important for the loop-filter and VCO design.
* added support for all different power supply regulators.
* adi,lock-detect-precision and adi,lock-detect-bias-microamp: removed, now set
with adf41513_set_ld_window() following datasheet recommendation
* adi,fast-lock-enable: removed, faster lock detect clock is set depending on the lock-detect-count value
* adi,phase-resync-enable, adi,12bit-clk-divider and adi,12bit-clk2-divider: removed, now set with
adf41513_set_phase_resync(), based on the t_sync (from the datasheet: Phase Resync section)
value determined by adi,phase-resync-period-ns, which is also bound to the loop filter design.

kind regards,

Rodrigo Alencar
