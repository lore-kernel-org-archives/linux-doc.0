Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6923A6FC3
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 06:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773038579; cv=none; b=StpijZRRglxyKRc+ORnIXvad3ORBp45lEObRbyCfvP/MwSIDEVangA9QzaSpN4sJ5Hj1SY4QLHeRHnabT2NDXS+bD5EMvwt4xZtPoD/LDLPTh5r1iPGGWBXlu8o7VhXp4Ts82p9sUJpKV8V0D0djSEJZIkibedGq0eNvX9bVxkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773038579; c=relaxed/simple;
	bh=Glk260ZjXi9sbAFj/3Lolll4je+D8PsPOHio77eAtBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StAcJ/14e+fkSNzZkwprwNH7vqaIAxU25kyrlNldsxQP6wecrZdnISzaMArGRBB+qWvoDW+tMZVAjbMbrDyesJroap+nRaLbSTJhww8xCFPDUnEePQav8xh8+YTmXH+AOztuUKGgwsyo5CwA06S6FwfzOoWbHcqeWC/jznkZY20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dEnczJZm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sf9JLiyK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dEnczJZm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sf9JLiyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773038577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHOnhMTOgxuYQIm/RtVPW9fCDLVlAoRkKypHVQyrpc8=;
	b=dEnczJZmoFdiRZcdtE2lUaAsGEQeyr3p0eUxvDeFs7LeP98oM0Qae1FLsWN0a++kXZWkTd
	kth1jsdMJaFGnVQQX1rB47kki5SfV2YSLKl3b8jkSPeiINrUvxCys0/Hu3OGjCyyyB1xM0
	gylk+Mm8vId4Q/yV2BiMIFkq16nWopQ=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-F-eGpSFzNR6f1b7N7FMoxg-1; Mon, 09 Mar 2026 02:42:56 -0400
X-MC-Unique: F-eGpSFzNR6f1b7N7FMoxg-1
X-Mimecast-MFC-AGG-ID: F-eGpSFzNR6f1b7N7FMoxg_1773038575
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829ae358238so731454b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 23:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773038575; x=1773643375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHOnhMTOgxuYQIm/RtVPW9fCDLVlAoRkKypHVQyrpc8=;
        b=sf9JLiyKf48Ybgj4oNFhnMIdgNJUojhE7KHetwnil2QTIwnBcpxQoaiOVqsV7cpSzk
         LZH+d5Ld0QHHcQmh3QVrv0CQh7hDWhM9SQBz4M9GcLDSVmcD2lAFk64VaJ4Z/RnAmXC3
         3MatHWqXPxGgQ9JOCUtCf9xlMiLwUKyse69wdOwswiEVd0aHYRPQQOOzDqzv2Vsj0lUK
         yB30Whz2AGBvB0GXBHsZ2/t19iY450isPYOllzHNV8bgvABo/MDPAHem4GXo/xqR7Vls
         ncACqr49RjJrLbc8V+ROGCMiRdIIQ06vWYblqV5GA3gY0enc4Y3qrpppaSi2q2o/QfD2
         WwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038575; x=1773643375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHOnhMTOgxuYQIm/RtVPW9fCDLVlAoRkKypHVQyrpc8=;
        b=u6KBLAKKqNe39kd0SUqsB6MfN3oXmspNyMLxy51pVwUWN3UtqDBlpDyWrIVQ00lPXT
         yGBNGIZT6dWBDLhStTwWiNGiFq20h+6AC+jSt2OcI4RvkF5HNH6uMJ5vhPm2xbkQ7fX5
         QC0ufcLK4anGMDxxkcZbGegK2sERSll57464Wv7kIoAvhcggC0ztpjQ6VrlAbtDQOBG6
         uOoTPEMWSPGrygAc1Ln81oV6YQonV4U/0FkVKPidMKCXFsF2xIDNIpCIz5Zotx0xfcQb
         k4jbzY98UT3CWOQzEKaZZS9mhwM6EDesAZ3It4eOMgQs6zVvAbVLjtXWLuB/Eucg4BSe
         GzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtCGNzdNO34k7JPM0kGFgg4DGLzi0EyxAD0V7Gl+QdPyyyzCiKl+n/M6886Afmg5x6lnfmz+3xCww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs5qhLCDzrXa0BKFbF82xfo1LjKKIthMH/l2xiNk3HVHCBO+Se
	TUlyVPYRq9iinHUjB0Ucx+LA4tpGEjIbvX8qTY3wu2IzFxVjy2ZA89H9RKkGW2OgD7EMZv184bU
	/ibDtnau/J25kPI8gHcZhVlQsoL4iUipyVv9sx9Y1uD8SGW2eGYS2gQjFSBLQ0w==
X-Gm-Gg: ATEYQzwIHgHIimzMFMdr02qbZl+10AHGo77yMBgqhOvx9le8cJ3YwRTdeLHYWE5ltt0
	fVwW1D7owfV67xfaYD/vkAUIGBd22MfVLbuY8Y7SS6aCQWXeRsEsFWnChZOQVj6mHsWnCnuaTWt
	ru+oKm3yNr5KyLqpl94DwMRgXMYYZDAdVpoC37Lq+PIbmphP0OYHTjUAXCcrI+gYuncWCivdIsr
	J2qo+zwzZiW3atqfyZhgnkJCYlY0KfpT/MT496JEOWNiqzKcCN3Hd7oEk3BnfBQKAQcDihAEdfQ
	PvAiLxUzYoTbfwyCHSRUTp+ZQUdOrPfoH/G5xezJDNKyX9xTPyW/JG//EvF+/rHSHXFYa0IGkus
	BQhHypEMQbK3ajv2hGKvsD6qLsvUmkHfMMAt3pMK8K9ki9xo/0RdHvXBxStjGfHic
X-Received: by 2002:a05:6a00:7586:b0:829:9f46:280d with SMTP id d2e1a72fcca58-829a2d81dd0mr7344348b3a.1.1773038575181;
        Sun, 08 Mar 2026 23:42:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:7586:b0:829:9f46:280d with SMTP id d2e1a72fcca58-829a2d81dd0mr7344309b3a.1.1773038574824;
        Sun, 08 Mar 2026 23:42:54 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48de551sm9217887b3a.57.2026.03.08.23.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:42:53 -0700 (PDT)
Message-ID: <43723d39-0ac8-4a79-81fe-1edacbec293d@redhat.com>
Date: Mon, 9 Mar 2026 16:42:35 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/41] arm64: mpam: Drop the CONFIG_EXPERT restriction
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
 <20260224175720.2663924-7-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260224175720.2663924-7-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/26 3:56 AM, Ben Horgan wrote:
> In anticipation of MPAM being useful remove the CONFIG_EXPERT restriction.
> 
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/Kconfig      | 2 +-
>   drivers/resctrl/Kconfig | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

