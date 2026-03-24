Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC41AAE17
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 04:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774326095; cv=none; b=XGhbI+FGK3/CnheapS3uLeAMH8PwDFCZ8qmTtPoO5YcSkRsPeVIY+Eo+F/X+XY1GF8zATje13jTq4ug70AG5C5Rd3Y8qjz9JL84hcY4syp+DbFlSsRQ0wSfS3i+DHmSiArOQfVuOdQk14NfogvN/mJrHDKN8yczZ+BUm0lXRDwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774326095; c=relaxed/simple;
	bh=Q9J8EZ7KakpOEdBx6xv3rMsDRoJWbyFh7BbfJZNgiME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGO36ewUlTuPBO6nb5IA27CxKRBEpPg6cT3GomakdHcmx08IcosfFH/tmo61AcNPNHAnGGse44KxPYKnTRWhkUXZed7GvD8oiGqfTzeedOqch4w3OUoy+lzgaYvV3So+h4N3Ivl+n4nPmwIYgqYPeFL+MB/gcKrJsPF7vaj3/Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwKY/fxl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJnllv0H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwKY/fxl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJnllv0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774326092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=as1oD5ZP7ir6ec+9vRMPKCBQFoPmXvB2fXhjUdsVMTM=;
	b=fwKY/fxlPiT9oD4Lvx2vzByL+RUvS31Rs4n+DUPcG3brpA8U+Oyf53dCNR/R+3s4CK8656
	UgTLCGJ80eQj7gNNmGonm6QY+kj9YDFxl+YgtBjeVy6BsSfs6qvWA5ozawcL+fY3pPaExt
	xKTmU10a9Qy56rA+XqDw2cf4IuQkNXE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-ek7IJRAnPLOm_3fNhkiGlQ-1; Tue, 24 Mar 2026 00:21:30 -0400
X-MC-Unique: ek7IJRAnPLOm_3fNhkiGlQ-1
X-Mimecast-MFC-AGG-ID: ek7IJRAnPLOm_3fNhkiGlQ_1774326090
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b06b68783dso21688395ad.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 21:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774326090; x=1774930890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=as1oD5ZP7ir6ec+9vRMPKCBQFoPmXvB2fXhjUdsVMTM=;
        b=ZJnllv0HNhNKlboA5QSumRvol2gYaa41d0QlPvrnf3HYYiZ48hxk6bf3lrnvMsBqiS
         LNbda3VT/R7ZVxqKCF+/2GDw5saero9QDe9hzIfOhRGLzp9S4+6+97mNSm/Rvo7GCy1D
         Gmb4y/Vvt2mLWRfJm4BGHpbI/8l0yOwJE5zQ7wJlxYRkVHxPCXcggjLeyvk0y5jZLERu
         aqvJngewQiA5f8nvjoqRF8QwJoIBN7ZFVYWjWuU7mXtNzHDs/bmL8KHrsPPnrlaI7f2n
         54G15mlC8Dj3joO5E78piRzB5WIuPIALL7cKRA0X6afCgVqOYEb0U9bKVjVtrw5vZObe
         SKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774326090; x=1774930890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as1oD5ZP7ir6ec+9vRMPKCBQFoPmXvB2fXhjUdsVMTM=;
        b=kJiG1nHnMX3GUxXL5yjxY6QbeYs4P8stH/wJ2WRTi9qJHJu3rO83JbLHxh6A+65cNP
         qkSBw8JKuyCE6UPbANPne4YuMoEDFX3FhEp3k0MNCHzuIeO3kuiGscqe/+ic6+I0HOYb
         UxCkF0PtKvwaWZbytyVpbueu0YwXcJqw/+QuMTDbZYdsZI888180YCZ4uprHLXqgf8P8
         t2baDiuS0i60LeC58UDaj0Ktytb35AescE5TYuqPtY9JUoPE5qJenFNEy01+ZJcj21Ls
         do5bdivJMYTPJA0px4qGbBxS+waRl/YVn899HOdNE6YXtzwWF4gaRNkFszRmdZRKB9pP
         1Ksg==
X-Forwarded-Encrypted: i=1; AJvYcCX86xnwBM8JEcR3RfJPcc7gaQBn47TqD3rkSdI4EwUAb6XvE+XQEepfMvNEPplkzagtdW4qlfvkmgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFdD3N6S+ioYK3SoS8P6wzJyVXjOwcBMRO9RJvLtj3AmE4HoDn
	AsLlk1bu4AWU3vUAV0Fszu3q3S3w/5FShTgimBA0OkarIsfln/2bQaRargMb98tGQYL+Cwsgk3E
	aZo7b3sTILc6Hh2EehwgC3H+LJzjHMqLJl3UwzJaYp3qLDrl7YpVP7gZn0WqFog==
X-Gm-Gg: ATEYQzzTQYOQL9C1QyaVV+w+Q3CwIXSWhSb2uvnzeSUb+5aHSvIdKpvmPE+oZpBukza
	k04lpa4SJQ5TkWdMM0HLgRqQetOKQpWzI9YJIcbKwdKLaQVHplage7z58evsa/5bC0XynOP9/gG
	UJm46xBq1Ma7FTLZYgvQEhH8Pdu+9i8FRsFvDKD/C0KxK5etO69QbmsAsQgItOXBDMELM1yS53j
	/Iirqk8fRq0vfHMW2OInDa5YfAf67RgSk8N7VmiWLAhTiPW+Rx+CHx4Dx/Nh0VhSTJd5TniwUKy
	cN/gxxPjcCdB5Qdkp/1XQmLwJ2WzM57m/wfGJwowOfYHfBnEYbM4yu7qESjqQVK+vt8Ue+we9Xh
	8cDcC9KZtRGGnyKlutPzPjSQcy7lvJqmEu2rA6Ij9vnVJqAC2RpLfGWDp+NtlAG5Q
X-Received: by 2002:a17:903:1a67:b0:2b0:694d:f5db with SMTP id d9443c01a7336-2b0828238d5mr130410725ad.52.1774326089752;
        Mon, 23 Mar 2026 21:21:29 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:694d:f5db with SMTP id d9443c01a7336-2b0828238d5mr130410275ad.52.1774326089350;
        Mon, 23 Mar 2026 21:21:29 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c74dsm171510225ad.62.2026.03.23.21.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:21:28 -0700 (PDT)
Message-ID: <d82f9434-ec90-4872-b779-2b20aa8e700d@redhat.com>
Date: Tue, 24 Mar 2026 14:21:12 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 39/40] arm_mpam: Quirk CMN-650's CSU NRDY behaviour
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
 <20260313144617.3420416-40-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-40-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> CMN-650 is afflicted with an erratum where the CSU NRDY bit never clears.
> This tells us the monitor never finishes scanning the cache. The erratum
> document says to wait the maximum time, then ignore the field.
> 
> Add a flag to indicate whether this is the final attempt to read the
> counter, and when this quirk is applied, ignore the NRDY field.
> 
> This means accesses to this counter will always retry, even if the counter
> was previously programmed to the same values.
> 
> The counter value is not expected to be stable, it drifts up and down with
> each allocation and eviction. The CSU register provides the value for a
> point in time.
> 
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> parentheses in macro
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  3 +++
>   drivers/resctrl/mpam_devices.c              | 12 ++++++++++++
>   drivers/resctrl/mpam_internal.h             |  6 ++++++
>   3 files changed, 21 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

