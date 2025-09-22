Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1252FD7BA
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535318; cv=none; b=Ho0d5VH9amH/VOTBglXwCeRg2FZRxngbucN6yI7qcWlCFKJucHpCrtrzOcMLqP2D0QdcEpaPz2FPnwo3jQR1zpQqzFdFUyZquORculmB+ZHnQ0DHkRZHxJ4gpMxfxaaNLwqPlNxSqxHracfH9jLQIQLxAY+VEZJu6BHU1Zg3A90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535318; c=relaxed/simple;
	bh=GLC9unjLHcduutfU2De8SO6Cn5IZFndntQa/0T2wPQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pq7VN8d/D2ljLOA8JJ6v9nOm8HMQnfnUNTvX0Rl8JWuCCrJCUxZNS/isJuyCaqlxEmTOQsi+TcEEypMECSBb2lMj204MnPctILY+jTuQhvkhv6Q/OWq5b7AcDTTI4rJbNp6ceHUq+kMXUg/Z/ZXeOekG1qqNJXk8SUUjNeZbcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHO1HZ5M; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHO1HZ5M"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-467f6fd4e82so9564175e9.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758535315; x=1759140115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y811XUkUAcjUYq9kF2IbC9o9QTenp6PpvmUvV5JyxCo=;
        b=cHO1HZ5M30mU5lJ+mWZ3CuIc02V2Kw+aRK3u+qJ6OaPpYZ8smMH0dyYT9aBV+j5G3A
         5RngpuRemNRb2YCNUzP0pJxaX78uxGNQLguZ0yyIh+JBfbANGjhPZKwxGrntsMUzTWLc
         NRJeDWPfTtYQBs/HEpOUUeVHjTSLKGDAgm4Hu3A7+tYwLVpjk1G2K46X9NNey6VL5K+f
         dohhc3vEM7Oi4lYHZQ2Wjn4MVuI2GpkSoOuoSIV+OmuRxuoVh+SjNY1kjNuchAEF5vcs
         jdPQl+7bVFQsuuvHlfB3KTCLmKUHtkduO6xgd1qX+whD6UJo1QUDV77jRLywTeqCYSoV
         Z77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535315; x=1759140115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y811XUkUAcjUYq9kF2IbC9o9QTenp6PpvmUvV5JyxCo=;
        b=rZxljHADj10J6FrtlVOMyoA3oCwZGc6DhV7G+h62bzLNrTd+YCBwQxqXwfnCN5ps48
         GsEQUGdZHXmJIboKLg2iE0fv5UW+dpMdR0mjwYSVWkhBL+HmFMZx8p4k5w5nEW3OuQjF
         1dL1w1wczEpxXwpQi7ht1TBq1xIuR+EiOoY4QNcCItYOenNtiRegCXDnmmVITmTXs0tx
         VHi0xAALqXl2dRYJfvUZ8YTEbR0RIZq85wKeTUfFYB3PDFFbyCEDbWvf9KU9Jq/zbNy6
         hdSYihBbUZG9t26YeDDqHRmkxjbzFT00ra0n1k2Ww8NzlmDKlTT65wtTGMDB2pHlv/OP
         RSvA==
X-Forwarded-Encrypted: i=1; AJvYcCUo5i7jmaCqHMxyAiusensKkEAqKd4veqJ4rpKSNBoA62Z3DJ01IJJIW3VjaeBkpQeij+05yyW/pHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Dk7FKyEl6544ZudY6f8buHKPgEUMgj1NxII/Iz3dcElDUxmV
	AQFa01GcWMATxZOZItGVhkf9YywB6okTUWkWfAe0gQPlQVYuVosbsWiMyZwMgvs1bnQ=
X-Gm-Gg: ASbGncsdW+xJi0pHmgC9owK18E8c5DFWiNS0pvF1Dc8ISlmWDLG8Ymx5Nx0GUnmb27D
	52HhOWyJ4VSGElnXBR5u8TKd6FaKrkmZpzSmuMcvxe+z56By1Z40VuMQXdOKVmgFBLx20zCXRcK
	5x2bfi23y5knfl2zm1K/p4CzbYRpjLOZ1mAiqDnAjEurvVvhhW/acrsBduDt/UroMD8YdrFOXDm
	U7+wdTkgaH3bWH7FKARqJ+ENy3mDE5TMqR50XAvyN/sfH7n2pEvkm3UGieVm6ouOibupp07Tgd4
	u1RuFNGBYHr9ZfOqp7PYr24h/ssHQVFq4o6W9CiYCC4BBPeIocRJQLU/4SaLtGExdnKeZWDgGir
	bqXtT/4e4wHqhDiYTSJWVMdNN1pKwtRBY
X-Google-Smtp-Source: AGHT+IHyiSZQlLreoJ3W3Ph8Q291wVJ5XeiMCjmBz4nM2qvfV1a5GmC8lVHC1BmJs2M+jyBWopho2A==
X-Received: by 2002:a05:6000:144f:b0:3ea:e0fd:290a with SMTP id ffacd0b85a97d-3ee7ca198bcmr9624896f8f.12.1758535315118;
        Mon, 22 Sep 2025 03:01:55 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee1095489asm18419549f8f.24.2025.09.22.03.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 03:01:54 -0700 (PDT)
Message-ID: <c0a0daf4-e9e3-4152-8e5e-c7b52a30dae9@linaro.org>
Date: Mon, 22 Sep 2025 11:01:51 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 15/16] kmemdump: Add Kinfo backend driver
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
 corbet@lwn.net, david@redhat.com, mhocko@suse.com
Cc: mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org, jonechou@google.com, rostedt@goodmis.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-16-eugen.hristev@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250912150855.2901211-16-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/12/25 4:08 PM, Eugen Hristev wrote:
> Add Kinfo backend driver.
> This backend driver will select only regions of interest for the firmware,
> and it copy those into a shared memory area that is supplied via OF.
> The firmware is only interested in addresses for some symbols.
> The list format is kinfo-compatible, with devices like Google Pixel phone.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  MAINTAINERS               |   5 +
>  mm/kmemdump/Kconfig.debug |  13 ++
>  mm/kmemdump/Makefile      |   1 +
>  mm/kmemdump/kinfo.c       | 293 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 312 insertions(+)
>  create mode 100644 mm/kmemdump/kinfo.c

I tested the series on pixel 6 and I could see the backtraces correctly
decoded by the bootloader:

Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks!
