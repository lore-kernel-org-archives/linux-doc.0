Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886756;
	b=KqdQnrIIykJUv4bhMZLfiAhM4xUeSWjPghfHXOCmr0K2Z6vusWA1aoilaM+wUHZEnjsX
	 tAfUzPclMNitv0Ybr6KeMqNYW5kM1KWkyhQ48NEdjHFBKRRtD2Xh3TMFGYHIQwDbcS5ks
	 ClnpwhHefGRvyjIykBiWt2SgKsQezRXGPQPeV03+W2m7+v61joU3kITJitAI+WJfTw0m5
	 d/caeEJWhXGcA7Y8TOf4QGrKRUJDp7DsLHKMEpgpdvSTULO9dQlY/tzelSNGIQy0atw7J
	 qtUUzrZQeXQkxSwAql5u82Om/dsWnyJvEizRbf4S/OCf5yQr0vuTJXUb71HmsJWSG2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QwmQA1a2QhYSOPcBSTBe/t1Xyv+zC9XEOaQnTg/X7XI=;
	b=H1uQCwH3cmasiC7QTAswoUbcEqGCW0goxom8ACZX5TPfbdyDhPG70oJtCM/w1garI9/9
	 SP4WMtzwUyZz8x3DzRZOUpUIlQzdEmuqQW7WacG9x+j37Ky74B2eFZ1wqqPQcecO0IqhM
	 2aIVpAAF6TSGCucNXz76cP38YwQyFduTcIlExEPlrWsKA+3VZaCOB7qL+9YuA97riwOdH
	 fIbR6B+RCQ/hzz8JolRFyGYuXYJ4axvBVfb3yB+BRQ+RzuYNruOPLoKfWVa3vJYJAVRCx
	 WwpNzPX9RmUWpuz0QlQpmXJYgrAmadA7mnndMQkcDObU7vdfY7h0HY6Lj9RibIUemgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159FE606D809
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 13:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 159FE606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so17250285e9.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 05:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793886753; x=1794491553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QwmQA1a2QhYSOPcBSTBe/t1Xyv+zC9XEOaQnTg/X7XI=;
        b=c34gCj/8CF0gjZPD4S6DE7fp5Zl7gSX0P0hMJk9lFt1y+nBZYrLUQMyOe9yskOljO0
         mWq7a3nzqXz8tp3I6ubwhzBAOsJYhD2zSynoQZHrZRopkQjPUFsi2whqLUzl+ldansUM
         MIoZ/uxtCEAMb9QDpVquB9CLXS7hpypOQBKzqBwygEabCHs8+Q8vFHnySRybX3XMNR5x
         /bmNPcFbYLThOu3b+Gb9jeXLHMvKt3ZgoiXr0DY8zyFrDCAKVO/1n77AROFDNyHGSlRT
         4sQdtVSWMSH4Fk6Bh6Fa2qjPcR18tiYc8STHLzktuM/SW/ODCEM5gMYc36N9pRaZ8t/X
         7c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886753; x=1794491553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwmQA1a2QhYSOPcBSTBe/t1Xyv+zC9XEOaQnTg/X7XI=;
        b=EzsSGPoAD/Prdy2oY45IMR0cxfSpBo8alLAhAPrSQkW6ft2uMaKIgH1b+mcNOXt9N+
         fVnjJutldiEQniRb8wBYfmlrIVGCSj6uTJhjdUSTzNHg8LXzTSfFiuz52PSTaha0ReRU
         T4oueZXi3EdwmDJCqQol+wGwi9Z9kGuNiwO4brvC/svx7ZHVRRPGd1W9+N7azQ1cziGA
         EIxlqb/vR1mZyGzvjCfNNj21UBXqJgdTmUyqkkvryt3kmdG3AMU58AARjW/8uLuz8lz/
         YZoGajbJyn+DE+AqaVnW5LUQlf9Sv1A6RIo+VudL1skGREfPCCOmouT99hm5cMDnMx3s
         H3ug==
X-Forwarded-Encrypted: i=1; AKwUvBwlXBAtAMaB+3KJ6FFzQRiRq36WQ0iGunUD28n8190o+fFcUqZ+ik8xjJEIS6TsSJaUFtB1mKlrMwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8fwcgjOYcWBfW9xA3t67Ytncqq4XRayuHRMPA1gtuMGY9+QTl
	6zMWufg3mGw2Fq21QJR8qvduyKOztQ13kTukxj2sE0zzU0mAcJ6LB8f3fvTWT/E31NE=
X-Gm-Gg: AYBFou1NxYz1miMQPosnMArf4EdvuXaoySyrFzlrny2xtxSCN/wPkW+cySPavEBazki
	EnU8XUCSW7kIJl5vT3znk3R8j9ru2RFVV8I0h1kWizQetV7fSrVfKVYktbfJn83vheqKr5I+i0k
	TlQYvjhswHUP+E2ow14cDlLC5k27A90u+9OvU9fh6Ljz1wWOGC0zMmjEmJ8uQfpJJXsvJ/Ob2ys
	ZdwHD0i2FF8nfOTxRgAuwamQHuEnjbPLMzri4nW+0y/wYDm6czhLdC5QK1/DuTp7yOeFaP6ByJE
	yKMFbDUB+saVWQ71UKbmX9c4+Ak/g+DjsUun468A9+9HfN5iG3aI+g5PCp5GVzpp2PykS9MeoTf
	P89Qz4jKpCApGOQg+ilRvhYnf0PsHQmXXXEbnRqCaRsmWqLA54zg1d1sHlroFU4JoBge1MbKI6K
	TRYwZwYouPWpFNMn8AihWmcxj4ro7OMGLCNMP6lQ9IkcqZd3W24lp8tsCu3Pc9OZYoQ25aFJPDx
	wggTWeOWSOP00qVUYsYveUzIUFw7WRyEx2CDe9L+AnfiUD11GKZck4OQhaJnXCFo0LdbJ4HTdtp
	Iese1L9FA/11IVKXfTwcVV9UUjGQFggaRZcatAM=
X-Received: by 2002:a05:600c:83c5:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4ac17191074mr383781755e9.5.1793886753121;
        Thu, 05 Nov 2026 05:52:33 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm127121635e9.0.2026.11.05.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:52:32 -0800 (PST)
Date: Thu, 5 Nov 2026 14:52:28 +0100
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
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auyG1AnzpjLdOtpR@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>mr-get:
>  request:
>    id: uint
>  reply:
>    name: string
>    supported-hash-algorithms[]: uint
>
>No definition what these numbers are. They should be TCG2 defined hash
>algorithm constants I guess. Why not have an enum here for them?
>
>    caps: mr-caps
>    register-index?: uint
>
>So we get a string and a small integer for every MR? Like PCR10 and 10
>for TPM?
>
>=======
>
>mr-dump:
>  request: {}
>  reply:
>    items[]:
>      id: uint
>      name: string
>      supported-hash-algorithms[]: uint
>      caps: mr-caps
>      register-index?: uint
>
>
>This returns all of the MRs at once?
>
>=======
>
>mr-read:
>  request:
>    id: uint
>  reply:
>    generation: uint
>    values[]:
>      hash-algo: uint
>      data: binary
>
>Get, dump and read? I don't get it

This is another netlink-influenced terminology. "get" fetches one object
info, "dump" fetches all objects info. "read" reads a single MR.

I'll remove get and just have dump accepting id as a "filter".

