Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522304A4F1E
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 17:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825153; cv=pass; b=nogsHY7VO5jCJJA2Iocb+2r1CyiIvN7YEo2Xee46d7smgHYd4GTKx7Tt3fNOM/aoTZaf2c2+QUcb5DiHN947HrvTm74NwdUA3fKmuiyAmPHtj38tmyRt3elQQckv7RUhRujmQ8vFi8tDEEOttxd+PoWb8GALzmDhx0fO/A7IvJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825153; c=relaxed/simple;
	bh=dpW2g/OHhp1bd+k/Wa9Z4WycLX07oh4uMIjONrgblWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPrRSUpO7dTraNWj5+BeEcRylZAUaWkMnZX7SIi64e+lgaRQb6sIvl6jKxuYfuayOsT/8nrpOh/O0LPMXHVNUneEa39fSnql7ZQNHkPwj6BtOSuuBAG6+2BXpd4PnVama+NbO+0lHkBMvEOa+/wU8O1OHRQZ5CWoAD19afuONGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNtkXBU+; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNtkXBU+"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6afb0d2a586so3751905a12.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 10:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791825149; cv=none;
        d=google.com; s=arc-20260327;
        b=YqKioCdgUcRTvgnk1ah5a9aHKUZoPEDzTK0AeL5or3G03e1dUiqebYXc9pVwTwrs9T
         3at67A9ZWpZmczZXHrN1SLgQqi99SNBA/V3DNM4KCdTouWcNEqetxlI5WfGE9sgw2C3l
         8d13xcpeemp987n546dsh/MxOFzW3GUuQtNiS3He1rFR++18U8/CZF2EjbIwyf8/OCDR
         egt5JRz2/xl8XP+BMi9MieCfkWEK1T098Wa/i2SR8qOzfcv92iL5FwrklKbm7qHZueNF
         nZprup+t8J4ev+Qz0lNZnZCi3d4b67hYb//0Mwod1lsuQ2ngnY4eGAEu1xNotFqOGgsd
         lbIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UhieV+/eJrwJW2//RDtEPeUp5XItWunJ/DM2B+e/f0M=;
        fh=ckESHPif6OU67b5e1GZkRZBOwl1fU5mjJgOX59n5Xbk=;
        b=rt5QTQpGrzTjf7YYhnYMM2FzY81bj0lLMng6fLPHiRdjFFaG09d0dzAokFJWOZFQcn
         7DNgrG+YQtLyV/brS1XmDrr/Y40jK3OXIMsdK7t2J5QyRKovuInWKiUTYpqWvoSUkfX1
         q83LVV/LZSwGlFvNEWWE+ekXwt8Sh6fKtpwBPSmOApvH8FPqrvCZ2Uu5Wc3t7N5ZBDNd
         BvZAR/bqmj8pFdZak79GNQmGah5vd4NtyjCeqxDLWEIQDF76+bsCyPxT4M4Z/7rlqjsz
         8FpYmaqG+1oTb0pyBmyQ3AEZEQlCEHuQx+CIbkmOlnNoasUeH52MCT7LxJ9hP3ZElO25
         EYtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791825149; x=1792429949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhieV+/eJrwJW2//RDtEPeUp5XItWunJ/DM2B+e/f0M=;
        b=LNtkXBU+ki5e5hfXUbOYJgoqmVPmvvlOv6aE8TeGaObQVrMEhK5SMDzl2vxRDv3w9a
         Y9wMRqWUrUzIgVfOB2QeS1wDoxLAVUOmRoz+jmQZ2FJr+w3MAOm2EhDw6RbyRXdE8+sd
         EFFSjzf7S6eyHBu/Eheio/8fEREfXEZSFvjEZ4TJCeXfBVO6s1iEXjBDMbRGtGf9lMhI
         uTRs9DRO+EAWbu993mr/8EBwNvBG2f3wYG4vQXxzFlixvQJSNrsYkgQNH/kDlVbbtugm
         v2p3/8lgQ1Lu1aQtanuQOuwjI6Zru14CSDwomS76o3l499/Be5ER+5B517veqwwcEpiM
         ZJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825149; x=1792429949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhieV+/eJrwJW2//RDtEPeUp5XItWunJ/DM2B+e/f0M=;
        b=haPslZtI6gFrCOUqq0hVh4oEMkaxhTYmS6Fbh9L/ewD04vlubryYNv74bUFpmkI6Fx
         4CRRlT+AYMorPpIbLdG8yWiv3rqE2Be48l7W1MCLM6sLf7TBDDcR7P9kDPGXN6DxAnu8
         tPBEeIL0gSChBSFtCn5U8VtOuDSL5rNrmWH0Okx8pKZf6V/5jADRWcjDd9Qad54Ak6xr
         Kq5/kP7d5DiqMTKHzcCCph2LAkKFbKpwzcONm1QY4RP0sB3dgFl/J0cb7GIVhm6Uhehj
         wa7QeBIuTCiL9C5rxNXINwjqxsROs4jNHrD8LZHlPfQhZkDrat4BPvLcM/WiCCqR4P4f
         V1Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzEI5qhs4UkTP3LCzkbgFPh7bOhsqa4ngV8jRZ5KzxoT9Hkjclgqs8qXw6ljR1KXgRQWtdHKw3tdb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOVwgQBNQvBNzCsZSh5seyRPQ8xnDBjA2/EtMdHlB5iMiz0TDp
	iR1TeQwJNOK8r3kRi5DlGb0V86rth72M3+R8N5VFvAwheeTGRtmBuEHgyYghVDfCWNGetcsMR9b
	PduBi+jTlvbYDa2vQNdXM5l50n4IBn/9n9IoM3r0=
X-Gm-Gg: AYBFou2dxusaZAyLe8HFUPeqfigAkWJQoxBWTZzSFruZJ/P2SLLfEbDIIZnheLfBydL
	9/FlfwbGq8S35omS3eklNcl6cEiKNCdd7hXq4SXZ4R1RCZE2hxOQjPRS1meBySfNesrRf8rAkPE
	DblqznwPlOuvbTvxfge0pwfysRSEELlcK0wWHNWXI3GjhyhqQyEehMITr0rX1kKNZTLLH0LEsUc
	LP+6ONj8/971JcXIMJ+D8N6QyEubAs4VdgVFpMlHGCc4fbTNxllg5XPMi1He+coMeBSpQajTPbY
	ddWsVWQFnvXngOoFOpeMhYtf2YtBe0USuXSbm61QRWivxchr+eboPq8yMuC7/LyOhROZTd26nkC
	5CYbDnH2MBDbyJW+M5rNPCIcISAgdhR6PNAzFvU+QLQ==
X-Received: by 2002:a17:907:2d24:b0:c2d:bcf7:37f9 with SMTP id
 a640c23a62f3a-c31aa07a9d9mr992370766b.26.1791825149332; Mon, 12 Oct 2026
 10:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-3-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-3-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 19:12:17 +0200
X-Gm-Features: AclHuK_IfbO80biMKT5u2j2yFp2FuPhLw89IvxvMZVpINwN-IiFIyIRGdYMzWGo
Message-ID: <CA+=Fv5RW+ju5weuhDMLjEFcWvg0G0RnWXiqTr-0HmCnWhcaQUA@mail.gmail.com>
Subject: Re: [PATCH 3/4] alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
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
> Both open-code the same PCB lookup.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/processor.h | 3 +--
>  arch/alpha/kernel/process.c        | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/=
processor.h
> index c461a26d47b3..73251cd671e0 100644
> --- a/arch/alpha/include/asm/processor.h
> +++ b/arch/alpha/include/asm/processor.h
> @@ -43,8 +43,7 @@ unsigned long __get_wchan(struct task_struct *p);
>
>  #define KSTK_EIP(tsk) (task_pt_regs(tsk)->pc)
>
> -#define KSTK_ESP(tsk) \
> -  ((tsk) =3D=3D current ? rdusp() : task_thread_info(tsk)->pcb.usp)
> +#define KSTK_ESP(tsk) user_stack_pointer(task_pt_regs(tsk))
>
>  #define cpu_relax()    barrier()
>
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
> index 06522451f018..7861c9e767b7 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -318,7 +318,7 @@ dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt,=
 struct thread_info *ti)
>         dest[27] =3D pt->r27;
>         dest[28] =3D pt->r28;
>         dest[29] =3D pt->gp;
> -       dest[30] =3D ti =3D=3D current_thread_info() ? rdusp() : ti->pcb.=
usp;
> +       dest[30] =3D user_stack_pointer(pt);
>         dest[31] =3D pt->pc;
>
>         /* Once upon a time this was the PS value.  Which is stupid
>
> --
> 2.55.0
>

Looks good to me.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
