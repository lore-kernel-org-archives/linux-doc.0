Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659950;
	b=CmC7Zyn1CkQZhlNs3u9U9rJ7O70uH+ImmavhCva5+cSPczOu+Ws1Js/qY6xhzkGwdOgB
	 teiS3c4/or6Kfb5pdJCoMy+0WFg5XCqYvg2HHYxZ2i579cCWvL29jOVSjnJHVZnJF0kH4
	 ICWHCOlI1ZQY4RtxoGYNnyaEdMZHHmM+TI7AbGVvoFYoHY/pcDspFpfxU27NY99XBL1Lt
	 oSlopYf76B1Li+Y+mt8kTG9G3yPjLilAKqhHF+/E54FqzKBpMnVGUFUEMYs0wWlWPhah9
	 zfwcRFX/2GWfCouIQCANwfzUDYtDiQbMwK0PfB4yUYJdp6SV1rGMNxElKc5PnceJb3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VCtPLF1g5YCJnqvDxXjL/9SGDpcHIvBwNuJeTWJPyWo=;
	b=HefkXcg5w5zFwYxzsznWBzg+qdDaPojeXz8qAnxleh/o57BlfXM8u367qXoYIkPKJquu
	 P7Vb93bOExbjvJewXCsFhc3QW3pqjirUlMrxvcdCOJ03za/T0IpHuAAZFbxYa2vmO25Mg
	 hQiGmCYfqq9kk9ttDe7TQxqrMFBHqRWhddYhWJFIMogeEk1PaDkBHcOWB8kUQ7IuCl+ER
	 Nu+3kCJtiyjmkxotr46VksjDJH3KvGz++i26qtZK0YksVKS1TYd9vRFQNHD4R+ge0Z5Wj
	 NwiBbKUrc7hpqCF2uHSS/z3hCV0XlmWaXso/f2h02B+zgv9ps2Gp5PgTjPg3XQQhPlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=CG4pwxKj;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95301606A321
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 09:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95301606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=CG4pwxKj
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1578069f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792659947; x=1793264747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCtPLF1g5YCJnqvDxXjL/9SGDpcHIvBwNuJeTWJPyWo=;
        b=CG4pwxKjkPq41V9lUY1xPtyLM7VGkWfj0wIo2355s6BuBYcgsuRPWfhiVq6CnU5EUK
         U6ISRUDw6LP3pxCtWf53VXIfVLLFARjt5/A5RTFt+Wj5BQOl97jTWy5uCVl0uJZWZjdx
         5QJOnQ67tU8DZeBGkIBPmyGxUBNX8t40T1FxTQcWlxN/XSMqIzeI5/KwqhLXE/nZYg/2
         l652BLCNN5Kg7dZMEBleKvf3x4lpyF2+1ohF3/UOY/Bo5ex0KS/FI4UCDM6fFbSf2m7g
         Jwj6H3TFMAkXXh6cmYl2j5nTS3Z5Ixi/a1aX0e55EA1spziMAnLVlnozBP/BV3o2LlvG
         bjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659947; x=1793264747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCtPLF1g5YCJnqvDxXjL/9SGDpcHIvBwNuJeTWJPyWo=;
        b=S0Jc0hJB6wEFO6uvHztCnzhEsrFD3Y2oZ7rL2FjA7Bb7eRfS8fzye+PQ47VY6kGZIv
         KXi00Sp1v60wVxIxewWp/FZN2OhkLItSB5BFNTXPLRsm5ptmtX0KsepezJbbBeSrC4Xt
         X7bPf63u8eJ575wBDZjeFfytzY3lLT2uV9sKDo7fsbDcAZOJ0jAZTYD8CN6MrTR8IUV4
         22aDN8jfV+olqamo5RwNcfwz8I/grmAyNEtnhJRBL5CL/Zbw0zYwYTS3cMMRaTxI1izr
         rrzrUqwGMucva/yfTTx4Buca45TqJx77coK1Z+2wLHOs2+jVBPsiVtcR5ETRJN3LsnxF
         sPUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkE+ybGTyX23PN749hw5VbyBUBwBJKAVpDmBAQSlzEjVEjBWhsHW7Q73I4I5/gVtoeqZyVmFNsEUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3KSkt7fQs9LCIiug9NMfmsyloBpDCuCJkRtl8FR1/D65cqCkQ
	O30dXT3G4eiH69UhLNF9lNPbrFRU35JOOS6MgPYCdWs2xRP7tqvWqeS6u0Yw7dlf+CQ=
X-Gm-Gg: AYBFou35qg2wRWi5BPScy1CeZ4KogDiRZW0RXwFAW2YwW15FshrP/mJQzlAk/JwJnnR
	3eCyBPBbZ6q6hMVf24+/z4R2wWo+9mJnrX84Z5WriyTMDP97F7+mgrxYjhnbiAqVRPPkCoq9n/m
	mXOo4x1Z5DMfAPTO/KeoxSo69Yr0fILZ3Y2GO3eBWLNYuSiJXC2I0T9nkBVuRHaiSn31guTBCRn
	rE92lEZ2VQ5+mXyKFAdA4wQfZiRNhWDYebHWgkW42vG47zPGU0fxuq/kkdxLZmytP8zzpUjRx/m
	/SNHI8p2BapOz6X6XLy3SBEo+NiNG5eZeuha8HU/Z33ZyOTK8QaIDopmg9bOi4eI1Uyu1A4Hfpb
	jEIiwMlK8k+2jWVeDAUsxMkZIpnQkKX/OQExiWW/eQ+/WuLtKBAb3CAxyRCshRj+LAWGdwxoRHa
	UcqSvZ8Zk8VZB3hDDvc9rQLSp4udHt1/5YTcZp9rGX4tLGsZi9CJaHA81OjLCmsmOBGJ6jk4A3a
	+OsybulixVGg9MH+z73ggeHVTz4U2QDfTk+IEF+57Al1f6+QqU6r6sSxl4B95Nz
X-Received: by 2002:a05:600c:3b1d:b0:4a1:d41b:5060 with SMTP id 5b1f17b1804b1-4a1fdb1358bmr98096365e9.22.1792659946257;
        Thu, 22 Oct 2026 02:05:46 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b28f70sm62056445e9.4.2026.10.22.02.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:05:45 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:05:41 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <atnRsQHieSNzE51D@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021022505.6fe1b1bb@jic23-hlaptop>

Wed, Oct 21, 2026 at 03:25:05AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:45 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Register CTLV devices, resolve family chains and dispatch operations
>> through validated messages. Wire CONFIG_CTLV and the generated root family
>> after all module objects are present.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  drivers/Kconfig             |    2 +
>>  drivers/Makefile            |    1 +
>>  drivers/ctlv/Makefile       |    4 +-
>>  drivers/ctlv/core.c         | 1517 +++++++++++++++++++++++++++++++++++
>Normally I'd push back hard on too big to read, but it is an rfc
>and other patches in the series are much large.
>
>I'm out of time for today and not sure when I'll get back to this,
>so just a few quick comments inline on the bit I did look at.
>
>>  drivers/ctlv/device.h       |   17 +
>>  include/linux/ctlv.h        |   55 ++
>>  include/linux/ctlv_family.h |   22 +
>>  7 files changed, 1616 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/ctlv/core.c
>
>> diff --git a/drivers/ctlv/core.c b/drivers/ctlv/core.c
>> new file mode 100644
>> index 000000000000..aeab29fe2fdd
>> --- /dev/null
>> +++ b/drivers/ctlv/core.c
>
>...
>
>> +static int ctlv_file_open(struct inode *inode, struct file *filp)
>> +{
>> +	struct ctlv_device *ctlvdev = container_of(inode->i_cdev, struct ctlv_device, cdev);
>> +	struct ctlv_file *cfile;
>> +	int ret;
>> +
>> +	/*
>> +	 * A failed create can withdraw the cdev while an open is waiting for
>> +	 * the lifecycle lock, so admission itself first pins core storage.
>> +	 */
>> +	get_device(&ctlvdev->dev);
>> +	ctlv_file_open_pinned(ctlvdev);
>> +	scoped_guard(rwsem_read, &ctlvdev->registration_lock) {
>> +		if (!ctlv_file_open_allowed(ctlvdev)) {
>> +			ret = -ENODEV;
>> +			break;
>Personally I still dislike the hidden for loop in scoped_guard()
>and using break with that enough I'd do a 
>	do {
>		guard(rwsem_read)(&ctlvdev->registration_lock);
>
>	
>	} while (0);
>
>Just so it is obvious what those breaks are from.

Agreed, easier to read. Will fix.


>
>Maybe I just need to get this one into my code review head...
>> +		}
>> +		if (!(filp->f_mode & FMODE_READ)) {
>> +			ret = -EACCES;
>> +			break;
>> +		}
>> +
>> +		cfile = kzalloc_obj(*cfile, GFP_KERNEL_ACCOUNT);
>> +		if (!cfile) {
>> +			ret = -ENOMEM;
>> +			break;
>> +		}
>> +		cfile->ctlvdev = ctlvdev;
>> +		/*
>> +		 * Commits this description to the device. An open that failed
>> +		 * after this would have to take it back.
>> +		 */
>> +		ret = ctlv_event_file_init(cfile);
>> +		if (ret) {
>> +			kfree(cfile);
>> +			break;
>> +		}
>> +		/* This description keeps the reference taken on entry. */
>> +		filp->private_data = cfile;
>> +		return 0;
>> +	}
>> +
>> +	put_device(&ctlvdev->dev);
>> +	return ret;
>> +}
>
>> +struct ctlv_device *ctlv_create(struct device *parent_dev, const struct ctlv_family *family,
>> +				const void *init_info)
>> +{
>> +	struct ctlv_device *ctlvdev;
>> +	int devnum, ret;
>> +
>> +	if (!parent_dev || !family)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	ctlvdev = kzalloc_obj(*ctlvdev, GFP_KERNEL);
>> +	if (!ctlvdev)
>> +		return ERR_PTR(-ENOMEM);
>> +	ctlvdev->family = family;
>> +	init_rwsem(&ctlvdev->registration_lock);
>> +	spin_lock_init(&ctlvdev->transition_lock);
>> +	ctlv_event_device_init(ctlvdev);
>> +
>> +	/* Before anything reads the schema through this device. */
>> +	ret = ctlv_op_resolution_init(ctlvdev, family);
>> +	if (ret)
>> +		goto err_free;
>> +	/* What this family's events need of every queue opened on it. */
>> +	ret = ctlv_event_sizes(ctlvdev);
>> +	if (ret)
>> +		goto err_free;
>> +	/* Before a minor is spent on a device that could not be announced. */
>> +	ret = ctlv_device_uevent_check(family);
>> +	if (ret)
>> +		goto err_free;
>> +	if (ctlvdev->dynamic_ops_count) {
>> +		ctlvdev->disabled = bitmap_zalloc(ctlvdev->dynamic_ops_count, GFP_KERNEL);
>> +		if (!ctlvdev->disabled) {
>> +			ret = -ENOMEM;
>> +			goto err_free;
>> +		}
>> +	}
>> +	devnum = ida_alloc_max(&ctlv_device_ids, CTLV_MAX_DEVICES - 1, GFP_KERNEL);
>> +	if (devnum < 0) {
>> +		ret = devnum;
>> +		goto err_free;
>> +	}
>> +
>> +	ctlvdev->dev.devt = ctlv_device_number + devnum;
>> +	ctlvdev->dev.class = &ctlv_device_class;
>> +	ctlvdev->dev.parent = parent_dev;
>> +	device_initialize(&ctlvdev->dev);
>> +	/*
>> +	 * The core owns the file operations, so an open holds the core module
>> +	 * and not the family's, which may unload while readers remain.
>> +	 */
>> +	cdev_init(&ctlvdev->cdev, &ctlv_file_operations);
>> +	ctlvdev->cdev.owner = THIS_MODULE;
>> +
>> +	ret = dev_set_name(&ctlvdev->dev, "ctlv%d", devnum);
>> +	if (ret)
>> +		goto err_put;
>> +	ret = ctlv_family_claim_add(family->schema);
>> +	if (ret)
>> +		goto err_put;
>> +	ret = ctlv_family_privs_pre_init(ctlvdev, init_info);
>> +	if (ret)
>> +		goto err_put;
>> +	ret = ctlv_family_privs_init(ctlvdev);
>> +	if (ret)
>> +		goto err_put;
>> +	ctlv_op_publish_all(ctlvdev);
>> +	ctlv_event_contexts_start(ctlvdev);
>> +	ret = ctlv_family_privs_post_init(ctlvdev);
>> +	if (ret)
>> +		goto err_fini;
>> +	scoped_guard(rwsem_write, &ctlvdev->registration_lock) {
>> +		ret = ctlv_device_add(ctlvdev);
>> +		if (!ret)
>> +			ctlvdev->registered = true;
>> +	}
>> +	if (ret)
>> +		goto err_fini;
>> +	return ctlvdev;
>> +
>> +err_fini:
>> +	ctlv_device_fini(ctlvdev);
>> +err_put:
>> +	put_device(&ctlvdev->dev);
>> +	return ERR_PTR(ret);
>
>Jason did some nice handling in the fwctl stuff for
>device alloc and hand over after device_initialize()
>(I've copied it into a few places recently :)
>
>I'd like to see something similar here as it made
>it easier to follow lifetimes etc.

Will do.


>
>> +err_free:
>> +	bitmap_free(ctlvdev->disabled);
>> +	ctlv_family_privs_free(ctlvdev);
>> +	kfree(ctlvdev->ops);
>> +	kfree(ctlvdev);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(ctlv_create, "CTLV");
>

Thanks!

