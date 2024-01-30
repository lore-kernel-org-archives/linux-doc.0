Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3670C107A0
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 02:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706583050; cv=none; b=aPRAteCT1FNSd6ISq+Zd7AHxsdwyoRyGl0Ob4oXPwUlqAG/vjn1EqE10YiRKlQ2P1Bhl9FAmjAhUhYWPmTnF9eOeNcWeY4Y+rjIV7hsPcDf3CuDglGlRJTgr0BS/jCe2e2SsMMX37WXwtLTY/zxssBpmQmRT5IP0fRAOGRv04GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706583050; c=relaxed/simple;
	bh=0TEm3/crCtPyfYZL8bXJs3aeXPqJ01LKo32QgDLoJlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/N7Nf13ieiaOtNyrICENjjK16EGMQXLp5ylAFonjm05HekFRO3EjApRF6Y+3KZiHvyARx2qPYxE1velrHXErC/YgOL5MitiUGLSDVrMJMoVsR8w1/Y9crrIzLU1X0jEc17tc/BLkz4zmep9Vkb01vPUO05Mf6gjFi+REPl5uo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jWzdlt8t; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jWzdlt8t"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-595ac2b6c59so2431901eaf.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jan 2024 18:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706583046; x=1707187846; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4kmLD/ZHgJFQzacfvJ5aXtIPI3Q8g9U5l7cj/1gwss=;
        b=jWzdlt8toQ2FsBo3S6a7Q7ROpdRBxUH1g9DN0DBiw+5bcGPLcII1V+07/+MAJPh/as
         IdyJDSHpNjy9CnoruaeuvomdWmsnHlVcss8HoFDnG9y06nzI5K96t7oI1OlpWtDJx1p9
         d7+7fti71HITHzK9uF0il7X6GyhEtrxo0nelCqvva5bsTP9AsVJifDhdBjU76nelvukU
         4UJ+IAfgXm27CjvELFIJJZadv+r8lIESAbNtUgpH04BcX+L9yzjQyqZbvt67EuksbThd
         /gR2I1yC+Eoo2aDo9Qh4gFvwggNM2+eJ+L42h7TGiamq96bqn9Ho/G+keTithdhdFb5p
         6hVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706583046; x=1707187846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4kmLD/ZHgJFQzacfvJ5aXtIPI3Q8g9U5l7cj/1gwss=;
        b=fYI5WNiP7JX2s3Xa1P296rdHXz1lzMYlUcI0HGTzADLb5c+keHGaTaYOqAsEiAku4i
         SobcF9a/SkaqJLHjTK+je9Aw9ffXc04sJmJEh8DXi6OSZgxfiUjbPxqaggyvvxdV19wi
         gjRW+O4Ra9dzykBqcYNH+rqcgETUe67QLvO60JylxBJOgujIeyIKoWqj/E4MMSsYhbqK
         WjBr3qUmBQEYUs5bYCcz7n34zNW72G6f26hdXnnYGPjnek4P5d1TjdfwS4DSrmZu5ijI
         sB8vvOgxcnFEN0wSSN88/Ea+vWStExvahrR3jXLQXjCeLVP4VuJdtE9gofkSkHvSSf4H
         smTg==
X-Gm-Message-State: AOJu0Yz6yBVxEDRbJquMX/tz0U8CjKNr3p5JHHHpdbM9IgxIlgRWX/jD
	dO8Z7eqq65TeF5aWWv4GeenjqkfnKJ3tkecTeP26b5yQIX0Vi1U19poo3JT9+iM=
X-Google-Smtp-Source: AGHT+IHVIhbQGSEna5MN4n3vgllTv+oL5jn7aTe6nq6Ie2BpSyHZw7jYc/tSHXwtTS+M7cDDGwEHmw==
X-Received: by 2002:a05:6358:796:b0:178:76b3:58d8 with SMTP id n22-20020a056358079600b0017876b358d8mr3227466rwj.38.1706583046256;
        Mon, 29 Jan 2024 18:50:46 -0800 (PST)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id y12-20020aa7854c000000b006dbd3aec001sm6794293pfn.146.2024.01.29.18.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 18:50:45 -0800 (PST)
Date: Mon, 29 Jan 2024 18:50:41 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZbhkAUf+h7sK71Rs@ghost>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
 <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
 <tencent_F34C3BC7F1077728A62E84A7D183EF5BF005@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_F34C3BC7F1077728A62E84A7D183EF5BF005@qq.com>

On Tue, Jan 30, 2024 at 10:34:03AM +0800, Yangyu Chen wrote:
> 
> > On Jan 30, 2024, at 08:37, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> > On riscv it is guaranteed that the address returned by mmap is less than
> > the hint address. Allow mmap to return an address all the way up to
> > addr, if provided, rather than just up to the lower address space.
> > 
> > This provides a performance benefit as well, allowing mmap to exit after
> > checking that the address is in range rather than searching for a valid
> > address.
> > 
> > It is possible to provide an address that uses at most the same number
> > of bits, however it is significantly more computationally expensive to
> > provide that number rather than setting the max to be the hint address.
> > There is the instruction clz/clzw in Zbb that returns the highest set bit
> > which could be used to performantly implement this, but it would still
> > be slower than the current implementation. At worst case, half of the
> > address would not be able to be allocated when a hint address is
> > provided.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > arch/riscv/include/asm/processor.h | 21 ++++++++-------------
> > 1 file changed, 8 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index f19f861cda54..f3ea5166e3b2 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -22,14 +22,11 @@
> > ({ \
> > unsigned long mmap_end; \
> > typeof(addr) _addr = (addr); \
> > - if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> > - mmap_end = STACK_TOP_MAX; \
> > - else if ((_addr) >= VA_USER_SV57) \
> > - mmap_end = STACK_TOP_MAX; \
> > - else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> > - mmap_end = VA_USER_SV48; \
> > + if ((_addr) == 0 || \
> > + (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) || \
> > + ((_addr + len) > BIT(VA_BITS - 1))) \
> 
> How about replacing BIT(VA_BITS-1) to DEFAULT_MAP_WINDOW to make the code
> more general.
> 
> > else \
> > - mmap_end = VA_USER_SV39; \
> > + mmap_end = (_addr + len); \
> > mmap_end; \
> > })
> > 
> > @@ -39,14 +36,12 @@
> > typeof(addr) _addr = (addr); \
> > typeof(base) _base = (base); \
> > unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base); \
> > - if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> > + if ((_addr) == 0 || \
> > +    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) || \
> > +    ((_addr + len) > BIT(VA_BITS - 1))) \
> 
> Same here.
> 
> > mmap_base = (_base); \
> > - else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
> > - mmap_base = VA_USER_SV57 - rnd_gap; \
> > - else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> > - mmap_base = VA_USER_SV48 - rnd_gap; \
> > else \
> > - mmap_base = VA_USER_SV39 - rnd_gap; \
> > + mmap_base = (_addr + len) - rnd_gap; \
> > mmap_base; \
> > })
> > 
> > 
> 
> What about not setting the upper bound as x86/arm/powerpc as [1] did?
> In this case, user space can directly pass a constant hint address >
> BIT(47) to get a mapping in sv57. If you want this, this code also allows
> user-space to pass any address larger than TASK_SIZE. You should also
> limit the mmap_base to (base) + TASK_SIZE - DEFAULT_MAP_WINDOW.

No. This suggestion causes a random address to be used if the hint
address is not available. That is why I didn't simply go with your
patch.

This patch both gives your application the benefit of being able to use
a hint address in the hopes that the address is available, as well as
continuing to support the guarantee that an address using more bits than
the hint address is not returned.

- Charlie

> 
> I’m also aware of the rnd_gap if it is not 0, then we will not get
> address mapped to VA_USER_SV39 - rnd_gap.
> 
> [1]. https://lore.kernel.org/linux-riscv/tencent_2683632BEE438C6D4854E30BDF9CA0843606@qq.com/
> 
> > -- 
> > 2.43.0
> > 
> 
