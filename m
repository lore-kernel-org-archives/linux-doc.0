Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218629993D
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 04:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774240920; cv=none; b=cI+EmbVTsGhj+cySVmneMCCCnBpLy97u0pBqmBwQ6KXkaHpBlkZEq8gXXFtYYjrz/pCitINF9P8xOfUQ83Zx9RBHlrcukyhfpRAxJ2tFsG7Cldpopwf05FIA2jIioByEMp83wTG8Oo/ADHowAWvm/LMlBRwI4viVGn3qtqblnGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774240920; c=relaxed/simple;
	bh=DVS68/R5TWDOz7LatH6NeVCBhR71o6dbSgRwSPCLqiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HE+YN3OnE9PUnPpASyUcEa4w85kWIeA5swrMXvk3LJoSep8Bzk+Ni/KwPA0+xqozr5GEKR78sn9MTS6OJ/UPzsxHt0t0oZrAu1OxMRt7p12mNEYTYUiBQXzoPT0qhYMa07ZKu4jGkGN2oie/Sd21Uj2mZtPoWE8ckU5DhofhmsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQh0coUv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XtDlmgsI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQh0coUv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XtDlmgsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774240918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bpzF/CEF7fwWVk/imLxKyu7B/chXAu6y92czDhmcd0o=;
	b=IQh0coUvxzjvf3YqDSHotoIiaBClcc1BbOWuf8lR0NBvhZhsX2BGBBfpHcojCUQmQHu1OZ
	+IVy9RON7O2GkClAfT3l0TtBAB8XVYoJC4ASMgSExOyjAl6RNAHP2NeJVk7R1KPa2bjpvr
	hZEYGLJtGBvgRz8SdlUP+11NQusM8c8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-OI0yXLt5Ozm84d4ve1nUVA-1; Mon, 23 Mar 2026 00:41:56 -0400
X-MC-Unique: OI0yXLt5Ozm84d4ve1nUVA-1
X-Mimecast-MFC-AGG-ID: OI0yXLt5Ozm84d4ve1nUVA_1774240915
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829b8bb5211so9863922b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 21:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774240915; x=1774845715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bpzF/CEF7fwWVk/imLxKyu7B/chXAu6y92czDhmcd0o=;
        b=XtDlmgsIRWo89e6n0HR0a24NAwwW5CUb2vklZ4ttYjXVnkx9x6gs9KveC0g0aDIxX7
         RKl1t/v2PaHn/35MPJxmnw0Yw23UFLY6WhdD94+74QOdEo9mpiEWwB5eSNu3UE/NiQ9K
         k7qswMeEicEN8zq207mRr79fHGFv5ADLJqfbrSJWJ0d56RLC5qDz99lkNzM0ZMRWb3wf
         Xv5/ptMcBHwvRiad6Joumx1UTUG2fUyM8f2vrsHipaqOOxVLME0YqOuLq/cex02Dcvxh
         W+Jp9bld3H1QWzXKrOkFeLtatYJUThQ3DQuGDK5lCevsFRxrbYw6x0SS5HyFD3DKvsT6
         k5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774240915; x=1774845715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpzF/CEF7fwWVk/imLxKyu7B/chXAu6y92czDhmcd0o=;
        b=cSWWxM+flfTmMjE7sU/taOJuDwXKWk/Fy5yf/nOi/6V+S9NfFYimJI9cCa23k9pMd0
         OEiuA141SJdfmPDWqKdRVfpOIrp63Bcb1tTmNTKyyVBhvyi2k/eZZkmzqukhhdjq4KUH
         5ff1bx5VszkPQ9VWagwXPSxMwaQ1ABZFuUQuQxSu6FYyNhuxWuLLH9KkXXW091DB08VM
         9rO56Ely2hydcaZr78wGUUpf4CW7RyJB2rp6tV4c+QJvuH/uFUxJG0AqhDnt9yZoY4aX
         HImECkBSciCnATTRp1P/xqe0OZJGeUjJ1mE73WtZ3FrpPaBxdvh1aSczmAWAh+3KTXSg
         hUsw==
X-Forwarded-Encrypted: i=1; AJvYcCVfoIuW9vM4FB7TK5ngku3RNTQ+71/oo03W6fMoj66e3GCq9kraUWEiJjN8kctHIsKItXHX2+7sbS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLg/uQnoAmiP0+cmijgUmnEWoCdREyzLKuzDi2Z0YWoLAvSe+p
	N+E1vVLy+6t+h1wfV+JgKOV7Eh+GzwMEqJMFESiZJKGa7zd3QJS54iEQLcQUHxERjOhXHPt5P2P
	AoOyLq/PAinhZcoFYdHqEC5sALhyva6ujimrvpr5DxjFoPkCDWKzph/ppJefBxA==
X-Gm-Gg: ATEYQzxBX6MSJmEZIN73stOC7kSh/V57b/EE22QcC5EGvWe0u32Un7HLugZEc9ed83d
	K3oE7CjgHzgm/KJ04szP2fpdUgzSlUEvzVgLhZ2bXUe/BsL1t94pHVuOgLozEhExSXRRvl9ZqlP
	dqfR8M4OAjlKafNVioROtB/r4HcXqrnXrlg5nmcQ2l2E1iAmx/x2wpRbunx0OGqnU/KCFR0M6dB
	SqFUt9PN0rgDy8pdtly2KvEdYyX11ukvaZKF4qjZZfm873dKS0MntdAJyPrAwjYEMA5THUtif2D
	BcVxhotrQzWgbmOadCwqgkvGHkz6HUarKsbpqXABNYYv0r/HzFNpCzqlBLfMRxER/98JjkRS6l8
	4Srhvip/3Nvmzv/WeOY5zdFc+7SzJjiFU5X5GvD0+aj4JANlzvL46BYs+QnxPs+KE
X-Received: by 2002:a05:6a00:21c4:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82a8c37fbfdmr9102375b3a.43.1774240915360;
        Sun, 22 Mar 2026 21:41:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:21c4:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82a8c37fbfdmr9102343b3a.43.1774240914907;
        Sun, 22 Mar 2026 21:41:54 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa9fc6sm8259697b3a.7.2026.03.22.21.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:41:54 -0700 (PDT)
Message-ID: <71f9ac1e-9f5a-4f12-807b-bbe0803f99e7@redhat.com>
Date: Mon, 23 Mar 2026 14:41:39 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/40] arm_mpam: Add KVM/arm64 and resctrl glue code
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
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:45 AM, Ben Horgan wrote:
> This version of the mpam missing pieces series sees a couple of things
> dropped or hidden. Memory bandwith utilization with free-running counters
> is dropped in preference of just always using 'mbm_event' mode (ABMC
> emulation) which simplifies the code and allows for, in the future,
> filtering by read/write traffic. So, for the interim, there is no memory
> bandwidth utilization support. CDP is hidden behind config expert as
> remount of resctrl fs could potentially lead to out of range PARTIDs being
> used and the fix requires a change in fs/resctrl. The setting of MPAM2_EL2
> (for pkvm/nvhe) is dropped as too expensive a write for not much value.
> 
> There are a couple of 'fixes' at the start of the series which address
> problems in the base driver but are only user visible due to this series.
> 
> Changelogs in patches
> 
> Thanks for all the reviewing and testing so far. Just a bit more to get this
> over the line.
> 
> There is a small build conflict with the MPAM abmc precursors series [1], which
> alters some of the resctrl arch hooks. I will shortly be posting a respin
> of that too.
> 
> [1] https://lore.kernel.org/lkml/20260225201905.3568624-1-ben.horgan@arm.com/
> 
>  From James' cover letter:
> 
> This is the missing piece to make MPAM usable resctrl in user-space. This has
> shed its debugfs code and the read/write 'event configuration' for the monitors
> to make the series smaller.
> 
> This adds the arch code and KVM support first. I anticipate the whole thing
> going via arm64, but if goes via tip instead, the an immutable branch with those
> patches should be easy to do.
> 
> Generally the resctrl glue code works by picking what MPAM features it can expose
> from the MPAM drive, then configuring the structs that back the resctrl helpers.
> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
> counters are considerably more hairy, and depend on hueristics around the topology,
> and a bunch of stuff trying to emulate ABMC.
> If it didn't pick what you wanted it to, please share the debug messages produced
> when enabling dynamic debug and booting with:
> | dyndbg="file mpam_resctrl.c +pl"
> 
> I've not found a platform that can test all the behaviours around the monitors,
> so this is where I'd expect the most bugs.
> 
> The MPAM spec that describes all the system and MMIO registers can be found here:
> https://developer.arm.com/documentation/ddi0598/db/?lang=en
> (Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
>   This document has the best overview)
> 
> 
> Based on v7.0-rc3
> 
> The series can be retrieved from:
> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v6
> 

[...]

Retested this series on NVidia's grace-hopper machine where L3 cache partitioning
and MBW (soft) limiting worked as expected. Besides, The L3 cache monitor counters
are increased as more cache usage is observed.

Tested-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin

