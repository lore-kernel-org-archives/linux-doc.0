Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ABC78B47
	for <linux-doc@vger.kernel.org>; Mon,  4 Mar 2024 22:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709591229; cv=none; b=WdFFUC/aEw16NkFWEbFmX13u/zXt2+N+GtekP1cJr/2S2GiilDo1WO0E0Bajqp2PfAaaqV5jtE2aU4YrKyrW1zO+KbOCMDR4TJKwTH0JObavL4gjhzhBJEQYruzADEUiJMHSO5zJ1yrru0+k8udGrP1lYtOpjDH+LQfvV+/kyvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709591229; c=relaxed/simple;
	bh=1atHwK3n0oMhpG7HrhejVE4lgE2utbLsrDZmOQLvDGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUVpGiieL99PY1LSYNav4+n+yj/tf/CdGgQcdrd+tPjwWCH+wbOidcLuPtPPaQ2b0uzRZrcMZ0JsT+g9jBOscZ2UPHfSKlPtH2fINgsFE0ZIixSHieGlFLZ2TL0geARcVloGtfbnVo5+40hPN1A9LWlJannB8rkAIPOgyN+TWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B4DgjQFU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B4DgjQFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709591226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0I9Tu/Eo7kHXmD42e5VjWB2DaTI5c0rTAvGhSO84y0I=;
	b=B4DgjQFUNFOgIVqEqz9359Cd47HEl5psgKBcy7aLg8sRlDwCOBfy7B2vUlrtayRjjgba8Z
	WwLac+nisJsdxTaXwtqDczKwt3ZInXnbaQaD4IYcRCFhDmHRnhFzZ576f9D9hMOJp1rKNg
	I5oKgITA7JjWtbsaJ0/53py/o/SAfzQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-tzIVYV1dM2Ku1j_2kGzTrw-1; Mon, 04 Mar 2024 17:27:05 -0500
X-MC-Unique: tzIVYV1dM2Ku1j_2kGzTrw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-68f74aff2b0so53789786d6.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Mar 2024 14:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709591224; x=1710196024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0I9Tu/Eo7kHXmD42e5VjWB2DaTI5c0rTAvGhSO84y0I=;
        b=iHVZAjXacfwSUQkHVh3PbsJkp6kJvR/T8rMhX3jWlsxL/9oo63fg8M6i7h9rCksZxX
         PUf6MAeMhyXnJ3n/igdwLkFK+t31ZOEFWOFBO28S9WDXZCYLb0IqOVUFJuzKgqBT0Egz
         aYuGZlYNwfkho56VLGt+AcB0RMxbir36uqnmXDwmvcvs0aJ8l1pc12Yma9tUU3dW5MJm
         d12X1f5JIG+Fs+y/KG7u4iqLFy53GFUzOQOjnAGZeKewBnZyTlqXPLNOP4rAzbJ79Llj
         cMRP8bFCiwXFZxhhLmpJyJNfJ86MOyLu8ZEyF4O7Pc0pGr+94X5eIy9CmqEdMaDqeVJn
         IrZA==
X-Forwarded-Encrypted: i=1; AJvYcCX7tn8f9o2DAwLVorLpds7u38ljF+KY2Wzsnv3M3ary3/VODg8VDQdEvsXV5ZssoFmggQiLUPkJbLY1pW/Hl2bF+uQHDt2VKcGD
X-Gm-Message-State: AOJu0Yx0wsfowBHBvavTQ2HkawIADCX+2feo/CiKBJn4HSgLgGfOajTN
	fa7gANglx/sHC5kHRBaIL06OpHalZ2pUIB+goaa2g70Mzpwr0KtwRQTJ4exm/5Hv0FGis4smuZ+
	+JfUb/oVeckp1UrHmsy0fjCT8Wp8vjbSSJsxnFhGA+MHOYm3uM5S7VRCr
X-Received: by 2002:a05:6214:2d14:b0:68f:e92a:6c2 with SMTP id mz20-20020a0562142d1400b0068fe92a06c2mr212587qvb.31.1709591224608;
        Mon, 04 Mar 2024 14:27:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzLXcaGyAxnW4JJ7iJmtLjFnsvfT/z6F3AeNSlZin/oBAZwg0/RmYDpbOW0lqD2knN+mdzEA==
X-Received: by 2002:a05:6214:2d14:b0:68f:e92a:6c2 with SMTP id mz20-20020a0562142d1400b0068fe92a06c2mr212577qvb.31.1709591224336;
        Mon, 04 Mar 2024 14:27:04 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-28-168.cust.vodafonedsl.it. [2.34.28.168])
        by smtp.gmail.com with ESMTPSA id pf10-20020a056214498a00b0068f914ac80bsm5596173qvb.50.2024.03.04.14.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 14:27:04 -0800 (PST)
Message-ID: <e4c54951-0e7d-4307-9266-2d6b984c967a@redhat.com>
Date: Mon, 4 Mar 2024 23:26:58 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 1/1] fpga: add an owner and use it to take the
 low-level module's refcount
Content-Language: en-US
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Tull <atull@opensource.altera.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org
References: <Zbh7iO9wlm9ekzB7@yilunxu-OptiPlex-7050>
 <0720eb91-72f9-4781-8558-8a1b0a3691c2@redhat.com>
 <Zb8dd9af0Ru/fzGi@yilunxu-OptiPlex-7050>
 <4aaa131a-4b64-4b86-9548-68aef63c87b3@redhat.com>
 <ZdHWaeU+/On6LmHX@yilunxu-OptiPlex-7050>
 <9a9d4018-fd65-49be-9e0a-1eecc9cbf15d@redhat.com>
 <ZdYKnZxdTCvu5THG@yilunxu-OptiPlex-7050>
 <ae3cd81b-82af-4977-91d7-fa809c6fc45a@redhat.com>
 <Zd7cff43ffbJOGNY@yilunxu-OptiPlex-7050>
 <08ba8bce-0ebf-4c8f-952d-a6665dc7fdf9@redhat.com>
 <ZeXRWDGvd8P7KhxJ@yilunxu-OptiPlex-7050>
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <ZeXRWDGvd8P7KhxJ@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024-03-04 14:49, Xu Yilun wrote:
>> Just to be sure that I understood correctly, you want to split the
>> changes into two patches, like:
>>
>> a) add module owner to the manager struct and take it in
>> __fpga_mgr_get(); move put_device() from __fpga_mgr_get() to
>> fpga_mgr_get() and of_fpga_mgr_get().
>>
>> b) add the mutex and the unregistered flag for protection against races.
>>
>> So that (b) can be reverted if try_module_get_safe() will be accepted?
> 
> Yes, that's what I mean.
> 

On second thought, I would prefer to send only the patches (a) for the
manager, bridge, and region for the moment. As you said, the chances of
having a race are slim (no crash has ever been reported to date). So,
after (a), I think it is worth focusing first on try_module_get_safe()
since it could also be useful for other subsystems. The (b) patches
could always be applied later if try_module_get_safe() is not accepted.
Thanks,
Marco

