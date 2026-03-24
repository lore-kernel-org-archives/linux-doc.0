Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A68525F7A5
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 03:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323637; cv=none; b=uw8viQTRmDmB5f8H1rrb7PsvyPdvCPJQYMByYGQhOOfX9YG1hMtqOJti4ZCDaIGEkWZAftpQxKSkA4/dojSQlvXNuQwJzwCBfFrNJbb4YCEycWm8c33cmkNC1OR6Ksdw8Q34bPC4NdR57lUAf7Q3yDcQZR591lk3NFBZUTwoIVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323637; c=relaxed/simple;
	bh=GbWo3xlFo3+yW/y2PBN4nF0sITZI0vr2UyqlXDwEu3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbmBZ4NFMEeZOeOht7qcl3HMq9Gx4L0VTDsHlFBs3cHN3+dNc0B5y3DE9670oO0f3FCD2vzaOVSUeB/4g7XVzUr4c76UpLvi4/Vueo6prU3UpI36POwxp7CE7s8fFgQa8ARlMkT1OoOJnqs+hohhEpdw4oEseX1Ge0hX2yOW5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QvXaOBhJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tmS62AJa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QvXaOBhJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tmS62AJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XblcNM6KU7hXW8KSNBudspXcLZs2xKbcalCmzhtiVUo=;
	b=QvXaOBhJTH5Bcg1I8Noz5Z4hhje5CNgpTZIacQw+IapTuNwKjq7X2r3rGDA9fUsWU+3QNl
	tmS8Me5Ohzq9uFftY1qwzdZZ0GzIIq4fAtLvb4QgKSp86SQaDPEvkO0lax9YsvY29ZSbBW
	L8OsaPxKKIKO8gdI3LbPtU7U4kvjjSI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-DA7iMfcHMCSbHteChF4bug-1; Mon, 23 Mar 2026 23:40:33 -0400
X-MC-Unique: DA7iMfcHMCSbHteChF4bug-1
X-Mimecast-MFC-AGG-ID: DA7iMfcHMCSbHteChF4bug_1774323633
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b07bd30b5eso54956225ad.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 20:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774323633; x=1774928433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XblcNM6KU7hXW8KSNBudspXcLZs2xKbcalCmzhtiVUo=;
        b=tmS62AJaHZo2AOc70Q5WeqACvxf5epceQa3P7UStlFT8vkd25bkOZYu+374H3JHFgr
         7RSgM16EG6VHSYhBeJaOcsc0DKdzkMCgpYkfSDkkP2+BU2ewvJ3mT18yQUjF4xTjJrnY
         cmPTU67NOmndKSj7kfEy7xr/el/AsnNqcgQGEPsrOCo/XUyYDXqW9i855p+CN+547C/D
         UsgPTJzx526mEzKULwmeCN+Vj0QCDoPxBVhsnOsjaDSl+MSuuBH3r7+2W85YSTTxKBWT
         9JsN5EKqBO0srAb/x2VgU5D5aWo+STHPOHkYVmQtsD5d4TvF4QxmTo+j/0eYJ9QdcKRJ
         1txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323633; x=1774928433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XblcNM6KU7hXW8KSNBudspXcLZs2xKbcalCmzhtiVUo=;
        b=EdxDjsxVtU9T1OCRGeQBw2JJBEHEF9xBW1SUmnZtbWJ4YyBTtS9IbTi2nmV+8h7WMs
         uOAgXtP6BjWu2cWoUer695Sl4ojl56nnDQ9GgFh0Ek5yxpOT6PVdnXQku0kjrrjaJG3G
         F/Lz7h8kP8rqBfiinciNdYJew9SetnkWHe6o2jR9O9XWK1eSC8aAGGpKG16FQAQ2qDQ0
         dmGuet1l/5dDDVopfZ+8JcqZj7iND/rufKNQ5EVPXaK+E3lgGjZUdW3cUR5qiQQpTRyk
         HerHxDeK40ue1S33LpkeS0cnQdcxQ5tAXixEvxOZfqNzIjpKs1vclgky1BjNcFe0g/Y7
         CsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlHXYI4GlTCx7DDVYFYHGNVMrJ+M6G+qPDjA8GXXwf9j0mnQb+hFn599XD72EDZCM2pJlmvK4L7+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyexYIc9628lFErV/U9iNCE4mRdoEiZALqwWFeNiLycFW4m4FyF
	N0smv0zUjaAYunTvAAnR5nMCyPPGmsND3FE/yEjS8epAIUreQw6EDttVHQvp2QN1b3rJ9p3NiEu
	uyVV2hicctswwZpWLqd3MNcIbgSgb2yRxIS0xOSSLuElAttCc9p6Y1FLh40ayKQ==
X-Gm-Gg: ATEYQzy8gCimTHYBnwf1PzQSK/TZjerarzECEvRc9vkm7mjyoRl3v8S2N3zCab3TcG3
	vsSGp+GM6DSpatnXq5NZ7MtreANJuS9+DDRhrjhUmbaiqE2jJKZDLXF/sxj+kBTVZrHcIAQRK1P
	0M7R/QX3Lw3Zu/IXjH7cY003uNcdiVnMl7Mb4CAU4iAeUNOIc7AePqdMJjvcJmZY5lVieSyKxNG
	w0ABDzYBTJhKXyNOtiahRes2WZgRzGMNE3Evr+zeIF6Dy9F4q1FteI0ti72T5XzS2pfIa8HOoN5
	5IovgRpc5KKAQcRHO+Sddv1M4Rn6CR4lboIt3TxMHCbPb28+SU6U1hZWCRDm2DzfH7CsL3cjP5r
	OO2m+FBu3jLKVxD2W0UvBbQYqYsB/nykcW7Q6SiHyKDZUxDmz95rREl4FAwZoeasw
X-Received: by 2002:a17:902:e847:b0:2b0:5306:5f20 with SMTP id d9443c01a7336-2b0a4e16ca1mr16086585ad.18.1774323632673;
        Mon, 23 Mar 2026 20:40:32 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2b0:5306:5f20 with SMTP id d9443c01a7336-2b0a4e16ca1mr16086135ad.18.1774323632220;
        Mon, 23 Mar 2026 20:40:32 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c443sm162024795ad.56.2026.03.23.20.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:40:31 -0700 (PDT)
Message-ID: <2825ca38-44c5-4649-8a1c-40cf98905c44@redhat.com>
Date: Tue, 24 Mar 2026 13:40:17 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 27/40] arm_mpam: resctrl: Add monitor initialisation
 and domain boilerplate
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
 <20260313144617.3420416-28-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-28-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> Add the boilerplate that tells resctrl about the mpam monitors that are
> available. resctrl expects all (non-telemetry) monitors to be on the L3 and
> so advertise them there and invent an L3 resctrl resource if required. The
> L3 cache itself has to exist as the cache ids are used as the domain
> ids.
> 
> Bring the resctrl monitor domains online and offline based on the cpus
> they contain.
> 
> Support for specific monitor types is left to later.
> 
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> New patch but mostly moved from the existing patches to
> separate the monitors from the controls and the boilerplate
> from the specific counters.
> Use l3->mon_capable in resctrl_arch_mon_capable() as
> resctrl_enable_mon_event() now returns a bool.
> 
> Changes since v5:
> Use r->mon_capable instead of resctrl_arch_mon_capable() as specific
> to the resource
> Comment line wrap
> Include offline_ctrl_domain cleanup from controls boilerplate patch
> Include any_mon_comp finding and
> Halve num_rmid when cdp_enabled
> Move mpam_resctrl_get_mon_domain_from_cpu() from boilerplate patch
> ---
>   drivers/resctrl/mpam_internal.h |  15 +++
>   drivers/resctrl/mpam_resctrl.c  | 231 ++++++++++++++++++++++++++++++--
>   2 files changed, 235 insertions(+), 11 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

