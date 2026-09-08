Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755183A5E7D
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 21:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901594; cv=pass; b=dvfX0J/LBx4gz3Fy/4bALCkoYDRZ8u9KvLyMpVQM00q4x0YfG0a0LqBCENi9a2nL7MW5mdrbE8Yh3GoCUJKRYXUNkWNrMB3t5h9sdWkfL7SdEjx4tZ4eZzLZj5wseM41nOt0QtJmSOiUGQ9ZLKfRKcFxh1ws2eV5glAVvG5iz84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901594; c=relaxed/simple;
	bh=cIOFXtCuNna/zYNDEeDAmAkgX9xNg/vNmHFdct8PtpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFSegT/Ain9dDyTT4wp58r2qUpaVdetS2aSVANoWknECyWyxrjmZAdNtyTXhW9FK9TFOaL5Oxbt6R0PdP7mf11YRfGKnPRK4VKDhyeM39CmKnsFk8tjiFIbZhz4AvDxorsiSvBIT8Gx9wv5TX+Joe01XOB2y4igCJCHJLDk0bWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otsf6b66; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otsf6b66"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso48915005e9.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 14:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901590; cv=none;
        d=google.com; s=arc-20260327;
        b=ZYMnxSVSUaHPWfXJZYrIyVoiOE/WNdaS4LMUkJ2nfV5ge2xBgjF28vhz0KPCbFK1Oj
         s9/5a0kYY58gK1q1qUuhQPul8jNVHwfMUqOaktar9duFJ9Sew9huhgY8k27Gnv97dHwQ
         KrLuiGdGfEcp0OpJOqxYsBgdG/SqZnRlFCa9YgHxXt95PNbRBbqZeEw6F5IB2/0OkJy3
         8T6leTOp2GqurTLeUzNs8sRgE+DTqZ2ftqMCeFrCoGvvW+01AaetQoJtB5ay60PrYQ6k
         rOIpADxH/55SB2OJLLWyuBJXZ1nK/ApZaPKzYaLXR0/GBr/gLXyX/u6uAQ6ZSHdeo7tH
         VbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        fh=ri7Hk96yBS9tuemliGjF/I0RJVaqaUiQBIZ1CSFxPPw=;
        b=N6Cp2GIfjcb1EU/DZIJ0JYbRTpp1g+yvNICiVBW0Sk2NTRtHlJzcVzdKfq3eRou0US
         k1+L2ZZeVWtEJc8ReOyujDEsJlLRaRFLsdWfsOHzL0EXA8YISzdHdA81Qa9NcEi6uiQj
         ydSOGkkCEQsUe1DO/SkabP7gy5LI3P8SHmkzTISIC5m6VVH0Dp1QnPSyjZ232EGn2g18
         dnMebiQzLDQ5b7UHcK1GKa4hENipEjiPOxeVW3alDiAophgg4KiF0w2WHAIYBCiRD1Na
         RNVpmeP7FTfeznmEexJU2cHzE4Dcu1PZfOnaiQ2gEbP/pXSnnUDGUSxF6Q7xIlVqae/e
         8+AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788901590; x=1789506390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=otsf6b66eLyN+62lzguVV+VBMlATv6z+svgDrA31hnA5b3fBV3bwYCqshPtnmsyGmv
         QDNDZwx7N31zA+x89VYITcROT5ZRN8TP4ggK6R9uMannUm/MUJSMRZGWkbAMzCuOqlSY
         H6biXYN3dL5DiY2yXed6Ky4yh4BVxXR56j5VYoNJgh5pu6nlbLx8ul8LTxw6ojhP81mJ
         6JTXwtflQYVkO/SfV7yVBVRWnh5SQfasm8wlbFkY625Bkt4jmQ2QbNf1ssWLfzh6NMk7
         l1RjM2KYlCGn6nKE0yFuTlHEHgKavdGE6I5+Sqelz5oi5Z+IpMaKNlUCqzRnSjeVC5x7
         BuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901590; x=1789506390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=F5oiZV7AoKiNs/cQlzq+zPCz+NoWoPsxi4x3P3H5CRyYvucZnc+ZGCBnb0Jf9aLp84
         H+zSZv+8NUBly2SAeDUuBXSpwyxtMrDY/yjT/4aBoseLTIc/ragGYAMV+TsW0G4kem6Q
         YBEdcYHC24T+25Rq5IubG+itqtQI3wL2QaUGCZPqhMucDDSVpHVq81LiYl2NJyjXRR92
         fMzifdgwqQpii81J+A78Rk9Zfin9RTROnXB+QpPGD4Jk9UWSlvIw/cd7RSjSmhDiDZFk
         SiJ4zehlQduzGVyP1TXj0mPF5lPZTr8N0Hb3FKa1OkFgCw5jpPSDJ7/yTFr2CB8/u/a4
         U7pA==
X-Forwarded-Encrypted: i=1; AKwUvBwzJm7zLbW+oF2GQA/amF6UB3XmzGJ+1i8qVK5BZDv+bxoJzoNUdxLho7OQJiQ2soV/EWhDAGnD+M0=@vger.kernel.org
X-Gm-Message-State: AFuF++nVvg8odvHWR++D4xNY9LWuWcHtOakwqOOz/af/3giFcOdhXOyW
	yfBeOI2TvvFlvlwgmg9kmXGqPmSjcJyV4vxrW0XoGvHoRwKC894Wqqi4kPIXhE2gv+1/dgq9rgg
	ajTbLgfvIMdOJGa9Uu4eZWzzLbV4AMCEF+2dvSDMX
X-Gm-Gg: AYBFou0NhOA9bO3zFoG3DzjtE5EuCoJMy3RqhJubeBGRyWtO62+lbG7Blc6qi9GH4sG
	iV3VPRiep9SgrgzLp5xVAlW712+fAOklDt2XDi3IljcyAXwcR3csVC2CS4e/OXoJlfbbkEYD5RE
	By7SSFzV2iMzOQdqpYOqNfnOiIbMQ3qSL3pa00l9B5b0ocZbWvCmmPDSPKgLeregJcOC4n0T3fe
	NkUHBaj7Hcxdsekoe4hKOQgtaVfeYERN/gFZbGQmOhwevdBJ7aq13kTUBwtv1E9fdL+EAhJEb6J
	GADum/x+YY7/r837kxtsqRUbvbRWZZY3qdzVlJj4F1UzdztHx9/axR9WvJDGP+PMDyDeDV5UfdB
	3rgCgSV57cKbAXqBnPO+RR4PTgoR3imI0wccu4oqBH3izbp/mO30Ea6W4
X-Received: by 2002:a05:600c:6091:b0:49c:eb17:cf3b with SMTP id
 5b1f17b1804b1-49cf8252497mr286154405e9.8.1788901589479; Tue, 08 Sep 2026
 14:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Sep 2026 14:06:18 -0700
X-Gm-Features: AcwNN1Vne6n6eJi0vjoX52mygVY2Bf7Bhttyek2fKXqRHQxDJ8Lg5WpFcLyZtjc
Message-ID: <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
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

On Tue, Sep 8, 2026 at 1:55=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time
> spent stuck in single-threaded bottlenecks.
>
> It turns out that there's a lot we can do about this and doing so
> significantly impacts kernel build times.


> Fundamentally the series improves build times by parallelising
> single-threaded tasks as much as possible and improving the efficiency of
> code used in the build process.

Cool!  I have not reviewed this patch series, but am supportive of
solving the problem, since I do recall this being an issue;

i.e. it always annoyed me that despite have a 128 core machine, much
of the build is sequential!  Having all those cores and not saturating
them during a build was always something I noticed (usually have
system monitor always showing system load, always) but never had time
to look into.

It would be cool if your LLM could generate any visualizations of
what's going on during a build? Seeing what's serial vs parallelized
in perhaps useful. Particularly when you can compare the before vs
after.
--=20
Thanks,
~Nick Desaulniers
