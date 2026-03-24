Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F63AF67D
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332319; cv=none; b=KpsJqjWXp3Zn/6ngmHodsVgxbRJB/5QaXaqj/+mHhlF/gL6B+J9Iu81y9izyZhzA2qzMkmN8x54Puxqv0FwIw/ICvi4caE1/lyJ5cjEfHx665od34MwvE5qxtXKkl1Nqvz+7w1wTk2tThcbBnXWUl1qits6ZrG3fvKu2c1ReSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332319; c=relaxed/simple;
	bh=9kKEAqIsofsf9j9eZKJ2uLxM6sd+kjyOhrgvEs4OXX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5+J6q4qlCH4co13k2ftj8n38qwVBwDtyhA2OJV0NdcpI97cQTTz0P8PoJgGnwh2EDTwATcffRkpDcD0C84fRYGvrCyCAv7eM/MybM6RFY+IQkIbhYTNocysfBGCHRg4jYtf8j8f8/fANS+dbSfr8Mih31uv7ePL+TkRFp/kLS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SO8djeE6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RBi3ogoG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SO8djeE6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RBi3ogoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774332316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xw85OR1VT86W5/UYlwDEouH2+FNxd6th+BcXCbo6xiM=;
	b=SO8djeE6yP6bMmuZNf+nkbfH0AxwfzJP4l0wwYvSY+kWou/wYo31Hcv6p8uqvS7f6mbRQD
	goPRy/yRV4Fef+4liBBd+SMITo2L5B2RXm+1loRwKUpMDRJkphLiyrDSJfo9TugQfiXgt2
	Wesw/MCe3zKgV9DkjVKP6GHkYAufotM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-GVo2oV9LMCmUztwICCj8ig-1; Tue, 24 Mar 2026 02:05:14 -0400
X-MC-Unique: GVo2oV9LMCmUztwICCj8ig-1
X-Mimecast-MFC-AGG-ID: GVo2oV9LMCmUztwICCj8ig_1774332313
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b079b4a8c3so23512195ad.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774332313; x=1774937113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xw85OR1VT86W5/UYlwDEouH2+FNxd6th+BcXCbo6xiM=;
        b=RBi3ogoGORzsqp+85hfkn3742gHibFA+EGjA4r/oAejKGlno06lJpooSWGBhgXkcFk
         qpqngTIbrmiLns9JOpKcP4ASCqzEKD7G9Q1T4co+nlv0A0n6nD6WMcJvOMWAOJe+TBob
         msjOSh8M3g3hO95N83wcFNncOFCwfH5uKHbA5y9VkQStUqBtPg6vOareCcO42qQ6SWev
         TCNvbNB0lmE/zN+Vj7C/Nmc9Wjw9k0t/+aYCdEhrU1/J+AJh4cR3ZG3oaQgNcaZB6nKh
         IujffCD4l5rehbqYCGbaBWkG+4uGmEt3q0L9wGsghX0O5Otl2IsUE2KKCfvFCy+n3nBP
         P51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774332313; x=1774937113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw85OR1VT86W5/UYlwDEouH2+FNxd6th+BcXCbo6xiM=;
        b=AMuA1Ri16FNHrjRZgd4UbmT1HvSaXT1R7f7oa+Vnecp5z9zDHK7nRIzYt31c5TMlxD
         f3yV2HppMi9y4OZxFUFHoYPS+qPX3xFi35OnB+OiDGTwREXoTS5q/GMMdFychQOb8cS6
         Sm8rYSDIyNvPyRkhRgmf8Ll2wx1qkb90j+gyBhyaDLy/bTaU6zML3zZhRinlvXz+KGHS
         Th59kWHFVRn5PkX/atrdV+SC3ZDg9zC3QqdnMZ170UucrYPLO5aPfjfemqElHbaozx5d
         HbY3RyP14kRBkQIWQLS0bUmVJV7MHywzkm90WtAJtUHrPjYdFlyrA4W8eNk1mvhy2+Ug
         Jcyw==
X-Forwarded-Encrypted: i=1; AJvYcCU/758e5txVxqWPydTHwgVlQSy/spnDKA6MtLP28f9YH9Klg6N0xnJSWUTeUaJyBdAf/vnxxy/iK7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmkFBNcJrvSVb90GKCnr5N3cNC1wDadHA7r1xCgjJIFwroqDd
	6niST3R11QxrpNlhDF8bqkcoQxgvsQSChXG9cuCK6Mr9Gzm8g5avM1frh1y+Xa3BeFd1ZKRcap0
	NI4vQH2mMz2KvQuLuDkIyVFK1/2W/EWeCyjIj1wS9wyLXQEbPLpACZCge/kLmXw==
X-Gm-Gg: ATEYQzz39uOPTb7r1YVuGS1UxMkEHSd7YoKEDo31va6Ah5gLCC1KByl9ZehZPxH4Cke
	ldysDgGoB79ZX0bmrbHNY90gw3NW4NuVoArryMwviK4l2U8FjRpFg6Dxr1wcRr9M+weJu6Vmyx3
	E6icHnTQu0alNZ1I3Bz5enoTO++wBN/7+GvljxOY51fmTyAc4tOVZfx3AykDqHVKniqWuJZcaSP
	uaoqCAqwE6EwyQJCI0s4BWkvtZtMGxgyHaxIs+gj74EHog3EmU+Te1KMiF0f1deFn9YO7V+oC6z
	TxvasmRYd5bXh7Z2zXAhsrX49P4ENGprIEK3q33JBpi09MOE7vlMUKBb8TL7rnt5o6u7pdI21Pb
	GE5nend+hTsMVIo05/8AAXffi9F7n0n3mAZ3o212WqSF5z6QqEd2RAVNEFV1ODfI7
X-Received: by 2002:a17:903:288:b0:2b0:4554:9c24 with SMTP id d9443c01a7336-2b082797405mr140735055ad.32.1774332312849;
        Mon, 23 Mar 2026 23:05:12 -0700 (PDT)
X-Received: by 2002:a17:903:288:b0:2b0:4554:9c24 with SMTP id d9443c01a7336-2b082797405mr140734575ad.32.1774332312435;
        Mon, 23 Mar 2026 23:05:12 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556desm174549575ad.47.2026.03.23.23.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:05:11 -0700 (PDT)
Message-ID: <6373e449-6bbb-4fe3-b140-6cf452255558@redhat.com>
Date: Tue, 24 Mar 2026 16:04:54 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 40/40] arm64: mpam: Add initial MPAM documentation
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
 <20260313144617.3420416-41-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-41-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:46 AM, Ben Horgan wrote:
> MPAM (Memory Partitioning and Monitoring) is now exposed to user-space via
> resctrl. Add some documentation so the user knows what features to expect.
> 
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes by Ben:
> Some tidying, update for current heuristics
> 
> Changes from v4:
> Fix unusual indentation
> 
> Changes from v5:
> Drop cdp (under CONFIG_EXPERT) and mbwu (back with abmc)
> ---
>   Documentation/arch/arm64/index.rst |  1 +
>   Documentation/arch/arm64/mpam.rst  | 72 ++++++++++++++++++++++++++++++
>   2 files changed, 73 insertions(+)
>   create mode 100644 Documentation/arch/arm64/mpam.rst
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

