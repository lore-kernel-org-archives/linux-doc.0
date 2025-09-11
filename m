Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231F84315F
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 04:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757565973; cv=none; b=Rng17x313E06Wq3erstzC4SI+gk+6blHKP+dTpC2j5f1jETqhcEs9rPQW/VHcP2aIa/Z6UKopa3OsI00z2lFfhQVGydAMSvDbiqUECP4XGw7HRnBLO8e13IrqKfPwKEVFXdKEVNEaaZIHLvl7PG2YHkODAmIgCndX2RJz/85xwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757565973; c=relaxed/simple;
	bh=ZYQmQVPBF8zKRLNJ+D4bhiIq4DL1k5MFPT2Ve8g115I=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RfFpn6h0p3WAN0YmOj0J9tZ/jvbeU0n5LywjG8fB5mbulDXSlGRMtxA+Pt2jd+8VcLVD1Q0wdiytYG5r3yJKOX2BivMH+W2HGeOpZKH4piy2Nf7gVXLGdoWAEQaDxZA3uW6CDkapW4E0YeqWuf6UiEiFIZ3Hde4aa3xOf9DLbsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVUvX8H9; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVUvX8H9"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d605c6501so2231617b3.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 21:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757565971; x=1758170771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1OFQORNmMyhF8NqnLlI7wxOYnlK/yXDebbJxZdkpHcc=;
        b=QVUvX8H99YU7pKHdlG0uydz/0HeW8qJ53/5dxsUs7PeTDkdQi08HUM3DSol7FAMrc1
         QjvuOZ6McvDLrVzHOPstBnf2dM352XnRuaM+Oya5mh/EV3Dk1/YZtXvGgYXwV8N02Ptk
         mZ+cNc/0dGHSXwQHYM2lJEzl+2IN+h1eZWaQ+jMWNhkFrIaGbtI0msA0m8G9lG+MI/os
         nFSXEZFBWMwik4LSj2G2gh9/t/T4eSZwGZrr4LtyFCPJIuPvsC3rMo0Qq3CQXrvHD+QM
         ZJ+BBPZLAw+BWzNaBAR437h889AHD/XGanoQ7YJ197Ld1WVYEF+foVEuv+qK1jj3wiXp
         gp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757565971; x=1758170771;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1OFQORNmMyhF8NqnLlI7wxOYnlK/yXDebbJxZdkpHcc=;
        b=sG+jpfYxf9b3ggkRVEXmhPzHRI7dZvl1UJ/E+BgdxJeFUogtBKbwMOB7Z4Lx1WJt62
         MoRFye0bvwX8vI+hWU0HFNBPvlXPz0QPJKRQk2s7eS7KVQJhGOgs5I76OcwEnEj8d+Te
         zgQVFXmtchdXmbL0VJAgYFd6ekBKYTJZHashZ9q0iUfI0MpZgErFw95o6XPCruIkH+nO
         UFutQTgJmlpL3YeNY+G8OUzapU5Lm6L5id86fohTxlFpD7n7pKCdAAE5xJr+7L0yndHF
         N4/GuvTVopumerpalHmu/TVZRzbwjON3SuoK5f6fnivXrpFBDLstRx8IcnURZ3Z5WnQy
         WyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmmixv/oWi6U5Dib5980r24fbUKv/0VPSYlVKCyHpomRmWFQL/Wl1nESZdxJZ5Z4DYynaw7BuO9So=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcLpi/wV0nVGIKhqvW/DA8rPdaxSsowc12K+QyTVp5aMfkCVN7
	jFPdCoQrgsNsv/BNTlD+zKvFeZirx2kJeeo4Gj7IJwtjoMF2/fAF2dx1
X-Gm-Gg: ASbGncsGur4Yn6WkE7NOdKfKA2rOfjIz2ELNGLdpN5Jumi+EQyTNqnt5zgOBWWj5ybL
	HAMeltKnLqFfitUvJuFWJ05gz9O+r/T6oP8gN/STbSHx/sNDo/mSNY7taPgnys+QImgHWtcGMdW
	buJ52ivDGpJGPT1Yf5cVbo4bi+p1oMbpbBJrePK1cr1CQiHhN/NWofN4H04ljey6w/c1WYwmJVZ
	/IkntH4u69hxw7XjdbIxW+T8+IAnYzkqvqVXvA3JyBgL0UpnXpQpQn7i4xFF2dBi+vEKi57/VIS
	1VfEqwlDoVV6Qr7yzJq0e7yoXIIPlbgm1hTgrb0TX+Q33CpNO5A9JIMVK4hnkqH0vRAJodjEjL2
	ewE8CBUk5z8IJQi+neWQZLUAnhhj6ZhDXxqFGSKb6ymn5fpK8Og+1E1yUgkRmO+nC36sKBDbP4w
	==
X-Google-Smtp-Source: AGHT+IE09XmvpU67NiXH7rk2LbrDMhUi3e2OWnnlWTn7trnF2NMGewy0hktXoxQgahi3Y4iKLHRnRg==
X-Received: by 2002:a05:690c:6309:b0:722:7a7f:5358 with SMTP id 00721157ae682-727f28e7503mr153782967b3.4.1757565970388;
        Wed, 10 Sep 2025 21:46:10 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76c28400sm1130767b3.30.2025.09.10.21.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 21:46:09 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <6bceca9d-44cd-4373-a456-7c2129b418e3@gmail.com>
Date: Thu, 11 Sep 2025 12:46:01 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <20250910-harmless-bamboo-ebc94758fdad@spud>
Content-Language: en-US
In-Reply-To: <20250910-harmless-bamboo-ebc94758fdad@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/25 10:27 PM, Conor Dooley wrote:
> FWIW, this --- breaks git, and anything after this line (including your
> signoff) is lost when the patch is applied.

I used b4 command to prepare and send the cover letter and patch for v2, 
not sure what happened.

I see that other people's patches have a [PATCH 0/n] email as a start 
that describes their patch series, this is called a cover-letter in b4 
and git-send-email right?

> The riscv patchwork CI stuff is really unhappy with this change:
> init/Kconfig:87: syntax error
> init/Kconfig:87: invalid statement
> init/Kconfig:88: invalid statement
> init/Kconfig:89:warning: ignoring unsupported character '`'
> init/Kconfig:89:warning: ignoring unsupported character '`'
> init/Kconfig:89:warning: ignoring unsupported character '.'
> init/Kconfig:89: unknown statement "This"
>
> Is this bogus, or can rustc-bindgen-libclang-version return nothing
> under some conditions where rust is not available?
> Should this have 2 default lines like some other options in the file?

This is because rustc-bindgen-libclang-version can't find the bindgen 
and returns nothing. Sorry I forgot to mention this, it's another reason 
why I wanted to separate the script, in a separate script we can easily 
fallback to return 0 when an error is encountered.

Adding a second line `default 0` doesn't work, I'll try to fix it. BTW, 
when I fix it, if the diff isn't too large, do I need to open a v3 
patch, or simply replying to the thread just fine?
