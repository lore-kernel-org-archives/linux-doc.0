Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022501;
	b=sV/Vr6M2QgtVB/OALfoEmWRCb7lQ2sMoeP7pprfYcIqj7KEX7k3wLikIsiGZYHfH8Oz5
	 mGuETYc0gLYc0UjP9EhFF353iRx173GTzKievmywnu6DNuJWVbz9JsOVDCtg0wAsKcCMO
	 5mwk/1aPO5LKyokm7WFVYMHXiIsiRWtIz5ERIvOLa2fLbLW+dCiCkSqg/Wk1MDTVTkzBU
	 ForjozhEwMi5PQ6nu47DQVkwsTDtStTcQ9SnlQF0RisoF/EGgii5H/1l2IFM5kiCtQvNG
	 X1SiJTk2Q8j6/X5D8B+Nzydb7DroRlcQToLS4Hz06OZi8FjCvLs0NCRADv5v2Scieyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eeiDIzKBgXHTvIB/FzTge64uqO1p8vq38QKemD1zDpA=;
	b=oY0FIoyJ/f/G27OKioPxwvil/mR53fKtBVWJNkz+AMIECP+nCEDbsuLzCz+/vlWj/E/V
	 30RuhMm0AKebm8QcxTRfyCRFwtmNsNqhtdDeyFcA0/AH2A6hDpRxGkXYd1v348appjvPX
	 nY98a7QiDKUfDcfTAXZ4cq/ujvP0VkulGRZnvmYbYmg/7CCcMU52YE9Gs/EhVO86vDhlO
	 QawUuqUKnwAvWQJtO474ogK70+0h+5tV2YX0HS26tmTAmYFKtP1xS7q7lIVIhKiUbJTyN
	 v0etsFaPQcgyrxY8GZAeKQNyCloonXus2+gG0ClUNY8Z5Da/SvPntc4RK2b6nAAbj+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2632606A320
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 13:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2632606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13421445e9.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793022494; x=1793627294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eeiDIzKBgXHTvIB/FzTge64uqO1p8vq38QKemD1zDpA=;
        b=VM8IYrnCNNqs45DDC5LE9lQowRMEKYE5Y/KZ57bV4yet/aoDBGlAsxJOmTRykOk8dn
         FshcS/W8j64dt0Mh5C8VdYgUtcsCto+ScQaOEpF+I1g+GJr3PKhwYJY8a9G++KZq2rIk
         fciASrl2LvGXd8pYXvHkATr9UTdfoqHxMbXc79S2QEtkqqFElfTeqUk4ffn+ZNgaeGe/
         nm24iy1xia1O5G3DOANrqIMherXJogHmuD48d2u+nc2vCUxcd8XNkN3ljWXSZqr8HlaX
         Y9o5gWTDf6GO67jT9mY+jbYN5IM9+ZXATUXh+KiGk5uTlXn1ZnpDB+tpDMpOFgjZMwAW
         Jg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793022494; x=1793627294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeiDIzKBgXHTvIB/FzTge64uqO1p8vq38QKemD1zDpA=;
        b=vI/qhkfrFjw/ctiVEvt+BHpcxkXAbwCvnXa4wIGseeS4FE/6sX70t78sIpL1ObztE9
         000N3vLNAt7AKWRySBEf8G4OdvNzdeuu95bwzyoWNc1SVpgT07wJE5KkzqWpledNNrHK
         aP1pUss5+Z2xgrx4S8QCGl/ueFY2ezb1SeD5cZcGbanA47dix1GpDyzyfjYozJVoojLv
         QSr/+SkNLwSWVmS/mPhe8rgZyenIb8YuFF1GXkTzcqGcz3UUkY19zqHkyxqVCPMKVSIV
         R8VlLvjJ9AQnD9z9YltLVC4Gs/mXgYIZAIV+CMcsoqqEPwWkDgGk+wMd9FfrdMCSjN8r
         wEDQ==
X-Forwarded-Encrypted: i=1; AKwUvByK4knus/rnf97w2UCniCU+ofi9nOahMKtvCrwhPYcJf9AOoK5HcprBZJ2yv6JlTJxKQ2LdTUDzlck=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8qTamQV1h3Zt0Q59RyDfPDfGx7K2apiuXOg16mNazOgoLINfQ
	K2spHwgpWnYaEG4FHCpop0436rb7g/43KXowRDz/tN3bhsuURY+sPLboWL53CUADBF0=
X-Gm-Gg: AYBFou3FNA+jfBiJU9REDf/PLsHU6um/gBxjIphs8xBuIsgWLeeaAzxMZpzEnuqS3E0
	b3aD+zUWTmdwGa66AQU0Uy4P+B2nkZTnjAj4brN5fDa6NlfcMS5aKzgUrPsX4nfIupaFT4ITdY1
	Hu9f8jSz5lz2Te/INrA0kgyq9Nd940CzUh+xcvav5HTU0N6/XWaLeItqGT7h6/IriYcJ2jhCDxs
	Oo03+7TpxB9kPYea+2YhkW/mrz99pEaBIKnGHgdNFQ69OwMBGagzyEarC9F74wO3mzsO4r4OP52
	KtXasbZtEQ/5I5NDCa6Nz6XQszGks4nieV8k+WVEvPSSkvLcqQGsBgFMwbE/avtmBJCYXdUGAAa
	4Yq+4eZtT/DAO1L0mb6pzXsERsD2d+mDOYm6h7xgHXzkCpRMIVwe0qVtM1K7PuNhfLaSLJaFLdy
	gjVabhQd+Eci/YAl5NDG3JOFf1dCDMMWH6ZW2wp/QJyhZrYdl3p1RAUy9Im1g+2j+J4ryoQqSK9
	hgQj0avjoVUkASk0qxyEiy2soHgbulwlHRB8p6VApV/P9SgYBpAob8E+fAvs79y
X-Received: by 2002:a05:600c:3d8d:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a35acc2edbmr104469535e9.33.1793022493724;
        Mon, 26 Oct 2026 06:48:13 -0700 (PDT)
Received: from localhost ([208.127.45.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a5ea0df763sm107133535e9.3.2026.10.26.06.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:48:13 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:48:09 +0100
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
Message-ID: <at9ZEDZl89V0jaJB@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
 <20261022184313.GD3381610@ziepe.ca>
 <attZl_0TNMDLgi4U@FV6GYCPJ69>
 <20261023142633.GF3977851@ziepe.ca>
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
In-Reply-To: <20261023142633.GF3977851@ziepe.ca>

Fri, Oct 23, 2026 at 04:26:33PM +0200, jgg@ziepe.ca wrote:
>On Fri, Oct 23, 2026 at 02:58:33PM +0200, Jiri Pirko wrote:
>> >> Jason did some nice handling in the fwctl stuff for
>> >> device alloc and hand over after device_initialize()
>> >> (I've copied it into a few places recently :)
>> >> 
>> >> I'd like to see something similar here as it made
>> >> it easier to follow lifetimes etc.
>> >
>> >This is really at the wrong layer.. Attestation subsystem is the lead
>> >subsystem, it should be allocating the struct device memory and the
>> >driver should see the typical
>> >
>> >  struct attestation_dev *adev;
>> >
>> >  adev = attestation_alloc()
>> >  [..]
>> >  attestation_register(adev)
>> 
>> Er, the driver would call attestation_create() which will be a wrapper
>> of ctvl_create. The reason is inheritance chain and each parent being
>> passed info to and doing its own init()
>
>We really want it to look like the above so we get proper container_of
>stuff.
>
>struct driver_attestion_dev {
>   struct attestaion_dev adev;
>}
>
>driver_adev = attestaion_alloc(..)
>
>Don't want "create" to allocate the memory, it is upside down. The
>fixed memory ctvl needs should be buried in the attestaion_Dev
>
>struct attestation_dev {
>   struct device dev;    // sysfs dev inside class attestation
>   struct ctlv_XX ctlv;  // ctlv instance
>   struct cdev cdev;
>
>   const struct attestation_ops *ops;
>}
>
>That's the essential skeleton of what a subsystem should look like in
>linux, ctvl shouldn't co-opt it, it should embed like cdev does.
>
>Look at fwctl for reference

Yeah, I understand the typical flow. I just wanted to benefit from the
fact the ctlv has the inheritance chain to reuse it for init/fini flows
alongside the private structures allocations. It saves a lot of
boilerplate code and hides it inside CTLV. I admit, it makes things a
bit obfuscated for end user (driver/subsystem). I'm working on
conversion to what you suggest.
