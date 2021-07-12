Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C390C07E99
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 15:54:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32EBF610C7
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 15:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbhGLP4s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jul 2021 11:56:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33443 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229475AbhGLP4r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jul 2021 11:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626105238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MiD9aPGHvtw35XjJa0uYpVwhy0XuXKLsygIcxjEGRTI=;
        b=KADFgKBZMkBza4eb76n9at0bqYVcVoRw1wql8eUEvGH5YT4HDyV9tnvK455yq758KZTore
        JW/XmgVzVG2LsIvMeahf7YEwD8AbMqoOFTHgOj+jyZbZIgBZf/tRYemLVsDvl/fcYS0dbr
        JERXGBvY/Gc4KwINOiH8xpadeS2UlUM=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-ICs6pl12Prq8yfEFWpkBdA-1; Mon, 12 Jul 2021 11:53:57 -0400
X-MC-Unique: ICs6pl12Prq8yfEFWpkBdA-1
Received: by mail-oo1-f70.google.com with SMTP id z1-20020a4ab8810000b029024abe096a35so8182520ooo.12
        for <linux-doc@vger.kernel.org>; Mon, 12 Jul 2021 08:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MiD9aPGHvtw35XjJa0uYpVwhy0XuXKLsygIcxjEGRTI=;
        b=A//FSfNm8tUzFvdT7BK++QF2T07JFNpK2gZVhVVuPDT0GGUU3Kmr9LBM+yygXfaI7U
         Q62aq6xL7W74YQorG53LgHMo0tQ/Wk0Lqbe+2+EzsnUW1j4KnJgt/gtkzgBpwm3al5Fh
         4g4B5e3NVadg2wHHfBciZANxRLrRo7OaIPNTgBq/y3lUH0UMVOvFCuksjIg7t+pwLLr5
         YBOoOsDSwLr1HXITaD7oefnx7oicqE5bFFhoaqD5SzrsiNweE5EJOyC/M5c+BBg1f+T3
         CN3EF4/f32Zh0UNBCNqMiBofLxHz5/1y5PiJnHzMuEAuIuOkGBklxLqRJ/bg+NjV26UF
         /LUw==
X-Gm-Message-State: AOAM530GuPyLPV156Eqq0/kZlr6l2ItumOZQfBd5r85cwO4hskHM3aiq
        ks7XPML/4y/Gc7+LrkuUBzvdflXv3kesPq5OaBEzDLrwU77H9q2oVi/r6HclTvtMJW81MmlbICH
        cgR+id4dQxTOw25Ju1wSr
X-Received: by 2002:aca:6203:: with SMTP id w3mr32470366oib.64.1626105237046;
        Mon, 12 Jul 2021 08:53:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBQk/PEnEo2fM/sVXfRIrtRHgEFsFKtQ4+UXomS6/twyr/Dp53uwDHYxQtwRhAssiUu2kK3g==
X-Received: by 2002:aca:6203:: with SMTP id w3mr32470342oib.64.1626105236832;
        Mon, 12 Jul 2021 08:53:56 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id m19sm920356otp.55.2021.07.12.08.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 08:53:56 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] fpga: remove compat_id from fpga_manager and
 fpga_region
To:     "Wu, Hao" <hao.wu@intel.com>, "mdf@kernel.org" <mdf@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        Russ Weight <russell.h.weight@intel.com>
Cc:     "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210709134229.2510349-1-trix@redhat.com>
 <20210709134229.2510349-6-trix@redhat.com>
 <DM6PR11MB3819098B673C54530B227D4385159@DM6PR11MB3819.namprd11.prod.outlook.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <2a3b3131-96a3-9761-f2e7-63a32fd277f6@redhat.com>
Date:   Mon, 12 Jul 2021 08:53:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB3819098B673C54530B227D4385159@DM6PR11MB3819.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 7/11/21 6:40 PM, Wu, Hao wrote:
>> -----Original Message-----
>> From: trix@redhat.com <trix@redhat.com>
>> Sent: Friday, July 9, 2021 9:42 PM
>> To: mdf@kernel.org; corbet@lwn.net; Wu, Hao <hao.wu@intel.com>
>> Cc: linux-fpga@vger.kernel.org; linux-doc@vger.kernel.org; linux-
>> kernel@vger.kernel.org; Tom Rix <trix@redhat.com>
>> Subject: [PATCH v2 4/4] fpga: remove compat_id from fpga_manager and
>> fpga_region
>>
>> From: Tom Rix <trix@redhat.com>
>>
>> compat_id is implementation specific.  So the data should be
>> stored at the implemeation layer, not the infrastructure layer.
>> Remove the compat_id elements and supporting code.
> I think current compat_id format can meet the checking requirement.
> Actually I hope other hardware which needs compatible checking
> to expose the same format compat_id. Then we can have more
> unified/common code, e.g. userspace application/lib handling.

v2 does not change the current ABI. The dfl output is the same as 
before, the other nonusers get -ENOENT.

For dfl compat_id is 2 64 bit registers.

For compat_id to be useful to the others, they need the flexibility to 
print to the sysfs in the manner that aligns with whatever their user 
library interface is, 2 64 values isn't going to work for everyone.  ex/ 
xrt likely would be a uuid_t printed out a special way. someone else 
maybe just string in the board fw, maybe some has a 8 or 256 bits of 
compat_id  etc.

as a driver region specific op, others are free to do whatever is required.

> Currently I didn't see any other usage or requirement on this part
> now, only DFL uses it.  So should we leave it here at this moment?
> I feel we don't have to change it for now to move it to a
> Per-fpga-mgr format. : )

The motivation for doing this now is the 'use standard class dev release 
.. ' patchset

I really do not like 2 register functions.

By moving compat_id, the 2 register functions reduces down to 1.

I did a poc here

https://lore.kernel.org/linux-fpga/20210709184511.2521508-1-trix@redhat.com/

Tom

>
> Thanks
> Hao
>
>> Printing out the compat_id is done with the fpga_region
>> compat_id_show() op.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/fpga/dfl-fme-mgr.c       |  7 -------
>>   drivers/fpga/dfl-fme-region.c    |  1 -
>>   drivers/fpga/fpga-region.c       |  7 +------
>>   include/linux/fpga/fpga-mgr.h    | 13 -------------
>>   include/linux/fpga/fpga-region.h |  2 --
>>   5 files changed, 1 insertion(+), 29 deletions(-)
>>
>> diff --git a/drivers/fpga/dfl-fme-mgr.c b/drivers/fpga/dfl-fme-mgr.c
>> index cd0b9157ea6e5..8c5423eeffe75 100644
>> --- a/drivers/fpga/dfl-fme-mgr.c
>> +++ b/drivers/fpga/dfl-fme-mgr.c
>> @@ -292,7 +292,6 @@ EXPORT_SYMBOL_GPL(fme_mgr_get_compat_id);
>>   static int fme_mgr_probe(struct platform_device *pdev)
>>   {
>>   	struct dfl_fme_mgr_pdata *pdata = dev_get_platdata(&pdev->dev);
>> -	struct fpga_compat_id *compat_id;
>>   	struct device *dev = &pdev->dev;
>>   	struct fme_mgr_priv *priv;
>>   	struct fpga_manager *mgr;
>> @@ -312,10 +311,6 @@ static int fme_mgr_probe(struct platform_device
>> *pdev)
>>   			return PTR_ERR(priv->ioaddr);
>>   	}
>>
>> -	compat_id = devm_kzalloc(dev, sizeof(*compat_id), GFP_KERNEL);
>> -	if (!compat_id)
>> -		return -ENOMEM;
>> -
>>   	_fme_mgr_get_compat_id(priv->ioaddr, &priv->compat_id);
>>
>>   	mgr = devm_fpga_mgr_create(dev, "DFL FME FPGA Manager",
>> @@ -323,8 +318,6 @@ static int fme_mgr_probe(struct platform_device *pdev)
>>   	if (!mgr)
>>   		return -ENOMEM;
>>
>> -	mgr->compat_id = compat_id;
>> -
>>   	return devm_fpga_mgr_register(dev, mgr);
>>   }
>>
>> diff --git a/drivers/fpga/dfl-fme-region.c b/drivers/fpga/dfl-fme-region.c
>> index d21eacbf2469f..be1d57ee37666 100644
>> --- a/drivers/fpga/dfl-fme-region.c
>> +++ b/drivers/fpga/dfl-fme-region.c
>> @@ -64,7 +64,6 @@ static int fme_region_probe(struct platform_device *pdev)
>>   	}
>>
>>   	region->priv = pdata;
>> -	region->compat_id = mgr->compat_id;
>>   	platform_set_drvdata(pdev, region);
>>
>>   	ret = fpga_region_register(region);
>> diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
>> index 864dd4f290e3b..b08d3914716f0 100644
>> --- a/drivers/fpga/fpga-region.c
>> +++ b/drivers/fpga/fpga-region.c
>> @@ -172,12 +172,7 @@ static ssize_t compat_id_show(struct device *dev,
>>   	if (region->rops && region->rops->compat_id_show)
>>   		return region->rops->compat_id_show(region, buf);
>>
>> -	if (!region->compat_id)
>> -		return -ENOENT;
>> -
>> -	return sprintf(buf, "%016llx%016llx\n",
>> -		       (unsigned long long)region->compat_id->id_h,
>> -		       (unsigned long long)region->compat_id->id_l);
>> +	return -ENOENT;
>>   }
>>
>>   static DEVICE_ATTR_RO(compat_id);
>> diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
>> index ec2cd8bfceb00..ebdea215a8643 100644
>> --- a/include/linux/fpga/fpga-mgr.h
>> +++ b/include/linux/fpga/fpga-mgr.h
>> @@ -143,24 +143,12 @@ struct fpga_manager_ops {
>>   #define FPGA_MGR_STATUS_IP_PROTOCOL_ERR		BIT(3)
>>   #define FPGA_MGR_STATUS_FIFO_OVERFLOW_ERR	BIT(4)
>>
>> -/**
>> - * struct fpga_compat_id - id for compatibility check
>> - *
>> - * @id_h: high 64bit of the compat_id
>> - * @id_l: low 64bit of the compat_id
>> - */
>> -struct fpga_compat_id {
>> -	u64 id_h;
>> -	u64 id_l;
>> -};
>> -
>>   /**
>>    * struct fpga_manager - fpga manager structure
>>    * @name: name of low level fpga manager
>>    * @dev: fpga manager device
>>    * @ref_mutex: only allows one reference to fpga manager
>>    * @state: state of fpga manager
>> - * @compat_id: FPGA manager id for compatibility check.
>>    * @mops: pointer to struct of fpga manager ops
>>    * @priv: low level driver private date
>>    */
>> @@ -169,7 +157,6 @@ struct fpga_manager {
>>   	struct device dev;
>>   	struct mutex ref_mutex;
>>   	enum fpga_mgr_states state;
>> -	struct fpga_compat_id *compat_id;
>>   	const struct fpga_manager_ops *mops;
>>   	void *priv;
>>   };
>> diff --git a/include/linux/fpga/fpga-region.h b/include/linux/fpga/fpga-region.h
>> index 236d3819f1c13..afc79784b2823 100644
>> --- a/include/linux/fpga/fpga-region.h
>> +++ b/include/linux/fpga/fpga-region.h
>> @@ -30,7 +30,6 @@ struct fpga_region_ops {
>>    * @bridge_list: list of FPGA bridges specified in region
>>    * @mgr: FPGA manager
>>    * @info: FPGA image info
>> - * @compat_id: FPGA region id for compatibility check.
>>    * @priv: private data
>>    * @rops: optional pointer to struct for fpga region ops
>>    */
>> @@ -40,7 +39,6 @@ struct fpga_region {
>>   	struct list_head bridge_list;
>>   	struct fpga_manager *mgr;
>>   	struct fpga_image_info *info;
>> -	struct fpga_compat_id *compat_id;
>>   	void *priv;
>>   	const struct fpga_region_ops *rops;
>>   };
>> --
>> 2.26.3

