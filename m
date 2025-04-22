Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2360420DD7D
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317073; cv=none; b=QhPbqC6IPz/DqSeJ9MAbtBGNbykQg66d9uQVVGWJOAW9/aU7qMquqlA6d/rBZrk0PgJbuFY8I5IaCrqAQENzdDsqt0DLY6dKJ2mdtocQII/uZ551TYtZ7/BBU2NZcUPx66HV4rBA9ZbEjUjcMh9ael7J+Enl6uagMU5FpBTTAEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317073; c=relaxed/simple;
	bh=eEoQfmmABCHvojNLudV31VngPDmfK2fp9xWJpCXogBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQCNrA3QhfZk3e93IzxjvSVDwrbzUafS+uVAFPQtBx6jRg+qkGKy9+94hc+qfptxg8wgiBSMkW/b1d4AkfO8CzX5xAHn0gxA6qjOp/wNAyroWp5/yMNkllnrWlVn6r8ewQV1jsXMesZr0A98z77CO39Va5SyzO+Clu1UzhOmp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DR+rBiFT; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DR+rBiFT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22928d629faso46791035ad.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 03:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745317071; x=1745921871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X00I2bs07xTT0JGn+iRC8lIN0+rPW4VodnvME71Mc4w=;
        b=DR+rBiFTDQ02CG5jgmqdbeQODyy5NqmoKx3UjfcPQVEHgHqvU+ieoB7Nru5mSGXIBe
         58M1bC8WWpD3IOrY43N+M4mfglusQNWvU2YB57wDiRMqtfDb82bWDWofk/qWOETQaiSx
         vHUNh1SNiTQk2Ni5CLTpr/hlX9aR2hG6whV0WhLDrl6AR+o5MKtbK4ZtCASvA75SzgYC
         5qxCiCDva6vj1CmLOz0E0JniHPz/D66LujHGBoyq4iJxZ4tI6r/dTTlXcs+rJXVez8gi
         w9V+wAQlrorEJ2ioyN4yao/DsBZj2XIMfyn/Emd+9u2LFZqFV6wRk4ylR9Bvb/mmo4Bg
         FZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317071; x=1745921871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X00I2bs07xTT0JGn+iRC8lIN0+rPW4VodnvME71Mc4w=;
        b=DoL06G2SjNhqfI6t6mq1yqG0ap/xpcJcF0dFXQ4XNPzBkDl+3RiX6UqHhlt/sALmM/
         ZhVpUTeXm51RX2bf5W4Zjtb7IJ7zUjo7jS6YlViI7wr6ctq1i4kU+x04/iNElBG2CQF2
         FyamfUvprSCHGrdl9itnozXpRy8AoJWgCLPJIaDr/mm2NVpgI7SqlThqlBQEdPhhZvTX
         etNWxXbp5/vUq6HpMxeHUoSJrI1WnyjvuPO3JVj9A/pW9YOjGQxaSoU8ntgNUsR7g/gW
         l4vklEPZE6Z/OlQGN083Yz4Hh1tAvOBJkpBI+e/KmRxHOyc+KIoNFeiGsz+DnkKWkdor
         8LeA==
X-Forwarded-Encrypted: i=1; AJvYcCWvgAwx3TD61z0BEwIRMsld/0mL6wUVnvulWCjmFgl8gCvLK5nq+G0fijIQq4pU7b0xmExdg0SIQrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2NPmiij2SSv11/YdppC7xixS5aqa2qGmD63K1iDx4+p9VHayo
	028TIugxBFckkM76fO5DQnlPF15U4YRUkhQMxY0SLhsRbGG01yysi94SP0/wNvc=
X-Gm-Gg: ASbGncuiKJeEkCFTccQG3zRtm4WoaVGFOPvqNStMCNTbeG2lLUn+PEQgIAgWwr/hzJ1
	9PeOcy9V/l+DYqi72HOEGlihrmo/iqJsdoiLkLYk+/4fX4Qgn2ub1Xo3hckiZuVNWIPLjyd3wfV
	HSUqw4HCqNtkOOORMcMsFRhHfzuUZg0vaIKjW5KmMXog7wlxtNqCPHXOtR90AIyoDlmf3gNgYP4
	yaA4/3K/6eDFEgMFIAlsG159i9Vo3paIK3ed195tPjEa4mZ9NkZ6fY1CvdVOG1Q8WLGuYQH+pJ1
	6KeFYH83F2vLh/07UN4wYWWbJD25HUOe7JPygGOOIyiaZ7I9BoMmDhmkW0NcSsuayj2I2kWLcZn
	VsTDaWRIoPg==
X-Google-Smtp-Source: AGHT+IF66lPXUZ8d1HsX69+jyxVc1Jh9SjZT766uy6dI5gqKQ1najh//E0HYQ7PJOsBvmK715VAAPg==
X-Received: by 2002:a17:902:d489:b0:224:e33:8896 with SMTP id d9443c01a7336-22c53285bbbmr210518825ad.11.1745317071386;
        Tue, 22 Apr 2025 03:17:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8bf794sm8493042b3a.10.2025.04.22.03.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:17:50 -0700 (PDT)
Message-ID: <6e2ed6a9-aed0-4727-b1e3-903d3a7751b5@rivosinc.com>
Date: Tue, 22 Apr 2025 12:17:41 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] riscv: misaligned: factorize trap handling
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
 <20250414123543.1615478-2-cleger@rivosinc.com>
 <ba11b910-9959-4845-b3a3-dd9a52466823@ghiti.fr>
 <2c4f4422-d9c9-4d36-b0ef-f68779b91ee9@rivosinc.com>
 <20250422094419.GC14170@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250422094419.GC14170@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/04/2025 11:44, Peter Zijlstra wrote:
> On Tue, Apr 22, 2025 at 09:57:12AM +0200, Clément Léger wrote:
>>
>>
>> On 21/04/2025 09:06, Alexandre Ghiti wrote:
>>> Hi Clément,
>>>
>>>
>>> On 14/04/2025 14:34, Clément Léger wrote:
>>>> misaligned accesses traps are not nmi and should be treated as normal
>>>> one using irqentry_enter()/exit().
>>>
>>>
>>> All the traps that come from kernel mode are treated as nmi as it was
>>> suggested by Peter here: https://lore.kernel.org/linux-riscv/
>>> Yyhv4UUXuSfvMOw+@hirez.programming.kicks-ass.net/
>>>
>>> I don't know the differences between irq_nmi_entry/exit() and irq_entry/
>>> exit(), so is that still correct to now treat the kernel traps as non-nmi?
>>
>> Hi Alex,
>>
>> Actually, this discussion was raised on a previous series [1] by Maciej
>> which replied that we should actually reenable interrupt depending on
>> the state that was interrupted. Looking at other architecture/code, it
>> seems like treating misaligned accesses as NMI is probably not the right
>> way. For instance, loongarch treats them as normal IRQ using a
>> irqentry_enter()/exit() and reenabling IRQS if possible.
> 
> So, a trap that happens in kernel space while IRQs are disabled, SHOULD
> really be NMI-like.
> 
> You then have a choice, make all such traps from kernel space NMI-like;
> this makes it easy on the trap handler, since the context is always the
> same. Mistakes are 'easy' to find.
> 
> Or,.. do funny stuff and only make it NMI like if IRQs were disabled.
> Which gives inconsistent context for the handler and you'll find
> yourself scratching your head at some point in the future wondering why
> this one rare occasion goes BOOM.

Hi Peter,

Yeah agreed, that might be hazardous.

> 
> x86 mostly does the first, any trap that can happen with IRQs disabled
> is treated unconditionally as NMI like. The obvious exception is
> page-fault, but that already has a from-non-preemptible-context branch
> that is 'careful'.
> 
> As to unaligned traps from kernel space, I would imagine they mostly BUG
> the kernel, except when there's an exception entry for that location, in
> which case it might do a fixup?

The misaligned access exception handling currently handles misaligned
access for the kernel as well (except if explicitly disabled).

> 
> 
> Anyway, the reason these exceptions should be NMI like, is because
> interrupts are not allowed to nest. Notably something like:
> 
> 
>   raw_spin_lock_irqsave(&foo);
>   <IRQ>
>     raw_spin_lock_irqsave(&foo);
>     ...
> 
> Is an obvious problem. Exceptions that can run while IRQs are disabled,
> must not use locks -- treating them as NMI-like (they are non-maskable
> after all), ensures this.

As said in my previous reply, the misaligned handling code does not
currently access any locks (when handling kernel misaligned accesses)
and is self contained. That being said, that assumption might not be
true in future so that might be better to take your approach and treat
the misaligned access like an NMI.

Thanks,

Clément


