Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1074C4AB1BB
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822072; cv=pass; b=giK0lJyQCIbHWdzUTWuaJrmSSUJfeRi+Y56IloZkRx2GO41XuOZIt2CJbyPbjxs1/gxQLfSd7UhGLI8FErYh/Y1LqHKSs1Kma03SlKC0n7NoaxuNnJywmwg1A42wCm3ssQqSQSn7ahNEqj5Rsf6rdj8BkP0LyTnIRYeKcwJHS9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822072; c=relaxed/simple;
	bh=ZtJuy+UREce1sg1peUoIDUZxf72qfaMwDaVEPJG8eTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZ1R6VMxdNNTEn2xMWWmIjxjwVZ3t+E7RRqSjZutDwERbKjYcQhX7VsrSno2D4SRj70U0YIC0kwPBDBdkyB39NzTORHgbPhCmODt2RDA5mTdFlAmCnkoBquAOcFpJAH1yssUjlcTFE/J3/tcgxJcmLfe/QPx4BO+Z1OMTO1F18o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlQe5Rq1; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlQe5Rq1"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso343187266b.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 09:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791822068; cv=none;
        d=google.com; s=arc-20260327;
        b=LHJ9KkXWye24OVhCw7XJyAqt8E05RvHDFPKOz1M7HWcAfv84suJ1RdUjxz/xAhfWsc
         WcbQW56suom+mIIzHnhVZXt0Y/g/pGBV2EVvrg/AtOyeLlymdg1VrN63iUs19J5stUOq
         EKvOcVjMGCe2MHK5UckPUlTjCdNAr0th7E6emZa5s1jz9UkYQl6pvFuOWUE10o9Hb1wN
         GG3AjzahNyeBaZl36QrDDxpnkvWpu82rm4bRHr30VH7BJG6dkJkVZ9v+8FgXIbyrZqug
         ijhUsheB1pg7xd5Teeo3+4O/zec0qwZtPPqs98mhFe3Vr7wRAuc+2Gwy14MjNTZfHI8n
         HE5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtrJmGwBJ7fFDAdke9R1Vl4DtHEPSg3jl6Ch4LlMUAA=;
        fh=/VBy2cndCs9SWY4aYjmUtYCJJvWhZZI2n7I4kvV3O1s=;
        b=KKThQiFT+yyxYKRxWtHmMVUY3hWzCdowdbWcJVk3YNl+MWyu61eZIEVosRdqG9bjsH
         fdpd/FIeT+55BZQ9quAJW3XNQAKj3MlzkOsNGYt2gHReWoAEuoEfjsvAP0UmAxKjq0IU
         /8Yy/x5ue6+z+LqdQ/AH81NZLEdXammPhiB+mv5xi5BGHqQ9QEU0WiCfyo4bp+ZvLUZP
         YQikU0QAyu1B1L1CNxDN6sfkyPkKtHOVv3QBv5YbMMlotTSzdDAUoLBDjxpIKoy3QFaq
         sv0GKPLwAleVxAq0EmlpQwrZyoRVjeffQQ+g3DSF6EIyTnrxR4zdNgRIwv3CEHoOmEi4
         ATyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791822068; x=1792426868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtrJmGwBJ7fFDAdke9R1Vl4DtHEPSg3jl6Ch4LlMUAA=;
        b=mlQe5Rq1SzCNDLgbX91+TwnsTuHGb9Q1PNka/WwZ1b4omFf2cviF0DCRzMFQTxS/Cp
         4kvi7eFoR2FXsAiQmzTBclVr20+xw9pf8erRlMoTnC6EOa6Nb0URMMYvwUdnax46HppO
         MJattmjMAg9RomV8fBUTBVcfuqu2tohO/rFrE7PceK0NuWZP3XUib4YiXDwTNVOXJgNf
         XDOD9IhgTmgK0dh1bR8BhZs+rS3AgOjEkgC5LyPj+grjMYHwj5KSZMTg4ASrcWpvAT3f
         4UclTyagrWBXPz1Kz5qTpJwadd/mXeLakp6skbKaqbrPR6JSyJuSxmboPM5QmFYGbWUL
         nGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822068; x=1792426868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtrJmGwBJ7fFDAdke9R1Vl4DtHEPSg3jl6Ch4LlMUAA=;
        b=NtLd8Z2FlUMvxVhU+qUnDyzniJvNU7lSBJUYiyo//SkSscyikx5O9O1zQSF11e302+
         sEpK4xaHIacQGdegp9eqFRaOzzvUPg/UNM/D6fVtchUa0KBt/zvrTVJFinA7sZAvBbdx
         NtWs28yrKSRiMEi1xTO2MCbDheq2YmzcXXFrYChMOK2el9sqJtYHeSsh8KyDABHEvtgS
         LNS0U89XiWGJ6R+3upuPMGcEZgXNLxUZpN4kG7uJ6T1zBp8rfwvshnagWu/PNxDQYZEK
         /TqggTLng5KIaHK0ZyXIAHjyKMTcsVPLtRv7HJcu7JtwzKO/4VTOJzcrCpJA8B9o9UPB
         SAsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj8qw9p0iIfW6qD4pb+GFU2Yy7Kch0PANQLTZBfIRBtVeIhGPoDafT7mTUuPubUUaeZVkFj50AZU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbgsJLg5K0LYZeaKBah15EkfRox0mftEtDTlCO3vFSnnAJnNse
	Lymr/H7BHu8vHPcymORG4PPQIbRsnboZLoOWLo9vqK5Ztbwfl/7DvXjK9H9/hGLk5Yqy+BFAF9u
	WpgaIC4J9PU0ubnEcJrWKv5Kj640g/fg=
X-Gm-Gg: AYBFou2XlpjcNWDFWF2zlhMbBt0FpfaNeL4xvLRNCEgLknlWNMcDW8E8aC8wVHlJ350
	Qvx84DfZE7in9S/qfv2IvjPHj5M+Vaal6JFfT4IwrV1SI7RJpinUY5ihp0VJjWdD/u4F2YYm1KR
	NkP48+gFRSDTkYrr0Lgp//F6aK08snN8aUrdidqiHtKF1ET6CWHPGahvR+0iEgXLxths28x34OP
	QP5JOIduKLsJRZlPioFkA22UYL+MWfD78jUemJ/FnXkwA/qZf+4cDTYQtcF1+HTZMkpMfFFkLx0
	5gC2sAjsH5yTW85RbqHdSgpufr7ZoWsIzsJDnAAbctR7AGRTBigb3I9aRYcgHeC5WeRi2DPhOA4
	42SRIgkrJpkbAoTlI+I4j2zFosr0/VZQQ0hMlV4NoJ34=
X-Received: by 2002:a17:907:d92:b0:c2e:7daa:2399 with SMTP id
 a640c23a62f3a-c31aa0b59aamr1021227866b.42.1791822068206; Mon, 12 Oct 2026
 09:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-2-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-2-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 18:20:56 +0200
X-Gm-Features: AclHuK8ctq3ag-qDSt__fyD9TouOLhL0ONKOVT2c6PAyBUOuhZ4oNrOZClMtffw
Message-ID: <CA+=Fv5R05SLcLkHRfVhqLbjWfp29gpR=R8JDktjOKkYw83Xwig@mail.gmail.com>
Subject: Re: [PATCH 2/4] alpha: stop storing the user stack pointer in pt_regs
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,


On Sun, Oct 11, 2026 at 10:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> Nothing reads pt_regs->usp now that user_stack_pointer() uses the PCB.
> Drop the stores, which saves a PAL_rdusp call on every syscall, and
> give the field back its old name.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/uapi/asm/ptrace.h | 2 +-
>  arch/alpha/kernel/asm-offsets.c      | 1 -
>  arch/alpha/kernel/entry.S            | 5 -----
>  arch/alpha/kernel/traps.c            | 8 --------
>  4 files changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/ua=
pi/asm/ptrace.h
> index 9d86b2a1526e..72ed913a910f 100644
> --- a/arch/alpha/include/uapi/asm/ptrace.h
> +++ b/arch/alpha/include/uapi/asm/ptrace.h
> @@ -43,7 +43,7 @@ struct pt_regs {
>         unsigned long trap_a1;
>         unsigned long trap_a2;
>  /* This makes the stack 16-byte aligned as GCC expects */
> -       unsigned long usp;
> +       unsigned long __pad0;
>  /* These are saved by PAL-code: */
>         unsigned long ps;
>         unsigned long pc;
> diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offs=
ets.c
> index c89792c86044..22ed3c975b1c 100644
> --- a/arch/alpha/kernel/asm-offsets.c
> +++ b/arch/alpha/kernel/asm-offsets.c
> @@ -30,7 +30,6 @@ static void __used foo(void)
>
>         DEFINE(HAE_CACHE, offsetof(struct alpha_machine_vector, hae_cache=
));
>         DEFINE(HAE_REG, offsetof(struct alpha_machine_vector, hae_registe=
r));
> -       DEFINE(PT_REGS_USP, offsetof(struct pt_regs, usp));
>
>         DEFINE(TI_FLAGS,        offsetof(struct thread_info, flags));
>         DEFINE(TI_SYSCALL_WORK, offsetof(struct thread_info, syscall_work=
));
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index bfa116d455fb..790389a15c3c 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -476,11 +476,6 @@ entSys:
>         ldq     $1, 0($sp)      /* syscall nr from saved r0 */
>         stq     $1, 8($sp)      /* regs->r1 =3D shadow syscall nr */
>
> -       mov     $0, $8
> -       call_pal PAL_rdusp
> -       stq     $0, PT_REGS_USP($sp)
> -       mov     $8, $0
> -
>         lda     $8, 0x3fff
>         bic     $sp, $8, $8
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index cfaef96c4ce8..5882c65b7ef1 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -30,12 +30,6 @@
>
>  #include "proto.h"
>
> -static __always_inline void alpha_snapshot_usp(struct pt_regs *regs)
> -{
> -       if (user_mode(regs))
> -               regs->usp =3D rdusp();
> -}
> -
>  void
>  dik_show_regs(struct pt_regs *regs, unsigned long *r9_15)
>  {
> @@ -186,7 +180,6 @@ do_entArith(unsigned long summary, unsigned long writ=
e_mask,
>  {
>         long si_code =3D FPE_FLTINV;
>
> -       alpha_snapshot_usp(regs);
>         if (summary & 1) {
>                 /* Software-completion summary bit is set, so try to
>                    emulate the instruction.  If the processor supports
> @@ -208,7 +201,6 @@ do_entIF(unsigned long type, struct pt_regs *regs)
>  {
>         int signo, code;
>
> -       alpha_snapshot_usp(regs);
>         if (type =3D=3D 3) { /* FEN fault */
>                 /* Irritating users can call PAL_clrfen to disable the
>                    FPU for the process.  The kernel will then trap in
>
> --
> 2.55.0
>

Looks good to me, I see the __pad0 is back again in pt_regs
brings back memories from tracking down the stack alignment
issues a while back.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
