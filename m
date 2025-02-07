Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D126518DB0C
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 17:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738948420; cv=none; b=fr+w0k2bxILlXAHkoNRmYzstSH0hVA/xwpXoxfJzT957C9sZZcNy6+z6DfJvv0MrEQ0cIojM04INz8S/KPURrwxRLrA+bH2o2lxM0iekYj8EyJ/tO/yrUfDHJ82nfLTIlNzxfgsAoUV20sOOIsO2rc0l1sNLkfhvTZ+lMEhdhqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738948420; c=relaxed/simple;
	bh=BLOWmoRmbHy/gnuzM8xwn2yz4ukNppwSyIISh/gH96A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfQrNyhyyCQcRb2RrVWZ6YWGBuLhbHNpBNMR07Z1T4gmrg80fu8Rfg+px53cgco36vR6cTgmpzqhm0ZWpYbINPc+UUpKRuBuo62GO1Fz2EP6QAPzUBCkPtjPSNPiwete41XVvDl5VMyI1O4CfVdrF7kqUf+wdMVjKkYrU4TE++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q6WnmTFG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q6WnmTFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738948417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xExkY7a9dfcmWWKsnQJ8PF5WnPHcZhnPPJN0QoVJGQ=;
	b=Q6WnmTFGyeD8WNs5t40Hr0KYCXV3/dqrmA/9TvFL6O8PvE0MH0kgNVKIZi3/kEuQXjJyVp
	AmvKyIb1jDM01H1PW7d3l397427haJyNoCSp6GM988LyKXw0WC2KfuJG9a+nknzXdIiXg7
	H7UFyiQJZ6O36HCzcuMVzvlg1kOOXVo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-6UgD8og-NIKrReRIZvCqDA-1; Fri, 07 Feb 2025 12:13:35 -0500
X-MC-Unique: 6UgD8og-NIKrReRIZvCqDA-1
X-Mimecast-MFC-AGG-ID: 6UgD8og-NIKrReRIZvCqDA
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e43fb255c4so53505776d6.3
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 09:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948415; x=1739553215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xExkY7a9dfcmWWKsnQJ8PF5WnPHcZhnPPJN0QoVJGQ=;
        b=UxvoLRJvvQV4KBMwhAsQOu8YQeXcg+kGqiQjK/mm77uW9qs62qF50d2TgSaQ7Sd5Jp
         VUT7D4+u3wInaEc5ryVDWLJLRKsHUeept5Dlg0wScFCdVOmhHkUovtU9hb13xOwlq+Qf
         yW8Ugec5nVwKnovsNjt3nGZH+LLM+V0X/Iwf7zulinseis+i+hOgGpTZ9IwOUdtXdVNs
         PlOSQDpK0kfLurfX6q1cdHfxHOltY3Yx8Dkn+RzdVaw8JGR1MCICV3eb80KPHVqyDgi8
         zgPdVt136iy5jiBIL1yXDL+iAkOEmZZGr/PKXUuexvmDwfJz1++b2z/tFGFtSJHriiB1
         PeRg==
X-Forwarded-Encrypted: i=1; AJvYcCWRiFum34GPHdYbHeggl+hEMnop5n8hTTKu5E5EhwrVjO5YMsNtCnZIJoRZOIu0uH3XpPqie8PPacM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGTdqR3uwCrjBGjt59yU4OjZdCdjNP06Gq5As2vDjtq1a+/cmF
	1RwbPSwvzL8T6u2fIQq/4nSnboDNH0LVYNUZPFr5HeU+aEHZmxcBr6dUWtC9VbAIiSp3tNxdcLQ
	7qU7B9n1K/paGa6i83bzsigN2iQ+veVmhcuOr+YVgHNFF3GEW6iqAmcFYVQ==
X-Gm-Gg: ASbGncshzQxuYiNggO3H+V9UMFHQ2LmSWMsy0yfEEnDoiDo/JDMmXyN5Y4nEQsh2AlR
	LWmztOzClZ8YAxlpmgtHzXvhELhmxCYz1/IxXNmkGf8sUTzdAyKLhE9zymNpf2Lj7oyL0Nhr2wQ
	Qd3hXwIgIHTh2Xoh2NM1tv7cdtfAa8zIk60oFZAjsY7SD+tkhRUKBizpfR5P967F5lfA7y+UjfI
	RJwT1jzSq11DzMrIzCu2lUikSw/CYcK8WsfRGwn+JuUM7ic+yfd70reUW4KaKTRTGZcqfLFm4VP
	1jhL
X-Received: by 2002:a05:6214:2526:b0:6e4:34ed:c571 with SMTP id 6a1803df08f44-6e445674b58mr67413576d6.27.1738948414586;
        Fri, 07 Feb 2025 09:13:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmRysRMMAuZgbKXJBfFfQlbWetjxagGtq3aooaiwcNUXxsKgWhnuH6aSZCDZB6CMm/i/IdTA==
X-Received: by 2002:a05:6214:2526:b0:6e4:34ed:c571 with SMTP id 6a1803df08f44-6e445674b58mr67413256d6.27.1738948414309;
        Fri, 07 Feb 2025 09:13:34 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44150c6e9sm14437056d6.6.2025.02.07.09.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:13:33 -0800 (PST)
Message-ID: <9241eff1-0c2d-4c82-a77d-cb8b67cab6f9@redhat.com>
Date: Fri, 7 Feb 2025 12:13:32 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] intel_idle: introduce 'no_native' module parameter
To: dedekind1@gmail.com, linux-pm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Prarit Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250128141139.2033088-1-darcari@redhat.com>
 <20250206164009.816232-1-darcari@redhat.com>
 <6c258775cdf2f8f3c370c0cb81daf22dacf6aeed.camel@gmail.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <6c258775cdf2f8f3c370c0cb81daf22dacf6aeed.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Artem,

On 2/7/25 10:55 AM, Artem Bityutskiy wrote:
> Hi David,
> 
> On Thu, 2025-02-06 at 11:40 -0500, David Arcari wrote:
>> +The ``no_acpi``, ``use_acpi`` and ``no_native`` module parameters are
>> +recognized by ``intel_idle`` if the kernel has been configured with ACPI
>> +support).
> 
> And if kernel was not configured with ACPI support, are these not recognized? Or
> they are just no-op basically?

They are a no-op - the flags are all set to false so ACPI C-state tables 
are ignored.

> 
> Looks like there is a stray ")" at the end.
> 

Yes I will fix that.

>> +
>> +``no_acpi`` - Do not use ACPI at all.  Only native mode is available, no
>> +ACPI mode.
>> +
>> +``use_acpi`` - No-op in ACPI mode; however, the driver will consult ACPI
>> +tables for C-states on/off status in native mode.
> 
> I think "however" part is a bit confusing. Would you consider re-phrasing
> without "however" ?

Sure - so is this better:

``use_acpi`` - No-op in ACPI mode, the driver will consult ACPI tabees 
for C-states on/off status in native mode.

Thanks,
-DA
> 
>> +
>> +``no_native`` - Work only in ACPI mode, no native mode available (ignore
>> +all custom tables).
> 
> Other than these small nitpicks,
> 
> Reviewed-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Tested-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> (I tested it on an Intel Broadwell platform).
> 
> Thanks!
> 

