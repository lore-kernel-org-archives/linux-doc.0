Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198522FDEE
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587925; cv=none; b=QvcrQibgdl0kuDsZ7V/sB2hIOxqd9nSAWnn43WOKCwW2TVHPPXKmpd4UwnYxDUe5fX1Ul7S4D9kapyZZqQb3rd8Upc0GQB9BXTkpIWkZy/yjCGh61wEfVzZ7QYgmlmLhk7sAsyicbVuxDcauoS5l8EGcr54aabOOEF+u+i3u0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587925; c=relaxed/simple;
	bh=hgo5F8h+Z5rr3chs5DifIfiWaOyXhg0eK756Iet55RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mI5zirHNqNNpZTge4WFu3V7ZBQw/tZE+ZU8tAV+6CSgjvF/txFOi9THwrDAadJ9ZSFwlRG8XFbFn4GkaPvt58G9oQ6OJ9F7+xAOsWOgozIdIsNWpueBaio793qla3t2jKwVcgneib5pVvsMym7SB8/KsOkWwTts0TJbi+bF7kMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yzfYBCdn; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yzfYBCdn"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3feaedb6670so1377019b6e.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 13:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742587922; x=1743192722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccG9w73MG8ltY7+ND06i6LTf/TTQC5xPKuyTK8RSyKM=;
        b=yzfYBCdnjhTKSeFe7OPQn8MkiJvsEGYsBrqIXNiwrs/0oj8DFd5eVMmEb+KLw0CE/M
         FE65h8/8mqo0nFoM9tdwfZpgEqcgAl4IPzss16QbgQg/gZTFC/5RieZ0Sc9IB0+ne6MD
         WyYQyVzgQEenluGgtVXsZWkXe0yz8PKJLcJDWjcm+UylkMb8VAgoD/IwpKCei5nr2i/S
         Vzl3sY+jSAwcMyXoVh2Pa5V11ne8i9DiqL9q2pPfgVYAU8B8WJp16e0utj2NTleq/r0F
         TsoMcwnKS3wonax50KAIDKqpiT08TylJ9KGKBl/4wPjerGXSXaNlFbyXCpL1Ndk/MUTX
         7Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742587922; x=1743192722;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccG9w73MG8ltY7+ND06i6LTf/TTQC5xPKuyTK8RSyKM=;
        b=cGA8MqwVTLzVhlAYzlDvfB9lLaqSoWlFmL6+0wTDpo5j9P+uJ1Wfd9oXgaJVanaooq
         F1xXyJqJ/Euh91biJlwdAEkaiJP37hltkKf60Xr58NezqoCzRqzS+FZ7UjsKfyfS4O+Z
         9DAHT7aYcjqodnkbXebKLijXCoUCzagjGUnEq+zKe4DjZSlrBnRbG3qWCe1mFx+gRYhR
         lVfkfsVZHthtZuGl8FVJEWMwjfoA/mHzKjoTAWpC35GA4hTNyAHd72wrsGF9fy6/mvWm
         H0IStDC+MtbbXwU+lIROB+v01+qTyeMLBLuKa9nYAem1fYJFWZN3SDBwNXRhmFXQaPrD
         U65g==
X-Forwarded-Encrypted: i=1; AJvYcCWMq/emf0wiD5y8dvbeFoMdyq/0Lz3TpASMSYJcIE3IXUGtpVJ5vAIhin9oIdGjHNgRYEK0pzJvnus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoXDV/p9kgQqxRsWI3qWmOZ//XjpbghcIMLQ8wPy3Dh+rtB3lg
	0+5gPk9CHBIq+VAvuT1VkF6kiv3J4h5kSska/DYY212En8f6OkjbDQmHbFfv7pE=
X-Gm-Gg: ASbGncvdroN7sSKkW9geslidmSlDOkW7TVH8lrHm7IR+zFA9GV3Vps4Dnx8LoRn1ESZ
	u2kS1xNHXU7KWoO/gaIcEm1Z5mDkCkofkEi7Hmc96/FBO2+KSeX2Yt9TuN0KMiQb3r4s9YknhKw
	CjHMRsN5Laz1nlyVqJpNZq+8Fk5zaCYYnuOOIgV1JA7rXrYcJMAGpQ6oJMbxKsPATqVzrsYoJIO
	5/NVQUKTZmJbHDKRUm3gBuZuwSkXT4jXV/YcOtrR07aE7SYYHqC5NxXaRPh+4ygm5jzyCsvcWwa
	ObX0XxlyxvlzYGK3bZKK5mDfsZ5wwhw2pXB6kspqdTo4sA8RD5OqS+w7d7aVlI89A6jH00dCVKX
	WDYzce72J5IrDE5ba
X-Google-Smtp-Source: AGHT+IFiaVUXe/AFyDJjh4bHXe5rna40Jytm7qgCzXcdV00KZLBzj27++qjiSCFI5MNnva14T16qnw==
X-Received: by 2002:a05:6808:1a23:b0:3f6:aad5:eac8 with SMTP id 5614622812f47-3febf7091damr3077556b6e.6.1742587922167;
        Fri, 21 Mar 2025 13:12:02 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf79283dsm481347b6e.40.2025.03.21.13.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 13:12:00 -0700 (PDT)
Message-ID: <336f3db7-6f8d-4eab-b28e-c8389a3d05c0@baylibre.com>
Date: Fri, 21 Mar 2025 15:11:59 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] iio: adc: ad4000: Add support for SPI offload
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, corbet@lwn.net
References: <cover.1742394806.git.marcelo.schmitt@analog.com>
 <84843837a2acab58f8853152ecaa67c79b9a9666.1742394806.git.marcelo.schmitt@analog.com>
 <c449fff5-ef23-4094-8306-0a6b27a22c1c@baylibre.com>
 <Z93D8CAmgKSO-Ta6@debian-BULLSEYE-live-builder-AMD64>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <Z93D8CAmgKSO-Ta6@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/21/25 2:54 PM, Marcelo Schmitt wrote:
> On 03/20, David Lechner wrote:
>> On 3/19/25 9:57 AM, Marcelo Schmitt wrote:
>>> FPGA HDL projects can include a PWM generator in addition to SPI-Engine.
>>> The PWM IP is used to trigger SPI-Engine offload modules that in turn set
>>> SPI-Engine to execute transfers to poll data from the ADC. That allows data
>>> to be read at the maximum sample rates. Also, it is possible to set a
>>> specific sample rate by setting the proper PWM duty cycle and related state
>>> parameters, thus allowing an adjustable ADC sample rate when a PWM (offload
>>> trigger) is used in combination with SPI-Engine.
>>>
>>> Add support for SPI offload.
>>>
>>> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
>>> ---
>>
>> I'm surprised I'm not on the CC for this series. scripts/get_maintainer.pl should
>> have picked me up due to K: spi_offload which matches this patch.
> 
> get_maintainers doesn't list you if run over ad4000.c.
> If run over the patch file, get_maintainers lists many developers. Some of them
> don't seem to be related to this series, so I cropped the list to avoid churn.
> Will CC you on the next versions.
> 
I use b4 these days, but IIRC, I used to use the --no-git-fallback option of
get_maintainer.pl to prune the list while keeping actual matches from the
MAINTAINERS file that shouldn't be pruned.

