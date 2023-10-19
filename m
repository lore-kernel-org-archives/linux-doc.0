Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A170D26A
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 07:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ALgjGUGV"
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58147123
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 00:26:44 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6bcbfecf314so1040844b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697700404; x=1698305204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgTcFnd2WuQ3b93x6mtXxA5MmL51CRaK2ux9aDnBicU=;
        b=ALgjGUGVojPdKw06M7V19ORNMHqFpjA1hO9W+3LMyeQym7l7C94maxnHf2Z7AoB4/Q
         O2cHH3+hGhxUecr0INsYtr2w7u/f9lPLywibkhBH8WlaAGBp4TBy/pK6JLZf1JPzbTRH
         kLb1o5T0fErCDrFFnBdfwlLYb20q1qVMczrxHzjQtFDnRdlqyogygvyGOS9PFcesXU4U
         MZHX+ZBRvP7VFTXFyL6NRf9ZwlEPJO1i9SEwnFdQpIeClYhdaLRD6JvHQVuP/h3sqywf
         4fIu8+0DRMFDjVxxySHqhGMaukYuUMj8iFV+WPVUHAMe/GqaBEqDgQI05jO5xr3RLT1G
         cj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697700404; x=1698305204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgTcFnd2WuQ3b93x6mtXxA5MmL51CRaK2ux9aDnBicU=;
        b=wzBZ5lTs2T/kawh049jSYsrFgiSMa7lODzFZaTzt5Jj9mYpOx3PbLey8wou6u7I7wc
         jGW9O0iDFd7JIZ7vquw157tfvulNyfLenKxhebSjl27U5AHGJZwylYRoQXtLDY8qrTNi
         oijYkyGC8YjWUbvQ4tfn8uQbL+scQEeklYU6VfCRPyWuUkZ0rMet+AiaLT+z825OnJNv
         5G18W68DKUnx/cgR9RckDkYsWiScbKqhk+5YjYrbGN9X9r0HpLbcSpgUmW/XOFP2FKa0
         RlJeEJiI9l6mVV4ZEuYpL3PzOHf1+k+rlwEduCBxo/8SpVQmk27qWULnxMg13IOG5viA
         8b5g==
X-Gm-Message-State: AOJu0YziLmonccLAF1lQHCPgyPBsrjsYwLsEoli5kcjXRyFPp0Zc0KAE
	etVp+60zz6GSDu628CeT2r65qw==
X-Google-Smtp-Source: AGHT+IHBolW3gGracNxmsGlk+qzVRPdVEtKUfRfRdsaXZ4nG07zJsUHKMW68cjsZuxWvQXGUOxGzrQ==
X-Received: by 2002:a62:b613:0:b0:6bc:67ca:671d with SMTP id j19-20020a62b613000000b006bc67ca671dmr1233298pff.1.1697700403743;
        Thu, 19 Oct 2023 00:26:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6933:1fe3:b858:3dde? ([2a01:e0a:999:a3a0:6933:1fe3:b858:3dde])
        by smtp.gmail.com with ESMTPSA id g7-20020aa79f07000000b00693411c6c3csm4455829pfr.39.2023.10.19.00.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 00:26:43 -0700 (PDT)
Message-ID: <844f6f35-3125-4014-852c-9ad7aee19ddc@rivosinc.com>
Date: Thu, 19 Oct 2023 09:26:31 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
 <20231018-flagpole-footpad-07a6228485f3@spud>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231018-flagpole-footpad-07a6228485f3@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 18/10/2023 19:36, Conor Dooley wrote:
> On Wed, Oct 18, 2023 at 06:33:34PM +0100, Conor Dooley wrote:
>> On Wed, Oct 18, 2023 at 10:24:15AM -0700, Evan Green wrote:
>>> On Tue, Oct 17, 2023 at 6:15 AM Clément Léger <cleger@rivosinc.com> wrote:
>>>>
>>>> Factorize ISA extension reporting by using a macro rather than
>>>> copy/pasting extension names. This will allow adding new extensions more
>>>> easily.
>>>>
>>>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>>> ---
>>>>  arch/riscv/kernel/sys_riscv.c | 32 ++++++++++++++++++--------------
>>>>  1 file changed, 18 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
>>>> index 473159b5f303..e207874e686e 100644
>>>> --- a/arch/riscv/kernel/sys_riscv.c
>>>> +++ b/arch/riscv/kernel/sys_riscv.c
>>>> @@ -145,20 +145,24 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>>>>         for_each_cpu(cpu, cpus) {
>>>>                 struct riscv_isainfo *isainfo = &hart_isa[cpu];
>>>>
>>>> -               if (riscv_isa_extension_available(isainfo->isa, ZBA))
>>>> -                       pair->value |= RISCV_HWPROBE_EXT_ZBA;
>>>> -               else
>>>> -                       missing |= RISCV_HWPROBE_EXT_ZBA;
>>>> -
>>>> -               if (riscv_isa_extension_available(isainfo->isa, ZBB))
>>>> -                       pair->value |= RISCV_HWPROBE_EXT_ZBB;
>>>> -               else
>>>> -                       missing |= RISCV_HWPROBE_EXT_ZBB;
>>>> -
>>>> -               if (riscv_isa_extension_available(isainfo->isa, ZBS))
>>>> -                       pair->value |= RISCV_HWPROBE_EXT_ZBS;
>>>> -               else
>>>> -                       missing |= RISCV_HWPROBE_EXT_ZBS;
>>>> +#define CHECK_ISA_EXT(__ext)                                                   \
>>>> +               do {                                                            \
>>>> +                       if (riscv_isa_extension_available(isainfo->isa, __ext)) \
>>>> +                               pair->value |= RISCV_HWPROBE_EXT_##__ext;       \
>>>> +                       else                                                    \
>>>> +                               missing |= RISCV_HWPROBE_EXT_##__ext;           \
>>>> +               } while (false)
>>>> +
>>>> +               /*
>>>> +                * Only use CHECK_ISA_EXT() for extensions which can be exposed
>>>> +                * to userspace, regardless of the kernel's configuration, as no
>>>> +                * other checks, besides presence in the hart_isa bitmap, are
>>>> +                * made.
>>>
>>> This comment alludes to a dangerous trap, but I'm having trouble
>>> understanding what it is.
>>
>> You cannot, for example, use this for communicating the presence of F or
>> D, since they require a config option to be set before their use is
>> safe.
> 
> Funnily enough, this comment is immediately contradicted by the vector
> subset extensions, where these CHECK_ISA_EXT() macros are used wrapped
> in has_vector(). The code looks valid to me, since has_vector() contains
> the Kconfig check, but does fly in the face of this comment.

Yes, the KConfig checks are already done by the headers, adding #ifdef
would be redundant even if more coherent with the comment. BTW, wouldn't
it make more sense to get rid out of the unsupported extensions directly
at ISA string parsing ? ie, if kernel is compiled without V support,
then do not set the bits corresponding to these in the riscv_isa_ext[]
array ? But the initial intent was probably to be able to report the
full string through cpuinfo.

Clément

> 
>>
>>> Perhaps some rewording to more explicitly
>>> state the danger would be appropriate. Other than that:
>>>
>>> Reviewed-by: Evan Green <evan@rivosinc.com>
> 
> 
