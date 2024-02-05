Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B70647F52
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155263; cv=none; b=YVVYhFtE6WiAizxGFFSR5pxqBLEXNoUbuvWFotOdxOQKJOfMVXj13PybyMX5F/x3Kpy0XOLw299/L8DVYzgivwYXp0tBV2X8QLSe4WLgtj9WNQtUMy0AllwW4p91zJoHT2X2rbCv/0eCIIzNC68pxTHJVrq9JzTzSPE6/GoYB98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155263; c=relaxed/simple;
	bh=YRr9xmrG/Qu7lzbwxy8pFwenZuuqtN5IUwKv14LlfiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siWDb64SsX+oWO+pnkppkbiISlx0fuTpp33u/YSj5jH90ETw98OaYh+B+iA36Biq5RbA8FB6m99CiqjTFXXZzWI885zwfV3mHcn6BdIXv+BKN1gfCB4tZ7rorF/1fyL7m+mu3LEB4xJPAi1LNMb85eopco8japt88JfgQCqDaJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FcfFLe4a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FcfFLe4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707155260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=brbw2jGOAYpq03eoPzMnBwz2rIsnyFqQ7SU3UeWuQGc=;
	b=FcfFLe4aZNaNUaQUa4h/i57waFyzmctaLLUuTUYudy6wMyQnhEZPynct/qpx13B4Y7thA4
	avDnK/DBaAZcYNwGEks1MH1aZTX8gbJMO2oPCCbehDh+YtJcED+qwSbPp5Sn9GboPe729d
	OJ0/LlSHAb0AeKKRDxii6YFONEJq7h0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-N4lEZDkrP5i6l00RdDaTVg-1; Mon, 05 Feb 2024 12:47:38 -0500
X-MC-Unique: N4lEZDkrP5i6l00RdDaTVg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-68086d6c953so80224616d6.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Feb 2024 09:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155258; x=1707760058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brbw2jGOAYpq03eoPzMnBwz2rIsnyFqQ7SU3UeWuQGc=;
        b=uL/vc+nqpWcpuoWwwGGdUMRZBOUGvfuOUsphPVWxKFoWWdh3CP0cLH9K7O4FfR3YSc
         h/dnptd1gJT9YWOg83dTaz0W0aI4wEXxdjLcLc2VYnm9XNSCHVhv2hN1SIT46AUN8oNE
         5JfZSJqx/jkTV3Tou7w1QCxyf7Tf0YRaMHoecjIPFRebYcWd/d+pHwSj5NspC/gkJJmE
         Rdavlq0zVqImU7I8NbouDABtczIZreCD+HnKadoeuLPJyeyXxpujFqbhBhWFfLz3IoZq
         IEHYoNs4T3828VKtAVCwOIttVLC4TO8nHfCIOPiYroeNs9goccRds1ZZMy5lu3h52nSX
         ko2w==
X-Gm-Message-State: AOJu0YznHIFbuV3ADDzdMGt2Dji5ALdrC2Z8adlcpecC6Tb8jTZ9fPnp
	FuiRMB3SYR6QZlgPm20N+iscyWzFxb86ouvNx8MyzPt8mLlei5UrqJ1nM+3Ao7k8+9bufLZYex7
	OPkLZ+FpMcZDbH6JQ7FcqRejVegJdLH3qhc7FIhcXICnQozWRryZOQk2S
X-Received: by 2002:a05:6214:29e4:b0:68c:3f60:f09a with SMTP id jv4-20020a05621429e400b0068c3f60f09amr72459qvb.47.1707155258040;
        Mon, 05 Feb 2024 09:47:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmf1krkk1UHjWg8vTRkpvKFSEejP5Vj6buHEmjj3zrC17At+WE0pDOH8XHR02kcVwsCGZiHQ==
X-Received: by 2002:a05:6214:29e4:b0:68c:3f60:f09a with SMTP id jv4-20020a05621429e400b0068c3f60f09amr72434qvb.47.1707155257710;
        Mon, 05 Feb 2024 09:47:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWkIoJ5qhW9XD5w+SJcAQkDhXheEHBHkU0/N3GUJGctO4sj9hMBEsMPEZ8/gQJMdbGzImerb6XpuGuMc0NwEuLOReSKbRvUYaL1ZQqxovBPyE97rb7pOyxHoArlI1bHnf9s7tekPkyLAl0qposTKLQ+PgH4YWShusKRZVKnbaZclgTdWqxAQtWkilHYdDYZ5xV58ituZRLVqSLzx3mjqVPO3Ei/JBvTl5keLafivnGQbp444RTxIgQfzlOjDtNO0oKjkbp2PGVabkuaUQJwso2ogffgdeN5ublgxHG63XEKwEHBWhHq4+/CX/2Of3Efjrhq/Jt+7MriqnsA+iee8ZppVnNf
Received: from [192.168.9.34] (net-2-34-24-75.cust.vodafonedsl.it. [2.34.24.75])
        by smtp.gmail.com with ESMTPSA id nd23-20020a056214421700b0068ca9ea78cbsm188027qvb.21.2024.02.05.09.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 09:47:37 -0800 (PST)
Message-ID: <4aaa131a-4b64-4b86-9548-68aef63c87b3@redhat.com>
Date: Mon, 5 Feb 2024 18:47:34 +0100
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
References: <20240111160242.149265-1-marpagan@redhat.com>
 <20240111160242.149265-2-marpagan@redhat.com>
 <Zbh7iO9wlm9ekzB7@yilunxu-OptiPlex-7050>
 <0720eb91-72f9-4781-8558-8a1b0a3691c2@redhat.com>
 <Zb8dd9af0Ru/fzGi@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <Zb8dd9af0Ru/fzGi@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024-02-04 06:15, Xu Yilun wrote:
> On Fri, Feb 02, 2024 at 06:44:01PM +0100, Marco Pagani wrote:
>>
>>
>> On 2024-01-30 05:31, Xu Yilun wrote:
>>>> +#define fpga_mgr_register_full(parent, info) \
>>>> +	__fpga_mgr_register_full(parent, info, THIS_MODULE)
>>>>  struct fpga_manager *
>>>> -fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
>>>> +__fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
>>>> +			 struct module *owner);
>>>>  
>>>> +#define fpga_mgr_register(parent, name, mops, priv) \
>>>> +	__fpga_mgr_register(parent, name, mops, priv, THIS_MODULE)
>>>>  struct fpga_manager *
>>>> -fpga_mgr_register(struct device *parent, const char *name,
>>>> -		  const struct fpga_manager_ops *mops, void *priv);
>>>> +__fpga_mgr_register(struct device *parent, const char *name,
>>>> +		    const struct fpga_manager_ops *mops, void *priv, struct module *owner);
>>>> +
>>>>  void fpga_mgr_unregister(struct fpga_manager *mgr);
>>>>  
>>>> +#define devm_fpga_mgr_register_full(parent, info) \
>>>> +	__devm_fpga_mgr_register_full(parent, info, THIS_MODULE)
>>>>  struct fpga_manager *
>>>> -devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
>>>> +__devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
>>>> +			      struct module *owner);
>>>
>>> Add a line here. I can do it myself if you agree.
>>
>> Sure, that is fine by me. I also spotted a typo in the commit log body
>> (in taken -> is taken). Do you want me to send a v6, or do you prefer
>> to fix that in place?
> 
> No need, I can fix it.
> 
>>
>>>
>>> There is still a RFC prefix for this patch. Are you ready to get it merged?
>>> If yes, Acked-by: Xu Yilun <yilun.xu@intel.com>
>>
>> I'm ready for the patch to be merged. However, I recently sent an RFC
>> to propose a safer implementation of try_module_get() that would
>> simplify the code and may also benefit other subsystems. What do you
>> think?
>>
>> https://lore.kernel.org/linux-modules/20240130193614.49772-1-marpagan@redhat.com/
> 
> I suggest take your fix to linux-fpga/for-next now. If your try_module_get()
> proposal is applied before the end of this cycle, we could re-evaluate
> this patch.

That's fine by me.

Thanks,
Marco

