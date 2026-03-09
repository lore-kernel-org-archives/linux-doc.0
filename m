Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B631077A
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773038623; cv=none; b=EtCRlgPfv9QFpm7OmC++ltTOwKHSuP0QuP487rXfmBkLAys6IElftFTT/jALEl19TGlHQmBGKT/GBcMxVU8kRPwrTnPxDueCPUKzwIIdAsOTtiUgg6xkDAxUbRMJnaSPQGgy4Sdk1dNVZzATCw0BW0E/E4h6sOKptUSEo3MMmOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773038623; c=relaxed/simple;
	bh=oU0Bm7/iu4lAhhhD/58bCyH0Zl053YpXS3ZortaUj74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHnE/WngUo4x5cIcrbl8Pz7m23+aF8NhYVC10FR4Llt/t36DXEr/HOonSIIHc26CmUUqgDrIXY8RfGgGN+tw6FGO75MKlZrpwobkycQh7Ic4ZbxUUnAUzF8VQ4IpLrGuKXM9ShHZb68jQxHEfVm5oq1qAL70JV66ev7NeNRgawo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aPfWJ6fO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ts7WLefw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aPfWJ6fO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ts7WLefw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773038620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/VoQtoxtMjinR0wQxRIglh5sEAwoToR0YD9sANGcxY=;
	b=aPfWJ6fOaLvfeGGYI7eJ0pGKXLerFZHnm4HzlAAQNtPbTvAasm95d55YpLjJt8CnmVZ0vp
	oZj4vKZq9M4MyrMH1HtNxAPugKK/fKjQqV0nCvzlGTLPkJqHNzJ3wj4OxeRQT+vqVCuTMB
	aT5d0R/MwbzgPNOYS28CgBxOjrAFsLE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-nmFV5MFwPOKZYETKJ4xP9w-1; Mon, 09 Mar 2026 02:43:39 -0400
X-MC-Unique: nmFV5MFwPOKZYETKJ4xP9w-1
X-Mimecast-MFC-AGG-ID: nmFV5MFwPOKZYETKJ4xP9w_1773038618
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so7172317a12.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 23:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773038618; x=1773643418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/VoQtoxtMjinR0wQxRIglh5sEAwoToR0YD9sANGcxY=;
        b=Ts7WLefwF4VoLCZOrr2vyD0H+Ayuiuc0nrXTJK06PCQcUNRplTV2BfPOtsDtIV4cp2
         zCJK6NxgQClx6Rk4DsvldLatIw8QkTSgiMeGc42FzlYMbJFL3ynpsNINRBl3n1cR0psX
         RUiWKOjz38vEcmIrGKshap49ECG/Jz4abARtNXB/pkbHguNsWgcG/bI22+3Vu0nMirjg
         XhfXtd2eYJZa0ifOQuAfFrzlaxLnx6F3/+AdBzYS6cvau/fcy+fkDJHI5NkBo/cd+N4x
         AWTtPvn+cU7dD13dFFCZzaWeWsoERElriztJkunDnRErSJc+4Ok6Enmgc57xYqejPVkR
         ehEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038618; x=1773643418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/VoQtoxtMjinR0wQxRIglh5sEAwoToR0YD9sANGcxY=;
        b=mUaaGUAQZAi7h4qRdfsrB7OJGaemacN1IMGOfO+NAceWMFQocLbH08SuQV0bR1RNM2
         ObLwgZCRjJ3u5qS3v6TZi8aNsj1YREdAEjE8KqAsQCH8KUtLpOXxU0FowcJgmm/rgt5y
         bXprPEqYxWGDM/KYvOFXpj3oih+OZfF20oQJrhQWQq/YQ5HjODJ2fMCggomffRq9LdlL
         dOfSOtqaBiUZtKIVZuuDJ0rOYln5/XFVMvVfoWRBvx8XAOzjpMgIqMTyKD9WFLI+W3aa
         Yce1lebyOY6+0vIC6PhEFQbvG9lCqohRrVGvk6KhmP2HzpHrm/8XvomCpUJ3yAqEFZ8m
         BEKg==
X-Forwarded-Encrypted: i=1; AJvYcCXuNFGcufKWGbQi5IVgqQk0kuuCxVKDgDtPtrQNugpTsLfvcWMOtM1AvEmaAJzp7GRpozZ2d3tlNpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+CzKnSqcwSlwDEsLAj36tGgz6V6afTioMbq8B0nolE/hLQ77f
	Eu6oZPeh3fi+JqDECNnUI7vLeHSRwB5ms2z99lRnq5MolWwPVWVGXKFGSa1CgTW9AB5QgnP5j+Y
	AAdbaigF66Wz45ltrLKv6MZvJKNCdRZXJ5YI4nZ9qC2n/QA6wNolddFa54vcN1g==
X-Gm-Gg: ATEYQzxzFnGIRUDizN2pBt26AtmtMuMCojlYrWsZEfstj/lZN9KBgHjZAy8dnNEpfRn
	zTllzasT2QBgxF9pEaxWOOXXgGhRY+uzDbkxA9dGqBj7qgq5fsBv0ubm0g+mp5UzfgQ8958uugb
	qO0skueNgzPeIIlkj9JceJI/1pGxMIaQ2x7+gFwZvzYYNKHoKVN4PWkEuvSUGCvZUnRGGbBrJNz
	O4pVeoCz3Aj+WDm4E6sf3qOX+h0X1elZydLtc8h62AMLULvaNv4YcXoke1cbdm/U5L2n9KVOaI7
	1j5CpSY1id1VLLXFiWekObXMZNuXGoOX7TYv0ZjXaYoYnROFnoQmY4VE2+2IO1UynBiB2kBBMNW
	5GK4n34Zf8DH61bGKXAbN3oVkOarhfTaGAIG+fTS2zBMBiVXbk8JsJmD6sOedSRer
X-Received: by 2002:a05:6a00:3e14:b0:827:2995:3ba0 with SMTP id d2e1a72fcca58-829a2f67981mr8452999b3a.32.1773038618124;
        Sun, 08 Mar 2026 23:43:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e14:b0:827:2995:3ba0 with SMTP id d2e1a72fcca58-829a2f67981mr8452979b3a.32.1773038617730;
        Sun, 08 Mar 2026 23:43:37 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3871sm9235407b3a.60.2026.03.08.23.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:43:37 -0700 (PDT)
Message-ID: <57dbec80-4cfe-468e-b32d-7dc0f872ed67@redhat.com>
Date: Mon, 9 Mar 2026 16:43:19 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/41] arm64: mpam: Advertise the CPUs MPAM limits to
 the driver
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
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <20260224175720.2663924-8-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260224175720.2663924-8-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/26 3:56 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Requestors need to populate the MPAM fields for any traffic they send on
> the interconnect. For the CPUs these values are taken from the
> corresponding MPAMy_ELx register. Each requestor may have a limit on the
> largest PARTID or PMG value that can be used. The MPAM driver has to
> determine the system-wide minimum supported PARTID and PMG values.
> 
> To do this, the driver needs to be told what each requestor's limit is.
> 
> CPUs are special, but this infrastructure is also needed for the SMMU and
> GIC ITS. Call the helper to tell the MPAM driver what the CPUs can do.
> 
> The return value can be ignored by the arch code as it runs well before the
> MPAM driver starts probing.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/kernel/mpam.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

