Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBA7168AC
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ggQl4cAl"
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86348D46
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 03:27:19 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53e3e7e478bso934681a12.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697797638; x=1698402438; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O9G9iqXSn4bIWBu+1DJE9aW2IMSJDKBdGcQ03iTHUdg=;
        b=ggQl4cAl0qvH/xy2iY8hIKw3ouJfQu21CkAlQvrbyc8o6uo3qRhs+K7JxvuXKtNbhM
         KOeJNisJ6OfAtU0R3/xyMGD6FhEnadXm3azqEICgU1Yelco7fa8oiaB+8VksVUNGNpx9
         okHC2pwsf6+3gWjvuv6C73lVeBcd8073DhvvRueeNiHswgZWvRnUBKiMpznrul5YCAsL
         p3hAPgSSTyv0W6EWkD+XuZ0pKK4HUuh8HvHfsK0kPPL7Uxm+jPEogH8n+3XSXxKo5AJT
         bSHjJfN2FEVKi4mOz6s9/rQfgffbn60lZ7bI79ylUVVHXykwk4l/i/F7SGUrd08r+67m
         p5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697797638; x=1698402438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9G9iqXSn4bIWBu+1DJE9aW2IMSJDKBdGcQ03iTHUdg=;
        b=YJygHytCmKS4gHQwBuOQ5iUMDbmymb4lKpWN7L0E4tzWjOY/W88lNytqmj/FyP3b4j
         W/pksEm60J8c/GQmhnsTKaO6jNwEJznWDC7TdaXU674vhdqYyaeNLWCcbpesnC8cyERa
         F0OVJsV7X6IRqyadff2gXIBYStRESwuDWLNdCg9y12Iet5bKknU08QqONqakDgdETVZr
         dcu/pPigIVOVGZegixiCwRuNkLDtWB9lz82fAwjc3BN0LUvbgHYEApMkD6+HlyucmMnM
         wpgmqhOKNBT09Lkv20xf3j0u+gPelDkbE9vPTm6dQk6hR5R4sB6ApFd9VpuytZIEdYVn
         FVsw==
X-Gm-Message-State: AOJu0YwO7UQ92030suuBcZYZAnyLRc/jfdzDG+kWMebjVl0PqHxTwLgn
	hKyri6LP8wbXeMv+JqZMZoYgVA==
X-Google-Smtp-Source: AGHT+IHZl6pUqwMf9CFUA2xEvYwgpCp82Av0Lk//UAONUT1SVS4Axb4Qd2P3hrYxgtOT7flTfwUbaA==
X-Received: by 2002:a17:907:3f85:b0:9be:6ff7:128a with SMTP id hr5-20020a1709073f8500b009be6ff7128amr1087855ejc.67.1697797637704;
        Fri, 20 Oct 2023 03:27:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a19-20020a1709065f9300b0099e12a49c8fsm1215456eju.173.2023.10.20.03.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:27:17 -0700 (PDT)
Date: Fri, 20 Oct 2023 12:27:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
Message-ID: <20231020-cee6ba8c9b3dc3c2a984fbb5@orel>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
 <20231018-flagpole-footpad-07a6228485f3@spud>
 <844f6f35-3125-4014-852c-9ad7aee19ddc@rivosinc.com>
 <20231019-flatten-showbiz-127b2e917a7a@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231019-flatten-showbiz-127b2e917a7a@spud>

On Thu, Oct 19, 2023 at 11:22:26AM +0100, Conor Dooley wrote:
> On Thu, Oct 19, 2023 at 09:26:31AM +0200, Clément Léger wrote:
...
> > BTW, wouldn't
> > it make more sense to get rid out of the unsupported extensions directly
> > at ISA string parsing ? ie, if kernel is compiled without V support,
> > then do not set the bits corresponding to these in the riscv_isa_ext[]
> > array ? But the initial intent was probably to be able to report the
> > full string through cpuinfo.
> 
> Yeah, hysterical raisins I guess, it's always been that way. I don't
> think anyone originally thought about such configurations and that is
> how the cpuinfo stuff behaves. I strongly dislike the
> riscv_isa_extension_available() interface, but one of Drew's patches
> does at least improve things a bit. Kinda waiting for some of the
> patches in flight to settle down before deciding if I want to refactor
> stuff to be less of a potential for shooting oneself in the foot.

And I recall promising to try and do something with it too, but that
promise got buried under other promises... It's still on the TODO, at
least!

drew
