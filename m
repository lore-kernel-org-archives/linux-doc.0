Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1918E025
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 04:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774325995; cv=none; b=bUqP3hA0f7BgRcD6eqgiBRD/8kePL8KSaQCigC3heyTv6KqhatZ1rGxvJ85Q5VymuuSGtj/whApk4iim8wPTq0zs8dXMsovqOn6PP9TeQPn0ghIPhCt+opQadeKfOZi0xPmQqsbMAPYvuMoLJ/c0KLQ8XnNEX7wGYD2Zvy5MMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774325995; c=relaxed/simple;
	bh=9+uz7CzlNFoa9gXf4VBkH0zGszG5dtCkLuUwv7W9JPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ljc9u/Nsm9Elz8HwV27K+yCWsRQOkNk63zI+02/VzYuJQnwApb5qj6JpIVSz+cQYneWpPP8FI+5Y8fOcE09/C6sTr4aUFS+CkFhoTmT5jYxur/PJcW5J5u5oudWBpZ5hXknzCKRHcZPHggFq8bCyOrJzl0NfgXIKs6oG49ZqQRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P/oECCON; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lG/TVyMG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P/oECCON";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lG/TVyMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774325992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R08g5rCsq9whHw36ZZYWUOiHQj5R1FuEsuKvwJiGAyE=;
	b=P/oECCONoD31lD5sgSc6UssTTgN+w8ZNxOmfyCkqklj+KBKCxzvDnpCdk841KNzKXUS6Xr
	jx1Lm4HPrDO066dkwiFOP3g4VySVF1HXhPv7nUjnNlKX0IbgSUfeOPqf58rXiPS7vT/dvH
	wO1x5dd2MWLiHLFNVIsfg69YlDjm4+8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-N9Fova8GMIiR4swJCFM4Xg-1; Tue, 24 Mar 2026 00:19:50 -0400
X-MC-Unique: N9Fova8GMIiR4swJCFM4Xg-1
X-Mimecast-MFC-AGG-ID: N9Fova8GMIiR4swJCFM4Xg_1774325989
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0601ff3d9so16225195ad.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 21:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774325989; x=1774930789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R08g5rCsq9whHw36ZZYWUOiHQj5R1FuEsuKvwJiGAyE=;
        b=lG/TVyMGQ4ELslcBGA6ZMLM7odjpxdflIn8RoU8uc2GGAJlkPJErYil72xE2YJCr6i
         WjDvH1FOzjkHeL1doRwB+xt8BGUMqTS0iZRV+i6nOpnOU66hLqRVl2MDX6gM7feY6xD7
         /r78sr02kVEEWPr0OJGitaSmrt7+2tprlkZGVHlYXhMWASvpBxPtNG3z5K7hTJvNZsCw
         vwb+teYKa0IDfQUZV61SvR9GqdRDHhfb1ooppCxcnVbreoIi/NdK01+v3+dZBHs10tQI
         GI2aGUVJ3o0hHZOd4CvXBuJdKQ7Reh9Yt24T+G78W5KUOCZrr4oLaxDTduqV1zXGrzXj
         NoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774325989; x=1774930789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R08g5rCsq9whHw36ZZYWUOiHQj5R1FuEsuKvwJiGAyE=;
        b=iC2KBRxN2BLZHl91wpFLV+iBqJZeocdMPCp982wrle5cLjCjYnN43l9hFPNmEIityz
         0oxa1Ays/d3/wzkxMYX80cdJlX4Eyo8Qb+7V6OV6FfEQEj9tN+ekSQoUJ9hi9K+oPXmG
         0LJ6xFTFELsJk+zsiqQKl2aT4twoJcKtVsem9Wm4XCjan8fctp/JuAkkIltGUmjfgOgL
         Isz5TROnl2CDcc7KUWYPD2WEgPUp83Nz8eFEVETnaJ+ffViyvx1gtJIc6MORPVyKhFjK
         t7QVpEI3RwyhbSkbXI8U9aVwNHpMeUvd4hE6cg1edGwlvYmluqxJ7WtPdZF2+L3pZ0qx
         vjTg==
X-Forwarded-Encrypted: i=1; AJvYcCV4DLmSXuSbBQdz9lwwMZLSdNGf2J9qM4A5/vgrWd8JxC5s/EOY2AqZhN3tdl5l3HOQr83FpnxG7kI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw93dGk5W872F5zOPwnvXODkYUUCPlACjr8SVAQIpEHUO8vN2qi
	AzBcuT9hR3Z1jqOVZqkFGF8e7GcVty1mWPCDNQ/MlQUzfUd+GB48ABVWqTZUgL7yPB40vDB5CYZ
	to+uqxz5Le/X1gWJRg8mSvFsTrn9mWVOV4Lp1vcmayap2nBRf2Lsmd+7Cje5vHQ==
X-Gm-Gg: ATEYQzyt/KmQEL8My1TVE8K+ql73V+ns1BOI2kJT1a2Vkef0YIlT/vTkqD8X2rkczH7
	xlz7+GP4QHCziYaGgGgzZ8AdqlrTRqYWEJu+KXeIx4Who+TvZW3nRRj0C91ZHSKE47qpSOfGV1p
	TwdNEe4PLcwfPiNqJcEK9Kz63mW/nRIvrZfd30dwfpAjuTbHNnp2Gx3PTJ73TRH6qZ02BvcUsyM
	Uo7TL5s8ijqBu5K2XUKMman+Ww9EZPjV6iMOD4lG65FYxImhyJS1bk8rsxh0hgGsHhZhCowYiZL
	rc2vIEaUg6SIxrSNmRUb5wHlcCkN7puA03YipDqKCryCyo0s7ACVlpSmzrF1sj3mwJflulIQq8X
	rvAR8rvL9IoNeqf48EeV7UqqlNt6ulY0hCC+SCU8JxYvYoevQqkaUe1jZTtwp5JmT
X-Received: by 2002:a17:903:94e:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b0826e2f0emr124388355ad.12.1774325989060;
        Mon, 23 Mar 2026 21:19:49 -0700 (PDT)
X-Received: by 2002:a17:903:94e:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b0826e2f0emr124388145ad.12.1774325988661;
        Mon, 23 Mar 2026 21:19:48 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm121045485ad.13.2026.03.23.21.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:19:47 -0700 (PDT)
Message-ID: <48fdab87-7caa-4e84-803f-3fbad3dd306b@redhat.com>
Date: Tue, 24 Mar 2026 14:19:31 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 37/40] arm_mpam: Add workaround for T241-MPAM-4
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
 <20260313144617.3420416-38-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-38-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> In the T241 implementation of memory-bandwidth partitioning, in the absence
> of contention for bandwidth, the minimum bandwidth setting can affect the
> amount of achieved bandwidth. Specifically, the achieved bandwidth in the
> absence of contention can settle to any value between the values of
> MPAMCFG_MBW_MIN and MPAMCFG_MBW_MAX.  Also, if MPAMCFG_MBW_MIN is set
> zero (below 0.78125%), once a core enters a throttled state, it will never
> leave that state.
> 
> The first issue is not a concern if the MPAM software allows to program
> MPAMCFG_MBW_MIN through the sysfs interface. This patch ensures program
> MBW_MIN=1 (0.78125%) whenever MPAMCFG_MBW_MIN=0 is programmed.
> 
> In the scenario where the resctrl doesn't support the MBW_MIN interface via
> sysfs, to achieve bandwidth closer to MBW_MAX in the absence of contention,
> software should configure a relatively narrow gap between MBW_MIN and
> MBW_MAX. The recommendation is to use a 5% gap to mitigate the problem.
> 
> Clear the feature MBW_MIN feature from the class to ensure we don't
> accidentally change behaviour when resctrl adds support for a MBW_MIN
> interface.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> [ morse: Added as second quirk, adapted to use the new intermediate values
> in mpam_extend_config() ]
> 
> Changes since rfc:
> MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
> Handling when reset_mbw_min is set
> 
> Changes since v3:
> Move the 5% gap policy back here
> Clear mbw_min feature in class
> 
> Changes since v5:
> Calculate min from max when resetting
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  2 +
>   drivers/resctrl/mpam_devices.c              | 55 +++++++++++++++++++--
>   drivers/resctrl/mpam_internal.h             |  1 +
>   3 files changed, 55 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


