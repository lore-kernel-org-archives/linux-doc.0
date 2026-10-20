Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499340;
	b=a9mgXo6Cd+vvXDKSco5TpAoGBDEk3SmmF/TRt9HDk2eCSDEHEIktYu5zNG5fv/VgbQ8U
	 KTch4BZgFEQ27oqHA/6IIXsZqmQ1QSAoQOH9sInAKKhzj+2gcQBT1jAqwp9Td1xU63guA
	 qsAqGK9rwjUYFjt6zEgp9scA3weTqVhvB1xk+xXiY65/GgCUCavqLdGdodoH6p8reV/D2
	 QLHAhO+h/M156kKRr0zqagJUDu1L1UABP3FWdwVtEu0RhXsx2KHKLncgnfHtuuEPZ1BIP
	 Px0o6gxjvLgxxyz5mG+iGqlTIn4J26m6V+mez4a86thjl8H9updTLehEG7h9FOfVFJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5bLIqnhjUZD53MQ8mIyoL64maRPRtf//51viUHZYxfw=;
	b=Dce6LvVU90beR1zWpJMifWi/HBJ23jA4t65ihslx3a+Rw/hgbzcccP71UDKTndh3tbKE
	 AtUiRYSoSdsZwQePgfkaKLHHZAU9TPxP53+1u+cfxiH4sIscx0T973IBef1BHnMLa2swy
	 p6B1DmhKPzn6H+r60+16I32kZBJZY0xqm8GMS2UGGqlCrrRXiRx9xpfgoi2iK4hqpwHc8
	 Fl0qfurYmOsI75KtwCmkKItxZxX9sS5JQzqI8XDH9dacZuLy2hVsS+40nwWFnreAPujrZ
	 3THHx9dBTxUwLVVcmSc78qf8a5CFUwmsMvk7bXNfLzfQ4JLWIex+9sbQK0JtLqyllzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=YWQo69lb;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C59606A31F
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 12:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C59606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=YWQo69lb
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1665705f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792499338; x=1793104138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bLIqnhjUZD53MQ8mIyoL64maRPRtf//51viUHZYxfw=;
        b=YWQo69lbuMlzAP5RdqrQrLx77X6LX94CycMTmUoX+vc7zIantga+lXOuVqP8Vgavii
         aMHjXJgGZcMilKGQVLQxuos2bg5NWmwNeszGgaHWYw6MOq1Wdtg/+QRSrWzrrzhTS+Ra
         S7bgQNT8g9yNBpi7b8JDzTqCzz4Avn1jbamDZDTY8/tXJ/ZaYpuSKa8eZEDVl+8+Qqmt
         ZQLt7KhOKj5xVUgPay5ZDn72g06IDDYypT7LTYrrJ5htnGnSgVHzjmkZIusiQQBJcUfS
         alOl0TJHFJO7AxJejHgBf9DgXpAIcJEmh5xR7NJHWc1kzRyQ7Jm2TxL45dPOy6Lu4mZM
         2Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499338; x=1793104138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bLIqnhjUZD53MQ8mIyoL64maRPRtf//51viUHZYxfw=;
        b=Gk+WpXCOK6perlSZRxAEALOSebI67ynY76jbWdP16RzHbzx/1ONcU+Dn2EQsa/hY15
         la521T9bivvT57mKs9g1sURZdkFI06tKGfqnF/sDa1eRQZrhBi5JHYzJtjc1XriaJr5A
         KPy0uJ6ecqCaWpp1XOWlPf+ymBb/fJgMEu7KHZxOZrYkBTu/tda9+TONGP6Kwezkmp7r
         5oAjUkJ8F5dRASzh5MAl5Bcc3RKB2gt+FcU636azdw/FgLiWKttD0F0vJ94ybjyt+9Em
         EXn5rHlX2C5AG5sRHglWpdWMfP3NqB1M5MEY0Rka/+Eq/CO39HJVl/B0Bk0cxX9fzPhg
         3ZuA==
X-Forwarded-Encrypted: i=1; AKwUvByxNCe0U3tM7kEfyGDj/iPCuobpDcvMkDAaxCpPY5dPHB2fzTsnlVxFtESGeqK7ErmHAqneiq5Lp20=@vger.kernel.org
X-Gm-Message-State: AFq9FYLirF8EkrqfQKqJcnoREHpsqPyd9X5X22fSSa4d/Anis3phIlM0
	uAotY+WotSx8VEHnn5J4GK5mKenv1dxLtj0pDooyhuRhsl086B4XDffWtkurkNZaIVY=
X-Gm-Gg: AYBFou2RgskTbylM2b38YbR3sDgyDjB7069vfnHKAHpjb4k3BSyoJlWV5qgvENYOW+H
	rGeWcMmpaoOTrbKm/B64LouA1JUvxXcvh/qvwIVy+MULsobSRypg8dyNbUhIOzxay5k+TDFc+pz
	dja0t/DokM52xvUlfWjdcSKSa2Q84drmXH27y6RWye4dAkjl+SduvJ5aZc11pAbP05QLJaCRR5d
	zoLf4PWEP5Ouh4NCYaj4trtTm673uQSkWugRNcNgbzE+G8qVOmyM2DWZKuvhA8eFmBBzHe6j3DH
	3hDXdzDen0H+hfVLYUcCp5TnEa/luX68JbWLAqMDk3Q5T+ZGO839NES5xYItTTO9Dj7jbf4B/yS
	r5/FX+ooT0prVOkmCj1o5bu5I6eB9y2ngR2grfni9nE94iamOzg+tlkRJAFycJEp8Uv1mINol4C
	6rLYNOFo/VkfqQr8Ya5MofiOVm+vqhZvmWdFxc351vvOrkoSs7SXU71YuM7Gt64rq+M7C3eKUPi
	MMz
X-Received: by 2002:a05:6000:3108:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48e07bc104dmr25850403f8f.31.1792499337690;
        Tue, 20 Oct 2026 05:28:57 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fc6csm5636775f8f.14.2026.10.20.05.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:28:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:28:55 +0200
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
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <atdeH3nA_gkLwPLM@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <179245258505.58760.6060356114682279013.b4-review@b4>
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
In-Reply-To: <179245258505.58760.6060356114682279013.b4-review@b4>

Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
>> [ ... 238 lines skipped ... ]
>> --- /dev/null
>> +++ b/Documentation/ctlv/families.yaml
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Append-only registry of CTLV family names, indexed by family ID: the entry at
>> +# index N has family ID N, up to 65535. The root family owns ID 0 and heads the
>> +# list, and every other entry comes after the entry of the family it inherits.
>> +# An entry may be marked deprecated, but never reordered, removed, renamed or
>> +# reused, its position being its wire identity. Every entry must have a
>> +# specification in specs/<name>.yaml, and is added by the change that adds the
>> +# implementation. Fixtures under tools/ctlv/tests/ are not registered.
>> +
>> +families:
>> +  - ctlv
>
>I see where you are coming from with this, but it is going to be
>problematic from a global kernel perspective. Given CTLV is imagined
>as a general tool for any subsystem we cannot control the tree that
>things merge through. It will not be like netdev where there is one
>authoritative tree with a linear history.
>
>So if Bob and Jane maintainers both add their own subsystems by the
>time it gets to Linus the IDs will get scrambled, and bisection will
>be lost. 
>
>Either changes to this file must be strictly done in a single tree
>with shared branches (which is going to be a bit hard process wise)
>
>Or we need to put the ID #s here and have some simple process to
>coordinate them during the development process. Since new families are
>probably rare it shouldn't be a big deal

Exactly. Collision is not very likely. Explicit ID or implicit, scramble
would still happen. And in that case it is resolvable.
