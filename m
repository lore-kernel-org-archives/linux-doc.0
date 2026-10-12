Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CCA4A261A
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820296; cv=pass; b=HiXHcYOKMJ83DzfBxv5bqUtYWghPjQO/EMUkiaZMH2eh/Lm1wwSSDt6hAP7QYe4t7R2/pWP+vWWchwhH+7RwZ+ZEb9+sBdhEUK5aPb05q56kRB4NKJtmHIbS0M78fBgwwXRvEhpkGa2CxG8arsZKHUjm4mnB3R53mKb0XeLFp8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820296; c=relaxed/simple;
	bh=2HkM2JG2ntV4O9L1XnPwIDhp9hlRGoVV+6lp00SUDi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpChn8wAq8zbZtRD1CRmKwMFxyXUsi4BfgbIICCSv303vGSak7VQSHiUnSbraVpHWULslLaYOH+BpHtUaoh18pYW5PZYGFmrkhHxdT+ieTDM15hHiIpiob4IFpBI4B5MPs+T2OLvWB+W6q4pTjEkNUVeNV2ASX3hYaiJqxtTCBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAwRCGPb; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAwRCGPb"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e3846d1caso344543266b.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 08:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791820293; cv=none;
        d=google.com; s=arc-20260327;
        b=JBHvJdk6zuQfZD2gyOcwX34zuCemQbp57GMOR/DCXVqquSO2/9Yw63tPATYz4ldcLp
         hq9wbHOqmNR/39eOQLM3evLZc4lZ01Hjpg3kg1z571Fp/E9XoQHHrcHFD/Ydnwh3LJqg
         TPWXxNJ96IJdHPDrx4nwhzvm7U3kDY0p06xNnO6yaiNXulfIpTHwyn6s8cia5GrFjARx
         sgCMYQwR3G7rhFA7mK/0EXrBotc8TfcqIEN4d57S2MHLrDahNNWknc4QC3/C7letGgBl
         MVXLtz0qNnUmxlvGMDx417b5r8/DezeyPGTSnMW5qqJ4VIrJFaRtPiiCKUf50oFfJ5FO
         GTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ktNtTU9JVKl3ZfnOkIWLssk9gxWZSjBCu9lT+n1NcmY=;
        fh=4koSD9ThbEEBYK5fUKFQuzqthbB7BsuAF3ddq/dzGsw=;
        b=gF4pGtk7CxOmT3YPYOaqAilZQHgxjXdrGnYzsEPSq49pm4fntnPhfL0WONTPMRaQsA
         kgCCDzO1/fWIjxxbgznA+FBUsdqpdtdF6OJe4l4Ac+RymDLfl9Tk/giLST+ucFm4xW93
         UJizWJbqSQtNFDlb2I4EZj1Phq6SMZBq2PXLtD0AdFH7Ab43scpQCHHagjCahF5e3vIm
         5g+kEHYo9oD85W9TDvBth8NPQWXLBxcUTcnFPVbu0iavhORK69aAy6+YOAc/3MU/IL6J
         Kb10tQIHhiFpa1FO6wzk2seqfKtU1oBPj3nbf/9dacPkqEAu423+f/9XgKu3hGFnFIHZ
         xeGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791820293; x=1792425093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ktNtTU9JVKl3ZfnOkIWLssk9gxWZSjBCu9lT+n1NcmY=;
        b=MAwRCGPbF0QPfcfV9LnuZ5kmzcZSsQr/euUjqbBg109DgnrDdDQlH30j26KpRK0iQl
         JL5pmwQXyPs/Ko/IsrXlFrReAPp+f8uvp1M74hwpmJbekZxsVYzxKdiyNYH89O0XQG16
         moK8vjGr+e2SUn+GikOB0h6Ky14moFiRs8W/u42bp6iBR3X4CDJeFCezN3W/hW8Ot3it
         C4A5UUPY+N/kUEzMWp54N+nCDePa7mz0Zqg1yeu8WjACmZK0qu3Ekb3HvR5ufGtDBfkq
         4CMUDTTVZ7LuOkzG6vdpSbswau6RzGI2QPzzob51y7vzH2grxM3ukwG7nYHrHPiux6EM
         yQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820293; x=1792425093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktNtTU9JVKl3ZfnOkIWLssk9gxWZSjBCu9lT+n1NcmY=;
        b=m/XTcqqA7/lewMdiVS6eQltgBKEUjyqjPyKcsxnhX7oBolntJYeEYzlEUP5QVmWhcS
         CdgbUJIF+uNwu0NQE07uD6LlZbskKcFKfIunH6Q4VAo9D6LJ9pB2ZOaoCyI5z1xm2rU8
         350WmULqGv4EWiHaRazYaZz2cmHwI40holGsnaIt3XYGG+YYHzN963p75UoDda+GZpvw
         z1DMhJy9BNWq9264MlgddHkCjBSzP80T3O+gfpEStYiyRurcPioiVUjfIn0DF9kRM69v
         bBFDOu/f99glgVG6/XUOeLqLjw+mtb0eUfmtOZ94WjSSBhDk9i1Qrwc3k1TMLq42yskV
         ImVA==
X-Forwarded-Encrypted: i=1; AKwUvBzgPZZQ4qckCtKJ6FyrEeHJf3sPK0vmUxJaCX4+rmlTFrDoaNC4ZRkSC5E2kmG1GcFLuh5zRBIGkpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPetBr+dAWqE5w56ZQdXDpuVwDEISsGhDWrF8FzRBnymIkWGca
	jnH0vzgcAKkNiYhKiao9g2wcFJ0OUWyrg5szJc1vATRDo8ewqOJsf5bi6eD0UxWGo7lqPuYNjt+
	kysJoB17scZs3Voa/WlVUzGmjqJsLIwo=
X-Gm-Gg: AYBFou1hCE5rJp+uj4MlLyyZFsC13Y5QKgtgXLWo/66L6L3pyfpH8o55KM8D5Me6DKb
	gtZjJYKgmKLPbfjryuCu9pZwknfXBtojSbVTyT/TKzbmgR50kWFuT7KWRK6dM6ImOlb7HnB9MbS
	oWpbt+k4J6St8eFmpfGCXJ5fK7/C1uwAk7KPGtoi6+1d4hJQzlk7XlhMlPFY0oQAgh3l/lM2nxd
	pYmvVCO7fmJR8oaSYin0RQONbxnrB1wqHozx+6SlN6wPPQBndfza/TdeP2p51DavxBI7H6H+OmE
	2BaJ0SKTkD9mvyojBYBVAZ71VchsAHnzpOjNNlZo60lA4B7VA4l0e6Kd1TdnBZ6pVzDNAaIWD16
	lxCk8r9bTThzXFsNRaLqL/1dzGkSjAGpvUyXISrcgXw==
X-Received: by 2002:a17:907:9690:b0:c31:82aa:dd60 with SMTP id
 a640c23a62f3a-c31a9d0a5e7mr975742866b.15.1791820293222; Mon, 12 Oct 2026
 08:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 17:51:21 +0200
X-Gm-Features: AclHuK-xhWPZl4E0ja-mmL2ZAsaPkLiMeX7H21n80nyvvKlwLIZYd2jJw2alGQQ
Message-ID: <CA+=Fv5Rf-DKCTSnex2_Y9o+VU+mbHhMNzLJyBQ1+9hTjHufXAA@mail.gmail.com>
Subject: Re: [PATCH 0/4] alpha: perf register sampling and user stack dumps
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
> This lets perf sample registers and dump the user stack on alpha, which
> perf record --call-graph dwarf needs to unwind user space.
>
> r9-r15 are not in pt_regs, so they cannot be sampled. An unwinder
> therefore cannot get past a first frame that uses $15 as its frame
> pointer (-O0 code or alloca).
>
> The perf tool side is a separate patch for perf-tools-next. libdw also
> needs alpha unwinding support, which I am sending to elfutils-devel.
>
> ---
> Matt Turner (4):
>       alpha: fix stale user_stack_pointer()
>       alpha: stop storing the user stack pointer in pt_regs
>       alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
>       alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
>
>  .../features/perf/perf-regs/arch-support.txt       |  2 +-
>  .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
>  arch/alpha/Kconfig                                 |  2 +
>  arch/alpha/include/asm/processor.h                 |  3 +-
>  arch/alpha/include/asm/ptrace.h                    |  7 +--
>  arch/alpha/include/uapi/asm/perf_regs.h            | 45 ++++++++++++++++=
+
>  arch/alpha/include/uapi/asm/ptrace.h               |  2 +-
>  arch/alpha/kernel/Makefile                         |  1 +
>  arch/alpha/kernel/asm-offsets.c                    |  1 -
>  arch/alpha/kernel/entry.S                          |  5 --
>  arch/alpha/kernel/perf_regs.c                      | 56 ++++++++++++++++=
++++++
>  arch/alpha/kernel/process.c                        |  2 +-
>  arch/alpha/kernel/ptrace.c                         | 12 +++++
>  arch/alpha/kernel/traps.c                          |  8 ----
>  14 files changed, 122 insertions(+), 26 deletions(-)
> ---
> base-commit: 8f5dbfb93440d1aba216a1a34369a65654b94be9
> change-id: 20261001-alpha-perf-regs-v3-7e23508c1ca2
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>

The four kernel patches apply cleanly on my for-next branch. I built and
booted the series on my ES40 (EV67/Tsunami), and tested software-clock,
page-fault and hardware-cycle sampling, register masks and user stack
dumps across all three online CPUs. The targeted tests passed.

I have a few review comments(I'll respond to the individual patches).
The separate perf patch records and decodes the samples, but
I cannot yet confirm DWARF unwinding: the installed elfutils 0.195 lacks
the required Alpha support. Could you point me to that patch as well?

Thanks,
Magnus
