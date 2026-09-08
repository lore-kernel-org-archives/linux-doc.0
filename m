Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B57A3B6C14
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 21:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901999; cv=pass; b=KNJuilYTOHDgTIxmm5f2xd7gOJkSkX2maAAjMjh04zC+hmnyv0UdpVsjlPlLLCfD43M6UV+QwWcPoFfJ7BVTirHb5Te+VMbUvMNJMmZ/LdXusykxa2sCb/gNnt3VSY0KIeetb8AcZ3ma8t7MNXLO7BuWI8kYxfhS3Wido6t/am8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901999; c=relaxed/simple;
	bh=ABcg7txfjreOEvrgYloSz7dmSAX99sKg32JTqnOhFhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfQSRYVfkfQ748zV0A/ckic4gS+J1Ln1OVnCpaHp9iUC+ARF2OUrA8j1wzULQHrp8RwWMCzWdJDY+rq+dDG3Ew3huqvkOUF6t3yY8vCr2Ut/wNXZ1k+P8jqF16ZJrojdPLDmunRJQoembCyF8XMlsZ6eWBTIuwNqZZYz9BnTRcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPf6ZmPD; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPf6ZmPD"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab16a9b0so215445a12.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 14:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901998; cv=none;
        d=google.com; s=arc-20260327;
        b=QPPToq7RWtcfITjgRpY2DmFdaiz9F6+gvpcQW0z+lutEet4dTot8x5vCo8eRGGI9o+
         q+gRTzPr3hyg7fvkzVwGMjQ8CnwBVGiS1gbm2R0rDKMhvKCRnRd4+o6nJipVWMG/8gEd
         6qCFy4L1O+VlTSn/lWrGGb7C0ADv9X90+OzGnRckUyo5QEl7dT3f416QvcOd3GckyvAc
         qut+aazXuPxao5XhlIR7eJpm6iCFd/33IehuEM8KF+2yv3OCgj8IDIBBYiL6Vvg9se5F
         MnNzv26OLl/PXxLliZ1XOBAhiP+cAcuCrW+MXFuwqiEBjqL6l7ux3X4zc4H5IOl6uL25
         i+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        fh=x4zyGf6qy1bwhGqmsZPgyFE8o9yX99o5VZm+BZjLVo8=;
        b=plMu9kKFM568i4Mxv+yuo7RjCw0VQrAq2flTpi5n5pfltkuZhvrUJFeTUO5WnfLHvF
         boTnpVDtmZJL/v1pN5wRp174hT+cCWMriLF5hYVoLxnwSVfPQuJ8ZHLkwRoRk30gr4LN
         ikjzFAtU18vfebiLG7dmVbjx04zln+frWXOZk4bQyGFlZrBiPSUgE6D/0hTq/9HXy6JM
         q8i11c6HfoeMb/wZuUUJekSwh6aJFDoljX4GMgwyCylhsi6TSjgHmeyZ8xfgfMzUD5J2
         Od/Nqgxpo3SDxKJJokv0jdHlyriy2jCCshQZ2Hrc2VS4xEEo6vwom31Yt+XvJSFv33oB
         NBXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788901998; x=1789506798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=kPf6ZmPD2v4AefzfbB96CY/1Ro8ul1IcFijnGdxXVXzXHHTesc60tRNbKo2R6qNiCV
         COm6UKvfUu6Q7EJ03xDCsbtZZbD+boDtakiCuWcq39IiGKN4AWNMMaVstLpEFMUY9fs/
         fA3Ai9ETukyNfyw4rNxQfgzC3yRmNdwLUvg5cs5n0LI7BG+oMLyNjugmjmLMSwmDxeii
         iJ9ESmD+qArHzXwghsJnFKtjbvVeFcor+5i9UXIjBUduxGmJNTr6bn/S+Vu/qGuE5X55
         I4+dUgYq6dDOehzn331667NXRaNpuSHWvSLVHlvtNcNxcI1Le57wdyswdbpjKOR//hsO
         L2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901998; x=1789506798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=M1nCqc9Nw78AL7Q1AHQx1eHmk/ibTJ0OgzUBzts2FJgwUw0xkwWWsuvJga+XwZ5hkv
         Tn002thFp+TYJabgWl3LpJo2crjEWxPWlFQiCu6xxtn/bY0Z/2jWPchCVHSqsiNV7JEZ
         VqTL6YNVNH9ib6m/ck0TxpOSm89vXvbGVLOrP9C4oInBYRMxjwHI2R0aJmHnfUWRw3uk
         6UYoay+GS4HWawVFGuEbtiRBeZ27jhG3+sCjJ9TBnmd3qet5heIY2bXavblGG7U3uUjm
         85CMe9mRCZd0G81nOxrfWf4fJtupVLQIu/c+tSIdPaSyjw1AqcBq3rdKAdB+f4rEUHwZ
         YAZg==
X-Forwarded-Encrypted: i=1; AKwUvByVTBD+69vABZS0Y8MUzfVNl9WC+wksO4i/bf+fBMTz7oeEzEbbna7u+ztwU0fjj8YAFFBZu7uZ1Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++l42SQDsMVJ/aVRqyg8TvrUTrxfw1Ofwy09CcYTXOiTZMy+K7TP
	Mb5ZNVybsDxa5F3prlDNFC8kiz7zrKAPC1xFGtsXeAJp3hOyCzWcltyOba1A1DrgsoPe78W8hLo
	YY74mMQ/aevp22+aJ6hW20nIXJFbz51k=
X-Gm-Gg: AYBFou23kmWSVaJqit2o2PyYd1hTXlCBE1Hj46L3JHV4sD7gMEWjT/Y4mXZgp2zjiMI
	bFw7CMnhmRYBWccnBh9V0Hus66PKnqiEPlkWo2waIdT0kE1WEhyX6m99492JFT0Q+ZjpntKNhzD
	KrIz6r8Mt8X3AMDEZSaywDzOSGG8rWZJJ3E+lDgRTTzh01KB9eDFz0rp6W60KX+bCb8le21bdH1
	mknwv4qI1+ce/itfTgpZd5Yk5veClxZ8aq1jfmug8/qc5+Wx3pe6D8FzK4nxCkOaOSnuyEurXHM
	FmjhbyVr5BuOBvGB5MwQk1hmHO7sVJQA2BZJu0/ZZJmOjrNR/OEEs2OBiCB/C63ceGdAstS42Z5
	HnC5T1q42+t8ZyG7CJRuoltkP+GjCYUbBM4whZvJHdgVrpqw+5Oggrld0rXgkq06HaMyqNsgg9x
	n2ylzwMUvwOlIvg+EEq7iYMr6nq4js5cw9Lc6SudteY8vw0Xr5WKs=
X-Received: by 2002:a17:90b:3882:b0:396:a47f:d38f with SMTP id
 98e67ed59e1d1-39b268ce386mr30178901a91.3.1788901997757; Tue, 08 Sep 2026
 14:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:13:04 +0200
X-Gm-Features: AcwNN1U58TdOwuasMFef5tH_3N3xyJMe8mAu14nPZtzZCuWKC0n_7MgG3XQZVuw
Message-ID: <CANiq72m5C5tNKUWTYYerBt81KtqRLgr-S4c5XLUN1uY5n7mqiQ@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:59=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A future -j/--jobs option is planned for
> rustc:(rust-lang/compiler-team#1005), so check to see if this available a=
nd
> if so use it.

This is already implemented in nightly as far as I can tell. If it
weren't, we shouldn't add it, even if planned.

(By the way, could you please add Link tags for those URLs?)

> +config RUSTC_HAS_JOBS
> +       def_bool $(rustc-option,-j8)
> +
> +config RUSTC_HAS_ZTHREADS
> +       def_bool $(rustc-option,-Zthreads=3D8)

We can simplify using `RUSTC_VERSION` for these like we do elsewhere.

Cheers,
Miguel
