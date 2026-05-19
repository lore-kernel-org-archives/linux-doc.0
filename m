Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D2370AFF
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191013; cv=none; b=bD8Nv0TBb+lB+swSPx77kmSj45SbYIyiX2gkZY9n/5LM/NQbeh/bZjqgpIH3whpWhBN/cWrPPaaU7nk01UxJC/hnkrG7iliTPm2MdqY8oS1PUvDH7nEe7WxaY5WXTnpz5VFaBTXB5zW+OAEcbKr02bje2CmfLNcwWvHZD9LI7QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191013; c=relaxed/simple;
	bh=uqnz168Z/NZnWLL+NvwgL7tHVJZg79BGKcxiyfYZqas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfCgAfbwFtL9PAtI4xE9+3IB0W9/ZJZZTJzvadrMo+XqZfFLzokX8+njFwrB3L5yriLDJbIfUFrkzM0OiNnxv61jI2Az3b7Il09W4UAE6iVbSQWv+zGP51Yl/VnG8upyW1m0SVR8mpH4Xdg69Nya7vgF2dc7CR/g46dqw7LkoPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA5LbG1C; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA5LbG1C"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d7645adbdso2284657f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 04:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779191010; x=1779795810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=830uqqsTMsd/ozJU1fiYeCoziwF9njvd4GwHw/ftDHc=;
        b=CA5LbG1Ctk7i1t9L2quu16aCEVkbnhAZ8gP5ZZcUdRvrGjM3IxL6yWjZ0IIyT+OIs9
         TdaAVtspbfIB+WyrJ1k5TjuFgtl4R2kAlcLeWylPXquuVQA43HSevO1c89U3KwGCXQzP
         cL8plifMWgQKDof6HO4cGWUzxidYasBCQJTi4vbfRJSiFnJc3oaX7+uzvPhkd+uUE5Dx
         EAF1S+eC3Lc85bNYjFHsigOLvOCEFUZhbR43vqZjRj06cofFlV1lKvbT5s1ZzQFqBZlj
         nUQRZUJ1MoDXnSrFvH3P5VfNybtH/QbPctLspAOj8RRkk6b85e8+FokgarE3kU1W1HZJ
         ObPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191010; x=1779795810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=830uqqsTMsd/ozJU1fiYeCoziwF9njvd4GwHw/ftDHc=;
        b=NRMpbMHrWwKaARj4bXyngGhBg2rO4MN4EiHM7lMly61A5oV7MztYSwOZfnfPA/nAc8
         7EAdQVJphZ6L7purmXWzdBOxnM14C8a2ZegMwhXez3x3eohbvENXx+prr40LFphvdiPo
         z3YLNcI3EcGDcIq5HeDhZTYB/tuJ4taSuz3iJM2QFXvCKdjYDXYhtNseCmQfG3zLw3G2
         aICD+88QQeOe7yiXVyS67XCUaMY+lN4fwxTuma1Zt8c/GOsxHNPV5kKIXzy0DqmCAasZ
         DTw/fiGovjubAMfDJkXKkm76XU/BiBN7F35+vCY9NkmHqfXAaLKgxQ4uMmnvTRjQrAWv
         ouow==
X-Gm-Message-State: AOJu0Yw6utRDqvG5PNNsY1huc644Afo75ISIsrJINK91cKzfv732SQn6
	tjaQi+MY6xQIDD1swMk18Wt2aUSXZ4MXG+654oVjlIh2WbPoUV/4ep4f
X-Gm-Gg: Acq92OGr7m91uZT64549CwkahQVRKLT2+dyQ4Z5+NfxpHBPuadKWIIeDcXk+bjlFkCT
	vcuepKH/kI3QSD0ft37blanMBXUO1+Z9JiBBZkcfbID3JyPqTLQ0H+6KFS4hmERCMzyQqAqBrNa
	a2DBN5u7PR13O9KaxnXwhscaptFbf8qXxGPXHIrJMijYzIhikk+q51xp4iP8OXMWCkZpRYa+eDS
	/bauAT0hXEnw+1h/Kh8V5i6C3tNubgB/SQyDw4i5V9ZnoiLAS1SUlS2ZhD5NigX6F8bJ4mb/6XL
	+ROq1mqymDaS1MxvkgoRVOv/qBt9icJ7mOG7/j4Ht2YyZO5eLOuRULPX0E//WEhrQ84JJpeDqeP
	DipMvQl9wHM76Iaa1Fk+I1zmb5Hk12YKsbfT6MiOL3J4EDn3hcMPllyZx8vEJj4dm5cCjnqdt60
	U09hUAzwYAt1WSmvVFJ1KdPZ2iKvrF6DAxlqYyBKn9qDNXWKhlxBik1Lfuu2aOgERPp2phtVd3Y
	pVsyHVF9GlO46wBnw/OXdDqHr+/vWb60P0eSWKeEBt6I9NN5TTjWbgNsmRs4CmgWozxc1TDYPIK
	yg==
X-Received: by 2002:a05:6000:2087:b0:441:36b7:7262 with SMTP id ffacd0b85a97d-45e5c36735emr30499432f8f.13.1779191010036;
        Tue, 19 May 2026 04:43:30 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed30110sm49237372f8f.13.2026.05.19.04.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:43:29 -0700 (PDT)
Message-ID: <260923ea-7871-420d-a822-cde2f4c105ad@gmail.com>
Date: Tue, 19 May 2026 12:43:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] io_uring/zcrx: add CQE based notifications and
 stats reporting
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Vishwanath Seshagiri <vishs@fb.com>
References: <20260518153532.2835502-1-cleger@meta.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260518153532.2835502-1-cleger@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/18/26 16:35, Clément Léger wrote:
> The zcrx path can encounter various conditions that lead to internal
> fallbacks or errors. These errors can have a large impact on performance
> and functionality but are not yet not being reported to the user which
> is then unable to take action.> 
> This series addresses this problem by adding a new notification system
> paired with a statistics structure. The notification system currently
> report out of buffer and packets that fallback to copy. The statistics
> structure report the number and total size of packets that were copied
> rather than received via the zero-copy path.
> 
> The out of buffer notification allows the user to actually adjust the
> buffer sizing when registering zcrx support for the ifq. Some future
> work could allow the user to add more memory on the fly to the pool so
> the page allocator doesn't run out of memory.

Looks good, I'm going to take the first 4 and send out with other
zcrx patches.

-- 
Pavel Begunkov

