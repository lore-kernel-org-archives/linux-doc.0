Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF6212D86
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674275; cv=none; b=b/k1pTdaDZKl5YyyltchkCJt0ohPt2wo5s8CiLOiWvzXndJg3A4nkq8ck4aLR9WoLEtT5Wzv9HjkYWYgAN9AbAehwaObqrgwn/LNfl0Dqcgb99HjqZdencDbkswJB4gQ1jaaAk2xDOPhsta3x50NCdU1k8+2CjuncSw0XwtWgig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674275; c=relaxed/simple;
	bh=Rgc/f+Wcmo8qz72B+3oz5Ap1lo4OkJi0UE2cbc/5xAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rm826P0vi9eACHay7lOeMS+ad71sxNoFV4BQ5j0WKBDDsSXQvwC6DwHlXzf+pIab+MSTFfkZeP+gPri9xvjiOuSPewNrD9gNjLY7NvAumZHwZ31VUQCWQRMMD/1vbjkO1YCIJeoU4wYR3ujzS+h+je5URZqfyM56rPd7qa7EcfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ef5Cj+a8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ef5Cj+a8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738674272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pppECrInPH/W14Lxcxk1t62QVheAxKn/rN+YSPe7sKs=;
	b=Ef5Cj+a8B7xEuFhTNTifX4XzhA0y1c6yGd0RtkA8dv4Iv7aU3/1L2Ymd7eYLCglqxJJfOD
	3cl/8NWYBohhzD9tHpWiNVUPIWXTduV3qxX9paOr2LBhT4kJCiWLKrq18fq7JpDTO208XR
	w6jC78KCQDI1g5hOfQFsQ3S5zcfLjcU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-Pt0pJlV1NhWW--Ww5X7N_A-1; Tue, 04 Feb 2025 08:04:31 -0500
X-MC-Unique: Pt0pJlV1NhWW--Ww5X7N_A-1
X-Mimecast-MFC-AGG-ID: Pt0pJlV1NhWW--Ww5X7N_A
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6e6cf6742so1597702385a.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 05:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674270; x=1739279070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pppECrInPH/W14Lxcxk1t62QVheAxKn/rN+YSPe7sKs=;
        b=uG0JlsKa2B41ilO/x51ok1Xsf6ldRKF/cu5xLsITLi80hcuFvfXwh6U5Ww2LdtvQIl
         hl3RcdF8HP5YKyUredqH+B68KCZNd1MSr+ofXr+j42sW4nd494hukscwVoLhXdRlX2Ap
         Ts7mi2jALuyZp5O8d23sJFglYQiMWZDSgFf2JvWBbi1gZPgw+ororl3cQ0C3x7snzrsh
         8ujuXoUVfHZKE2xgIYfbPbOnYf4m2NQ3uBbx36ZGp9BEdpIMzCWojcQ8XhrPGdVDYVYp
         aCgMK2xqhkQGXJ5BBa+xvV2eVbqWJdJFsGLfxOHyXb29873ziUbNyV9VES7BeP3LKgRV
         zYUw==
X-Forwarded-Encrypted: i=1; AJvYcCX4eS9K+TXQJXdrW/ALqy67k6z6OQx8zQYRG4HPdfTiJ5CvSOSY5XmM3LI5R6Pf/TMMVGo1uiVTILg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzuX+9aCE8yxer03uMl3hS4jspYKwYAtoDxJo6DXt7QWopSsDv
	A2lFlctn5yCG01tA6ysdBe3Wex3AU9QZDN0R/gqEmM4B5S+oLYuMAE2IGtT51StHOg4RFNzApPK
	+UxsdiWRZQn8qwGLVBYb3u6qYk3yiQNCmLcpNwrVIaARmVQaLsP7/WL2WcA==
X-Gm-Gg: ASbGncsaXZOSzqq/+tlYWOl27USLfEwKbR8Staah04DYcELte9HnBsRRHUKdItYM8Nb
	Rl7pu4tNvIa/ZU/69oYobZQ7d3oTB9QREM9Gb9WMa0IVa9Y6RGXMHzoqZDOZWsQKqVCjyeVNueO
	CkjMQidFdU5DUzlH8K9MGPxn88sh/kuXzs7c2ci4OcLgtF24PHyw5HbZ9MPuEXs2LQyn4QHm9oq
	b7cd47Znk0JhpxMZEWbEYxW/p+IWL7v6eTomsGaHTAU9EkaZ7/y9oP1F1lbBkmD+7PZKXizRo5k
	w9U=
X-Received: by 2002:a05:620a:488f:b0:7bf:f916:faf3 with SMTP id af79cd13be357-7bffccbfe12mr4155344285a.8.1738674270540;
        Tue, 04 Feb 2025 05:04:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtDnf7KDOCUoIHnD6D3YYqYvSaIGGXyxEBh30BXHxvtFSgHTGtciLQnkmGdYC3a2+SLIAjBg==
X-Received: by 2002:a05:620a:488f:b0:7bf:f916:faf3 with SMTP id af79cd13be357-7bffccbfe12mr4155328385a.8.1738674269355;
        Tue, 04 Feb 2025 05:04:29 -0800 (PST)
Received: from [10.26.1.93] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8c8fafsm634050085a.26.2025.02.04.05.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 05:04:28 -0800 (PST)
Message-ID: <b50ade64-21ea-4420-a7ec-5e17ea7f6af7@redhat.com>
Date: Tue, 4 Feb 2025 08:04:27 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] intel_idle: introduce 'use_acpi_cst' module parameter
To: David Arcari <darcari@redhat.com>, dedekind1@gmail.com,
 linux-pm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250128141139.2033088-1-darcari@redhat.com>
 <e9188365425d2a4c0dfa7cfa2b17ad3d9fcf2735.camel@gmail.com>
 <afbe2137-398b-4053-93e7-2a03aeb32220@redhat.com>
Content-Language: en-US
From: Prarit Bhargava <prarit@redhat.com>
In-Reply-To: <afbe2137-398b-4053-93e7-2a03aeb32220@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/4/25 7:52 AM, David Arcari wrote:
> 
> Hi Artem,
> 
> On 2/4/25 7:23 AM, Artem Bityutskiy wrote:
>> Hi David,
>>
>> On Tue, 2025-01-28 at 09:11 -0500, David Arcari wrote:
>>
>>> +The ``use_acpi_cst`` module parameter (recognized by ``intel_idle`` 
>>> if the
>>> +kernel has been configured with ACPI support) can be set to make the 
>>> driver
>>> +ignore the per cpu idle states in lieu of ACPI idle states. 
>>> ``use_acpi_cst``
>>> +has no effect if ``no_acpi`` is set).
>>
>> With this change, there will be three parameters:
>>
>> * no_acpi
>> * use_acpi
>> * use_acpi_cst
>>
>> I would like to make the naming as intuitive as possible. We do not 
>> rename the
>> first 2, but for the 3rd one, I think "force_acpi" would be a better 
>> name. Or
>> perhaps "no_native"?
> 
> The problem with force_acpi is it is very similar to force_use_acpi 
> which is what intel_idle.c uses internally:
> 

Given that @Artem is suggesting we change the names of things -- perhaps 
we should fix "force_use_acpi" as well?

P.

> drivers/idle/intel_idle.c:module_param_named(use_acpi, force_use_acpi, 
> bool, 0444);
> 
> That said, I am not attached to the 'use_acpi_cst' parameter name.
> 
>>
>> * no_acpi - Do not use ACPI at all. Only native mode is available, no 
>> ACPI mode.
>> * use_acpi - No-op in ACPI mode, consult ACPI tables for C-states on/off
>>    status in native mode.
>> * force_acpi (or no_native?) - Work only in ACPI mode, no native mode 
>> available
>>    (ignore all custom tables).
>>
>> Additionally, I think we should enhance the documentation for 
>> 'no_acpi' and
>> 'use_acpi' while we're at it. Otherwise, it is hard to distinguish 
>> between these
>> three options. Would you consider another patch that improves the 
>> documentation
>> for 'no_acpi' and 'use_acpi', and then adds the third parameter?
> 
> I'm happy to resubmit. I guess I could use 'no_native' for the new 
> parameter and then update the documentation as you suggest above.
> 
> Does that work?
> 
>>
>> Thanks, Artem!
>>
> 
> Best,
> -DA
> 

