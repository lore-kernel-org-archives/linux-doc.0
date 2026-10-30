Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353221;
	b=GWe60ayi/9OtRhCBKW6VMLRRMuXrPFafG3vQYVPdMo6pXQy8QRVE+6KY75lQCpLf4AzN
	 9hFQsWGgIBEI+Q3S0QX3jQqSBydWqXXUZOmjnt1ioSdPihWrWPd9yQFF4fn9qZVbly1iw
	 H4xVBvuVDn1G9+2RTcvvWWrnFOKo2r2rUjAKqrM60fiLFgESmcdrfuhUQPf8FK9pV+wlD
	 LJDTAOEq1aao6nsqKmB1BzGhgib/a/FCL/duJG5xteFvwt3XYqHMWVhROyNSe2MANYaBU
	 s5lf2X+6hJnvDaSmP5kgOsdc7ygmCRYEXq7pchSPVlFyrFT3dSQRBWFw6Z4kY4xNCoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=La278T1NrCS4XO98Q/cTkbnnx/6adToIXrUcsW5BqDY=;
	b=sfNBDK3KF+RjGS+7AywJ6XX2c0Z9BjFSNyViTEM13sbY0eJ1CX7xWpzoW25OvDrLOY4n
	 bN6k8MnOoMHm6w1K2QWNIQc+NY7I8mWtNGxAOmcGi/nSRSHfbrkVedlY7d3TMosPAqZsF
	 aSm0abv7bAO6JT6SFnVdXlcfK1TaF6j3q7Qy8UYfpXKsvOe2jRFe3gbADFNOR6t+3YCNc
	 RHxe49KdNRmtQI5ta1pcI8p14IOQHAGbi2Q31pbPhjgsql8s1zZXoZyuOKwq7j1GPHn/J
	 wVG8fCX+PyzA7dwXqsld/kukZDQpPjiaZkcQDzXfjSt8uchYlt5An2z9Tcmx9SuEAXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Kv4m9vJR;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE15D606A321
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 09:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE15D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Kv4m9vJR
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so691768e87.2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793353213; x=1793958013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=La278T1NrCS4XO98Q/cTkbnnx/6adToIXrUcsW5BqDY=;
        b=Kv4m9vJR6R9/MCQPr8oImYroO5YLgSVS0DYGIvONwSH5eZkPBnkxNVp6UbPLFqhzJa
         mHwnam4KotFiiw2rxYegY1kWtGQiTINkwVf+f0Y+u2QzIsLuF3DneFaKE20yzTnkJvUL
         70+rwPeuEdD8KBv3DlclPXB2VFwYGOM9bVM++la8LT/SMXM8wnof4b6Sr9VGEuhyM5qi
         DH8zSsN+nlr7X7dPGz8SzGu1UlqoriuFXy1G9JxtzUCbp+ogvr7v5xumXPOz5NJ/Vd0Y
         /RvkMRt3ErRcgH7pb13vlNxMeCRHTiaIzHOaKj6JlTsxLzPyaWS/IEGF7NiBV8mjUXk9
         vdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353213; x=1793958013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La278T1NrCS4XO98Q/cTkbnnx/6adToIXrUcsW5BqDY=;
        b=KK5/Y16N0vPj0vlhRJPh+QyLTuSA9/newQFEZRMM3mhT8Yy4+3//m7818XAzCPMxPH
         MKrBySzP7MAbSX87BeJPIwhqMlqa/ZAPtwPUVtEc7PhSBjU/35sWeUScmR0f4eZbWEXJ
         Av3Azm8Bu39PZNF5/Rovw7fF3mzWwcaI4F6JmmLW2EBXIQ2tmoHMBNwJ2QNgC7+sDOUK
         n3QkSF9MFJTJbphOQ3BHpOMgLIwy4WvaEjNw/DFCT525ME/9Nxug4UR89X9FDj8KkhYo
         /LpqWysMAMcFPUwZQ42HNbmSZSTrou363DlO00GcK6EvNjuo8WTVzYPaMPJl8YOimaQL
         +5bQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6idMD4qq/9j9Q48oJutcautMJzZhUMFUIllUxpHmKZgCmQDHki3CQbsVyfz5EDp9Cj7zf7cFnaB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNEXyB85NJ7oJ9oxzIuRkOm+QMgVmXTV7SxVkwXw4WHDULa8qn
	WFrtl3mNxXnLqovY65KWLvCwQfJg4OfYFV03EIvvgPQSm9CiBuyy1d6JWeyzbB365/4=
X-Gm-Gg: AYBFou0EoqYroyrQOnXKqwEHNbEosYoK1HQrA5uuC1ipNST7lMmb7GfdqeP9r1PJGdn
	MaItxg8Hpfoc77iHYXHtxJUmhjygVOerNbxybeo9+5T0Wiy4mmvD5C9m8EdnU753aehETXYdsQO
	iQ6dLm1tSgbM0+w5GFnbOuQ2d/D8OY3GgaiAX77T+TiY0GyKp+wlaynQ57LujkreQiB5KN/5IXn
	YwDdY7CL2K7kxEFPXIaYRm+r62Mv8sjWpApSU7GCIor6qHrUx3IuzeapY1bbkPJ7t0836LlnZeO
	Dfyx0enTF+JV6gFsNY0r48sP8/9vBtXQSBd+LT9jERBbpWEqrRIi7V9QkfTXCl6o2CxyOvrSpNx
	ObippzuxZ85p25WUn9ABavfEOnwseVxasUOcTZT6TqIGkhEc6FIW19lsIHMj9cpOPXI2OfYyrcM
	MhY01IYKg/Um3LUhjMk/vvNHyZQVVk6NwEy8XPbd92yJn5jshFLpNbluqFvL08rHo8SHHYRs1wA
	0nuPeJBUBJ9b3rpQsDF12zl0N8G31KXZ5yxkzlHW+KpkIMB8zCtA8aZE0KxeGqGT8LQB+bwF0bW
	2s7lrLp+BU8IZfsDZnGdkaC/lmRff3YCwRanAA==
X-Received: by 2002:a05:6512:668b:20b0:5bf:da1f:c390 with SMTP id 2adb3069b0e04-5bfda1fc9c2mr262942e87.36.1793353212517;
        Fri, 30 Oct 2026 02:40:12 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfdc08ea60sm221364e87.33.2026.10.30.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:40:05 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <auRl4VzVljAQ1Suy@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <at9nsxtGOl3N5PJR@FV6GYCPJ69>
 <20261026161220.GA1671235@nvidia.com>
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
In-Reply-To: <20261026161220.GA1671235@nvidia.com>

Mon, Oct 26, 2026 at 05:12:20PM +0100, jgg@nvidia.com wrote:
>On Mon, Oct 26, 2026 at 03:52:30PM +0100, Jiri Pirko wrote:
>> >device-get:
>> >  request: {}
>> >  reply:
>> >    caps:
>> >      evidence?:
>> >        min-challenge-length: uint
>> >        max-challenge-length: uint
>> >        max-total-output-length: uint
>> >        objects[]:
>> >          blob-class: evidence-blob-class
>> >          format: string
>> >          representation: evidence-representation
>> >          max-length: uint
>> >      mr?:
>> >        mr-flags: mr-device-caps
>> >    info:
>> >      $extend: device-info
>> >
>> >So.. how about could we drop the sets, use a direct description of the
>> >layout and do something else for the ID numbering? Maybe the numbering
>> >can be solved directly by only listing the names in:
>> 
>> I didn't want to have a lot of duplications. Netlink show us that the
>> same attr, or attr group (or nest) is often used in multiple ops. It is
>> not good to repeat them each time (multiple obvious reasons), so I came
>> with the sets and groups. But I will think about how to make this
>> possible to be formatted in more readable way.
>
>If a "record" is re-used in multiple places, then sure, put it in one
>spot, not disagreeing with that.
>
>That can still work out with a clearer top down flow, more like C:
>
>records:
>   evidence-object:
>          blob-class: evidence-blob-class
>          format: string
>          representation: evidence-representation
>          max-length: uint
>
>ops:
>  device-get:
>    reply:
>      caps:
>       evidence?:
>	 objects[]: record evidence-object
>
>Jason

Okay, I like it.

