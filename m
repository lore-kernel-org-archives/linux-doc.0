Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D043101D0
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365804; cv=none; b=dWswx7Tz16G3UmnySGzLjDSYO+1yf6IiozNT7rXBariIrHt4U5SiHBikL/LXaympL7a0sd0xOC1p71qdHwb1t1MVONqeSw2cpwsrJbuCI289tZNVsLW1wy6lzU/EwGn2whxp9UPU3GTA43zPvjTnrmI/nsb/aZV8/uzh/OPHgsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365804; c=relaxed/simple;
	bh=njoVli9hHhenuHq3sa6QXSMoKZCUPsuuYgMlcPNINFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKQuS1WVSpdgJbVJ7rSmYbjmYkownNtfthgvAK9zmx4vgoFaurUBuK3Q21ZBJWMxD0KiociaHi7XzuAgLSqvjrlKoZWZ8wc2imXpWnFDS1tiCWJpc1BA+2XjyakgsDDFTKeS5HNSTvKyuBXxbdk7KiHdbny8NCksD0BxDGiaww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yd+K9z1e; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RteeeLf6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yd+K9z1e";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RteeeLf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789365799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsxFcMrXf8D+H3BBw/ZjDBf99QDmuUAygALVfxwRxo0=;
	b=Yd+K9z1e9bqVrsZzUugBtxzYWD2Lvp+RMhVzne4b7naYrGW/4gK09I2ntwZLxGyjHj4jsb
	iLwEhAaKnR/f9jyBtCWERXy8rdLz1oDfI4JQw6MPjnJOvUUP4cUT6j6Uvta4Zp7Cfhk1Ws
	LZILJB20ofeU4VNUKr2Loq9VOArOLbc=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-618AFFjnMCCmW2n5n2V3qg-1; Mon, 14 Sep 2026 02:03:18 -0400
X-MC-Unique: 618AFFjnMCCmW2n5n2V3qg-1
X-Mimecast-MFC-AGG-ID: 618AFFjnMCCmW2n5n2V3qg_1789365798
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c5a1a0b54eso1639423b6e.0
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 23:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789365798; x=1789970598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsxFcMrXf8D+H3BBw/ZjDBf99QDmuUAygALVfxwRxo0=;
        b=RteeeLf65qfUjL4BjsnWcdDfeJg1LUfD1Ub2pRyuI+zMCFg16aer1vXAHSzDlSyKCc
         CShZ67Fy0CDZep8SMnhgBkb7Cr6hKykSjiOAtpztCJmTb2Iz0RMuP+PPMBcQU7ounyAJ
         wMiJJl0Ce7N0mZaYCyJQ3unjS8PZCJE8P7VietIbDFIhnusWsic7FR0oIrjdaz6+ALy5
         XZy3PHDooOqcVZMducBUexwWfw/Zl8a4kg376i3+EXxPvbPba2Odkb3ECMOM4ca43gPz
         /M9K/bV3JIwRy6Ipe+hAWb6ltSvn4gCo1ByVejQUQ6zco7ir9e8x1s9cdmY5AuXhR1Yw
         s4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365798; x=1789970598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsxFcMrXf8D+H3BBw/ZjDBf99QDmuUAygALVfxwRxo0=;
        b=IyWthbWNSq9Vc4Yxn9zhaggpcRV5X6fGrd56VH1fEJW+bbU751jDZdyBWX/JAt8e6s
         vrUkDjs/T4aSZuOmquCUMgZUs3rSFgb7PK8bI3qBqXJXYeFvPRCRX+womosGKW36higD
         60zqo8Ew1PyPlSZ9Q8nWiP40bsu6/TZKWoEx++k/t6hqsI6RRLSChfgc75qNfDyNYYkA
         D2iz5dQUFa7atp2tzRPGT3zujy6/CyeGsYzOvt/jnDFZXKeLh1akwhy3boWFmoc256s8
         hiSLEOKIgXSaALy3vJr1eOfhXk+7fb43rKoWUEr3yVqbVZxK0FC+zucMalGK9jcCCwib
         6ufA==
X-Forwarded-Encrypted: i=1; AKwUvBwEMMOvAkKYAIxwiJyCKF/7VfZMI9IdOUnhT3H2uIM8ovRUSGMG8ermQgVyFXpFZkCQc5zMIHpfJNs=@vger.kernel.org
X-Gm-Message-State: AFuF++maTU4vttLDRFARJ01kUEJu/dz4gYPZK1vAkw4I4wuckYUuuLjR
	1fuHZ2MV+aJs6OPECQHeIZegyw6lW1WRfqjCDfvWALrJ/uEprHJHpanQiu6SNru7QKyfdR+5GMj
	DV3xnx02TWuVNM/OqcD3LkBEqwB25rSkMlaex5bhopPwpTtqcv7qI3K5+uadI/g==
X-Gm-Gg: AYBFou2tKeYiarIG4JiGtcsVQDnqJRwiMyQy3+kAflZhpb/joKw2Qz1yO6i7g/KgvwU
	P7M8q90ZwruWqXQDPb/p3ZoC7kM4xyAD5yJcNVCPcz2S45BmC6WoyGrCLbDgSAWX7bwVlYjGbgM
	q1SVyrkYjaRmc3RTSFZTiulh322sh1oD3JocJtawF3xTXd9MEerPK/2kQ4la+L+8okqLKo4epQc
	tQiswemjYzNDM62SuXYrX032TxiwwHvaKQKuVC+aQaVQ3VqiKg2eIotmtoT0XRbQILrYOPQwxh1
	HdymhtDSnAgpMz8MVe+vD8c1DE3p3lvLo5nWy4ak8CBfMOJWkz5osmX8l3DfRKYNTNBcmaII66d
	UNQ4lZJ2JJB1Jdnotxdz+4ytZZnmRDGqzpqsaKYCXqg==
X-Received: by 2002:a05:6808:1a1b:b0:4b9:e65b:8c2f with SMTP id 5614622812f47-4c7b47b9d66mr512989b6e.29.1789365797651;
        Sun, 13 Sep 2026 23:03:17 -0700 (PDT)
X-Received: by 2002:a05:6808:1a1b:b0:4b9:e65b:8c2f with SMTP id 5614622812f47-4c7b47b9d66mr512943b6e.29.1789365797101;
        Sun, 13 Sep 2026 23:03:17 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm23715686eec.14.2026.09.13.23.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:03:16 -0700 (PDT)
Message-ID: <647592d0-d488-4fae-9deb-ceca00ffe52b@redhat.com>
Date: Mon, 14 Sep 2026 16:03:07 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] fs/resctrl: Factor MBA parse-time conversion to be
 per-arch
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260911163613.1131447-1-ben.horgan@arm.com>
 <20260911163613.1131447-4-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260911163613.1131447-4-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 2:36 AM, Ben Horgan wrote:
> From: Dave Martin <dave.martin@arm.com>
> 
> The control value parser for the MB resource currently coerces the memory
> bandwidth percentage value from userspace to be an exact multiple of the
> rdt_resource::resctrl_membw::bw_gran parameter.
> 
> On MPAM systems, this results in somewhat worse-than-worst-case rounding, since
> the bandwidth granularity advertised to resctrl by the MPAM driver is in general
> only an approximation to the actual hardware granularity on these systems, and
> the hardware bandwidth allocation control value is not natively a percentage --
> necessitating a further conversion in the resctrl_arch_update_domains() path,
> regardless of the conversion done at parse time.
> 
> For MPAM and x86 use their custom pre-prepared parse-time conversion,
> resctrl_arch_preconvert_bw(). This will avoid accumulated error from rounding
> the value twice on MPAM systems. For x86 systems there is no functional change.
> 
> Clarify the documentation, but avoid overly exact promises.
> 
> Clamping to bw_min and bw_max still feels generic: leave it in the core code,
> for now.
> 
> [ BH: Split out x86 specific changes ]
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Ben Horgan <Ben.Horgan@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> Changes since v3:
> Parameter order swap (Reinette)
> Reflow commit message to use 80 characters (Reinette)
> Adjust comment line length (Reinette)
> Add Reinette's R-b
> 
> Changes since v4:
> Make Dave the author as he wrote the patch
> 
> Changes since v5:
> Document that the rounding can be up or down
> ---
>   Documentation/filesystems/resctrl.rst | 17 +++++++++--------
>   fs/resctrl/ctrlmondata.c              |  6 +++---
>   2 files changed, 12 insertions(+), 11 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

