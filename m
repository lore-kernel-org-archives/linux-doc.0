Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FFB187338
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 14:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413003; cv=none; b=LpQwzYYBUTllxZ1DA8zUWGZGi7EIfj+i2idGGO39+tN4AZgJaD40aT7Ff9k2N099VbhJ4/055/nYFSQXkIxIh7CWMJftHXrZcIhn2OMFNchM62toSOFS80udN7AWbEv/NsQL723KUeggQoOdSaeFeoWheoKIKi7Y7Qqrrdz3vG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413003; c=relaxed/simple;
	bh=4Jt+AexbXjvRQMS0JAeCAbbjUW8QFJXSk1h+JyEJMvQ=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=V04+heaB9S13XrZc+KPDi0jn0TiNGdAt4in/tTWD/XggLR1/mFqFd9P+niq9Qgsdj8WY6zn0SzbAxMP2e1zNNEW4Wb7d83ocEOs+PU46FewUvTWP+rQA62tPyR9av7gzprYRjWwQ3O+VzLDZ+rCWtqri48JQc/YNO0SSLhM6VDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=LL/Vw+Hy; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="LL/Vw+Hy"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70677422857so2585910b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1719413000; x=1720017800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qqVGSiK52qpEYkBFYQqtg/MLmm7mG/Sdz2MT9nXZJE=;
        b=LL/Vw+HyQFcqElkaZVbTOLvEMU2zA7AD0w6XKKZHaumVjItvva7k4LWs12rNwWZAou
         JWQmBRQfehdtudIEMl6MWCDQ0U2b2cuTQ1xl92U15PvHlqGhILtCBKpqysE7yd2S0YZ1
         1Jyi+m6r7S9B00VRv9Fg8Bb5raW0NqYxAph6Vws4dccwypk75iLnyAx9m5qa3m3Xs/i9
         uOGSpPI13TfRq7MULVqbwxniRbaOh2N9XlKtwsHbX0eM50rSrYCXFxvaRFVck2WWtbfV
         G2K27CFr/+43EgL//19ChVG9tKnOQxi3dv/jTsNTwsaebrirL2sluDqxP8lKMfaOQ/cf
         5AAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413000; x=1720017800;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qqVGSiK52qpEYkBFYQqtg/MLmm7mG/Sdz2MT9nXZJE=;
        b=dEk9fPUrUj9/XMPnt0MuGQiqNhqy7YnuNafD/6+WgEhnruGyZTH/hWvPehJ9H2j2ti
         xVS26+d1Pp/ytHasu/tYRiJAN/I7/BMRfGNK7jzYdNyaLO5JfA8D6RbHtqeGxgWffyTF
         jbrikW591bZFMQAKLLIjSH4uc0myENmiLundg+y39TVTXIcmpUGnA4dGl8k/tN9YQ6vM
         zWidDe2EOfTPsTVwZGEGC029itI5I6y1eYLzLZiVADprHs9n7YPSwR9VjO32Qp7/uIzR
         huRUAONKcb1sA/LtKF+yUcONFzp9nMHLFZtKewPUr1HJHXPvX/SyWdyY1LU1hROXZOaH
         2OyA==
X-Forwarded-Encrypted: i=1; AJvYcCWjnAPzd2BJebnUMenLIj7/kRhs83DG5b+lCB8jdQpQ+29JDxQYhP8W24CMnoBxbEbfRz+vHI5PdJP2YNeDjH7XWrLPmszckzq4
X-Gm-Message-State: AOJu0YwwEO9HImhJHBR/2zm9aHRu6kTVocIUp1BFqwUDrBmLw++A8rcQ
	TguGllnMozo5EDgQScQWTFG/8vuiYs0ecCdrD25ZS7deiIO5YjWKJnMrAOfY70w=
X-Google-Smtp-Source: AGHT+IH2/0OvXTCfvNRbeybdAi6Y6rc880H+FiHzFEwDjrLLdcNGpDiCXi7MY3ygYaSDhgJ3SraPqA==
X-Received: by 2002:a05:6a20:1203:b0:1bd:28cf:7645 with SMTP id adf61e73a8af0-1bd28cf76cfmr3000669637.42.1719413000436;
        Wed, 26 Jun 2024 07:43:20 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3d5576sm100665315ad.201.2024.06.26.07.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:43:19 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:43:19 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2024 07:43:18 PDT (-0700)
Subject:     Re: [PATCH v2 3/3] RISC-V: hwprobe: not treat KEY_CPUPERF_0 as bitmask
In-Reply-To: <CALs-Hst_TpjuQw0t-p9GbcCY4FAwXSjWziHJJuToi3rWXo7mJw@mail.gmail.com>
CC: cyy@cyyself.name, linux-riscv@lists.infradead.org, enh@google.com,
  Charlie Jenkins <charlie@rivosinc.com>, corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, cleger@rivosinc.com,
  Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com, linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Evan Green <evan@rivosinc.com>
Message-ID: <mhng-7da30215-9cfb-4670-a33d-17d9464d60d0@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 29 May 2024 11:33:42 PDT (-0700), Evan Green wrote:
> On Thu, May 23, 2024 at 8:36 PM Yangyu Chen <cyy@cyyself.name> wrote:
>>
>> Since the value in KEY_CPUPERF_0 is not bitmask, remove the wrong code
>> in hwprobe.h.
>>
>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>
> I'd expect a Fixes tag, and ideally some discussion on the reasoning
> and ramifications of this change.
>
> I posted the other possible fix, declaring a new key, at [1], mostly
> so we could see the two options and discuss. I'm okay with either
> patch.

Just to close the loop here as the discussions are on other threads: 
after a bunch of discussions we're going with the new key version.  
Maybe it's a bit pedantic, but since hwprobe is such a fundamental 
compatibility interface we're just going to be super careful.

> -Evan
>
> [1] https://lore.kernel.org/lkml/20240529182649.2635123-1-evan@rivosinc.com/T/#u
>
>> ---
>>  arch/riscv/include/asm/hwprobe.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
>> index 630507dff5ea..f24cad22bbe1 100644
>> --- a/arch/riscv/include/asm/hwprobe.h
>> +++ b/arch/riscv/include/asm/hwprobe.h
>> @@ -20,7 +20,6 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
>>         switch (key) {
>>         case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
>>         case RISCV_HWPROBE_KEY_IMA_EXT_0:
>> -       case RISCV_HWPROBE_KEY_CPUPERF_0:
>>                 return true;
>>         }
>>
>> --
>> 2.45.1
>>
