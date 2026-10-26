Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025930;
	b=hrz1irhlUuLwieiObTZQswJr2Z6m+StXIWDdrnO+U8G4NbUhcwJLyN7D1mtA1qYE8YRu
	 si0tryvMKWTRjhimIJmmGmP/GyiThozvVidyU8DouLlkcn/Vh4JK3Q4/sMTcHb5doVBFU
	 +LjT1lVyV7hAa7Ip6xt3GJH5mfPO5/KW1fm4mLjvpubZEYSM/FeFX2QrvqQYb1rM2QZho
	 LDUEW+E9YYuS9PbdwfbdiddvLqX3SYyFkC5B4woLJEQ5zKshdlvvv8/NiuuHBmkoZ8Qca
	 +99dS1mX1lng1BV4YpeFGHCRqGpimtrE12cPTZWkF8I4tLbDxr5kpOmp6K3XPGpSPfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BTyJwIZ3wmc9oIYfv63SnUqHORvshzUvmQqM3M2r5gM=;
	b=v1PmjFDpVL24APIXfz9Knvrmvh0QO6ah5whkpdQ0BnsMs8vRVujpUeeQN1pK+4By+Rzb
	 S0MLch5YLLE8aIzPQHX1ibeC24lWHgC1FP+qK61bRI1g7GjNaa3Zwo6BFvzCtJ9U+y+Jg
	 l2/vfGz+DmOgYkBAnrYlTd5Qp1VRKdd+63N7Ge0WFDPniplS5e4l6xf0umYg3HTUVYVmn
	 9RqRVRAvYDJNdyphsQXXx4o19z9BlY3SwfOlcpVmOeN0uBxdTIlyltlyRC+Yl8bnirAix
	 n7LGa9QMrxMwA0TYdzDPpJPTJpJInlpfgaRUFgMyUgR+znr9BACMpsN8N9JIF25d4oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NaHhzKNA;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03C4606A31E
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 14:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NaHhzKNA
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c414e5d282eso348603466b.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793025927; x=1793630727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTyJwIZ3wmc9oIYfv63SnUqHORvshzUvmQqM3M2r5gM=;
        b=NaHhzKNABkMC6wPd56SklKTLcrQYlfIh5spEFmqO7cf478BMxIsRJr4GJdsQzMnSsI
         rdTHhnF71aRCmn/ZbWzRcAHNKccrrw4wdLKTXgtF7lVYmL/I0tNSmfXZGnPPcKVl+2Yl
         x/dU7kIekZQCU2z+mtWPUnGySnvBvr6joKf+sfeGKvdFtmYt9dSLMTJesO7CKx2gOyWj
         F7XkhsdJkfue1Pp3MdFYVpe8zPO/ElN6+Hl27s2XKWj4Ttuwb4puQdX4nJm5KZchfBO/
         R8eFcLnpn2qGsfM3RVIy2yrHCfMIG6pg+Q6Fi66PGXs+F6CEx+JXB0tkqciFCTf+D4JX
         SK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025927; x=1793630727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTyJwIZ3wmc9oIYfv63SnUqHORvshzUvmQqM3M2r5gM=;
        b=IWgyZuHpkYCYaeG6umtOhQKtSOh6IneDLZuMrPR1L4C3Dy94sI3Pd9AiV35j40bCxZ
         2/4Jqx4f+0STj4Bg4251OB6ONT7cGVOjxGvMjQTuDfRDEWyAQzyHeI/u9sCWVrdjK/eJ
         XSEx+pjEagsRG7E0Ab63WpkFDBwFwrQAJRZl2fRBEbgTaQjFV4kB9ZmoSCGsjlpXZfBj
         QQg8aNx9rT/I9sw54r4+7gTfP3hUXeuxbv2caTl9pNYHS2dcGHMNafwyHZskccn3EYmU
         Q5XvPEYV67rQOgb8CIwjU1n7gLI3YlabCW1rA2CnciUtZzR6nDkegIDDuUJtbc2eTbkC
         Qm+g==
X-Forwarded-Encrypted: i=1; AKwUvBzr73ywAL5+EqLtHTNPy1g3n3oN13Y/jZBocFQZ9tCvkGLFb1Xf3Jr0DeBGLVnYAHefWvyJ7Va7sCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYILygW/SMKjvQPO4u+oFcUyn3fglNbiGr4BYiNFVq/Jb38k1b3n
	7zFEBwK65+ax0dJep3GeUkgacJ67XADDF8Vk60YhfqDfu0h8XFfA7FVUplyOStauk5U=
X-Gm-Gg: AYBFou0Yo99aZQ0BufKBxaAvenZkotEFss0sWUDOgBV8SiPDdtNFzjLFwP+O1gMjLJM
	JdFL2NwdJVlEcFFHOkj2Hahfa/O+NAbtV8H0RrnVVeV/w7qt5mqCpJX4qgf0jfnqkP1sRrLsjsG
	e0+1daAkd9HTKFlJUJB/l/sYDSIEj5yjH63d6/3BQWeAKx2NZIdnLvFJoL0ATKDV4JebSbdm+Ru
	pGn4WYd1JllDqdRWgBIGSmX0gbeBlGySDPcVtleW/A4X3Ns8nLZWDMV4Zu99UyJEJKArdINhFkg
	gg9KAPP4sbpVxHq/TpcPxsHc/gxnqw7Fd8PPJg+O/dzyElhjRgRZJihCxspzzvf2QlB/XyK6PH1
	hqc/5rL4gP0/wDvvlP/N3mcBs2x7ph92ifU8IhzrmWDZFy9UfzIRIAK9hts5iSopqyF9a77tbQ+
	xCLHAPa5R81sntZTnvi9i5lCGRpnhWr5Q4IRF9cz5urDlatyG0j08mLQbL5QXWfp8D78pTrEJMo
	y+N+2sFtMz1rDpIH+pmzjplpTJVUB1M/Vy2MYouLXiNd+MZ+HMPXRXc4MkWg9LC
X-Received: by 2002:a17:906:c111:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c46bde8850amr767885666b.33.1793025926980;
        Mon, 26 Oct 2026 07:45:26 -0700 (PDT)
Received: from localhost ([208.127.45.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7981a7sm325130766b.72.2026.10.26.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:45:26 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:45:22 +0100
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
Subject: Re: [PATCH RFC 10/20] ctlv: Prepare event queue support
Message-ID: <at9ncuDFz_vI-0W1@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-11-jiri@resnulli.us>
 <179302367451.58760.3073439917920385955.b4-review@b4>
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
In-Reply-To: <179302367451.58760.3073439917920385955.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> Add per-open subscriptions, bounded event queues and event creation for
>> CTLV families. Add the generated root family kernel bindings now that their
>> message and event helpers are available.
>> 
>> The event and generated root objects can be compile-checked here.
>> CONFIG_CTLV remains unwired until device dispatch completes the module.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  drivers/ctlv/Makefile       |   2 +-
>>  drivers/ctlv/device.h       |  38 ++
>>  drivers/ctlv/event.c        | 713 ++++++++++++++++++++++++++++++++++++
>>  drivers/ctlv/event.h        |  69 ++++
>>  drivers/ctlv/internal.h     |   7 +
>>  include/linux/ctlv.h        |  27 ++
>>  include/linux/ctlv_family.h |  11 +
>>  7 files changed, 866 insertions(+), 1 deletion(-)
>
>If we are deferring the mr log, then events can be defered too? That
>would save another 1kloc to look at right now.

Okay.
