Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49B49158E
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998612; cv=none; b=HycEWYe5TQy1ISqyEtgzBhhS/8ogEpcoarYZd+m1KabruoQEa8eNHdPnWpr3iRuzkJzhmjvgyXnn2tltpai+Z3ohnE2/KFR8A/5JgiC1NhE63fp6KfO7u6UgOIk91Yr9jmI/Q06zHK/mUvkY5mV5CVY8SgvxlM+G1UOZSuDJB6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998612; c=relaxed/simple;
	bh=5UQ+/b9voSw2XbVSVpGgsHCN+16v45r/eO2PjQuRZp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBkV3freJz4yg2PyqNsETsI5vqw3QPUUscgEEIv20UOmVG1y3zSR05aexnNvK5779J+1isY2X26R/F9P+UipScUXTnDi0MxHqa9IFYepBh0ibQfGCcZZm7mJYDe4WiJ4Hgc7luGeOF5JiLMMaI3ITCFnBg/OE9mvPI3PTOy/Hzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dA95zy47; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dA95zy47"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4843e397f74so1480596f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789998608; x=1790603408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4xPQrVJdFgFl8luzeo5fY/IUnv52YMtHgLJT02PkgQ=;
        b=dA95zy47+9E+6Wj7pNYsrxpyB60MgweGLYJbZWECxloBtnCxSAfVgRTPb4n832bVN4
         ioIHKLkAkdYc7/JT7hGCtIW/h2DDR9L2+ZHYH1NwtM/zrWohbxtmzZMw6cpxK0JyfEtx
         AqkpxNrZ4pSf2uRNpuMoQAp9vqC6PLpWHJOOI82PimUrE8ewf1JfOpaqogd3nTsoLHUR
         8ZVxLQrp1IZp55/gmH4uCmtu+XrmMNXsUWSLSAA3NFPhfhJvcGZvneivOdCykpCzfQUe
         2ywIwODlr+jiLKyVnmujMraj7i+JFm9NAOspeLiIoPsIhZ3Aj9oHVhk+dIPIc5eINdGB
         UhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998608; x=1790603408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4xPQrVJdFgFl8luzeo5fY/IUnv52YMtHgLJT02PkgQ=;
        b=DJ1nP08aZApW93kB+xhVNpEcF9GxISv/5ZnJnHp4q/5rg7CeAci8hvNJ1HOgh9svQV
         fl71h5598htAuGTTsb+3DAtXpX2MkHmBVmcOAzZYrqNjANLLAnde3qBP+eSvF6oyHXvq
         QbfNTJMngnIZf9vFG0aGIgvjRyN8A1wwwwTWj2CLd2BlX1vfnfo3Z4EaZDewSTX8u8a4
         LEoAVw/AAVlc8yOqI5/TD6kjNMiG1at1KPM22jbaMBbsNmW0WUaSc0HmIUZDmoqUAF5N
         tfNsFgW2BxQqFT+sVWfip97Q9EWAkh+K48aD1j8Jn0J/yibQ2gDt5OrRv3BIPXDh+Gai
         ztIA==
X-Forwarded-Encrypted: i=1; AKwUvBysH9fyPSUNixai/W0Tm27PUUEwuwuQLJ+JrO4n6Pz0BI8fSA1Mfzx72NYofNUlZKxCwTRlpkQS2FE=@vger.kernel.org
X-Gm-Message-State: AFuF++nIouWOzWQrBiEPDslVCkhtbCxRWB50lovxB3vHWklpOjCbOZx6
	EeAFSRHngE/lWBpz148UagfBVKhhKVMJB5p749d0IfcCTpCPpeA5mbJkVK8tFDa2QC4=
X-Gm-Gg: AYBFou0W1yneUlzgBgDWuvafFEqUNaRGrEsx0ye4Gq2b8N0jVQWUmUJ5ah0o8VNdeEY
	VKInY2AwgXcqxANPf6dNA90eEswBkRxROv4SfBr4HP4fNxRFM5oQ71dJJ2uuYsbR7oxkhH92F8l
	e8BFnRVmKhdIKXzH+n+8gp+m+L8n4lUGnoSzdCTQG2cFV/B1ThvoeUFsJ4DDdZdg90ON7VrL8gN
	U+enLfKcTpOazsfwV17D+TLMXkI8KszkSu5TzbUbSce+lbAkanIAGqhkQ45/tGCG2jS70q4Du+/
	owt9BFbEPBDfZlPWWESfuQ2s6x+nIGzVWGZodueVi8ClOae7m0E+yy4JnhGqkQYT933q3WVVoXz
	iT2B1GvqRF2zgL4XkCa+ClPHB2HriBjUUwkgU8eVwShyAq2cHahnhz53ovm8a2lwJnkh7yA6n/9
	Or7uVzYvXgFDAkE1dURgNvFJ6CZRtYI2G5OaKkSNo8hbRyiC1KGWdBUNU1tF8fyY8K+/yr1fPhk
	kcTgis8cqh8kAfm52Oj91ETzManXGKvGTU=
X-Received: by 2002:a05:6000:64a:b0:487:c3e:d6cc with SMTP id ffacd0b85a97d-48713c7f005mr24266022f8f.31.1789998608134;
        Mon, 21 Sep 2026 06:50:08 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724596604sm23426141f8f.30.2026.09.21.06.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:50:07 -0700 (PDT)
Message-ID: <58605613-8a43-40e7-a00a-b0d09f089ec8@suse.com>
Date: Mon, 21 Sep 2026 15:50:06 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] modpost: emit module descriptors as assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-hardening@vger.kernel.org
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-13-39817ec5db23@kernel.org>
 <95baacfb-d8d9-4d2f-bc89-592df6f6f8e3@suse.com> <arEZrFmXeCO4hZpP@gremlin>
 <2b27bb4b-47e3-45ed-a26a-4b9de2b20542@suse.com> <arEnCzzQa9XDd4LT@gremlin>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <arEnCzzQa9XDd4LT@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/26 2:48 PM, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 21, 2026 at 02:36:30PM +0200, Petr Pavlu wrote:
>> On 9/21/26 1:57 PM, Lorenzo Stoakes (ARM) wrote:
>>> (note there's a v3 see [0])
>>>
>>> [0]: https://lore.kernel.org/linux-kbuild/20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org/
>>
>> Thanks, I missed it.
>>
>>> On Mon, Sep 21, 2026 at 01:25:09PM +0200, Petr Pavlu wrote:
>>>> On 9/14/26 11:22 AM, Lorenzo Stoakes (ARM) wrote:
>>>>> The sections were confirmed to be byte-for-byte identical to the C version
>>>>> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
>>>>> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
>>>>> __version_ext_crcs, __version_ext_names and their relocations - for all
>>>>> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
>>>>> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
>>>>> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
>>>>
>>>> Lowering the data to assembly loses debug information for __this_module,
>>>> specifically that it has type `struct module`. It might be worth
>>>
>>> No, it keeps it - every module includes linux/module.h, and the extern
>>> declaration of __this_module carries the type, so all of the stuff gdb
>>> needs (e.g. ptype, p & field access), DWARF etc. is all there in the same
>>> way as with .mod.c.
>>>
>>> Have confirmed locally.
>>
>> An extern declaration alone shouldn't cause its name and type to be
>> included in debug information. They should appear only when the variable
>> is referenced by some code.
> 
> Ack yeah sorry my mistake, I had the LLM check that and should have known
> better than to trust it without reviewing what it said (as I have done for
> the most part for everything in this series).
> 
>>
>> Testing with a simple module that previously referenced __this_module
>> only in .mod.c and in no other file, such as lib/test_module.c, shows
>> that the .ko no longer contains debug information for this variable.
>>
>> I've verified this behavior with GCC 16 and Clang 19.
> 
> Ack confirmed locally.
> 
> Can put a fix in module-common.c.
> 
> The LLM came up with a reference as an alternative:
> 
> static struct module *const __this_module_dbg __used __section(".discard.this_module") = &__this_module;
> 
> Would that work? Or should we go with your original suggestion? -
> 
> __weak __section(".discard.this_module") struct module __this_module;

With GCC, the LLM's suggestion produces debug information for both
__this_module_dbg and __this_module. However, Clang only generates debug
information for __this_module_dbg, so it is not quite what is needed.

-- 
Thanks,
Petr
