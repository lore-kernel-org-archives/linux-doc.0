Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0149E2D791
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="OmRaJlt3"
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AE21A2
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 06:58:44 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9c41e95efcbso137588366b.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 06:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698328723; x=1698933523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f/KYa4HkxjjRaaNse5zZEBCRtWEDy9TvEZNCSQroKlA=;
        b=OmRaJlt3h3pl7MI6mS0dHtDwDLhFscUlKG/I0p2L14uNCUXYP/uIiNVS/IIb54VzlQ
         rtVbLQQgM17vGASinGX+XKUpbfkmM4PXahpGGWAchVQanhNIxYYpjE3bIXyxI9Dy1fSw
         YiKeKr7EgiUWPQproy/AtMTfecv+3Gffgp+XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698328723; x=1698933523;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/KYa4HkxjjRaaNse5zZEBCRtWEDy9TvEZNCSQroKlA=;
        b=uqkcFl73rDbm1GSgEjCyPMsyQmcx0N+PzEA8J94YOtiuiWR3fBaBsvzcV8QdIjXTsY
         87nEM/bIthVvo5oxyz3mHX/gil6a6CmCMimDxiCNrPfpy8zGppzH7fpcJC7Dic3gcHGD
         LUX3e1ddMVMQTDFfKJheawF0YsRbK2UIRWEBI9a/V4FuapFpIiuf48hCua4cI5nND//n
         5EWEyHaFQrDwzZG56KuSh2DSFerWiYjygDR/rMIOjXlgH5ixfrGm8uIrPWCLDZVRXC4J
         zBY+YSdhRtir6DmVtjVpc9XoSyZgJ07lIKnE7zC8QdDf4fXqj+N4hnqjsuk7rLNODBZc
         8w/Q==
X-Gm-Message-State: AOJu0Yyyp/2xPWjo39LVXxqriYxww/wQbzNS4SXLC8gAw13W7kNGcrhe
	pvBbICVXB4aTPzUwf7vyiKtrRA==
X-Google-Smtp-Source: AGHT+IF2rU6imsm+9/5fNEkBUbTI0NVZdVoGckX2Pddx8Q6ImRaSm5Kbk4+MvlMi/u+iolhDKI4lYA==
X-Received: by 2002:a17:907:70a:b0:9b8:b683:5854 with SMTP id xb10-20020a170907070a00b009b8b6835854mr15025269ejb.61.1698328723124;
        Thu, 26 Oct 2023 06:58:43 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id bm11-20020a170906c04b00b009a193a5acffsm11621069ejb.121.2023.10.26.06.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 06:58:42 -0700 (PDT)
Message-ID: <37b334b2-c040-458d-9c1f-2546dc9b378d@citrix.com>
Date: Thu, 26 Oct 2023 14:58:41 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/6] x86/bugs: Add asm helpers for executing VERW
Content-Language: en-GB
To: Nikolay Borisov <nik.borisov@suse.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, tony.luck@intel.com, ak@linux.intel.com,
 tim.c.chen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, Alyssa Milburn <alyssa.milburn@linux.intel.com>,
 Daniel Sneddon <daniel.sneddon@linux.intel.com>,
 antonio.gomez.iglesias@linux.intel.com,
 Alyssa Milburn <alyssa.milburn@intel.com>
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-1-52663677ee35@linux.intel.com>
 <1f756579-8f33-40ca-ae50-4db78c615f60@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1f756579-8f33-40ca-ae50-4db78c615f60@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/10/2023 2:44 pm, Nikolay Borisov wrote:
>
>
> <snip>
>> +
>> +.pushsection .entry.text, "ax"
>> +
>> +.align L1_CACHE_BYTES, 0xcc
>> +SYM_CODE_START_NOALIGN(mds_verw_sel)
>> +    UNWIND_HINT_UNDEFINED
>> +    ANNOTATE_NOENDBR
>> +    .word __KERNEL_DS
>> +SYM_CODE_END(mds_verw_sel);
>> +/* For KVM */
>> +EXPORT_SYMBOL_GPL(mds_verw_sel);
>> +
>> +.popsection
>
> <snip>
>
>> diff --git a/arch/x86/include/asm/nospec-branch.h
>> b/arch/x86/include/asm/nospec-branch.h
>> index c55cc243592e..005e69f93115 100644
>> --- a/arch/x86/include/asm/nospec-branch.h
>> +++ b/arch/x86/include/asm/nospec-branch.h
>> @@ -329,6 +329,21 @@
>>   #endif
>>   .endm
>>   +/*
>> + * Macros to execute VERW instruction that mitigate transient data
>> sampling
>> + * attacks such as MDS. On affected systems a microcode update
>> overloaded VERW
>> + * instruction to also clear the CPU buffers. VERW clobbers CFLAGS.ZF.
>> + *
>> + * Note: Only the memory operand variant of VERW clears the CPU
>> buffers.
>> + */
>> +.macro EXEC_VERW
>> +    verw _ASM_RIP(mds_verw_sel)
>> +.endm
>> +
>> +.macro CLEAR_CPU_BUFFERS
>> +    ALTERNATIVE "", __stringify(EXEC_VERW), X86_FEATURE_CLEAR_CPU_BUF
>> +.endm
>
>
> What happened with the first 5 bytes of a 7 byte nop being
> complemented by __KERNEL_DS in order to handle VERW being executed
> after user registers are restored and having its memory operand ?

It was moved out of line (so no need to hide a constant in a nop),
deduped, and renamed to mds_verw_sel.

verw _ASM_RIP(mds_verw_sel) *is* the memory form.

~Andrew
