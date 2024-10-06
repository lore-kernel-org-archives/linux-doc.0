Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8325B23CB
	for <linux-doc@vger.kernel.org>; Sun,  6 Oct 2024 00:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728173261; cv=none; b=KcEhpdilfTd0c0pLHvDvcpNZQLryUKd3VxIHIWBj7LLJb2grHeqmyXj6PXVBHavAx9rD1iXxQzWinzk18nLFv85b5tluNYNu6v8GUprXQdT2Etu3d6sj6u2W56lzVq1LcCnFQ7mEWIlvTfmyZWfNww/y5ETC3JumV2LYT8EFgpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728173261; c=relaxed/simple;
	bh=7PhV7mSmrjXdm322I5AhDI6uiC32DXT2Ek81VrbJ7rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0aaRmqpdIN7A+rKmWVQgL6OJc7dVGnWViFAZGKXr9NghWxATzvJnLrxnmzNVN/ajjxSIkoLqzad6xnYoaf1j2TmU3Iu0NDUYiP5bryEBV1jPhmfIhvEiQa5djaB5/Pu3xqnnaTRogKtxZJO8NwFsFuTXCFeLkKauDSlw0+QhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q6piI6kn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q6piI6kn"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a993302fa02so129380266b.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Oct 2024 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728173254; x=1728778054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=Q6piI6knUzchtj/D6Z4rgTaAQjpFrqDNfZHruTIkPT/zre1/f0J5VejCULpBf7l+J3
         6QtSrWtdx8RuKAZ2sF7u2UGXVwsRLbj63t6oNybnmOxVe8b8vm26FRWCFndUlYOMKDtG
         brOAhOlgtfNEhbOasJPYXT2lNn00zrCMteX8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728173254; x=1728778054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=oAOfyiwd6IccNFKqBa4zX6eX+ZphrRvmb6rtWJnAPLp2/VwzbtGBn0ASDyGCLk4/Np
         Vl+Y1XpifDUW9Vau0hI2CcNMsxSGTVvqVBEoe9s8Qh8V6Hn2/i0VnrkrGeT7AeLWEKbl
         zDz5Myfs6OpF+9lxp1qF3G1uk0CkGsE5TtWm5+vYRlKdT8/iCdACz22lYaBrLPOp3AgK
         qoyP9Z6i7a+8nNGMZI3qQ4f1IWZgyb5ElsxzUlKDpwy10uU2hf8ZwLLkDUcNAcVCYqfb
         kqURBCBj2727o3nkQy+nE4zWeSIHzdsiL/XbOoBvsqoajluzevRDrl45rxZJPXESCZna
         jM/w==
X-Forwarded-Encrypted: i=1; AJvYcCXNzWStLB3xeOmFmMNmdgd1/53KaG0wTMJdprTS02UaaTicObwYqslxoqgzvmmC8CG5pzn7qxM1ACs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW551SAM7+VgluZUeQ5GNzguHHHABfT3MrB9pwjpvh8NWqivZm
	Fmc7hlqGrKBVz7/PU67DJI/VP5+/0+oWfNPKSqlzcu1WndTaPtz1fXQZt+aBZSW/Xfj1g+YUDIo
	7CRv78A==
X-Google-Smtp-Source: AGHT+IEFq/H2VisIwZQasnBgsXrNbLrSopoAypPnedFoGsrkVZOmT1WMzv9CXgjV91N1gPgauv0eCA==
X-Received: by 2002:a17:907:7d8c:b0:a99:43e1:21ad with SMTP id a640c23a62f3a-a9943e123e2mr216968566b.45.1728173253638;
        Sat, 05 Oct 2024 17:07:33 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99384f8258sm152439966b.16.2024.10.05.17.07.33
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 17:07:33 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a993302fa02so129379866b.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Oct 2024 17:07:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhkiHE+6xorQWVIMC9/+bXe7Qj6fj9WfVU0O+tEE92yMLw1vk0Lm+asx2h4SsNCWWcdyOaWdIkZM8=@vger.kernel.org
X-Received: by 2002:a17:907:9693:b0:a99:3d93:c8bc with SMTP id
 a640c23a62f3a-a993d93cc22mr339286866b.13.1728172818387; Sat, 05 Oct 2024
 17:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
In-Reply-To: <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Oct 2024 17:00:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 16:37, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Sadly, that is not correct; neither gcc nor clang uses lea:

Looking around, this may be intentional. At least according to Agner,
several cores do better at "mov immediate" compared to "lea".

Eg a RIP-relative LEA on Zen 2 gets a throughput of two per cycle, but
a "MOV r,i" gets four. That got fixed in Zen 3 and later, but
apparently Intel had similar issues (Ivy Bridge: 1 LEA per cycle, vs 3
"mov i,r". Haswell is 1:4).

Of course, Agner's tables are good, but not necessarily always the
whole story. There are other instruction tables on the internet (eg
uops.info) with possibly more info.

And in reality, I would expect it to be a complete non-issue with any
OoO engine and real code, because you are very seldom ALU limited
particularly when there aren't any data dependencies.

But a RIP-relative LEA does seem to put a *bit* more pressure on the
core resources, so the compilers are may be right to pick a "mov".

               Linus
