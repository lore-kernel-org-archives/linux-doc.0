Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA028DB49
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 04:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774240666; cv=none; b=i2fEx0mhGo6McE9J1v9j61tD6ayZywnyr5ZyjrUgrBDwdfGFj7z8JipQGab+dnuz/rufFZgK1TvYRxB9YGkL8RSh1ZaJqZQeZ2FabCSATgyDHdXwkOWxAkbUPHeBedX+9aiNFsM8myRQDgcCNooHLkZsgM6blnyMk0eU060ed4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774240666; c=relaxed/simple;
	bh=/UDXzJUS8dpjDnhJHhQdc7XkITO19BtfWg/emBUvjrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIkEw8mY53zilrgFxKEOExPhb2F4l7Xmq5vk9CTfH8HVEHiOhjUXIdLdpxnYT4MC2ECw/a/HfrPWwllepPLosnelp+/130htTx5WSjPwBzIXzmz5nk2eHF3qHTps8xDGNn7ozzL3ZMWMj/iGK4CeaTq7yZFRfGun3DD4gEmAd4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fROIddAd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iyS9wmKM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fROIddAd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iyS9wmKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774240663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPVOVXRS5gJ3PFDSRQQsaieeJxLwdueewdmFDIlgVy4=;
	b=fROIddAdBrQ18dl5r/qCGxXHYOk0Gp5dHNiLafUd26OCfyex/UgwwMEgiITw4LFTymP15Z
	AeGUf3rIPAjNoWNFNg1TB3o4bLTvdj0c352hKcgPKXEyHTcrMTCoRmpLaMBwGKyLFnJx3j
	zlALUW5BFW1S4Gp8PWnCtRAlY1Y2D8A=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-1AOKIeBIOpaqVI8A5NvYIw-1; Mon, 23 Mar 2026 00:37:42 -0400
X-MC-Unique: 1AOKIeBIOpaqVI8A5NvYIw-1
X-Mimecast-MFC-AGG-ID: 1AOKIeBIOpaqVI8A5NvYIw_1774240661
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b9246248dso3822736a91.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 21:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774240661; x=1774845461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPVOVXRS5gJ3PFDSRQQsaieeJxLwdueewdmFDIlgVy4=;
        b=iyS9wmKM1xB39k5HBRXtZmNbGfZaygp9UNKDNtBd4lKSA3GMVqNyJn88zUoLhOGunD
         leC6UwAOgKYGSYBBnTBzJ2y3d6ThCYsC5ZEidjxbIWOuG37nc6NuGFs0z6U6XeoxEDec
         Ux0AVbv2kUTm+cR3UfcTudlkYREI24h1NUN9hyeZWWP11KVDvbSg/O7CeOiNv/VnhWyG
         dDHM4zyljGxCmwdXrSxbWDGGTNpeJHM+RUPbDoyzNJVJZct/YUOEvmry+GrZcm0tmg95
         6SpZ19PK7uVO1uBBrB+Gge4M5+RwzccUqn553Jmk0m3vPLnT5xsQjJPU3VgwT7qx7qXB
         87kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774240661; x=1774845461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPVOVXRS5gJ3PFDSRQQsaieeJxLwdueewdmFDIlgVy4=;
        b=mYLMT8QmJabl95cTdIUFXF3N2aA3bK3QhyAJFVELnbPvBm8qYmICab0ThJKY+Qz78f
         gtlWIUdjbXFZycwVBVnkk7v4yAdtwVEHlv5taoRKyZDGVMh0VKTrK03klb2Z1VCp4eof
         8UNQemto7PKjpW10cUdhLRfOIeV+Vr3upCqxf5wcb+du5gp/DxxU5qvL3ehgj6LZBKeb
         aJqr/TMgtgDZIyWBzUakw/VhpRKnG790bEAECf3UKRfZL0Vgq2F3hEfxkGFY17CaZrJE
         FlgXPjDklrdfy/AmjTyAudJWUeKyJHzgHMcfzg13zjInDAHTOG0lX1+S9NDempm8VqdY
         tdgg==
X-Forwarded-Encrypted: i=1; AJvYcCXGU+axZo3oLXg+kruvnBUyhg21K8Q16jO8jex0rFB+9zQfnRIom29L3vg/IYTai/r94gfGdng2BZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZm26iBx7E6+HxcC3ldnE/VbsZYRzfZyycDJaL+yGIph5iY2bq
	kc9UfrNhBggoQG1DR5V5jjzWqJXzCOqypRp/JhZEL4mRjQM0akTWcl4HM4qcDS72SK9vawc/XqQ
	fbqXA4bfnpOBjP70d/MTENIZhQOdB2caMXI9K+IgsqT8Z7lXNfsWkHvBr4qPKsw==
X-Gm-Gg: ATEYQzzkmqbqQboLG/Llc1udFTybz4mGDjpawZxw1PO7dMYbC6yaKgoAqFWF3YRfI++
	w417BMROSqcnnRLaglJ4GVcHckYU3dgqR5FucPzj9I8cNZgAcqXV8HaKWxHcTMCBo5x6hKOw771
	DQ5/OAnZkT/bpNlperLQulKfSqM589dkTt1betDlTiPtDj+NKO5+MuC/mTdWxVMAarMycUXMzbw
	AUNzcPJBPOnBUCjbxSZHDMsH6cwnrBoTn5ewKYAFmTAoM2rzIthLI2GRyktaWnNnP/jGvnWLkD3
	FYEo+OVi2RVqpepI7HR2mxYTu/Hqdck/ivEzoEiTlK0CJriRCHws4CG358cf2Kdh9aJOc5gm9Xf
	4eqgHpag/2/vyfso3uJobWXCUpeWjs8egwIPvoSFz2OPBznQ5/mkW21sSrZfdzMvQ
X-Received: by 2002:a17:90b:288d:b0:359:97d3:5c5b with SMTP id 98e67ed59e1d1-35bd2c6efd0mr8849947a91.20.1774240659503;
        Sun, 22 Mar 2026 21:37:39 -0700 (PDT)
X-Received: by 2002:a17:90b:288d:b0:359:97d3:5c5b with SMTP id 98e67ed59e1d1-35bd2c6efd0mr8849913a91.20.1774240659008;
        Sun, 22 Mar 2026 21:37:39 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd36b169esm3220585a91.12.2026.03.22.21.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:37:37 -0700 (PDT)
Message-ID: <ea006d67-34c0-44e3-8a7a-7934fb4da63c@redhat.com>
Date: Mon, 23 Mar 2026 14:37:20 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/40] arm_mpam: Ensure in_reset_state is false after
 applying configuration
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
 <20260313144617.3420416-2-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> The per-RIS flag, in_reset_state, indicates whether or not the MSC
> registers are in reset state, and allows avoiding resetting when they are
> already in reset state. However, when mpam_apply_config() updates the
> configuration it doesn't update the in_reset_state flag and so even after
> the configuration update in_reset_state can be true and mpam_reset_ris()
> will skip the actual register restoration on subsequent resets.
> 
> Once resctrl has a MPAM backend it will use resctrl_arch_reset_all_ctrls()
> to reset the MSC configuration on unmount and, if the in_reset_state flag
> is bogusly true, fail to reset the MSC configuration. The resulting
> non-reset MSC configuration can lead to persistent performance restrictions
> even after resctrl is unmounted.
> 
> Fix by clearing in_reset_state to false immediately after successful
> configuration application, ensuring that the next reset operation
> properly restores MSC register defaults.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Acked-by: Ben Horgan <ben.horgan@arm.com>
> [Horgan: rewrite commit message to not be specific to resctrl unmount]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Subject was originally:
> arm_mpam: Fix MPAM reset on resctrl unmount by clearing in_reset_state
> ---
>   drivers/resctrl/mpam_devices.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


