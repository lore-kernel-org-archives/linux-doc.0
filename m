Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090085;
	b=czipA45QNcnbpHZD7Rz3DBT6AYkqxOT4t8mUELMDsmu3Ne0esQheaCfdfH+rQDY+zXxx
	 hWw0yzmWJWiJFLlRybDn9venVXxPSzdmyIffVH15La0GQrvON+IkdLc7QiemcAO2Yp3o1
	 /D7D7kpSCMnEST5NcLW7CPaiMbm/tgVOxLgPYqprpO/ZzHK3nzItFt51NNZDIg8VC6rLI
	 lv3kHoi3jihIlLdbhRSRWpUQIcYy4ax2/jgiwb6d6oup4mIAwWFpHGTBBbjXI5HExdAb+
	 kfKCmiOIGDRdoMD5nPIi1DnFFtFpmKR5s1Ss5m91n/xulqm6/a2nVLd1hpyyBUNjEww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JBm8ffaCoPQH1JzTyc8e2It/Betu/HEG2/vRVRWiTUw=;
	b=kbzrVy5k143TgnPkO9X1nYQV3MxtgupVxqH7g/C0O9HcB3rUc2lFx15AtJLEaOxwY3Dv
	 OK5RNmbjwJxmSjZ85QhuqBIQvI3NwmsOTd+BQFDf1VlC1mr+/q4JPYUlBs/8rI+EwKwPs
	 6kihug8mVcgLjtBRJ0vwwffs7zoJSoSO7Ys9Tehz8LfZDpP4xjH2nTZZIwiLzX5Un8rhM
	 GBdM3SInfB+9tslGW4IfcNuaEYpwfQVa16PtS4+miV3xL2mac5KemGwkZ81rwVM7/FBDx
	 QLN5AmgrosY6MnXTUMe71d9+H5Yj9HTwPwBl24b121mdQ1G5CTaEPM9m7rYSyXhTOZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688F0606A325
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 08:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688F0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so24058665e9.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793090082; x=1793694882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JBm8ffaCoPQH1JzTyc8e2It/Betu/HEG2/vRVRWiTUw=;
        b=o3vw+R6WJM/xY5JqumC6/LUb4K4obMv0LWE2BkRABhu2x+bsyUqCR820A7ZCHwkfnC
         Sn/+pQ3m+CYjUbeS9jCMjyJImOaj+z8d/dCOu4EFG3Y1ZhqfTxLIi/tMTL2aAS0KAZjH
         peSCp75+tsY1riFXx52/4tof5ojkSxcnPvRzAH7xQ0h3ImgmU9w0joDiMP/Pi1uMSjFx
         bljGGs0wwgGfu9RqNIdZk/gyQ20assvRY1Gzxql5mzVbAXwP0jDEfcY68G9+Uy9858pf
         CbKr3I6NEEEgEcALs+KrHMjLGmUbg8SPUS8dRewMi3C/7X8PLL31gMcyyHhQAVMuvFwa
         KxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090082; x=1793694882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBm8ffaCoPQH1JzTyc8e2It/Betu/HEG2/vRVRWiTUw=;
        b=Flk0BeSW23Fx2TwvcvAnT0UlIOHn5iBzgPG2ZW46dTIYpcDmcT028dbY8DtoFhNUv6
         cpUib/noQ7cdHnJxbg3yARgh4n3HWgvxv+YQVGUGq2akSZB6wX6GmM6l+1FrStBuRcml
         A/4YdbgC3xx7kzLrstCWz1tJT+WiUNP/SGILDKYajUIFWFbK/zjEG78K+NbONwNCkfpN
         SVdIhH34iGByAsTdX8ArnQ0TY/O+L6TrLUFaaY0wLgtSo+VStI4vAn2mr8G2ofgjvFoT
         +74BZS1yhwVOIiHeylOKYi12zlq3xZbxGLMB+nzEEcM2gDmnQgI2898+9GjcgH91IZu0
         ABQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwABIm2+vIzsXpZMRyPq3EbTqcEyvEgmTJ29CyVzF16cVqzpSSBWZit5XFPte8J5dHIeb7jmYzZJEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDNm3GZFDK8+b6UuTCG3xQEe03s4YiIguDodwyg2nJIBPYzDv2
	PHt3+dsi8DNqJEmNU8x8tQxFbudV7zLFv4El6KEkKVIldtt0NzQDeqCaXbihG54caZk=
X-Gm-Gg: AYBFou2F1uK50yufdoTPSwvfe82OYVESgTV3/EBt0NSqiFrRKjH2KFa/vFr1ZGlY1xN
	9pb4sD6BfugekcZpW5RDqdvz4KILmO1IWtPhNn2LHUiA5nHXHxXLfM+jygFyyFkk6zSjQEgMcR3
	Jir9Bb7aC8QdvFdgKI+jxt5yaZFm6YBWsRsdvgIJWpcI6ai/sJIeaVE7zFYYgdgh609OPiBj9tz
	swH5g/5Q/VdPXsXnur327QF1mljtaR4AE9LaxeDQW36cJQ4zmNgBEYfu5w1Gp493ekE8uQutnYX
	BJrRIFqLj+fM95ZVhplqZdlMdfYYB+bI8b/rb+aI2h44hcyRnFhN1bYam6Kz31E6uzp0io3905f
	1IkU60vCTJDgPSBPoaKeEViCxdebYsikA3MORHat+6n9XPHZNNSoOMKyyhZKJMj2LStjXb/Q2ED
	MNZA20YzcA6YCyTtEcuMvHuQ18N4IsyBba0jEZi4VYgMV3/l9e2QJiasq5LZf8xCGiqcgj1LGQH
	TQf/aX1gsHHzaGCqE4oAQ+o2y632bevpCfeLoWmN503UwXVxzCCx6CEg6R0AT2y
X-Received: by 2002:a05:600c:19d4:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4a35acbbcaamr167523235e9.25.1793090082317;
        Tue, 27 Oct 2026 01:34:42 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm261457975e9.4.2026.10.27.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:34:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:34:38 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 01/20] ctlv: Add the schema language and generator
Message-ID: <auBhwll-zJAaLXRf@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-2-jiri@resnulli.us>
 <20261020233132.793b7e97@jic23-hlaptop>
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
In-Reply-To: <20261020233132.793b7e97@jic23-hlaptop>

Wed, Oct 21, 2026 at 12:31:32AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:34 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>

[..]

>> +      A named attr set, a whole attr group, or one exact attr as
>> +      "group.attr". There are no tuple selectors and no cross-family
>> +      qualification.
>> +    type: string
>> +    pattern: ^[a-z0-9]+(-[a-z0-9]+)*(\.[a-z0-9]+(-[a-z0-9]+)*)?$
>> +
>> +  selectors:
>> +    oneOf:
>> +      - $ref: '#/$defs/selector'
>> +      - type: array
>> +        minItems: 1
>> +        items:
>> +          $ref: '#/$defs/selector'
>
>My yaml is terrible (and all learnt form reviewing DT bindings which are
>undoubtedly perfect :) but random LLM agrees with me that you can simplify
>this as it's a local definition.  I think doing so makes life a little
>easier for reader by indicating it is thing defined a few lines up.
>
>            $ref: 'selector'
>
>I don't care that much though.

Tried it: $ref is resolved as a URI against the schema's $id, so
'selector' doesn't resolve. '#/$defs/selector' is the shortest form that
works without an extra $id line in every definition, and it is what DT
bindings use, so I'm keeping it.


[..]
