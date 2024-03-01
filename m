Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC95770AD7
	for <linux-doc@vger.kernel.org>; Fri,  1 Mar 2024 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709310572; cv=none; b=ORLp5TnuYExYfhcGLKpuXt6uasWpkxE8ScBqtMbyOJkLb3CR/iXJOTq6UQogSwMm4C6qLHnz1JpcpTD8M1bych2r2RfSFljaJmMjZTyBN4UGogDiOPy6ZVXjayzi/fo+gE8QLY1fccl73os9mc/qc3lw6hHgjHjNbpmnGUh9grk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709310572; c=relaxed/simple;
	bh=4ENR5LUp28xMXehmU/AKJ8VrJmmzhvBxZei16elzGu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dy1RHgcum+C40TJ+MM/OS2+PRZ2v/SzA/0T6+Vw82G7xS+0fzlYb9S48frEuT0zWFYUB9viJT/ikM/MKwRYuuDvfRNe86zdYpdagmZ4eIPZx1oZdu/jaoR1NNhKMSjj0938F4AzKxsYs1JEBeLyGowfPHIKMsR0Od4lelhtjiUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CleJIN2x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CleJIN2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709310569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QNe7wQkN/o3BCAKNQu3U4+jdytvs3hfcAhbPOfxPT0w=;
	b=CleJIN2xhp19wvws37NpfiIBpjjUABusiCi/8tLU1Dt25RkcdTq3fDdgmrLFof5+odsT1/
	YVrvdbcvcyoAd1xWHIu7Oo/8c7R8EiZ0XSBBpqQmljnfkzrtuZbfHs7HWEe/bjhs9hxers
	/wJEN5vCVlTzlNnTS+teLRr28e38pNw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-YdpVu5-2NOCCUTbGwgx7tg-1; Fri, 01 Mar 2024 11:29:28 -0500
X-MC-Unique: YdpVu5-2NOCCUTbGwgx7tg-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c186c73ae3so2276706b6e.2
        for <linux-doc@vger.kernel.org>; Fri, 01 Mar 2024 08:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709310568; x=1709915368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNe7wQkN/o3BCAKNQu3U4+jdytvs3hfcAhbPOfxPT0w=;
        b=XP1Mu2CcZ487kmG65M04dR5/YS5w1tYBXUhufZv6oSLrOMZFLZGKzUIi5ectu5PcCX
         K+S+zn6dVjJ61tmzpJccfy5clKXhmA8YRAFMTNcSuYdkbHwdc00zHiu5xgeLMC8fTnlQ
         ygABmelAg7mhzbz08O49VJUHZyNL7u7NRaas7IfLa7i6uF046vwbOUlCW5KzojwozbHN
         nuyvfAqeiGUXknyw4IrKpySN3aqVSj4Ym6IdSxIcWcvbEFppq4V1ORCcsKxvYVNiIY7k
         3yh6gpTuLybkqkD++aNLeVhjXJtU4O13dqt8Q78DSaXmH1XNYjR75KX7css5mp5XS39g
         7vsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhAj0FnxNQsvn/suW11zGWiHf/6F+CEHOf4Iuuvok6IZS1LiGabGi+BM6F3wx005M5xPO6NB8xaEddLzICmvCzYa3P3m9tCBpx
X-Gm-Message-State: AOJu0YyWu0/5rbUNZsl0c2Ru0tk+PtP0WGEoeUj86m4OfuZYEy8ajWhG
	DuhlfxnDu54hwCJ+sw/ItyQceDyDOwDJKunlTGYbCVsILjGJgT9P/rZcVxzZfHL5BTq2DIZ0BcA
	xmFSM1+fRdpIaOkghH4piOwcDbgoWg5czRL+CnFqC2CjUH7vX6cRW0pkz
X-Received: by 2002:a05:6808:2124:b0:3c1:c250:96ee with SMTP id r36-20020a056808212400b003c1c25096eemr2651208oiw.2.1709310567905;
        Fri, 01 Mar 2024 08:29:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlTpfV8lDCDZU0jDCFb2TIQ4JuCOInMQ1C6p5i+3jWLtn6h3oIis54i4vBrQ/yhtLTAXXavg==
X-Received: by 2002:a05:6808:2124:b0:3c1:c250:96ee with SMTP id r36-20020a056808212400b003c1c25096eemr2651188oiw.2.1709310567520;
        Fri, 01 Mar 2024 08:29:27 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-30-118.cust.vodafonedsl.it. [2.34.30.118])
        by smtp.gmail.com with ESMTPSA id e12-20020ac84b4c000000b0042e69db4c1fsm1832196qts.39.2024.03.01.08.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 08:29:27 -0800 (PST)
Message-ID: <d4f5243c-696a-4d1d-94f4-0ecf42b6d7f0@redhat.com>
Date: Fri, 1 Mar 2024 17:29:24 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 1/1] fpga: add an owner and use it to take the
 low-level module's refcount
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
 <0c885ff2-44bc-4158-b5dd-3d7513cb2857@redhat.com>
 <ZeHwatupHVmC2N2+@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <ZeHwatupHVmC2N2+@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024-03-01 16:12, Xu Yilun wrote:
> On Thu, Feb 29, 2024 at 11:37:10AM +0100, Marco Pagani wrote:
>>
>> On 2024-02-28 08:10, Xu Yilun wrote:
>>> On Tue, Feb 27, 2024 at 12:49:06PM +0100, Marco Pagani wrote:
>>>>
>>>>
>>>> On 2024-02-21 15:37, Xu Yilun wrote:
>>>>> On Tue, Feb 20, 2024 at 12:11:26PM +0100, Marco Pagani wrote:
>>>>>>
>>>>>>
>>>>>> On 2024-02-18 11:05, Xu Yilun wrote:
>>>>>>> On Mon, Feb 05, 2024 at 06:47:34PM +0100, Marco Pagani wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2024-02-04 06:15, Xu Yilun wrote:
>>>>>>>>> On Fri, Feb 02, 2024 at 06:44:01PM +0100, Marco Pagani wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 2024-01-30 05:31, Xu Yilun wrote:
>>>>>>>>>>>> +#define fpga_mgr_register_full(parent, info) \
>>>>>>>>>>>> +	__fpga_mgr_register_full(parent, info, THIS_MODULE)
>>>>>>>>>>>>  struct fpga_manager *
>>>>>>>>>>>> -fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
>>>>>>>>>>>> +__fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
>>>>>>>>>>>> +			 struct module *owner);
>>>>>>>>>>>>  
>>>>>>>>>>>> +#define fpga_mgr_register(parent, name, mops, priv) \
>>>>>>>>>>>> +	__fpga_mgr_register(parent, name, mops, priv, THIS_MODULE)
>>>>>>>>>>>>  struct fpga_manager *
>>>>>>>>>>>> -fpga_mgr_register(struct device *parent, const char *name,
>>>>>>>>>>>> -		  const struct fpga_manager_ops *mops, void *priv);
>>>>>>>>>>>> +__fpga_mgr_register(struct device *parent, const char *name,
>>>>>>>>>>>> +		    const struct fpga_manager_ops *mops, void *priv, struct module *owner);
>>>>>>>>>>>> +
>>>>>>>>>>>>  void fpga_mgr_unregister(struct fpga_manager *mgr);
>>>>>>>>>>>>  
>>>>>>>>>>>> +#define devm_fpga_mgr_register_full(parent, info) \
>>>>>>>>>>>> +	__devm_fpga_mgr_register_full(parent, info, THIS_MODULE)
>>>>>>>>>>>>  struct fpga_manager *
>>>>>>>>>>>> -devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
>>>>>>>>>>>> +__devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
>>>>>>>>>>>> +			      struct module *owner);
>>>>>>>>>>>
>>>>>>>>>>> Add a line here. I can do it myself if you agree.
>>>>>>>>>>
>>>>>>>>>> Sure, that is fine by me. I also spotted a typo in the commit log body
>>>>>>>>>> (in taken -> is taken). Do you want me to send a v6, or do you prefer
>>>>>>>>>> to fix that in place?
>>>>>>>>>
>>>>>>>>> No need, I can fix it.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> There is still a RFC prefix for this patch. Are you ready to get it merged?
>>>>>>>>>>> If yes, Acked-by: Xu Yilun <yilun.xu@intel.com>
>>>>>>>>>>
>>>>>>>>>> I'm ready for the patch to be merged. However, I recently sent an RFC
>>>>>>>>>> to propose a safer implementation of try_module_get() that would
>>>>>>>>>> simplify the code and may also benefit other subsystems. What do you
>>>>>>>>>> think?
>>>>>>>>>>
>>>>>>>>>> https://lore.kernel.org/linux-modules/20240130193614.49772-1-marpagan@redhat.com/
>>>>>>>>>
>>>>>>>>> I suggest take your fix to linux-fpga/for-next now. If your try_module_get()
>>>>>>>>> proposal is applied before the end of this cycle, we could re-evaluate
>>>>>>>>> this patch.
>>>>>>>>
>>>>>>>> That's fine by me.
>>>>>>>
>>>>>>> Sorry, I still found issues about this solution.
>>>>>>>
>>>>>>> void fpga_mgr_unregister(struct fpga_manager *mgr)
>>>>>>> {
>>>>>>>         dev_info(&mgr->dev, "%s %s\n", __func__, mgr->name);
>>>>>>>
>>>>>>>         /*
>>>>>>>          * If the low level driver provides a method for putting fpga into
>>>>>>>          * a desired state upon unregister, do it.
>>>>>>>          */
>>>>>>>         fpga_mgr_fpga_remove(mgr);
>>>>>>>
>>>>>>>         mutex_lock(&mgr->mops_mutex);
>>>>>>>
>>>>>>>         mgr->mops = NULL;
>>>>>>>
>>>>>>>         mutex_unlock(&mgr->mops_mutex);
>>>>>>>
>>>>>>>         device_unregister(&mgr->dev);
>>>>>>> }
>>>>>>>
>>>>>>> Note that fpga_mgr_unregister() doesn't have to be called in module_exit().
>>>>>>> So if we do fpga_mgr_get() then fpga_mgr_unregister(), We finally had a
>>>>>>> fpga_manager dev without mops, this is not what the user want and cause
>>>>>>> problem when using this fpga_manager dev for other FPGA APIs.
>>>>>>
>>>>>> How about moving mgr->mops = NULL from fpga_mgr_unregister() to
>>>>>> class->dev_release()? In that way, mops will be set to NULL only when the
>>>>>> manager dev refcount reaches 0.
>>>>>
>>>>> I'm afraid it doesn't help.  The lifecycle of the module and the fpga
>>>>> mgr dev is different.
>>>>>
>>>>> We use mops = NULL to indicate module has been freed or will be freed in no
>>>>> time.  On the other hand mops != NULL means module is still there, so
>>>>> that try_module_get() could be safely called.  It is possible someone
>>>>> has got fpga mgr dev but not the module yet, at that time the module is
>>>>> unloaded, then try_module_get() triggers crash.
>>>>>
>>>>>>
>>>>>> If fpga_mgr_unregister() is called from module_exit(), we are sure that nobody
>>>>>> got the manager dev earlier using fpga_mgr_get(), or it would have bumped up
>>>>>
>>>>> No, someone may get the manager dev but not the module yet, and been
>>>>> scheduled out.
>>>>>
>>>>
>>>> You are right. Overall, it's a bad idea. How about then using an additional 
>>>> bool flag instead of "overloading" the mops pointer? Something like:
>>>>
>>>> get:
>>>> 	if (!mgr->owner_valid || !try_module_get(mgr->mops_owner))
>>>>
>>>> remove:
>>>> 	mgr->owner_valid = false;
>>>
>>> I'm not quite sure which function is actually mentioned by "remove".  I
>>> assume it should be fpga_mgr_unregister().
>>
>> Yes, I was referring to fpga_mgr_unregister().
>>
>>> IIUC this flag means no more reference to fpga mgr, but existing
>>> references are still valid.
>>
>> Yes.
>>
>>>
>>> It works for me. But the name of this flag could be reconsidered to
>>> avoid misunderstanding.  The owner is still valid (we still need to put
>>> the owner) but allows no more reference.  Maybe "owner_inactive"?
>>
>> Right, owner_valid might be misleading. How about removing any
>> reference to the owner module and name the flag unreg?
> 
> the full name "unregistered" is better.

That's fine by me.

> 
>>
>> __fpga_mgr_get:
>> 	if (mgr->unreg || !try_module_get(mgr->mops_owner))
>> 		mgr = ERR_PTR(-ENODEV);
>>
>> fpga_mgr_unregister:
>>  	mgr->unreg = true;
>>
>>> I still wanna this owner reference change been splitted, so that
>>> we could simply revert it when the try_module_get_safe() got accepted.
>>
>> I guess it may take some time to have try_module_get_safe() accepted.
>> What do you prefer to do with the bridge and the region in the
>> meantime?
> 
> This issue could happen in little chance. I actually don't have much
> preference, either way is good to me.
> 

Okay, I'll also send the patch for the region then.

Thanks,
Marco

