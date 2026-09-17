Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69CB4F5DF0
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 17:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665733; cv=none; b=H9Vz2tFLdzymCsRZrq0TsaLAnQYS2YjNX1DV4mEKZeTIlUig8Cs3eKO6t800+ZLj64qgYOGhfqMtEwq7rdN9xpP45mosIUorg9Tptl85nmHP/1bG0ttgJcB0KU48O/byTWb1s1oRufJ7l5QkFI9GGOd/90TYd7rmh8MmOooTP4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665733; c=relaxed/simple;
	bh=biPMv+ofFeAlNkpuoiheHfcM5OSqeT3TWtGH022bAOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kD5aj408kKIQAke8csoExvIR827yaD6Y8Ww1O93lJWUJsquCKEUCuGAY/Lbhj2kQsMqpjBxjrpnIY6Rs0TDqvJ+N2M0VoFssfv8216tl59DlK2+laKlKQoQchZAzXMAkCqzDKPu3TRAHoFQs2Bb5m5vzfxdh4ydtOsegPYnZ384=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C9J6ioLJ; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C9J6ioLJ"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so1407352e87.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 10:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789665730; x=1790270530; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=C9J6ioLJllGR5tprMwouepuvip8IdSLNXQ1lSpdad8nXCjxBGCLadd87p2TeR+YITx
         GgWrhEAdkZUdoS9jOZtx8rKh0B9WJJM6Ku1Z2wh3SB+2DGgrlhZW10DgpVL9moLSWAJk
         jHG34keJ+7VHennoGMMoCpiuIZaV0Ee9qCo48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665730; x=1790270530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=PU+VKGa5GZpg3o4b9rzY0rNFLbUdtEHpEtu5iKDESLKQZbgcyjcc79TEICUzBKGz03
         bsq3sQXUEMAd1gHnOKL0Xm/BjUsd7pJ7fJ1bv56KU5jiQwX7FXrXU5tQGNxM3IUU4E8g
         Atl2TYjtfBhTmyyPI4ylTjjJSFvbBNTyoPCpPFf41wkl7Xl8kxoS2PqmM+2pq5KJDosd
         ddHJj+m6mg0oFPy3Hq3sNxpXpk2lh2h6SheiPx2pSNVVeRHXlv6ptmohaptADNiGy6Qm
         fpGEo+AQwPHMckch0OX4UwCqdJfJKM/qwrY52OCLHJLmruVlfbQxuipZ6qHZ2b7WVlWK
         h2sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeaGwUFPuXuczOarYGuHxqoU36ZrOQopkpbLeqDGP9qZprUpuTyDkPW81dFLu8Rcmc0flpgSrYxMs=@vger.kernel.org
X-Gm-Message-State: AFuF++k4NhBozyCOgKvBQYZyOz6Wtx81N8NRDj36mXBs2keJozsoyk8F
	hSdTqiFOWzYY/7uf5uiK9nG08Dyra4deeAzMm7lDNBxKMjT059D5WAnjVYs/wfCZSzTFqP6/iM7
	nw4nXV96MAA==
X-Gm-Gg: AYBFou0jtDFayOTh3jEfWF4MBUuS0+n9whD0a01FZCnIfA5B7thSBDRJ6/U1lYwoDyx
	Y76/BYzxmUwiqytTEyM4bs6xvIGcEG3q/AGed4lGcnRucvRU69pWESwzbswUVZjqR0MKZHdvwLv
	9cXOFDvx2YG0hABe3VUN3qGQGkF8srtvFq0L2od4PGljdENW6DqbORVI/+CjEwZXcpNN7JhKuyG
	sBaXnkQtPFG6Z+16Tb3Cuwha9jxPFZHViT9eWud9TRAlIEF5c+dOxaxuy7xkD+YBRnrDsVFv9uU
	J3C0hpLPBaiWJhSQFOArFc4HFjLGFyzySd3Bc2Iy+UfIlZI/jkfFwNoO8Ko5gsSchQTOjUbBsv2
	WlGzyUmgv9slQw4W7ieM2HAk5FzRAxgvbXS4K8DPIRfvu8JC61l4FCbvrDT3NUdDq6QY7Q7dj9K
	tvVN8iRpZUS/AZTxTB/cexdBWburFHFMgXmTfwBGd6jJ+o8I6ISiL5ZRw4PGfDkR11CS5ladUmN
	8zNuNy2rDmlYR+LSeLY5b9jTCc79iyGreSh+wsl1Bsn9gx9Hw==
X-Received: by 2002:a05:6512:1287:b0:5b7:637e:f025 with SMTP id 2adb3069b0e04-5b8b6648afcmr2171707e87.48.1789665729581;
        Thu, 17 Sep 2026 10:22:09 -0700 (PDT)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com. [74.125.230.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e0bdcsm2043140e87.58.2026.09.17.10.22.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:22:09 -0700 (PDT)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49c068e85so8458181fa.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 10:22:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByN4zdZN2BH/05olk7YrK0ODjStjoU9GS8lb+mc37sbus/GO/0teWwiXkLbF+zHI7I7REdiiOSAT3I=@vger.kernel.org
X-Received: by 2002:a17:907:c1f:b0:c12:e178:9e68 with SMTP id
 a640c23a62f3a-c29e5237e9amr501417166b.19.1789665344119; Thu, 17 Sep 2026
 10:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
In-Reply-To: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Sep 2026 10:15:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
X-Gm-Features: AcwNN1VkAmOFPymjE_dcKSWc6Q8Z4LvlbW-9yRGSGQmATfVxYq3jdlUQ82g4gXM
Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
>                 == defconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> M2, clang               634.5s   569.4s    -65.1s (-10%)

There's something odd going on with that M2 gcc build. Why is it such
an odd duck?

             Linus
