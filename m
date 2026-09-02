Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884FC41837E
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 21:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385112; cv=none; b=QAlTqrIqAhjgKYzLTtwiaAtM6TvtiqlFTEvScAznUfmPR30GjLYFI2A/qCX6wrMnUQG3JHcReT/I0+NAuNnjTPbxKac7rj4mvZPz/yFl8P0v585Bnvmu/OMBIufv2AawwX0QywEVBCfHtvoqdahHA/NBLzoocCJYB5tD6yx0taQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385112; c=relaxed/simple;
	bh=db4v1ANHItotB3g1ahWtztT7Yb7zlAgWKJovQuc6WCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaJAb6bWTv43cGPmDu0XNvjohez5EUEJ0GZcFdN7Z6j6ZwqrIT1MKbyY3XX7cHXhvkZrhZcjUKYokYCVrAD94FT1q/b/Q1ExRrR02KiXmPYVRHmy3DYlKYbJKZYD5ZKjmPhe2bhFE6H3Rpmj0adMvC3jg1TEy3vHe1FnwWfxBcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjyxnMgg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjyxnMgg"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2180884a91.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 14:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385098; x=1788989898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=30sqDP41t03ZcDIYxCSfxup+Ho20GhNPDK6CF26Jmn0=;
        b=UjyxnMggSvWjQlQ6CH5nhRqcYjt8lUYVhHTws3E11wjdUGatGChOCAE47U7chPtM4x
         H3OuRn0VIfU//l/Pv7Xeo9kDZVmgh46OC+6qH60Kkog8mrr7NjorwO8xJel8gKz9MHet
         pKoH4yX6nBxKnDC/mQU4FBWIVoZx6gRJvVp1NrzRvfh61WU0Ym+JU9/jxk4vbI2Vyq9N
         vRONhN76vDDHfiVqyuTzxSf3GXr0AI72hno2RwDpCSJqtPuqTZ/NfuW1iJLYk6cFOfeb
         JRfk5n4PUFzBd0Kg/rAR+84Yb0s6wM5xpe8k/G1kdOJGiU9ObcCNcy2aB55xkJYIYpd8
         trhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385098; x=1788989898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30sqDP41t03ZcDIYxCSfxup+Ho20GhNPDK6CF26Jmn0=;
        b=d32CQUJT3e1egJb42qz5chQiFPfyuHsDYjpFDw/6VTziRFffoiEyEHfKTQc67DTEkq
         jOuERPVaWlFBAiNa2uywSnWqOzfECCzYKS7yTzVBBoovu5fvwGced7X3Ziq97+G1Ix0I
         NrLHtiUXS375zuScSmW+EakJx078LAv1rxP++z30gtN1ABpKBAvtWouXtx5PEtKR9J99
         i5TZ6bGLqD5kFnHd3ubzaPcw8XqytUvClIl6yUNzSl9lSVoukCt3CaWRqw9IL4zAJIPH
         T4MSqV3aUQ2dRZkB7WrkY1+bJotGcdQXm7MJpuvhYrQy4smAmshdJNIgOHJAzMd0xDYP
         FuEg==
X-Forwarded-Encrypted: i=1; AKwUvBxEcdqbn2gpqvEONLnJRi3So3EvpDQOJhW9nSNO0y0i+nhC5TW50FxSWCiBxf5xS3pbOpfqvlTHG9I=@vger.kernel.org
X-Gm-Message-State: AFuF++kYzYZPfV9j+6Yiuaz0R3F2PzxNjK+qSIwPLPB9EP1KeM8un1I0
	2cN8hsMHUc8xUorgyTpGI8xuC+QcnoAdcqmne1L1YERQPlUnf4q0wvdx
X-Gm-Gg: AYBFou0aKXFj6qwl5vom57vYOwQ5x9QHTLDsmzj/xPkvvyAtXOw0wlNxyQV0hF65Fjt
	UYIMWi9rHqG/J8cBlfxI3JEUIM4eXTCn9LLgKYdvFd+1MgW4MeweafR/fj3w2js9fLKcwG8+3rX
	hnIgCv3TDs0Am1dEroAVRDkZ0gIfIHGdhv+gnmoS40s5fCGS6/g6rcQl3/ujn6kLDDyc89TWBzp
	i0KrEjKKqbTNP0aqunjwtqUjEnJxLtFQKs5Oe5/D25lokmVsrhUxSXmNTycPyTprDquSplAlPYp
	OK5vR1yyNBjTnFFc8O7CEmUffYRWmoATQ9Au0a4zn64VdkIWprXYQ8XlZN2BiUHCrIK9EkvJGPV
	huE7l1G8XJTMZUq87DjHRfzVJ4Z/InB/3DQJKEhder4wwLxxU/rsn03KMw4YsFA774ZkkEMOVjm
	gM85Y/Yix2F5+f4SSNpzTsHten6/8cN/u7GzXfFcBCpYzowQ+2jwXMeT/PxgYeiIVIlNoMIZTIB
	g==
X-Received: by 2002:a17:90b:2b45:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39aee16515bmr11966313a91.15.1788385097798;
        Wed, 02 Sep 2026 14:38:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e6e3asm1371740a91.2.2026.09.02.14.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:38:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 14:38:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add TI TPS53622 and
 TPS53659
Message-ID: <870df75d-bd0e-4e59-a81f-880dc4207dfb@roeck-us.net>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901211129.360792-2-sanman.pradhan@hpe.com>

On Tue, Sep 01, 2026 at 09:11:48PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS53622 and TPS53659 are PMBus-compliant D-CAP+ multiphase step-down
> controllers. Add their compatible strings.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
