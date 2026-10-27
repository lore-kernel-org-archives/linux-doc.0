Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096254;
	b=wX3YVKZZVxl5+h1aedy0zDuUgIvXcd+mJl6T/bPx2HMlxhjhy9FUR/A7ZzB9oGtjjbnd
	 MVpDq2jDZTcosEy39TeLKshEoYzpEQzdx6UkP+Mv9Brl/xRFgkty4A51w8v07svOlsStW
	 b+NqMaQGu2Cp7Y5XmAnTgTtIwlfops5qcrD92SYFUgCoYHCkfMDOQvftMTJwgV3AWG4wG
	 ePxhbuwh1ITckli0E1g2XwKzzT/xVLh92Iig1fX7+/vwhWLvBq731ow38LZgQ1Tgeoem6
	 bmiUQMATmIWFajN8lMRnvwehvJCPpZDZyqafDKOQmb7fHjXsp+m9S2ukv0guI72lvQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ROl8Z/DFaCJAxQvsLDCIwxAYaCdKritEmYyIuCU28LM=;
	b=hyPD9YX8U0LobKk9772tM2Cs3WrJVOvX8gA1xBoyb+qLQTYVAT66u6vi228QaUjFWkAn
	 neBAGoXq2SVwyL11/NE8p4nqXjd9fo51FVFeBbMjfvAUiQnnierhcMTRolq9qhnAhsdvk
	 XDVYbGPef5KLC7FsprXFVb+qXhWhKSr+c0ElRTYTuN8CLZY3O19iz/H+apUvnOjrBIeFu
	 /Jh+SjwhUhBPmHUU9F76NSHqcnBTRh7KKh1iue05qIOUcYBsfQ4sBGY2G+ZLEqdD/wzLJ
	 n2yHyVFChge8qsOZn6OcAOD4bp9948jfFNq/+dmwWsWOA0Go46ta7a7GA091xY9pfuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=fmA5ZVtw;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13D6606A32A
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13D6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=fmA5ZVtw
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so37708335e9.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793096251; x=1793701051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROl8Z/DFaCJAxQvsLDCIwxAYaCdKritEmYyIuCU28LM=;
        b=fmA5ZVtwVJcNE/fAKAHqsP3pTMhIMG/B4/fp3GRzy6U2KUaRfKgSPPQRO7kH3SZ6uV
         l+fzzhfmGr9Mctm3db6DzPN2NeHVOu5pYzT1nPmjh7/grQz1Dup/ibheJflAfN28BYGt
         sbIOe1LMk8vFbragFHLOaRICCrM6OPu2imRyfnGBgaurj8ZgT/B2EU27xE/StHY2p3vI
         0FtODpcVTVfduuEmzZ206fQ1o2SEoqVEe0oCCy1muVMUaUmDeCS4IvdMx8Y+6Yayv+xv
         4MfvlIyEMIM0RMDLyW4wNgG61M8b27rM8mXK+xBP7O+Jx/KNHvVSN9NnsB2j6/T8iqaN
         ieig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096251; x=1793701051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROl8Z/DFaCJAxQvsLDCIwxAYaCdKritEmYyIuCU28LM=;
        b=JpImt5drDhWWoloyQ6vJMkE79CIpGAJf5OBBXEGAvqkzbeRvTXiTsPMcp8EpI5GWc8
         MvZe0tdsqc+vxV/EoCxRbKzYQsMlWU91SOyrimcOWQIBAASFey9tjFcGOyoYRDd0v5im
         Nn+bhc/KWgdaCSbCeaI3JFX7kbyNCH51P9ZuiDrv4Ox99l4VXItPNTuMI5i4shUdRLJr
         3pr5t4dlWkTXQP6XvKX7uc3RFesa61praDbOjurFmeoUUffDixTA4nnkV7s63R1kR6CA
         TSmcgdMST8tQ1nhX1hgtkUj5ujHpGScPG0jFI4H66IIPNyIIikunSIRDI73Dw5nMkBno
         NCBw==
X-Forwarded-Encrypted: i=1; AKwUvBwWwtLAG19/ia4s6VUpLx6HQ4s6GN28/NXsk/h/ORAC5VZXAWIwH/V1+jR/ADFGvRsDEcOkFzLivB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwUyjn/3npZu3a2AFtiGMqNi4PTBQe+C00fGx61cRto0yXcJeK
	PFY8R3uPifD8ogPY76ELWxgUrkJW8kjWD8K84N7Iop/Hx5nwssQRbA5Rl/OrLE2b+nI=
X-Gm-Gg: AYBFou1OgEBkBttC3a8IItRNSdp10qCXSmgmZl/xy+E056htyIw5LYEpHS65COyAS2E
	W1URBEKnG6uFlgqhZrttg/crzw+KZ6T4D5UbpSbxx01CNAaBfZQCsTTjTAwB6UGLIytD+FCBQ8s
	Fjwfz1ej97mfodXUWdOTPDFQrGO09BLODYDJV4qjtox1ELDP2p+y3cmGVr/7f6NUbnwS07FiDOy
	i5Mv6aPzEAEUlj+06o2Vk5z9V15c561T9Fa7XH+k5VpeV9h/F0w3uVeVTyohuAp+6urTzdRxWk3
	vkU7IvZjMYrIh15+2SNBa9IDBc9pvtJc4T+7AhsTQ2defxwtLlfev1QVgCtHOZ9viw3ssY9aMc5
	X8Q7Jb0PiVtjN2S+o1FFfxhRkdDrbV+yKiIXj9+nT6FsABbosfEE6TNFPTzeZr8es9NHgsIRynM
	tQ5+LG4h4TVAjjjVZZga2qeWV8tJmIIYkgFBqL28yo2p4shtnyvTjpibzpcrdrwWzw5hAsifkd6
	TbRyWUSse3zPPG2vIcRjujG7brHRrgtIVI0NNUhixwBl+KQonszXrCc+Jp2CanX
X-Received: by 2002:a05:600c:4704:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a35acc2ea1mr170116035e9.35.1793096250940;
        Tue, 27 Oct 2026 03:17:30 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm271453735e9.15.2026.10.27.03.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:17:29 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:17:25 +0100
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
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <auB5yxcuA50kg5x4@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <179302367449.58760.13616210130636541456.b4-review@b4>
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
In-Reply-To: <179302367449.58760.13616210130636541456.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 38 lines skipped ... ]
>> --- /dev/null
>> +++ b/drivers/ctlv/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menuconfig CTLV
>> +	tristate "CTLV character device TLV UAPI"
>> +	help
>> +	  CTLV provides character device UAPIs described by a checked-in YAML
>> +	  specification. It owns the character device lifetime, the strict TLV
>> +	  message format, request validation, reply serialization, the large
>> +	  payloads a request describes rather than carries, per-open event
>> +	  queues and runtime schema introspection, so families only implement
>> +	  semantics.
>> +
>> +	  If you don't know what to do here, say N.
>
>This should probably just be a simple selectable config instead of a
>full blown menuconfig. ie one with no description. Since this is
>really just a tool for subsystems to use every subsystem that uses it
>should just select it.
>
>So:
>
>config CTLV
>   bool

Makes sense.


>
>
>> [ ... 159 lines skipped ... ]
>> +static bool ctlv_message_nest_index_ok(const struct ctlv_cursor *nest)
>> +{
>> +	const struct ctlv_message_input_index *index = nest->msg->index;
>> +	const struct ctlv_message_input_nest *indexed;
>> +	const struct ctlv_message_input_scope *scope;
>> +	const struct ctlv_attr *attr;
>> +
>> +	if (WARN_ON_ONCE(!nest->msg->request || !index ||
>> +			 nest->index_nest_scope >= index->scopes_count))
>> +		return false;
>> +	scope = &index->scopes[nest->index_nest_scope];
>> +	if (WARN_ON_ONCE(scope->nest >= index->nests_count))
>> +		return false;
>> +	indexed = &index->nests[scope->nest];
>> +	attr = (const void *)((const u8 *)nest->msg->root + indexed->offset);
>> +	if (WARN_ON_ONCE(attr != nest->attr))
>> +		return false;
>> +	return !WARN_ON_ONCE(scope->tree != nest->tree || scope->node != nest->node);
>
>Maybe wrap these invariant assertions in a helper and we can compile
>them out?
>
>  #ifdef CONFIG_CTLV_DEBUG
>  #define CTLV_ASSERT(xxx) WARN_ON_ONCE(xxx)
>  #endif

Well, yeah, that would probably make sense.


>
>It helps manage expectations around WARN_ON. I assume these have all
>been checked to guarentee they cannot be triggered by users space?

Sure.

>
>-- 
>Jason
