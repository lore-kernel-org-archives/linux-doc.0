Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C76D361667
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 22:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306233; cv=none; b=CdN/boh2u7q6mIKHse5UTDm5h8gICM/aiVWNrpojRTeQ6vuTPcGFpjch10+TDCwiKIbqT2M3w/no4zTN+9kO3J+WgVCSRBL+TF/09axhRKEaTSGAdmzmBw+u+DlM1AilxrMjf4+AhT0OrfUy+kO06xIYv8gRzSmFVowCC2+QVpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306233; c=relaxed/simple;
	bh=jJTcPlZldYQhd3QLj4UfA6QWdhk3aY6HXbnNiefgv5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDFfNjmK9zn6HGNjvGs54HVCf4yy7I4cousgqtpXZ6sXjV6GqA1SAlGkAvSisG0CnEK+VxVJg9snHIPUtwcCyFjajz8xjBynlttTW5ZjrUB29aWEyDBJ+XqxR0gg1kcSflkmD7+/fB6Hug7FkQlKjyutvjzd3wfTWjffUYDFUok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JhDD4tbN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gb8LuN/W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JhDD4tbN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gb8LuN/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774306231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=szqtNIvPXQ9SbI/61Nb1afNT5qmeNook0e8si00UqxM=;
	b=JhDD4tbNW8Fz/I4iXBy2wRPlnqwidztCfqPBDch8ZwIkM/31YEH7Vat33vzo21hRq4FglV
	GA1CHFzC392la52Q/02zrqhYLp+dqF0mF9df6LSawYC9qRuCEz6T5JK0lPj4wIh03la0z0
	SiyInKyqlF14eG4JLxRLkMdXo8ejmBU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-MllN15ekP9O8aCV3819tdA-1; Mon, 23 Mar 2026 18:50:30 -0400
X-MC-Unique: MllN15ekP9O8aCV3819tdA-1
X-Mimecast-MFC-AGG-ID: MllN15ekP9O8aCV3819tdA_1774306229
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35bea322389so2162342a91.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774306229; x=1774911029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szqtNIvPXQ9SbI/61Nb1afNT5qmeNook0e8si00UqxM=;
        b=Gb8LuN/WprAOqwxNKZDNWrHx0JOjXaiTxqvYwOAINVI8IbxhP5qGbytqNO2PfVBFyF
         y14NH5zn2XEjWrO5eYNJz8c+LVo+Yro+J9aw5ClCoPmEsXEY7BQpwLK6yTkNrkzZXGBF
         UNwWCx7XzfikNG96HnaSN0kKS3+MY3j4udmGbIwRIGISKuzmHRz+5Pgo0/BEhzm3c155
         qelqSQMzYwzunTC9GhVViZj/bg9g3VwqS227xZ0fHz/AS0DCogwehmqLpHfu/5+b/Wnp
         Lw+ZuR8x77+MCKHqhBGpzwEoAxNNWS7L4+EZkYI0eW8IOIEd84njjzky81xAbXNqwUch
         46XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306229; x=1774911029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szqtNIvPXQ9SbI/61Nb1afNT5qmeNook0e8si00UqxM=;
        b=bYC2RC9bD8oHsBSkLYdtgEuy9kxcuiPpBMMo9nIoew/PEBQbZIroqa4E4kg2FaYH04
         0Z5Ge0wq1OOEeVfz6+emHF3em14PyCZtQOmCsoauEahPkzUj+nO85NdgQDfS35P0YER8
         7+QME/jBkQ7qV6OJFWT8FATgpxkVXTBWT9bHsTGeurKf8d5Rte+NNT9lDq6+viiqTafp
         Q/bcL+Q8FZZ2W2wlCKRxXQG3hwqqKWzQ6dZFUhz9O0f88tKGoob8KEH2JEOKPh/TfS8K
         D1RnvJRvp2M9G0DajP4LMRIQ/9y3OeuuV9w012xGiD9EZzZYoB86khP37LG9A8nkXLoD
         JeJA==
X-Forwarded-Encrypted: i=1; AJvYcCXenW9xT9UQubzXS8WDW0x0kDcqn4THZrRLAxEG+XpcuKzHTMhvw/8n1wtR+87m8g8pb9UoBD/66YE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMkuBVjEwVyJfx+w4us6xyx5nl0EovDMbVek4r5DVrDweGB5h
	tfsgNJZIHZ/+Ar7E4/4Wtx+HimO91GKNC/an4n+t6RIX1MF1iWvrnKZMTRW22O9o3oI9DjeowSX
	5GliAma1VJgwlrqGtksCxtcz1EHML5kcW/sATnWvrcb5t4vI2NsR5SF6ktV86JQ==
X-Gm-Gg: ATEYQzz1VFpFUWrUCIR1k5L1tjapc4iIkf2WufyPc4n4bdkPIWZt+R2U4PEvYADivR7
	aWh//3upqx6qS/P4t+ry5SmEQ1Vry8w1W9Rn3qV5sn+M8hcNaorELX4Tk2JeHGAIyW4rrDKDrKL
	jHcO+7bwVu+eZLyUcDSFRiqBl12cK3E1f+mYx3frvmsllr9+L5a6Krj2+VVhp5eaxfy4MDlt5uW
	Uqj6MV99KvDEnquupimuMXBbr+ln7olHf3m+nSndqkKaLshftZsNHxTuFTJbuPOkwIX1XlYbwzA
	X/F0il5KsRH/khSMTHVM8b984uhJiWFvOOelwr+asBRGqPhth3R6ywLii4o+DsCt72AFGSvzBNP
	/Y1WRqmyTm31SpGqHCCtGUPCrmW2Q0iBw3VE79SaKWrowaRGUqK6qtW0AGGwMx3DF
X-Received: by 2002:a17:90b:270a:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35be690c7c9mr5628522a91.25.1774306228819;
        Mon, 23 Mar 2026 15:50:28 -0700 (PDT)
X-Received: by 2002:a17:90b:270a:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35be690c7c9mr5628485a91.25.1774306228455;
        Mon, 23 Mar 2026 15:50:28 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c02bf1585sm62840a91.13.2026.03.23.15.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:50:27 -0700 (PDT)
Message-ID: <1385eb20-4b04-453b-ad4a-9bad110f30da@redhat.com>
Date: Tue, 24 Mar 2026 08:50:11 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/40] arm_mpam: resctrl: Add rmid index helpers
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
 <20260313144617.3420416-24-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-24-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> Because MPAM's pmg aren't identical to RDT's rmid, resctrl handles some
> data structures by index. This allows x86 to map indexes to RMID, and MPAM
> to map them to partid-and-pmg.
> 
> Add the helpers to do this.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Suggested-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Use ~0U instead of ~0 in lhs of left shift
> 
> Changes since v2:
> Drop changes signed-off-by as reworked patch
> Use multiply and add rather than shift to avoid holes
> ---
>   drivers/resctrl/mpam_resctrl.c | 16 ++++++++++++++++
>   include/linux/arm_mpam.h       |  3 +++
>   2 files changed, 19 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


