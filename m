Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5166D42E016
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536831; cv=pass; b=SvmtsSPXJgkwJkF+RZ2MEdneutGbaCVoXWDy+Gyu0Whpn7MgEsoR6NrSQkXkuA6eL0HPnxTGSvBJv9fLzuU4Sd1vkmH1eSfH7lK0qNv/TNA0zpEc1NQzy7GQ6oo4VCOE01c/k17U3C4Xi9AWI2uynrUh6om4MeJYXM6CWfJmco0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536831; c=relaxed/simple;
	bh=wOdVetkLvbx0KrzuYwC1YhLWHB2QyWCjfnt49tnKb+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRP2iHujqRwl6+ItKR90dwK1p0FHLvhWFgHxwerqZCdmBIZqvsefowfpDN+h//Zvm02+idTxTBTafDtdBG8ipL4Gu+bIa8SuifhO6MgUKlhq/u7j2+VS8trJXZgm1oWLHxIT3J4NU3LCYY54NGtTImGqUzsUSHGYWHM5Hunz/EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3EYRPWj2; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3EYRPWj2"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-899f5d337f7so23775546d6.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 03:20:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772536828; cv=none;
        d=google.com; s=arc-20240605;
        b=lF7TpyLIyPi9TjIj4PK8LE+gnDpXRv229YPCHU6yFp8zEuabLFEhoWowcfalGWEWnr
         o0WZInIM7jZvzMJbUQXZwNel57uE1/v1toXuCwq1GNMFf2Lsm3YRcG0XTyjsZrP4vqNd
         IE99I4gTM8PoKDiw3E8k5ZdOg8zjFvrXmxt0GVjoQKxtDwto022vUxkLW4ZxIOb/rNja
         +2VnmdhGbNZkr9vfLgu3PkQ/3oT+zdMWHwdvxvKK0tZzzzH1Yy9f4MVZ66S8vfOzQTcu
         7jqgmBGwfYgYjcAtIhEG/IYBahBiXxPOrp9CrLrov5sOv9wpQiiUxFYZsMLlZHrCabzS
         QCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fs5xy54dOwpapJM1ABjgdm4o/gqygsmCGVNWqgWoRQE=;
        fh=JMM7Rzex/2Tk5E9sanypdQJqpjukNfvUSp5LkyTNVsI=;
        b=PosvApI3871aK54c+4Hd1RKVfJ4XIH9UwwM+0T0WxBAag6pfhWwP33P16z6JLiqBd2
         P70voMJPKMaADX39IXB5iFC2MTx/ZcEAkssz4MQEoIVlXlOi0q2msSl1LZGhX8lObMH1
         YmERSgnNP7pDRpvBLhZHBEMSWBx/IxtDcKlD1gKyHA23QncYpu5yZPTZmCEwV7Pv7x5u
         eHArWE/DTTsY0NEyz0l3bsGu5anFXTBAGHiZbIaOh/nD0FKYAnInlktepyej5KYafRBf
         4Ny1BEpO1LLpN9aoGFLgU02/iX9WBpAmniHUjGZTmgVMm42zfPJcGrDDdtZGWPLLKGN3
         RFDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772536828; x=1773141628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fs5xy54dOwpapJM1ABjgdm4o/gqygsmCGVNWqgWoRQE=;
        b=3EYRPWj2mG97ZpMbZBoro6rxMolw+XEZvArwlAAVyrvYK3zXCXMg2VEIQ/W5cKvFfK
         UrW4WMGJTCFrVgaDAsBI7x4fQZIXdaQPGEzYDkhdrGEFq4ZJq0j42CnHNodCE3DZinmv
         6MxOeOcmf78wistGqJNG0/wrf8FhmaRiY0tLGqHa4XhwIqW6HEgvuJz2/qK3FqK16W+B
         Np4xnPHltVGIMkXhcyhXW6C4f5UL5cQDvIIpy+142BbB6pKAUwjc+VYvKcnQwqBW2fgT
         1HQACkZliRJ4olmTdCTKDlLC46S9pwgjWBUIMnJ1BiccYWGvpNLr5z2CpymRvSWpKlQ7
         EtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772536828; x=1773141628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs5xy54dOwpapJM1ABjgdm4o/gqygsmCGVNWqgWoRQE=;
        b=BxEXXUR2OS/Zy+w7fkd+AOYLunYVZ/CCM6hTW7Ow48hm/PJLoJX1vgQAZFafBf5Hm6
         xZYOIj4hHo/6GGtFbA/kGN8cBeks4E8d9U/OT4VQPktfUhphKkrDQYb/zOdNFoHyh5s5
         JLGBhyFsmICKE0u1h8LvWNW/MNSS8CNr3HUlsIQI3dFY3JBE8I/eVKHxkyHnssnQt5Wa
         DO1nZ+bWC4RXXCzNux8rMKluYkLFAsAMyrrnyupj/LA9ePpgleLbJkOnjXX0reFe4sSk
         SJcvMuB9eYiay510KOblaUw6GrB3zAGf5XAwhS79A5Rb6S9ErLev1jMHqYZZLNyNHvzr
         lx6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeyU88mJZvWmSkAyACeSo5E02Lagwv7oNN6fzYIDHkpqWSPaMlIyL3pYyqpnL7uz1B12ixe9M2lxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp09pPRZlX9Ymp854pO3TJ3AyAB11GePNKHEF165quf3EksZTB
	FnRsqKajy8Q6G9WG+OlYpIqYrQNbtFQekMISNAPjH8SL0/kuNiDmlw0gJzGiI3c2VuhIhsLHi5L
	oZM3BLwVlgEF0+KFNDMAaraVhx39BsPPz2NEovblG
X-Gm-Gg: ATEYQzwRB2D3SX/8av5EIKvmH235qzVEAEuUl0abqmHPXT/L7dkOMdOH3p9iYe9WEac
	8xxKwks9adVrfM0dj7Ae7BsHDred/ljDBPyeQPvlZIxqF6QrYlWL2gQqGVmigjuSnGggYoBsRIf
	PDqB+m4ymx1aPbaXDTPaDdjwztaxHn4+BmMq+JITYGfpwElVw6nzEPfVit1ewX5qP3iO43CC2oX
	aKL0NcfGSxMT4Bk/YodCBSR64wMqChE1JkIGFaE0xXkFcjEq0A4cS1+wYprfVUHqFAlrD3wT0GR
	hlri5lJ02f7ik7YvK7+mcaINuVj18ZF+GF3e/N6GNnpOvdtA
X-Received: by 2002:a05:6214:dac:b0:895:4d3f:b6c with SMTP id
 6a1803df08f44-89a0a89d396mr19056596d6.17.1772536827672; Tue, 03 Mar 2026
 03:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225203639.3159463-1-elver@google.com>
In-Reply-To: <20260225203639.3159463-1-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 3 Mar 2026 12:19:51 +0100
X-Gm-Features: AaiRm51ecwm2GzpvBNPquu22Ta0sfwGcKpcC_V0mxDSrZBLMaa5eBCNTn_slx0E
Message-ID: <CAG_fn=WAwHUpoay2kY6rkEZQGYxoDGVJYf5B59Y80ht7++Lmqw@mail.gmail.com>
Subject: Re: [PATCH] kfence: add kfence.fault parameter
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-mm@kvack.org, 
	Ernesto Martinez Garcia <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> @@ -830,7 +835,8 @@ static void kfence_check_all_canary(void)
>  static int kfence_check_canary_callback(struct notifier_block *nb,
>                                         unsigned long reason, void *arg)
>  {
> -       kfence_check_all_canary();
> +       if (READ_ONCE(kfence_enabled))
> +               kfence_check_all_canary();

By the way, should we also check for kfence_enabled when reporting errors?


> @@ -1307,12 +1314,14 @@ bool kfence_handle_page_fault(unsigned long addr, bool is_write, struct pt_regs
>         if (to_report) {
>                 raw_spin_lock_irqsave(&to_report->lock, flags);
>                 to_report->unprotected_page = unprotected_page;
> -               kfence_report_error(addr, is_write, regs, to_report, error_type);
> +               fault = kfence_report_error(addr, is_write, regs, to_report, error_type);
>                 raw_spin_unlock_irqrestore(&to_report->lock, flags);
>         } else {
>                 /* This may be a UAF or OOB access, but we can't be sure. */
> -               kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
> +               fault = kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
>         }
>
> +       kfence_handle_fault(fault);
> +
>         return kfence_unprotect(addr); /* Unprotect and let access proceed. */

If kfence_handle_fault() oopses, kfence_unprotect() will never be
called, is that the desired behavior?


>         /* Require non-NULL meta, except if KFENCE_ERROR_INVALID. */
>         if (WARN_ON(type != KFENCE_ERROR_INVALID && !meta))
> -               return;
> +               return KFENCE_FAULT_NONE;

We explicitly don't panic here; guess it should be fine...
