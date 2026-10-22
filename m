Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694597;
	b=VMmez5prUp9WR/ETV6RpA+28DWj8wpgydmz5vL65GJkPHtCkJCwPynOs2c5G0IqVvkBz
	 gJ/EErwOW5P8xHB0hbufuadr1P6A2cxMlXI5e+4xHT9c2+lLJ7+nB7Rp4+wKbCt4rv24+
	 hlxVH5gh6N9TqzmtU2rmorchCPOiZg2mCN7oJ1EsA0D/ZKjw0fKNIEI7ocVHVc9H1vXY4
	 j7H2XOlME1ORSZkBTcPOR4LSDJbjaITQjvzl/IzSv2MlJMcEro3yzskzl+GFibHWUWfcm
	 KaEmNvF9NwkiREDeavi6hBk33yc+t1cL8NNtKLPg6c97BGy2pdr/mYiO7Youz/a1Rqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=My1VAgj8tQx3tGuGu6tSDqUUuD+FQDqeoDBJloW0vMo=;
	b=deRXxwWqL1l7Asp+twTxYtJR76ZnObnzjHNEsmhe6xBcdgpG6ym7LForCtN1rnSt6Gcs
	 DZezxr6CedgnMITxCUZ7cks91X1T++Y4/aEiGZLKqEX+JhDEDQfD7N17CXhf45J/Pf/b1
	 urh8ZUtZIxsXywpusTqVbAuYTU69PwR4dDx32RknoOqM+JODy29er90NjDdwjqex0+BCX
	 88sz0835mf5oNrl7rLjSpMViWjA7Vfo5ZkJIKAXR70jUcTJyKZsIUFu6O2BSXfQZRS7mA
	 OIrhn+5cWYrP+q+BTt7ZCcDQA05hZZhS95qp7UdzeX1sJqRlr1O0X51ikE4FSDyEhjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nKJi93LP;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605B8606A319
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 18:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 605B8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nKJi93LP
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c11468b5fso2362196d6.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792694596; x=1793299396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=My1VAgj8tQx3tGuGu6tSDqUUuD+FQDqeoDBJloW0vMo=;
        b=nKJi93LPc48Esxvohip1vSyHieBUQORNbKUhASwH832yq8/YpN7cupzfybrDxNZpwb
         9Tux6bXq8BPZTnJ0xrIE2ypof5Mq+DgTPuRBxYrlMvJ7pvPttb4ErfUwG25/5mEAyvsX
         3i5SsTcaAThuto3P5oLgORukoVh/lCAgW8PXZT/kpbMhDVHYC+YqWMZDs5Zjv3eKswZN
         T9PVuV+Y/yAla5vrjn+/dQ4k8GDIinY/XCI/+tg5+RonRfWg2hghEjHgY8otLDvEhcBs
         2eFakYN6BWX9BHluQ2GWKp7JHXTFhcYL1XE2jxLpRChT+kYtkIuSe2t5mEbD2G1YBghp
         1nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694596; x=1793299396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My1VAgj8tQx3tGuGu6tSDqUUuD+FQDqeoDBJloW0vMo=;
        b=aONCXN+pS8gLkwv7gMOzyUopDtNNuPlnjhMVLJOcDEFduoVmbHGtCfky0xVWgETIoU
         obKYkAlkaWDJMQtn5zSrAVCnk9wAMxtE9wCa5XiOGAD4VnvmtaHckvosIBSyN3gY+ZF+
         6Lf7NabPXcMjnpBAaMxitC7w5XzEDHFr89vK+faxaGE9qfRSB5xkRpyL87Q+3XL9KPcY
         tNietK7MHXI28hsop5gHPATmo9QBmwMfrObs4P3hYIwEqjfASLA0glmMdoGR9kM2UYG+
         6hKseGOmcb8xyG2ltCuYk9xa/SbeVf6BCFpx/2uJ7lD4yArFhmvlc6eh4t+gyFSo2rN3
         GXrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQioslBx2kBgzqWIsjevD3/V2qSix7QN46m0Wd/jsfIhVT6kC3JFu70chbzupQX6l2qkPfcChg9is=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH0Ypxo/WTJqGN3MP/SPqBcVJXHalghwVgYnDbdQrmmXxIwmJ1
	UtCGYFH8+aCtxWGuK9IQglJ2xGkTpLz8FJAIQHrfiydzMn0LqMxSmxn8lvr9dhJXjX0=
X-Gm-Gg: AYBFou1gdLEhg4ZDmZMqUSxhKu0JNouTMgUV0pZ0qUUon1QE91pRLpm0aL9BqyKgG4d
	JYqVsmf0NsFKPUVP9HxLeItzOvxlLgyOyv8o5NVYURv5cQBvjiUUJALz9jqsfR6gANvXSw86gT6
	Ieicrexe0kwMTBjCpJO4fOKAHlPwDkj6RhBDAj9BngcGL32Bet7Ens7U0z+xImKbZgLrmcfMnUy
	+sn3r7NobqcCL4l8H2RySfWEgg+gc4+sPBXd604+ETXtge9VXtkJs3oNCnzIJgQlczpK1O+UcQl
	SEJPJwr5MdeC/1m3ZP50AOsd+a837osbDo0PoEwiqa7oPlmw1am9wFXN7XZ9NLxYUU1K3o1YEB3
	rOlb0MYa7k7sbP1zzXMqeHSXWVUFgJhqMgdySw+JFPnUlHoRNU8w9+N3QWylNVlrofethQKIzpQ
	Atk/w+wl72Mbi26u9+payD9MN73O8brxbj9BLzuklgThsMbkRr7l2LtjQK+DR7BxdPBmrejpfiu
	tnvtHlFkXXRpUThWzOGsTG/0Sm6p7Y/aT8mnX4XKjAQKpl1+N4aw4Zsl4EKeLIn52tfcTtW5cAy
	Fh1mponWH+bS9tf1soGf/pOCCUmQhr3l+o646g==
X-Received: by 2002:ad4:4ee5:0:b0:91b:8b44:d4c7 with SMTP id 6a1803df08f44-91c12ee2dc3mr106716916d6.26.1792694596058;
        Thu, 22 Oct 2026 11:43:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c37060bb5sm4070256d6.24.2026.10.22.11.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:43:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJxkv-0000000FjQ8-3dAv;
	Thu, 22 Oct 2026 15:43:13 -0300
Date: Thu, 22 Oct 2026 15:43:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <20261022184313.GD3381610@ziepe.ca>
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

On Wed, Oct 21, 2026 at 02:25:05AM +0100, Jonathan Cameron wrote:
> > +struct ctlv_device *ctlv_create(struct device *parent_dev, const struct ctlv_family *family,
> > +				const void *init_info)
> > +{
> > +	struct ctlv_device *ctlvdev;
> > +	int devnum, ret;
> > +
> > +	if (!parent_dev || !family)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	ctlvdev = kzalloc_obj(*ctlvdev, GFP_KERNEL);
> > +	if (!ctlvdev)
> > +		return ERR_PTR(-ENOMEM);
> > +	ctlvdev->family = family;
> > +	init_rwsem(&ctlvdev->registration_lock);
> > +	spin_lock_init(&ctlvdev->transition_lock);
> > +	ctlv_event_device_init(ctlvdev);
> > +
> > +	/* Before anything reads the schema through this device. */
> > +	ret = ctlv_op_resolution_init(ctlvdev, family);
> > +	if (ret)
> > +		goto err_free;
> > +	/* What this family's events need of every queue opened on it. */
> > +	ret = ctlv_event_sizes(ctlvdev);
> > +	if (ret)
> > +		goto err_free;
> > +	/* Before a minor is spent on a device that could not be announced. */
> > +	ret = ctlv_device_uevent_check(family);
> > +	if (ret)
> > +		goto err_free;
> > +	if (ctlvdev->dynamic_ops_count) {
> > +		ctlvdev->disabled = bitmap_zalloc(ctlvdev->dynamic_ops_count, GFP_KERNEL);
> > +		if (!ctlvdev->disabled) {
> > +			ret = -ENOMEM;
> > +			goto err_free;
> > +		}
> > +	}
> > +	devnum = ida_alloc_max(&ctlv_device_ids, CTLV_MAX_DEVICES - 1, GFP_KERNEL);
> > +	if (devnum < 0) {
> > +		ret = devnum;
> > +		goto err_free;
> > +	}
> > +
> > +	ctlvdev->dev.devt = ctlv_device_number + devnum;
> > +	ctlvdev->dev.class = &ctlv_device_class;
> > +	ctlvdev->dev.parent = parent_dev;
> > +	device_initialize(&ctlvdev->dev);
> > +	/*
> > +	 * The core owns the file operations, so an open holds the core module
> > +	 * and not the family's, which may unload while readers remain.
> > +	 */
> > +	cdev_init(&ctlvdev->cdev, &ctlv_file_operations);
> > +	ctlvdev->cdev.owner = THIS_MODULE;
> > +
> > +	ret = dev_set_name(&ctlvdev->dev, "ctlv%d", devnum);
> > +	if (ret)
> > +		goto err_put;
> > +	ret = ctlv_family_claim_add(family->schema);
> > +	if (ret)
> > +		goto err_put;
> > +	ret = ctlv_family_privs_pre_init(ctlvdev, init_info);
> > +	if (ret)
> > +		goto err_put;
> > +	ret = ctlv_family_privs_init(ctlvdev);
> > +	if (ret)
> > +		goto err_put;
> > +	ctlv_op_publish_all(ctlvdev);
> > +	ctlv_event_contexts_start(ctlvdev);
> > +	ret = ctlv_family_privs_post_init(ctlvdev);
> > +	if (ret)
> > +		goto err_fini;
> > +	scoped_guard(rwsem_write, &ctlvdev->registration_lock) {
> > +		ret = ctlv_device_add(ctlvdev);
> > +		if (!ret)
> > +			ctlvdev->registered = true;
> > +	}
> > +	if (ret)
> > +		goto err_fini;
> > +	return ctlvdev;
> > +
> > +err_fini:
> > +	ctlv_device_fini(ctlvdev);
> > +err_put:
> > +	put_device(&ctlvdev->dev);
> > +	return ERR_PTR(ret);
> 
> Jason did some nice handling in the fwctl stuff for
> device alloc and hand over after device_initialize()
> (I've copied it into a few places recently :)
> 
> I'd like to see something similar here as it made
> it easier to follow lifetimes etc.

This is really at the wrong layer.. Attestation subsystem is the lead
subsystem, it should be allocating the struct device memory and the
driver should see the typical

  struct attestation_dev *adev;

  adev = attestation_alloc()
  [..]
  attestation_register(adev)

Sequence in its probe function

We need the subsystem refcounted memory to exist if we are ever going
to create a kapi and common functions

Jason
