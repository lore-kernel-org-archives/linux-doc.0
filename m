Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268474;
	b=C7d0KK/O5aPqqoA4q1erexpfDijDPAlZvtjuamX4cpIbQAs+440aRM9eB38igIXUbX+W
	 LnIc7Fd3XoVq7GU0ouXYcmv3Rh9mDZuiRmFTwrHCmk998+LUTL9e89Y6ri0vJfNFMgt7b
	 ez2sFrlo+2XRlzD1igL73V7MstyQ5raO7OUcXNkqyD3tnCmtDvGZbWRnx9fhHXvQpmSIP
	 yMCRB0Iyw+GOK2ZjAabkRxwK0SSVqhYnb1DM6QdXZUUV9kDN2VyQhh6qp0vDhETTin9ML
	 0JDhVhLftj174XyHS9hhzgMPYqoSvd74yReT2tTzfDWJRUPCWWBMdHPzyRoRCfUl3rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wgroa5qxrEZgRV1TzlPeAteJauIXp9n4MbPCfUIQ4C8=;
	b=zKdUYJgow5rlWJygNUplZp/uZtIkmHgBW3JT4FPB79RaIOs504M3d8n1WSTDn1tQOIio
	 QgZk/va9Px+vrqFtqOV+Me5yF4zO3+U1deTWtuZKUeyhfFxafqizCet96Qt0DUp64JoKA
	 JQZy5T6LGkCBSc/ZtGHyZs28Dr6WpNOYYhCeMKgugtfZbtP3CgNbfEpVJMNCFZyoZAqqu
	 gkuV8Js/G8WsDneMKeYMP3BXvDAvuRLB5lmlfKqbw2wOFBqe63bLfP6d0PP5m80H9uW2T
	 w3bGoFfAZgqm3p5NWXqjLOBe4PSTvR7425oRSh2MX41sGrl/zQRnuLGenTifOiuWPhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="MCGV9df/";
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29CB606A31F
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 10:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E29CB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=MCGV9df/
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso303783466b.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793268472; x=1793873272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgroa5qxrEZgRV1TzlPeAteJauIXp9n4MbPCfUIQ4C8=;
        b=MCGV9df/7k4ajBlFLNzpnpiyVP554R79li/56qz4JFgvKSV4eMPHTSDzDtiO+v0OXG
         amQcqEYKMIKb06gnn3dwytNvTkYChDHgYHuD1GcIs6YsflunLHI2CEtw25RALpdQtNDn
         5Se6m2V7pofQQZhstlbmMVyRNnXfrt8FDQidCK2DCySntXp3eXIjMIwGd3GBhkoA+M+R
         o/hwUoFTvZnV2wRrJeYXyGpoR6GETTnHQqYkHF1me+YT7LsyP8KIuGgUQ5bQ0SaQ8CmY
         I+L4iyO5i6YI0hE+HABSCmQHgKTuOcQH2FfxU2YTP2MUN3qxImSYhWmC5V41uQuPOFab
         nvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268472; x=1793873272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgroa5qxrEZgRV1TzlPeAteJauIXp9n4MbPCfUIQ4C8=;
        b=QJsEgPH2Se/4Pj/05Xzz7/F35toUpkanGNjLbGs5jjAzn4WF2ukB18x8GuUSa7Zxzm
         eYs0TkVodrFQ8P26x/jQ4oBXFXqcmTtEA9cc0oCU6upLtFpDJLvKkvzUZqK7EYd5h4Z7
         5s+mdyMlNo0rTwI5QhvJMMzZxVwnKW3cxAetkGsQURMSA3nL7sqQVVihUG5m3BmV/QAx
         hhIR+mlgXr52Rzfg/zs/US5npAH8fmR52NYmYO5qhu77gxup7/zCaxRaCZA3td/9Z7RZ
         jrf9VrM5/+Fa2RbUhLrGe/6bqge8vZIjJvHl4T1PdP/5TD40WsYe1FtlsBCcxSD+cOq/
         NRNg==
X-Forwarded-Encrypted: i=1; AKwUvByXV927+7oRXWbHTrl9GiwwJN2WfVAzlh89QvNojNx4tVwpBvupDcaYLTmu44VRgkrdZTRMgEFmUew=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2i1uYmpHso3xmZresksB9F4lGv2H+78fc11Ev3Ee0+xnMu2YN
	RAJAU+Xm64fDX+P+7+up/IGrLHxY9rfodGRInKCnuwPV2JRZxd7l3lf33QPDeuGnjMo=
X-Gm-Gg: AYBFou0GOB0fIiFv48bdhPvSJVWVKWnUR1e1GFg2o9T+kev6WSZemWVpfu/sGt931Tw
	Haa9rBkWlIKiYxSFPtnVPOfbUy4IQdnPLBIGdNbRvSGTlWzlmuvCTGgCC1mIVmXzzRs1NQroHfF
	7tmfKOKY7p0CblKtyVd3RpgVQjrUlLsDOFTTfOUedV0uRZkVit7vZ7rU4ac83vZ5LQZqTpEkH0Z
	12ZJpC+9dbc3QxxTm/X/aCbxJo08RFRh/1wheh3d1QHs+05xF00yKlTrDbDDiAN9DFWpFN4xoc9
	sgGMr1PZiqbkXK7ibRZRDy57DVuchw7rFgeYJ1AJkNCu1hbklcBBz3F7DbHQ1LLSq6ZzRlQwGXx
	MYAjYfJr+JxbXat1nwZjsilQbKB/BgRQrGjHqZHtBETH4ng2OLe1jhIDFN+DaFkZGXexKBnlWjo
	M7VqMlN7oMRMMTLvPlpmnzF5HNYtozjQ0S2rbWLmaSXsO5nHyamwK2Abww/XqACr0VKjDhID0xr
	QMBupymWv7dGeOT6J6iWZjm1UssbgZ+a/w4myQh3N4RuA99j/5jvMINSeWCCJWIGetJykZ1BgTn
	3eLJHN68LTFUsrlfFjW5roCoOnvmGJa+SO79eg==
X-Received: by 2002:a17:907:9405:b0:c49:8d28:73ad with SMTP id a640c23a62f3a-c49be020e3dmr404569566b.49.1793268472113;
        Thu, 29 Oct 2026 03:07:52 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd520838sm715397566b.31.2026.10.29.03.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:07:51 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:07:47 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <auMahpRIeL-Dkytk@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
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
In-Reply-To: <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>

Tue, Oct 27, 2026 at 07:43:04PM +0100, dave.jiang@intel.com wrote:
>
>
>On 10/15/26 7:50 AM, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 

[..]


>3. Jason asked on 14/20 whether anyone needs a variable-length challenge. I
>   don't think devices need a range. A plain read sends an empty challenge, and
>   an SPDM GET_MEASUREMENTS nonce is "NL = 32 or 0". Your TDX provider always
>   takes 64 (attestation_tdx_evidence_caps).

https://lore.kernel.org/all/auMX4kbsflE9kK3Q@FV6GYCPJ69/

>
>   A device needs exactly two lengths: 0 for a plain read and 32 for a refresh.
>   struct attestation_evidence_caps only holds a single min/max range. It's
>   checked on every request in attestation_evidence_request_decode(), and any
>   range that allows both 0 and 32 also allows everything in between.
>
>   To work around that, my provider declares 0-64 and PCI/TSM rejects any length

Perhaps just omit the challenge attr in that case would be the best way?


>   other than the backend's nonce size, 32 for both backends I ran. Could the
>   caps give one exact challenge length instead of a range, plus a flag that
>   also allows an empty challenge? A device provider would set 32 with the flag,
>   and your TDX provider 64 without it.
>

[..]
