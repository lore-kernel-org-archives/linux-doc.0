Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2A9377EDE
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 03:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323713; cv=none; b=fbwoZB0sxKz+sh+WUuVbts00WWPG6HftO6a0znwQCw5s5B2CiFJvBFYkZt1BS26N3RClsjSHLoZb8duALz6HYi1FTWmr8ZuP4K6Ah1k1dZRiuI9Ady9GKU0dpsPCKOfMQ6XijOrD+hi1wJJaGRtQ+UZWJoqD7ai0DArxZ3qExw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323713; c=relaxed/simple;
	bh=W/iUkryvG3ueViuRMSEVaFw1WJyUIdLkdTezJQ1QMJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/zJmMYj6W11NrFk5ykAAO3uBlNkRs2oMyPlsI4+oh+FUwGmLK21evqKC2UYlASvZMuhb4UGQjDxdK59+OmCNMbb6G3sZWLiOmoovcGQMcznf9T1KPAUbeQvPKzIlaxEhHWA5Ll0k+2Ur3C8E+1nmm78YJmrSrqmDTmrC8T66ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxtOY5Ca; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZM1lIeu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxtOY5Ca";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZM1lIeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUeLGoeTwPTz7/suB9ZfTfJ1UEygTswX0AuYIezqldY=;
	b=fxtOY5CahERjaV8uVFfcKsrj3FoOZzBIZ3yQof/aj8EksMU0oDf/MstGvQ67VAlXm/+AXM
	1FawIJCc4FiFuqw5n4Z7Ny3LcViv5r7wDN0VJtBl3RJwQ/fFsq6iy+5vFdQGbk8qL6zUn0
	WWFIWUF6y2DFtNz7k1s084KwwpPquoo=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-R_z38f6VNtqOmN79GynUhg-1; Mon, 23 Mar 2026 23:41:48 -0400
X-MC-Unique: R_z38f6VNtqOmN79GynUhg-1
X-Mimecast-MFC-AGG-ID: R_z38f6VNtqOmN79GynUhg_1774323707
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7381a9a932so2207780a12.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 20:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774323707; x=1774928507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUeLGoeTwPTz7/suB9ZfTfJ1UEygTswX0AuYIezqldY=;
        b=fZM1lIeuLhnGE1ArZAagkgou6AWJ1CHluaDTWiGxlxywaha7+LnVsd6I05DSjw0wad
         L+cjDiv0d8PUxWayGn2aNpM5pT2xEFaAPX4hrNz+xDqmG9hvK0GgCsT+dgb+07N0jgJZ
         bTi5k4dZ1/GFK29EjejiK0eSDfGDtJWTsFSM8nh513zE/1thkCCCsTG+HltwLXviEoFK
         K1O9Vq7DwCgFQAHn5Xb5uM2iUkIbA4CEzwO9w+XbiWegzSsyaKOBGoNWIU1yzvkPndNm
         iEvVSJPg71GQmt+0IRMJHm0GS4rkkAgWCdQxYtP262lFVSDX6P6BZPKXmjNranXeaOAr
         udrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323707; x=1774928507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUeLGoeTwPTz7/suB9ZfTfJ1UEygTswX0AuYIezqldY=;
        b=oQvJi4XcO1Q7naLx8g6F+ilRv4wnA/YUqNaNNnP1CW5wbalPusEWTZv/sBHUFvz/m8
         7bBwoCo7FblDq1hTF+HR++yU9bKn4TSwY4iRiwUjREoxT0WjFh0jRZ7ryKZ/N3nuM3eq
         QcsdFsAajd32nDDOMNbSZWcfnuvQ8NzJCjAKgt74VWApI3meHaB9fKNBMEplRrFPOqzl
         Y0Gxj5MY7QqC/hWSNNYBcOcEXYaPCwZ8G+GBwIa+fZz/s1Aotr9CSz4zGc18suBfILcl
         TrVzs4sPC/77ER6gQkMYpoRT8sY1W1Z2ooso5YTcjEt+snpPC7LBn7rntxA/VXmv1Oz5
         2mJw==
X-Forwarded-Encrypted: i=1; AJvYcCV+k33UjnAIBO9X+b6zFNP1pKL064HePtJWWtBGwieZtc56733no0ACQ9eGaHd/LZ0oC2h1KTAgk04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT4BmPZPRVki9QkxopFVSBEEpB44Xd7Ia2aDGAQMq7WPllRYdx
	sWg7FxPcSahc3KfZNFewn0rs/bAYxDFje5OCenxoJwozlt0I2akgjzSXIDd4x9R05ZoAy+TKgFc
	Sjq8a3CfViqYUeyO7twxaQeGPf3upSZenWovpHLSV47f+1sxayN1zQKyjvrPL4g==
X-Gm-Gg: ATEYQzy/t51qd2QqPZF9FnXHeNFGVLgvkhqcLSATuLCwDUtV2Fo/2VeGRSg/DgVwBzh
	ex0AdZAk10vbT9lrx/XvdsiKil0TL9tqdYQMkoEPdSYHTy5a1fsYsi6abTOmHCHIOst0EIvyeiO
	t2pHyHUfnV4UV45xksb1u3tjwlJW22GrxCyV26btlTUz/oxfsmAsUNNkatvzMlBo8cj4pGyTwJQ
	b+nE3skXiHUtsoXPsKPBO/EBfrl9v38LHMShjw2L/uZQurwqoHmoK6iq3Pyi5ofgVkHWQwhkKo8
	kJVn+8kT/50yp/PYIxwhwub5Rma0QRD0CugKpFMDKMTI/VCdUl1QnbsrSjkw8tZzi/CM9MKu/x4
	o1SEMgYus2dQQDxfUfEjqGjCTNCPXZOWMT6JPJEp2hhT7S+B6rUXynWuIMzQfWR31
X-Received: by 2002:a05:6a21:4ed2:10b0:39b:f292:d7c0 with SMTP id adf61e73a8af0-39bf292e04dmr5956832637.58.1774323707474;
        Mon, 23 Mar 2026 20:41:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ed2:10b0:39b:f292:d7c0 with SMTP id adf61e73a8af0-39bf292e04dmr5956795637.58.1774323707126;
        Mon, 23 Mar 2026 20:41:47 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74487b5b8csm9108581a12.31.2026.03.23.20.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 20:41:46 -0700 (PDT)
Message-ID: <1ab278d0-59b4-4fcf-b72f-ddcdb4fc96b4@redhat.com>
Date: Tue, 24 Mar 2026 13:41:32 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 30/40] arm_mpam: resctrl: Add resctrl_arch_rmid_read()
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
 <20260313144617.3420416-31-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-31-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> resctrl uses resctrl_arch_rmid_read() to read counters. CDP emulation means
> the counter may need reading in three different ways.
> 
> The helpers behind the resctrl_arch_ functions will be re-used for the ABMC
> equivalent functions.
> 
> Add the rounding helper for checking monitor values while we're here.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> cfg initialisation style
> code flow at end of read_mon_cdp_safe()
> 
> Changes since v2:
> Whitespace changes
> 
> Changes since v3:
> Update function signatures
> Remove abmc check
> 
> Changes since v5:
> don't read mbwu
> remove reset code as only needed for mbwu
> ---
>   drivers/resctrl/mpam_resctrl.c | 82 ++++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h       |  5 +++
>   2 files changed, 87 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

