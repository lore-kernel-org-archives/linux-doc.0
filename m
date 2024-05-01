Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A185F9EB
	for <linux-doc@vger.kernel.org>; Wed,  1 May 2024 17:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714583463; cv=none; b=Oo9Y7Jp6Rry9cDs0xYa/2JG9GScT+H+v1VrSx0U2UsKALqn2Oth5qaWaDhpIDG8jgBhWmC07IfWWzMiVDjX4UCJ5FkNsFlnhPWAGeGw5083IFpOIkl4oWCXK5Hm6y/5dLBWvqCCmPBaqj+WWd6mSkub7Oj7U0HmwikMX6domCMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714583463; c=relaxed/simple;
	bh=pZAOS/T1u3WYFJhsFU1zktGFGi+9KYNTImhhH3xfeKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NS72PwdCqqXqKRsza7s4ner4dvtRNt3ruDhMonZSiRfYIxXHkqNyriFA1TJxcIy1CST1+nC3H9eOyoxErhyqNQcyLXIsw4Ev/XxuRSVuwSVvceQ+Yx6bw2J8zUFJRXQqTE5LVPHQtuPh5gP80IOD7t5yG7p1eZ4sJ1Otsht4jYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=uHTrGo5J; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uHTrGo5J"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e4f341330fso64990605ad.0
        for <linux-doc@vger.kernel.org>; Wed, 01 May 2024 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714583461; x=1715188261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7VEcP2FdbTuUC3sLwg55sFZlBNkkI24Wn6q64j9hZkM=;
        b=uHTrGo5JLLGnMbH5QgPkVY/+HGVN/EW9HmjfcHJfWdHNiMD9EfsmVt92BilMOItN7l
         TIunE56JqNtp1LTYsTS2+euIEbOUa3FC2LZsL68xg7l0KN5xV14wRyiAITWf9kDTiYEj
         nm/69ibSGjrGNWevERGDxpyD89Lu6/AWfDnzM52bEDhaTzumf2+BnWVguziPTtSgre+X
         oDU47Zb746h5dkiobEzZ1Pq8SCE3e8dZHi1QriNiDToQ3TKbD4zyPSt477ZpTSXuqrj7
         XaMjv1mT8A9LHzcZJDUo3ptTmJPwafhH5iqTMUZvzFksNfUqxWdffrDyUcMMzdjbczVe
         aJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583461; x=1715188261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VEcP2FdbTuUC3sLwg55sFZlBNkkI24Wn6q64j9hZkM=;
        b=jI66xRNaeATEuRsqHRs9/XGHyZfyD12NSdcoKb2tHuoJQA0fqhN1KMxZc9+gBVNEMj
         NDpp2mXo21FgzbOqK++oA7RB6XCP7Tn8JX1YmYsDmV9VmcjuomZR13NptwGvNaXx92kq
         THBtshqgf6s+PlLu8eVuUWdUm+6zoM8fkCY3k6o6/gtu0cCrCbat5z0xVNgsj1veW59T
         qrxT9gpAOTFHxQPJR2XIpnwJhvPOF4grVQEZQBQW69DGuqtckwybEN36GE3xekEMXicl
         UW8ukViMhrbl6yazIoYkCeGD32PygccKN1bXGPtWFphgWF1SAyBP/Cnb6npNXGLX1mD+
         yeFw==
X-Forwarded-Encrypted: i=1; AJvYcCVh44OQX6FfooXG6iFwYxuBtJPnD6dbJ17h9Gi+yXJ8rccYvivjroRKtU6pTTPeB6NjDkColkgR9ABpiY6K8ckp+/eQhOdm/vqN
X-Gm-Message-State: AOJu0YwekREq6Ued9zzWmtPiAQTWKXQULzRDJ/KJDseAkM/Re10F4L1v
	BMXUE8zwcN6THRebE3cqR10+OcyreGprRUwawxU4LbGvk8e4xaEIAfj/w+3Iffw=
X-Google-Smtp-Source: AGHT+IHpxFS6GEORaahugjisle6m4KLF0ZtLQCz0Flxl/HiPXR710X9hyJZCr2QqZFZg/RK2FxmvGg==
X-Received: by 2002:a17:902:6bca:b0:1e4:df0c:a570 with SMTP id m10-20020a1709026bca00b001e4df0ca570mr3014699plt.8.1714583461518;
        Wed, 01 May 2024 10:11:01 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id mq8-20020a170902fd4800b001e23fcdebe9sm24447681plb.98.2024.05.01.10.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:11:01 -0700 (PDT)
Date: Wed, 1 May 2024 10:10:57 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZjJ3oaFWhbLc39sz@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <20240501-drivable-deviation-0a493511770c@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-drivable-deviation-0a493511770c@spud>

On Wed, May 01, 2024 at 12:40:38PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:19PM -0700, Charlie Jenkins wrote:
> > Separate vendor extensions out into one struct per vendor
> > instead of adding vendor extensions onto riscv_isa_ext.
> > 
> > Add a hidden config RISCV_ISA_VENDOR_EXT to conditionally include this
> > code.
> > 
> > The xtheadvector vendor extension is added using these changes.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig                               |  2 +
> >  arch/riscv/Kconfig.vendor                        | 19 ++++++
> >  arch/riscv/include/asm/cpufeature.h              | 18 ++++++
> >  arch/riscv/include/asm/vendor_extensions.h       | 26 ++++++++
> >  arch/riscv/include/asm/vendor_extensions/thead.h | 19 ++++++
> >  arch/riscv/kernel/Makefile                       |  2 +
> >  arch/riscv/kernel/cpufeature.c                   | 77 ++++++++++++++++++------
> >  arch/riscv/kernel/vendor_extensions.c            | 18 ++++++
> >  arch/riscv/kernel/vendor_extensions/Makefile     |  3 +
> >  arch/riscv/kernel/vendor_extensions/thead.c      | 36 +++++++++++
> 
> I see no modifications to cpu.c here, is it intentional that vendor
> stuff isn't gonna show up in /proc/cpuinfo?

I wasn't sure if that's something we were wanting to support since
hwprobe is the prefered api, but I can add that if it is desired.

- Charlie


