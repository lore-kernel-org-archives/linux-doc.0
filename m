Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4039F192
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 03:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323766; cv=none; b=b2dzjxBVQuN3z32iWFk62Y5rUy2xVXNTbSXjH7nvfsBI74MmHPwtdUmgw+EYpmlZozux/QiYvodu6uyz3Vh4V/I+YFXZw4Wiy4HZWg5D6mwWyXWl5TJgSyxVVS3luntGtnpwh3PE+k5hMtVOM7Jmg3iYXLXt2tVAxOXQDiIc6Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323766; c=relaxed/simple;
	bh=ytx71aLgOpEN3OU1EImfPkvxmPyCQzLlBWGLfnk2Glk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksjomkmOx8ZgMdFkg6v8E7W9HT+rsr8Dv1aiSFuR8WwMGezC9yj87LzaOCpVu/M/bS3Xy1QDktZ0+hMDCXb+YZAXNIPF2XcfVvWkSGr98nouKNWp59ZUrMF5fwSaLlKtexKynuLdGiYujxzQzKGDEyM5XIrpdx8SxdV0bqaWulI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ic24lPkR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CE5nQ00K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ic24lPkR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CE5nQ00K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M9oHoK+qgr+hzDA71sg+T7mBzxA/nxf+7FTfYBCJoWQ=;
	b=ic24lPkRYS3FbHBMx5qxAgzlyyzC7IqB+HGLHCZEs4r5qH6MbYqGOKpp0oU7IZvUKb1+Rq
	D98rvF4oa5DgHd/HyYxbXbLESNTNjoS7neSHhYoRPI52NHPx3LMaQq0bB/LkUStYSkv7Am
	V2Ykr4TGYF7dO4CfGevi1h1OXPtCM+c=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-bOoBcfIdNTa1DoxMvC0lPw-1; Mon, 23 Mar 2026 23:42:42 -0400
X-MC-Unique: bOoBcfIdNTa1DoxMvC0lPw-1
X-Mimecast-MFC-AGG-ID: bOoBcfIdNTa1DoxMvC0lPw_1774323761
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0601ff3d9so15749405ad.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 20:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774323760; x=1774928560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9oHoK+qgr+hzDA71sg+T7mBzxA/nxf+7FTfYBCJoWQ=;
        b=CE5nQ00KnCwaWPJYActeWqxylp+rp1rEfM6H1p2z+WapFhRT4xs6PcrrGHsno2aTkM
         Wd/XAvSKy4xo7hRFvMEtVdyPcCaKILfp3QJeqGPJsTH4oMFZ5JX7x9Y3kPtfH0nj8uCD
         IHXzAEsISjpXaYx2mYUW3GCepRBPny4tYigSavNx7yFh9G8CV74FyT6gecF4Vf8gjzIU
         UM56AoTtWxB1fEC3kcKUlANASvnoCUkrVvy6SuMdKF4qWqucTc/kYXbsGbDSZQJszC8X
         Rv9iGkq8hyGxb3P07tFmxT7P1Rtvit3aFUAKzHXxo4gVWn99qHGQUHMIA9DDnV7qM57n
         PLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323760; x=1774928560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9oHoK+qgr+hzDA71sg+T7mBzxA/nxf+7FTfYBCJoWQ=;
        b=m9PNuhLl9OfEjtzfHYOZ/LddrhaLDS4UDZ4lxrxxIev3ddko7hfSEMNYoa97MVc/Wo
         vAJD8TS715X64GOm8nabVRZDFN2batGS1TV2pdteZYHxp3iA+xW5HqciS+pzrFT0u3OC
         edjEoo5B4XuAQtZsw4f9QBB1EHzvOuqZvZaTQBSsWDLQq16JxJGLeDJkn44BibRwyP5W
         PMACYMWelp8B/Ydv+uTBNntRqpY5GdT9XZARocLDYzIJrg12rnLGUBzTCID146OfVA5N
         nkUrxs9acAFe4OP+ckkyef7b+5x9UWsgWJcl88v/eCasHdR3hG0A0n+c4dGqjlNFu/q9
         WYfg==
X-Forwarded-Encrypted: i=1; AJvYcCUkKRZdRCIJ8jfy1SwF87abFOwdh17eivVRY4tRtNXOy84PZpKWVG9tZcG9We00PCLLa9jMuPFhB7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MRn40S6uQuAzayiEdcqammWw0ueQfjUjdoOWWPnDZWR1DMHW
	h5wZB6EHc7zI1Y6W2DURCk/sklWeby8jILaKoQmP+lvjV8SzzP2JIYCy3HEkD/+KvIM07ONiF4G
	WxOzQzGPJpH+Q10oHcipK+L/GjMq6Psf/mXwSzbh16z0IEwGKdPWw+Zdq37O7fQ==
X-Gm-Gg: ATEYQzy9S1vNflbdt17BatXleWXiuO4KLU8Dvih1nrisnQs+YVpEkQXSkKdo9vGAq49
	h/Dg2MbbWJ6ZQtLK99ggh+huE844VLI9D0zkLFdKrXRH2T0EQPuxjayiDW6JgwZxLVPRNGSKZAJ
	fA5iXbt2e3rGHZfPFyBBdS/FNR1PzsXlFaQXTUH9HcR1zsrsVQjmaRbe3BFIALapi9FzsC64dwY
	CfWDbclUh3G6XPJYeJOUyJxbW0YNUEAWm70qNtj5cmwURXn+knqZ55HNiosjPrSDS+cujPxLU+u
	/wOxv00u0gRYQTujmGHSJuu+TRRVBJhT2WuQSk452n3xl3IEW3iTFgUhDEfdFDg7iIWleIVGD/i
	uSEymxSSH6gaksWem9joJ6LXie/yIM1xMz2bQGtRvpg2sRgRisyd6SVxpdVJMjUMh
X-Received: by 2002:a17:902:f685:b0:2b0:4a1c:b847 with SMTP id d9443c01a7336-2b0827d55dcmr137215385ad.52.1774323760654;
        Mon, 23 Mar 2026 20:42:40 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2b0:4a1c:b847 with SMTP id d9443c01a7336-2b0827d55dcmr137215045ad.52.1774323760248;
        Mon, 23 Mar 2026 20:42:40 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369617dsm161821885ad.71.2026.03.23.20.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:42:39 -0700 (PDT)
Message-ID: <be4c52da-b345-43d2-b251-f0760ed4417d@redhat.com>
Date: Tue, 24 Mar 2026 13:42:23 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 32/40] arm_mpam: resctrl: Add empty definitions for
 assorted resctrl functions
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
 <20260313144617.3420416-33-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-33-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> A few resctrl features and hooks need to be provided, but aren't needed or
> supported on MPAM platforms.
> 
> resctrl has individual hooks to separately enable and disable the
> closid/partid and rmid/pmg context switching code. For MPAM this is all the
> same thing, as the value in struct task_struct is used to cache the value
> that should be written to hardware. arm64's context switching code is
> enabled once MPAM is usable, but doesn't touch the hardware unless the
> value has changed.
> 
> For now event configuration is not supported, and can be turned off by
> returning 'false' from resctrl_arch_is_evt_configurable().
> 
> The new io_alloc feature is not supported either, always return false from
> the enable helper to indicate and fail the enable.
> 
> Add this, and empty definitions for the other hooks.
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
> Changes since v3:
> Add resctrl_arch_pre_mount() {}
> resctrl_arch_reset_rmid_all() signature update
> add stubs for abmc
> keep empty definitions together
> 
> Changes since v5:
> Add resctrl_arch_reset_rmid() since mbwu will always use abmc
> ---
>   drivers/resctrl/mpam_resctrl.c | 65 ++++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h       |  9 +++++
>   2 files changed, 74 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

