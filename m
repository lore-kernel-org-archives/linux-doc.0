Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4D248A8DB
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401579; cv=none; b=AZAqzunTsRI8GJ8cf6PP4DQR6W2KnZtV/Lfje1OTvErCoKRWmCe1cJRGesrzokz8TL5DApdbQ8aL4FgVJC0+OUTKtoF2s3powG9YtTR19sYVZYLChJe3s4a4mJrY/WtV7BigpGDBkjiisineiFude2taXCSaGt5oq3fklsGGwiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401579; c=relaxed/simple;
	bh=xMRNGFwT5MG/tN2Z4rVlgZAaGoxD3wGYA7E+SDFQua8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTqUgPSfxULFrQcHCcf76x33p2fA+a+vFEKXz5kiUmnUAl0ITsy74WlLPmphnULVBLqxqqKlN+tHG6z/NYXGr9jBwN+jxh5Tu6nWiI3EBcKBbVeNbvnpeI3ARTyCQSDJxnbcQT/LqH/nA9GRqdd/OJHzRJtIP9uU5wO5iurAGts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PG7A22pd; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PG7A22pd"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so3980101a12.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789401575; x=1790006375; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=PG7A22pdSZADKuyhzgOllBVp4nZDuJps02wjl0qddEJGdKCES1jf/AB060J8H+xprT
         rTed5n9/RNp2i6iRyGSwFKvuiSRZMVsxpAvEATzhWugWPtpWeo6RAeVDjULOg0xL1wYL
         BDfgf/n/hEs5WVn0vdLYyETIHkjdxPsdD7m+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789401575; x=1790006375;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=U2CIDAtjv0QJw1r3i7cpM8k6m1Bwl1RWZ2M4Kkb3diqvrJApEx17rksqPnHT+LL7er
         BX1R1NDcN1L/S7U1MdJ9oATqfbUp3lo3H8o397ilkrSzkja5IuDz7mR9A9KcO6NJJoeo
         4EVyO+1x86veOENcMgLUgHhhnLMLmtrUHI91HuBQoaAElNT0UuKhmHaUFdHnpIcIaeBq
         MPaNLGYWHqlgKBW02/kf8dlsYifddXjPF863oc0+BUbYE3JO6V6AZyLYEbSjuIoZ8iyV
         XvM0EpgrA8CcZ+g2DGmLR1DUylc15X61LycAKrBu1/ggE3uzAi9UivxJWaTNkkdkVwfS
         L2dw==
X-Forwarded-Encrypted: i=1; AKwUvBxqXFIK4SWgBINRkEvxOHSogHlf4a5Y5CNn9F332/GmWSKZd8Q7mQG/ifJleui34S+qyoMRURui4XE=@vger.kernel.org
X-Gm-Message-State: AFuF++mj+WmJH4BnnOL9uByTen9QB9LHjlL0ofbqonnRICzp7KM7ixb2
	7xcstmk1y4W6mlgWwkwdgy96eXutPs2ljlZhPMpMaqqEQzAwUS6Y4BM1gYWsqaBgWvKtLiL7nJM
	DgVbTUkY=
X-Gm-Gg: AYBFou1tFDVKlJTmjQq8h6FO5XfzHTcpf4g/l3O1VudDS8opXvp1MdysSDZzATHpoyX
	ZbvY8LtR1YVIOD5vY6XhbRi070KyajTITz0F6ViHFcnLDx8jXDmx6S0UyFB1IMrbEdetgwRl9tn
	R0j5IBPBo35gFopH0Cl5/YMWSCTAMO5xmArRi9BpekI8SN4+B9QrtBZZlyW5VAHUCZXLkAxRuyc
	B2xeDe8+kHMn2V71dJX4Zq5uR36hHeo67tRMQ2dyhO8YY4MK6w3RSiFOvV4euEF24MBoHWal6Bo
	uy3WbCOVjRKgRfleeLBr+rLJM5Btco9NjTrD5q4/xqqunw0GApLfhZpRvb292YqKOb9wT10Hfnv
	sfRdi+dPaVC9YIEJ1dNAPVOEK10ts45frVBRYaStIyz1n/AuNcMplntqYTdgx0RKdcdPYsKU4SR
	RH83lwg2QZQpsWQEGEPn9aovk+08p1b3wWu6aurRR9fq02V6EvdW4Dx3xg0GIgaSjKa6hziDgOU
	y2plLDIo6sVI2Q5OCvZrdU2x3Z+sh1fRjkKSmEDgLE7F5zKRn9ugAS/jj2w
X-Received: by 2002:a05:6402:210d:b0:6a6:4a5:bd37 with SMTP id 4fb4d7f45d1cf-6a9f61fac9bmr4495224a12.8.1789401574828;
        Mon, 14 Sep 2026 08:59:34 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5920f4asm4413897a12.16.2026.09.14.08.59.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:59:34 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so409069166b.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 08:59:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy+OOEfhPtEWxRCxP9R6EII4dQVv/RLDSERjXcVjGf/2u128+69HjACoZg4fUFQuByGZwJi37ILfTQ=@vger.kernel.org
X-Received: by 2002:a17:907:3f9f:b0:c29:444c:8f28 with SMTP id
 a640c23a62f3a-c29b84c2597mr415053566b.5.1789401247404; Mon, 14 Sep 2026
 08:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <202609140833.88C0E16E50@keescook>
In-Reply-To: <202609140833.88C0E16E50@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 08:53:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
X-Gm-Features: AcwNN1VyLYI7E7T_24gtwZZHDPdmXi1EUi9s9xthPRH35xQepEwWHVnUZ8r6fdo
Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 08:41, Kees Cook <kees@kernel.org> wrote:
>
> One area I think might solved via an LLM is the 3-pass kallsyms stuff.
> If we could get a deterministic kallsyms build in 1 pass, that would be
> very nice. A lot of people have tried, but it has eluded upstreaming.

Even the three-pass one hasn't apparently always been entirely
deterministic. We've had random reports over the years of it failing
in some circumstances.

Maybe we've fixed it all, or maybe the failures just go imperceptibly
rare. Regardless, it has definitely been fragile.

               Linus
