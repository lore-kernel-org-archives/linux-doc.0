Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB7D1DA21
	for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 23:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747695738; cv=none; b=ZXWuFRdTfSLDGGRf64LGNVL0fR0vSPHPSfEGU8cA97ALYyshlhUOYaOGviBK3IxARBIl/5roBTVpTM1VzftXdvoaYe5qQWSjFAVn5lT8C19dvfkE4uSBSpjnlJYLu9Xn13wsc/vcs4fDJZmxQtL2fWJ5IicnwOhywI8lThLK3WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747695738; c=relaxed/simple;
	bh=/duCFBqY5JHMwEJoZf6f1TId0+l+aT+WHdLaqtr0MlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYy7nu9t8vNc5bXxJqgpyS9YIWGtLqCttZCGauBNr4ZATS4c+LFLwoxRlegiQSrlcTgfW+GvGtZ+uczVtRETDlR7ugctiJsNckQjFYux3xA7ZbiIbnL7jO6ePc3860IOHzYuA2bAvzuPgEsHZn0KD8dqoAuEPl2Cq5r8kUhBqgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NDVewZVu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NDVewZVu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-231f37e114eso550995ad.1
        for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 16:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747695736; x=1748300536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyaMW3YnL8dxSR9YGZVP1MVY4WM8HmD2ftDSEfSqEoo=;
        b=NDVewZVuK3yQjvj62qmJ4xrxyGDXOf/VgXalkhX1K41bUC0bIp6O4XaQRhU3mtYlcr
         b19xglQTWLcw6/zEEg9sOp+5EJQqFUyw2nYobNMFTa2RQd+yQtBq3O1F741OUPYAYc5G
         ZRRXoptcqGXSlvj2dbc3SPGGdP7/R6czjKfQZYMWKZuRx0lWJby7AhLplAqi70jr1Wmr
         XK+dsojWvgZBnrX/E2gRiUyPhrGcVKOWayaejx0SSs4IrX/X3nQ5157y0h9ZYfoSs6lE
         ArtkWLpY6rRqprVkCC90ACK9nG+3CrrYeiaUK3JQh7MX+dItKBw0qKG1hhnM3JarczrQ
         7ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747695736; x=1748300536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyaMW3YnL8dxSR9YGZVP1MVY4WM8HmD2ftDSEfSqEoo=;
        b=Jblnn/nYkEm0LudlgfYIms3uTOXGkwHUXGxCgc3G+6K0Y+s33zgbuEpuX/Y7A6RUz9
         zSRAPKXGsyZf94gqJgNTiVnq/tHvFaT1SwD88cdr62x4/Im0AH7BQn1w83clgoknfM1O
         yjVOwul/VWfC1kuKHOazhjU/9jo7Sw7M5fqEWQzbMNEMfKOMr18HymVX+5/V2AuEm8Jg
         lJAfoWis/A28TRlcNNz7Pm0wsIuP3AJd+LXOBHFnCCoFELjahLEC9N5JiZAEZM1F7Psh
         SLCSIdvFqO6ZsxQ1JWXEgonC70fnjNtU9Hn+JaQ1CCqYFmvm98hMlF9flYvEnz0jglz0
         qZaA==
X-Forwarded-Encrypted: i=1; AJvYcCUMYVdwagJ9T1AtK+JYeBz89dpmQF9R1ustSBxWDV0TMlnPOeGWyhyQwqFwbnLiHRLGEo3EvAhMxss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy46WyndZaXi9HUbsbfml82Bpb21OkIBgFtXjOzQu1zooPR9Djf
	WLc/ifsNsjyl0SFDKLQxrWOFP+/5AYLZPzT/gt/l5oLmsDOtxApleBtI2Ib62lozaW/JemQNFLv
	6CbV12qF4+WfacNE0uWjfohJpD7NTxvcXIaJ8dEDi
X-Gm-Gg: ASbGnct7zxBtj0aQ46VG3HUjZoFkWdrRzJlfWIZqHbmwN2kuQzIh2UvYnmzCOXHtf7H
	nw46gm7NEdUFW/5Q/IcCxt0g0qFS6IflINklBtr6dXrO1m/fjbpQBY/2RcJ20KYoQIwczwqFc8F
	y4UVwROHuIzMtEaG+ubN2SnEN0Cg7sWdNeJC5TFmbqkUQCgQZGNVKgCugBbzJb7yYlSjr9IQ==
X-Google-Smtp-Source: AGHT+IFyhzMkw7zfyyfYLmD80LM7R0cR1hZ6qXHuS5eIOZloBdSNOgxKfQw45G4L1ZduEeD4yE5D+RqjwHqqqzokzqg=
X-Received: by 2002:a17:902:eccb:b0:223:ff93:322f with SMTP id
 d9443c01a7336-231ffd192c0mr6122555ad.2.1747695735416; Mon, 19 May 2025
 16:02:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519223307.3601786-1-usamaarif642@gmail.com> <20250519223307.3601786-3-usamaarif642@gmail.com>
In-Reply-To: <20250519223307.3601786-3-usamaarif642@gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 20 May 2025 01:01:38 +0200
X-Gm-Features: AX0GCFulMJL6rHKVKOHsAtmVvnT8L9uZ6HQMSQ0zMLUP4ee-O2FJT6ANlZC7bh0
Message-ID: <CAG48ez2y_PP7Uba8uq_Y+auKRUHPcJ19Nnn15GAaVS=M4DC73g@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] prctl: introduce PR_DEFAULT_MADV_HUGEPAGE for the process
To: Usama Arif <usamaarif642@gmail.com>, lorenzo.stoakes@oracle.com
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com, linux-mm@kvack.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com, ziy@nvidia.com, 
	laoar.shao@gmail.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:33=E2=80=AFAM Usama Arif <usamaarif642@gmail.com=
> wrote:
> This is set via the new PR_SET_THP_POLICY prctl. It has 2 affects:
> - It sets VM_HUGEPAGE and clears VM_NOHUGEPAGE on the default VMA flags
>   (def_flags). This means that every new VMA will be considered for
>   hugepage.
> - Iterate through every VMA in the process and call hugepage_madvise
>   on it, with MADV_HUGEPAGE policy.
> The policy is inherited during fork+exec.

As I replied to Lorenzo's series
(https://lore.kernel.org/all/CAG48ez3-7EnBVEjpdoW7z5K0hX41nLQN5Wb65Vg-1p8Dd=
XRnjg@mail.gmail.com/),
it would be nice if you could avoid introducing new flags that have
the combination of all the following properties:

1. persists across exec
2. not cleared on secureexec execution
3. settable without ns_capable(CAP_SYS_ADMIN)
4. settable without NO_NEW_PRIVS

Flags that have all of these properties need to be reviewed extra
carefully to see if there is any way they could impact the security of
setuid binaries, for example by changing mmap() behavior in a way that
makes addresses significantly more predictable.
