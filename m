Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C6A25F7A5
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 03:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323692; cv=none; b=hblFGC/Pfwt74VxqcrLP3p3HB/2fbO8DtjIZm9+udvyIrBwXmLeVKvajXBeCv/cMaG1TwDkm8bg2zJAPmKajSB7xkFwUF4cEVotIMoG+o8wqhA7XGTw7F8ikz7Hc9J1I8zqbQjNRdcun2hHcV+Q9kWcUIt/5z5lG43EzmdmISUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323692; c=relaxed/simple;
	bh=jMZhaLlFd0YDU3XA3qv775N0MXu7/T2FVRzNRe97FB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CINkVQN4CqH7rvPXuLYDo1Y+movuwXx3VK/HyCHY3UbpqezoY2cbRcvLfA9NNdzokxcNoREZ3Hp5ksGvKNpaMEtEKwsrxhmagM1raAoNTihUhEKs+3jxqAWUpIfLTl7MK28WWxx56xu/LauSWV6z+6EdZHWzsq7/QydJg/rtTnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hwrPCndM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXVIaucz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hwrPCndM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXVIaucz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTotqZEROYbDyldT/C8jFT2PqJQkiiFw2H0d7yIV7KA=;
	b=hwrPCndMx2va9H2fjFLujREY6Gm/7hffbsbuS9agouOcjlzZe8j0Sty7HntLNYwa8ZzcWK
	Fn6JtYTpFPDufi7KbLIoA7S5mw+Z7oYCO+UQjMj09GLNpMmYG1PvdP27IfTPGvTw3ylJ64
	xEIvc3y25tixFoZJrBVrD4JVuJmoAVU=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-ctkvgwEFOdqot0xS6PB-iQ-1; Mon, 23 Mar 2026 23:41:28 -0400
X-MC-Unique: ctkvgwEFOdqot0xS6PB-iQ-1
X-Mimecast-MFC-AGG-ID: ctkvgwEFOdqot0xS6PB-iQ_1774323688
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e7f45e2ddso2910442a12.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 20:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774323688; x=1774928488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTotqZEROYbDyldT/C8jFT2PqJQkiiFw2H0d7yIV7KA=;
        b=NXVIauczHzN5u26tWYBBM/xqXbru7zI5jjSZAvi0z018FID6hCaqpvPjjelb87UrC/
         SbBRoGOqrAhGKay+itRQUTpOp4BI9RgQSHa0CXGIcO/R7acsRtrj4h35jfP7/A5trFYg
         3dj4Q6Q6DugX4LUC5sfMvQ1594AsjrUeE0vJrNq3i4B8rIG5uuk3sddoGXoOgDKAL5Nn
         DmahQeQxYHpeHDA+Bg5c2TjEzny9AThoiQ7HWyXvym9b2guxIoPSNVG0QVuAMToYrHEe
         DLzvRQfdS6Fho35Zft8/RkioJQyZiaFAoq5wIsQpFlH0QNCgdRHkAfv1guIihRF4PxjP
         Nsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323688; x=1774928488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTotqZEROYbDyldT/C8jFT2PqJQkiiFw2H0d7yIV7KA=;
        b=RvWHB7lbb2+0yaMmtV3FJRa6+qlml6Q5dzviJrffEOVLbijSOwWa0rB+woKpb/m5hI
         q24AlyUd99lA/URm0cBJXAmrNmZOcqaQPbU2u8P6xEjML/i31I2Kpx19SyNJaWDme742
         uhFdPDNZfyA7QiKR/YrLxVBntDqHnOFaLJotFzC7LcQ2f7xd+dOp6Ul9N8lXnnoJddHf
         r+I6v6fxFzBLfSUlQzDKncHmbq6lEYdEicskfVrJVR1zY4DYHIdNmCzIDG2LpnesZmu2
         Pi/kbO3K9/wZI1vTnl3c2ZoUV5izOLcIXthfdQhXPPPrWcC2YBdLajxmxHd9VDgikQnT
         GvIw==
X-Forwarded-Encrypted: i=1; AJvYcCWdq5KiMW3UaKZh1A+I8eRpLs8nQjJOExDsiufYEDNxl3NxdflJNCWbzUgGm88Z2Pj1ZG131dQ4lsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Dzijah3dWzq1zvj4+34ZVKt27TbXG40lEpVqtxGtqFCypF9M
	AvMwvXE6247RiSpD/4KzAS6v+syGj27gYLX4l0tvhx9PKQGqAEkhd/udHDLFif3HMT3NAsc87XH
	u8qr6j7o342fOcO/edYEXe262Wld9Q/9tBoEknfSOEtK58wpYAUUvTNw4umWX2Q==
X-Gm-Gg: ATEYQzy27LWk12IR5Fd6LsIku2jCeyDvEdSccI2pCC+o1xX4RXWwGEj02yuXPRgIEfv
	00ly6Qc54lQuldpZcd1w7KvuW7oJkH8qPfaEGr4qVjtUnO4T+gjtgzQ05Dwvv7mDV93s/9rHWaQ
	9uyEhwdIcywg2ACg5aqtSTBjX/lnJ1d8Jdu/UaCW0dTOI0HLKUWba7wUTl+kcmjjTQ5wGnFA3Wu
	8QlbdusnokSFtvXHk46H4yqpWucVLV2BPAm63bquMyfuOmUVkp+U2Htz5TyyF98R45Xxl6G/9v9
	6HvkEMbuK3bcWbng4o80eUW8dw2L2HXLLHvtW50+ajzAu35NrmrkxEaxeynH7K+/79re1bEhcux
	852vSMISbD+IlycEfvo6E9TwVm07O4wqGTtDkVHULwL+wukEC2QE+d4cpI2UykfAh
X-Received: by 2002:a05:6a20:9392:b0:39c:c3:4030 with SMTP id adf61e73a8af0-39c00c342ddmr6959319637.34.1774323687672;
        Mon, 23 Mar 2026 20:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:9392:b0:39c:c3:4030 with SMTP id adf61e73a8af0-39c00c342ddmr6959271637.34.1774323687305;
        Mon, 23 Mar 2026 20:41:27 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74487b5b8csm9108581a12.31.2026.03.23.20.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:41:26 -0700 (PDT)
Message-ID: <711b91dc-8861-4948-97b8-47a5ec21affa@redhat.com>
Date: Tue, 24 Mar 2026 13:41:09 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 29/40] arm_mpam: resctrl: Allow resctrl to allocate
 monitors
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-30-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-30-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> When resctrl wants to read a domain's 'QOS_L3_OCCUP', it needs to allocate
> a monitor on the corresponding resource. Monitors are allocated by class
> instead of component.
> 
> Add helpers to allocate a CSU monitor. These helper return an out of range
> value for MBM counters.
> 
> Allocating a montitor context is expected to block until hardware resources
> become available. This only makes sense for QOS_L3_OCCUP as unallocated MBM
> counters are losing data.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> USE_RMID_IDX -> USE_PRE_ALLOCATED in comment
> Remove unnecessary arch_mon_ctx = NULL
> 
> Changes since v2:
> Add include of resctrl_types.h as dropped from earlier patch
> 
> Changes since v3:
> Don't mention ABMC in commit message
> 
> Changes since v5:
> Remove MBM free running sentence from commit message
> kmalloc -> kmalloc_obj
> ---
>   drivers/resctrl/mpam_internal.h | 14 ++++++-
>   drivers/resctrl/mpam_resctrl.c  | 67 +++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h        |  5 +++
>   3 files changed, 85 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

