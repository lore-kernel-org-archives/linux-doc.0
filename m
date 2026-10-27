Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096471;
	b=0kAeQKqfRPffS641dhfmtSof9+0dwQ/Y0y+ikBMJIxv00L2lC/TPbS+IYYTigKjP994H
	 +PeA+AR1CPwGbGilb7XLtRkazAUzgBZAnZRWCVXm3DDi8EbFYl0JSydCi7xo2bGbXf8IV
	 pB+i+SWe3V0Da/+UryLI58J8PrPdphkILkIWu0igejzHNHTNx4+vO/2LdANpNVyBhNVv6
	 1+dmso1B8u4lRUMxjh6z9q4wKww9ZUbZJqnISTNUoVXVrdAKDN3ZUfknzkmDuDLDpKwIK
	 hjdfuU8H+y3My4eXcqnFKkXtdu9XXX3RKpPB0j/IoMcCiP2JDLoRPivsH96kRjmDLMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UcwPjZxaDPQUX38SRpQk0U6z694ngHdtvb+qpNBNolI=;
	b=UW77ibVhctBp1plpaHMA6gbEXSFWdDHuqE4ZB40AL+R+WNTGZ3nW7bm6r5aUXFzIIddZ
	 H5OfViaoqYcaXSZYX8lGT8V9tqRpGRFDVR30i9DXeq7wxPflB/byUY87mQyBm58L7Vo9U
	 LxIlZBNsFE2NvfxId+ih1K7sLawHj/ZUOus6Duueh5P8Kg4yGQ5/x/r0h7j5xoaexqMMJ
	 vF0ObdGBpR/gOVUHCS13TttENEYUN1hwKIJC1rXBL+XdWXf3rLgtWcEVj2nYH82aCr472
	 vNWtZoGn/wqkYmnJkLjpHtqHgJWJcg2J4NrRwfKMLVeVpjDWHZ8LbrlqgUbF+L5qfyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=U+w+DA7T;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F39606A31B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F39606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=U+w+DA7T
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso2796829e87.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793096469; x=1793701269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UcwPjZxaDPQUX38SRpQk0U6z694ngHdtvb+qpNBNolI=;
        b=U+w+DA7TBbOTsHJ6Enxe39JVFHvrncv5jY+jSoyIQ2z35qjZXvHp3LNnblKOrPL29A
         y7RE8O/DkYqgtM6po8VciEwy++8yrr0fF30EYhF2VKGclIBsioakCbCgAaR3HRFnnwZB
         fNYBW+FeTixill9nrDRoI+IpNCTqA55IxLFeHUBlMQlaa8qrSxKDiIACxU0UkJDj8UMh
         lR0on/o9rFsPmneK/FCtabwWiYP65MsxMx5JUTisdHYPgy2j9M05xRVHhql1vdZyRtw4
         WoBKFMRyWdL7bNEs8rMdYK3MSTXgnm/TWIMlL9+E1AX8il/kxYBgNEFH0Q32f/iPJK2Q
         TN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096469; x=1793701269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UcwPjZxaDPQUX38SRpQk0U6z694ngHdtvb+qpNBNolI=;
        b=0lI0j7Ul/Sxnk3jh8dVMb0HG8mGbcTPaAEAJf/iHlv58t6FGsA73q9Z5oPgq1vjtKL
         Yu6aWy3Xo1D9QqhyPOn/hsILSp6NBfO49rxdaTSV22aSW7Sk8YVGeexU2QpyUmLvyr6W
         18LUgFonlqhFuu8KQtYrcTF8pf7YYEOMVDkJoehVtmsVbriaKPUztfb10YClWc1JWtQr
         y+2BGsv5VQJG/axLZcZGsitS4hJBH0eKoZ/P2Se/Kt/KzwIHYbE3AyxgY06i6aiYDF5T
         mhGW5vX1L0QwevKVkPFvj59T3BP5XC8SmlxFKGYeVMGmd8dB9r2u3qnsO4vB7eJQ7W/J
         SGSg==
X-Forwarded-Encrypted: i=1; AKwUvBzRoK47vAWt9dTxtfD+FZhJdF/iEjsj82rMLBBs3d3sZeaAvbrQNE1/uYFaYeY67C0eU2mZiBFjJH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKcUJYZuhK1hxPaRPAFrqJ/6hdb1l5DEw/VRY2FN1rcIH5zWyg
	Gq3bpShoOHZH5M7IH2AaloBSJJGTthMKY+YvQUH9t7xSjGRfTQXVx12TCJEY6/sQzb4=
X-Gm-Gg: AYBFou1suBgaVDA7ZsxkCPPYbKiwo9tGKsgIHBlNSl7aov7MVhuuZJBabfciqiL06Um
	+dt/7VC+KNqJW2ojW6DsB30GceVI0ryzWZKsm3QXhx3j+i5v3Kt4UL2GaABvd8zPNX2E2PflMm+
	GP3zcp4+Wum5M4qodNpVZ5h+SP685wYxiPD2GYNfQoCyFXqAJktnOB0k2eo7lICUDtl8L28d9+4
	xc00A2zQWN91CrJP/lZihpeu3Bqf0rQq5q7h+ExgmBCnbZ7i6JCRqgHVxlNw3ozrm35TCCI1Fvd
	Mtq4e/cohSyJTYuhcT8y3+6MhAoPkJZFAwBa3td+qRIGJDORDbe/6B0OnHndiWF2I7jUjBLUSCw
	uynKinldm8Eh4thl75u3LAJsN2qrf1Ce/2dSFe9sK4vZmE34GTFFHPK6LRkO7Dg7TOAkmFRyXUw
	DThXKNXgBrmL/XunNS+cC0hwI3WidA8e8kvytSEcnssjn+k/Q1vaRxxp+pERLovSayfYPqFTpGa
	xboEpjOoR3QuP/5w+w/eLXts7glapkye/9ujvRQY47qS6Fzl2P2z0RaW3dVVtN7
X-Received: by 2002:a05:6512:2211:b0:5be:4d37:3bc0 with SMTP id 2adb3069b0e04-5bfb71fe90cmr3245577e87.62.1793096468475;
        Tue, 27 Oct 2026 03:21:08 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6aca4sm2051901e87.15.2026.10.27.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:21:07 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:21:02 +0100
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
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <auB61re2C6eN3BmW@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
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
In-Reply-To: <179302367452.58760.11808905856343064399.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 53 lines skipped ... ]
>> +/* A cursor packs the record and member where fragmentation resumes. */
>> +#define CTLV_INTROSPECTION_MEMBER_SHIFT 48
>> +#define CTLV_INTROSPECTION_RECORD_MASK GENMASK_ULL(CTLV_INTROSPECTION_MEMBER_SHIFT - 1, 0)
>
>Use genmask for everything:
>
> #define CTLV_INTROSPECTION_MEMBER_MASK GENMASK_U64(63, 48)
> #define CTLV_INTROSPECTION_RECORD_MASK GENMASK_U64(47, 0)
>
>	pos->record = FIELD_GET(CTLV_INTROSPECTION_RECORD_MASK, cursor);
>	pos->member = FIELD_GET(CTLV_INTROSPECTION_MEMBER_MASK, cursor);
>
>	return FIELD_PREP(CTLV_INTROSPECTION_RECORD_MASK, pos->record) |
>	       FIELD_PREP(CTLV_INTROSPECTION_MEMBER_MASK, pos->member);
>

Okay.


>> +
>> +struct ctlv_introspection_dump_position {
>> +	u64 record;
>> +	u32 member;
>
>Maybe a comment describing how record and member are encoded for each
>of the users?

Okay.


>
>> [ ... 13 lines skipped ... ]
>> +/* The immutable root-first chain always has generation zero. */
>
>This comment seems out of place, it should be closer to the 0's it
>refers to a function below

Okay.


>
>> +static bool ctlv_introspection_family_record(struct ctlv_cursor *reply, struct ctlv_cursor *entry,
>> +					     const struct ctlv_family *family,
>> +					     struct ctlv_introspection_dump_position *pos)
>> +{
>> +	const struct ctlv_family_schema *schema = family->schema;
>> +
>> +	if (!ctlv_family_entry_start(reply, entry))
>> +		return false;
>

[..]
