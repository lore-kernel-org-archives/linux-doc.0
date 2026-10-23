Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765596;
	b=F28J8Uun4u8ZBOOW0xz49kg+zjktNFVDOU/D56/bwUFISkhlmVb1m9x8Rbyj4tke+LZy
	 DTBNpRGL3jH3rDTfd+O7mEDobB4ypSWizHlEc8fbFE7u9Q07NJ7UoByTZgzLhgd/PdTAL
	 r+2qhFqlef4g6kI4Hr4kCGwb1kd+Id2ZEhgyZ1Xg7usq/rjye/5355u9CdZQRZ69YH2iK
	 pRXncZTcb/DS1UvqHF0kq9kpRcgJEgs7hALWc8fd67iOI8KVK53kdxtnO9av9l/kZaAso
	 PxLHx9O5c7l2eRq+51XFvEhZzsEFDglGWE31eDtBFHM0Q5JwKK0E3gIQ4fQC/y89rxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0RgIg1l+3ifUtXqxbecqEIvcyWwa/dmFWxjX5pMBv2k=;
	b=qzMgMDT+LW1cHaMUTKjBTkB3OBeG9+Maqy0slATa/eEZWxkQKFE+uXlpeO3saNuwBo4C
	 0fX7Cwz6l+MHP+P/CCAi9bLRban1V/hlJrtp8NOhAr4kr1IWV2SnPKb511wrx/vd6NBVv
	 GvmIZzVsI63DlerHVqFgmjGrDXn8oQHJOpE0cP2DW8/8CJp2WXEcxUr4XliKnmVNTm1Pj
	 lALRsNwMB4qXwmgJ41jcJcv0iux6Pkot9vwStUcWGMClbs/T2GAzU8c5UNmp9Q/z94d7j
	 hJuSyYXNK7J2k/DlJxSCEuWPgWi26pfHIWoitTokm2xuaTyRa43ylzg2IUbN8O1E6/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DuYf6d6E;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE57606A31D
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 14:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE57606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=DuYf6d6E
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-537548b811aso1373201cf.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792765595; x=1793370395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0RgIg1l+3ifUtXqxbecqEIvcyWwa/dmFWxjX5pMBv2k=;
        b=DuYf6d6Eamd3Mim9JzP6lyLqHMZQ7cyKJdqyD3vzB6Sr2u0uVSkWpIdZeTI1JCnN61
         NIFACP66viSHxdE7SDl5Z0vkYsbly/8y1CfaZRItrer83OcRPXUOgkf7EFlW4VGlKxdh
         Ibu8s0eq8atFnKpxTif1E8wcf/K+m39TnPCWSxdLLek+ly/BYkiswbugga0oEPTHxpsq
         0aLlYBRgbYl8s/ZSMNb9ZITEEZ494ZrhiPsfXxG6KKufF1DcVU0B+j0htKw9QXGscyHG
         1HHHpGtDXP5Ie9+0fnY1zPNtuSAYT2zAG1Js2cHKYqmmzY+Pz52DZZlyK/Tuivj1tXdV
         b3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765595; x=1793370395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RgIg1l+3ifUtXqxbecqEIvcyWwa/dmFWxjX5pMBv2k=;
        b=0oXb8pEueT0bRNuf3Py7bMGQTR/EBMGOksLEhNeLq/F8goqzhhZMBdm/1Ljkg3HYCf
         Ib26hYrWO/BEluLv1er98g3uhLWO9dlbADtpuNWPAQbpPDd2uFgmGKrOwHXvNqK8JNgt
         +iN6Fchd02YljlDSytkVqRAjEVoCZdQYn6R45Q7kQSaEjJ4Ga/fRC+A0d8RrhqMAapkE
         3PvHY5h5ybQhjdK6n574Heds4PWw1cmt/A7So6AiV0BndM+BSQc7ZxwUmw74q2q6eR0C
         PNu+a7qLmxafJopT8B/onSbGUsc4smJufmBMDF4l1EgqiWrGKEmYJrONRebVC44J4svX
         o8xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJomBZn2iGxKkbijEV8IkG6XIRwNLOipOQ+xhls5FQ453oHJndNveVIaBYO1B/uj1IIB9W6ov25co=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWjZTdb68HL4KaysY3GFGlXNpHcvXe52dnPYt5RRZ27a1zY5Zc
	8lB8bZJDAi5EGJg6uAnqalIM5VcWna/Z27rK/IU4IusSJevkaeEOwW10F4rz6kDUwVU=
X-Gm-Gg: AYBFou0KJGaNYIj1l8GRv//6csaMiWBwVDSJ+Y6u6K87QDEG98GLiapNyX5a0elKDVs
	vv3xuVWwA/w0zzm3JoCt3zcYeBV1V0B9fi6cI1Pqr5Qyl9FT4Km0bq7P8XLMAWKgEnc1O8HpOiA
	M0+lGr5HXf5N1PI/he1XohOfvQljhS16ptgn9yb18cNkwgNKmI51J7F/YDtJ550nRm7iUK/Jc8q
	Z81qcvl34ZVVaMcWvqN1cl153joqHiEw5hephg4VPwpLH8AY+Cac1NfS12C58A66HDHmnAlmTN0
	CGdz3CiVyeq41ZPGzHPPcaslPrzFHfgr5u42DEfIU0fDY/PquRTfZgOumMPh1vo/moHQbOIHEj3
	4r7awvUEEsNLBvCXGwRqBY1oGIn4nVaquFAPKaZ8oYyGBDWVenHgo6gDTSqofotULqthDc44C6z
	WfZo7jtZPojiSZii5NQ8fqxWfPCGLhB3+SB6xxOyQrkdbfSK859hOvddb1I9QDaMWqSjjzeCyd+
	g5DyeN8oaSe+2pI99CqG0YPZ0Z59o8vHQnSn7ockZrlb3TnTzXZv/jwW9vxEKcR5x0xlhj5ei0A
	i2Ng6DnXk4sg6BYh27hD1JcAU9LHkd1VRgU1Zw==
X-Received: by 2002:a05:622a:5b93:b0:535:a5fa:ee02 with SMTP id d75a77b69052e-536c2700643mr30249831cf.66.1792765594917;
        Fri, 23 Oct 2026 07:26:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c18afef6sm17177241cf.27.2026.10.23.07.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:26:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKGE5-0000000GjLW-1mzI;
	Fri, 23 Oct 2026 11:26:33 -0300
Date: Fri, 23 Oct 2026 11:26:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-coco@lists.linux.dev,
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
Message-ID: <20261023142633.GF3977851@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
 <20261022184313.GD3381610@ziepe.ca>
 <attZl_0TNMDLgi4U@FV6GYCPJ69>
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
In-Reply-To: <attZl_0TNMDLgi4U@FV6GYCPJ69>

On Fri, Oct 23, 2026 at 02:58:33PM +0200, Jiri Pirko wrote:
> >> Jason did some nice handling in the fwctl stuff for
> >> device alloc and hand over after device_initialize()
> >> (I've copied it into a few places recently :)
> >> 
> >> I'd like to see something similar here as it made
> >> it easier to follow lifetimes etc.
> >
> >This is really at the wrong layer.. Attestation subsystem is the lead
> >subsystem, it should be allocating the struct device memory and the
> >driver should see the typical
> >
> >  struct attestation_dev *adev;
> >
> >  adev = attestation_alloc()
> >  [..]
> >  attestation_register(adev)
> 
> Er, the driver would call attestation_create() which will be a wrapper
> of ctvl_create. The reason is inheritance chain and each parent being
> passed info to and doing its own init()

We really want it to look like the above so we get proper container_of
stuff.

struct driver_attestion_dev {
   struct attestaion_dev adev;
}

driver_adev = attestaion_alloc(..)

Don't want "create" to allocate the memory, it is upside down. The
fixed memory ctvl needs should be buried in the attestaion_Dev

struct attestation_dev {
   struct device dev;    // sysfs dev inside class attestation
   struct ctlv_XX ctlv;  // ctlv instance
   struct cdev cdev;

   const struct attestation_ops *ops;
}

That's the essential skeleton of what a subsystem should look like in
linux, ctvl shouldn't co-opt it, it should embed like cdev does.

Look at fwctl for reference

Jason
