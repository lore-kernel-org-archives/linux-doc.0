Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D137139DBE3
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 03:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323787; cv=none; b=CpKZzIvt/cRdboZHYbNp3O/MEOtWMPtZYFJ0GPkCnid7rPCsQCKpOpA1t7qJbY1J3aI/apTLC0MvRhUFvsMwyk4lxvtYnXsH2Uhd3BhZ1zJKZdckpicGaa9GNtG6ixo45eOVzseNB/3VmozopzPdmLWTcGi0iJQ9oQPaDUHezlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323787; c=relaxed/simple;
	bh=tYxPUmrkSqy+h9zx39+4UE8iSXzxJ2KKz/e/bnLjXkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjKWwdFhHiqJI31Ximz+V7ZCcbVBFgPDT6K4Ls0e7ZNlZX2E5/kaA5QxEmqmJCO80zO/v4SweUmhI68Loeqv+lLp5LfeAouphm5Z+j0CRjfFwjuoxgpKvQIfFYdweXC8paWyWvxoqqkHjZyY5ixBIFIiPfArjSLxIGrBM2dGxOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ObV05ZyU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=n7g9LkR/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ObV05ZyU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="n7g9LkR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SY61T0BWUy1OFaShdZnORkkoebo47/qKa/D/wut4yWA=;
	b=ObV05ZyUi3o/1ImnGG1143JfLjcVVUt6aiL0HOj7m0XjguBOnD3ovdvCvCzWhPrhPHf0/c
	RSkgxvr+6tkZoOajE1itjMXLlC8eXe5iRU32O6s2iN2ok8x0EEbcDEAkrjYjnhocK2SPoT
	Nd6Wd5XQnPiKyhNiC5xaQXxFpBmSsfM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-VMSvxtcPO0-R6JMojs-K8g-1; Mon, 23 Mar 2026 23:43:03 -0400
X-MC-Unique: VMSvxtcPO0-R6JMojs-K8g-1
X-Mimecast-MFC-AGG-ID: VMSvxtcPO0-R6JMojs-K8g_1774323783
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b96fbfc64so18427695a91.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 20:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774323782; x=1774928582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SY61T0BWUy1OFaShdZnORkkoebo47/qKa/D/wut4yWA=;
        b=n7g9LkR/EWVmkoHkWuIS7T60abEwfh2KZos3pTtNJxr9mcCv8d0huhXvqaXMBz06Tb
         npZuYFwZcrfcdsq0wHZznSP3oKZ4vvOIaLSosKz88UtiUr0em/X9NJlBHjUswL1Le7c+
         7AH41A9cVR37FQk4JxAzmImuI7CWdb+QsBjusMxq4341u8dO8JQbW0hr+H/e9JFIHyS0
         UZJu6y3rspJpZ3yB+QHTDnhEpJ5+lIYUDdxQ3i1ZvSdKR0iTmMTWbI3O4HTqvO+heSC9
         YX4h64V3WPQBNDasbDLwXlVdmyb4TAQmFQ78TLQiusvnuZy8ECvehb2WoJ9qtZu9zp4I
         Cy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323782; x=1774928582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY61T0BWUy1OFaShdZnORkkoebo47/qKa/D/wut4yWA=;
        b=l8G6Irrvfu35zG2neqLcW3o1N6WADsog6yKYYeB0jwZGZ5htYpkoTo+mHDmehfLXnU
         xhnziUVhxTYbBUeyMmE+G70YFO0DOiv/vTwn82zQzmjcadsoPzhlKqTpGrL06leQlCXm
         kE/4TrKsOPehsEvefQ7eQ4CB9zKEw9isL97tQ3cBuhJuyC8qgq6GdWLoKboR2FryBJfJ
         JbyrEdlURI2cVSQliLYl2XaHAz+3xYGmHlvForYUqYDLlN97yvzpOkOK3xjKUS4TRfBZ
         e69lEpb5sCYjgmtBsnYRRklzNVxpTFtvxGYCbzjFJ1VbYy2EH9P7V2fqpViTqxcYoyb4
         Ttvg==
X-Forwarded-Encrypted: i=1; AJvYcCVutkTyoI3OYVnUn3oJ/kRQa94EoP0njQ7wI96QJe0hPYJrZOH4NI9+CDDlSj5qiwsXyax/OjGNIog=@vger.kernel.org
X-Gm-Message-State: AOJu0YySVYRXVhWqZ7q1DzIopq9dkD/Md6omvNgleOVdfKWx8HByDlms
	k4rFvY4lAiUdRYi2TcolW+IjcroTYVhEIoynqfnxud+8TWpJMzQix/dnucYn14Jq24jveHi/iWd
	dJSIkfsJMA4l/iwEZQCvc0bo/KAhvaSV4jflumdme/yfVJfOZ/jZGSGGkAmboOA==
X-Gm-Gg: ATEYQzwPu+IDU/nOVxP5GN1STqswl2r9D2ci9EzDwB84WVPSmxGGVRPj+lIcgaNBS0O
	ybKdGQObu4BRVCBjkaTFjAtK9mkXVN/z/w2+51QTHyjpe3BXbI4q1pKU2E4e9JHrSFRLU5OUDxO
	aNl+iLrqzvP4TOfNGVWI5shdJcToKC1CNJt7QekAip2hA3+33ecmNWdK92oxtUkFzjCtlfSfM2k
	mruPOUn4nGa2m9jdBh0ojl+wmO3+qlbki/jrtOtXEmE8Zf3UFUJn3zYcQUNi1VKGb4VMxD4Behj
	9fA7SvSCM9LVGPTBeqDY2HJWbZa1G32GJAz/SJx8xVhgCSgj+yPhrNt9p7qeSCX3EBKo/XQC3RL
	NGM+6zWMI5jyhxhv3qi0wTmVb8ODBsEXIJwtcE+nGjaOEvtb0Pg51z6LLz7C82Sbq
X-Received: by 2002:a17:90b:3946:b0:354:bfb7:db0c with SMTP id 98e67ed59e1d1-35bd2d349efmr12535756a91.22.1774323782506;
        Mon, 23 Mar 2026 20:43:02 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:354:bfb7:db0c with SMTP id 98e67ed59e1d1-35bd2d349efmr12535706a91.22.1774323782097;
        Mon, 23 Mar 2026 20:43:02 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03044d04sm751468a91.0.2026.03.23.20.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:43:01 -0700 (PDT)
Message-ID: <a09e6800-bbdd-4798-a419-df656e18668e@redhat.com>
Date: Tue, 24 Mar 2026 13:42:45 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 33/40] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
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
 <20260313144617.3420416-34-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-34-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Enough MPAM support is present to enable ARCH_HAS_CPU_RESCTRL.  Let it
> rip^Wlink!
> 
> ARCH_HAS_CPU_RESCTRL indicates resctrl can be enabled. It is enabled by the
> arch code simply because it has 'arch' in its name.
> 
> This removes ARM_CPU_RESCTRL as a mimic of X86_CPU_RESCTRL.  While here,
> move the ACPI dependency to the driver's Kconfig file.
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
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/Kconfig               | 2 +-
>   arch/arm64/include/asm/resctrl.h | 2 ++
>   drivers/resctrl/Kconfig          | 7 +++++++
>   drivers/resctrl/Makefile         | 2 +-
>   4 files changed, 11 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm64/include/asm/resctrl.h
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

