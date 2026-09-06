Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C7934FF79
	for <linux-doc@vger.kernel.org>; Sun,  6 Sep 2026 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788684856; cv=pass; b=FR+Dd68nB5Pi8y7w8v9vjJdCFPupKRe6XC412DLDUfDFrb/LlRYQQlXkVqEjz/sPeDudGPIAToK19ihrMz2IXBf8sr66U7G5Y6CmBgItyKzgCm9EK2CjAHoY7TMPrtxsFUVDbJnv2F68fyLqcsQSAwq4OpZK2K1v1a2q4scmFWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788684856; c=relaxed/simple;
	bh=FtMUsQ3c+eU5+RWwNkmgMZ0NRIy/xc4bbMVT5fiF/aA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfzMOr30GA9LlPwux6L4QaCmZ3Wr17c8kfzgXLLVd9+aQPhNxbFca6xpBXl3/+UQKWvqR70FDZumW5uJiX4QmLaR6mq+WXVJiTkgKroMy0fEKFtxYjfadK7rGByP+K1rkwGz7wxZxqs13O7LBQOQvQ3K1H2zt/db3uz68j1jlzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9TizUcl; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9TizUcl"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso3986086a12.3
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 01:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788684853; cv=none;
        d=google.com; s=arc-20260327;
        b=nr0SXU6/vsBjpN1yhuTAExJzyBNqa4TGqSmSawB3HZWsuiYBz5OPP/YHeiTWOh4ka8
         gUN4rPr5UeKfRySHmuAidF/eJx9nxLAS5/HVTPQpPQdSMXE9jQKv8lO7whi0eO4xkknk
         6Emvux+LWbFJ7oNIXNywNeTqwKEzoLWRYPlj7EL8XHa0lo57kAQHJrTu7qVyRqgZkouH
         RYxoZ1oLk2n0X3zO0MGhUEx7k7As6z1UtElaUdMBHk/n4QMBNcxXCYOSXMo7Zm9pCFCJ
         q/10qku4aCvuxCHkdwhPTK9EDpi791CTtipxVb0HpBh39acy4RfCjnhHhdDMN7C0Cgpl
         RY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbwXKI+GsB7CVjJT81Ck70VdlQI8PJuud+2raignSOQ=;
        fh=P+y24akFjojDkS16gNRgILW+uhRsAJvSb3v8DlTg7ho=;
        b=ocQuk0Oi7NTEtxq7evTb7B7LCWHYMVpoprEUXQ3COnaqUb6Y2SeU3FjJJSP0ICvTKA
         OWVl/mjB1Zlf8mxftE6stG5HonBCj8a9npRJyr+8X1UZGIoE2b/xIsZB3lSbVrJjFRET
         LV39kNThfxhTQM7arCwuADHuVepPztT8ARYNzQaJyE4FPXxryC6TnGEfdRIMK7Z/rNJ3
         MxMjCvWOVj/GOJV1JkDDOMvstKbZrEddIUNvKvPSbb8/zmtRpt91vHu0LNkDzw8GQNAK
         MZvr3eAjk/C5zkKxTYhEoR+y1HDBwqi3xviAKRArQKs89uyJdD5kOXJza+Tnb3zVStuB
         8hGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788684853; x=1789289653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbwXKI+GsB7CVjJT81Ck70VdlQI8PJuud+2raignSOQ=;
        b=h9TizUclhnkWlz6L9RI1PZiRuKD2A6UZqzwrBT4mzNeaT+v6QRA7r4RC6B6gZ8t3Wh
         9VtwOqfAhpgtrz49eF7x0JDQVIA7Y5yAz2EtSNgn7VXyNl7Ae5C/5760Ex+EMEVj5vKT
         wsqDQbqjCurHiHAJ52WUifBMseVPi8eagaf+HpjFBX66AzHmp+b8jM1HyG/ijV2/r10G
         G9rOc6T+vGvLQ1Y8VSnBNUwrMJL3dEo8zYURQQcp9Y4fN7DP11TopTJQh+d1vbG/1TDZ
         3efGsk2hoO7KzAgaVfJfIIUSYqhs1BRoJOXBaEJyDK1QwxjbT4SudYw4FlGDaeBtQng7
         76eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788684853; x=1789289653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbwXKI+GsB7CVjJT81Ck70VdlQI8PJuud+2raignSOQ=;
        b=VU21Rg0qlht6me4QEiUHFqw4zpqZPCQp4ySNfq5UmJJwVp0n8zWD6bLM93WKVrku9S
         j4yu6SCiCbr1+EqvZW6oY9MjyNFqL/ylLmaRT+VzW5FA0VcgWlWr21GC8fE8HJhkRa2/
         rSDO5/MXimsephMX733A0RsAYNgcb7W+YT3dQGcyb56RimKtMPNKWQK4JdNjsAB1VpN/
         7jKB01g2TFGIEWnI+l7HO7Hj5RxycijX6rBzFt2Rc3H9J7wpbEMGnlxfjUwy4cAQ8sjo
         JqsZLZ6fDyRBXPhR01IYTAKZVJ0z1A10iIONzzHjNepNaQ8pcygLNXWf8wTFdErvy8o/
         AjVA==
X-Forwarded-Encrypted: i=1; AKwUvBwcAn057Z/oKCAMhbqJUlgz89p7Q1QLrNQlSFlfURbOef4rs3/725ikoaPaJ319pwUv1lIlmJSkAyM=@vger.kernel.org
X-Gm-Message-State: AFuF++mOiau8LGsxbf2vvZtEHSiCbNyZ1gS0AnotJCbVmOv0l0xhM/eA
	/46VPvroU3d8hDP/XLdlc53Q5QnbGUZlPJcbHuRTWujRCmHL+bJkZcKo+SXqSHzXMq+l2vlDkRb
	ZcNdrPeOMj5k8JsZb0qbGC6CyHSMXQK4=
X-Gm-Gg: AYBFou1vP3tLdJyNed880lGAT6cusWDUoKQ4QI+xNYLS+VuKRT/+/boOPP6PjuYLSD/
	jvQtMGgX49jBXZm3WvE05unNFWeW4RYryqtBN3SUGSuEUhHwNvvV6LuEi2WnNc3p/+ApFfuRkW9
	vJ6+W/788P1QSPIoqsTFc7fgNqmxRcTjPcGDiPe3yNevcsmjqCit8p4w1Dg9L8hlxSO+ZJnu+Mv
	i1FOnhfiC84nx1ey5u+3hkS3VdZQKE5QxorPHa0JYaeSq1VnL/PlgJi7rXnVdTbBsaC+4WmSo4S
	pifN3YWu21jT0P7qeKNNPCcu++rdOPyIgLE414++6pNrYt9bIKy5Es6FmZ5kmgo5DwZNN8aNPLO
	rl2+AjTtHOskUAdnVU27kjII3DryHSPo25DBVYJyiFQ==
X-Received: by 2002:a05:6402:27ce:b0:6a6:7882:89f2 with SMTP id
 4fb4d7f45d1cf-6a7e8f9623cmr5389972a12.17.1788684852982; Sun, 06 Sep 2026
 01:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-1-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-1-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 6 Sep 2026 10:53:59 +0200
X-Gm-Features: AcwNN1UUMEovJX_eDQLTzWZBni3pDHzUeZjtKQmab2rob-n71CYiUsiteVtNV_I
Message-ID: <CA+=Fv5SZRccPT=1A39uqucCcCahkMCeecX_FnnCt-q39o=vx5g@mail.gmail.com>
Subject: Re: [PATCH v2 01/22] alpha: enter hardirq context before looking up
 the irq descriptor
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:29=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> handle_irq() called irq_to_desc() before irq_enter(), so that lookup ran
> with the preempt count still saying task context and with RCU not yet
> watching.  Generic code called from an interrupt handler should see
> hardirq context, and irq_to_desc() is more than an array index once
> SPARSE_IRQ is in use.
>
> Move irq_enter() to the top of the function and add the matching
> irq_exit() to the invalid interrupt path.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/irq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
> index 4a6a8b1d5a8b..5867a1655045 100644
> --- a/arch/alpha/kernel/irq.c
> +++ b/arch/alpha/kernel/irq.c
> @@ -107,18 +107,21 @@ handle_irq(int irq)
>          * handled by some other CPU. (or is disabled)
>          */
>         static unsigned int illegal_count=3D0;
> -       struct irq_desc *desc =3D irq_to_desc(irq);
> -
> +       struct irq_desc *desc;
> +
> +       irq_enter();
> +
> +       desc =3D irq_to_desc(irq);
>         if (!desc || ((unsigned) irq > ACTUAL_NR_IRQS &&
>             illegal_count < MAX_ILLEGAL_IRQS)) {
>                 irq_err_count++;
>                 illegal_count++;
>                 printk(KERN_CRIT "device_interrupt: invalid interrupt %d\=
n",
>                        irq);
> +               irq_exit();
>                 return;
>         }
>
> -       irq_enter();
>         generic_handle_irq_desc(desc);
>         irq_exit();
>  }
>

Since this patch is unchanged in v2, and we agreed to handle the
hardirq-context consolidation as a follow-up, my tags from reviewing
and testing the current change are:

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
