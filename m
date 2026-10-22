Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694390;
	b=hyjVviwCGF6YdmD289XYtm7275mXL7lZ07071HbsRmtEDtwYWXxr3y7xt8+ro9ROxdII
	 ymBJ8wurxJfUuCJlLxgNVn0w8ZE0Xzygc5MDoeEEdTdcmZQLFUX9jZjTv4dGvJppH2cBj
	 gQeES587BkRfsmO3dz/VImnpLPdCVIt072Q3asVC9gIDw5agpADqQu7ht7GAc27vgbEbN
	 lAdfGQ9ADrqpuui/yPvL1J6JzT++sbhiUkNF2VxiIqwbRVB1b8jDdghUFqV9q/EUTF/qq
	 7Exwljt9rdJMTFwpRXV8OthFH3fEdEZfNJe/UnjZfIaNa8WQwtPjL8+fC7I3ajWzDHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6OyEIFFGQJwoM3H+g7NU0Vj1plI2Oe4JZLflWIJCYwE=;
	b=bShuNJagYVQegcehCfKSkBLziPh0tKnECPm1C891xuURxVzB8Adp/ecjhCGYM2epth1m
	 83w8Y/DagRhnHtMvb3TAw8Z72MxczTklRCPukLjO8OA7TVnDOhs90xNabth8ZderCOFrS
	 Lc/1pSpOkpwCh9J0LAwhnUblEEyrW6ohPNsVICK1HYH6/6Ice21qLVmHqNtiMzbXoO8f/
	 afXbPueNFEw7a1FX6tjqv12XnS/iLQ+Jo4JW+IkvKa3286qHiycwRO5rMgNqJH3tM8CwG
	 vDI8wgZJiwXb9VhgwY/NxB8MlbQhu59Wd/c5elwzuR2UdYB3PuEMKKz2qLLeg5QCe4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KHuMy0sZ;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DF606A326
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 18:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D4DF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KHuMy0sZ
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-917b78dfe30so2806596d6.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 11:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792694383; x=1793299183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6OyEIFFGQJwoM3H+g7NU0Vj1plI2Oe4JZLflWIJCYwE=;
        b=KHuMy0sZD7ZOI2sSxUEZc78TXFyK8CaY79wWRvg5gbf1f2MF53i7eKzHp54VCzTIp5
         xWKZP1zwsNiEWUau24i8KBu2EhZnrlozJiXL7jschM5mD9V6HP6UzOwpwUigeemLbuqG
         2uX5eesUhTVTe3yiJMtEUH2rAwxHhZQPM2Q65xGSSUhjSBNHoWcUiwXd3gQ4qt1G+nml
         zvDmKIjngDDacFbxpApugajGRtJn1poOEZl/c6h3/yA9ZyjYaLLxk7Kl8ePmLtWp7h+K
         PSV/i1A+yg2UH9c0P1A+em+71uwWcsUkBNx+QuE4xflfqek14/yZRT4/z7srKnMPim9G
         MzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694383; x=1793299183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OyEIFFGQJwoM3H+g7NU0Vj1plI2Oe4JZLflWIJCYwE=;
        b=CsvmseYJomUK1h3zDQRifQnqheezZEU345eWNnTgiJ07/F6WpQMCGdfY9+e5qYLo9M
         cWDv6x/6YyKwGp+54JH8aMF68ufelQLe20Df2feMewxuCICvZ+AH8e/iUEMOxpo4kpbW
         2w2VqBytOsABnBybwQVS6xEtcDApitQLOZltD1chD6vlrLN+//MhNQinMjd4GDJ1bsWo
         lvih5L2QqDKt91KLtS8acW7IOQPFlVZ9Ri5AgjZFKdoba3vGAqtWivPzYwVCsvbshNYU
         VKcakIaz65Y68eTEZ43vsF4/4lQnhDJ9do5Mv7BKtH59b1947+9yUtPtZAirxU2tgcB6
         6xkA==
X-Forwarded-Encrypted: i=1; AKwUvBwR/gJRnMQzF1OJCeXhAmFgrw6Njm4/whdKXIjUAuZ7hnxR3OiD7FS1NUmZocSp2VlidfkP12uU8p8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB+Jeyww1A/LKA+sB3E1IZtq3Atix821GpSSK1FJaJjnuaFJDx
	Y+Ee1fmbBoKDDaMqiCaNXRdN8atyCzqWbsddD46sbj2b2uKMOtp46MNZ8BnT4sb1gJc=
X-Gm-Gg: AYBFou0eA4rc3LiS0SOgP2akI0cbNt62oIeirRb+w+pnMUVIvrkpjES2qAVH2gTS1HD
	vDEKHJszOpthcVD4PONF/MOBpRaFE3j4jr188J+idwVF3WyHIvfX8nkXS4K3Nc85rvRhP7Z6NPK
	rZ387RcHzyt3ocdp7xu6RoN8yiGYF8TTqCRie7uKLJ2jIsptsLpV1Clg4U/qYwoo3BgVzwU1tEa
	0+kIMRex13jM6zGC2CN9hNBbbSon/jIvUw2m9JWCLFgJWAbHO3ncuqgGOWb1hhEMeKwPG21mBwC
	6ZSm1UGecV8chGZqtefG3OqJoKDTfEwtu78+R1IEIMCqg+H7SwZroST1s/+UFV0DTNyS+euUjXT
	2SKShCPQc//r1T4Lw2M1GFfsCeP7qnev9PFdj5Fepplms6QaatRfnMyD7z2R/Phn5nIxfEanTRl
	SxvrEzlOKrQMBGFro6tn5SQ2qd3yTeODe8oBFupZxf3eREMG3JLT+osdoCagGYL1/CnK6qc5r2a
	D7Gr992LCmPIbAneg8MMv2m9r1ckWtGNkBx82B6CfSgEJoEyc9M545GulNc658TsNm9bDGJDuO8
	eQXbBN9erQw3A1TCpeofFG1Xe3000Ghb20eyRA==
X-Received: by 2002:a05:620a:40c3:b0:937:d6e8:59b0 with SMTP id af79cd13be357-93f6f79bca2mr59757485a.10.1792694383306;
        Thu, 22 Oct 2026 11:39:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f6fb82a5fsm19367685a.8.2026.10.22.11.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:39:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJxhW-0000000FjFr-0C75;
	Thu, 22 Oct 2026 15:39:42 -0300
Date: Thu, 22 Oct 2026 15:39:42 -0300
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
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <20261022183942.GC3381610@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <20261021014324.58376589@jic23-hlaptop>
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
In-Reply-To: <20261021014324.58376589@jic23-hlaptop>

On Wed, Oct 21, 2026 at 01:43:24AM +0100, Jonathan Cameron wrote:

> > +bool ctlv_message_input_rebind(struct ctlv_cursor *nest, const struct ctlv_schema_tree *tree,
> > +			       u32 node)
> > +{
> > +	const struct ctlv_message_input_scope *bound_scope;
> > +	const struct ctlv_message_input_nest *indexed;
> > +	u32 i;
> > +
> > +	if (WARN_ON_ONCE(!nest->attr || !nest->msg || !nest->msg->index))
> > +		return false;
> > +	if (!ctlv_message_nest_index_ok(nest))
> > +		return false;
> > +	bound_scope = &nest->msg->index->scopes[nest->index_nest_scope];
> > +	indexed = &nest->msg->index->nests[bound_scope->nest];
> > +	for (i = 0; i < indexed->scopes_count; i++) {
> 
> 	for (u32 i = 0; ...

Is that allowed now?

Jason
