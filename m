Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794936076;
	b=fsW5477KIUawVLcLYmeTl592ye4lVX0i1jW+IhwRi1l4LXq7+w5kHIQCSL3Zhb3+86U9
	 K/9kNZ0pyKZ1hO1IXu+JcwBphSKeEXu+2sKEx+Wr7aG3+ZfqynUIcPvsbPMw5ZZsK+XPd
	 CpIuz+8luSiAu/63k1WDkAjysrHYR3Ke3xv4MQKvtXARtyeLDXJZOOFmTNV11KslG8A4V
	 +kjGUzrDEmcXNv1QoyaL7Zhx5hK2biJJCXC4KbWM1ru9+cx0QZUvoncxCEaLKUNMEn1xM
	 AnqOfrYcLF1Fd83ZqZ1x1RBHBvKnmU48HQyCQN5jvnZFlDlm5uF0rndqA22C1gKAJKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936076;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=kmCeC7XHDAikDGvT/3UFqVS8NhDjc6l1BgCxf4Am4wY=;
	b=qXcGVxgkmaiw/NOcwXHewimRSktCS9PaYB0SAlnDWjqFZrdmWLGfRDjyZ5/5UHy5p9zV
	 f3l9Hh1DZRWm1EsUOP3Q/UJmpGxIgu1QVOD6xZ5K1OXm8N7CN4vmbICot8fD5S5cgmEiJ
	 1U9TIsNBmMRWw0qRfkHDoaOMBnRFPG7QaIYqukKKTvv4eouja4DU6pl4tLURUyd1V0FGg
	 duVsRgD75ON5g/9ze2DnvzFV6PXVpWX5wfZo2YuNFXbcBwmYOscblfUmyVl93yCVsly2h
	 XT8y2w67h3NPb/bAQTuQhV9zWll0qSy4Uvmo3IbK/9MsCD5EPmMghQiR3B5uKmSrVPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="A+oeet/z";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=efWLxDM7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12378606A893
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 17:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12378606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+oeet/z;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=efWLxDM7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794936075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmCeC7XHDAikDGvT/3UFqVS8NhDjc6l1BgCxf4Am4wY=;
	b=A+oeet/zDcqWHG+MzhkRD2LVEifwXMbmEroqBBcyJ7ntkLlhA5XzBfi+uTIU/c3DcP7YNa
	1lNMJ57LA1vXVPJrO6W2dwfKp8sRZuL13absjRFXfD9NFxPNDbVhJWULeDlmB1CAZ2Obpd
	3hUPSm8U5mKj1pnwt9BoQL3jwFmffyM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-JSpinRXKNEK231iH2-pKXQ-1; Tue, 17 Nov 2026 12:21:12 -0500
X-MC-Unique: JSpinRXKNEK231iH2-pKXQ-1
X-Mimecast-MFC-AGG-ID: JSpinRXKNEK231iH2-pKXQ_1794936071
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so526235e9.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 09:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936071; cv=none;
        d=google.com; s=arc-20260327;
        b=I5iFEQvmNnbOst3yMUJsoo/OvOgibqKdVvra6yr6Cr8axwm+ZpD4FCx6NvpnaNw35h
         EGvZHwqMKhDPUE5VYgJ5iSR7xwguWi2NMV4KbUHtcR09iPg8wBlSKLOLKKVgcsgxuSl0
         UyswitdueNcJsYDJU2wp5X+fJST6gGHmfdLnWmInsgcenW2VNvsXCraHC/p0ZwD+LgQR
         SgwGjqX2GqI+MCv4/v+rPlAue0T7RE1fWzf9iPEi4I5grzzDnvLaMv2ZH3cDBGOfqmA9
         l4EMH01jHgp6qEMcMz45QdrcF05mKTqqFjvf1xFYZ+H3gy9kRTb4WU6vzRlvJEzkn5ma
         PABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmCeC7XHDAikDGvT/3UFqVS8NhDjc6l1BgCxf4Am4wY=;
        fh=HqZ9feMDLUj9356pRkycyumBwrO6EB2k/hcm5BradQQ=;
        b=a0V8r9G39B7v0IDUxbrLaCq3K9BpQdJTWqQllJ5OYU4i/KcVIe3qKXSjwRWSsX3K3O
         iqzMtIZkF9KfxnUqsDYJ05pZ5vDQ0jAXnUHaii8pAoM+hFmOPctOYF8XiwktXt8ySJ25
         qf65ntYfHGh29iJKKNyt/GEo3zLOv2YAZr2JD4KE3v21FSEiZVs/9Pui2ie6fr9G2hwE
         Mcb7y21SymYqptfF3icP6YSl/usEuv4S/OhQWKF08ExU4eaPkGNW+/WCKtrM92wfZqYd
         sVB2I/pZF4QUaioc+kifOpqBIv+PMkGeo0gVOmtws5s38IKL8sAjvCLcMJjs/KKtpNLN
         hJmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794936071; x=1795540871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmCeC7XHDAikDGvT/3UFqVS8NhDjc6l1BgCxf4Am4wY=;
        b=efWLxDM7bnDp9fbvpsYfZ5UV1fwQUZt6VNR7pVTqCfCJUtzg01N1qO/NBH9DEuHeya
         OimlY8mGuzGwscZXv+4pFclRp+owm2WYM/5Nv+lxo23Vq0K1RZrNwOtcvoY/x90W+iOW
         8IBRs4DB4R2GxYI53UYavf3C3339n3YZPskBn8bh5ayK49CLKom8eLCo7lC0umEVqDi9
         /Lc8/VRlMsuJwqZ+OlM+Fk7SLdZEYg2/2F6A2KgVdecjchEQfzB5rb1NOqhDp2Id2Gk/
         vszWz1KiNrkXFw46HbxhVuEsGojoupI0+wK173dV7djhqfxxHQ/H9jWWnBiRfyi0lT1x
         Z2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936071; x=1795540871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmCeC7XHDAikDGvT/3UFqVS8NhDjc6l1BgCxf4Am4wY=;
        b=vO5VMPYjeHboFwsmDdI63QWOoiuB49Ml4mqScwYojzB+TjJAckgBNPtt1k24jx3IGV
         xyjO59opqR5oYcVzoUSxplD8wolyfDPa5BdVhiqm5btlWcGIJyIJArNCcCKkxNMt3o0q
         0mbVRwvNE7MvzrPHhhcz5xq8gUxOTR7/S9aIszhUJjDq4cFvVZxt03D/PLoBlZlqBoXc
         9p+827GYNc5qtpHNVhmNzCbQ3x8c6TWmFG0aIlZjL2oJuJZIyDotSWIKct8dH8qgpzKg
         jLBQz5X4awK/REqwekqbrVh31Zxbxuzjc/HuH/+AE8OpWITYzBoE2wMg+28TnxOrJXt8
         NjNw==
X-Forwarded-Encrypted: i=1; AL+hErGW4NlXmlrVN3E+nnQFvjv0v/FB2bczHQfDqjxAO9qLu+EkH0dkiDG9otLPQHu9jndldyBN9iP/Jlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MBPCqQr8K/ytQHbf1vsFMmDoUPti6v5UDl46bZoi3fFkvbaNB
	P1/oEWkph61sGg4PJ5Ix0LR/z99JuDQjrGqhBAqJGgMEYnMJ6TM0FAq3gQO6sXd5+WsSWZCJqmY
	iF4M2qmnvckMIlbTm1ytRqdM3Si8gNEGQqGScTss3gTdBkKOdjjOKhIDcyKp/YzqSe0GQ86CEe0
	TtwwXY3HHupgRKl4vwrMMKnhmJA//gjSgtj023
X-Gm-Gg: AYBFou1L/JDpAJMZsCI+XCyUoxbnHi0RRS4AKXsIL15762thI65sXzHaTi9GbUHvx6l
	eMERSg+C7F/ZqzPZviWmsjzAcePA8UU/rCxTTQls+qHW1JMts+alOSiuj6K+E2IU0sMtbgklw4T
	Fl5oTdbD86qkos7IOJiWVwgWMmMdCwAUMUy1zvtM82cvfsYbc9rSRSob5plRdcPBis5nEe4uJ+6
	hZGdpzaABODdy/V9g==
X-Received: by 2002:a05:600c:154a:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb73d5b0admr129915145e9.22.1794936070579;
        Tue, 17 Nov 2026 09:21:10 -0800 (PST)
X-Received: by 2002:a05:600c:154a:b0:4bb:73d5:ab33 with SMTP id
 5b1f17b1804b1-4bb73d5b0admr129914425e9.22.1794936069801; Tue, 17 Nov 2026
 09:21:09 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com> <20261110-lrsc-only-v6-6-bafc3cc0fcae@mobileye.com>
In-Reply-To: <20261110-lrsc-only-v6-6-bafc3cc0fcae@mobileye.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Tue, 17 Nov 2026 12:20:53 -0500
X-Gm-Features: Aa3M54pi-PyuaI0qcy3-1kxlUe21cprxSC2I9K71Q5fUU6_tsEje6k0btSwDw9o
Message-ID: <CADRr4bc0=OATpX0XvADZLGme=J954ydRxfv=cD1PZcmvA+HNwA@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] riscv: hwprobe: report whether AMO is faster than LR/SC
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Chao-ying Fu <chao-ying.fu@globalfoundries.com>, 
	Conor Dooley <conor.dooley@microchip.com>, torvalds@linux-foundation.org, olof@lixom.net, 
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
	Boqun Feng <boqun@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Charlie Jenkins <thecharlesjenkins@gmail.com>, Nam Cao <namcao@linutronix.de>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:40=E2=80=AFAM Vladimir Kondratiev
<vladimir.kondratiev@mobileye.com> wrote:
>
> On a CPU that traps AMO instructions into firmware and emulates them
> there, such as MIPS P8700, an uncontended AMO costs about 600 cycles
> where the equivalent LR/SC sequence costs about 40. Userspace built for
> the A extension uses AMO for every atomic and pays that on every one.
> It cannot tell from the ISA string: such a CPU still has Zaamo, and
> correctly so.
>
> Give userspace the same kind of hint the kernel gives for misaligned
> access. At boot, time AMO_SPEED_ITERS amoadd.w against the same number
> of lr.w/addi/sc.w loops on each CPU, take the best sample from an 8 ms
> window of each, and report the result through a new hwprobe key,
> RISCV_HWPROBE_KEY_AMO_PERF:
>
>   RISCV_HWPROBE_AMO_FAST         AMO is at least as fast as LR/SC
>   RISCV_HWPROBE_AMO_SLOW         LR/SC is faster; use it where possible
>   RISCV_HWPROBE_AMO_UNSUPPORTED  the CPU has no Zaamo
>   RISCV_HWPROBE_AMO_UNKNOWN      not measured, or differs across CPUs
>
> Only the direction of the difference is reported, not its size: the
> question a program can act on is which sequence to pick. Each CPU logs
> its ratio, and a kernel whose own atomics are AMO warns once when the
> CPU turns out to be slow, pointing at RISCV_ISA_ZAAMO.
>
> The amoadd.w is spelled with .insn through a new AMOADD_W() in
> insn-def.h, so the file assembles when -march has no Zaamo, and the
> probe is skipped on a CPU whose ISA lacks the extension. CPUs that come
> online later are measured by a hotplug callback. amo_speed=3D{slow|fast}
> on the command line skips the measurement, as unaligned_scalar_speed=3D
> does. The probe runs at the same initcall level as the misaligned
> access probe, for the same reasons.
>
> Tested on the eyeq7h hardware, with the DT advertising "a":
>
>   [    0.163714] cpu10: AMO speed is 0.07x LR/SC speed (slow)
>   [    0.163727] cpu11: AMO speed is 0.07x LR/SC speed (slow)
>   [    0.163724] cpu6: AMO speed is 0.07x LR/SC speed (slow)
>
> and, with CONFIG_RISCV_ISA_ZAAMO set:
>
>   [    0.163729] AMO is slow but kernel atomics use it, consider disablin=
g RISCV_ISA_ZAAMO
>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Reviewed-by: Jesse Taube <jtaubepe@redhat.com>

I really like this patch.
Aven if the rest of the set isn't ready yet I think this should be applied.

Thanks,
Jesse Taube

> ---
>  Documentation/admin-guide/kernel-parameters.txt |   7 +
>  Documentation/arch/riscv/hwprobe.rst            |  18 +++
>  arch/riscv/Kconfig                              |  13 ++
>  arch/riscv/include/asm/cpufeature.h             |   4 +
>  arch/riscv/include/asm/hwprobe.h                |   2 +-
>  arch/riscv/include/asm/insn-def.h               |   5 +
>  arch/riscv/include/uapi/asm/hwprobe.h           |   5 +
>  arch/riscv/kernel/Makefile                      |   1 +
>  arch/riscv/kernel/amo_speed.c                   | 183 ++++++++++++++++++=
++++++
>  arch/riscv/kernel/sys_hwprobe.c                 |  37 +++++
>  10 files changed, 274 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index e75344f4e0cd..9bc5baff20ff 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -513,6 +513,13 @@ Kernel parameters
>                         Format: <a>,<b>
>                         See also Documentation/input/joydev/joystick.rst
>
> +       amo_speed=3D      [RISCV]
> +                       Format: {slow | fast}
> +                       Allow skipping the AMO instruction speed test. Th=
is is
> +                       useful for testing alternative code paths and to =
skip
> +                       the test in environments where it runs too slowly=
. All
> +                       CPUs must have the same AMO speed.
> +
>         analog.map=3D     [HW,JOY] Analog joystick and gamepad support
>                         Specifies type or capabilities of an analog joyst=
ick
>                         connected to one of 16 gameports
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index bb1e0cbab36f..51ecb836f491 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -423,3 +423,21 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is support=
ed,
>      as defined in the RISC-V Profiles specification starting from commit
>      b1d80660 ("Updated to ratified state.")
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_AMO_PERF`: An enum value describing the
> +  performance of the AMO instructions of the Zaamo extension, relative t=
o
> +  the equivalent LR/SC sequence, on the selected set of processors.
> +
> +  * :c:macro:`RISCV_HWPROBE_AMO_UNKNOWN`: The performance of AMO instruc=
tions
> +    is unknown.
> +
> +  * :c:macro:`RISCV_HWPROBE_AMO_SLOW`: An uncontended AMO instruction ta=
kes
> +    longer than the equivalent LR/SC sequence. This is the case when AMO
> +    instructions are trapped and emulated by firmware. Code that can cho=
ose
> +    should use LR/SC.
> +
> +  * :c:macro:`RISCV_HWPROBE_AMO_FAST`: An uncontended AMO instruction is=
 at
> +    least as fast as the equivalent LR/SC sequence.
> +
> +  * :c:macro:`RISCV_HWPROBE_AMO_UNSUPPORTED`: AMO instructions are not
> +    supported, the Zaamo extension is absent.
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 3c3679701a60..dfd6237f879b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -764,6 +764,19 @@ config RISCV_ISA_ZAAMO
>
>           If you don't know what to do here, say Y.
>
> +config RISCV_PROBE_AMO_SPEED
> +       bool "Probe AMO instruction speed at boot"
> +       default y
> +       help
> +         During boot, time an uncontended AMO instruction against the
> +         equivalent LR/SC sequence on every CPU, and report which one is
> +         faster to userspace through the hwprobe syscall, as
> +         RISCV_HWPROBE_KEY_AMO_PERF. On a CPU that traps AMO instruction=
s
> +         into firmware and emulates them there, LR/SC is much faster, an=
d
> +         code that can choose should use it.
> +
> +         If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZBB
>         bool
>         default y
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 5efa72823475..92cab4a7a0f1 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -83,6 +83,10 @@ static inline bool unaligned_ctl_available(void)
>  }
>  #endif
>
> +#ifdef CONFIG_RISCV_PROBE_AMO_SPEED
> +DECLARE_PER_CPU(long, amo_speed);
> +#endif
> +
>  #if defined(CONFIG_RISCV_MISALIGNED)
>  DECLARE_PER_CPU(long, misaligned_access_speed);
>  bool misaligned_traps_can_delegate(void);
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 9b04377c0f98..b700852ac42f 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>
>  #include <uapi/asm/hwprobe.h>
>
> -#define RISCV_HWPROBE_MAX_KEY          16
> +#define RISCV_HWPROBE_MAX_KEY          17
>
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/i=
nsn-def.h
> index 8fcc848c196e..5ca5c0b8ad66 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -219,6 +219,11 @@ ALTERNATIVE("nop", "fence rw, rw", SIFIVE_VENDOR_ID,=
                       \
>         __ASM_STR(.error "hlv.d requires 64-bit support")
>  #endif
>
> +/* Spelled out so that it assembles when -march lacks Zaamo */
> +#define AMOADD_W(dest, addr, val)                              \
> +       INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(0),                  \
> +              RD(dest), RS1(addr), RS2(val))
> +
>  #define LB_AQ(dest, addr)                                      \
>         INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(26),                 \
>                RD(dest), RS1(addr), __RS2(0))
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index e6a394fbe7fc..a5f726f94204 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -122,6 +122,11 @@ struct riscv_hwprobe {
>  #define                RISCV_HWPROBE_EXT_ZICCIF        _BITULL(3)
>  #define                RISCV_HWPROBE_EXT_ZICCRSE       _BITULL(4)
>  #define                RISCV_HWPROBE_EXT_ZA64RS        _BITULL(5)
> +#define RISCV_HWPROBE_KEY_AMO_PERF     17
> +#define                RISCV_HWPROBE_AMO_UNKNOWN       0
> +#define                RISCV_HWPROBE_AMO_SLOW          1
> +#define                RISCV_HWPROBE_AMO_FAST          2
> +#define                RISCV_HWPROBE_AMO_UNSUPPORTED   3
>
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index ebe1c3588177..fc935c877e82 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -79,6 +79,7 @@ obj-$(CONFIG_RISCV_MISALIGNED)        +=3D traps_misali=
gned.o
>  obj-$(CONFIG_RISCV_MISALIGNED) +=3D unaligned_access_speed.o
>  obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)             +=3D copy-unalign=
ed.o
>  obj-$(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)      +=3D vec-copy-una=
ligned.o
> +obj-$(CONFIG_RISCV_PROBE_AMO_SPEED)    +=3D amo_speed.o
>
>  obj-$(CONFIG_FPU)              +=3D fpu.o
>  obj-$(CONFIG_FPU)              +=3D kernel_mode_fpu.o
> diff --git a/arch/riscv/kernel/amo_speed.c b/arch/riscv/kernel/amo_speed.=
c
> new file mode 100644
> index 000000000000..933891b69db6
> --- /dev/null
> +++ b/arch/riscv/kernel/amo_speed.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Measure whether AMO instructions are faster than the equivalent LR/SC
> + * sequence. They are not on a CPU that traps them into firmware and
> + * emulates them there, such as MIPS P8700, where an AMO costs hundreds =
of
> + * cycles and LR/SC tens. The result goes to userspace through hwprobe,
> + * so code that can choose between the two knows which one to use.
> + */
> +
> +#include <linux/cpu.h>
> +#include <linux/smp.h>
> +#include <linux/timekeeping.h>
> +#include <asm/cpufeature.h>
> +#include <asm/hwprobe.h>
> +#include <asm/insn-def.h>
> +#include <asm/timex.h>
> +
> +/* Time window for each measurement, and atomics per sample within it */
> +#define AMO_SPEED_NS           8000000
> +#define AMO_SPEED_ITERS                1024
> +
> +DEFINE_PER_CPU(long, amo_speed) =3D RISCV_HWPROBE_AMO_UNKNOWN;
> +
> +static DEFINE_PER_CPU_ALIGNED(u32, amo_speed_word);
> +static long amo_speed_param =3D RISCV_HWPROBE_AMO_UNKNOWN;
> +
> +static void amo_speed_amo(u32 *word, unsigned long n)
> +{
> +       unsigned long tmp;
> +
> +       asm volatile(
> +               "1:\n"
> +               AMOADD_W(%[tmp], %[word], %[one])
> +               "       addi %[n], %[n], -1\n"
> +               "       bnez %[n], 1b\n"
> +               : [tmp] "=3D&r" (tmp), [n] "+&r" (n), "+m" (*word)
> +               : [word] "r" (word), [one] "r" (1UL)
> +               : "memory");
> +}
> +
> +static void amo_speed_lrsc(u32 *word, unsigned long n)
> +{
> +       unsigned long tmp;
> +
> +       asm volatile(
> +               "1:     lr.w %[tmp], (%[word])\n"
> +               "       addi %[tmp], %[tmp], 1\n"
> +               "       sc.w %[tmp], %[tmp], (%[word])\n"
> +               "       bnez %[tmp], 1b\n"
> +               "       addi %[n], %[n], -1\n"
> +               "       bnez %[n], 1b\n"
> +               : [tmp] "=3D&r" (tmp), [n] "+&r" (n), "+m" (*word)
> +               : [word] "r" (word)
> +               : "memory");
> +}
> +
> +/*
> + * For a fixed amount of time, repeatedly run func and take the best tim=
e
> + * in cycles as the measurement.
> + */
> +static u64 amo_speed_measure(void (*func)(u32 *word, unsigned long n),
> +                            u32 *word)
> +{
> +       u64 start_cycles, end_cycles, cycles =3D -1ULL;
> +       u64 start_ns;
> +
> +       /* Do a warmup. */
> +       func(word, AMO_SPEED_ITERS);
> +
> +       preempt_disable();
> +
> +       start_ns =3D ktime_get_mono_fast_ns();
> +       while (ktime_get_mono_fast_ns() < start_ns + AMO_SPEED_NS) {
> +               start_cycles =3D get_cycles64();
> +               /* Ensure the CSR read can't reorder WRT to the atomics. =
*/
> +               mb();
> +               func(word, AMO_SPEED_ITERS);
> +               /* Ensure the atomics end before the end time is snapped.=
 */
> +               mb();
> +               end_cycles =3D get_cycles64();
> +               if ((end_cycles - start_cycles) < cycles)
> +                       cycles =3D end_cycles - start_cycles;
> +       }
> +
> +       preempt_enable();
> +
> +       return cycles;
> +}
> +
> +static void check_amo_speed(void *unused)
> +{
> +       int cpu =3D smp_processor_id();
> +       u32 *word =3D this_cpu_ptr(&amo_speed_word);
> +       u64 amo_cycles, lrsc_cycles;
> +       long speed;
> +       int ratio;
> +
> +       if (per_cpu(amo_speed, cpu) !=3D RISCV_HWPROBE_AMO_UNKNOWN)
> +               return;
> +
> +       if (!riscv_cpu_has_extension_unlikely(cpu, RISCV_ISA_EXT_ZAAMO)) =
{
> +               per_cpu(amo_speed, cpu) =3D RISCV_HWPROBE_AMO_UNSUPPORTED=
;
> +               return;
> +       }
> +
> +       amo_cycles =3D amo_speed_measure(amo_speed_amo, word);
> +       lrsc_cycles =3D amo_speed_measure(amo_speed_lrsc, word);
> +
> +       /* Don't divide by zero. */
> +       if (!amo_cycles || !lrsc_cycles) {
> +               pr_warn("cpu%d: rdtime lacks granularity needed to measur=
e AMO speed\n",
> +                       cpu);
> +               return;
> +       }
> +
> +       if (amo_cycles <=3D lrsc_cycles)
> +               speed =3D RISCV_HWPROBE_AMO_FAST;
> +       else
> +               speed =3D RISCV_HWPROBE_AMO_SLOW;
> +
> +       ratio =3D div64_u64(lrsc_cycles * 100, amo_cycles);
> +       pr_info("cpu%d: AMO speed is %d.%02dx LR/SC speed (%s)\n",
> +               cpu, ratio / 100, ratio % 100,
> +               speed =3D=3D RISCV_HWPROBE_AMO_FAST ? "fast" : "slow");
> +
> +       per_cpu(amo_speed, cpu) =3D speed;
> +
> +       if (speed =3D=3D RISCV_HWPROBE_AMO_SLOW && IS_ENABLED(CONFIG_RISC=
V_ISA_ZAAMO))
> +               pr_warn_once("AMO is slow but kernel atomics use it, cons=
ider disabling RISCV_ISA_ZAAMO\n");
> +}
> +
> +static int amo_speed_online_cpu(unsigned int cpu)
> +{
> +       if (per_cpu(amo_speed, cpu) !=3D RISCV_HWPROBE_AMO_UNKNOWN)
> +               return 0;
> +
> +       if (amo_speed_param !=3D RISCV_HWPROBE_AMO_UNKNOWN)
> +               per_cpu(amo_speed, cpu) =3D amo_speed_param;
> +       else
> +               check_amo_speed(NULL);
> +
> +       return 0;
> +}
> +
> +static int __init set_amo_speed_param(char *str)
> +{
> +       if (!strcmp(str, "slow"))
> +               amo_speed_param =3D RISCV_HWPROBE_AMO_SLOW;
> +       else if (!strcmp(str, "fast"))
> +               amo_speed_param =3D RISCV_HWPROBE_AMO_FAST;
> +       else
> +               return -EINVAL;
> +
> +       return 1;
> +}
> +__setup("amo_speed=3D", set_amo_speed_param);
> +
> +static int __init check_amo_speed_all_cpus(void)
> +{
> +       int cpu;
> +
> +       if (amo_speed_param !=3D RISCV_HWPROBE_AMO_UNKNOWN) {
> +               pr_info("AMO speed set to '%s' (%lu) by command line\n",
> +                       amo_speed_param =3D=3D RISCV_HWPROBE_AMO_FAST ? "=
fast" : "slow",
> +                       amo_speed_param);
> +               for_each_online_cpu(cpu)
> +                       per_cpu(amo_speed, cpu) =3D amo_speed_param;
> +       } else {
> +               on_each_cpu(check_amo_speed, NULL, 1);
> +       }
> +
> +       cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:amo_speed",
> +                                 amo_speed_online_cpu, NULL);
> +
> +       return 0;
> +}
> +
> +/*
> + * Same level as the unaligned access probe: after clocksource_done_boot=
ing()
> + * so that amo_speed_measure() uses a stable clocksource, but before
> + * rootfs_initcall() enables usermode helpers that can reach hwprobe.
> + */
> +fs_initcall_sync(check_amo_speed_all_cpus);
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 7818e1d32622..47836ecbd9af 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -257,6 +257,39 @@ static u64 hwprobe_misaligned(const struct cpumask *=
cpus)
>  }
>  #endif
>
> +#ifdef CONFIG_RISCV_PROBE_AMO_SPEED
> +static u64 hwprobe_amo(const struct cpumask *cpus)
> +{
> +       int cpu;
> +       u64 perf =3D -1ULL;
> +
> +       for_each_cpu(cpu, cpus) {
> +               int this_perf =3D per_cpu(amo_speed, cpu);
> +
> +               if (perf =3D=3D -1ULL)
> +                       perf =3D this_perf;
> +
> +               if (perf !=3D this_perf) {
> +                       perf =3D RISCV_HWPROBE_AMO_UNKNOWN;
> +                       break;
> +               }
> +       }
> +
> +       if (perf =3D=3D -1ULL)
> +               return RISCV_HWPROBE_AMO_UNKNOWN;
> +
> +       return perf;
> +}
> +#else
> +static u64 hwprobe_amo(const struct cpumask *cpus)
> +{
> +       if (!hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZAAMO))
> +               return RISCV_HWPROBE_AMO_UNSUPPORTED;
> +
> +       return RISCV_HWPROBE_AMO_UNKNOWN;
> +}
> +#endif
> +
>  #ifdef CONFIG_RISCV_VECTOR_MISALIGNED
>  static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
>  {
> @@ -332,6 +365,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>                 pair->value =3D hwprobe_vec_misaligned(cpus);
>                 break;
>
> +       case RISCV_HWPROBE_KEY_AMO_PERF:
> +               pair->value =3D hwprobe_amo(cpus);
> +               break;
> +
>         case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
>                 if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
>                         pair->value =3D riscv_cboz_block_size;
>
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

