Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372720;
	b=tVarIFhkXCQqBMozkuse6iLPrzM9uhWUnP+VzYATrVD2uYf7/RhTbhG6p+Q6v8RRKkzp
	 /8ecDAhUO7h6/oACeTlVP3m0ciBbbsN0OeKgC6DHnyTans2whU7BEMmC18+rrvvtnEOuK
	 XM8ULBj+swpbvZjJultQYSJlvAXSI1lbHEyiOBZ0W/powUldkZMoNti27iyDb955c+aaM
	 Q+vzI4VEl61u/ESQQqC524VRKwpncvedr8WNMsdyFAyxrJvlyrnckLcLEONz+Q1pLE4eL
	 oGNwGFww1ZDM9h03TftuJ6ferthIMK0g7X34BopPNWg+3gqCHYpmHJVZJqJWvPuuEmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8skhpE8x/+Won6i3+XD12raNMCS4xOoCCKoDLeKTESk=;
	b=yKOVGY7U1H0Dk9uIUP8N9q5WTqBE7Q3+0sKDVLna+rlfd2Vwkajo4I+QACE86usBmfht
	 1ujptQGR53DYoTsnjnHpqsfKtTPf+x5++ULvtlyxe4BVK26a6ZPYEmq00hSuXzod1zbD/
	 mKiTKnTJ6JfjH9+zBsPzqI3KpTDh2TvgyyjECvkyK+sNNTF3r1RH5BSKAJ6mF9H5vmyQa
	 k4AbQO+BWT87keHPLIF1g3VgD3LTxUmLYbE9vj6VeUAeobXLgKGQDScJNudY+K6XoitZA
	 eUm5GKpGUaw/E3XyGHxpyW65fr2NmaRkwesAimUrAOXL0L4EN/es2/zywAE2SuqqjUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=czkACChM;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E454F606A31F
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 15:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E454F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=czkACChM
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e10a70540so525315f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793372717; x=1793977517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8skhpE8x/+Won6i3+XD12raNMCS4xOoCCKoDLeKTESk=;
        b=czkACChM1Vp//qoKfk5C/DvEMQvaO2yxTtnTnNrUz1iZrGkpmjYA7sRpCOkiK85OR5
         DKyVNu3yHScYnpTV8mEyNjy0GM6AiGkEY+yqMV2kwhj4nogM5hBtnMNrDyDvhJfUP91Y
         2qLHj18b3y+ItwylHnK3AxAJpQcnWODG8q5TOy1izMOxysmu/gE3PBKDvsyiMMeYHPdN
         L37BWcbW4GBGw63knHhhcjI2CyLf8W45aZwoP+DUdcfn7pfklTtyoTc13Ps5EzD68ze2
         PhwKJwRPpHLlcw1quPe3gfGrKyhVNOtKuxcCOGPE+MqRlL4wQREaJw+p9SN5GR4rJNeH
         4qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372717; x=1793977517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8skhpE8x/+Won6i3+XD12raNMCS4xOoCCKoDLeKTESk=;
        b=AmJibpNOwpzo0PtoWjPllMyrO4GZmI5NOWg/tx2Cm0yHWN+iZQexwCSUZlS5EoaXrU
         vs73JA6nDXjxXPXcvVnnA/1WPkAz0VW0dXYWgTrhIMZErsTto8JWfOacAD1FKqWqpVu7
         E0Vxn9fWBBci4lmCGiXj3dG0N0Z9/hrGrKeiCGwcrOi0E/IhuoTnh2mrVAwNuanHNz3p
         JeKlFYOlx1FltRbOlFzFHzxTzYZL7kotewN8oO0Z4tkzUFQmZ6QqezFvUfvCiY/q8hAf
         0jtYINUa98gWMWIrpBJ8Plew2og3j1HPpiKqijx4kwVYNbi4gA50LlMpZbzUglzq6EXj
         nz/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6JOvRQXpwt3J0qLjRLOgatPbxbv87hvxS/YAm+ORKKFSxSilvdZ/kHtAbU5Pa9ZV2aNzlG05gL2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtqLHQTbkVM25bhHKdox+3ZjnYDKsplsNs5+MCcau8D+1kZ4jS
	RFx2VKhgUHdP4Hi8UMcdXTSLL5NHjwjEViYXVRFLxOTrYAmkYnjfRCHmxBM5SXCnbFQ=
X-Gm-Gg: AYBFou1Pwyb6tdWZ5XFY0G9H9v7OCR7OuCaOSDESjoNqGNyvbTP82cUqh+j/9jxM2Rh
	fnXZUWtH6YgV+PSwVm1EkAmsbs94jB+7Kc/qJO58oWNvGyFk841mUa4DaxMM9su/jCv3QeEkqrj
	rGw6v3esmHjJRWZmGzQ4Rly4KHKPdOFusTNg5fnrL9o33SJjJvATLPqSUNMT1ncvRFfmA7EMG+I
	CJLTe5sxM256uf5By1Ukfob9Iqs0vIQP3XdjDCm9bmRK3BT5aHmrSAKR/MDU3c85TkGlVYmOVvN
	j4c+BSb6Qpc2kowmbOb6Lpz+uAxt5ffeEDMxy68zObzFqf1PYDacdBPHAhbv+PgjzE7DJPavQB/
	oOo2+I5Muc7hoR72bczLIUZMurdPWhLvYiFEudryCin5whO8gAFn/YyibVrVRSfswBEj50oivmj
	HxYXZ1XhhrGsBnUaSf0b/8KBDnPwp2f2QdeH3bQhnuMLaO7Sq2yU/pvlEgECYKZdFfFvsFCEGqW
	whAQ0roJTLWTntrTJBmviKpGARXsvfzXE+FO8WOfALw42ELcF1YmWRmFPC4UNQStpFFgN0hSrr3
	SpLpYh6hLBT19KO+DsT7wyXe5CSRJxeZzugId73/
X-Received: by 2002:a5d:4ec6:0:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48e6e3091c8mr5024505f8f.36.1793372717264;
        Fri, 30 Oct 2026 08:05:17 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b77f06sm3716923f8f.21.2026.10.30.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:05:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:05:13 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auSxxPM5z8BzgNm3@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>> +
>> +/* attrs of group cap */
>> +#define _CTLV_ATTESTATION_ATTR_CAP(_attr) \
>> +	_CTLV_ATTESTATION_ATTR(CTLV_ATTESTATION_GROUP_CAP, _CTLV_ATTESTATION_ATTR_CAP_##_attr)
>> +
>> +enum _ctlv_attestation_attr_cap {
>> +	_CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = 1,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MR,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MIN_CHALLENGE_LENGTH,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_CHALLENGE_LENGTH,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_TOTAL_OUTPUT_LENGTH,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MR_FLAGS,
>> +	_CTLV_ATTESTATION_ATTR_CAP_OBJECT,
>> +	_CTLV_ATTESTATION_ATTR_CAP_BLOB_CLASS,
>> +	_CTLV_ATTESTATION_ATTR_CAP_FORMAT,
>> +	_CTLV_ATTESTATION_ATTR_CAP_REPRESENTATION,
>> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_LENGTH,
>> +};
>> +
>> +#define CTLV_ATTESTATION_ATTR_CAP_EVIDENCE _CTLV_ATTESTATION_ATTR_CAP(EVIDENCE)
>
>I feel like there are too many layers here for a code generator..
>
>enum ctvl_attestation_attributes {
>   CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = CTLV_ATTR(CTLV_FAMILY_ATTESTATION, 2, 1),
>}
>
>Do the intermediate constants add anything?

True. I originally had it like you suggest, I changed to enums to avoid
the explicit numbers. But you are right, does not add anything.
Changed back.
