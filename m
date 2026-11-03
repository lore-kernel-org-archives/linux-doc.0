Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695138;
	b=BG0HJUyjGZPQhEjBOwte+V7NkYadBDW1FZe3ZWBgmi2BBv4g9ov0SakZ6qsF7cQn1+Cn
	 lIzqHEiGAYqo2OlEUnbkUT7SegPjaift0NAeV54QZUSgSPcVeFwU7Df/Yu8B5lx6k5+PB
	 Tww6pZqYEjpelgyXu/SfQKqamlrWVV5KIm/EAsFpFMiG/OGOyk5CmDOxJBHT9WsZdVxLC
	 rEe9Dw/imOC/K/GLj6ajUFvmP5JCHN5xLDX1opJ4sXCB7NTmg07rIuNmcpLH+oI7XJ19t
	 AbHJqO6v8UG4DDHzJIWltsg2VmT3DJgcryAOusopyKzLPl6STxEKLBF/YAp6p/pQ2zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MRTks+7ld7RMCsMZY4NHpGohDqoSKPsEVE5vKTy4ZGs=;
	b=ImHrcYGt7KDULE1xIlA/bpAYiFXcsOXHsdm8oVO87y6Bio+neNZOsX+rBtWhB1R52vZs
	 y4PcksrfFWfNWAvASiApGFeAcMsigdbRAyMvZd53VA59sdow+sgTii0kvF08e5EWXlSqN
	 DrhJUgDfnL3KV15zKFCf3FjnUA88DDaaeWqlyf43TuDjKUjey3+XeDUt6N45+8bt2kSm7
	 P/7MxnJJY0kz7V9lnS0aB2ctCD3ql9lyf3pTValMQNi0+yqyPLd1MmD9duzEj0H7QDwLK
	 0X/259diFABA2+BhtJW8UsM/RWi06srP6xmxf7KkXAtmHRAYn2e7+BVDaHCn/gyD0Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=FzhtqlhW;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64066606C68A
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 08:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64066606C68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=FzhtqlhW
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so5152065e9.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 00:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793695135; x=1794299935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MRTks+7ld7RMCsMZY4NHpGohDqoSKPsEVE5vKTy4ZGs=;
        b=FzhtqlhWaJl8/mR5HSEsoDwcWP7F6hzS6SADauqAQGdfoDE1MyfnX/pMvL8xxXfm6y
         GIu5T3pkFU7JZwkuiHng+TEYbg3mYN0Dnc4ZcreC9vKEFh1iTWYxTUNtP6YOIxkyb++g
         pfSfRH1bj01FENErN9h5Es4nug0+yQGK7BzSD7NSZIICk93SgEaHo5iWQO573bppmgy4
         JGinVjtRi4ZFntVmtNpKEMwWBwNfJl4ufBshlTDs6VNMyRBFna8wYzNCOqkdAsH+unnU
         WbEmFhkkGduaAnA+odcSRJ4a5quFKvu+hFPS9DojkfnVsZgGsJEFJVYYS19OH/GsH9++
         ySCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695135; x=1794299935;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRTks+7ld7RMCsMZY4NHpGohDqoSKPsEVE5vKTy4ZGs=;
        b=uljZQa0EweyEjUzaRpXDzdjkwiO3CmRddn05i5bnKWE+cYIyIVf8DmLRcETv/OUMHU
         GlW4gcjdfG1l3B1aVooZGTikxwICXQgzif7B+Vj4cpa4xEPQBKwcU7YRd6N4s5fqK/fU
         UPNfF5m9dAQjkNq6lxcRQPe+CkK/akipZx5hWAsSTMkFfcfnoP7sWAL5FKe8ovvlB0ni
         FOnOiUASAjEwucvNfFEC15ZUmshcfZfSEJqJ7Tst5pvtIYPiq3F/RYPguYbVq5rv0eIP
         6oMPRLQABuC5GEIStRhD0UpYVuc081N9cX8wA6/l5wN9CEw3x416eMDbCYjSjLvLDrxy
         o48A==
X-Forwarded-Encrypted: i=1; AKwUvByrtPgkplgD83gxket6vLy0o80lb+WkNYIrsL9o0H85wqIUvniCwYHdOKlZCKft+YIvDudIgf3Sk6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xRXlfgjUDJVH+eTIoubYM/AoeY5BzGfWLdgChmuYN10Q/wz4C
	a3dzoZr5auSnO7TlOZA0sDOtiMpAyitBas3ggj63f0e7xyP0dFHI+waIo1+4z1pSCVc=
X-Gm-Gg: AYBFou23wNEWrlRcaFXWjUGMcMmtZYxHfpPZCK+Ec204ctThTAa4cFP+Z07gVZcSGXJ
	BkUVS8FOJhgn2w1LQQ61gF2X3r9UxM5VdxrD367Kj9wClogndALzrcyhxFRroNapa0BbGByzMHo
	B3Tbs+FDEf5BaFKXpkCUcvLa+/pkekO8XIeTp6FODJ0gdC/Z3qmqJX7JDti9MpYWMQa8jqgB9AL
	wkx6ZrWtR2GlDfwPKFqLp+2TBebvaGxXy2gm34vPeyhrH+57kPlxOyxUpl3JDB5Hy9nXeEcFM29
	SzAoFMUFHM+S2xeQh29+qcKiriFxHhJbadvepYjGl1z7J4xaugqtjtv2q34iPVCBcHbz5GN01es
	V9W+hjT22p7ClAx3vTVHIAn52YDPrtmtZTelNdXTR1o6Tkd73vNompWTzCZq/4hreZqX7pMNWU0
	HSTnF2H/9cr4hrQHIlEkVzi8fkj8eMWC5vYE5uZ4NaMXT8tthHzHjK0zcpj9AlmtyTCVh5cRKlj
	lU5FkjarawTJFXyDNaVZMKtNRBFKBekJu8bP9hI21Bf+bDYl3hh3nfLuTTRqbMayhcQASASUg2t
	jzofdDDynWEhZq8M47DbCG/kcwwoWz9Ra14jbNKD/wLJ8rGMfOiiroA+Ed0=
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr285917965e9.16.1793695135152;
        Tue, 03 Nov 2026 00:38:55 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm432002285e9.1.2026.11.03.00.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:38:54 -0800 (PST)
Date: Tue, 3 Nov 2026 09:38:50 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <aumdeBFHvrN5_NgX@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <yq5a7bjajaco.fsf@kernel.org>
 <atooh7uO2RauUTfY@FV6GYCPJ69>
 <yq5av76sj10a.fsf@kernel.org>
 <20261023142038.GE3977851@ziepe.ca>
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
In-Reply-To: <20261023142038.GE3977851@ziepe.ca>

Fri, Oct 23, 2026 at 04:20:38PM +0200, jgg@ziepe.ca wrote:
>On Fri, Oct 23, 2026 at 01:34:53PM +0530, Aneesh Kumar K.V wrote:

[..]

>> 
>> ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 device-get                                                               
>> # device-get, 1 fragment, generation 0                                                                                      
>>   device.generation 0            
>>   device.caps                                                                                                               
>>     cap.evidence                                                                                                            
>>       cap.min-challenge-length 0                                                                                            
>>       cap.max-challenge-length 0                                                                                            
>>       cap.max-total-output-length 369098752                                                                                 
>>       cap.evidence-flags evidence-accept
>>       cap.object                                                                                                            
>>         cap.blob-class cert-chain                                                                                           
>>         cap.blob-instance 0                                                                                                 
>>         cap.format spdm-cert-chain
>>         cap.representation raw                                                                                              
>>         cap.representation tcb-digest                                                                                       
>>         cap.hash-algo 4                                                                                                     
>>         cap.hash-algo 5          
>>         cap.hash-algo 6                                                                                                     
>>         cap.max-length 16777216                                                                                             
>>   device.info                                                                                                               
>>     pci.name 0000:02:00.0                       
>> 
>> I think we can use evidence-refresh to select the blob-instance for the
>> desired slot once the CCA specification supports that.
>
>Jiri these ctlv outputs are really neat, it would be nice to include
>some of them in the commit messages so people can get a sense of how
>this looks without running it?

Okay.

[..]
