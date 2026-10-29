Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302738;
	b=UFuRtxelKd95PcddShWQkG/t1cC3IjcUEBN+Zoe0XwBBsgKr0voAfTH0v3ZnhppwJlCQ
	 zzV5mgSYTEWSfpa8ppKQc5mcxsROVlWiyZ2yFsP/lo77sQUWjsCtwSF0CHITQsnEN8ycN
	 M/B/vRyv2pHBSZVUNVYo3azygfyWVgw1f+iDkztQqpZZyE9Fp+l8aW89URhZ0faJfiJRy
	 0DnqGUtX4gOYDU+jtZgHvTNqJB4zj7ljOgPPOAwh2Zj2y+E/KMpH09iHtGIQZYE0CumFK
	 upOs+Jw/ROu8vNIFc1XM6tVGRo+b4JjLcXLmsOojI8etOdqgPBwjv7DQdplRvJ4jIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=L2bOsI/tPPOv5HbBwJUDpCwYmaK0u+9V6K9ALx35wl4=;
	b=FzsaYjfy8Xbyf7AdiKt+d6lOCGBm0L/0f25ehFH9oK+9PPDZt1z+ljVmc9LImHIy05wo
	 /asqe8L4GFWsPJQMRT5lIn2BkKjjZw/yTkUCt+He4AGF9YV1lOEvjrrjkoF+YWOV+ewGj
	 ctEyqUEsEXVeZbkTXJzZNERKI06oq8E63/PbSJeBrzSgclK3NY+NEN/CeNB0IeDwkx5ES
	 x3k3i96T6KvGwU8YMvSxH/NoAjoPabllhzo2z7+tTQwvJv0/ROoejA7DPXLeW1g4yJE5Z
	 CXQmZhTQ1RHt8ncaVCC+x+6CFhnVafl6Cqcigkb/CqgcT+IQxGuGdAZQRzKGPQt+5LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC47606A31C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 19:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC47606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a9841363b5so291491fa.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793302734; x=1793907534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2bOsI/tPPOv5HbBwJUDpCwYmaK0u+9V6K9ALx35wl4=;
        b=FNBa56KT/9Dp2z4RqTJX4SmEdUz5QF0XsrQGqBzBDcfvePMHkyjRSZHgA2dL4abyfy
         Z5mCosjvFkTxPpDmCgqoP7G7lT2FVFFUQ0YpXNjOUhaorkhdgy63Iaj0z/fMjsNDNf/C
         B7N559oM1aQ463TkFMl4hlBO/WHCqunTmnc/UsMFfppEpnpGG5WUa9uxWJFZXCt4Mw4m
         rz9/qKuz3+niyjl8T1wW4UCRCMZX5MVtZiU3CO2A9BHdOcdEtVxmOzi+D8+vZa+Jmmo5
         /rJGHoehxWckvC7h0zyK1y6pn3xGNLKqI4ReeBj7jtQ2yBzeEYj7vSzrelBOMx5CX0az
         WXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793302734; x=1793907534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2bOsI/tPPOv5HbBwJUDpCwYmaK0u+9V6K9ALx35wl4=;
        b=RcKgDbMbQ0DLdH/f8zUpqWdtfKt3afzQHgU/Tu7twdnn2HXVHxNvb6nI6q41x8PF55
         FeJ2ynmcrZrSmpgATsLoC8cs9nlY1hUlWdNvBHfzrEEJBUMfNddqEu3EU9tqXK8jxwuI
         HIA2gWlGGLMLBBa4J1PyoljSxHlnSHpT9JeCRpeaDYc7BA6ZfZVJ4+xGK62/qOAzt2wC
         5iM+Tsjk4UegNUDHjyxT0ChPpeWtkzkkU1qXvRz48noW/Mi8kP/PTX9iJYDKK4yR1exj
         pG4wSAPha6sPbflKzVuvtEjrvAV+UcNoYYK74U/tWnx3JwHjbJv/Ke8pPKU7O0OO9KsV
         554A==
X-Forwarded-Encrypted: i=1; AKwUvBye5to9jrxzY9Dd5MCMubxMdUsvO8j+TSwkG0NcmXYeaPJ5lrocS+0MpLRry9y9aJmlzXZxo1myHGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYISoGfDyizXlZyqmMhSCWULkFnNZ+OfPMPL2DAa+A/omanZy6S6
	fzFYRF9zoMUNqBif1072yOVu4ekcHqOyOBbneUa1D1P8oq0Ip8WqRwtFFieZ5Ft9g8s=
X-Gm-Gg: AYBFou288THH2Vf2xEcEdTC9CqERAbgKHpaPpvMl9sMYFJRyPxUvQXu/tzkK/L2xJIR
	DI7lXwLQOZPLczYGFtN31w3kr7AEbsl9slL3srR5p9RbZKPLkiTj3hsTbbtP7rCvfkvOkUMVbuN
	MHIvRU/sh8DbX1EIUs7BGWLUCzSDF+F8Qi7worEOokOgV3SlQIcnpRcan1PncsfbRzEF/R6ZMdM
	k5F6ufbJoDQr1LbRfzuDYTBDNxgoi7rqJoc9+syg5Ttxxe5x/PkYvOpMqueZshcng5nQQhP3+zd
	/s0jm7qbEs3/ITxobg8ZOqQ1lURBajPbxdwW4EdNw8UrwpBHTHeWRpB1DBEkloiCu0F3l5cbRjN
	R8gqvg5mIHy5BqS6OsVC/DvWPpXOIR3FYjmRdmBcJ1S7WHY8yURRZYkl7E3bYSKblY27Vo+OJWO
	I/vSRUix037f4GYIJNXpw0vR4I0w5ieBlSbMbdNp9ssW43s1uvDV0Ps2TvzV+Ylp9tnMELtvBc5
	0xIXZdmrarLQkJPusc8p+Ef2Hq0N/6W+LKwgFZDtAwjrLu9CXnXiO2y8i2jYz2JSAnhCiFcKuFK
	PP8RLIhvnv13wbLJ4NC0bgP/Dvp8+oXRmhkvZm/4R8kXfjizzGMdO0ZKwTU=
X-Received: by 2002:a05:6512:3f03:b0:5be:414b:a84b with SMTP id 2adb3069b0e04-5bfcadda82dmr2380923e87.51.1793302734163;
        Thu, 29 Oct 2026 12:38:54 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd7ef0c2esm69050e87.50.2026.10.29.12.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:38:53 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:38:49 +0100
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
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auOgwlGeW-vRGVb0@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
 <auMX4kbsflE9kK3Q@FV6GYCPJ69>
 <20261029184324.GE3734323@nvidia.com>
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
In-Reply-To: <20261029184324.GE3734323@nvidia.com>

Thu, Oct 29, 2026 at 07:43:24PM +0100, jgg@nvidia.com wrote:
>On Thu, Oct 29, 2026 at 11:04:58AM +0100, Jiri Pirko wrote:
>> Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> 
>> [..]
>> 
>> >
>> >=======
>> >
>> >device-get:
>> >  request: {}
>> >  reply:
>> >    caps:
>> >      evidence?:
>> >        min-challenge-length: uint
>> >        max-challenge-length: uint
>> >
>> >Did anyone implement a variable length challenge? That seems a bit
>> >strange. There is also a very important crypto warning here that the
>> 
>> Yes. TPM2_Quote accepts variable-length qualifyingData, represented by
>> TPM2B_DATA with an explicit length. This varies per request on the same
>> TPM:
>> 
>> [1] TPM Library Part 2, section 10.3.3, page 136: TPM2B_DATA.
>> https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_2_Structures_Version_185_pub_c0a962a931.pdf#page=136
>> 
>> [2] Part 3, section 18.4.2, page 158: TPM2_Quote qualifyingData.
>> https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_3_Commands_Version_185_pub_87a5c10230.pdf#page=158
>> 
>> The PSA Attestation API, section 4.4, also requires one implementation to
>> support 32-, 48-, and 64-byte challenges:
>> https://arm-software.github.io/psa-api/attestation/1.0/api/api.html
>> 
>> FIRME DEN0149 1.0 ALP2, section 8.12, Table 8.23, page 100, likewise
>> defines an explicit Platform challenge size parameter in x4[31:0].
>> FIRME itself does not mandate the specific 32/48/64-byte set:
>> https://documentation-service.arm.com/static/699c3b70b60ef220b14ec14d?token=#page=100
>
>I feel like userspace needs to know the difference between 'any size
>between 0 and 100 and 'exactly one of 32, 64, 128' ?

True.
