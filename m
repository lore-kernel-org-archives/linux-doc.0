Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B89A7D403
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 22:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706652613; cv=none; b=UaDnaez8+2yy66RDuOBuRrgPTorjhatIiO5nSd+TYjQM1QSDGsP2VpvhVLiZiq5woo2VPdhMZqbZSZHfNL7pZfKJ5Sl/XGu3SaxYZPN9vxnqZ08pItteZOr1EebWPIKxTNHVUOrn8DfF5AgXer9LED6A13gaOxa5nIxw1eD6Dxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706652613; c=relaxed/simple;
	bh=BbwoA8VEagIWr1NfNJqugPJ+q3NLA6lFHpUPeLk62RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDGG1oW2pSjRQviKZtWwcDzcw1luyK4qKlsEU6gzZdD0KE2WO8ZOZKoaD625Q5NF3HkyfzBru0KFKhv60lIxK5q7far9mjSNhjTmq9NQvEujYNBuuMmfh8N6agWnH7peSVo+Y7x/iFP/koDN6qfcsVOF8onh/JtmNZZcOfOqrSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BhYM4fuS; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BhYM4fuS"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso2326537a12.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 14:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706652610; x=1707257410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+NalAEpBOXm2rq7TuoQxf0lFmytzH/73qgpQl7PiKxE=;
        b=BhYM4fuSgsiTQssJdeC9+p5gC2AWzbZ2bh6XARddS+Ho1YGqm70I7gGUYA36sAxoro
         48dCZfxS0fon1G9eXQ6PRVVYgbUb9Kkxzq4zoFV8v/X5MRiMSIt9DvOo7Lfd8o2D08ve
         PQ87zjwedtC96DijGFFE6n9zm4VPaaSWcuTTGF6pELFlS1Bt9XKMLrSFtmGOxgoVdR2O
         IzVRESY/5SzO5ahCMbaa9mHrOHfZKNiOyZdxbYjB2oR6uSGdiC940kjIRuPLeuiqlLuO
         nOq55Bvllm7fUKJNvQZby2ak2+Zqs7bT5JpexylDW+jvCY2MT/ipu8npxzGePoahXr8A
         U3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706652610; x=1707257410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NalAEpBOXm2rq7TuoQxf0lFmytzH/73qgpQl7PiKxE=;
        b=gN48YphJQzg6vkuJOodVNYoJ330c2LAbg1mua7i53CkzZbfJcSUCk5TQeFhH+cLlrH
         a3lwZddS1LuJZ9c7reZaxJi6vhbsev4jF44yiefF+0eMLtm1gxVHXADt9rMVx7KgZZ8V
         5vZPFy/v02b/n+tPDfc4IHqy9xEfx+HADFBnVz8xShUhIkHoEWpVsCQd8G+IZeipqnSB
         QfOwOLG1olIG0tEccm3FaVrzrHJ56yMmF7+Ov1YLjjcymnSn2DDgRYjimPM5CT3um2/N
         2WPBqqucv2pXT7rcz21J+oYtXck6Jnf7n8T++Kj145Kct7xGZENT1ufABtuuil1T0JhU
         pXDQ==
X-Gm-Message-State: AOJu0YxPzSpBeb5EvS6WRY0KW2b5sEnw7LIWJmO1BuIMYbfQPPJYXOze
	LMH6CsoE41jd2Kbv9c6vRnxTvnBWDiCzSOYjqr4vd8xIEeAVWf1tHQrxfk6QkhI=
X-Google-Smtp-Source: AGHT+IG0TEzaW4Z3tywTe2xwATbdanx5HuSgB7lDcqkiSgyWa4yxiZlDC4+9TLpHCznT/n5rvfzkJQ==
X-Received: by 2002:a05:6a20:d819:b0:19c:a0f0:b167 with SMTP id iv25-20020a056a20d81900b0019ca0f0b167mr6839305pzb.3.1706652610266;
        Tue, 30 Jan 2024 14:10:10 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id jw3-20020a056a00928300b006d9b4303f9csm8274107pfb.71.2024.01.30.14.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 14:10:09 -0800 (PST)
Date: Tue, 30 Jan 2024 14:10:07 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Yangyu Chen <cyy@cyyself.name>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: mm: Use hint address in mmap if available
Message-ID: <Zblzv0KqlIZQ0wbF@ghost>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
 <5fd69812-f07b-4079-a871-7e0ee857aaca@app.fastmail.com>
 <ZbhbNYLR9kh5dtFU@ghost>
 <6352ff7f-1e69-4f7a-b793-f69d223d4684@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6352ff7f-1e69-4f7a-b793-f69d223d4684@app.fastmail.com>

On Tue, Jan 30, 2024 at 05:04:55PM -0500, Stefan O'Rear wrote:
> On Mon, Jan 29, 2024, at 9:13 PM, Charlie Jenkins wrote:
> > On Mon, Jan 29, 2024 at 09:04:50PM -0500, Stefan O'Rear wrote:
> >> On Mon, Jan 29, 2024, at 7:36 PM, Charlie Jenkins wrote:
> >> > On riscv, mmap currently returns an address from the largest address
> >> > space that can fit entirely inside of the hint address. This makes it
> >> > such that the hint address is almost never returned. This patch raises
> >> > the mappable area up to and including the hint address. This allows mmap
> >> > to often return the hint address, which allows a performance improvement
> >> > over searching for a valid address as well as making the behavior more
> >> > similar to other architectures.
> >> 
> >> This means that if an application or library opts in to Sv48 support by
> >> passing a nonzero hint, it will lose the benefits of ASLR.
> >
> > sv48 is default. However your statement stands for opting into sv57.
> > If they always pass the same hint address, only the first address will
> > be deterministic though, correct?
> 
> I think this is correct.
> 
> >> 
> >> Allowing applications to opt in to a VA space smaller than the
> >> architectural minimum seems like an independently useful feature.
> >> Is there a reason to only add it for riscv64?
> >> 
> >
> > If there is interest, it can be added to other architectures as well.
> 
> I meant as opposed to riscv32.

That is a good point. I can include rv32 as well.

- Charlie

> 
> -s
> 
> > - Charlie
> >
> >> -s
> >> 
> >> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >> > ---
> >> > Charlie Jenkins (3):
> >> >       riscv: mm: Use hint address in mmap if available
> >> >       selftests: riscv: Generalize mm selftests
> >> >       docs: riscv: Define behavior of mmap
> >> >
> >> >  Documentation/arch/riscv/vm-layout.rst           | 16 ++--
> >> >  arch/riscv/include/asm/processor.h               | 21 ++----
> >> >  tools/testing/selftests/riscv/mm/mmap_bottomup.c | 20 +----
> >> >  tools/testing/selftests/riscv/mm/mmap_default.c  | 20 +----
> >> >  tools/testing/selftests/riscv/mm/mmap_test.h     | 93 +++++++++++++-----------
> >> >  5 files changed, 66 insertions(+), 104 deletions(-)
> >> > ---
> >> > base-commit: 556e2d17cae620d549c5474b1ece053430cd50bc
> >> > change-id: 20240119-use_mmap_hint_address-f9f4b1b6f5f1
> >> > -- 
> >> > - Charlie
> >> >
> >> >
> >> > _______________________________________________
> >> > linux-riscv mailing list
> >> > linux-riscv@lists.infradead.org
> >> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
