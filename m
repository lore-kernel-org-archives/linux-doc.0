Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD5C1F7578
	for <linux-doc@vger.kernel.org>; Fri, 17 Jan 2025 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737096665; cv=none; b=nWTHor1IPJuYL3ctIapIt8wv3oHWtRdm/GIo595nWCXiDUrXBCyMkxhDYFCadxiMUu/Pm1rNung5jQzcrd6TfYID6AKAmVFQRyLEMntprl7ty54Htwpj1451Slq6q1iAcne6htlWKnExdMtvBmMTEpYraFc8oMFYcnbnmVUDhyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737096665; c=relaxed/simple;
	bh=2u2YVfoxLd7Cvn3rxair1v5iw/Nh3ozWpr+rXKeCIOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izxTIijxqRIH4BVDANOR9yh71eRZYyKnML8HGVHsqQI6gtXQ99dfu6M538zEYe8iA8njX6rNmRSsuZkHoBHCdDShvchFYs5FMLLBmTy9u/APZb2xKDOtTTDx3zQ2SiX9eoDkT85+AUDuBvtVZddfUPZt+7QHs5+6r1V3LNJkKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=QLiKBGoQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="QLiKBGoQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21680814d42so27825735ad.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 22:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1737096663; x=1737701463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxvFAOToWR486xbEC+Pgvw2Hl5TN/daUG+P6fxzoIwU=;
        b=QLiKBGoQt0T6tjkOmTb+aOtVzDU7f3+enxY5ZgBTnWVm3ThPt5O1mkaIPzjb7wstT3
         x8U9pZCHf+RepsooVDM0hQAhRQhoEdrOGDJNPj2zUkalprfz/eu5cMOjwttJ3jQycoLv
         BbXeo4dAx7MwEtQOIq131MmUIN+URbtM9dYBmgj5A0hQEEfo7qh0/7BYqcZY06Y7rKYB
         7yI4TmAYvsVogpELX/K4EGIRAB3Y7wQuZydBkxP5zlHdry0ys3J0dHQzK8RpAl4nJDAA
         M1jdSK2DnvVNhTC9ba6mTwDo0Dn4fdNkpjZMjyGwDqsDDdsYyN5y5UFp/WTn86WYOhAk
         oNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737096663; x=1737701463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxvFAOToWR486xbEC+Pgvw2Hl5TN/daUG+P6fxzoIwU=;
        b=OZCrztUJjj4UW0uMF2SmDZexdVYEHIXq+YGMOj68qUT1MWs8eJnFaf1BnsqWlWEI2p
         54vNdCl034abVGs63LCIh8KYvG2SE2eKI3pDHi9/lZo2zK15WqMfgHlHya6uJ95ATsQE
         SmOwGmT9ynbzAEq1rQ4nSwN49ZnuphU8TMz1wOlM6socx+uqJT3dbfI2YR/IPssaJ90E
         KoHqlay7d4gqTOoEVSWXL6m1z7nh/u1myrYwAgjzOG/05PdqcMR9NyHqyZjGV+7qqgdj
         EDdBEieX1gUPRe96OWJt3OxBUlM6ZUWRTZduKeFzq9ue/r9Y9XyDJ5XXMsgi23jXK4WT
         ZgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK5Ww3B+1kDbYKftoaafLBLV88k2GdnpN8b6kJyfKEYtV8sWF3blJFaW67kaseFlTTVacTPGZaC0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0AUls8Kwpt6k1aCU5qKYdIHlw7p1gh3EU6UWr8ThGRd0zmi6u
	bA3x7QbB2pKSW1ljYemLzJoaZ6+vKNF9X8MIl+E/Ad5Gc2ASz8yN0Iwa2EgMNmo=
X-Gm-Gg: ASbGncvS546X3KJLluU+Jk6dfDuJnjHzVL/WW1+c3plR6Nh6p81eiyr+4MuomHViivw
	b+56koo73d0Xh/qXoJF5Y3IakGJwg+kRxn+QBplmvYMtEsVtsJOV3aqrvTuIPP2zFzIPw4eO1m0
	ze1EaVVCF4F8NTrRv8x68tG2nlzz/kgAyyP2pIxD+9/05K8BZdG040/dOoogwfDkc6l2Txhb/kO
	hqYB2tc//CeUv1ZaE4eTJ3OwxOWXgP3WTv1pgAVANqQpB2anb0RslKDrIsNuu91QGI=
X-Google-Smtp-Source: AGHT+IHEp4jaCJNggzbZ2ij/bh9rzGAo+Mt5lP+zOwoLCq8mYHxh8b68OP5RujQgDJEqW/JvnG0eSA==
X-Received: by 2002:a05:6a00:2296:b0:72a:8b90:92e9 with SMTP id d2e1a72fcca58-72daf931244mr2463308b3a.5.1737096662981;
        Thu, 16 Jan 2025 22:51:02 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f07b9sm1110387b3a.3.2025.01.16.22.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 22:51:02 -0800 (PST)
Message-ID: <1a419eb7-0ca4-43ea-9420-da0c35e5f1a9@daynix.com>
Date: Fri, 17 Jan 2025 15:50:56 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 0/9] tun: Unify vnet implementation
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jason Wang <jasowang@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 devel@daynix.com
References: <20250116-tun-v3-0-c6b2871e97f7@daynix.com>
 <20250116031331-mutt-send-email-mst@kernel.org>
 <678901682ff09_3710bc2944f@willemb.c.googlers.com.notmuch>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <678901682ff09_3710bc2944f@willemb.c.googlers.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/01/16 21:54, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
>> On Thu, Jan 16, 2025 at 05:08:03PM +0900, Akihiko Odaki wrote:
>>> When I implemented virtio's hash-related features to tun/tap [1],
>>> I found tun/tap does not fill the entire region reserved for the virtio
>>> header, leaving some uninitialized hole in the middle of the buffer
>>> after read()/recvmesg().
>>>
>>> This series fills the uninitialized hole. More concretely, the
>>> num_buffers field will be initialized with 1, and the other fields will
>>> be inialized with 0. Setting the num_buffers field to 1 is mandated by
>>> virtio 1.0 [2].
>>>
>>> The change to virtio header is preceded by another change that refactors
>>> tun and tap to unify their virtio-related code.
>>>
>>> [1]: https://lore.kernel.org/r/20241008-rss-v5-0-f3cf68df005d@daynix.com
>>> [2]: https://lore.kernel.org/r/20241227084256-mutt-send-email-mst@kernel.org/
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>
>> Will review. But this does not look like net material to me.
>> Not really a bugfix. More like net-next.
> 
> +1. I said basically the same in v2.
> 
> Perhaps the field initialization is net material, though not
> critical until hashing is merged, so not stable.
> 
> The deduplication does not belong in net.
> 
> IMHO it should all go to net-next.

I will post the future version for net-next. I also intend to post the 
field initialization for net-next too.
