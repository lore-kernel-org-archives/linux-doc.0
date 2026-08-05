Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7C3939A6
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 20:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785960816; cv=pass; b=ItEwsd71ugpKNzzDu8KkXzISHK1i0/JqHSZuSN/8RMXIIc+MSKyEZVAlkaBqopFY9xrEljEaAcbtiapdx6d9/a4LCG8Nn2ulsfIR1OnzzdSxGGJh4FNzbaPbBW7SHqYbi8kFJj0Q47CZMnEFIwqxxC1Ae8aGnThUTeiW+2CcQtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785960816; c=relaxed/simple;
	bh=g12LaLPJsLpqEtT63cQLavmzm8/ph2Z//VjxD2i0dHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9PfMMBoinJ2P7VSvpDOQKQcRGnmql1zJsMEPEHSgyKTqmViBnEdPog6cKAIQN2T+eovPHZnoV34tGusSZ/ADgFkCaEvjMyarDzUhGhsyo9GZo+GdA4HQDJfst1oJ4v8TrxtvbX+akAnAJjC5xrlko3zCJ6CtJv8C1eoewnw1i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JPxfcJ1T; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JPxfcJ1T"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c15a5b265so79151cf.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 13:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785960814; cv=none;
        d=google.com; s=arc-20260327;
        b=e0plZn7YTtJSAqUbU7phgJ1CxTL+0LX6EEvo4uGuLCDzj+lspyxpAX7a1nI7yb2dG8
         pcvEz0g+hsNZGhhs6NZYCXkC0427TOCwyOyHe+BTuOt7YOZDNNk16Dewf4+1Oba7bIhU
         Bt36Nnal7reM4GFlmMqkFlvl/8SEXHVYo8xZBWZPuB1K0oCghx6w7EsxT7G2+IFcNBZS
         gPCXOmuIcFFVP2PYjMrnGCYT5mV8xLmzfMkFErFxl4INvIhUsQoX0dnSnHVQWou3bQf7
         VWmNvfD1fGrNLssbn34RbvwOBwt2OI15+hCwxqyTSAuuyF0w5poFf4mFD4o1gR1gw5cT
         jIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ADCnc/FtBR+Yt7qlq3IfA9GY1QXXiS1r22j7WPvZmf8=;
        fh=KM6o1TDzoaOWqNZrf7q87C1t8G6HGx8ZkqiqY2RDFzY=;
        b=KjibvmtSt7H8ntbzeI50tgSq50LfGXQ1A3VSKT8NgKkyA7ukuNJF2UNm3j5FO69xMP
         1mpp4mwOxvXhtoFb/9e46j2JOHEulAtAhisnRtJbfmd/pFrLr2e1Mw9h7VvuhPif747Y
         pMvOs0awneaJpDvFpAftTG5NFmt8wBMaQoZ9YjmTO4nFbgTnzpLY51WyMOV7M2L0uKi3
         vt64GBfTBEWgZSYBH92jcaZ4C03TPffscRRXa1YBX2K4fpRhlsIl/H7LIPox+4lyGUjy
         g40ayY/GVwgobJqrqk0C4xckAOrcuLYLI2odMcI1lD66OKOCGBvAUkxGC8C5eesnw+7d
         5j2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785960814; x=1786565614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADCnc/FtBR+Yt7qlq3IfA9GY1QXXiS1r22j7WPvZmf8=;
        b=JPxfcJ1TjyN3ZywU83pf+qPuegPaIOEBF7gCWAcaQksnU9awkU5hVbECuSJ5+RYCHp
         +Gcrqfb5AJfN/VZn8S10fkXDxBVpT7jEimuRHsQUh9Ur/D2T2bUZVPRO+smj4cSh540g
         msls7/kXY54Uqz5nq0xoAbVJObYP0aomMDlL5LhuktsJfAoFxVJewyLWFgHtyNs4BL30
         u7Hlu+fbNzf4/dDJU9iTlmZESox0oWupWPfBU30SFBfsiwMRmA75DBCzAs9Uxz9JHBHH
         0GDwmoteVPOaEzB1NKyEhY9tEanLO131y3RRqGnCSODgfIOhvFshamkCVBUCfNxXZqcj
         FxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785960814; x=1786565614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADCnc/FtBR+Yt7qlq3IfA9GY1QXXiS1r22j7WPvZmf8=;
        b=cXa9oqOgqZhgvYbaEVdXNescd4NwvQfkgNsuomkGXCenf34sTgaSourlsYUPar4Cn+
         Tv9FFg2O/K1Jeex8vKlHVik9lU+EsGgIcgaPumh30NBZbSuoLoPeKnjJET4SQFWHtpG5
         zfIXyj0PGDuFULtgbxlf+nZJU2aOSWmr/z2dmxy3HBREFoaMFB0hlL0JbXthKBYDOPWC
         mIZqpGXzbQo4Rj+pylnHWvdpuMUuZ8NBRG1S9R2MqgX+mk3HofTNhNrESovNAau1m85t
         5JzR6QkOMxqU0r4IZMBzFWjpY/GQ/zQ3TpU+b/ievHrvuNrrJfnT4I/A3Op/D2uovYiI
         DwJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUMqCAXHMwMS4ZHvxgJ7qQZ6qnUqwgN/d4KTEqkTZUiknh2ML+DGNYO3iUSy+jqh3fsSlDXtGDgE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtKqnGGXKTDiIZ+Lq3MvnfC6Bqi16UCYd8oKbCNhQQi+LVtZ0
	Y6cp2+DRzSgwunij6oO7z/wOXLDGFAZzO4AR+qBivBisdqj5oEDwWIiGSRdBUl4c2c4/h/aMw0U
	xt1vpXK16OE6oH7l3yI4ce6gn4/v7dSIIsikPYF87
X-Gm-Gg: AR+sD13LMeMTIXyMmf0uq5PD9JIQvwg+1nOcKgO8ISdADV0e1u1sSi6AfeKebjC7jEl
	tPQIlRkkAH69/TiU+LChKpi/A7EDufQ4mSPoTBB9+r5DAIgTftgF2srCbTUXgPVH1JS5BELmVT+
	7ZnnNyXX5oUB+YyxwPKyya2TYX1B2qNZiM+eNNd7ID3MtqQQdxz4G/P9EIa/i3tfBS9jUP1nUVI
	k1ShWv0W0UChdgOYEfiE53xbY5ijXh0+5KU5kx1jL+K24zEYWaiMe0Q5OeQ6E7Er9xxjVCtmIUX
	kWUZYomhj0KoNP6ihAhxNtM7j95p/dMz9tEj0hydGx7w70SuPu4vwvyfA43xaqFrnI9C7bOTTnY
	=
X-Received: by 2002:a05:622a:9ce:10b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-52cfc0cb726mr4580321cf.9.1785960813363; Wed, 05 Aug 2026
 13:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c795f8089f82841e8a6e00d7ca286da2b23aeb7b.1785950530.git.abhishekbapat@google.com>
In-Reply-To: <c795f8089f82841e8a6e00d7ca286da2b23aeb7b.1785950530.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 5 Aug 2026 13:13:21 -0700
X-Gm-Features: AUfX_mzf39-bsRwpGcBa3cjVj341l4DEa9qZWVyKWwAe4bbPf3pd4npdn87EHqU
Message-ID: <CAJuCfpHn4wkRf97TUUBW5Kr2TbtMy4bn=54VubRFo_b9NSMR2g@mail.gmail.com>
Subject: Re: [PATCH v5] alloc_tag: expose boot-time compression configuration
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hao Ge <hao.ge@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 10:29=E2=80=AFAM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> Currently, userspace has limited visibility into the exact active
> runtime state of memory allocation profiling and its page extension
> compression ('sysctl.vm.mem_profiling=3D{0|1|never}[,compressed]').
>
> While reading the sysctl provides basic on/off status, it is currently
> impossible for userspace to natively determine whether page-tag
> compression was successfully enabled without scraping dmesg boot logs.
>
> Add a new read-only sysctl representing how compression was configured
> at boot time.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
> v5 change:
> - More documentation and commit message refactoring.
>
> v4 change:
> - Documentation and commit message refactor.
>
> v3 change:
> - Added documentation about the behaviour details of the new sysctl.
>
> v2 change:
> - Moved from displaying the state in /proc/allocinfo to a new read-only
> sysctl.
>
>  Documentation/mm/allocation-profiling.rst | 11 +++++++++++
>  mm/alloc_tag.c                            |  6 ++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/Documentation/mm/allocation-profiling.rst b/Documentation/mm=
/allocation-profiling.rst
> index c3a28467955f..b2ebcef8af6f 100644
> --- a/Documentation/mm/allocation-profiling.rst
> +++ b/Documentation/mm/allocation-profiling.rst
> @@ -43,6 +43,17 @@ sysctl:
>    warnings produced by allocations made while profiling is disabled and =
freed
>    when it's enabled.
>
> +  /proc/sys/vm/mem_profiling_compressed
> +
> +  1: Page alloc tag compression is enabled.
> +
> +  0: Page alloc tag compression is disabled.
> +
> +  This reflects a static boot-time configuration of how page allocation =
tags are
> +  stored (in page flags when compression is enabled and in page_ext when=
 disabled).
> +  Toggling ``mem_profiling`` at runtime does not change the state of
> +  ``mem_profiling_compressed``.
> +
>  Runtime info:
>    /proc/allocinfo
>
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index 84c5c3783ca4..b33410310477 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c
> @@ -1303,6 +1303,12 @@ static const struct ctl_table memory_allocation_pr=
ofiling_sysctls[] =3D {
>                 .mode           =3D 0644,
>                 .proc_handler   =3D proc_mem_profiling_handler,
>         },
> +       {
> +               .procname       =3D "mem_profiling_compressed",
> +               .data           =3D &mem_profiling_compressed,
> +               .mode           =3D 0444,
> +               .proc_handler   =3D proc_do_static_key,
> +       },
>  };
>
>  static void __init sysctl_init(void)
>
> base-commit: a946fa1d96648b92c9f37f0488e0e47a85f9e235
> --
> 2.55.0.508.g3f0d502094-goog
>
