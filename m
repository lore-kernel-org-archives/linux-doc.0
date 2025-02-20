Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E951F0E33
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054089; cv=none; b=lAUsIeYWVbV7Vu7g26TnXKuP8W7sbTXaqxbtZJKBM1APtqM2qIypIo8tkCJb0WfkKLWNi1LAZ8Xvy0g/o8zeCD4BHa2dgSphUmnhg/HvPQwI0hv8fRpCcbOvCI0784IuZdxnWdfrgi6RRvFDw1OsEssXg586Jhu5AHb+CsXtpIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054089; c=relaxed/simple;
	bh=G4WFzbUYu9lFfolRDvcn32TX+JrNB4gdpQ3zQ6MBFS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxiAbWId5XKY69vozQcMY+J3bZq0cauURspPLS9ubhg6lmMBxae/mlzRHmTd0y90dB+JyBmE6n+cVPs04ySE0gpn9NWfXp+zFOIBHVBAy6E18OSafSMxkI6g3yOp1LJwzEH7luCENDgaum8y+5GU34VVA4+2/ua6jTNNHsmVmmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BA2sxox6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BA2sxox6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740054086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vm5MVJXgIurOEJPRVseRV9fMAcon6D5zZ8hk1lMW3L4=;
	b=BA2sxox6rGJCSdmG41HygORpWaXBCF+2KIei7+kaPctGpio7Lx3tPt/V740PctRMblkpD1
	FdUd+PgAE1gJyOeugvwjl8oH3t854PVF65H5RS/4qsViFH+XC248DnYd5z1sNgTu9HEBr0
	Prz0z2ch3z5YmoABIriOeMNasmRGbPk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-YgLoTWq_MluuopiXLUGGbg-1; Thu, 20 Feb 2025 07:21:25 -0500
X-MC-Unique: YgLoTWq_MluuopiXLUGGbg-1
X-Mimecast-MFC-AGG-ID: YgLoTWq_MluuopiXLUGGbg_1740054085
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0ae84aaceso153335585a.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 04:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054085; x=1740658885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vm5MVJXgIurOEJPRVseRV9fMAcon6D5zZ8hk1lMW3L4=;
        b=qPnnl0yjoCCEO/zxevwWL1wcVyycJ6qlkRIWEeiG4OmYqt0q3ON4pv0FvcHNf2c6i0
         Kl88pCBRVgq4Ki8dnt2uTX7dk1NDFofyMLtGXAzapuVXj+ABuYKGU003WxunrSHyHVM5
         O0EqI/K4uqgVb0OJ2bg0ALjVQYHdrj4gODBlbl8Mh9/GW9dEI1KM4UhLPRYwUDOn4C+/
         RXHhIXpdtB47C08dcKyPPUpSq7iHTXiB4S/MgNO7shI8xzVa/6vKa7ZWbqZbdZDOW2Wb
         O+r+3Ns0/Q6DAbdOvnA6TC/VMd7KZjxRrgbMJTNQA9SMBSwrVz93NIF21qqKigsJHXjr
         FzAA==
X-Forwarded-Encrypted: i=1; AJvYcCW1IJ0hUe1+26RPc40rweTYTnIxHWgkxfZz77q45V6R/arF6xuvNPRLQ2wHBzVoy0KPjVoCF37ix+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT9iOeboksYVrJosvcilvQLINZQAPBWiQVzH3ONKGuxjJ5VwDv
	/7jpJgTPF7V92IXlURo7q/ZT2VtAAc7AG3EoR6VB2tyeBywK3IpEkQRw/vmGNeqAECrkYIbSf0P
	XyHnW3/5iPSHinNWkAJJbWTDDM8Vd5ime/GW4MrNjao0OspM+rb6y+AVVLg==
X-Gm-Gg: ASbGncuMiQ7TBgV3Xt4hC4RUxlxnRKVwkHIQTW1nrXS76YOTiEn4V3TsX81/9UOQy9O
	/UnluhCCKF5Kvt8lxFc+/JuWratc/Ziy6uIhVXc8A0iE+qN2cCygxTlh/Ti76RARR1Nr+a1CMCw
	1rxMpi4fEd4KYnA84xggz+xVHKr5G8wyLDCjhYdsavzs4ce1srl9GkQvPoinmgqDIG6z8BIsEZ/
	VaFOaUB0qUOCszHiA2WAuHTq7AnLpfMLjS6Phd2EmFZmg4aTq7jZGgJzD+bpmajOFPbxxHryhlC
	Z0++
X-Received: by 2002:a05:620a:1a1b:b0:7c0:8306:1b63 with SMTP id af79cd13be357-7c0b5366543mr1106767385a.55.1740054084978;
        Thu, 20 Feb 2025 04:21:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJi6k2Wr4Fpd9iX+j88GJ8Ngi4ATiMfXbK8KqmuSfpODekq3owHmWB+d740Eh8Dc2wWajT+g==
X-Received: by 2002:a05:620a:1a1b:b0:7c0:8306:1b63 with SMTP id af79cd13be357-7c0b5366543mr1106763585a.55.1740054084619;
        Thu, 20 Feb 2025 04:21:24 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0ae3fa256sm307219185a.0.2025.02.20.04.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 04:21:24 -0800 (PST)
Message-ID: <98c470f1-5c15-4075-958b-9f35e41005c1@redhat.com>
Date: Thu, 20 Feb 2025 07:21:23 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] intel_idle: introduce 'no_native' module parameter
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Len Brown <lenb@kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Prarit Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250128141139.2033088-1-darcari@redhat.com>
 <20250213160741.445351-1-darcari@redhat.com>
 <CAJZ5v0gUfp+ueLMr1arwgK0r3WAQmfbb7YB54oZP-ySkD0q6YQ@mail.gmail.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <CAJZ5v0gUfp+ueLMr1arwgK0r3WAQmfbb7YB54oZP-ySkD0q6YQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Rafael,

On 2/19/25 4:27 PM, Rafael J. Wysocki wrote:
> On Thu, Feb 13, 2025 at 5:07 PM David Arcari <darcari@redhat.com> wrote:
>>
>> Since commit 18734958e9bf ("intel_idle: Use ACPI _CST for processor models
>> without C-state tables") the intel_idle driver has had the ability to use
>> the ACPI _CST to populate C-states when the processor model is not
>> recognized. However, even when the processor model is recognized (native
>> mode) there are cases where it is useful to make the driver ignore the per
>> cpu idle states in lieu of ACPI C-states (such as specific application
>> performance). Add the 'no_native' module parameter to provide this
>> functionality.
>>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Cc: Len Brown <lenb@kernel.org>
>> Cc: David Arcari <darcari@redhat.com>
>> Cc: Artem Bityutskiy <dedekind1@gmail.com>
>> Cc: Prarit Bhargava <prarit@redhat.com>
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: David Arcari <darcari@redhat.com>
>> ---
>> v4: fix !CONFIG_ACPI_PROCESSOR_CSTATE compilation issue
>> v3: more documentation cleanup
>> v2: renamed parameter, cleaned up documentation
>>
>> Documentation/admin-guide/pm/intel_idle.rst | 18 +++++++++++++-----
>>   drivers/idle/intel_idle.c                   | 16 ++++++++++++++++
>>   2 files changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/pm/intel_idle.rst b/Documentation/admin-guide/pm/intel_idle.rst
>> index 39bd6ecce7de..5940528146eb 100644
>> --- a/Documentation/admin-guide/pm/intel_idle.rst
>> +++ b/Documentation/admin-guide/pm/intel_idle.rst
>> @@ -192,11 +192,19 @@ even if they have been enumerated (see :ref:`cpu-pm-qos` in
>>   Documentation/admin-guide/pm/cpuidle.rst).
>>   Setting ``max_cstate`` to 0 causes the ``intel_idle`` initialization to fail.
>>
>> -The ``no_acpi`` and ``use_acpi`` module parameters (recognized by ``intel_idle``
>> -if the kernel has been configured with ACPI support) can be set to make the
>> -driver ignore the system's ACPI tables entirely or use them for all of the
>> -recognized processor models, respectively (they both are unset by default and
>> -``use_acpi`` has no effect if ``no_acpi`` is set).
>> +The ``no_acpi``, ``use_acpi`` and ``no_native`` module parameters are
>> +recognized by ``intel_idle`` if the kernel has been configured with ACPI
>> +support.  In the case that ACPI is not configured these flags have no impact
>> +on functionality.
>> +
>> +``no_acpi`` - Do not use ACPI at all.  Only native mode is available, no
>> +ACPI mode.
>> +
>> +``use_acpi`` - No-op in ACPI mode, the driver will consult ACPI tables for
>> +C-states on/off status in native mode.
>> +
>> +``no_native`` - Work only in ACPI mode, no native mode available (ignore
>> +all custom tables).
>>
>>   The value of the ``states_off`` module parameter (0 by default) represents a
>>   list of idle states to be disabled by default in the form of a bitmask.
>> diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
>> index 118fe1d37c22..b0be5ef43ffc 100644
>> --- a/drivers/idle/intel_idle.c
>> +++ b/drivers/idle/intel_idle.c
>> @@ -1695,6 +1695,10 @@ static bool force_use_acpi __read_mostly; /* No effect if no_acpi is set. */
>>   module_param_named(use_acpi, force_use_acpi, bool, 0444);
>>   MODULE_PARM_DESC(use_acpi, "Use ACPI _CST for building the idle states list");
>>
>> +static bool no_native __read_mostly; /* No effect if no_acpi is set. */
>> +module_param_named(no_native, no_native, bool, 0444);
>> +MODULE_PARM_DESC(no_native, "Ignore cpu specific (native) idle states in lieu of ACPI idle states");
>> +
>>   static struct acpi_processor_power acpi_state_table __initdata;
>>
>>   /**
>> @@ -1834,6 +1838,11 @@ static bool __init intel_idle_off_by_default(unsigned int flags, u32 mwait_hint)
>>          }
>>          return true;
>>   }
>> +
>> +static inline bool ignore_native(void)
>> +{
>> +       return no_native & !no_acpi;
>> +}
>>   #else /* !CONFIG_ACPI_PROCESSOR_CSTATE */
>>   #define force_use_acpi (false)
>>
>> @@ -1843,6 +1852,7 @@ static inline bool intel_idle_off_by_default(unsigned int flags, u32 mwait_hint)
>>   {
>>          return false;
>>   }
>> +static inline bool ignore_native(void) { return false; }
>>   #endif /* !CONFIG_ACPI_PROCESSOR_CSTATE */
>>
>>   /**
>> @@ -2328,6 +2338,12 @@ static int __init intel_idle_init(void)
>>          pr_debug("MWAIT substates: 0x%x\n", mwait_substates);
>>
>>          icpu = (const struct idle_cpu *)id->driver_data;
>> +       if (ignore_native()) {
>> +               if (icpu) {
>> +                       pr_debug("ignoring native cpu idle states\n");
>> +                       icpu = NULL;
>> +               }
>> +       }
> 
> Why not
> 
> +       if (icpu && ignore_native()) {
> +              pr_debug("disregarding built-in CPU idle states table\n");
> +              icpu = NULL;
> +       }

That's cleaner.  I'll submit a v5 shortly.

Should the pr_debug be a pr_info?  I've waffled on this, but think that 
pr_info is probably a good idea.  Or do you prefer pr_debug?

Thanks,
-DA

> 
>>          if (icpu) {
>>                  if (icpu->state_table)
>>                          cpuidle_state_table = icpu->state_table;
>> --
> 

