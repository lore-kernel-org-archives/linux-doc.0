Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCF33EC2F6
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930408; cv=none; b=Q2Rb+y5mZ/0Jp0EaplK0RpOgohOiALzRgFj7BotpzkinY+VpCzjDg9/5jmEwtNO/6h8J64Te2HhYMTUl88+qISGzDb06ol/Rp68lrynbPqPuazVFashqUC66h2CXkeipANrFNmt3EvhcuAOI/eRBD04rnMwR6RG26lsHKPoTK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930408; c=relaxed/simple;
	bh=aXBtlEnjwFrQKovFyPfzhs9uZjhW40u8HNLp3IKF/LM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmp7vBtOZI0o/FE6gHeHONW7QNbv3hsvYnICf24EsZXgBxQoH1sUTXZy4Hw46S22zfqKbUNZq95bxduvSZgDWIeOd6kZDJ8B8AAONVl9FsT+ACtr8DoIEuxM26WuOUTl7e4FcK8AwcoGk6gkcByPuCiy8+CuqVl9DqH6XiVVddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=LS5ktwsI; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="LS5ktwsI"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-43f1f2b82c6so3030989fac.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1780930404; x=1781535204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezWnP2UXKohE5V9tSBhtiAoUtofNw0gKy3ylNXOeXQI=;
        b=LS5ktwsIwbjkuocNDMmWDEv1Z6U6lJrwQZYoHn3DL+Eo+8EoSe4T50cB0QolIqp9TS
         QZL2OgNadtSRW1TOtDdPLV7J51fsemuITyBVXJgjja8YiAKpoIw3Evp54AccxHs68Lhu
         yCcp3oP691G4PbnhOl4awTKooEtEmwKcxKy8FuO4a+ktKNLG+k333K7N9UFPeogR9LWE
         kKiuR/Z8DDWC31YFJ5B09CPeNFfEQ8ah6QvAb5Sjbs0mhIqpPUXNUA9Wn//LhkyEVE8T
         Z9thToSn+EiiRT+4ru1NlDn6j+II4OECjNkm+bTtrY8esbxWxJODb2ysQ1w6i5kCW5iv
         bnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930404; x=1781535204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezWnP2UXKohE5V9tSBhtiAoUtofNw0gKy3ylNXOeXQI=;
        b=nNzlZAVJls1YtBEOZEzdYMUXf5euxjWPi5H9zgL/N9fz4/MUsBLKAXh3rLiX+wPJNx
         6+6hog1uaCIQ2BBNtT5IWqCIuldCvYkTqONKheyqEH2LZ4oYK99bE5yTRAgu5tCAu6pg
         8tRjorc7Y08fgHX7fVqDySqdv0qnJtJABWhTE0teWzMqcYdKUgnl3KlcyfzM5bQ1mARV
         ec/+tqPqPnwsf1nByF0+8RZ1K2/yKqIoNZMdID/GSkACsREAqlc1wZgTbCo6iPVil/7Y
         jkiBp06X/RpDYQPMVrb8+bcFejAR+6peKpNt/oqcJ0YYf65m/ZhKZPy1i1nFsUoves8K
         7ZFg==
X-Forwarded-Encrypted: i=1; AFNElJ/hNOvuGq9ntIOnrqgGrdJPmiAiZXFDie94vQG2Xz6TzQpKr5ozRpL/Odh0pK0t/bUsW6hEzUJvFaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YygL/52kHcpg+uWtDFufgMfU6ZJvfBW8tUqCmVNjjucUHnkdvUo
	zMrzeNo/o4NSUZfQqjcTCBJTMvBt8DRyssRxsVt3UVxamGFplGgXvx6orikjEAV+RZo=
X-Gm-Gg: Acq92OHSSCCh4i4Nv919GGyc7+YwtnaiB2kOCXIjT0XHNuaKiBOpwPA/J+UEZU4A8Z9
	zlLNrrjHV0ZKib+ExW1sP7jieXuN/k9z0cfkdCajRTmumJM/SCBxIGPZvBEMCWwWmHpkcaonIOG
	9UVifpL39qoLXHTwDghcGJyBm5ugTPqUKZgeR97iGpiBqbZQr0B9Ob1wKZR+HSZ06ob/LXmatx4
	BbDYh2DF3AF3gYUS2H2wKoTuunbYTBHeNaIZ4gYg5DPh6W0NbdfcgVN/Dj4FfQkJzYiFYc0kO3p
	T0XM19ZMlYTVt3us/45l1iktKXfUROowNhch7dx8r7OFVJidCiZv5uee08bk4VOP23Qbo4D1Stn
	KsX+bwYCLvUg1Qq6agmoCPNBcUzdjB3p3wBAL1DBryFqZX1gHDevcgCfG2R9I0o7Go+WXVptQzt
	20LbhGpjse2zRsF6yOtNiYEoikNDUx+xlsTqeoJeVodmA2XhJ/wWsGVbwgwxbDhW2XpwNdMXGbL
	amTpWmONgUIrmXRmgJ1
X-Received: by 2002:a05:6870:d6a7:b0:409:5ef5:be0c with SMTP id 586e51a60fabf-4413d3b4b67mr9871451fac.12.1780930404545;
        Mon, 08 Jun 2026 07:53:24 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8295aaasm16163044fac.9.2026.06.08.07.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:53:23 -0700 (PDT)
Message-ID: <bac50400-dd86-4c7f-bab3-481c1306877b@kernel.dk>
Date: Mon, 8 Jun 2026 08:53:22 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] block: add configurable error injection
To: Christoph Hellwig <hch@lst.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>
References: <20260608051416.1205282-1-hch@lst.de>
 <20260608051416.1205282-5-hch@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260608051416.1205282-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/7/26 11:14 PM, Christoph Hellwig wrote:
> diff --git a/block/blk.h b/block/blk.h
> index e8b7d5517086..10df23b2cb90 100644
> --- a/block/blk.h
> +++ b/block/blk.h
> @@ -660,6 +660,18 @@ static inline bool should_fail_request(struct block_device *part,
>  }
>  #endif /* CONFIG_FAIL_MAKE_REQUEST */
>  
> +void blk_error_injection_init(struct gendisk *disk);
> +void blk_error_injection_exit(struct gendisk *disk);
> +bool __blk_error_inject(struct bio *bio);
> +static inline bool blk_error_inject(struct bio *bio)
> +{
> +	if (!IS_ENABLED(CONFIG_BLK_ERROR_INJECTION))
> +		return false;
> +	if (!test_bit(GD_ERROR_INJECT, &bio->bi_bdev->bd_disk->state))
> +		return false;
> +	return __blk_error_inject(bio);
> +}

I really hate this part, that's a pretty deep set of pointer chasings to
figure out if injection is enabled or not, when in practice error
injection is only ever enabled for specific test cases and distros
invariably will set CONFIG_BLK_ERROR_INJECTION because they turn on
every damn thing under the sun.

IOW, that won't fly for the hot path. Maybe a static key would be useful
here?

-- 
Jens Axboe
