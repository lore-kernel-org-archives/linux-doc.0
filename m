Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974927;
	b=waTk0bWrCLyZ/MPc/x6qwBCVWUg2H+VJ5SMbHnH0iJbaGPDzjaiBLPgDXHrhlR9ibQBl
	 vAgLwaTDJX+io6Mv7UiEOQ4esHm7kpZ1Jn4tCr+bO2mJsj6TeYHhlpw2Hg5bbP78Xg3pY
	 jaymI/OpbIfsIaGpMEM0o5oxiBWJv7JgqwMhieSjDeCGK03nF/mB8lhzrtwD6wWLsobqK
	 ireYfnNSEUHBE6dGtiJ45VPcrJrnnTcV/tADIcibK2poEZGCsBmYhnMYdcSZKjWUc/E4/
	 lO9WrFnKSNP002xzBB2EZX5iPc71ZSz1IdM1QXlyHaGsUR1mWl2Vrd11MJ9PJfM2WYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
	b=3RbnmWUlvwwezVBYx5CnZ4q5s5RWJgA2TprhUgRfkCfQIOSa0bjSmTCEY7GQLtJQPMqZ
	 G5+WLU5wJNEZmTxp27LFcCth1hSzj/pcKCitSUg3Izch+MBjlr892G846++Y7HVAFMxxz
	 f70sMWX6fCpUl8s9Y/kXNFOGJTyoZgbN+ES4bpWE2YeyTlPLrgFjaBOwluKZ3J85SlaVe
	 xxHry8Fu2q3p50oVhrE5nAXCH0v5nzI38BrLipbSoYKfyu/8/UnORWHLSr955J14pbVoB
	 s+oaYINH+4r1KKZC8c8zEDZRh1uADjxiPSiSX/ZGPtWcmPWeM9gXQa5VvkFvb+YiyOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=njplM3md;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11078606A31F
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11078606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=njplM3md
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1252166a12.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974926; x=1793579726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
        b=njplM3mdJURiFtDubYKaOfdLnMma8l3vjNmOEFUeg+E2dIDMxZdZS5gPlHPm7CT2LI
         xac35vlTXGv7kMrt2tYHiDLx24Bl6NaLQixMgWAjjjxZ2WyKjtcHlyLQZBBFTL+cu67g
         HWYPLXAxjlJUxwQkeUtVknDJjLmJULxEarhr37O18hYhSaSf3RcaehcOjXX0ovgVFQo1
         nGXhgTYRz7CBuL29RtbxRaaSUPHynQSGs7KBfnZ/a1K1n9kP9ugkfNb9iphT2mj9G2wH
         KVr1QTQGiIi2GiYvm/b5+MXp2LJP/gHn+XJoXzzNNyNTfMMB0WMqLOXAISbxmNvFlqEr
         kEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974926; x=1793579726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
        b=Xs6nC+pf1JiSX6nBPrCKIl3ATfBHS67wmOGWjhhrv3J2e4fp8E0kNrRPq5fovUqPSa
         Grv2KiBrYjNrv9Hz+6It0J56tEuzvP7M3y+y+nERGvj8oowakS/VN+SXhtrN7MSCqzUf
         8wN+Op/+gXiSWtPoc4OI5ZKTIRDLmKOcAJnkKz/ZwSbXRZ4MZunXiMqbgpQir0+krbGW
         DmjBqory9CvImUWOrVnb11qZ40X+SUteYIXYvRYU8TDn9Pf1Mk4phxXBAXktLZJh/HCk
         Ri61j/Vpabg09ACqVG5p+9uM5/MjTKNIpFYv5CdDVAYe0KJyZpZOG1Fa3WCo5PGtlUxu
         KhGw==
X-Forwarded-Encrypted: i=1; AKwUvBynLqoILpCPQveM+itH+h4MnLYx6WAC6Ra2Q8ck9BXhm+qCAizfmGpTTpxVip+HpaWEApmy2ep2sYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK75sIX+wEVufJt95DTJCvWhJw14e9Lhf/FWgiSXK5JoSBzJ59Q
	ChVZBy3wZ+tth+lDNPU5SyY7sEh5t+hgigbNuPuZbruSHDKN2NgnvxW1
X-Gm-Gg: AYBFou2X+8Twk2VeADc4cRoWO2mFXmBrH5NuO3Drgaf0V4Lj1K9oPuY6X48cPGGOstx
	vqaFKdM5m1VpvGTTeE2LBLNUhoe1npILwfbdvSQq2o2wazqQ/Xx0sbm155WvD1MGtuErGqLmr05
	cS29CHyN3FRdf6wlnIQuzfQcCd6DH1bHNTl9jtXkloZIJ27bAuF35mkwyzg7dqEuJ2LDgbDZY+d
	Ly9IZ9sW/4YYrahIIe+UTO01n/D2EyUAj+Y/qdz2Q9zxm/iC7Zvz03B7sxbk75bSsKhDFrFQeLy
	gbRLXfdtprc4cf+RlGfTqhUGj0sh3Wl2Lvb0qnnoc/peQgZD/XT+c7ZFIIinx1p5IpYzaIZXldl
	sGtwGBlN8XqndTO1a0Lvt5a513jFBIq89HSW8fZJU6mZYsfZmUQv6Pjb1xrVmSS+vp9JEW+e5bP
	syRoOVxYRnPxsmboq5sA7EFr77GZ9GrCzhns+GG46upI986uNnAyqeXVqm/N4Jw5AU74mN5jrn9
	FnMnrrZhdr/nrNsjH7pT2AoXubWiYePLL72WGZV8n02Wrc9dqPZG/YbdkA3ZfxtSDyHNMdgvR4w
	ho4O/SqHC3YUiGo=
X-Received: by 2002:a17:90a:e18c:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3adeb11f8f5mr4322887a91.52.1792974926204;
        Sun, 25 Oct 2026 17:35:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0a7sm6187626a91.9.2026.10.25.17.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:35:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:35:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
Message-ID: <083d8718-bcda-47d8-83f6-6090b40689b6@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
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
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:05PM -0700, Abdurrahman Hussain wrote:
> Add the vendor prefix for TDK Corporation, the maker of the FS1412
> point-of-load regulator.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
