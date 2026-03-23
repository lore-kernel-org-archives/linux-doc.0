Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2702D7DDB
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 06:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774248109; cv=none; b=ldYehcuxYua1Ry1a5VP8z8dqc867A1eobAGeq1grC67st/Kwt7jVISwTtb/Pi2L94/4+A/ii/n9vlZ2qw5S0LedcKC2FSNCNE/1xijy2tqYKCbdQrx1M9EK9P0QB4gk/X4uxABepqB0Ct5VBtnP+kAbzU1A0mm9GBBBe5V9p71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774248109; c=relaxed/simple;
	bh=N4I55PcNCoIx8VXv2XV2AUTQjGDUKfRvEJAgWq5nVjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzxnyKjXx20EbTsrQgbmjdzKbZlJ0vnn2lJ+yjljk56cLSiCVkQzAtxQe7/cYKG0fGs8YgvdWpYC6+CTuhl64Zrb6GTbWBtQ7niAleMPY6lTYg6DE4Q+abwOo1oXAf8Y8DfMTTfd5C69GzTD990C9h28XxKWfzr8yZMTFU67Png=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rn3+j6f7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o6PJjoLp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rn3+j6f7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o6PJjoLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774248107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VzDoLUhO1gb7oNNZE+I+ReWQ1Pd7mAscGwxQPtNBNo=;
	b=Rn3+j6f7IUMq46kafqK6jUyNhmmDN05Ihgx+/IcoV1o29P3NjaLpbBYciCJBXQFFt7X+L9
	emaE4C+f51usUGehziszIIKVNghneRPiQYm5yJerXfgV7IMogU3nPKMQfJeVOAwsN4tkCf
	t1cGcHOxZBKQlqP4oV5Eu745wlw549Y=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-Ug9KwPvxOPKJCXZJDA1VbQ-1; Mon, 23 Mar 2026 02:41:45 -0400
X-MC-Unique: Ug9KwPvxOPKJCXZJDA1VbQ-1
X-Mimecast-MFC-AGG-ID: Ug9KwPvxOPKJCXZJDA1VbQ_1774248104
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b060c14ccbso39951275ad.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 23:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774248104; x=1774852904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/VzDoLUhO1gb7oNNZE+I+ReWQ1Pd7mAscGwxQPtNBNo=;
        b=o6PJjoLpzfP1+zXACgOuSDZSDQLObGeG+wlhaUfVV29c5R0fc6ss+GNwRrJWgLzF1B
         oDuCxKLIG1Nuvk6gJEqGM+5ZHgoObaar0w2JHshwthb5Css0dELBkliAaYGLuqDP20X7
         EsyFPf6Q478CfpWjWlJKPsgzCPPHHR7m66UlFkPMsUpbtL4AAuYqQxNBQFy7QE5/IaHf
         Y7GwiWxbrCq/Nu/T6myRWPmEPiP73Pw6TLvVJsxqYWrv4XHcDQjdStd8v5vkFb425ldv
         +InsxeKMYZiO2w6UAAkFBg8uV2hvqoiDzP7Px5LgjwzD67NreUQGyLLe+ppI+WcF3xJ/
         43Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248104; x=1774852904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VzDoLUhO1gb7oNNZE+I+ReWQ1Pd7mAscGwxQPtNBNo=;
        b=Niyg5nMcgPe1zxsojkcnz2azPeio4prVhaa/a050nHxVLQhs0VTD26HRF9MAsikibQ
         rsBPNNHGR0QUKpK+ClbMjSn4bg1zt7ULqAnvNjRj3CK+YZjR38NDUvRiF/LKvMbM+F50
         ZcUzzsSCiMnrkPO3G6GpWcM+CUga7Xz+ggaU5MHuZjiqhfmODytzZ8uYgHYcZE8lmseI
         T604Ncz7E+brnpF6hc9L6ufguw6NAaVb40/YIJxqrr8x9+ktQwQfnaW6lzlRwgDAoHWx
         +mnnz4Dkph75BztuU8xvs8SHG7uCAlANSMS9NfBRd3zL5A+2iVWQvsESTZC5J8F/5gzZ
         xYrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMJnC6CvEku5fNvw476SSKsNI1scuLXgxbfe2lAlmkH55rxNq2cM6rIRvMYVc/ultDKgaPmnngdhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ/zzw4ulAw+RjylFw0ErXfuAQ4jqkEvYWt/bTcVzOWIBQcTuc
	m3Gvw0vWWtheiacR/wgT2G/MFC2OyczNOBS+bBkKJu5Xu+Iz/JJQYg3QeoQzuaqevOlA/PlJ38m
	G6cUgF0DDTbmM3D1UVRCkndKojeA/00OFs08XLqO17hHByXBQYXPW+0uOA1zJIQ==
X-Gm-Gg: ATEYQzzXDh5kVLnrUBfH9cQRBQPzFNGqDIQnu/1Ro7/2dCAXsUtcxljnVlF6ZdnEh8o
	2Jz0LrV5Fc05ufgTmDTcceeo/UMBztHuKUzKBd9WqpQm37Yw1vbAiJZf3fWyOZ3/e5OtqcXSor9
	vE+S/rG4DgPAHCJ2a2R0GEinIHj4sce+4fiZlTzmA1V0JsIgpRHhbwwZyNTNoZjCxuc1bXXDzQq
	Wz4pU+2cX5FAtvwv88JXSPV9CPBPk2etJNO51gq8BgwIsRxbs0BY9J/Nc1Ve0NWvr9fiN/ZEoQD
	kN05qwTl6xav6vsstoH7tuhb7zkEhJEzF4uj/ttTWedDdZxkxlh+h3lDMSxqKK+BaeKA8pHjjY1
	ZjI/yrwoW04OS1Q8+Xero9p1dyDFq0CoCOl4OKxixmu9665/XGL5BuLTgHrdKVrA+
X-Received: by 2002:a17:902:d2c1:b0:2b0:603e:e147 with SMTP id d9443c01a7336-2b0827313b4mr111046475ad.22.1774248104425;
        Sun, 22 Mar 2026 23:41:44 -0700 (PDT)
X-Received: by 2002:a17:902:d2c1:b0:2b0:603e:e147 with SMTP id d9443c01a7336-2b0827313b4mr111045975ad.22.1774248104047;
        Sun, 22 Mar 2026 23:41:44 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835298acsm101110265ad.22.2026.03.22.23.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:41:43 -0700 (PDT)
Message-ID: <310ac0e6-6999-4969-b03b-a10564fc2901@redhat.com>
Date: Mon, 23 Mar 2026 16:41:27 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/40] arm_mpam: resctrl: Implement
 resctrl_arch_reset_all_ctrls()
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
 <20260313144617.3420416-17-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-17-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> We already have a helper for resetting an mpam class and component.  Hook
> it up to resctrl_arch_reset_all_ctrls() and the domain offline path.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Don't expose unlocked reset
> 
> Changes since v3:
> Don't use or expose mpam_reset_component_locked()
> ---
>   drivers/resctrl/mpam_devices.c  |  2 +-
>   drivers/resctrl/mpam_internal.h |  3 +++
>   drivers/resctrl/mpam_resctrl.c  | 13 +++++++++++++
>   3 files changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

