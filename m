Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF221DED79
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 06:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740982842; cv=none; b=c7OkyBF5535AbALT3BHKSYDRCqNZ01f5oPB4S1hrHCyLzZiPzN+pn8ZZ2Xl1jD94vPCMH2wR02gXj3LnUfpQuenv6L0Fj3ZwZteF4zWbE2jyzkrBtR3THEcRSNpj8giSYD+NrR0bvv8PiR/PhqifxRgXvrmTiFRi2qcr7//+X9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740982842; c=relaxed/simple;
	bh=xnkf9dHEY/bxJnJp3UuspjIPE+0ejwYLRa1u2I2pWLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F26KNtzuGRKublzNkVW4Z6oj9bbo3MW3VQBd1NscwFGLbKGBKObJAJGJmJkvY/eUg0buP1yU5NVatOVLKYn7KpVw/iRzCoOV21sD/yUYR01xkM8ciIyH46wA/CtDJ25fj4SdSfaYBg9XoTU/k0KPaiF/IsYiRw6Qu5stnV6LQDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=n4GHLkjH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="n4GHLkjH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22185cddbffso83992755ad.1
        for <linux-doc@vger.kernel.org>; Sun, 02 Mar 2025 22:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1740982840; x=1741587640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dyr2GA3li0orAMv11T62PbEJr2SsMfqcDoVbAywiFjQ=;
        b=n4GHLkjHDB19+s2CbedRjrcjp3Cnndf7K9chgfbcrOk5G748SCu80SjY9wpDEI5sI7
         Zg20PPbKFJqNI7ezc/NtdeoxeM4XqKewFfQwHlRdFCkHSV2tVP9a/huDBA4TMQvDMc2p
         imbs5qZ+s+bsTiq70qf5Z78pZlLzd9+zY8L3f9GMHlqf6wholg71sPtsfwOLNdyO+po7
         OABDt0UAozddrEPAe2fEgg4LdCFiAITPd5QpgaqQKINIPXpfOvLEeRlHWR8K6ko9vYgW
         8LxitVKYYPB6fN66UamaS5nPf+qCqyGm7YeCvYFeCvH8zl3aaQ32p+NvJRqnhj2CWvwb
         ngYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740982840; x=1741587640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dyr2GA3li0orAMv11T62PbEJr2SsMfqcDoVbAywiFjQ=;
        b=svdiP8LOTGvZauG6gemZcVGMct/6DOO9K50S8MpfMErM8UZd/GvNxVPB6P1biFL8HP
         rIO/8jLYSMAkVHKHnEV9P+cqT5oMt3FYd0TeK/cxTBHPAKeBzqNB2Iouy86MPNehyqPW
         5B/Eane1L8r1J5TVztRcOaUZlRhBIQIEE6Xf/NHpnkgmipkNl3uzkNZ/tP2rE7w6Gk3J
         UNLDuXKzpXCu5pzNkwzS1n7wkh1ldyd33tvCxaHrzBjaRdVHrjWEC0nwSKPVd0H+CWKP
         WF2oYhMIe53Rh7l0llI4EmVIaPI9wMReLQYK5hB+1TSAhH2+/0SUFlPrYK7IP16YG+Oj
         ljrg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Y5o11is+fHM4J6JaqKLOH927u0mZt3D/4umwrbW6kSHyiaa4F8xAibFyNylO2NPtSUk9Zyf04Qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiiaJNyVBJjPQyttH4fTQKiP2cuThHLGxSi0lC7go9nu2cb8JL
	GsyWUz8l269dr3TJibOTe01pPKXIp/+4sczhsxdAseNbwDMo9/FfeBKXXMhxAzI=
X-Gm-Gg: ASbGncvYCVM3Il3r2FB0t2B+XKub/D+/YtfduJfCIK/oMb2vCzdVRG0aSeCatuTOaLz
	fJiVVm9cSxLyXkIU1UKkwt3F1srg0PvOicEDB8JKzJSDPZtTO9w8xcpIE6IGeqKh93cJR6h7FI3
	1xpRY49RjsknKeD5U/TSG9inHrFY8oXNRmalWYaPwnfCk6DOlr8RJg9wUedX0HC3wop1GiE/9UJ
	RKyVQF05+9YS+q8sbdkBBwzdtNOE70OPZR6cujuqY6PodY3yukoHSRNopydCCQKkt35xtykR8GO
	psHgUr6nsTBNx/vCsVtjmwRuEJoRTkCw2JURD3Dzuif6TPM/Qsz/SNnheA==
X-Google-Smtp-Source: AGHT+IEieq/BD1K+cE8LpIHguGq+X9OAmHwKGwyKh2uFq+hVqj0tth75vrcZnQUypyq8Bcdl5DillA==
X-Received: by 2002:aa7:8207:0:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-7349d1ec1a1mr23805966b3a.5.1740982838260;
        Sun, 02 Mar 2025 22:20:38 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736614c13dcsm414807b3a.42.2025.03.02.22.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 22:20:37 -0800 (PST)
Message-ID: <0ec77558-bdfb-4471-a44b-0a37a9422f72@daynix.com>
Date: Mon, 3 Mar 2025 15:20:33 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 5/6] selftest: tun: Add tests for virtio-net
 hashing
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 Lei Yang <leiyang@redhat.com>
References: <20250228-rss-v7-0-844205cbbdd6@daynix.com>
 <20250228-rss-v7-5-844205cbbdd6@daynix.com>
 <20250228062947.7864a59c@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250228062947.7864a59c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/02/28 23:29, Jakub Kicinski wrote:
> On Fri, 28 Feb 2025 16:58:51 +0900 Akihiko Odaki wrote:
>> The added tests confirm tun can perform RSS and hash reporting, and
>> reject invalid configurations for them.
> 
> The tests may benefit from using FIXTURE_VARIANT(), up to you.

I took a look at it after seeing your suggestion, but it is 
unfortunately not straightfoward to use FIXTURE_VARIANT() for them
so I'll leave it as is. The problem is that a packet for each test has a 
different type and requires different functions to construct.

Tests added in "[PATCH net-next v7 4/6] selftest: tun: Test vnet ioctls 
without device" are easier to adopt FIXTURE_VARIANT(), but one 
exceptional test case, which is for TUNGETVNETHASHCAP, does not fit well 
so I also keep the current form.

Thank you for your suggestion anyway.

> 
> The IPv4 tests fail reliably on a VM with a debug kernel
> (kernel/configs/debug.config included in the config):
> 
> # 5.90 [+0.00] ok 14 tun_vnet_hash.unclassified
> # 5.90 [+0.00] #  RUN           tun_vnet_hash.ipv4 ...
> # 6.18 [+0.28] # tun.c:669:ipv4:Expected 0 (0) != tun_vnet_hash_check(self->source_fd, self->dest_fds, &packet, sizeof(packet), 0, VIRTIO_NET_HASH_REPORT_IPv4, 0x6e45d952) (0)
> # 15.09 [+8.92] # ipv4: Test failed
> # 15.10 [+0.00] #          FAIL  tun_vnet_hash.ipv4
> # 15.10 [+0.00] not ok 15 tun_vnet_hash.ipv4
> # 15.10 [+0.00] #  RUN           tun_vnet_hash.tcpv4 ...
> # 15.36 [+0.26] # tun.c:689:tcpv4:Expected 0 (0) != tun_vnet_hash_check(self->source_fd, self->dest_fds, &packet, sizeof(packet), VIRTIO_NET_HDR_F_DATA_VALID, VIRTIO_NET_HASH_REPORT_TCPv4, 0xfb63539a) (0)
> # 24.76 [+9.40] # tcpv4: Test failed
> # 24.76 [+0.00] #          FAIL  tun_vnet_hash.tcpv4
> # 24.76 [+0.00] not ok 16 tun_vnet_hash.tcpv4
> # 24.77 [+0.00] #  RUN           tun_vnet_hash.udpv4 ...
> # 25.05 [+0.28] # tun.c:710:udpv4:Expected 0 (0) != tun_vnet_hash_check(self->source_fd, self->dest_fds, &packet, sizeof(packet), VIRTIO_NET_HDR_F_DATA_VALID, VIRTIO_NET_HASH_REPORT_UDPv4, 0xfb63539a) (0)
> # 32.11 [+7.06] # udpv4: Test failed
> # 32.11 [+0.00] #          FAIL  tun_vnet_hash.udpv4
> # 32.11 [+0.00] not ok 17 tun_vnet_hash.udpv4

I cannot reproduce the failure. What commit did you apply this patch 
series on? What architecture did the kernel run on?
