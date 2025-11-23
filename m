Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81E425F99B
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763881083; cv=none; b=m0Nh7hfIpfBTKwNdKWQHWrkimzY8ERIJskqacncR//xc/b1IcBZyQeDhXrbhxmXgC3IXaYI9uqXf0sarB3OltuoUio7BKIZspINrOQjjt9f77t9TiWtHmaJTsdfK4ymSeFC4MV856WVWjFov++eEgQcJfpd3c+XIaiLc7PqHlIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763881083; c=relaxed/simple;
	bh=X6Wl+GsUv9tb9D2ZvYsvZDKqKoy8NWR2CEfCfgI0xKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdbujSo7AQ4oyuZemD4WfIkOcxqDE3HNrs9amIjJbT25mZOrL8qrPo7S1CAcIMhJR7/D3GMpnrsOPtLidM7mALe7s/3X2s+Pfhd27m0yAx2sy864Uhd+SsZ87TxYIz4+mJFYyDGwRXUAqLBzh9jiURY9h//R/MRVGZtfpOSDRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lae+GEgi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lae+GEgi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47774d3536dso25404965e9.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 22:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763881079; x=1764485879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uRVJRvrkA9r6FA5gPvj5O31mT6myPASpJOJtCaPGU+U=;
        b=lae+GEgiIQGzocy1m+fSXOQouErV2WPA/WnROV6iDyQWaesQJOcKWXU3PJ/1OUwH+L
         ruHDhXKVW+zfJRPCHRubp5rZpUeLzy7Ssu15XUavwFLurY2QsYuWNpsOYn5ATnXKfriH
         E40fiQZ0jA6Pz7OM8zfGhZ4jnmf99nC6B7z1PWw3db0e0iMOVbn+wfOap60nx5Zo/lBq
         DllQf6H7mYIXNMSVkGEPMQUcnndsLwKmqQVCfLQUQJccLT+n7PY4ThWiYH+cHmfu1sKD
         x5TmvEF6oF4/UsLwfOiVx6UH05+yC4W2hC05PBpQOiwhBYUL7Jt3DlVJIL7i8cqmNnQN
         e99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763881079; x=1764485879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRVJRvrkA9r6FA5gPvj5O31mT6myPASpJOJtCaPGU+U=;
        b=s7dbpc5/d4C+flLq1xdOq68JheMsIB22vpDs774BixRUGEHHCyYyc1mJvv8yHRMzHY
         D2c+SmMorMybPasBs7lmODJ8hXussnFk+c+8VBLcDjbQI5oTz8NtKyCfRuyRggZrrLp/
         Iv+cpPrAqosvtCRjqhXjGokQ3AjJ6vNoDMFoGFfP05Xo12D2pOSv2/U+I7zBMh8M/QOb
         iEbJJm5tmKdaSpd1tlTqYpe3azu+g9RTPtbAMs21Q7Prw8/RDCzPITEmgAtbxWgMBRFU
         0q9SdQenHUt9deDcSe6rKkXLjC21hexwqpOae30IkP9BaWSEcYWgU8yGnlJlYMnFMThD
         pncw==
X-Forwarded-Encrypted: i=1; AJvYcCVHGB9lQ/kKJOynGOEG2C2DrG1FFanilnW1KAPWH5pStb4FU8Bu1PrTBXoi24PZadKol9UpCHMmLzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhiT5dZnINjpJRjC5/4Seolzwiwpx4FEkdNBOmqGasGNx4sed6
	WNw2zpwp3QGdN4SdGm9kfdmwdzU+eb1kG6hwUIWMWHbN7w04PIApcB6m
X-Gm-Gg: ASbGncswlHGl469Ll0eWPbMZKhCFgMIX1aA8Rr+jgO0N2bSziTQAiedLluSktvjCCBM
	X8MDNqRemxceYLGSTowu8nfJLpDgwX+VD6UCYc/jMNgeNRJO7LRJN2ZJh3u83jzRw9Pg2rT04oi
	A2rePY/DxDIqDDcBzr90tYzkDAhS4xR0t+lQh74/Y+XyxtbmNLDfBVIhW5Wr8LRqlQZFWmwnIuO
	9JdZlifuQmovyWKQJ/ZqdhvUYULJ3v0wTuxnpYaw9Yusi4oQkavUGs2A2cDYN4Hbvv/42/T235d
	Wy/DHbtScDBshVU6rbV+OGPfAKjzHHPRGfbostLQecFJn+f328gNLi6gkH6AHP+vyWmfEQKzzoh
	fXu6j52IDgHbj2OcQ+BpOxnImNgZ77MlPh0+0KvHYod2ckhI99qaKLS8FgG68ppYIS3PNQq00Ho
	JheRq3exyEEyqfpj9LyGbORVhxTKHEw2QNuZQ=
X-Google-Smtp-Source: AGHT+IHFAxOYU/3SO3J8aYD3YuAqZ07wcswkAErFmGjX6P2Bxhft7F/WMDyO2OFrbewioiPNPQbtkg==
X-Received: by 2002:a05:600c:c8a:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477c04cfb70mr82290215e9.6.1763881078919;
        Sat, 22 Nov 2025 22:57:58 -0800 (PST)
Received: from [10.125.200.125] ([165.85.126.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dfb639sm119878835e9.13.2025.11.22.22.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 22:57:58 -0800 (PST)
Message-ID: <f828d5d5-6ba3-4e9c-a7fb-3a0193f7e9bf@gmail.com>
Date: Sun, 23 Nov 2025 08:57:58 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/14] devlink and mlx5: Support cross-function
 rate scheduling
To: Jakub Kicinski <kuba@kernel.org>, Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-rdma@vger.kernel.org, Gal Pressman <gal@nvidia.com>,
 Moshe Shemesh <moshe@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>,
 Cosmin Ratiu <cratiu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
References: <1763644166-1250608-1-git-send-email-tariqt@nvidia.com>
 <20251120193942.51832b96@kernel.org>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20251120193942.51832b96@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/11/2025 5:39, Jakub Kicinski wrote:
> On Thu, 20 Nov 2025 15:09:12 +0200 Tariq Toukan wrote:
>> Code dependency:
>> This series should apply cleanly after the pulling of
>> 'net-2025_11_19_05_03', specifically commit f94c1a114ac2 ("devlink:
>> rate: Unset parent pointer in devl_rate_nodes_destroy").
> 
> repost please, we don't do dependencies
> 

Hi,

I submitted the code before my weekend as we have a gap of ~1.5 working 
days (timezones + Friday). It could be utilized for collecting feedback 
on the proposed solution, or even get it accepted.

I referred to a net-* tag from the net branch, part of your regular 
process, that was about to get merged any minute. Btw it was indeed 
pulled before this response, so our series would in fact apply cleanly.

Anyway, not a big deal, I'm re-posting the series now.

Regards,
Tariq

