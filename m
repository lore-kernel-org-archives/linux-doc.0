Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A3A28C865
	for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548893; cv=none; b=trQeAxD7enNSjQ4Z6TFdqP/dmeD0YrlxVQqet27cM38qjjLY2ZEPVnNQ2p/WxRYRUuv8wt1zhM3lcavH0waAwBkBoPcU6awFEAOQU2oV5Rj1+RfBq9d/ZOyyl4ipiZudArwRtQHqdzSXhq6dP8yZfn5/wF/H/1+2LJ0rdeNCrxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548893; c=relaxed/simple;
	bh=TTxxRa+f3UnqcCMRrf4H6liRDo8hs3NNhga3PVqNQvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aM9vFEpJYqSwaL+reJch+bess0ro2yksfY1wnW+5jWL6p7pCjWytRB2FprU4Qctfz6HAO5Y7hUKTJmvKyfvd62y0tCdJpaTTksNEGomTRp36F2J/kw6nyPTh9Qx8CnwmaQBgp/+zaliKaUsOjdtNjwNTNRs2POzvRG96qkdGmhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=GLQqoUBz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="GLQqoUBz"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234d3261631so36625485ad.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749548888; x=1750153688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zQmyYaU/03+AJvFIA5fRBrVmM4eOz2li116ucuEnt8=;
        b=GLQqoUBz0Jk86m0AqZ6Lyp3F5ESe6dKpMmUyA5ecP+6iVOVbUGtMwgD5BHeq9NgzdC
         ifr7E43rA5ZmFITTUZ0cQjm6TWYbvKAjeBILQWULdrJTETQ4gjQtoZJykBdORCszdqvB
         35vXbJtjgSHsBzOCLxOl+JtQHQrGNjyBv9U++uCG2kSEOtuva8Y5eAnJixWFftsPMOpQ
         3+tbF3x6oq43Nq4zjDx+86BIyDBDRKgH84Rd5jmAdsaEU8hqp6yfD8h2uTD4geEJC5j6
         Vpcuf+4IWcdhbS2f2ASgTx1exFCSvkOdbxY0NG47Gay5J+GOziQMN3YDQSBAX3m1bPFq
         gG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548888; x=1750153688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zQmyYaU/03+AJvFIA5fRBrVmM4eOz2li116ucuEnt8=;
        b=m/K0LdWe71Zfc0hyED8Im5ttYAU7kw+XZpLNgBIup3q2j/IiOFBzyoRZX1vKCcCSru
         q/MIN+D4QeE8FDzMJm32BBV9xvKjv/7ILH6tknrS50pMbM8bf6DO3eZ5Wh3bqkIC6iRE
         ZynUoFgg9q2sjcso1yyGJkS+z6UPBHgHek222IliU0gz4EuIvkYXC2BEbOz03A0xP9Ak
         0ijXYDVwAPJX0na6rpt8lqH32qFqlDSsd73FeG56jAiJ24DE+cbM4F1M1r8D0yDTdr9b
         B6ZU39dYwxrIvBSJVFYkiYeYjV3TaUPtrVpgGlMBFYbYmUsWiz/UEP1tjiL93uItjrQD
         ygKg==
X-Forwarded-Encrypted: i=1; AJvYcCUlRHLkocz/W5Hx152r6mqE5uYM38Rkone4J5aYex7G0L1xMRIlPACq7MHSuWYO4x/zqWGx5dj/dI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDOzcI2QrymvWDPh8ja0asYZA8RR1lDy/Tww8r9N+RTLXGBdyO
	VK/FAhmwO1kyrLdzQQ1WZJ9voQ2Ttp0sSUyaQU+ulgZ+PkkhDvvWUYC3MsLi/vw/C+U=
X-Gm-Gg: ASbGnctwqvvNTqw5rxSCbUVxLwvG3p+XnRE8fkfTtTHg8zKSwQDeRdPebUYnWFNDU9k
	EQUCU+wj9tONkk/UxJ7vUPZmbpatX8RU3Cx+W3+wa28CJD/8C9AqOML3FtGJEODcv9r05NBX62D
	Rw2jcjcvKXw55Km6quo4HpwyyX30tnOD0MfCuFIAsnmoAFCUQqi2/aXM9kxLTQyyMexzdE3hwRa
	FUACifEIl2wCyTL9DmrQk11LdD7JGLxzdQjYPpfSdw5elKxqVcHFvOjh8p2zL0HxhrlKXQh+tXl
	Fs+Pl9zrf0je+GoeftVesvEpTp8ngC3P/9AK67q4DBV0q8cWSbLlyJGROODemVnlH42UbdeSKAe
	OW+/afV6Do2Xc/uHMPeSrav4kNgS7mZib+XFkclip
X-Google-Smtp-Source: AGHT+IFTJerKI7nLBzkfbFwxLiCZ8/O3FBsLBWB2rHz59j5SLYJb1rjqSHl7mrROaYWtZGs6ZS1rZw==
X-Received: by 2002:a17:903:41cf:b0:224:1eab:97b2 with SMTP id d9443c01a7336-23601df6a23mr244281155ad.53.1749548888066;
        Tue, 10 Jun 2025 02:48:08 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603096949sm67293155ad.67.2025.06.10.02.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:48:07 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: linux@roeck-us.net
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	chiang.brian@inventec.com,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v8 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Tue, 10 Jun 2025 17:38:12 +0800
Message-Id: <20250610093812.164960-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
References: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Jun 09, 2025 at 5:44PM +0800, Guenter Roeck wrote:
>
> On Mon, Jun 02, 2025 at 12:24:54PM +0800, Chiang Brian wrote:
> > The TPS53685 is a fully AMD SVI3 compliant step down
> > controller with trans-inductor voltage regulator
> > (TLVR) topology support, dual channels, built-in
> > non-volatile memory (NVM), PMBus interface, and
> > full compatible with TI NexFET smart power
> > stages.
> > Add support for it to the tps53679 driver.
> > 
> > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> 
> I was not copied on the first patch os the series, so I guess the idea
> is that it is applied through a devicetree branch.
> Ok, with me, but I get
> 
> CHECK: Alignment should match open parenthesis
> #260: FILE: drivers/hwmon/pmbus/tps53679.c:151:
> +static int tps53685_identify(struct i2c_client *client,
> +				 struct pmbus_driver_info *info)
> 
> WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
> #295: FILE: drivers/hwmon/pmbus/tps53679.c:316:
> +	{.compatible = "ti,tps53685", .data = (void *)tps53685},
> 
> That means I'll have to wait until the deveicetree patch is available.
>
> Other than that, please fix the alignment and, while at it, reduce the
> number of lines in the description. Line breaks should be at ~75 columns,
> not ~50 columns.

Sure, thank you for the information, I'll fix these in v9.

Thanks,
Guenter
