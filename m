Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D5524BBF4
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 04:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774326035; cv=none; b=V3JMKQ1ZD4SGTUACriAknBQPuX2l2GOVNigTyAoP9A3brLXNbXL6824t/9l7hdRhRaNM3WTG/xbZyKb6GhEJqrLx2j+Q3sVxGkESZtQc9ZSEV5bdmOHeNiyzw/29KGF24jVvAnpIbHQucdYA/gMDfJ8fRR7hLgVGophmhhcBOVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774326035; c=relaxed/simple;
	bh=OPg749OON7RfZRMaDgp+5thwDl0zwptoRTpHoxI7PgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRm1h7wZaqjtPshmJkLntrLT8gyz+Yf3/0wj1vAu9qiYtLmUXulab3oUtd5O+SRwMBrqeEnZNLJAvYp/zmJDO4MTZ/ib5J6U9sDb8rUOmwbjhlcylOpQyKVrSNM2SeK1FvS0F0acQ502TmWoyP9cbYs6diYrnUwI5oDTAFrwwss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=heW0PLXk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R/JBorIF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="heW0PLXk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R/JBorIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774326032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j7h3rGPOyGuFqglRPNrUoy4EwKeWamb75bpgun6g1Zg=;
	b=heW0PLXkdhY4CVtQ19XFksDYds6IJtiUHhg7/Jz4Ea2z6Gu6b8aURdeorQbAIInbEUy/ev
	vGFyMcD22EcV8as9194md9nMoxr2g/51Ok9VUMXuk463C7YYU5BtLwT7x0f0t9JQHsnMjc
	TuImafU3liDqrnraHh2r99j5xCaMeZw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-5BvWuIq-Poaad56OFxI_ew-1; Tue, 24 Mar 2026 00:20:30 -0400
X-MC-Unique: 5BvWuIq-Poaad56OFxI_ew-1
X-Mimecast-MFC-AGG-ID: 5BvWuIq-Poaad56OFxI_ew_1774326029
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a8afb2d0aso3672802b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 21:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774326029; x=1774930829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7h3rGPOyGuFqglRPNrUoy4EwKeWamb75bpgun6g1Zg=;
        b=R/JBorIFyvZTKGNrOXf9cY5a1hQsewpfAULK2lMWJ/03uS6C55vyVV5BUSbO/R415c
         S152EJ7pGvwYbO6fzhRtfsJqvcekoJYwc6IP4z/gnTRpFSs5pl/sM9ZZiH9nmCfkFeua
         JSHuDFI27cQJ9DPX+GOw7IumXzB+bIRxMZ8EfbrUBu/034oDs/fBM64lmYfFDyAo6iQN
         zQW+1tV11KYfRwrxLQdJtEguIDALKqHpHcZ8Z61hMtulYVpHym9GNdU6WQzG8QQZDx+e
         wf/To7sfoqdFTNNRoFFyyIj5/MGVbEc/jreoWQlDf4FVjoO4bMbIQQscv+cN0VhV6PCH
         mClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774326029; x=1774930829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7h3rGPOyGuFqglRPNrUoy4EwKeWamb75bpgun6g1Zg=;
        b=JqBGZG+FYpPbFTymD5IpvLrSl7DF/V+F14+DGuHHLdUegEYP5Pite8pb3RQzYLqphJ
         sHGjiD0Pl6XOD04wyIaHY74VQw+TmPAjUDG/CHwtWRn08ky+kDkmnxJp7e84m/1Hk74C
         86JiEFRWgfhN//k65DP7xHyiCbsIT2vE087vLcJdKqY2MnOxkK60jZcm4o23lPUn0JCK
         onPmfLwBRLsIQfxntmpq5IGidJ7Sq77DwQBjVYpULc7M2PWIl28IPSG71ZjiTuuddnLv
         Mnco/wgWF/Xvf7a/DFsq25a4cnuH+IDG73FQdj+9k0rIyf4PPs8rzoz32EBRCBI2dICY
         7a9g==
X-Forwarded-Encrypted: i=1; AJvYcCVn3S62yDjBHtIl0HlXZ2/Lq85PeksW3koA9jDLW/U/PqYGGwKkckNl8yIBwn5jk+ymXutZ3QqHau8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUzSVOaODzMr577NODtAggwwOJTFPv+R6yt+QmqmA5oiT2Lp3V
	Qjx11tqw+wWtSqIdGYECehjBetd9PLsTxE7uSlGtdf0dQq00X2NQi8Yzh8Q4rocVQfCN87wLtEV
	t1UKiWkU231lomcX62YBWYHF4+P7m5h1V7F+/+vp42cNIozfMkP8j1d8VZ+iaxA==
X-Gm-Gg: ATEYQzx0N7naiNU+QN+M3R651Ql83GqBskHo8mvIMQ/tblCtdLn55Jqaj5yte/tZj+0
	vB2BI9FLuKUsqz183ifN6cHDz5S1T+qqq8BpPJDuUpUhp9JUFaxgIC0W7dC2D255bzkWyjkb0mb
	OqBv8mo4OjuzNhNWfArUZbm4zKWORaKc4CqXFG7JcF9GnjflBUFDDYEs86xJVuW3GnayKDXoPPM
	aH9r20Q0bBYIgf8ees2jY/LeTbYxaJKrjaENRQjapC2oJ/0LGImQHCiuK8MZbdCY7lB9Z8FWY/0
	lQtyQUix3RDmh985rwbXgQUiRyh3ao5Ot61FeMcPBIYxfAjXBagtWswbbnmaRLvpZEY2s8QUiQJ
	YfkZyaO1rfVX2Ro0MWB/kqZpxyyqeJZcttVXTODfc3BH87YKTqEoIF6er5jNxvA21
X-Received: by 2002:a05:6a00:1143:b0:82a:687e:c048 with SMTP id d2e1a72fcca58-82a8c2ef7camr12586330b3a.30.1774326028969;
        Mon, 23 Mar 2026 21:20:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1143:b0:82a:687e:c048 with SMTP id d2e1a72fcca58-82a8c2ef7camr12586295b3a.30.1774326028616;
        Mon, 23 Mar 2026 21:20:28 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be2589sm10542710b3a.24.2026.03.23.21.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:20:27 -0700 (PDT)
Message-ID: <ad5694f7-0885-4cb6-a2e8-112df5a498c9@redhat.com>
Date: Tue, 24 Mar 2026 14:20:12 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 38/40] arm_mpam: Add workaround for T241-MPAM-6
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
 <20260313144617.3420416-39-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-39-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> The registers MSMON_MBWU_L and MSMON_MBWU return the number of requests
> rather than the number of bytes transferred.
> 
> Bandwidth resource monitoring is performed at the last level cache, where
> each request arrive in 64Byte granularity. The current implementation
> returns the number of transactions received at the last level cache but
> does not provide the value in bytes. Scaling by 64 gives an accurate byte
> count to match the MPAM specification for the MSMON_MBWU and MSMON_MBWU_L
> registers. This patch fixes the issue by reporting the actual number of
> bytes instead of the number of transactions from __ris_msmon_read().
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
> Don't apply workaround to MSMON_MBWU_LWD
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  2 ++
>   drivers/resctrl/mpam_devices.c              | 26 +++++++++++++++++++--
>   drivers/resctrl/mpam_internal.h             |  1 +
>   3 files changed, 27 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

