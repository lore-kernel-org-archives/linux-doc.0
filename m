Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266210;
	b=jI2Ap3asql3hj0hPJWmJef+obPNIofUUl1Tja1lO8g4BkjQWHFd+dMF4GbYY8AT3t4u1
	 +SdrSQ1yp9z4hdf6U8OAvcZXk14F7AEQRw3TpK3WW/SkZzPHgZbL43maHGc1nB1RVx9n9
	 qXJbSoNXQaFBjKZVEIGBPCsf5eq7WGSmENWwMiSkZNoFYCmHPWlwYHl19stYG4ROmxMzv
	 03bLdhZ1Nfy1I4GpPU/CEN0d2LHQYpMWm1dnss9NjX8Lt1KsqN/rdZAEhxkGAtkf3yquD
	 rZQFemOB4++SmJ0Dg40sYPs8HL4VcJ7ld1NBc6Q+JnI2a60lzkRRHv475rke4DTaNqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SxasBSQqzrj10fgfbmH9pq+LqGH/ruAKc1rAsZ6gHrY=;
	b=gdsAXn1MnHVUGitsyYCCPCBzaMs0u5AbAVJw29qB8CoKpqaneMAZchKRuI+lIJ7Fl9Oy
	 f7DFLtugRGxmLGcgjoPmWhnUOtynBZ8IquzKANfC6xLL4LKXpmFkJSOh1rNhHO9opJ21y
	 EmHZpQUr6aQLMdFN62jbhUP474nkeLS327LwppvB59aAuJO3HRz7wuCqACp1frcB3S33b
	 La2KqMZq5DmKOMrO/6GNP8PMRqNrXGkCJ24UGVQINNo2asP+JB92/iXi716SXzRxIgiyJ
	 UUKbAPydAgV2T5FBLZzAoF95wqq90ZFAU++YcknuUHDTvIaUe9Nw7g16shibIMI07xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0C606A320
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 09:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA0C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1552326f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793266207; x=1793871007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SxasBSQqzrj10fgfbmH9pq+LqGH/ruAKc1rAsZ6gHrY=;
        b=quH9pYLZIETR04d3yKmQFTy1ZqTKb6PP40cYO4TwGO4bHDxZVFg1XfSuuw/cJ+9GOV
         6s0JSiO6XSVuxhaXSYJyGQIp1h/4Q2EbGvVtF7mFxGpuOMG4BCW/+ShuvuVMiCB23+Sv
         Bl3oHpiRalOlsDzuoXZwV8CH9JdaDYkiilX7JIPQYGtVqepwEXJiuQHPEC10+3c2p3Pt
         hnDIzFK9kttO9BFinkggUOPnm+39Nv0Vz7t4fEXEWCHfecizU7Za/hbrKdJFrkwS52jI
         p8NYQGUFduovAJ02P+qtE0BTvnmGgcxknifYKHNwpMuifDLSTHBCMuINlRMDvR6DAakd
         KZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266207; x=1793871007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxasBSQqzrj10fgfbmH9pq+LqGH/ruAKc1rAsZ6gHrY=;
        b=U7ZQ2IkjCmjdlKiMzqC0XcOCoZHw8Dij4Z2IIfFkeX1M2TORaUpaybyWrRKFqYhPXp
         vurMzIuc9TGW8YQnfDQwkwadcDeNNxMUtQeWK7lQ1pIbpQdaeZTONDiLjmXwtcrkJ+fH
         3g88Vo/1MBGdZ9yFY5/eLNfMF9JNlIGhjB8d/Lu6iPQO428CEiG+qY72fcD/27IS7meM
         Q9hRuwKZLrGPFbPmU42g9Ewl2ySAoksYT37NMPIN/asIT7rR4FHTohldVkmFOW93h+BA
         H38eOX3v2EFbNLMNwHpHN2T6p4d2ibycy/L8WU1Tst0z51C5qsJRQIQJ38CmlFQ/e+qf
         W8jg==
X-Forwarded-Encrypted: i=1; AKwUvBwhXNOB2KsICKv0RWsnLjQ7sx2GCeLXwFyNLUKoygFpOchtbEc8MGkXGZY//JTDz2XZgA7VFSl9drQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVi0ND6V2WOxU2VVAaT5Hw0G8grZGCribd05ma0GbXjaLRL9tc
	cfl75FxYA7AruXIgT7n4iKmOIm+MK2jG8mqT8bl4QFVfj70nRazlVgSXHkcrEydk1bc=
X-Gm-Gg: AYBFou0dRTs+qXfI9wvz/hxEWOJH5w4ULgoBfHvzXybXF1lNTgDB8ULS4iW5FsqYRNr
	IiwRwhgdf4HhbQ2gNesYo3/GNkQfQI+nJ2s0sJZeX5VpJFVdKMl2HBJEgCm9orxTVf7E/pTnOtD
	FDuCOtEGgcwV6XHj6wCeopoQSMRrOLgxaMAuge6MQ8jtc/I+kets+G6larmKeRgCA1zZPpcU057
	JesErOGS0krFbSrtYNWEgbmCys1s5EWguKqyIx3Ee5rfQMnps3yZKDr7YT/fvyBulSXChLjCc/b
	rXDy/egVKoLRn3RieidH4MVHLIry4tXe85O8hILnD5J20tJTTw3LmTTWxpgEzGlxpK62kXgw/Ae
	8FDSIf0va5KhEwzXEXRTgjzV/VGqQQLzdZb/NKjN/BEXMBZ+vwHqhaAqq0CJ4qeXARHQXOKD8iM
	ZsNR7RL/kbikbDvIQqDLLrexxChGg6OcRFWP9w5Un/d8y/OI3uvKbJHlKGykdo4Xvw4iXd3PIzg
	YPb1yRRHAw1kaOS6H6gG1QoxqYQrfYWJOR2+ZOQncooFJGL5fLyCOkZnw/vUIviPlixMncugWP6
	7v07LS6DxSR1fLIOIfjBuHzOThDtZyrP+cum1A==
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a966c41007mr110102485e9.15.1793266206771;
        Thu, 29 Oct 2026 02:30:06 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40285265f8f.44.2026.10.29.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:30:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:30:01 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <auMR_GztmsRcEHpv@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
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
In-Reply-To: <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>

Wed, Oct 28, 2026 at 12:09:19AM +0100, dave.jiang@intel.com wrote:
>
>
>On 10/27/26 12:36 PM, Jason Gunthorpe wrote:
>> On Tue, Oct 27, 2026 at 11:43:04AM -0700, Dave Jiang wrote:
>> 

[..]

>
>>  
>>> 6. tdx_attestation_test's discovery_and_construction_fields expects an
>>>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
>>>    directly, which gives 3. In a real TDX guest it fails with
>>>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".
>> 
>> I would have naively guessed this should inherent from some SPDM family?
>
>The TDX family is the TD's own attestation (TD report, Quote and RTMRs), with
>no device or SPDM in it. In wip_attestation_all_1 it inherits ctlv-attestation
>directly, so I think the test's 4 is what's stale. Jiri would know for sure.

Yeah, looks like the test is stale indeed.

>
>DJ
