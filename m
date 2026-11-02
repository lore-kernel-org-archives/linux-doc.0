Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647157;
	b=vuhNE6jM1j8kjTV100Es6a3zjV1qTkZ1tqMrO0LpT89LPSzLqbLVIWv4yw0LIkXdt+0l
	 msB7pJ+dPYFrSj8I+1uQFEkLjmCZU3+ZEfBslEfQWZkhjk24ruVnUOYdcB5v9Ixri5qPw
	 sPNRc2uAWu0lfHChc5dPOmaSM2ZewEmDTJqZURRK27tg1BJecqgu+GZSdIdyQlv4iUoaP
	 INSyNwcFQ3GDI+XIxUWTMrasuXnNS5J76CIHEqw+/AMmJb5glWVR6u5VgGkRsonX6Z1iS
	 a94qheEXoU5FEOitkTwQDMm/oo0faXVbyEBiz1z69dj+55g+aZHMCMhbmPugLbAAxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OC/gY15cLyDwevMNUFIaNM4tFLtXDK4Xhw0hL/Ej86M=;
	b=vTjXa9DVFy33Sd08RjMtY5TuVmUKBN/JL25dk2MBcJvtDblTgT1mWlIIE/tZDq/AtPsu
	 Zmfz2+rufE2MnlEcg289zPr1L+lVq4i/vaMMXBRs2O2pTbsDXOu6xBotiRu1FXXKE679m
	 CXHdhFJYnH5L7IoT6Vif3FvT8UtFgzgBboGtv1y74pRfZ+iOB1Be+jzcxydrxUY3eEh9z
	 607UMyyLI7YKaQkvbk5w4b6BqMCkb1HQn32msQOxMzeuE2ISYHCI0ofy2mD1fufS3SoK/
	 l24V+AXHCWqoVOHvOisYuQovfk5yWWawEIQ89K8GQyYbXglr2imoST5FwomSgHmk0fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NB74w9rB;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE5606A326
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 19:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1EE5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NB74w9rB
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso15502845e9.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 11:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793647155; x=1794251955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OC/gY15cLyDwevMNUFIaNM4tFLtXDK4Xhw0hL/Ej86M=;
        b=NB74w9rBrA1Fnaludy1HBowebMeI8FhFmSUNE2JVYGwPjKwXx9TI5xm7WO8KeiOryK
         d702aUwvSY25jzV7QZR4CZoAIzB40eqzwRv478T/lL2sBsDIggpSeSv/QJaU/p0b2Yy+
         tFtTg/CrEe4Qq2P//4lkseZFThzb0EIKz3XbFlWf+AmjBz/htDERW9z6CuHXf9CKGXNh
         e1ltXfcu+/VpD9gV5+5ChwmiHXV0V+iZBHEp/Zpra6wqD8n80ubPh8SWwCTeTBujV8ra
         SZ/lvge5hburvPtLszH8TycgZ9FtOIcKo92fmxORITiMn6Hyrla0+tia6Wa57rORP+Ny
         JvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647155; x=1794251955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OC/gY15cLyDwevMNUFIaNM4tFLtXDK4Xhw0hL/Ej86M=;
        b=TV921/xpnK/VXNQf60mI6PUzA6/XBHU2Via1CVzqproBOZpX0eMYs0CKK5JXxynGt0
         6YK6GZgy05q+gQ8OsZxCpnplnODv06+FJ8/klY9VQ1Izybahhe0mHXiUWSgsh0gx64R+
         O9NtoO+ZwKTuMQ5LWB9zXyHxmdA00+aUYRJu9sgbwwsyp1vCdz7FWIpOgjLZFv+mAeXs
         Il71uiNX8ZLueYPn9feOvjLljVW1GZv29j0lNSKocbZE/ZwH54Bxs2S75ADsbhPfyJu5
         5EVOvkSiyK8Rn7pD3ckX83bgovxfwk3rKyDbXm1wNhE3P8vxGhXeSbu/kataxPBH76H+
         imrA==
X-Forwarded-Encrypted: i=1; AKwUvBx3JaTAw7P/EVqYquObZr5zxwC4MWORjxl/qDoUwa9PMStdDBMIialX4oitcenHbNgf4wDamYA94fE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt5884hNRzLapawQ1Bja4KsqIntt8/rwv1KvpdoueVo3lucDAv
	aqDz73PkeJKHnYaxaPpaw/HLLycqn0NTPJ2Sd0YHJ/F0tSZ3TcKxYFG1/3RfAeWceWs=
X-Gm-Gg: AYBFou0QYOyKFfhvg53vxjxvkglzajMY6zbemKQGji1NaVQVdvqNgrSlbnhkHn+pMzw
	l4Hxk0Fuf+CAKPhbH0OKZ+zk57kx0diyA6t9p2ehGl2KTbRpGH6Zga4vEX/pZxR++Q+93j6FYM7
	8SEHxlZWTMVwR/7IrxOG24iMniWtUVh5ubCwga3CvhnzAw63QXW8HdEhOpJIRLXxcQiuHs0pqx4
	E0rOhnuQb/QQ7G4P6D9DmZD+0poaEsWH4+hLKgNu/NJPobIfqOq2aVHaFHTSogU3cH98cBswWEG
	418KG0xq2JS8dzz9k+w24W9hAQ7lpdGR/8Pj9zUlR3+BXVT+Rpeep56+3gBk4ghiNdAj9qU1WmQ
	yANqRjrauWKlPqv8lSDljXosFuIPaKOKKlNrtCp9AHGKg2Vee58RmYlMqnq+rovCmdutK0SNMvm
	GP3XlvxXhwZJXSdUUjDB8XAQKXqWwIWrmarpr2W+4yjoEVq7KQbPEqcERHPKTZXvvrYVDjWsRBo
	TgYPIuRM/87nmr5mmMyu4H05JIuB/ieAmnb0B4hAU6zv+8+dH8xb4B10QV0wLzTGDAgJrGHaABW
	XvVHfJLJwnlZyHXKjBVriZDKv+3Uwe/DR4bFpGGpNAIHYOoBE2RPJEaK4ZCv
X-Received: by 2002:a05:600c:6989:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4ac150b38d0mr251477715e9.2.1793647154958;
        Mon, 02 Nov 2026 11:19:14 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aae24b32sm6083675e9.12.2026.11.02.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:19:14 -0800 (PST)
Date: Mon, 2 Nov 2026 20:19:11 +0100
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
Subject: Re: [PATCH RFC 08/20] ctlv: Prepare message output handling
Message-ID: <aujiKOR-JR9kTMia@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-9-jiri@resnulli.us>
 <179302367451.58760.3909701518454079333.b4-review@b4>
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
In-Reply-To: <179302367451.58760.3909701518454079333.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 498 lines skipped ... ]
>> +/**
>> + * ctlv_op_query_done - Complete the last query fragment.
>> + * @ctx: query operation context
>> + * @generation: current data generation
>> + *
>> + * Return: 0, or a negative error.
>> + */
>> +int ctlv_op_query_done(struct ctlv_op_ctx *ctx, u64 generation);
>
>Typical kernel style has kdocs in the C files along side the function
>body not the header file

Okay.
