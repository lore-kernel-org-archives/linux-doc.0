Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760329;
	b=i5aGnTK9e2E3FOTH+b2WJsjKn+wq4eLFnTlJbXCkPoPQRvvn6bURMMGusgfiNUq/mU86
	 2P5pzwbuoIxrUvKp7T/6PAMrJn53P8PRvdn43Y4MgqUzh7CPh/FtoCW+EfpJ+1/x62xFN
	 mzz7i1EGyifG69GbXmqvpNrd9EYYZjJwqoJh56pKBQR41fGYq0WKQTfVJgQOzC5L21CEq
	 zkSl7OyqaLN1X/lL8+XgJyqCSXT9c3qdzgEof8ZcQPXGcfkJrmpCRroeY/hc1ip/p6scm
	 UdmVhyrbBd+rSkqzLhWxECQoc6rRp47Cfr7Zy9sTVJ1BNicMwhPZjP1ML8nsv1t8h8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JG9x0NIXD32q8WVFYmOnLtFpuKdZNQP6WxoLonwFFAw=;
	b=Qoj+fdxX2MZazEV6m7/jbMykc7UaD3pwtRwTb3qZTQVUDuJKJy4tfdQW445HEcGLaCYq
	 sJmGOeD6/ZKRoING79xRAvDA4gBtZs7phB65vN2Dr2QhrGLUbGqLX7UGLgwf5YLZUejsk
	 5TxhxxNGQxsbzBUneaAXzDX6VmP7BFH7NxzVlcJHKr2YziQMYFPvps76BoOld1HpwLw6z
	 IubGuexnB9u3BlphFKxMO5brh1usGZ59elpdzShy13XqlyJKmZGhOd6zKaTuA707Dl7/5
	 ILtdeFJkmaZSYTwOMVkFJL/IKWqHZLoExxzZAQZXAre7/pfdycYWcGITgX+mex2Gg8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F85606A31F
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 12:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F85606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso9380175e9.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792760317; x=1793365117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JG9x0NIXD32q8WVFYmOnLtFpuKdZNQP6WxoLonwFFAw=;
        b=CifPPNfYtcVHaaC8q7fD+mJLpWcf2lwFcAnphQYlgJ18Vg/dA+iTn7mr4wRjCEMiaI
         mgduAr34636erZ1R/64KnaYi5fADZn9qcEng8y+95LgfxS3aPQ54AutC8VUbwRckHWxD
         i27ixlz4zvhlZN9Kdx6UORIqOGB0jw7o0taaJ2LjE/6/Sf8lhRr51gt1kzYAWLSgy7cb
         Dvl1JmY2CZ8b0K5PFt+8MeL1NMdfxkWpR3z03E8hhroCOcmscpF93a9rOK08MMniIyPr
         nZnqs4BjJpMUJRWOtoXbn3AbFTcS1LlCvlbkbQcqgrF6qtgRcB3G7Uus2dhpV7mXNQlN
         tQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760317; x=1793365117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JG9x0NIXD32q8WVFYmOnLtFpuKdZNQP6WxoLonwFFAw=;
        b=yeSGxlTvlweFevylFU1lf+qPCkHv5Z81BUXJjGcMt7JzbjRT4CTPvaZvVfpi2I3szJ
         iEmgr9L5uNk5mJCPFn5YIM/91Xu5L97jNkfk9nr3DMjRV/F7HrPg9oG41AsQYE3QyCmR
         SYi0fxPXktKbN1D3H4BSokXX5EBBIqYlY5zFst9adXw2ERDAuR2Is5UmYiEXXxuw4SgD
         /ZuH1rs8Q+plRy2aozCvLCAfQE8WGwsT3giswU0hSGPTqF7i0rFvZVDwyceHzYVt9kd1
         uNTjSmkMwzcljEUEVmHeYaJ6qMbLq8gGmZVy94r06yQ0XEx4+mdlZramaBtZcEwhexOH
         q0ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxw1NWEd5Oqxwp8j3UgFrulG6RUZo/uDok9F8FL6Xz6rc9JaYG3T20kTlMtA3Ks+Asow4lbNJnC+c0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB4V9AGlrXmQMhR6JKr40+sXZHmcwbbp68caBjaUCvh7lhVsIa
	zeavhjQOothvgmrcSeOqSxTJ8ACf7QM12JNRJpaYZU2Qdj7lmcTCPSJwmZwfZLkpJ7M=
X-Gm-Gg: AYBFou08xAod0f3a27TazF6okjy3XrFVp5GTCBMhe9q8jLy4CQ06dLXcbw6o0j6IUl7
	hPn5TqKicYvBk4vfTOJBqtbaicTeNzpd1MlHzir+aHwF4rE4K23ou4TXhQHtQRVQbxXG+I/KQXv
	cLyeX8t+teFcZ+62Ihz6J9EmfDso6crrIJBS2Ru1so4oHr2HyCwOGC0l/lMskx9D48Ljh3AlnbP
	9wado4p5KXuLfCpTT6JSI4sfNqrXk1dV9Q/CEj18DoCL7qJnns43Qtp5e6sh4RaCz2o6+GJaCCR
	U3M60E7KZbkdAzBAZXsVRfU3eENiDtKV/SuoBjRPe5txACkZTTmkby3AI9FIixOxM20+HrSOtic
	pxHlYLRRg1dBofTr1tJyX0lolBM7+HS75fDx6j8b8AyiwipASnq0YsYUXxq/SZalj9FAdqLi6cY
	c9rXpIwEtoE9evd7CT3VHTTR8V9iwJ5IR6lyCvLckFwZNaq03YwVU81bY3+LxhB9fl9qz5i8gJZ
	/5cIJaGhNCjvmy6pfGtRdOCU8iC3/VeLS6od8fM1J+9amspR1ja2G2BeLO15tV0JFw=
X-Received: by 2002:a05:600c:3508:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a211edd5c6mr37509065e9.30.1792760317227;
        Fri, 23 Oct 2026 05:58:37 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2153c14c6sm28069895e9.1.2026.10.23.05.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:58:36 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:58:33 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <attZl_0TNMDLgi4U@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
 <20261022184313.GD3381610@ziepe.ca>
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
In-Reply-To: <20261022184313.GD3381610@ziepe.ca>

Thu, Oct 22, 2026 at 08:43:13PM +0200, jgg@ziepe.ca wrote:
>On Wed, Oct 21, 2026 at 02:25:05AM +0100, Jonathan Cameron wrote:
>> > +struct ctlv_device *ctlv_create(struct device *parent_dev, const struct ctlv_family *family,
>> > +				const void *init_info)
>> > +{
>> > +	struct ctlv_device *ctlvdev;
>> > +	int devnum, ret;
>> > +
>> > +	if (!parent_dev || !family)
>> > +		return ERR_PTR(-EINVAL);
>> > +
>> > +	ctlvdev = kzalloc_obj(*ctlvdev, GFP_KERNEL);
>> > +	if (!ctlvdev)
>> > +		return ERR_PTR(-ENOMEM);
>> > +	ctlvdev->family = family;
>> > +	init_rwsem(&ctlvdev->registration_lock);
>> > +	spin_lock_init(&ctlvdev->transition_lock);
>> > +	ctlv_event_device_init(ctlvdev);
>> > +
>> > +	/* Before anything reads the schema through this device. */
>> > +	ret = ctlv_op_resolution_init(ctlvdev, family);
>> > +	if (ret)
>> > +		goto err_free;
>> > +	/* What this family's events need of every queue opened on it. */
>> > +	ret = ctlv_event_sizes(ctlvdev);
>> > +	if (ret)
>> > +		goto err_free;
>> > +	/* Before a minor is spent on a device that could not be announced. */
>> > +	ret = ctlv_device_uevent_check(family);
>> > +	if (ret)
>> > +		goto err_free;
>> > +	if (ctlvdev->dynamic_ops_count) {
>> > +		ctlvdev->disabled = bitmap_zalloc(ctlvdev->dynamic_ops_count, GFP_KERNEL);
>> > +		if (!ctlvdev->disabled) {
>> > +			ret = -ENOMEM;
>> > +			goto err_free;
>> > +		}
>> > +	}
>> > +	devnum = ida_alloc_max(&ctlv_device_ids, CTLV_MAX_DEVICES - 1, GFP_KERNEL);
>> > +	if (devnum < 0) {
>> > +		ret = devnum;
>> > +		goto err_free;
>> > +	}
>> > +
>> > +	ctlvdev->dev.devt = ctlv_device_number + devnum;
>> > +	ctlvdev->dev.class = &ctlv_device_class;
>> > +	ctlvdev->dev.parent = parent_dev;
>> > +	device_initialize(&ctlvdev->dev);
>> > +	/*
>> > +	 * The core owns the file operations, so an open holds the core module
>> > +	 * and not the family's, which may unload while readers remain.
>> > +	 */
>> > +	cdev_init(&ctlvdev->cdev, &ctlv_file_operations);
>> > +	ctlvdev->cdev.owner = THIS_MODULE;
>> > +
>> > +	ret = dev_set_name(&ctlvdev->dev, "ctlv%d", devnum);
>> > +	if (ret)
>> > +		goto err_put;
>> > +	ret = ctlv_family_claim_add(family->schema);
>> > +	if (ret)
>> > +		goto err_put;
>> > +	ret = ctlv_family_privs_pre_init(ctlvdev, init_info);
>> > +	if (ret)
>> > +		goto err_put;
>> > +	ret = ctlv_family_privs_init(ctlvdev);
>> > +	if (ret)
>> > +		goto err_put;
>> > +	ctlv_op_publish_all(ctlvdev);
>> > +	ctlv_event_contexts_start(ctlvdev);
>> > +	ret = ctlv_family_privs_post_init(ctlvdev);
>> > +	if (ret)
>> > +		goto err_fini;
>> > +	scoped_guard(rwsem_write, &ctlvdev->registration_lock) {
>> > +		ret = ctlv_device_add(ctlvdev);
>> > +		if (!ret)
>> > +			ctlvdev->registered = true;
>> > +	}
>> > +	if (ret)
>> > +		goto err_fini;
>> > +	return ctlvdev;
>> > +
>> > +err_fini:
>> > +	ctlv_device_fini(ctlvdev);
>> > +err_put:
>> > +	put_device(&ctlvdev->dev);
>> > +	return ERR_PTR(ret);
>> 
>> Jason did some nice handling in the fwctl stuff for
>> device alloc and hand over after device_initialize()
>> (I've copied it into a few places recently :)
>> 
>> I'd like to see something similar here as it made
>> it easier to follow lifetimes etc.
>
>This is really at the wrong layer.. Attestation subsystem is the lead
>subsystem, it should be allocating the struct device memory and the
>driver should see the typical
>
>  struct attestation_dev *adev;
>
>  adev = attestation_alloc()
>  [..]
>  attestation_register(adev)

Er, the driver would call attestation_create() which will be a wrapper
of ctvl_create. The reason is inheritance chain and each parent being
passed info to and doing its own init()


>
>Sequence in its probe function
>
>We need the subsystem refcounted memory to exist if we are ever going
>to create a kapi and common functions
>
>Jason
