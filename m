Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DyURxBQS"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF79DB
	for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 02:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702290298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EkHNWKGI03k4jt/36VeYdeQHQ4kAe1Ed9JP4ATBzPOI=;
	b=DyURxBQS9jSq7muYzoM+xjzjH2y7FRmTDBcAaFP90ImTZ6z1SQe14kHH0R8k5P+YhUFPH5
	XGe9kPYeaS8ZJb7d+QoOw5HCAiDOrjKt/RoecqLYIda8h3mHtDX/iI0jwScuiFaEoX3KvR
	GZ+hfYMRI0Gwut0EPmvxfyx26Lco/S4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-PjK75eTIMcS8PFyJwl_lHg-1; Mon, 11 Dec 2023 05:24:57 -0500
X-MC-Unique: PjK75eTIMcS8PFyJwl_lHg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a1d72320a33so252518866b.2
        for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 02:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702290296; x=1702895096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkHNWKGI03k4jt/36VeYdeQHQ4kAe1Ed9JP4ATBzPOI=;
        b=vnSLW3lDfNZ4jNs7YzVXUO4D3PxKx3bIUtmSWgsLq46EzTlb2haySeDuUKy3YewsNj
         36oPTfDDC4uWv8Eyxx28pZ63HuqWdU2Jnrr3fIgU15XpxZOTjeE5wMmrHryhrADa3/bw
         Gr0HlmN6GNEfr82U+g9RjTauqlGqRCxZ9UqphlTrbrYSpgYS+IAF17iVk1a4v/oANecb
         SVhZU98Uqk1UsEg8q7IQIA+bVSdHyDqeG7F5M1L+rOIz5PLK/YqlEBVJ2kppmt9Ws76K
         Ar7YnB/ZuPffUdE0xlL9QjemDZdP1zqEhtIUPFZRG60iy6wFTSU+Jv8RBT3jCotLKI4E
         bFbQ==
X-Gm-Message-State: AOJu0YwqSD5YcC4PZlhayKXnB+AZ3s4XrPAZip5K+bOrw0NZZlQbOAtl
	tCbXMAaJRYGWWMRmo7CpN8O/WmPweASN7dCBLr+AkFDQHYewiqyUWeoObDVMFn9AmLgmukjmGeE
	blvOZ8Fp0Dlv5g2kPTd/i
X-Received: by 2002:a17:907:968c:b0:a1b:70fe:e896 with SMTP id hd12-20020a170907968c00b00a1b70fee896mr2295359ejc.130.1702290296344;
        Mon, 11 Dec 2023 02:24:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbHvDvDfb1Na+EoFufMVnvnALvsHRom59hQf/K126GVY985lax337NZg5MQOJhwcifefHmYw==
X-Received: by 2002:a17:907:968c:b0:a1b:70fe:e896 with SMTP id hd12-20020a170907968c00b00a1b70fee896mr2295346ejc.130.1702290296030;
        Mon, 11 Dec 2023 02:24:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id un7-20020a170907cb8700b009fc42f37970sm4634457ejc.171.2023.12.11.02.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 02:24:55 -0800 (PST)
Message-ID: <29bc74c3-b73a-4a5a-abca-3999e70fe71f@redhat.com>
Date: Mon, 11 Dec 2023 11:24:54 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] platform/x86: wmi: Cleanup obsolete features
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com, corbet@lwn.net
Cc: Dell.Client.Kernel@dell.com, linux-doc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231210202443.646427-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231210202443.646427-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/10/23 21:24, Armin Wolf wrote:
> This patch series removes three features deemed obsolete:
> - the debug_dump_wdg module param:
>   - suffers from garbled output due to pr_cont()
>   - functionality is better provided by "fwts wmi"
> - the debug_event module param:
>   - pr_cont() usage
>   - uses the deprecated GUID-based API
>   - largely replaced by the ACPI netlink interface
> - ioctl interface
>   - used only by a single driver, no adoption otherwise
>   - numerous design issues
> 
> Since the ioctl interface is actually used by userspace programs,
> the only user (the dell-smbios-wmi driver) was modified to implement
> the necessary pieces itself so that no regressions are expected.
> 
> The series depends on
> commit cbf54f37600e ("platform/x86: wmi: Skip blocks with zero instances"),
> which is currently in the "fixes" tree.
> 
> All patches where tested on a Dell Inspiron 3505 and work without
> issues.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans







> Changes since v1:
> - add Reviewed-by to patches 1, 2 and 5
> - drop patch adding the driver development guide
> - rework error handling in dell-smbios-wmi
> 
> Armin Wolf (5):
>   platform/x86: wmi: Remove debug_dump_wdg module param
>   platform/x86: wmi: Remove debug_event module param
>   platform/x86: dell-smbios-wmi: Use devm_get_free_pages()
>   platform/x86: dell-smbios-wmi: Stop using WMI chardev
>   platform/x86: wmi: Remove chardev interface
> 
>  drivers/platform/x86/dell/dell-smbios-wmi.c | 173 ++++++++----
>  drivers/platform/x86/wmi.c                  | 285 +-------------------
>  include/linux/wmi.h                         |   8 -
>  3 files changed, 132 insertions(+), 334 deletions(-)
> 
> --
> 2.39.2
> 

