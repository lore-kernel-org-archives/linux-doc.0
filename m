Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02293DC861
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 21:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755292; cv=pass; b=OwE25Y/3MtXwQck4dWMh/Q8gl9yYfRnrsIwJZX5rvly9uuS0pYcE8+4kj/YN4BJMf2MA3UrcU02+5f2rhdT2iwpNJKdFej539VB+QS4KrL36eedkslL2DK5HKPJXUnXG956Q7bNAA4tcDCgYVxa2hw4UqD/zqoCjj+drsTVDR4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755292; c=relaxed/simple;
	bh=yGC7Wvk88O3E7QKKMndYn3qemkncNe4qFrBd2PU6+HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjy9xGX7sBc4vuAWIZ8cq7UVxKyDKxE/I9wJxuw7Na/8KeNjDxEZyAstpd5xTGGqy3QK2zBSmXx9nTUH2yj7Mv+MFr5ukmYS71SI1DCup3spNQLgaxr/wO8F7ZTXQOL/dU75y/xgFWn+yjiCmmuwDo7OuVGSyBN7v0U70a/OLaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BUdDBLpa; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BUdDBLpa"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5337c7b9937so196001cf.0
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 14:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791755285; cv=none;
        d=google.com; s=arc-20260327;
        b=cAIP7gJXVocQMjA54wai/1SyoEv14HdKHY888Truo1QFlBeKKJvoN4RVk3JItg7ssA
         IGQGh7c3Xh3zQSFB9BtEfHOnSKDAdb2uIu5RtJz+PjggMyyzIqws6K8KFYqeMk9Jk2eY
         Mq+IT4b4Z6jEIZpZvgOD9dNM5HQi++JTQTGujNFMNAZwLXOQSTmxW5LJQfAEHXWv0Dkk
         oMzyx7sNRwgHghQh9YOKMUECoQ/BIL35ep/Rglpqf87FrkXsKb8pf/LTZlMvRgp/i9Vt
         Wqgf14b//s0a+zPUvVk99pJjZ6chCelPNcI7Bxz7adFOD4xIpPxDQaN3vYMvxoy4Crhd
         HAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pSoGFJkMmBNVwjYD5umh+SpMh3+8g4woByg9LqJWVSM=;
        fh=f4j0QCRTkJtD5mqZZl8XVh07W/huUPcRbkDxbjEeeFQ=;
        b=AJnxnPp7PeJE+b5HhkdT+OlMTIFD06T8t0QHoTZCeYYz86BizR297Pr9tovfj60a5g
         /7KIQHb2nNOgsrKgNoJtkH0T7kkqT0Vve8C2lmtJnvwuq35GiMVwzru4GKFFfPPvF9Xc
         9c9swpwnYzQsVjnxTrrKNfDJkQiC6vXqF3RKMemc2n13SAGtDXVHrH5PAiSwLq+wO0EK
         EOAO7PD1AffaBxd2gX3PwyR9kYLN5zSJ9+HxSU8P1EE0WLKZr7uBwE4PqvTpeA8sfWsI
         gBk0RWgRHCUtpK1vtNZGINf4Q7h/H+gsscfM8EvHQrV1ZQDp+9R52brnO9kBsVQ3Oi+r
         lfjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791755285; x=1792360085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pSoGFJkMmBNVwjYD5umh+SpMh3+8g4woByg9LqJWVSM=;
        b=BUdDBLpa/EXu3XY/NMqf0FVbyOWfBWcg3IKBW9JrN9IycTJv7WMpeccYUXkabFFJ4T
         bF34KCdNrCaXht5ItucP7FhVQ8ZADG95VsRfXUn2kcfyFL7P1kEoTGRvQtlYnHJELvB2
         GN4oQp88szYi90EG45FVUpDN0If4ettCJyJQFu9yism4yI8Q/q24b5ZutzWBXK5cwKJX
         rMjK+5GBqxsqnZY4qK/NpZ1Cbb2gMC8MEteKyNhdI3YFIkvJe4Y8ukdw210YVkwss2Os
         7FGMVGgZGPfWJ3kVFKbXr5SQqH4ZAWgz5zL1nasseg8jqhfKfvx23X0oqC8bFqc1YQuM
         smjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791755285; x=1792360085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSoGFJkMmBNVwjYD5umh+SpMh3+8g4woByg9LqJWVSM=;
        b=loaqxpj68dtHHyGRxtKm1V+h4dsxv30YHaM2tNauUH0ggyDK9BejmQnCPTOXaiubQ9
         /cx2J9ncKeh4OloHT9kOhW2v5h1r5cu6KTv9d0vPZWga4jKL91AGwia37tdvs2V7dJHa
         qUPl9QZHDQz9UTeTh0g9CXeeFl8UszPuqVtn5M1z8fMdrS48ZB43Tw3R+81mgZUln+2T
         61NyZK6YCU4Jna7oga6zOwiFNHO1JJN1T6j74TjVQMPFy6MLFg+r137PmA7T9kB+g2yf
         AI73EVK9rzgD/JFsDBBPTDYZKcCKMTFzhg4lNZQYPKTZfLpahDoEwZ53lhIG0NVBLsrx
         uh5g==
X-Forwarded-Encrypted: i=1; AKwUvBwvBEjVVpma+gWp571GvE8j70Z7nugmY2zATXqRzxeQygazD2moxq4u5kAupLiK1KW1FgwLMoF6xRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF9iuH7cSLDyfNV+hJaydY99imQwChoJIyU8j+nM1HKO1JzA/p
	Lbtz5mCT12czjICLimDhy9mDAzBkEIw5sjTGp6RQ5lBG80eXkRgGfLVReEPJ0E8bbFnTz0ea/+N
	xcIPbPW1dRX07kIJn6kBqqnZ+KzoAXmYEp3g1ltMR+W2rKLeOrJWfXLdB
X-Gm-Gg: AYBFou2tqp/tP0IiysVoypqYtEKuWMBPm1k7Ba7Il21BSwyIh5hO8rU/ma7rCrXj83Q
	YxkaAmrxdB6K14aD+8Mfuq/DNrbs6JGrfbn8CE42yTWJux8QMFMTjKztQFp0AVUtHIcAHJU5MjH
	kXZTIYv0Joy+0HWjA5qz1FkfAHcn/I6kce8risal3op3WJb9XzDqQaaeW7ARNxEVO8bu6UqX+lp
	bnDlvS5Cuqo3gRkILmTlMPbYy43zsY8M94QaN6WRYKiI767HEm/mk0ZqRlsMKzJYJcUfYZGzBkE
	mlZxVSqOaH32FdtIbcsCgenGGIURU0k/Vsn06hMypo7H69yGiiVQqVbV
X-Received: by 2002:a05:622a:1116:b0:532:a17b:9581 with SMTP id
 d75a77b69052e-535b3122949mr20485051cf.3.1791755284649; Sun, 11 Oct 2026
 14:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 11 Oct 2026 14:47:53 -0700
X-Gm-Features: AclHuK-IE1KAcxUEfRF4ivWBjkQ6viea8MAPDf15Zv9dPut0fJ3asy0p1dyVVfk
Message-ID: <CAP-5=fXcWRrsxYMCmb_2BK58PHMtGwQx2iKDE0hEZLc+7_DHBA@mail.gmail.com>
Subject: Re: [PATCH 0/4] alpha: perf register sampling and user stack dumps
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 1:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
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

Acked-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

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
>
