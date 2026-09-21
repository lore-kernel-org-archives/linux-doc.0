Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4C4499F3D
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994201; cv=none; b=iEHHc6ONikkIY8pkEqMMZfBCf1vUOYE/YBW1OWVdTY5sTqTkYOoRyUmDEhO3XtfyxfUDA396qN6ppTxL7NM72m5Qyz8pGAu8A3SNUcNc5r30H0HcgB5J9ZI5XX2EN71t0wnq5854fpRJLVIwKGch4VnTj9LSv1ED5VbAWhIfqSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994201; c=relaxed/simple;
	bh=mbYQBjqI+FvjSHjgV1FgOANO3gDLaxDS3IAWnqfDmCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tq11xuHCvKqw6gybvTKHtD/MEIUXW6AdlAVz7KLhReHWTTFLLr9oXp7/IA22MwECDraNb4yFdTluYf0QoT9YO9TlLuQ3bjBMPa/craY1OvOHqlCun4JExO0gLjG7TU4+EZP+gAdTqhjIGfwYR8xiTe82a+rx6bq4EchtJ6kGKX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N/t77jSA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N/t77jSA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so14842315e9.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789994193; x=1790598993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SRT9W/2z9fLq6Pj3t4dd8eEawuNLFrl/C3bQijqfHo=;
        b=N/t77jSAvT1buLGD4Z3b8ts5eS3gjhm0OF4vn0Uosbh8OjneLL9DAYdLMOVZJggWoF
         rbIE2yG27HyQlIoj4mXIWiL/oC8s+oVmWt1nJyhmAybPVILHioPJXDuD6qK+Mb1IZ12J
         fW50VNq0gnjhkBiksenvcJcKTqxjZVl368d6dgOW6M8MapB0KjHz+ObdE1g746MmW+5k
         +B1YjaMop1h3+WuviU2Y6YOoeYVIghczq9/L0GMuSudJEIMcm8JXz+/EEZDz2VSbLK2l
         P/5flZizRBgdEwlYNdGR0khIAguak+MuVOcftisPVXxU2aLkMMX8ihjYynLfIQbLYu4w
         6uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994193; x=1790598993;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SRT9W/2z9fLq6Pj3t4dd8eEawuNLFrl/C3bQijqfHo=;
        b=SJPIdMuyYgJnGYtML3eI6LgCK34ebiPx+2Aa8QTydmiBvLUPsc7JkTwFA8/qboQImg
         Yv8wsohWwxZtsoSM1dlAU8B0RMoSBWtwbmt2EsMyn/LPcYwMnBM9ToV+dUz03BPWgJe/
         7xuxurBXqj51nFAsOyHxWXE1RFWTcAS+AXhSNVkVOl4seUqNj4cgypxUdfTN5MbUCalx
         lLiXazFfleZoUXJkeODTGWDNRjM3WV9/7nXAI70R2/bI+YNrEGXgfGYOF9jNSUK5HJYU
         ssbV0j+jnsH1+6apjI1l1XNiuKPiBippyvd4hshhR6NbvOwzxfdpuGZ9prSJ8yAwTIAu
         fWqg==
X-Forwarded-Encrypted: i=1; AKwUvBz20a3BEK4ffpjI2gvxgIzSe1AoGB48AC9StjZRT93+5BppRBAMcwj75pVE2TKyk0Wmw+SFPNCoekM=@vger.kernel.org
X-Gm-Message-State: AFuF++kkrGBUmEZqrm3CWRoa9CBH2hR+yIhD21FAZy9v7EW4bgdCxp6K
	o4G/9/jzoa3VrhFmJSbxsT2uZ7kkQGcun4uSJRcGIwBkPPttokIbHS7eMpsSHwVYFbs=
X-Gm-Gg: AYBFou0DrMsTaXTF7glYq5oUbrWPm9vhrxUFjiVPoyfugXNtIFhDhP1e2290yczI1kF
	m4Xo0p8acE6ou9tZQ5hKjqOyNrSXKWCMSI1QltAaGIAWHkLnwHTRHZ7UskSXkNKJ3YPhmAoRadr
	IlRDB8m37zQzSbIc25QWd2FFkVDdvRVVZ5wOU1OkZwodd106yADNdcZt/oCQ5G4QLHjQnzt0FEf
	qu/YiAGQzyjqE2nwWAUc15hTIA/oYjLPfwhNrIXiEiKJopeWcHSqsXqlTvl1Gts4k2FtEjnm5BJ
	NO9jUnZPJRi1fa/Y4dRc+H/zVGiZKiolc+VOX3OPAbV7L/ansIfy3Ci4eU4XwSfa6bH+0VZLR6+
	aqIdJiV8qzriR7sw7XcmbZzaaJtPg0WSNqURPvjYADBDd3ZmTKKdGZSl804W9hqZZk+NivKQBHq
	cs1aaPeFGNxFfaY4umfi8OMjcDkgZ2+5+EkHoesZ2IRNboFmui7VWaq/k5nY1ZnsY7ayMrtnfKZ
	8s836+SEry7fdoMC3vkYyFHMIDA2UJRL9M=
X-Received: by 2002:a05:600c:46cf:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fc5687b6cmr159289905e9.2.1789994192617;
        Mon, 21 Sep 2026 05:36:32 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm23342442f8f.10.2026.09.21.05.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:36:32 -0700 (PDT)
Message-ID: <2b27bb4b-47e3-45ed-a26a-4b9de2b20542@suse.com>
Date: Mon, 21 Sep 2026 14:36:30 +0200
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
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <arEZrFmXeCO4hZpP@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/26 1:57 PM, Lorenzo Stoakes (ARM) wrote:
> (note there's a v3 see [0])
> 
> [0]: https://lore.kernel.org/linux-kbuild/20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org/

Thanks, I missed it.

> On Mon, Sep 21, 2026 at 01:25:09PM +0200, Petr Pavlu wrote:
>> On 9/14/26 11:22 AM, Lorenzo Stoakes (ARM) wrote:
>>> The sections were confirmed to be byte-for-byte identical to the C version
>>> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
>>> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
>>> __version_ext_crcs, __version_ext_names and their relocations - for all
>>> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
>>> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
>>> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
>>
>> Lowering the data to assembly loses debug information for __this_module,
>> specifically that it has type `struct module`. It might be worth
> 
> No, it keeps it - every module includes linux/module.h, and the extern
> declaration of __this_module carries the type, so all of the stuff gdb
> needs (e.g. ptype, p & field access), DWARF etc. is all there in the same
> way as with .mod.c.
> 
> Have confirmed locally.

An extern declaration alone shouldn't cause its name and type to be
included in debug information. They should appear only when the variable
is referenced by some code.

Testing with a simple module that previously referenced __this_module
only in .mod.c and in no other file, such as lib/test_module.c, shows
that the .ko no longer contains debug information for this variable.

I've verified this behavior with GCC 16 and Clang 19.

-- 
Cheers,
Petr
