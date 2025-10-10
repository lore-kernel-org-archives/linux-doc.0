Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712CE266B52
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760114095; cv=none; b=Vj9TrXpvfiq1eTkBAUFMb8Loz+sG0s+FsrSB9imUnP8kHgNrc1/ToPHMe1sqDV5HV0wPybymUWlGgBT7ur/40dvLYdWFL1p9AhSTKBo/7fGH2wPRlRPrAPE2+X8dkK+N+Xof9ZVJAiEyoahTtdvj/g/saqDBnCir5/5v5wYuGxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760114095; c=relaxed/simple;
	bh=3O2slgopZs0r86JaYoeRil/K7lBwFmbcBIiyfk8jC8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWuB/kwb5/d6kiUI/U7Kgy9JQn2VXy2LIxAK6YZnt39ohSnzf9LrYqdxTb83PKGWJJC0pj9Ep6mMZO5kXZ9rWDCQgVYE1Lk/01hFb6r4QlbJNAS11hKpciSDPwmF64VhZ03YEt9nV40cMRthdZUtSx7H6W2nq56sePohA2kM7QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K9/UGIm5; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K9/UGIm5"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7ae21804971so738313a34.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760114091; x=1760718891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YFQBxoNurmZy12ZR9zqI+fCdGcn7hfBSxuCEMNcYPPA=;
        b=K9/UGIm5p6HiPGGO9yM4dqW0TI9c32Anr4phUlS86bYL/yFeSftbuyTkz/DDrMdUMw
         R3NbuMX9ScU8iH7OhahUQKXyA5eCu5rR/qUfv12erBmEyZzZEY7EiogSkUB6iiYEOdfj
         3vuh3Q4ykKUF4xRpBgJmRi4GFjWzLYn7/CGVbNis4PtcDYnC9el2KrRILIJ3q5qYUvZX
         myEW/cgM6032wMBR6scUUSFbLzI0mlz7hdnDzvTHmytrOOpoGbMsDi6iF9ioU/R91xTN
         D3fDdpndHyy+IRB06iQOp8327RH1JH61bs5FRgsTgYXNn4wCbJZ/UvHDXQIpwDy2S9ld
         lSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760114091; x=1760718891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFQBxoNurmZy12ZR9zqI+fCdGcn7hfBSxuCEMNcYPPA=;
        b=DmrEa64PjY7z2ZGHVnQOPoFRqHAhc9mqtcWT0eHwQTZDMuwwYeRuSfq265Q4Q8Xvk9
         MfwpppXMkub71zlhOAd6L5LnLjzr7cfi2Xii+w03nvbGaLuSW+2yeS5pWVid0LKkQpor
         ddNmeHBotP1MdDRuuCZ7JqoyR14SruOvOXZUlXpZP3CvALNx6xXVQsZBXudLAqrvokl3
         30TsvBHJWUzsJHfEhhIZP0CYRMj2cx4GTXYabbTwCNaFrcC9QC36xIoNXgmOEZvz2QF4
         l5QSY8GRgodB/X0+/gfh/c7BMXGAuUXCw7wWT70LmDUZYbPIRCj391HiS+/t/2Lh44Yd
         llgw==
X-Forwarded-Encrypted: i=1; AJvYcCXCL1FWckma8ScygnRwjufvOQFJb0wWwIDclEI/X55l9IMy6Hfwvjkhfj70KzSMUeUTaRRtkP++TmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAp5WCYMhDVgo3a766jOujDDXMet0EsUr3NGoy+ATbJy1hwR1D
	3YOnkGkyr87WQ6zkBpUfa/OOftqtfVycmZsj9xIcjWRYuK9FJMNyvr4E8jhOBHHSsBA=
X-Gm-Gg: ASbGncsb47KKHkxpRSwcYybw3IGkeLXR9uqb9cFnoOMpi6BUkVXJOK6sdpqZOBUizsk
	KLGr2ewlndvFUyfQS5YTalIhaPmEoPhVfKT1PzN19hFzAfRshGvwfn2OzHBHDUl15HLh+ui9GXX
	jiiefZSJFHXrk67h9ed4g4hGqB+8ZxlLZhKOsdloKZHuCygdUSyo72E/9bhY+R9XRBvlcsy2ky4
	oFJVIZ9KLK6BQxE+S8+BXJYxeV8ZzlcAiph+xHA8SSfFkYv/kNTHcfQ285zdfgLOFkxXs89H1GH
	Q6lfGImQWl7zWSv6y9NxH0abGFLg2oMQZCvQuFMXU+1iQ6G9rIDTkuF+7ldsYaVQJzFg1mDBAbR
	pA7i0HWWN+VixfW1s4B8bwJPKHcqlwavaGyHkUbCz9LxJu+FZPevWZwtKNRnQJWIBUP4fYMG2gU
	03D4xHUEyY+hHsDSjsod5FN5VVwg==
X-Google-Smtp-Source: AGHT+IG9/7/OoQHlAG8tADy7YoqbVxyfvZROVmXiXdf1/YG7+lyaIrfsoJ0HIGLIpNwQAaE8j853Tw==
X-Received: by 2002:a05:6830:61c7:b0:759:55bd:9597 with SMTP id 46e09a7af769-7c0df7ff940mr6338073a34.26.1760114091519;
        Fri, 10 Oct 2025 09:34:51 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6d3b:e3bd:4210:32e2? ([2600:8803:e7e4:500:6d3b:e3bd:4210:32e2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c0f915fd4esm968209a34.35.2025.10.10.09.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 09:34:51 -0700 (PDT)
Message-ID: <3cb110ab-05e5-42c3-859d-34df721d98f2@baylibre.com>
Date: Fri, 10 Oct 2025 11:34:49 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] pwm: Declare waveform stubs for when PWM is not
 reachable
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 michael.hennerich@analog.com, nuno.sa@analog.com, eblanc@baylibre.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 corbet@lwn.net, marcelo.schmitt1@gmail.com, kernel test robot <lkp@intel.com>
References: <cover.1759929814.git.marcelo.schmitt@analog.com>
 <129ff5c5b7f7be4f4f3f9cf8aa3e1957d713acb7.1759929814.git.marcelo.schmitt@analog.com>
 <cuq6eh3vcrkgr7tj3xpo7ax4ruiy4ra6fjxgu45a3eqs2jbtah@ualgnhdwxnih>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <cuq6eh3vcrkgr7tj3xpo7ax4ruiy4ra6fjxgu45a3eqs2jbtah@ualgnhdwxnih>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/9/25 11:58 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Oct 08, 2025 at 10:49:44AM -0300, Marcelo Schmitt wrote:
>> Previously, the PWM waveform consumer API would not be declared if
>> CONFIG_PWM was not reachable. That caused kernel builds to fail if a
>> consumer driver was enabled but PWM disabled. Add stubs for PWM waveform
>> functions so client drivers that use, but don't depend on PWM, can build if
>> PWM is disabled.
>>
>> Fixes: 6c5126c6406d ("pwm: Provide new consumer API functions for waveforms")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202509272028.0zLNiR5w-lkp@intel.com/
>> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
>> ---
>> I've included this patch in this series because it should save us from being
>> notified by 0-day about the build failure this patch fixes. From contributor's
>> perspective, it's easier to have this patch together with the rest of ad4030
>> series. Though, no objection if kernel maintainers decide to pick it [1] through
>> the PWM tree.
>>
>> [1]: https://lore.kernel.org/linux-pwm/1ac0fc529e02744aacfcb9140ed597ff60886f39.1759873890.git.marcelo.schmitt@analog.com/
> 
> TL;DR: nack
> 
> I replied to the original submission about why this patch is wrong. See
> there for the details.
> 
> Best regards
> Uwe

If we want to avoid this patch, then it sounds like we should use:

#if IS_REACHABLE(CONFIG_PWM)

in the ADC driver around any PWM waveform code.

