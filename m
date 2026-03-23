Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2035BDAA
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 06:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774248738; cv=none; b=JEN9+CmhpUXRGCzWSSsrkNgjD04MPFN6UbpAzQheWDVzuCwbUmwPNxD2rawkF/SY9aizLGVKMgkSELZWvGcwZOPdndL6EulFz+d3Nb0Defp+rrnHH6xa6WsDQukgncsVSe+axsCdvwhPlPG6vSG9J6p8ls0izjTBFMjuuxJpK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774248738; c=relaxed/simple;
	bh=Ho3xMrajWw9hSp68d8ltLv/+KIt5O6ifbl/4YdZnT48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZNrDWGryk9HwRwXZs3N7/lzBWMvR0GMeP6pisHbkbxdPiCzBmrb678k0MorA9ToEI0jwmvp1grKmio31t7RbWhAQAXExUd+LXMW8RbsTbsNVspRxR9Hy9VbuPhiFDb641gjUHNkQffdJdJaPeBnbgXaBOzF6qV3Gg7uXREOMi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V/nJVevj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OYReLEFM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V/nJVevj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OYReLEFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774248736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKbSNz1bnQPVRgBTucbuG+mAtDWNAO0AjF15TWaqka0=;
	b=V/nJVevjj0DjRhK5QX2jhgyM3dwptn26kG3yo2eeALJKzdaaknNAHEepA0RaZ95qqO9C2x
	A5uBRHFknoOX1FZo2IIP7TjHKcdOLO7Nqj1zCbT5Edh8kuDHKa9CH/FMBia05Ba+4xUv5I
	8xPhoicGPRgVDEN+qs1r9QzcfByo8gE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-CSOKfbCwMESYS5GkJWbu5w-1; Mon, 23 Mar 2026 02:52:15 -0400
X-MC-Unique: CSOKfbCwMESYS5GkJWbu5w-1
X-Mimecast-MFC-AGG-ID: CSOKfbCwMESYS5GkJWbu5w_1774248734
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a855dc82aso2472869b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 23:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774248734; x=1774853534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKbSNz1bnQPVRgBTucbuG+mAtDWNAO0AjF15TWaqka0=;
        b=OYReLEFMKvwg/gRED58Hel1g9LLmR9eA43eFYi1Ls1oUNnCtgoO5bFXvQa7iSfB3j0
         AxNKDXPXcXKO/uc0GuxN0rNmrhn/BL70b4VzKRvWE7Qvq1s57upQgUecSt2JlLLXupOO
         1QsfzJvtgoFzJWVsc0noorVWVaM18RSDTWA9xuhiMu3tlO4OY2ckAffVgtwVFgpwdThS
         BSQLnO9n96tAOglmjhcQqDTzCJaNXkJrDt5s2fASZbeWkZhW/0FdAnRqFM+Nimmyz/lb
         ylm8oroggJGdWFrMbP/mNEyWBTKoESY5d8XF50oqyycnu61py1JfgHIHK/xLP4c4qFj4
         Cqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248734; x=1774853534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKbSNz1bnQPVRgBTucbuG+mAtDWNAO0AjF15TWaqka0=;
        b=brd8RiF8celz+J93LzRxnUmakTa1RVZUvEpNiPx5InPmXB89WyZTs8rFaeU8Nae8iQ
         IQShzijUKBbK31XBhdzyzbvtKVW1iJiAGKuxM0/o0GbPJXPFvwWH8ulPM9XtPrSj14fT
         uTMz9S4Ei4UeCwvoNjjfiFfKgeB7Hrp+kQMo4Pif6O0KzhNuIfabuPnBsuB87UIwdRZc
         N7WyaY4Zyn/AcdY6wWc/7AsjDN5DGXky8rxjlZdCVienu8j2+KvR4Qwxnt1sWDGptp1M
         Po2HJstP6aynlOyhH6QobeSQrUMiJ36mTM59x8Ov12oL83F4vPHgo0W4yUY6UT+a+4ku
         8fmA==
X-Forwarded-Encrypted: i=1; AJvYcCVV1T/OLdu/8uD7ghFRqrPEpVhua0bcR3Xf5hpgGzQPzx0t8ZX5mXDPEpYGR539AdANydkrRVKTGSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWmD1wAeHY77jNW5YM8ajtkckxb7iL0710jNs2De3NnOppfhw
	xW9upGDcD2hRdN8t6Lo3UxRFeR/WAd36GIE0E0bLYQWoRaF4sPLdLuQQGZjX0JBtn7EVJ70v85S
	tGVByGsxOzvkoAqGh8n4vmDC/azMHKvf4H0EmPWbhNlaRy6SLt3KmoStIN3wSxy3C/vz1qQ==
X-Gm-Gg: ATEYQzwEQUt0MeNds1IYICjg3JU/dh3N+UuHCejMIT8sUPjkEvO1FN94oBFgh1jyBuG
	nCTG9YSNPgQbWqZPnOTeD6XiOncEHkhRC2J4rdWHQ/owietZ8a+kB6Iiq+DxzjVOy0dnFq5sSLM
	2x/zTNIpD8JZ+WX4r7aofyv4IdspgkvuemmysXPp3j8xW3S6oyyFYS9MbHMoj45GpcYfjaEW1iG
	JGbZMDDj2ow8m0mt5gIaJ4r7CoCWb69iBu4sP93mtzQV2a98k8r0FuAa57Y4jGQULIhURJw/uko
	AwR9/hhKn8S7X/yyT05DUDa62gJoz1qYkCFf1es5uRFkLTC5/xliqXsBWMw4JOqsJ/QjactVmV8
	pWpFdc8jck2xkA+JnpBcWbDoMkbaLS8ObLALw67rYSY/RMatUVeFdthmhWBD2p0+z
X-Received: by 2002:a05:6a00:23d6:b0:82a:14aa:795f with SMTP id d2e1a72fcca58-82a8c35da6amr9132173b3a.35.1774248733795;
        Sun, 22 Mar 2026 23:52:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:23d6:b0:82a:14aa:795f with SMTP id d2e1a72fcca58-82a8c35da6amr9132130b3a.35.1774248733349;
        Sun, 22 Mar 2026 23:52:13 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbebbfsm9997455b3a.18.2026.03.22.23.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:52:12 -0700 (PDT)
Message-ID: <98e46fa1-8e33-4288-9894-e1756da113e2@redhat.com>
Date: Mon, 23 Mar 2026 16:51:56 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/40] arm_mpam: resctrl: Implement helpers to update
 configuration
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
 <20260313144617.3420416-19-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-19-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl has two helpers for updating the configuration.
> resctrl_arch_update_one() updates a single value, and is used by the
> software-controller to apply feedback to the bandwidth controls, it has to
> be called on one of the CPUs in the resctrl:domain.
> 
> resctrl_arch_update_domains() copies multiple staged configurations, it can
> be called from anywhere.
> 
> Both helpers should update any changes to the underlying hardware.
> 
> Implement resctrl_arch_update_domains() to use
> resctrl_arch_update_one(). Neither need to be called on a specific CPU as
> the mpam driver will send IPIs as needed.
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
> list_for_each_entry -> list_for_each_entry_rcu
> return 0
> Restrict scope of local variables
> 
> Changes since v2:
> whitespace fix
> ---
>   drivers/resctrl/mpam_resctrl.c | 70 ++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

