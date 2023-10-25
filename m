Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C4848B
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 21:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="D0hy1TKg"
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063AC183
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 14:30:55 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so252431a12.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 14:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698269453; x=1698874253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nnAj+mFYXNVEo9/fM2R9jX78OjHPBO5IhZQGJbqZ6Rw=;
        b=D0hy1TKg3NWhe6JX93cnc+qezqvguX4x5IUO1A8qgsY5zifsLFSef4vqBjurPLLNQg
         n2tseFVqy7pOtcLG9hcIV/4Y6i03WfE5/JjTUJ8cZuz3J01wXf8jZv+4Wu7gKBrLlvBl
         Wr7JI4zqBYTZCvF8zLhCABBTg4+8GdyKb2sdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698269453; x=1698874253;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnAj+mFYXNVEo9/fM2R9jX78OjHPBO5IhZQGJbqZ6Rw=;
        b=sVfD/8zdrKJeDtzl2fbysNp0u78OJu37f5ocxynOZttZsMdbdZpSclKL7SB5F2iahF
         IldiChl18mfSCdPKPLSLHCieTsod1Dfcc2vk69TMTq7vOF9nD3QDjEtLW0mUBUpFtxaS
         m0i1CxSZYzETaeP0KHhfIZGHn9Z+TE7parGMKnME+qqBPfas4ZPFrm6YDj2WqOkUW8bD
         no6IShNaKZcEBS5y1x5JMc1MWTbpIpDZn3VJ3T8D9iihViWsJVFpkD/u8VfsaE4OwEWK
         3Fhe8g1meItZXMsUPvQl77Ix9XfnJIxXSKELR3fekvBAwsK8gexNfvj1yQuLLgA891nd
         cL5A==
X-Gm-Message-State: AOJu0YylYAlGP1eEKtkeAgJ10xRH3PFoos2plWzZIuTywK9jnKcRqcNt
	SG5kkSUq9CVs5TMwbqwzd0XC2Q==
X-Google-Smtp-Source: AGHT+IFeNPUEa2E5nub77nL6kcMZP1kuqOfHzfyNGtcTvfDNCGMpiPcpLK5KRQgSkHydiLu2ofzfTw==
X-Received: by 2002:a17:906:4fc4:b0:9bf:30e8:5bfd with SMTP id i4-20020a1709064fc400b009bf30e85bfdmr13309633ejw.48.1698269453436;
        Wed, 25 Oct 2023 14:30:53 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id u16-20020a170906655000b009c3f1b3e988sm10489407ejn.90.2023.10.25.14.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 14:30:53 -0700 (PDT)
Message-ID: <da782a61-e7f6-45fa-88e9-9d974dcc1a87@citrix.com>
Date: Wed, 25 Oct 2023 22:30:52 +0100
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
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
 ak@linux.intel.com, tim.c.chen@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, Alyssa Milburn <alyssa.milburn@linux.intel.com>,
 Daniel Sneddon <daniel.sneddon@linux.intel.com>,
 antonio.gomez.iglesias@linux.intel.com,
 Alyssa Milburn <alyssa.milburn@intel.com>
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-1-52663677ee35@linux.intel.com>
 <8b6d857f-cbf6-4969-8285-f90254bdafc0@citrix.com>
 <20231025212806.pgykrxzcmbhrhix5@treble>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231025212806.pgykrxzcmbhrhix5@treble>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/10/2023 10:28 pm, Josh Poimboeuf wrote:
> On Wed, Oct 25, 2023 at 10:10:41PM +0100, Andrew Cooper wrote:
>> On 25/10/2023 9:52 pm, Pawan Gupta wrote:
>>> diff --git a/arch/x86/entry/entry.S b/arch/x86/entry/entry.S
>>> index bfb7bcb362bc..f8ba0c0b6e60 100644
>>> --- a/arch/x86/entry/entry.S
>>> +++ b/arch/x86/entry/entry.S
>>> @@ -20,3 +23,16 @@ SYM_FUNC_END(entry_ibpb)
>>>  EXPORT_SYMBOL_GPL(entry_ibpb);
>>>  
>>>  .popsection
>>> +
>>> +.pushsection .entry.text, "ax"
>>> +
>>> +.align L1_CACHE_BYTES, 0xcc
>>> +SYM_CODE_START_NOALIGN(mds_verw_sel)
>>> +	UNWIND_HINT_UNDEFINED
>>> +	ANNOTATE_NOENDBR
>>> +	.word __KERNEL_DS
>> You need another .align here.  Otherwise subsequent code will still
>> start in this cacheline and defeat the purpose of trying to keep it
>> separate.
>>
>>> +SYM_CODE_END(mds_verw_sel);
>> Thinking about it, should this really be CODE and not a data entry?
>>
>> It lives in .entry.text but it really is data and objtool shouldn't be
>> writing ORC data for it at all.
>>
>> (Not to mention that if it's marked as STT_OBJECT, objdump -d will do
>> the sensible thing and not even try to disassemble it).
>>
>> ~Andrew
>>
>> P.S. Please CC on the full series.  Far less effort than fishing the
>> rest off lore.
> +1 to putting it in .rodata or so.

It's necessarily in .entry.text so it doesn't explode with KPTI active.

~Andrew
