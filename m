Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F11382F03
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416784; cv=none; b=gStPosWdc2c3kAq99JwwedO2OyfXcCWLqQFb9zjsgVEl5AgstxKGDbqcMTpkIzhLseOLTV86Ca8pGzsWL1T3pr43vQ4iLBA5z8ogv0wP0itWNkr2oqgo4ubCIQID98r0yopyo70dXAaYbVMYaymkVznnNpCWa4fN3UsItZz/+Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416784; c=relaxed/simple;
	bh=g8JbSv2uB9OVHPX6mK0/xKaLA1R5JXVM4OnU1gOEgUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTXCpNLInuTYYLgbJfvHPWViYSQfbYkTwSznIjBDpdLfbBVZdu7VG7cKxjw+gs6IyV80tYbqX92UVJB7AmHLQf8iOqBnrtcoL8yWaPoRrws0ziYILgZL6CrL9UbAAouvnAQYXdJfhsdL+cjyaRWq5gqVrKtpcScIL5j6brKpKu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PF3qfkGb; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PF3qfkGb"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so361118466b.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789416779; x=1790021579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=PF3qfkGbYNCqSRrNBOp5ciZbZjo+YrR7Hi3W2EE5I+ECZXKtFYyBi9DD+UzziCKk6K
         2HfNs7hj/wDOoQe6eh6sKcq9QTdLUAhwWdHhyXOc85zRpI0gznguIQPC0ITBmTa10CHg
         AmNk8/mO35iwDSkBBHK4OCcdxaP9p+s+c6L8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416779; x=1790021579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=isxKRFVwkcJbocDd00W0HxOCGhXU45X0mcaXQeQUMc1zzyk4AOUwi7EpS+ztu3aWA5
         FztQrFNDP/JVin7b5M55h2ymjcAAFLh3n1+zdtOUvWpINXSviJ7Bj8smPKaZ4NlwWux3
         aRkZ2q19dahsjLFw9coEgP+bXa/TizH5yD8zX0dzHbxMPCrNMQpVo4Mbf4w22niLQzoU
         Jcd+15WDr+WkU3GM9PQY9r0aJHFOzixaihRmfzMHcA9689sL3pLNh0HhdPcHoe9MgqLw
         Twi2aqSBT29k3VgUH4sHheusWc+osY4bsMmLt1oGwyz8el+zdew/xKso7cKRyiEfE2Z/
         SDug==
X-Forwarded-Encrypted: i=1; AKwUvBw28N2HAfE2X+yg7ur5zu/1DO3i1HQTfBL/hLHeNn5lh5erQd5OtmdhSeogZCoCx2RLkMe1DOCFosI=@vger.kernel.org
X-Gm-Message-State: AFuF++kfH63/Tk2v55guNSdajHiXvyAQzSL0F0KdHM1H+cXb/nYyxQO8
	o/S1FiqYBXfpt8PfpM2/XnT0Hm2RiKIlBk0nKeSysEHc4cGwctSXhFixC08tZI1AZ5LhlQI6QfA
	Xl+xQweF5KA==
X-Gm-Gg: AYBFou3jdvAO7OLpn9tt4kYoCjhEcRnmTnZ717RdUgIzh7/GirrXWrYREjY6/pAZRFV
	du/zW8Byl/xL39adgudy7j0oSR4h92BRRWNAB/ZNCBh+B0Wi4zXpoD+YEUL9cbnc6j1bBXIFlmR
	/77j1fp6r0yinUhayFLA5amP5Gj+LYQCwcBM0afGyOcY2WE2uCfZ+e6KggE7wqnpw7or96zhKLM
	m328bE5qZQzw3KcGxE26nJR1dHpp/IhDJy9QO9P/H2TpCqCnvDwpo8c5T4oBnzrRjRiqc3NoGHo
	vB7rMLIlZJPtNtjsVDEQK5TpwfDHGgDQzIQOwnYD9jUnO8znUEYeQtnHx3L6aXel3ihwUS9mqq9
	0v86SznzsppB/baYSxoCwXfxo6IMs9gIJbDPO3XFtQKh5u/fcpmqhXI4+075RfgLFH/TK58dg1k
	jT76i/aBHLhh/zgZLQTXTDeANtbrQx9yb/yhLmEaXPBkpTvI/0dn935wB/f0SKVvzgXRvjcsfu0
	RC9CGK0heUjMcf411t9xZgaxfLaFHKgqyq0w41QJIxPSY7nmg==
X-Received: by 2002:a17:907:3e0f:b0:c29:4cdf:dd70 with SMTP id a640c23a62f3a-c29b875e041mr270075266b.44.1789416779357;
        Mon, 14 Sep 2026 13:12:59 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654e4sm471097766b.30.2026.09.14.13.12.59
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:12:59 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso4695440a12.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 13:12:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsDgOTmqCgNFRxtwi75Bnb/puOZevAxr44a0GNBkA+CSG3EAktZOFQFVDQpChc/cU9/RBsn3TGDbc=@vger.kernel.org
X-Received: by 2002:a17:907:6d1f:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c29b84c9a48mr280688866b.3.1789416413732; Mon, 14 Sep 2026
 13:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
In-Reply-To: <aqhLhVMkNzf_4oJw@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 13:06:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
X-Gm-Features: AcwNN1XwkDuRyfqGBvPSv1hGEYJIl2TPFZFoOf2g9mdtKKeoU1aAJmlE5veL8PE
Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 12:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> BTW, I found another initialization bug: klp-post-link.c uses
> elf_create_section() to create a reloc section, so it missing the
> initialization of rsec->hashed in elf_create_rela_section().  But that's
> moot if we just get rid of the hashing.

Talking about "getting rid of the hashing": the instruction hashing is
obviously a big deal judging by the hash size expansion in that other
patch.

Do we actually look up all instructions by hash in the first place?
From a quick glance, it looks like almost every user of "find_insn()"
is looking for just certain *kinds* of instructions: calls, branches,
returns, endbr.  And branch targets.

Maybe stack updates? I didn't check.

Yet we seem to hash them all - even if they are just some random
ALU-only instruction that is in the middle of a function and never a
target of anything and has no impact on any code flow.

So the question becomes: do we actually need to hash those
instructions at all? Are they ever actually looked up?

I don't know this codebase at all, so maybe that's just a really
stupid question. Feel free to look at me condescendinly, shake your
head and say "Poor Linus has lost the plot".

[ And yes, I see that whole "next_insn_same_sec()" thing, which
obviously *does* look up all the instructions when you iterate over
that function, but it strikes me that using a hash table for that is a
bit strange when the natural way to do it would be with juyst a
"struct instruction *next" field instead.. ]

So if hashing was such a big deal that it showed up clearly on
profiles, maybe the answer isn't just a "make the hash table larger".
If a "next" field were to not only make the hash table much smaller,
but also mean that next_insn_same_{func,sec}() would become a "follow
one pointer", mayeb hashing would become rather cheaper?

Stupid? Or maybe "not completely stupid, but too painful to change"?

         Linus
