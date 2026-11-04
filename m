Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793754316;
	b=NHsvwGVqLq94AEj0jHaEzJUNKRD5+2g+WmmoddRL0Ot2MaARz6C8p768Fw8Jd0vSVQne
	 CgjRK+WWFt6gonHwJdRaORsjo02Po6wxSMyo+E6kt5do+JHCFM9rJd6wwl6uYmmD3xx4C
	 0z9btq9nhKtZH5bDdGfwQv4OMjECeMfDHiWs65zKdfFLkU6o8v8DZOihzOCISRUe0JCcS
	 1dVFPGmHeFTMahODfFkH83/hDHeBEy4BNgm1mb6wjecddl2/TV+wxhBhM51ff0jYCoB9D
	 g/zLQswMc230bBQqAB0jnJthHwl8udT9vtgRu5LA+BsMD4uTKEqVDwQxykUjHiZIEjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
	b=1IO+jWAjLGmxa9VnJoFGFyrBzOSYEnjpwf16jGdET4wgw6h6/nFdB84JN2P+5uTn6uBN
	 0hUyZ4ziP/Z6doQHAfVHaXKtiuMIhmX28ADsTQuzkwofpUpix2Z3LKeO7AoYNt2T6gD7A
	 ZbYHTKwEq1lNq2K5RS8xRN6p3pkYQWauei1DtYS4CiAiQE/BwFZFyK+ew7zdi3fDAeTF6
	 +UyQaYwLGrFQpb0cheISTQCpOqcOuCxQ5yigWfuo56wvJujj+EV4zvm3Po7j3ecRuOfL0
	 4UhSJJa9CuaCeKA8r0Ka9vom8e98zPWq5p+7oWiSaSFRfyEKdXkMx+4MoC3rVlJ0OiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="NmCY6l/h";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152DD606A328
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 01:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 152DD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NmCY6l/h
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso26044866b.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 17:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754314; cv=none;
        d=google.com; s=arc-20260327;
        b=GD0S5shZxZN1WSqArbPqaSAWJYXhK8GciPPbbVzST9hlW2U1tSvkwCF58uSWL6DRZF
         dTyUmqLFvFrQLQq1AX+LQfcK3WmIPA6gHxdkLzV7I/rcVYAARWqWa7PLIvViMgJWA5b+
         LX2fX2Gc/0qvQGP1BvxqHDNOrokc4pKwILBKnhOIhQRUBcofLppPLu1YQWU78oSt7wc3
         Q7CdEzamabbqcWkTnUeSissre13IbtCiuKa5ZmiP+e0qC23rmf+gRMqKyWcPLMQAR+3h
         mhESYBBxl57FRGnQQV0PvzoeoCqmk6p3c+ryEbWqkPr9y86ZW5K4KSZdu88lqQ+VwRku
         Ucyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        fh=5ut/XS8slApx44OLdmPcthAEddRglRLkK5pjxhTMFTw=;
        b=i2T4z4cQKZRztGi+QrFS7lFDz9KBODCMELFKt4WIT/jRnZ/NrK9wqJDzq7s4VTwYfK
         wQSrudaujUjrCG2BTdBuIh9bqIjT3+CkTC/n1GSFZ5Xf3DElG7xqmP3u3r8+VssSC4Nv
         oyz6KJahFnkK0D2Hiv7n7ftnNqVYgMImXNUE9rpKoXGVcylz2VXJo14nlLuIFIvyd+yt
         hp4l6Nih9sQKj3H/XSP6AXr13Fz2bKAxlRCyPvQMIFW6yDPwCTf67F5LfrfyEhCRsijz
         5quw1KrfRV44lwDO15fN5pGBiS9gO0I0NJfrhNeHwrgp1NHYeX3Tudijr5t075+6w4/6
         Z7Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754314; x=1794359114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        b=NmCY6l/hddhLIayqwx0pWhDlzky4zOFriG2Pdv4bVgKzrRIN/6DXrKq8SeIFpFSDzG
         OSms2h9cDJSkVBH5/IkifIVYnfvh+hsyQJtRrGsZdUmtb2ziewUHbbsX1RP1CEZB5HxX
         iy51pExN69DyKyexFvTHkYAxYP21gKZD8XowMLSFZiekG7RpaJCHxS4fldPWq/wG8Dtt
         kOM/cipylAMQawMEXaxMxu4+TRBFfLAxSQw9WjmITlds8lBIpEAlzKgdz84Ey9gExnv5
         /B1iiJxBuoY8in0DZjwRakIl1gpv9h2omGVHDsDWWmXteA1WCj/AkvnaACWyEIR7eDwF
         HTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754314; x=1794359114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        b=pJ8mehig+HoT5mXH5mo/Q3wg/S+QJ4S3h3Kd0JA/x9Ad9udV5Ym8rSi5Empy7k95uO
         DyDdg25EHPYc99GAPUppKzHTFyWyUGDLeLxk9tVYXLqdbmGAdsT9o2S/lP7fCpGTN9pK
         IRmyUPBy+A9lNCFUSQGnbY0Icuu/DZQxCS0YewgFUbhotuVv7ddYWe5LqtRoQ4qWtBro
         +n98oGrwfifsyVKt9HE9BOXofydz+y2pLHB2t0y+GF0/LrtlZRP6EX7CUhHuFTQzrl0A
         uh2i4OXThoJyVQxukmKNXDqUQ5kcLWP2c6AaKtCxX/1ZGacRyK/msBYffkek5ycvVyfs
         uxlg==
X-Forwarded-Encrypted: i=1; AKwUvBzBAplg/Mu1EsWvM784dT4objCmL7EWgIZWd6gemGgPgckrbZZCPFqEpt1hyUlsugrKssXbuDnnv5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MRIn/5K6h+elWFGdg6/nPphUVTSzaNCDVAUHAd3ay5FGi3Kf9
	2Bbj5iwgHo3xHkHByNlw0U/uQEUB2pgqdU/SpAy6KZiMgIclcimmU0lPs8PAH52parOz+iHtdAV
	8qpXzKeDRHUsRE0YdfAeT2AXvB7I75gU2ZlGypiAX
X-Gm-Gg: AYBFou1PIHRvBAmBpA8YMl9u6rujnBIHyNbrkZRtQw34AfVIXt0MsqXO/nSHcYgm1tk
	e3bGcI+1iibZZFLnXIHBQ+LR4umMqkISlXgzp/pOfQfxfafRGt/JZMzI8Oq0WDcrA60dCW2zSOR
	PfFCwsU7XKQMDaUFH5Ht5lvE9LzsbzuKLMEBd7Et98v5dI2w5rnSGLsPjNUa5miDZyjSeTMFE9e
	HUVvEJzvtjo+OsDfhP0KPragZNfjG4o3CXA4bo8shMM/ZbFF/pEYFSZ1GnCfxRP8Kk8B26LFxpi
	vxJyjZgSR+yINsH/M1ihjkkRqvl5Je8Veoepm4Htx0WzsSYbwZ7lDDYZ/cHSpvJ05QcTOHjqrDn
	y5wUkUhek3gFJgvCYv8bcXRO6P1HYXF3//1I8Qv5YswOqejhHe3vzlNTVNCkTYtupEc8gmbs=
X-Received: by 2002:a17:906:c145:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c4ca7a1c3ccmr1392142066b.14.1793754313888; Tue, 03 Nov 2026
 17:05:13 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
 <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
 <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com>
 <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
 <20261030153528.0d5113e7@pumpkin> <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
In-Reply-To: <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 3 Nov 2026 17:05:02 -0800
X-Gm-Features: AclHuK9b_Pt7vf67g62PZ8vH_eaq5fO461r38gdQA-3gsipu-4DIyrTVCZocpdU
Message-ID: <CAG2KctrmAVo-jC5zHURvx9-V_Wu4U8PctxEevycV+zq+6GngUA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 11:42=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Oct 30, 2026 at 8:35=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
[...]
> > Doing a system call for each symbol is probably fine and scales nicely.
>
> Yep, I agree, for BY_NAME case it should be totally adequate. And I
> agree about not needing to do full count, just whether there is more
> is good enough, good suggestion!

Makes sense, thanks both. Nearly all symbol names in /proc/kallsyms
are unique (~99% on my test VM), so I'll have v3 keep the kernel side
simple and let userspace apply its own duplicate policy via one-by-one
pagination: KALLSYMS_QUERY_BY_NAME takes pos (0 to start) and returns
next_pos across all sources (vmlinux, modules, ftrace, BPF JIT, and
kprobes). The kernel peeks ahead one match, so in the common, unique
case a single ioctl() returns the symbol with next_pos =3D=3D 0; when
next_pos !=3D 0, userspace can step through the remaining matches one
ioctl() at a time. libbpf does that and still fails the load if the
matches have different addresses.

Paired with a prefix flag (KALLSYMS_F_PREFIX), the same lower_bound +
pos/next_pos also handles suffixed symbols cleanly since they're
sorted: querying <name>.llvm." (or "<name>." for .constprop, etc.)
lands directly on the contiguous suffix entries in the sorted vmlinux
table and userspace can choose to step through clones via next_pos.

[...]
> > You'll find that _IOC_SIZE() is used in many places.
> > Amongst other things it can select between 64bit and 32bit compat struc=
tures.
>
> I see the trend to stick to fixed sized __u64 and __u32, which allows
> to not worry about compat. I'd go with that (we have used that
> appraoch extensively in BPF syscall and it has never backfired, as far
> as I know)

Ack, I'll update v3 to use __u64 fields throughout. There already is a
precedent for this, and it is simpler to not fill holes that __u32
would leave.

[...]
> I'm intending to fix PROCMPA_QUERY's embedded size (so that to
> user-space it stays the same no matter the evolution of PROCMAP_QUERY
> interface). I really think we should start with embedded size zero
> here and have size embedded in query struct itself. This is another
> thing that we've been doing in bpf() syscall for a really long while,
> and given how dynamic and complex that syscall is, we had a great
> success in building and evolving API in such a way that user-space
> code doesn't have to care all that much about multitude of different
> versions.
>
> I'd really-really want us to not have
> KALLSYMS_QUERY_BY_NAME_{V1,V2,V3}, it's just a pain for user space.
> The evolution logic for versioning is simple: if user space provides
> too large struct, unrecognized (by kernel) fields should be zero. If
> user space provides too short struct (for initial version we can
> enforce minimal supported version from the get go), then we just not
> touch any fields added after that size. That's all there is to it.
> User space, on its part, just provides its knowledge of struct size,
> and then kernel will implicitly assume zeros where appropriate.

Ack. In v3, I'll update KALLSYMS_QUERY_BY_NAME and
KALLSYMS_QUERY_BY_ADDR to be _IOC(..., 0), and so the sizes live in
the structs (size; sym_struct_size for the nested struct
kallsyms_sym). Sorry for the back-and-forth, David. Also, the nested
kallsyms_sym needs its own size anyway, which _IOC_SIZE() cannot
carry. That keeps userspace free of V1...Vn command variants as the
struct grows.
