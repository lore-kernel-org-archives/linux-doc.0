Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799343;
	b=ea9x/FLan14ylRYrmOnqMlpjamk4h6iI/vgagkmlfm3FoQ1aXhvyDW/l5uxhawJgLcpn
	 KMF/dUWuSNhQNOhctLlI798Cxf5ZqBV4lK1A7O2hk4t0+kjq3OXZ/3FIzeML8qrXgIWN0
	 ZfTfCPWoblKk29MVcZXcmGpF1f6kpB+jmjvRTxC9aTeD0pl60/03bnp+YcB9cLe5CCjEo
	 SOwztUBS8h65m37WcguFZ9aI7yWwOcTRxbgK168k4moP7B8FPdy6sInDtCs5lPYB6KxoA
	 327jNDgf3I7JHq6YH1s3fcGPw0W+FExFLFDA2LAz2e8cc/WkjcnQkRHvgNWtnI31/Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
	b=w6AHcESzleo1UqTTXOAo+LbViKJRTBwWKEoT3Rnzz+ks0cwqIAAp+mmMUE5vx0O4Wgs3
	 GsTdZhyTh/tN5C8GXYWtrKqvJ1G43Hyvzj3Purmp47ifhgQ7OSi1kRGGkqUOF2xR87Psp
	 q5l2SsPalPdchkS5o0OQVNLdRTblpaw3edw1TafMBw7TZYxSiyGRKp39+aAIG/bYYl5K+
	 am1JJf6p3oxp6yRgDfFeQ3CX0DQKd22i65mzmkGmHbA9360/P7yVkBpy1lplHNoWHvlPH
	 GP3VVENIPYIu3jEfqwE1+2n2mS8j9vYK7oZ+gnfyLlcfRZuYaOBtPKrFN44jzLL8/qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NpcMn18Z;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0E606A32A
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 17:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E0E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NpcMn18Z
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-949664ee41cso840114985a.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795799341; x=1796404141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
        b=NpcMn18ZOcBUH/K57xXEmosR6TjqGtaHb4iOQyIq0GgNDqO6dAa3ahAGzdoMm6DK/R
         3dkns94RmQsNEaf/27kIYiOKFNzoSKhIXNccUkBguWLK26AIyGo+A089UsFFPfbNz3JT
         fRNukHbF1g5uEH+w2aeet1LpRPQxG0BgLshkGNvKg+X6WFsNVdvtlTlH7jbh0mMU3AE+
         droQd+7Wzvs1ZZv0Bm+V2UKWtzqHa4QvPeJsxPzSnXUzGeAIakkUFw1mjKjdYkbgy2S8
         Y9PJhCrLM+XiW39othsK/ZS90eIpfnqQ3cGzLWFY0EcectQslbi4vHXfem+Makltaxhy
         GuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799341; x=1796404141;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
        b=FvLmIiKUJ1hq618p1V6AaNkgNxmosW804Y7Yx0tGFQGjSaU635spKShjcbFdBETsYC
         +sep7BsXhY/5HVHATpx609QBtqz+MmwajOzKFa+LPA55vzM3GIal9N7VTgf41DnDVSlu
         EmfVpd07eAHz3gFogVvUZt4vJ5IGicU6yVE6auwr54qR0Y4v95loZDjlJXWnPatMzVes
         TOwaFOXuDhXQlElwSdfzFZBn6vU0PeMltFFMb4yiotQUazoSNqhioeu+iolkhv2nqv39
         U6jO20XvQvS9U78wMi8ZaflCrY1dBaZ5RHQshX/k38N0I2VlTUGvyGfDt3vpaf+v0GNo
         rvKw==
X-Forwarded-Encrypted: i=1; AL+hErF9S2pvXpvuzUjmqAL1lvncaepPExkY49u8Vu4WME1nMKIuGepODeX9wSCe9HYkiKm70l1JSNg8sjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z//KElryCJRdfXGB92kKawSi47QkgjpeghGFXLAXL3IApovCEhG
	o74UJ2VhSrBno3itGhyapr/FZyP8UKjd+1tK/isy+dgXlr3uxgdfKDQKudhu3OK64dvQeDGTAg5
	hp4d8
X-Gm-Gg: AZFdTZdiy7NbPoKJviOc/ChF2mpA7zOmCQ0zYYys/U8jzkRuhhtRUZzb99v+H4RQYDZ
	INgNd7RCjO4lZqZtd6h8DAcOeUj1srUxCpkmr+8OM6iSizTqA+XmKgompWNJ3JO2CTRMMI7qQvA
	E59hUCSgDrx+vt2pUTGetZxrsdMiqxyWSiiT3eVxfxxFeCvQSj2YxE/ntUUys7Obj/TD6Tp2xzn
	4hdcPUkgYZEFeoR1VGxqC/zc8YUI1qVcGfRxrmRRzB3ZwBumAEOCF/jwvkcwg4qNGTGjc6apkQZ
	BHXSUcSSAY+M+dZETUc29DSqCd2G8XA2GPAMhi2yAt02utKiEDb/mJili9YtZXYtyIPs6TcpJ5y
	Ss1h4QtDwI2tUi86jgIpJ4jBE5wMJzDN3nxJ/nIEmIE6U6wFa+PEjFZpkMDjBZmdZmuypSRl82k
	kRb3awc2onC4QODRDx9705iuPVYMoQ0knBiTqFoUBpVngHRO6yivCzEEta5neyge1+xdhE+Q4iN
	KP+/9eWlMAh7p32jaaWO60Dq/v7MmUWHeTv46uliNOM4tnhxqcSF08kGizzoSwuYR5eYtr1c4R0
	tmOLYw==
X-Received: by 2002:a05:620a:7206:b0:94a:889:5a33 with SMTP id af79cd13be357-94a08896165mr1311739085a.30.1795799341642;
        Fri, 27 Nov 2026 09:09:01 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm1875035285a.37.2026.11.27.09.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:09:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWzRU-000000079ec-2Xcr;
	Fri, 27 Nov 2026 13:09:00 -0400
Date: Fri, 27 Nov 2026 13:09:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 8/8] selftest: attestation: add
 cca_guest_attestation_test selftest
Message-ID: <20261127170900.GU246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-8-df3230afce8f@arm.com>
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
In-Reply-To: <20261127-arm_cca_mr-v3-8-df3230afce8f@arm.com>

On Fri, Nov 27, 2026 at 03:33:03PM +0000, Yeoreum Yun wrote:
> Add CCA Realm Guest attestation selftest to test evidence-get, mr_read
> and mr_extend interfaces.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/attestation/.gitignore     |   1 +
>  tools/testing/selftests/attestation/Makefile       |   9 +-
>  .../attestation/cca_guest_attestation_test.c       | 517 +++++++++++++++++++++
>  3 files changed, 524 insertions(+), 3 deletions(-)

FWIW, I really want to have an attestation userspace project and there
is where stuff like this should end up living..

We haven't got to launching a github for it yet, but that's the plan
anyhow.

Jason
