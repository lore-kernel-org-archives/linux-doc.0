Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814887;
	b=FyjcfrZDTqoV6SM+b5e0gLgv8LNrrljd3McAC2sYccndCSpyXfvQTgCJMTjy4Ukix4/E
	 BWEMpUmnfF/KKMCePb0y3hfPgmj22ujOoUd4lovLAn4Np+vAoCI4YkA7ZYAbK/cmv8TYS
	 5WqyNHpSNxBFCC346BeIXf5SGnfcAiXzr8nrI5sNqXPo5gWQP+o5eDXHKSy47WF/4Te9B
	 yA7i/gADYj/VsVeFGI3aLSf9HuNqKuUcNr6IhVhjGX7CGowIt91Ind70Iw3OioYnZ5OSr
	 I3/Ou2WxrOocdtVLzFvsFIU4lTZvLgMmsMSfPUJ/GwpKxriu6fXnEIchQI02WFSfE1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=a8PVgr6ypDrmvyZQYT+mIAJLHr75TSjPc21F4dgd8gQ=;
	b=IHjOQs6zQvwJyYkc5AzyWBUhT0bqT7TYvn6oNO1iERgJgcT3F7cf+RnMh9qIwevrCPd0
	 9sROqY/aPnBMq4Sa3BlE5a5nq+3MSt+0lk5ANrn+fV5ABJRzCEo91rIRWTjm9zAf99lTz
	 t8kh3OrxZ2691QOv4e0li11+l5bhn1xjhKDqV2JeEBBEK7ncy1reNiHu3Nr0oR0EL8Bpk
	 nOP6uWCbYpZhnTHf7fI6ORzkvsE8higszI21bTgjSTx5OG5MM4oO8dykRr2ugnBed+0QL
	 PTgPWhP0AfBpPN8CvQlza+pTAvXXHHR6v9wr8j+6Y5N0FFr1SP+Q2zYI0kR4XgYxTEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=INpwrSmc;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A566606CFC0
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 17:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A566606CFC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=INpwrSmc
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f269e335eso111548185a.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793814886; x=1794419686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8PVgr6ypDrmvyZQYT+mIAJLHr75TSjPc21F4dgd8gQ=;
        b=INpwrSmcSZ3/FfNbUp3Zcr+7zlKzli+O6Uz28XKAuaFHCd6G1aFXVW+Kr3yO5Ukz+j
         ffDXRlN6wtFTSSL1fI87DbOCN5vN+Dc416Nx6rDo4BG87l6cEysDdTsz9/v6agED2t+J
         az1Qc3jEPHGJciuqX8c8qHkclvi7nCxDnvEXRAWlfbwS4b/tczJBghfuvNFFt5Sen/Eu
         CngVW0iXdQ5aqtzO5S5pQGC/GojetaWvMaM/79HB0aZi9AGJnQGdsr25FTscWCuemx6V
         59aB6uINYARVi1TbzM33RDdQMxcq9J/VGqC7mlwisFA76vBco1Plqb7SMZBj/4wLB/55
         +vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814886; x=1794419686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8PVgr6ypDrmvyZQYT+mIAJLHr75TSjPc21F4dgd8gQ=;
        b=e7mkTVYo46Fz1unET7tytR91bdOXoRu0XOITzm7oBFbGyfSSSzdleoDY62ndnmGIWH
         qwckM7llAKqZl946lpUoPFv6Y9j37hRW5JIAytHlGLF0sSOUgym+kJ/H/FEXUTggXNWi
         m9ipGv65W/ags+vIpUSUlk5wzqqFpLlDIwhjznFV3J5GVvHjmw8wBxu5zBqiDPcJqbHa
         5nLTXACBGqnW7owggJnGCnERkJHCf1byfKuozcCf+qpzUaJH7mrbcQ8w0o8Wpm4al97K
         zgVLtL7sOZzjGwniVgNu9GqrJTXqMnmKLS9mQhmfzii6jY69rCZ1xsBRK2xJFISevzoB
         5R5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5gw64fVKeijpq7QvM17P5yvyw1ATXInrAIH8fbXLxaHn/dtlR65cr8LpSZt/iYZMSNl/CEeE/d60=@vger.kernel.org
X-Gm-Message-State: APuU4Z88hvoTPj0EFxbE7yap3xA9P71oW+p8ac3/9R/UWXw4IowOwBl6
	w6Tn9kelab87pqUTHTvqL/xRFXaW0Frr42DqSNbnYipzo+a/Gg47SZgzxVxRo9HZWbs=
X-Gm-Gg: AYBFou2vz0vN6CIGtfg22Ns1YlE1y8ljLgQSrW16b4BIoieTEK5CUdoXzIZ7VQuZreM
	jqvBT9gaDM/FUPkw2DS3RUa/F9vdkqD20LtfuR3MhoVBJXZAkbSUyIFcVrMPUCLa2WMMQBXPggz
	GVfTjSUPOh6a+r2S0CE8rEQXVJXPeZBcVZtTPTngGwhsxwPr4lmtuJa2ilgO0vBbSZXTiA20Lug
	pWwi1OW9ZOfas5m57voMGT/u76qWfaCpMPgMFaW/aR+qkq09AoEXM5TYW8rSNWyy9jBQBtExlsG
	mMfgCCQ5FZYgIbYw2EsLoAY3WM8gGMDuJphmlA8DyciDfEh831mq281Yb1amO34gbsAez63JKip
	KuLkDnVTKp/86BmlbdkYOVJCNI4ggCu/Rzdp1tPFqNBvukGdWZcrGQ6VYRBGPCW9L0k+ZSsuMxa
	3X1lWYzg155eV+LhQHDzeJr3bYA+mBZmkbNx58AMmXHh4QjVmNhj9hJoyn5ovzIXFa6pcHoVniI
	Z+WnwvUY3ThmLf2cKcZD3YR9bMaP39+PPYqbd5Qk6zPdwmrjPUfKzOMeKp2kfCPNbEQmQyS3BG5
	UzsfzZyVZZ27wv8gu5YcCprEdoSp99rriF2gHtl+0BMM8iHgHoCOQ1+xif6+HOtRS8IuyFVAf3c
	DWCiQ7GxP2w==
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr2702179085a.40.1793814886203;
        Wed, 04 Nov 2026 09:54:46 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d479a7easm257041185a.12.2026.11.04.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:54:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOfC1-0000000H1Y6-00br;
	Wed, 04 Nov 2026 13:54:37 -0400
Date: Wed, 4 Nov 2026 13:54:36 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <20261104175436.GZ3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
 <auSxxPM5z8BzgNm3@FV6GYCPJ69>
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
In-Reply-To: <auSxxPM5z8BzgNm3@FV6GYCPJ69>

On Fri, Oct 30, 2026 at 04:05:13PM +0100, Jiri Pirko wrote:
> Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
> 
> [..]
> 
> >> +
> >> +/* attrs of group cap */
> >> +#define _CTLV_ATTESTATION_ATTR_CAP(_attr) \
> >> +	_CTLV_ATTESTATION_ATTR(CTLV_ATTESTATION_GROUP_CAP, _CTLV_ATTESTATION_ATTR_CAP_##_attr)
> >> +
> >> +enum _ctlv_attestation_attr_cap {
> >> +	_CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = 1,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MIN_CHALLENGE_LENGTH,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_CHALLENGE_LENGTH,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_TOTAL_OUTPUT_LENGTH,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR_FLAGS,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_OBJECT,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_BLOB_CLASS,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_FORMAT,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_REPRESENTATION,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_LENGTH,
> >> +};
> >> +
> >> +#define CTLV_ATTESTATION_ATTR_CAP_EVIDENCE _CTLV_ATTESTATION_ATTR_CAP(EVIDENCE)
> >
> >I feel like there are too many layers here for a code generator..
> >
> >enum ctvl_attestation_attributes {
> >   CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = CTLV_ATTR(CTLV_FAMILY_ATTESTATION, 2, 1),
> >}
> >
> >Do the intermediate constants add anything?
> 
> True. I originally had it like you suggest, I changed to enums to avoid
> the explicit numbers. But you are right, does not add anything.
> Changed back.

I was also thinking that having the explicit numbers makes it more
robust if someone does backport. We should try to have everything
explicitly numbered in these generated files to prevent subtle errors
like that.

Jason
