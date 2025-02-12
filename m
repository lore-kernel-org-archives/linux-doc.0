Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648552046BE
	for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364827; cv=none; b=Ul1rylLPrUj20FdOkaaiZRI1jbmVinKIkl5nfIOMjlSJwv+51pyHiKVNcbG2lKBwZyug0IKu2xLQEOc5iRHxs0Vrqm96sUGwgwD4OGOq8Ugc5IMSy73GLscuMTVQdB7gnSSfQNQquCkzRkBDxEORDoKx+QhVqefpPq3cVxvpF+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364827; c=relaxed/simple;
	bh=W4vUf1/0kFjyw3Paou9TarghzObDE/bTqGE1At5j+8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USjKwY6tGrq35qxqE9fWJkFVxw2v+XpHLHua3HloVo26PPQIxpk9b30dRtdzEch+fwhOuq/9v6pxzpyP4+H+sdQMTsOGOZBA79TgJCvrAF0EXd/JrhglOPDeHCnwC/ZR5NJ/OxXHg1ylC24qW2e/JK9jWGZj03tidMhBbuBje1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cjuzHfm3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cjuzHfm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739364823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=knzBHB+xibELoM9METHHEBNydWfuqJFvfie23B+AtL0=;
	b=cjuzHfm3SjMhB1Pk4TTyKQks7GfhHpOjmCwhG922dLdbdR/FkT6UAgHo318kw50IYXyDE7
	8eGN82ICNgxxdXqV1jH0QcjsfyJUvMZjFE1ljaItD80KGLAogPdWE4XjeYC1K8F18CzAOK
	kb7Ccos9jc3NSyeIUJX9mf8TAgw89XA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-xuOSMG3BM0GlmTzpuCgjMw-1; Wed, 12 Feb 2025 07:53:42 -0500
X-MC-Unique: xuOSMG3BM0GlmTzpuCgjMw-1
X-Mimecast-MFC-AGG-ID: xuOSMG3BM0GlmTzpuCgjMw
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0784e9214so19806185a.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 04:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364822; x=1739969622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knzBHB+xibELoM9METHHEBNydWfuqJFvfie23B+AtL0=;
        b=aIy4osm51U0fSlGMDhCfHOuXAscjVoTdf40Ze2KmHdQGVDDv4J5TiPISlmBO7rlxih
         4rhl+GZzvDt1tTTBw8Wx8IAxP3IWdUiO+WJTHhsJsCcMPRLZi1gIlG5E8Ft5I7q9h45n
         sBijGdMFeY9u9eTu3y36zTdeLRSpmX/f0vYB2f8equPSVoLjzudfmcNpxknOfeMyT2SN
         bZdkl1c8FlCe8lN+sh768GVWzHqy+1FLRGEpB+65s7OeTyMhPFqDXbkPHJE0gzWe0Vdt
         n1JEfWvUebAnuMc4S7dwMWNBdyLJ5oAXmZ/gnqxrDGR0toHUltcpmaR3ORkumd/elplc
         2uJg==
X-Forwarded-Encrypted: i=1; AJvYcCXgP3n3CLc2JlfFiY2++PJ1YE85IIXB87tQDWJezGr6DE6xFHF54I92l4nvAd1FJK253EjoHL+L3Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvInKtWXir57PF8sLf6AIyOGG958Ap1Nw1VQTBi1zhk0kPQaKp
	qdksB0bh8mJq5T5Jyy+7w2hOKynYMf+S2IvwSFlak4tP7H7Tw91O0EAnBZs8kYCb95ok8hU2caO
	T67ALtkDCY06oF8EITWcdg8ad6Kv7bYnAg9AeosD/slYV/AqtlJdfFwhK2A==
X-Gm-Gg: ASbGncti/kD/BNLskSPgqTl2RdSR7YPxKbqW58My2oB/eszu2mw3ME58BHyqAt91Zzw
	RJl8Z7FIA2bcmaq38qRvwOd0J7FkDZEAGSL6o13hEYqi3azLVhT6inMqa9MydIgovsfq+VnAxU9
	Fa0vlYTNSdxKLpkq8cSMeExOGQHGLADbggqeJMeiYl/BuUMWQAacKf52SBdUPYgmJ9d574Co0x1
	7B42q9kR1QJifWJ3qPC/ugy1w/gxSDWGT8MCkNVDbbHtxOnlj1aZwUwQQ5yeen+VvDJ9s+SF/kb
	dJNt
X-Received: by 2002:a05:620a:3950:b0:7c0:589b:2f3e with SMTP id af79cd13be357-7c06fc88adcmr407301585a.29.1739364822205;
        Wed, 12 Feb 2025 04:53:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7FcO8kuy6Gfi4rIlvRUBrNcSfOrvcVLper0drGWk6xj15NOdU6I+CCP8OX2xjc19cBs0qPg==
X-Received: by 2002:a05:620a:3950:b0:7c0:589b:2f3e with SMTP id af79cd13be357-7c06fc88adcmr407299085a.29.1739364821922;
        Wed, 12 Feb 2025 04:53:41 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07518e80fsm66396585a.26.2025.02.12.04.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 04:53:41 -0800 (PST)
Message-ID: <1d2c943f-9521-4dc8-b798-06cbb84bb7dc@redhat.com>
Date: Wed, 12 Feb 2025 07:53:40 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] intel_idle: introduce 'no_native' module parameter
To: dedekind1@gmail.com, kernel test robot <lkp@intel.com>,
 linux-pm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Prarit Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250211132741.99944-1-darcari@redhat.com>
 <202502121732.P7lZkbhm-lkp@intel.com>
 <21e66060c13c6a3cc33592f71cb08975711a6adb.camel@gmail.com>
 <9416ee48-a68a-465e-85be-89d5a53afcd8@redhat.com>
 <b7ed8d0b07e82a637bfc8a3f4d592f0f15ba9688.camel@gmail.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <b7ed8d0b07e82a637bfc8a3f4d592f0f15ba9688.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/12/25 7:46 AM, Artem Bityutskiy wrote:
> On Wed, 2025-02-12 at 07:41 -0500, David Arcari wrote:
>> - #ifdef the code that doesn't compile
>> - default no_acpi=true in the !CONFIG_ACPI_PROCESSOR_CSTATE case
>>
>> I sort of like the second option better, but I worry about the
>> documentation.  Specifically:
>>
>> "In the case that ACPI is not configured these flags have no impact
>> +on functionality."
>>
>> I guess that is still true.
>>
>> Perhaps there is a better option.  What do you think?
> 
> I've not been involved into kernel that much for long time. In old days
> sprinkling #ifdefs around was an anti-pattern. Most probably nowadays too. So
> the second option sounds better to me.

Another option would be to change the offending code to a function call:

if (ignore_native()) {

And have ignore_native() always return false when ACPI is not configured.

And yes I should have built and tested the kernel with ACPI disabled. 
My apologies.

I will do that for v4.

-DA

> 
> Artem.
> 

