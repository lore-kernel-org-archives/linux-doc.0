Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E05C3B9931
	for <linux-doc@vger.kernel.org>; Sun,  6 Sep 2026 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727492; cv=pass; b=rsNfWtO0SkcENXej1k8I0FCz+i+WyRpJ4uFGpB9B+hOE+mvdHfBkhCWLQzXn/AF1hkQT9kLX9kAwYmHNjOtD9/BLz8NzA6TQTe47LkREWBP7yB0ZXneJkqiVHfoeQHvs++xxklu4CNtI0Q8VrwNrwLy3DELUP/loJtaWJmyzlYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727492; c=relaxed/simple;
	bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJu/MWGUfyd+JQG9l++AnbLng+dgRhFLgPCw9d6KU+USNr8Qc2MR7YCeniYSl0CxBRaZ5v4K80cB/ttZIjpiqjRLbbjvY0jS52CixCb6tRoi1sgW1JN5waQSFMJTCtZvmNPL+QTxYztAw9m1270cDjOyM2MZDlvbuGkGltmh2PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvuJLxq7; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvuJLxq7"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c255acff671so59128766b.0
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 13:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788727489; cv=none;
        d=google.com; s=arc-20260327;
        b=Xhy7FIgaGlKh4aXAo20PurlSSDa0HPUfRm1g+YMnz6awhobwi2m+uhM6v8gOHN3rCV
         HXDFDMR6V8+2crEVzZPvQ3NeI9IzG77iHY19vXojoHEbAF2lFmRbea1B3K1IVxhKTlfp
         7FYYaTuNpPlYBpBMTaW9DVCMGN5T6IyYynJjn3itVNGR8B7fBvI3/rcCzAhcj89v9PoG
         S3Tr1A2HEZZP1HgOg7sUlqxDCFqEHkNGZxfHKsAamgGUB9cjuuCFevynVutymq5ypmG3
         +G+SuQf2ZSAnfrCr0g9UIGbclLTAyYogG+81h+jGCIHzk9laZzq42GStAXHnXz9iIDtx
         R7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
        fh=vP39kEvK2SwghtR+LIJkzdIBuaUuEzFkrPDpB0789zY=;
        b=b+SqxDfl2c2IzFjQat8kkdLWiEN1ltR79pNB8izeF3JJg3qEj6fyUCeJOupARd8HAH
         Yf1LuuYnb9uZyUEw8DHFxYblgacagpM54RvGD9gAAvT4CT4oEbWIvDAdkcOeAt+NJkYz
         PnVzUi2q2yOZBMTjcESaQKV7+V0f7Zhk8IsU0kbgfCdzET86+N5eJE/9ynNCVX2SIyJp
         tYXLKWZtrXgEsOG6z7+1y14dlUTn0aQgY9qIMR6mJyxrBaTS2iHs9F/j6zawQ1/WJAo/
         /MnNvPY0Xa3NxHoDP5Lo8C78c6bYzecltvDAhKXy1UWBXN47SZXypYCpI7O16jUDg21t
         nZmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788727489; x=1789332289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
        b=ZvuJLxq7UnGxQy3/tdKxGRBTo/vvPeoBfQ0i0xekofZOIeMf2wV2W+VDhf44hQ8Z69
         jcux6HyQMsL88AyR0/n+TjFMuX2rbmqgrEPLF8Xf51KCFvHuVT4yEBhCuYvXAylFx1Ot
         wzZC3RBgQ+Y9PG6O/qb1fSUtnfAOkx48gyOjQyO2EV5NXSyL2FDmEXFmyKvnnqmh7EXE
         V67vh06NnSQTYiJ8XeMIBt27Ow4JKaXoiFPZ6UC0URp1kP67uZTJFd4wbR9PpTyKlwff
         c/ddNP+A50ar1QYW6iFhpbLPZZmh2tHuLQcy1exGq4XP/SwBPsdbXOBtHnAAVejojsrZ
         GWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788727489; x=1789332289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfahVnAkOq9Dy0GM7LrueFYNNe+ttAyxCGh+kKGHkNM=;
        b=moaZE8Vb9gfymtwBBxanyL01HfJ7aak6tQSCdrkIV/b5xCyGSOJ53395Um4ydWFEBS
         kR+lmKIBCvSHj+YN1B34nMM9aAtQ45mGKvV5d3aDpSKuOwUETePO0HujmBhynVHLTkUq
         g+AZdAitO0HWd1sy5HQ8W0VKQVZ9KqfOFBSmbB7vpMOF540d+HcSjoYJK1J9tA8/24GN
         cpmiewaexG+NHp9dSG6AG7jhVW4aMBsp2E36a3H1d5DzimWCK9uUr0H8m21KV0fVJVnJ
         dRmiqTBNP0hNZup+3WMUYbAlvk5V6w654K2EZlBXQDfYUPQhE+Yzg0fNRiUbRM1xT5xa
         ML5w==
X-Forwarded-Encrypted: i=1; AKwUvBxuWdO8lOsS4TSanLLPSnOYNjkpjjwbRTYvrAJlbPAuItTvqGder8NT2K166bkBzskOSwuKlsB96vM=@vger.kernel.org
X-Gm-Message-State: AFuF++nXuS4kbG4a1djV3To++o+oX0Rf5jPCnGZt+0+J4/WQOrm+/AbE
	AiK8IztnsGkEcbXzPVbWSSVFbvYBVQrnIYr4pEUMODlxcj61cSxteZca6EHuqctdhhxlTsDzu91
	a7x9l5OcFLds9TRHXb9zkcHu+iwVm2W4=
X-Gm-Gg: AYBFou2i18TEIz/UsivY4UqHx7MSa+HsCnxBN7i1dpeK8lHYjTBJvrmMk/U4ZqznSAS
	+lh/cB4HSqOcG0lMgHKfOLyfHEUnvCgel0p/jm79CxgSD9R67cArhs5Mp0wW6oQbROL+IAzfamO
	nU2YcMS6mR6gRvP0aZbtk/UwbUaEFVYnSLb9vCgjeewrNvEVVwx9nVUyBd/6xPnFCAI+0CWjfNC
	F4gH2Kaf7BaMqpn4RnDuujq6AIgqyxaUhHAt1cSCfw+28rIyemxgFkxiglBmWehAY275LaiDacg
	9BbQ7YG+AQDiGlvVANWF95W/p0WG4k9+Npnh0Q4AHlDrbNwfJs+sFxuY8f4xzYTG2ZCua4Hc3+v
	yBKHQHkG9e1OdH94dZltnrNyvkr40ug==
X-Received: by 2002:a17:907:72d5:b0:c26:1691:b361 with SMTP id
 a640c23a62f3a-c261691b94dmr574303066b.26.1788727488511; Sun, 06 Sep 2026
 13:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-21-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 6 Sep 2026 22:44:36 +0200
X-Gm-Features: AcwNN1We0AsiI87C6m3-nOVPbE0KRdcX5bT97xhlIc8oCAONBoZx_sgPyrzwY90
Message-ID: <CA+=Fv5SC4qL76Fe_wk50p=8a069mKJ8ZAyUHMrP82DgvoHAsFg@mail.gmail.com>
Subject: Re: [PATCH v2 21/22] alpha: add HAVE_PERF_REGS and
 HAVE_PERF_USER_STACK_DUMP support
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

On Sat, Sep 5, 2026 at 9:30=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Implement the perf register sampling interface for Alpha. This enables
> perf to capture register state and user stack dumps with samples,
> supporting --call-graph dwarf.
>
> The perf_regs enum exposes the registers available in pt_regs: r0-r8,
> r16-r28, gp, pc, and ps. Registers r9-r15 are callee-saved and live
> in switch_stack, not pt_regs, so they are not included.
>
> A switch statement maps perf register indices to pt_regs fields since
> Alpha's pt_regs layout is non-contiguous (unlike architectures where
> direct array indexing works).
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>

I think this patch still needs kernel-side work in addition to the
matching tools/perf support.

HAVE_PERF_USER_STACK_DUMP makes the generic perf code obtain the user
stack pointer through user_stack_pointer(regs), which on Alpha returns
regs->usp. However, the interrupt SAVE_ALL path does not initialize
that field, and do_entInt() does not snapshot USP. A profiling
interrupt taken from user mode may therefore attempt to copy the stack
from a stale or uninitialized address.

The proposed perf register ABI also does not include SP. A DWARF
unwinder needs both the sampled stack contents and the corresponding
stack pointer, so this cannot be completed solely by a later
tools/perf patch.

Would it make sense to drop this patch from the current series and
submit the perf support separately, including USP capture on interrupt
entry, SP in the kernel perf register ABI, and the matching tools/perf
support? That would allow the rest of this series to proceed without
waiting for the perf interface to be completed.

Regards,
Magnus
