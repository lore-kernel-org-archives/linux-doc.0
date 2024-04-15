Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03204679E5
	for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713183603; cv=none; b=IekLnv7kstz4bjXoPgcIDoMxDuq2Gbfi7sPsOD24KtB/w01gRc8YPP5cIM85BJr9XjoPEzju+BRfEsAPiU4ZRUSNcnCo27jJPS4IqL03Qkcj7BFMkygPO/8EtmJoodMUbb2otXdRuyBbafmgsw9m6xdQx5MRqK803b2EC3RKBb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713183603; c=relaxed/simple;
	bh=DcyrUNeaJ8nAPF0RyX391Zb04wfUNEPZcwOEW2UTTCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXO60nz9sqmMPCkYIKAyeEQdDmwSBIQR85VZbFiKJNkDynfoH48+1JQIYNXupKGZdgW/8Kf45JYiop0veME6JaH87dXwoOQpggvtZQb3Bt26xK0EhhIQJ4kD79JOIvjuQJ0oDsooewhYYRSVTpCmv9yU5LGgiD1vAYxp8o7yaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iTDGrX8s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iTDGrX8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713183600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDQw6079hna9CEOsOlsyOrJetXoDSph8zEQlaRaMQu0=;
	b=iTDGrX8shlW0zFWUYT2kSPje1vWXJNUbEHWMTi87G6khXg3oECXz+B71+rbmOl048KQgiO
	M2ybuo6QsIuS+DXQDardRkyMMU2zK5Ekyh/ryLIs5dViyLcaUhY5baLhdMvqu60GepWSs0
	G97OyeydirjFz5Y7WrS0RPUYXZK31sY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-GVZ6gowONUC1DdQclwsmhw-1; Mon, 15 Apr 2024 08:19:58 -0400
X-MC-Unique: GVZ6gowONUC1DdQclwsmhw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78d7783bd4aso280443985a.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 05:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713183598; x=1713788398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDQw6079hna9CEOsOlsyOrJetXoDSph8zEQlaRaMQu0=;
        b=HMLgBhayZDVOk3czyYaU5RnQfMvxWRhJKNUlqTcuQtqjPWRNWSKqzPlenA3tdlA+aY
         VU9aqHzlIBu1mdN1o2n3WneIUhTiGclpdvrU0Nen8zx1HTAGTInN9TJaO32oHOVsGEaG
         fBAosoahkYhBT+KsSaLn1pkFETyMkHFYJS3afSEZHkWxp4Rm9hLC19tG4X/61qvIMo0N
         rryiVwO1OBEJaPO91F3hDlkL4kFfH6ibyNYjMEekr5x4Vxxld4alboRWRl++JkWxU092
         ZR+DcteNnCM9Le9W60RZkL/Q7KC9C9unbkzrLfdmDpBOqLPiSLUwG2xLLcyud10H3DAj
         0DZw==
X-Forwarded-Encrypted: i=1; AJvYcCX2QftNtrwASI/B7jrYJy7bYUtt9XR1eABHcvEU2oh2IMWTgc2FAKgn/d1r3g9j3i85sXvaW/Cy6EBuhb3iV5jQ10piYqbip6xu
X-Gm-Message-State: AOJu0Yw7TEkSHeGMbITaiF8WIU9gl4+Pt9v4YK2Qo8gfv36vXezSD+Ob
	6/lDO+rzvFaQ00kUrPqwasXly5+bzOcYtHB2eOnU16aNgjkDxmg6dJpszK6Y3l4Z9LTgttp74An
	mL1g2DWivSV7Hv83U51IFHHePLb2YeWVjsRw9TSpT0wkwE7IwY/p+TpZD
X-Received: by 2002:a05:620a:1649:b0:78e:bfdf:7186 with SMTP id c9-20020a05620a164900b0078ebfdf7186mr9789328qko.48.1713183597938;
        Mon, 15 Apr 2024 05:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzPxQkjmK6TPSajF2WEuVBaYH4aU4qzvZHPqTERmqD7BgD3ZV3P+H2fQaoPYI3sxBGLi1SiA==
X-Received: by 2002:a05:620a:1649:b0:78e:bfdf:7186 with SMTP id c9-20020a05620a164900b0078ebfdf7186mr9789306qko.48.1713183597635;
        Mon, 15 Apr 2024 05:19:57 -0700 (PDT)
Received: from [192.168.9.34] (net-2-34-28-196.cust.vodafonedsl.it. [2.34.28.196])
        by smtp.gmail.com with ESMTPSA id s7-20020a05620a080700b0078ec3aa9cc7sm5957738qks.25.2024.04.15.05.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 05:19:56 -0700 (PDT)
Message-ID: <669b8b55-df83-4c32-9c8f-41895db18b75@redhat.com>
Date: Mon, 15 Apr 2024 14:19:52 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] fpga: region: add owner module and take its refcount
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Tull <atull@opensource.altera.com>, Russ Weight
 <russ.weight@linux.dev>, linux-fpga@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240411144811.121500-1-marpagan@redhat.com>
 <ZhnviXAgnTdzUyV4@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <ZhnviXAgnTdzUyV4@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024-04-13 04:35, Xu Yilun wrote:
>>  /**
>> - * fpga_region_register_full - create and register an FPGA Region device
>> + * __fpga_region_register_full - create and register an FPGA Region device
>>   * @parent: device parent
>>   * @info: parameters for FPGA Region
>> + * @owner: owner module containing the get_bridges function
> 
> This is too specific and easily get unaligned if we add another
> callback. How about "module containing the region ops"?

I had some concerns about using the name "region ops" in the kernel-doc
comment since it was not supported by a struct definition nor referenced
in the documentation. However, since the name is now referred to in the
ops_owner pointer, making the change makes sense to me.

Thanks,
Marco

> 
>>   *
>>   * Return: struct fpga_region or ERR_PTR()
>>   */
>>  struct fpga_region *
>> -fpga_region_register_full(struct device *parent, const struct fpga_region_info *info)
>> +__fpga_region_register_full(struct device *parent, const struct fpga_region_info *info,
>> +			    struct module *owner)
>>  {
>>  	struct fpga_region *region;
>>  	int id, ret = 0;
>> @@ -213,6 +215,7 @@ fpga_region_register_full(struct device *parent, const struct fpga_region_info *
>>  	region->compat_id = info->compat_id;
>>  	region->priv = info->priv;
>>  	region->get_bridges = info->get_bridges;
>> +	region->ops_owner = owner;
>>  
>>  	mutex_init(&region->mutex);
>>  	INIT_LIST_HEAD(&region->bridge_list);
>> @@ -241,13 +244,14 @@ fpga_region_register_full(struct device *parent, const struct fpga_region_info *
>>  
>>  	return ERR_PTR(ret);
>>  }
>> -EXPORT_SYMBOL_GPL(fpga_region_register_full);
>> +EXPORT_SYMBOL_GPL(__fpga_region_register_full);
>>  
>>  /**
>> - * fpga_region_register - create and register an FPGA Region device
>> + * __fpga_region_register - create and register an FPGA Region device
>>   * @parent: device parent
>>   * @mgr: manager that programs this region
>>   * @get_bridges: optional function to get bridges to a list
>> + * @owner: owner module containing get_bridges function
> 
> ditto
> 
>>   *
>>   * This simple version of the register function should be sufficient for most users.
>>   * The fpga_region_register_full() function is available for users that need to
>> @@ -256,17 +260,17 @@ EXPORT_SYMBOL_GPL(fpga_region_register_full);
>>   * Return: struct fpga_region or ERR_PTR()
>>   */
>>  struct fpga_region *
>> -fpga_region_register(struct device *parent, struct fpga_manager *mgr,
>> -		     int (*get_bridges)(struct fpga_region *))
>> +__fpga_region_register(struct device *parent, struct fpga_manager *mgr,
>> +		       int (*get_bridges)(struct fpga_region *), struct module *owner)
>>  {
>>  	struct fpga_region_info info = { 0 };
>>  
>>  	info.mgr = mgr;
>>  	info.get_bridges = get_bridges;
>>  
>> -	return fpga_region_register_full(parent, &info);
>> +	return __fpga_region_register_full(parent, &info, owner);
>>  }
>> -EXPORT_SYMBOL_GPL(fpga_region_register);
>> +EXPORT_SYMBOL_GPL(__fpga_region_register);
>>  
>>  /**
>>   * fpga_region_unregister - unregister an FPGA region
>> diff --git a/include/linux/fpga/fpga-region.h b/include/linux/fpga/fpga-region.h
>> index 9d4d32909340..5fbc05fe70a6 100644
>> --- a/include/linux/fpga/fpga-region.h
>> +++ b/include/linux/fpga/fpga-region.h
>> @@ -36,6 +36,7 @@ struct fpga_region_info {
>>   * @mgr: FPGA manager
>>   * @info: FPGA image info
>>   * @compat_id: FPGA region id for compatibility check.
>> + * @ops_owner: module containing the get_bridges function
> 
> ditto
> 
> Thanks,
> Yilun
> 
>>   * @priv: private data
>>   * @get_bridges: optional function to get bridges to a list
>>   */
>> @@ -46,6 +47,7 @@ struct fpga_region {
>>  	struct fpga_manager *mgr;
>>  	struct fpga_image_info *info;
>>  	struct fpga_compat_id *compat_id;
>> +	struct module *ops_owner;
>>  	void *priv;
>>  	int (*get_bridges)(struct fpga_region *region);
>>  };
> 

