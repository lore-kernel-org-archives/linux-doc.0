Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745529BD82
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 22:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306428; cv=none; b=BGBfNhJnli5okMU7JGxZZvW2No4fmRHxnN18EO/lRnVWRRw97lYw5hVdurOLTrOIX1OKgvSismFTf62ZEUWkfbFPJT3ZAg+Orem6hNNH7jnfvk3IqaLamcxCldr4uf7SkpdJVGPRD/DS33GeiJzm6vp5npISKmqxVzk4WmgGyD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306428; c=relaxed/simple;
	bh=p1aI7eIN6SCgxe2B7sK+4JcUK+QCwhE895EL9IeW3SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=km9r3T282eqDieq+d8Bxqe83mPpYQ2ZFCAprXKxnstMurJ0kbbxHr5rljyIDpmwrMf73Kf1Wnnc8oXRdsBXfwXzvkyKxkGB4iOXaIPEGfaNHEPEJZK3QeZTKRfBzlg7D9WQvmnAO7zCw4iUctsEkJta68wrMT390q+pNxsTSTSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VZLZPmYl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kdrHC+tB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZLZPmYl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kdrHC+tB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774306426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OosJNlMHUO2ANcXKlCppT3JjFj+gSM8UPwVPtyNawFc=;
	b=VZLZPmYlskxlCPqLilILH12VzlRLvcWbW2OmwZWfKiQtYZYETP3QxScaVzBHNP+47asI3C
	j7iUeG78IT2acPOKb/+TNBRslDj8ppRUbsyx7TI1bhNssPvwn0nWw0WNzwTqxKLNKgJD8r
	kuBqsyoI6SYQK1MqqOfXvqCK95RSIdo=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-tNxN3IOUMCyezlhYap5y4g-1; Mon, 23 Mar 2026 18:53:44 -0400
X-MC-Unique: tNxN3IOUMCyezlhYap5y4g-1
X-Mimecast-MFC-AGG-ID: tNxN3IOUMCyezlhYap5y4g_1774306424
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a84f21bf2so15528259b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774306423; x=1774911223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OosJNlMHUO2ANcXKlCppT3JjFj+gSM8UPwVPtyNawFc=;
        b=kdrHC+tBOMlZLTdLNk0KSY+HtkGp/HcQCJcZPMqOf0r5ksPbexJTtEz4NvRijzhfbZ
         8NoaYmchIxhpS/cdneuqezAegLlUkeMg1qIL0BeG7IScVDEowxyk5XOGYZ7WYw1zQJAg
         VphxotPlyOJK2iYn2czfzIQpeA3rCy/+VtOPWK2QzqTvz8HwfJaHxPXjkNFyP4phGPRI
         6Iad+P0NEiqH/fR8igmYPWSWn3hO8NeXbiQELT94aKH4y3sJvcOqaCGlvxw72FsVHMKg
         0fleHNz3P3ZX7x0TULD2u2Nu40wUV4+1YDeniVVuiktxgxCI+vsv4oDHgoav6COku+cw
         wKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306423; x=1774911223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OosJNlMHUO2ANcXKlCppT3JjFj+gSM8UPwVPtyNawFc=;
        b=hNLhXVYaQRUc00RigFz1y/Lx+S705W5VBWNo+eY/2vgZ3CRpDVs1nEtsPEaH+wPa6W
         GYOrsfPvydCSG7yQM0yctbU2DqS1jCy15oTAeh3V5sdaxl/+gKXbfqoP2I2/Ch9xI2qS
         o8af6MK1KFFGDBVy73NdcucI/qB1bwnxdvP8oNyiW7px4DPsRt8JlyqUa1zdelYuj1Tr
         mOPba//u+P0rEXPDaoVafdDoTN+EwhSq6Qs8ci98U3hg5lN+PLqUQ4eHv6vcM3El1IhT
         8BOd/7YrZ1ZTxsyXDXXHpro7cBI/trxBEK6LpG7DJZuycXI+KFVGgY25WPcHdHcnVkkF
         cEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV879/WEcUQwkvNXZ+EWecVrFo7RQv56YRVKUBXNc7hCTRD9oS1nLU7BdqSpocfCYP115yHJs3b5XE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWK5m/e2nC60cwrTjxNm1RCLUnvlrY4LIK9WW5tjINCrRplQwC
	TIPUetazWSPA/tQQyivnQd8K9IeEYkeP6ZZnNjx0kZ12B9gboOTjDqammlTAwqXSDhGqdWZrJRm
	lXSL5b3TYl+2Lz/NGXIlxjblwn0W8PAT021dSyLFUq3A7Jxq8Q/UxxGUi/JTrGg==
X-Gm-Gg: ATEYQzyavZKkOfD7x30IZbNiUS47o9Uy1ksBkVZn9I9/YXh4XfU9MsSESBae25NBj0B
	NZv6epWd+5UMf6iDFk3zvcVfUPuL4a+JRvHnQNpyITxYDh3G0fqdo4jL7/E2d3MglzuGtl2hWyb
	vRoYplQLGCrffwhoqqUO1SlwsjD9ot+iz1HeStfBXcHw9m4MTaZbWQEHfaRoI6moxLrCCAwSDPM
	4JrXHI27EXeSNaymxvixsS/LGMVkK1voHRXifO+bpW8oV75KACKR4e7CnWQmpaKZkOsfz2lRFA4
	Jl4PgUJRCOjD5bttE7EHaTcs82HOgvQiE4HMDVB39xjV7kxGvi6MzgxTjAl3NfAfSKYFxLvQ0Vu
	0/ZkmmbEgtvY9MhqhD5O6RjDd/x6ICV2EYPPx5s5QZ60Gz0jf1Y640U7sDsNnXvsd
X-Received: by 2002:a05:6a00:99c:b0:827:3ed6:9122 with SMTP id d2e1a72fcca58-82a8c36f76dmr13334445b3a.59.1774306423679;
        Mon, 23 Mar 2026 15:53:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:99c:b0:827:3ed6:9122 with SMTP id d2e1a72fcca58-82a8c36f76dmr13334427b3a.59.1774306423314;
        Mon, 23 Mar 2026 15:53:43 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbebb2sm11341704b3a.14.2026.03.23.15.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:53:42 -0700 (PDT)
Message-ID: <f433b310-9bac-404a-9260-e01698e5c621@redhat.com>
Date: Tue, 24 Mar 2026 08:53:26 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 24/40] arm_mpam: resctrl: Wait for cacheinfo to be
 ready
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
 <20260313144617.3420416-25-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-25-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> In order to calculate the rmid realloc threshold the size of the cache
> needs to be known. Cache domains will also be named after the cache id. So
> that this information can be extracted from cacheinfo we need to wait for
> it to be ready. The cacheinfo information is populated in device_initcall()
> so we wait for that.
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
> [horgan: split out from another patch]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> This is moved into it's own patch to allow all uses of cacheinfo to be
> valid when they are introduced.
> ---
>   drivers/resctrl/mpam_resctrl.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



