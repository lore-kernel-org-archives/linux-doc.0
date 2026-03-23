Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45008382F05
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 22:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305390; cv=none; b=iAQ+XvAs+Jho4UBWtwklHQ7hQmpn6j+c1tIpnV3hFHT1uO6xUDL7RYBcI8e27fVl2ytxYhZeD63ph9Jr/80IJNGA3K4S3tniea1ar9f9QBI5EmJAmKNKb46cqY/DsY0DB28HJVuP8pYsnlB/1TfB7Am8U8B8vC2ch29418NDL/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305390; c=relaxed/simple;
	bh=6nPVvppBMpXb8pi91FflCLpRagVoKE11caW+wuP1jG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fvu2DOgfANQBE22Jck3QamH7VLGSIE3ah0lGiE6yL/96O70rZTemjU4xhfLH0THw+AUpfChzSZhuTA4dIEZQqRoG/8/gMv2CNFYN4iiHoFJUcqcYPOIIJ44Sl1BkfYbFdp5n8cXTF0WxrllDKX7D+HYGcHkREwe2uNoQaNs0EhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hyiJJV+a; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LtP2WAG6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyiJJV+a";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LtP2WAG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774305388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDPVpBhxfGUvSSN0XoYbTldidy0ABB4XqU6mDSv+4+w=;
	b=hyiJJV+aWolWWFwMNwZ6mBJg8GxwDRyZAesdMjz1jIQHNzT4EIYWp5Cs6LjNqgwdh8A7Ut
	Nj3s4a+9O/Ju82PCFWMwjEFAeC63w5dCu7TlthdWZMsgHqzYWZsgi9octuU+4iMGH99La2
	VVxFHMqdzNGn1dj4uWuVUDtxrD5rwZs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-jdmrE1LNODWBeO4RWqQSpw-1; Mon, 23 Mar 2026 18:36:27 -0400
X-MC-Unique: jdmrE1LNODWBeO4RWqQSpw-1
X-Mimecast-MFC-AGG-ID: jdmrE1LNODWBeO4RWqQSpw_1774305386
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso980166a91.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774305386; x=1774910186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDPVpBhxfGUvSSN0XoYbTldidy0ABB4XqU6mDSv+4+w=;
        b=LtP2WAG6bt8JnDrHZhzYkvKEfnw+zrVUDR1hXuFIHi+M2clSKuqSEgaTm/5vxUnQOW
         qN4mQejBm0IohC4K1bhVfxUumdfSEgSI4KHG6o3zbhIDuGZHRtcwryAUTkvGeg5r7etj
         gLheH1fYW4nDAzoSgw8uqo6+h/+MizbwTUHX1KPxs/MpipPKU3+CyI7FlIT7wwj1rnrK
         5dYXSf52iDepM5aqUSbcsf+JjMgH1s0R8+ROXM6zRytPzp7OlS0tVM4vfgj34QGKDhr9
         b2FQ64M63eJlLBa+cz/8RoZwIeG2Kd8wjDsaz6zP5oMfWX56mfiVDz71jGAgDqCcCiQg
         cQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305386; x=1774910186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDPVpBhxfGUvSSN0XoYbTldidy0ABB4XqU6mDSv+4+w=;
        b=rEa4cWqA13ULjLNQcrHT/V9MH4F7JSvkwAu22TzA41zBGUMRkg9OSbUT19YLKKJnzy
         BBb2h2eAhWpdCbc1cmwyA3nkg/dFhjbdvn2/imb9sPe8ta43D3jvEyi7+MzuDFRsTXYD
         I1Y6qZ8310S56ccduCIA9SC0nk21ifkE9ppjqMtBCTE4cAaCrQM5ELArDWkvblLhiCLx
         PaumH87kcmohq8vLITMeybHBKhOyPPY2kxlFx+iHHJ2TAsOxT6SLiYTMc0yy7QqDQaC5
         dBGsFJmqYPOALDDlIbOCfBeUx7gaPSXsFE+jeRy97GvhtSVFtWQDIq09BqDHAqiz2Iu9
         gyHg==
X-Forwarded-Encrypted: i=1; AJvYcCVXo1yyJbNCMjAqGfREPomnhNqSZfvVPMWpM77LZncV9KnccYz9soFLDx4o+Q/dmo3YthVmLUJgDvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVinmfU01CfjFV2VGFrg1In425OLFijdtb7j7CTvQttxjRteB
	0BHp42eoja7+JGDcZKEiOs0KFdbl6S97zl4jEvkEapBMoGFb0RuKcLZC0ess+m5uCx9eDl7Z+TI
	F1Lq1jdoR0tx0htl/gkHR4o2wfRPbVqrl/Z6p6gCukz7kW/ZD7zPs/l0mu4n45Q==
X-Gm-Gg: ATEYQzwgufClyCApt4aeD0ryNruKM73ZH37akS4Gf4btcE7FItxi3nNpwy7AHKiO7uD
	sC2fdV5hxiATzxuQRd60c071G4YHgkjczsQXQ/HfH4hpI7i7rqPPBq7eC8fA5yqfeqF0L4qyQye
	16/p4UA3HPu1BZ/zWJLl1krR/d+Bd9OxfL7B+D9wcjRfsg7W2UIuSaOlng7RF3qvY0/xYN6dpEh
	AS7z2+VoUelOcm59rCuZJL3fphq9FSNVKAXT1lWq9XmD29bxWjeD7g276RZFXKGqRzBuOAYw0QN
	EyQpCYBpZl7QPWY56sox0RZX2+G0KBDa4Cg1CMNcUJUZKP5aGqYy44c7+37uNsLJPE4njie+Ro8
	2UDCqwKKbkbJr7l/wmmso+Fyvwr14Qwbeol81dmoziZAW8UdnCwRy/+XGk3LcoSnY
X-Received: by 2002:a17:90b:3f44:b0:35b:90e7:c453 with SMTP id 98e67ed59e1d1-35bd2bbe40bmr10223065a91.6.1774305385948;
        Mon, 23 Mar 2026 15:36:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3f44:b0:35b:90e7:c453 with SMTP id 98e67ed59e1d1-35bd2bbe40bmr10223032a91.6.1774305385578;
        Mon, 23 Mar 2026 15:36:25 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c017a161fsm139948a91.2.2026.03.23.15.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:36:23 -0700 (PDT)
Message-ID: <078a7efe-4f5b-43b4-8252-4de36769a94a@redhat.com>
Date: Tue, 24 Mar 2026 08:36:12 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/40] arm_mpam: resctrl: Hide CDP emulation behind
 CONFIG_EXPERT
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
 <20260313144617.3420416-22-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-22-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:45 AM, Ben Horgan wrote:
> When CDP is not enabled, the 'rmid_entry's in the limbo list,
> rmid_busy_llc, map directly to a (PARTID,PMG) pair and when CDP is enabled
> the mapping is to two different pairs. As the limbo list is reused between
> mounts and CDP disabled on unmount this can lead to stale mapping and the
> limbo handler will then make monitor reads with potentially out of range
> PARTID. This may then cause an MPAM error interrupt and the driver will
> disable MPAM.
> 
> No problems are expected if you just mount the resctrl file system
> once with CDP enabled and never unmount it. Hide CDP emulation behind
> CONFIG_EXPERT to protect the unwary.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Adding this ugliness in the hope of avoiding patch churn and extra
> reviewer work. I am looking into the resctrl changes needed to fix this.
> ---
>   drivers/resctrl/mpam_resctrl.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

