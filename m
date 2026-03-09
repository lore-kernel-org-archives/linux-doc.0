Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCF5215F42
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773038687; cv=none; b=fPsGI72a2+eedBwdAiasovvqDn9pb5Z45OxjSD3YHRqrDAwMneAXOBH0C1Cgz3030KqWdzpgyT9sKj2GMNGiM2oU6fRM+JNkF3Ey+h9sBzK32eOJnquDXXVSu24e/qY8ZhDvOdhJ6TnvwxAiNBGxn7ITYM96EkqVpzPgklx1N/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773038687; c=relaxed/simple;
	bh=m1GxzCYPJ7MlXMmB7qD2xXmMcNVIEdbrk/Y+tXCyqw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBCMDIxBjHqiW9RdJcZO6zn0Mo0eGcmnU9S2wtcVC/oeR2/kydz0XXboxYn+fAtFtoroajVb4WSM8kggsCSTFKIFnsg5ax3HjJ7Zem32FBqfvJMw70IGMEBjjMJJK+ev5zEk0lq0qU/659JO3CZPzOZaaINCsoc9t2fiTluZW2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dt7gBblB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rsqTzO2C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dt7gBblB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rsqTzO2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773038685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmyjTIiffZpRJPT+RQ+3fTrkf/WN2/enrX5xBacS+iI=;
	b=dt7gBblBNujXao6MSRhtJ+zbVHg2KPJmUEdxaItd4Q2u7CFLa2/7xnyKlw+vqLqfsu9yCY
	zCQfwG57pYZE3hf5jt/2d8TfmuvLJWmDbxotldyrKjiWC+aGIaKq658ABsfVjGq3u61PUf
	m3Y+GpC2KTgWJcZ0fyndnHS9lwMvb5Y=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587--UExUGNHOXKLWRjwykKb0A-1; Mon, 09 Mar 2026 02:44:43 -0400
X-MC-Unique: -UExUGNHOXKLWRjwykKb0A-1
X-Mimecast-MFC-AGG-ID: -UExUGNHOXKLWRjwykKb0A_1773038683
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-359887aece0so8365935a91.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 23:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773038682; x=1773643482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmyjTIiffZpRJPT+RQ+3fTrkf/WN2/enrX5xBacS+iI=;
        b=rsqTzO2CbDOrnvOzp7E5Jy8Uu+uLA19vRUN+r7nkZq75mNsrfuQ4Geempbe1WhfHUA
         VZ6iLOQ2F5C0ezFZ8KsTDAlmc7CBDzHEiJLKfM94SBh8CQYCJWLlx4XBE8R8AbFNBu6k
         W4WILP3LpwLuCJFCMXKCM4H0QomMdP/qwGI4OCZ583Uq0wYCLg0dMQVZcRfFdp4cO+IC
         8QcCGELT/JSqFbzd48UrN7MHvMUyEf3lrfzxtl8/Hw9Lpd3QWcOI/B4ly4yHjslXIwhz
         lH2NawLyACZCdRTObOtdOdtulYNYrYAEoqWGjPiiJZETPAjmcsALH8ZghHKE9PAIRXYr
         Ldbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038682; x=1773643482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmyjTIiffZpRJPT+RQ+3fTrkf/WN2/enrX5xBacS+iI=;
        b=s3NEjjx1qNQPHdmuSEgqQcl2nYFo1NIwC3mOBrXeMhrDUKpUE0xkT00sbBtH6e1I2F
         GhgmWvSeGNPmm65TYLVWDqLbmuzgRpgHYiRIPOc7D20JSfHE71MdNGnMQ2nh69qiqM3G
         XXC/A4JKUGhG9ZAUZw1EGMZckdO8kJs3sr4jfBiPRO1F6R4FRmb5k1qn6EE30fEDvP4a
         PqUHHyTA3Y38peC1dS8HOidez/KFkyUYjcKKzH544iZn+KA+GTcXrPQc91guHGSCjn+v
         zFYIRRpXuB57rX25PmbekaLY9J2J0lrgJUcUOx0alcjbExgEERo1vWm26EqwvFx6QM37
         5WMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJRkckuVGRX1W7xpe7GRKN3MUjYHmVixW1+kRzWMJvsVTN7uAtj+Yna/7ru3lwicAJ6NMG43zrhk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2hR6TVlkzqEVdkUebQZtGIrQvECCkIU1kmwQdh81jh5PZoIQ
	edKCNv5DgqYKcs+hi1+tvmHYNoEYGuei7J2C/ue+9h0t2+MOaIeJ9laNhsArVjZ/k5Y5nMSU9eU
	wL/FPPrzHvSSr0NIzp3FVWgvXa00SyW87mY2CKIeuVpfNf/C/aH9NhGvBQxz0dg==
X-Gm-Gg: ATEYQzyHFHgCeXjb4cNvlAKTQKArQ7k93LWJCRFjUwbpIPvCxph2MZ3FV03haGfjfRZ
	MCIVSkKbl8uLl72g6RYBhrUQfsSH4d4y0ZKJ+9or+RGm0oKa/zgPS0d+R6fZ1QS1MTolk5v4onf
	Et54jvMHJqD3uTfJxri1pSnz0v5sUu7BF1Xrbq1xiyz6DL8I2ziDCiazCGjmM0P0w9re8Vjlf0S
	/snStFQ/VpqHCcxJm3cjBCXZqgftvwh8DfyJAtlIEl9iKhgTEJdz1JGOadAvEiNaQ1u+K2SkX6Y
	lVRsOfC/7fdJB7PMsDbZICoXMXm1i8bOnvONxdt+Hlpls1TPOXQZ7lLjpHZAgoRCqB3ipIddaGR
	h4x+mW9Va3EBraahkQehP2E/MPX7FqIe7po08WA0RYK0c9me7MLa/quLSqNOGW4Yy
X-Received: by 2002:a17:90b:4c09:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-359be233b87mr8593310a91.5.1773038682479;
        Sun, 08 Mar 2026 23:44:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4c09:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-359be233b87mr8593284a91.5.1773038682083;
        Sun, 08 Mar 2026 23:44:42 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d50ebdsm12993555a91.5.2026.03.08.23.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:44:40 -0700 (PDT)
Message-ID: <c9a544ef-5c12-4ad5-8503-39c28375b419@redhat.com>
Date: Mon, 9 Mar 2026 16:44:23 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/41] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
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
 <20260224175720.2663924-11-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260224175720.2663924-11-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/26 3:56 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Care must be taken when modifying the PARTID and PMG of a task in any
> per-task structure as writing these values may race with the task being
> scheduled in, and reading the modified values.
> 
> Add helpers to set the task properties, and the CPU default value.  These
> use WRITE_ONCE() that pairs with the READ_ONCE() in mpam_get_regval() to
> avoid causing torn values.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> CC: Dave Martin <Dave.Martin@arm.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Keep comment attached to mpam_get_regval()
> Add internal helper, __mpam_regval() (Jonathan)
> 
> Changes since v3:
> Remove extra CONFIG_ARM64_MPAM guarding
> Extend CONFIG_ARM64_MPAM guarding
> ---
>   arch/arm64/include/asm/mpam.h | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

