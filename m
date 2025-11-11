Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7CE28314E
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 05:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762840736; cv=none; b=QcWQOZ61bkoc9431POLGR8HDAKFRnLM02a/wpvpIksJBxY4b+UjcnQMeEVMFgz6dRp12oTopRuo2845Jc4pOTRSvt6Ch+P9IPxfLy5diPFMhxDYR3rFkqnyeWtVff4IVcXkVcMPYxR3Fu7pOgTl02Cz/OXx4Gd6PaLJZ5iz2tEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762840736; c=relaxed/simple;
	bh=5jnWpbWQQnlXG7OiNGwnG/0W4ah2GK8HKHu0tCa/bkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKQrce+j1Ah0aVqraglVVJRRFIfm/uBN/PwU4AJXwvZjxCWcFnpvDyQGsPs8phkIo53b/XnvLVNev9m70a3p/mvQftMNQzKlG2YhJ5sYQEpwhwOhQVkveMIoDWJoj+ph1G69IyZAYDySPOZS4bISj42PYMu501g7bSuy/8h3Dxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=NTwpU7ca; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NTwpU7ca"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b729a941e35so492551966b.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 21:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762840733; x=1763445533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IN4rRfnCOfr9RMuoqowEQ8Wlb2hMDvz+fZbNk629L0=;
        b=NTwpU7caFzTxV9/6mUzeIWzwYy/pWb95SU+Dlm5IV4ssAS8ujCiQJDdGxgNUToGiFU
         YncSlEqYuXMykge6DwDCBWECi5kRDK+ziOZ0eKxaDLtYiSnhh7uctztVcGUb6jtQy81I
         Zu8kBQfBMIXmEpRYunsKpabxo1v2O8LTdZChNCvGrAyIf/5nQnOM1o1UXqRmVaLwniii
         u9V03l1YvftbiUi1uZ01vTPOjmhzG4wcrmdT8yq0gfnzQ7lAwTIl9GhxzOR7VNdEMgzf
         s6f1j8g3x5DHhzRcM15T2QDI3l50uyZxpSQoikFSBUj7Z/56qy99xWRiTeBb2HNe2pJc
         Rpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762840733; x=1763445533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4IN4rRfnCOfr9RMuoqowEQ8Wlb2hMDvz+fZbNk629L0=;
        b=pKOqs7/t34EOS5ise8J7XZjMY6InZXGYpbJ16XYY0NpdiWQeGexrdVprYVJors/QKH
         OvdAmOeDl2G7zYUlLmez/rB+eMVXpfGfaAJpYsdyTLcVpnHbKLKztSa4U1scLrS+zi3A
         SEzF1L/9mA4FHPu5MCsU3LDrNV9txAHKVTQfbb9+VV9/ZXN87gOl3McKBZWe19C1gDVk
         8Nu4YPcJr348Bo1QUmY9Zlfh/2hwrxLkePzhia0gIJJNCLf0ZJZqMa0OVNAK9gYwyJL6
         HWiSSGmwg7EyhI7K+RAOOJxI70PyRHC7d+hLRy16dn+YLdlr1G/nHWiud48DRgWTt4vw
         jH5A==
X-Forwarded-Encrypted: i=1; AJvYcCWRrK2E70+HS3hkEvpnZqa5NejGeExarzEhzVYvJ2Ft9ET655NiCMhqycvP+vlxRRKs3FvwfQM5S7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRMBX1FfKcCqQISF4v0O+TOlf6lbXdRon5SZx+15Bx9KaLtqxm
	MEv0HvsBi1gnOK2fbgswGF7w9khbdJ4LzJjZgkJ9GcVsKEaq0SUk55nPB35fjeH72WtId6HDeTz
	OUWZE5RtglGWdJvwas+AgN0wAo2jq81k0mKovFplgKQ==
X-Gm-Gg: ASbGncsN9q+3UYXFoeK1bW3Ff3EVaXY8UjeeP8m7lM1Vmw11MG7PE/V9h789AfVKLK0
	SAro9+Rmcj2HOfMGfsioJ1FfHUzvunjigNSxo0b45lnha2MmYeWqllOvSrJFOcbUbYer1ur1jHE
	s8l4GMqWvSm9FLIO8RhrQEsKfTBYNUQic83Le+KGZbVCjt2jjeiHRzWXpI4IgYDn7vgO/yuxsnA
	DrRtp9I0M+DcjnQZcz9MMFpI5N+x8ilHg1vgh4I9fxRslb8RnPUBpD+Q2gOw7qGkCGD9QxSnw==
X-Google-Smtp-Source: AGHT+IHHZP/aE/tVJZyLz+gOc0YU9Sc0i9PZJYzJ42dLOfI9Sr7WDBO2F0DsSawtvDJdjI2jksVRQSbzge+KnP9adhY=
X-Received: by 2002:a17:907:1c21:b0:b70:a9fd:1170 with SMTP id
 a640c23a62f3a-b72e05725a4mr966508366b.65.1762840728609; Mon, 10 Nov 2025
 21:58:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com> <20251023-v5_user_cfi_series-v22-25-1935270f7636@rivosinc.com>
In-Reply-To: <20251023-v5_user_cfi_series-v22-25-1935270f7636@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 11 Nov 2025 13:58:37 +0800
X-Gm-Features: AWmQ_bmwbidNFRD3Ln7UsJWJk61pCiG6pfhUPXDjXSV4C1IEKiwyDYyiO7oQK-g
Message-ID: <CANXhq0oEpCow0G+KsJ6ZPuwsxmAFVqoKGEzygiwSmxFsmntiWg@mail.gmail.com>
Subject: Re: [PATCH v22 25/28] riscv: create a config for shadow stack and
 landing pad instr support
To: debug@rivosinc.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 12:51=E2=80=AFAM Deepak Gupta via B4 Relay
<devnull+debug.rivosinc.com@kernel.org> wrote:
>
> From: Deepak Gupta <debug@rivosinc.com>
>
> This patch creates a config for shadow stack support and landing pad inst=
r
> support. Shadow stack support and landing instr support can be enabled by
> selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wire=
s
> up path to enumerate CPU support and if cpu support exists, kernel will
> support cpu assisted user mode cfi.
>
> If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
> `ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.
>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/Kconfig                  | 22 ++++++++++++++++++++++
>  arch/riscv/configs/hardening.config |  4 ++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0c6038dc5dfd..4f9f9358e6e3 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1146,6 +1146,28 @@ config RANDOMIZE_BASE
>
>            If unsure, say N.
>
> +config RISCV_USER_CFI
> +       def_bool y
> +       bool "riscv userspace control flow integrity"
> +       depends on 64BIT && $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zic=
fiss) && \
> +                           $(cc-option,-fcf-protection=3Dfull)

Hi Deepak,
I noticed that you added a $(cc-option,-fcf-protection=3Dfull) check in
this version. I think this check will fail by a cc1 warning when using
a newer toolchain, because -fcf-protection cannot be used alone, it
must be specified together with the appropriate -march option.
For example:
  1. -fcf-protection=3Dbranch requires -march=3D..._zicfilp
  2. -fcf-protection=3Dreturn requires -march=3D..._zicfiss
  3. -fcf-protection=3Dfull requires -march=3D..._zicfilp_zicfiss


> +       depends on RISCV_ALTERNATIVE
> +       select RISCV_SBI
> +       select ARCH_HAS_USER_SHADOW_STACK
> +       select ARCH_USES_HIGH_VMA_FLAGS
> +       select DYNAMIC_SIGFRAME
> +       help
> +         Provides CPU assisted control flow integrity to userspace tasks=
.
> +         Control flow integrity is provided by implementing shadow stack=
 for
> +         backward edge and indirect branch tracking for forward edge in =
program.
> +         Shadow stack protection is a hardware feature that detects func=
tion
> +         return address corruption. This helps mitigate ROP attacks.
> +         Indirect branch tracking enforces that all indirect branches mu=
st land
> +         on a landing pad instruction else CPU will fault. This mitigate=
s against
> +         JOP / COP attacks. Applications must be enabled to use it, and =
old user-
> +         space does not get protection "for free".
> +         default y.
> +
>  endmenu # "Kernel features"
>
>  menu "Boot options"
> diff --git a/arch/riscv/configs/hardening.config b/arch/riscv/configs/har=
dening.config
> new file mode 100644
> index 000000000000..089f4cee82f4
> --- /dev/null
> +++ b/arch/riscv/configs/hardening.config
> @@ -0,0 +1,4 @@
> +# RISCV specific kernel hardening options
> +
> +# Enable control flow integrity support for usermode.
> +CONFIG_RISCV_USER_CFI=3Dy
>
> --
> 2.43.0
>
>
