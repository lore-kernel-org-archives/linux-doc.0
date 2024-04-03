Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5153C1482FA
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712151271; cv=none; b=Ws0Wb2c3rT5mheeDK6ZKHTrCSqbY05iw15oPXfIrXlZMnFGYRbPRMdnf+rJLEoHjRxQbcSoi07ayZDu+jfD5r0Hq/5/wGXPxmILOgwiI7t55s5TBHkMmm6jXs7us2hAX3GuDGz/A6BaxiyVFvEzSelpgP7WXUPiV5mViubIXklU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712151271; c=relaxed/simple;
	bh=d0DirP2/DcnMHmap5JRHS10akoeyY4HwoPDoR/NLxSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfroIhVhsCCpplIRULwHIa4vkatVC5gcJTOscz4oo1ES4mop3j+h1K+Vp7E8TnQ4bhF0/gYS5ei17/Grv6KB1FzQhFY2+r0E3kGc8vAsDGwyFGo3UQC2a3MiWfqYyn9pvl+MjevDfEXkr+Ytzl6aLeFilurkilc4rNKNym/M+jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IA1urE1s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IA1urE1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712151269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZF+AJqNgdEEhHyUGebHGFGETeFDomSQcf3CdIhYx3HE=;
	b=IA1urE1sTEPE30wlWwj/YFj7m6qIgDgXOJEPtcc6iQ7zPELoLOy6mPj8R3H7a3y4XQl+el
	L7yCj6WcAqfySLiTaBtiZVBsHBfsKt5PVoAb5pFxZAd66bJzy0ik6lBgLgKsb2xK+tFMzy
	oGdj8trv5hHYfhr8PSbkqN0wkaIbaFw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-_tjItBmwO7mKIjLPhRQD0g-1; Wed, 03 Apr 2024 09:34:25 -0400
X-MC-Unique: _tjItBmwO7mKIjLPhRQD0g-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4140225e68aso26393115e9.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 06:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712151264; x=1712756064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF+AJqNgdEEhHyUGebHGFGETeFDomSQcf3CdIhYx3HE=;
        b=ZdymC4i+Yu3gIHuBruCk4+0zWWZ/ZBjO/Gb3PnnKzW7jgwRaqzZQJvdpIE1pI+VYqT
         zgacBygu/TEHSRHqzFwEetLiMO3B0TAT6oDFApHngpU0dxMKF4VGPA1ArLc1oWMhKjK1
         MA9zCAoyoduV4cgtZF9SBwG0SLJWF7UPBiHSQIlwebuKdsEJP10wEN8A4cfKjbtIJHZM
         it9SgY5qeSdJFpFhB3XGK58tc2fe93s0mARg0cDKDo8UHXqz00FSVaopbphf/oobuCrV
         ESrChGcIw7AXSG8RC9twAnPEy1/UybkxRlYC92XBO9SHWDa3XRqui0G1HTq2MsH4W5mz
         iF5w==
X-Forwarded-Encrypted: i=1; AJvYcCUZHS7ps82eKdxBTp8cpKphAgClOd/fVMOMpYejgMZ4MJToYk6kUsDdvnkhmIyOsGJyPrsLlp4rfDo13eceSw7R6kBjyyaudTVO
X-Gm-Message-State: AOJu0Yzlp/u/4Zs2IGWCiS3u5XHGzkmS7+hl7e1420r5Blv0kojEeobV
	0aaBOG82XHbEHqQJoH9agGDkFFdSGdaIWNmmnGl/rTBnEKd2Mll7PWn0EghFmtIE5nZ4MCX0GBg
	PsWB/WwjXSssldoGQ6dBNdGmpK6vcPsXKO+guted0LzNsekLypaD8tG8X
X-Received: by 2002:a05:600c:35d6:b0:415:46be:6239 with SMTP id r22-20020a05600c35d600b0041546be6239mr10742073wmq.36.1712151264764;
        Wed, 03 Apr 2024 06:34:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElhlHqGlXgrKBRjpBu+aCPba7HI3pIkryMbfYOmjzU/p76YAySJkx1x/cXO6NJMk8FLvGZ3g==
X-Received: by 2002:a05:600c:35d6:b0:415:46be:6239 with SMTP id r22-20020a05600c35d600b0041546be6239mr10742054wmq.36.1712151264329;
        Wed, 03 Apr 2024 06:34:24 -0700 (PDT)
Received: from [192.168.9.34] (net-2-34-25-239.cust.vodafonedsl.it. [2.34.25.239])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b004148c3685ffsm21867330wmq.3.2024.04.03.06.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 06:34:23 -0700 (PDT)
Message-ID: <64c1685a-b544-408e-97e4-8c3cff6aca6c@redhat.com>
Date: Wed, 3 Apr 2024 15:34:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fpga: region: add owner module and take its refcount
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Tull <atull@opensource.altera.com>, linux-fpga@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240327160022.202934-1-marpagan@redhat.com>
 <Zgp/jNst2yuXEbpU@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <Zgp/jNst2yuXEbpU@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024-04-01 11:34, Xu Yilun wrote:
> On Wed, Mar 27, 2024 at 05:00:20PM +0100, Marco Pagani wrote:
>> The current implementation of the fpga region assumes that the low-level
>> module registers a driver for the parent device and uses its owner pointer
>> to take the module's refcount. This approach is problematic since it can
>> lead to a null pointer dereference while attempting to get the region
>> during programming if the parent device does not have a driver.
>>
>> To address this problem, add a module owner pointer to the fpga_region
>> struct and use it to take the module's refcount. Modify the functions for
>> registering a region to take an additional owner module parameter and
>> rename them to avoid conflicts. Use the old function names for helper
>> macros that automatically set the module that registers the region as the
>> owner. This ensures compatibility with existing low-level control modules
>> and reduces the chances of registering a region without setting the owner.
>>
>> Also, update the documentation to keep it consistent with the new interface
>> for registering an fpga region.
>>
>> Other changes: unlock the mutex before calling put_device() in
>> fpga_region_put() to avoid potential use after release issues.
> 
> Please try not to mix different changes in one patch, especially for
> a "bug fix" as you said.

You are right. I'll split out the change and eventually send it as a
separate patch.

> And I do have concern about the fix, see below.
> 
> [...]
> 
>> @@ -53,7 +53,7 @@ static struct fpga_region *fpga_region_get(struct fpga_region *region)
>>  	}
>>  
>>  	get_device(dev);
>> -	if (!try_module_get(dev->parent->driver->owner)) {
>> +	if (!try_module_get(region->br_owner)) {
>>  		put_device(dev);
>>  		mutex_unlock(&region->mutex);
>>  		return ERR_PTR(-ENODEV);
>> @@ -75,9 +75,9 @@ static void fpga_region_put(struct fpga_region *region)
>>  
>>  	dev_dbg(dev, "put\n");
>>  
>> -	module_put(dev->parent->driver->owner);
>> -	put_device(dev);
>> +	module_put(region->br_owner);
>>  	mutex_unlock(&region->mutex);
> 
> If there is concern the region would be freed after put_device(), then
> why still keep the sequence in fpga_region_get()?

Ouch, sorry, I forgot to make the change also in fpga_region_get().

> And is it possible region is freed before get_device() in
> fpga_region_get()?

If the user follows the usual pattern (i.e., waiting for
fpga_region_program_fpga() to complete before calling
fpga_region_unregister()) there should be no problem. However, I think
releasing the device before unlocking the mutex contained in the context
associated with the device makes the code brittle and more prone to
problems.

> Or we should clearly document how/when to use these functions?
 
I think it is not necessary to change the documentation since the
in-kernel programming API will not be affected by the change.

Thanks,
Marco

