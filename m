Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4200C489FDF
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814695; cv=pass; b=mxk4vDtiYS2TpInjIzU2BE1N160B+AvyMVC8WajTQBu3POOP3LGinelYVa2NMHyHqXrrk0YdzomZLD/68YwKEeNSkKMS6Z1NN3GRWQ7v6Lj75gYputOEu6jZkmgzfG7DfJtv3CbpRULqiyhDT6kSwUxxd9Vfe9LA5qOeLlkBoCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814695; c=relaxed/simple;
	bh=g/BhmG4j9ffr0oFBvhz7lb5ueTvQbhXIGndnnY78eok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucnwNGjPfP7RB82j1jkKE3B7x0v0JGJWbE8srUHYtLZwL0XcbcYt2VQchFmSFqkKdrDHgnumL1ozY1eHFq8SjAjAkOH5faJKxOi2+r+Ao0+vd8Bv7Tu4xDQ7Q2DM5abG4At9A+bwAFPiz7rwF/ocK4IcqoHw2isT0rxiS4PVsek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My1OId9A; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My1OId9A"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-34c522572bfso221430eec.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 07:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814693; cv=none;
        d=google.com; s=arc-20260327;
        b=NXT8IlyR4e/Hyl8HyL9cDiTQ++/BGnianXiC+hkOwVS6QSbqUT/1M1yp/1VjoKguzm
         4iOzd0IioxQs6beQqUmnOjTt4+JF+v8ha703kgLT8L60sUD620/yKDXLSNucUg3q05y5
         PSjubT+2sif+wOO4lCRqEOGDYlNQslhxoYi0tur4SOyRtbS6nSHYB+eIb9lXBMb5eu/Q
         vtz/x5G7k+Voe/Pipj4k4qiss/QdQ9Y/Hj+uPGugLIwZRsHBTlI7ZhZ8AfVGEQnuADo/
         +KfozNrBCXG3UTn+Zwxfc/pEn8ecLw6DL7Wwc7o9tfy659vvn4RraQczzpUQFUB6IBps
         CIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        fh=8PE/JYQggIya2quUePU8JYZfgi+HT5Y7zLUaSzib1xU=;
        b=PEFcfLcrUyoArxh6eQr1xTctJpuCHFLrHciKiUlg3+Vd1yEzIVr1h7nujcff3/IV8J
         wYlWbyCwWDyHIwk1rtG0bGGiNQRMJ3gJD9tIGVfCRPHZ/EQDLrQB8znbPMuhZYnn+6zF
         xiSzeF6CD2cqBW13fMfepWpNl9HZKCxog2aYPf4BVmGBNLuC7s2wse/KH25pkMs7gcD0
         DCJeZRQth3uOk52SyLg4NbOYM6Xwh9myBZbYGsL+Ej8gTp8OWWcg5AHs/HZjA/xBcOnS
         CtHQJF1a04FaKMiDTcqm67KHAVs168XNi69PW3/PZFcxirqImcbJ8O1nSHMsSAs5A/y3
         uOmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814693; x=1792419493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=My1OId9Afu44hbY9lwaqcKNK3hVPzp8rPSGYolT6JXNPvKYoq4DQfBxJm5eeoJXLPE
         LnEVGTrZuX+RqYI1veoEBDoEaHJ0XGtbCfJOw1YNRELMGZDHnFsmI08VMwcpW8q0F+AD
         v5ZfpZVhTLtHNjxeG3QnsaMv1jj4zddz1L4yMn0P2j8BpqLraO8mASnlHu8kXrlT4G0c
         MLRzDVtTDHSq9ocOFjs9CL4dC5zfsgE9m84pKgazql+TJ1BP5kNcPCNMod6lrfmLJDoC
         aKqrtBEw69cKrJ/QfHKwQnTNVLNkRGOqTs66ioJZ3oD84yrKdYtggQ11+otgINcck2Wl
         kEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814693; x=1792419493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=RRof/X3R3BqZYP2FYITh1x1ldyxKUtNbyy8RbLUAMwJEvC+Zlc6iD9bP3U0iBO3awx
         8VXpKckWocZK8B+QGv35daMMKIpc4kUjmkAt8/hzjr3JqaX3pHZhc4OHobziNeEik/U3
         g1tEn6i7JrA4IiNqvHYonRh//VcnwRWc51iex31ayjjjmFCSXbDG7iTNpJ1mj4E9rSps
         95rpGGzaoNKf5ylALrhNTOHzlK/zZgfXKaWD1q8hoWoFwQNlNWdSyuXVWshH04cslXo7
         kyyRtjZK0T9p1sOnx4iLymqwM0M6zbh9OS6GDfqg7gmVmG0uNDJFOMHJoUmkFLZZe1Ie
         LUow==
X-Forwarded-Encrypted: i=1; AKwUvBwffDKxxm8eYMQa5Sa+ry5zytC04UG0iM1j1Te9T4DknDRU4DUuj3a+WOB/2qtXrbQu+ovTBtjiky8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMrT9Fh0R9Dl1HdEqsm1Nnm7ESa9GxzrNBCINX9feMYuKqj1NR
	SDS8pwbSdvi0BgBFtI8RI5E0BgjxZUhW6r6KLRIAU4Vx+BW/qlxUFuKWI0I+6UPqYIKcMBMFNA5
	ahMuXzvnh/6NnOv0inU4tYb553Vo7BsU=
X-Gm-Gg: AYBFou1/xe66NG8iKKWCqbDHyldQ9Fm65P4yUH7Ik1uPxuCAcrRU5uz8aFTe0S5e+LW
	y91GcUF4mY+JbLMmUDAXR03jj88Nl0XRAiPqtxGCZx2U5YShigxgxJCGS2Uo4asBBUepkCAS7vh
	7bw3KGMPzXMMgcEyTE8XNVeKEhduuvOyqxqkN/51d0ysOWTShBQJQ04+ec62APxR6FpQbkgROIb
	aQJixMrpW4YIlWbXOjmU4CDGRcS9Au2dc+yfcpdksp2O4X8guEOuPZG+aSvEGq5tmpkN8B9jDXh
	VGl8v7LzcMJboXJHi4xPPfV37EUsyK2zrjYMiO/5aOMkgUaYIPDq+S51n5fr+cllWWyxyLx3BXH
	MXnh12gihcfX9HLCqcgMLUH2nU7pLGkIpsp7Y9SNWXsaAfb8w4qZa87apxHd1E92SUmLxWiWGC7
	oOEvHOAvzvH+wbQdeCsgTMFq97vddR3ELnXYXCsfquxQ9IDpP7EUCN5jQrRYU1bQ==
X-Received: by 2002:a05:7301:428b:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3587ee40938mr13997955eec.0.1791814693087; Mon, 12 Oct 2026
 07:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 16:17:59 +0200
X-Gm-Features: AclHuK-Ywlbcl-S8KQPaD-1cIH6SBhIHUu2wWCV_8Z4IN4dYEXXQbTyoeFpEilQ
Message-ID: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> +Rust code is instrumented as well on architectures whose Rust target sup=
ports
> +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).

Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
places, although it is convenient to know in the docs (but risks
getting out of date, of course).

> +  Note that ``rustc`` rejects linking crates built with and without KCSA=
N
> +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o=
``
> +  cannot currently be used for Rust code.

Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
the patch (and in fact I don't know if we would like to actually
support it even if it works), but perhaps in the future we can relax
it using that.

(If it doesn't work for some reason, and we want it, then we can ask
upstream for an "escape hatch" as we usually do, since things like
this should normally have one...)

> +# The minimum supported rustc's LLVM supports all of these options.

Just to double-check: does this refer to the LLVM version of the
upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
support in that minimum `rustc` version (LLVM 18 major)?

I think all the options exist for a long time, so it doesn't matter,
but just to confirm...

In any case, this sounds all reasonable:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
