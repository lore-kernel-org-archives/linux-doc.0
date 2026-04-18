Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86168548EE
	for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 00:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471513; cv=pass; b=o0WnbiqmkZdVHK7rTSdfzBlDxDDXtQM/CwMTcTdgq1p3ziW7wr9MTR27TQ6dwKAPaQOoVLVZ3Zbz1whdlQ/97VgcNsGjXDECxWMCu0DRIqE2T3GSmzqYa6nA7USwB+iHqF35uMgEMAT1iS4dkHp1ABkuzihBB6AD4xR3t4k62wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471513; c=relaxed/simple;
	bh=JlwGCECJ6DSFk8YaX2zKBqcmk4q9soavw/MvsN4JtAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBivPgvMtVW8OLY/mASUnxCoUMwwSniRbJPUbm55vcBGPJ5BzPvL0DPpoYhyCbsJOO6pl490DDZ7496copkXj65kOyZGG4+jmGxhtCFgIL3UXwhrlChjN9HYpm5wPUkiY6xefW8I7k9N3+H+mtKpkOjbj4F5GNwgr6YtGqfnsqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QMTAbHwE; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QMTAbHwE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so25065e9.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 17:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776471510; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6Ehlg6HK0SB9rk7P0hEWOmKwx8qzI1I197FjUE0hEhhdS3CCJjgvQLtsJnktPntUK
         mhEGdE7Y6YxofWRJxI6LVK/qdni1MviLBMPy6/+S4huWZREFA+PwGn4DajUzYa6/nyDI
         IKG18MQTeVpEK7YHsb+Shxuahna3AVrDNplr4if/skjjbHXUIHUNaDNeFgHwDJ1EUjRG
         L00a2zFvLL0YGkD6yVYwSgNl1wFNeiDEnWkzbUrSCv/b4NxKKfUd2RXnAvGFiPVcfDIY
         Tj//R1UmA6WvWhyi5IpxMq/fvgQIBObGMwmM7qJK1pPwj4OiidhG+hsL1uyH8fewuyjP
         /gYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0XDOzN8q+VPnuTOqcSuLlrTd3FPVemEoMe4PjjgpVEI=;
        fh=KgBKJhcSGGgZap6phKAAFxOJbFLFHSywmqRGH7txLmc=;
        b=IYcZudsZi2Ficeu9oweGOlg+osXNeNHvZGJlU61l86OVDsOWcP1eunbC0bTfLo6tbG
         y1Y+MPHt6D+dpZ48bmzpfhO3PE4dfPV9+IkNrG8Mwvzv6LjmTt3ceOGb7MuQtbtXw4U5
         78+ES2keRQXIg3s0k1CGy+TOpJbed7dc9Iv9inWihCEIpSsDAHtXWJIBNX0OFsdOG6S4
         PRe/eBIa3m/8CYBirdxiGOUJqcoxv1QG8702tkYT0yqePvYkzx1X5g+AV+Y0XlsF19i+
         28VR3LlfLrUYDsItNyIIfV6s1iIfx0Js5eYMtZQfZs7cvF6zyy2rjhbwoTR2U3OHjCwb
         3zNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776471510; x=1777076310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XDOzN8q+VPnuTOqcSuLlrTd3FPVemEoMe4PjjgpVEI=;
        b=QMTAbHwEQCDapwAk2AQw/hGJ5Dm57O2tqKOBqq3XaT4hLqVTWe0UiwK26WeyZZ5NPx
         DZj2RZDzshP8uLqQoC0UXtNzRUgIAL4qqZgrKZNKaElasPBkIwWCbnPfO5rJ4xyz7eso
         WQeGXE0ReasJ64W8YDcD1jKNzALYK5EeD5iNxeiVyKLR+aq9naFY3hAkPSKWbW+KJtMI
         IcThBpcuh7VSuau5sYwt1AH3xxeRx3/e8qT6/ErTZW6kTpIcSLNebqvayQrFCA+tAAY7
         +Z9XO3K0M0nSPwGaAe3T+SxXwqf2tP66G1sYjy2X3/c34oIDEN1jtgky9dv7rCvYu3DR
         75AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776471510; x=1777076310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XDOzN8q+VPnuTOqcSuLlrTd3FPVemEoMe4PjjgpVEI=;
        b=hEyb/gchorah3rY/oiOCIymOJd6Havl04YGn88BJDRU2G2KyNUFOcJOtsU5Hdmfgoq
         N+T2b+DH0sc/LuX2BSA2kVGBol+/qpo3YO5t2jjKEkjMQwpDSJOdE4hl67C6LkzSyJ6M
         uhSvbFGMTE7JmuMGsl3aSDKbMFMwYuylNmGLaesF+GNcJVA2lg6HqT7yiTNUD6tHWL6X
         Ej4Q89UOlfaICLFCJBgOfdVf0P5lVKyZqLLN+wBmVq8ObLR40EBFfUORJuxjkNaZVijm
         TXRvLMhqTzqdwQeh1G2h+F1c0blq0llbGTwh/vSVgQukwNc0LbcAnh8VDgmkkyHmRuoX
         z/RA==
X-Forwarded-Encrypted: i=1; AFNElJ/Jh2hRLMt10hsL7eShufKazqrGdLTEqytKa+YxPZhtkSpkF3t261eFHVCYdhu+izcvkQD9F+K+aXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXLWJUUPoNu0QAKi2HBEJz50cqZPzf3obDINl7q257e7m/zU5
	yzYXltz7hxeDhLzyrpNFLHupvNT6PkUpN/16QVQHwPbPbFZOkmpaM/3O5V1fHP7XbbDZdNy9smJ
	uaAKrENl/w3paZ+RIVsenMzOyEkOVNOMI9CiSXMTk
X-Gm-Gg: AeBDieuVilis2S7QbFwiBBRCnj4x/W8S/6qlafpvxs4LOVpwoP46uLICOb3OhQyikNB
	bCyvpFUWqourPL19zOdByepQDpMS2S2aAjJGz09N5PiruizNgs5VE0sEkblzTovnWl36+lgpdkp
	YB33gn5NRTneGdKOUdVuZHpAwcnpMiiFALaugIgOe6JGHu7h9zLOafGe3Q06kKcIdSSp5wHRDvU
	orkebZTRxL/qiDAv683mK+STpombZuDbF6iAMxn9q6SXDip0DOg4g/mgczQn6NimRA4ahdVi8Hd
	zFr43RhXzaop7Yz6CnvyoD6e8OBvRWjOwUo6gs/4N82dX3piRgTTJC+rk4c=
X-Received: by 2002:a05:600c:6c48:b0:45f:2940:d194 with SMTP id
 5b1f17b1804b1-4890095fca7mr336595e9.2.1776471509536; Fri, 17 Apr 2026
 17:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <CACw3F51PC0iB6mfbiceQ_Kh242FN8zdXOfTyE5Pa_5+gjTPPGg@mail.gmail.com>
 <aeD6hpM3t0RZm5mW@gmail.com> <CACw3F50WYH8Vmd9EXx9+3yM=FU5-1WBkNffkGucC+wSjL+=wFQ@mail.gmail.com>
 <aeHy3-vQTQYJlGw5@gmail.com>
In-Reply-To: <aeHy3-vQTQYJlGw5@gmail.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 17 Apr 2026 17:18:16 -0700
X-Gm-Features: AQROBzAXHoEqSDp1Bccru5-GgBP-IH2eoR8meZyY6rzDuCQOHdZk9YxChODZKHE
Message-ID: <CACw3F516bGtU3Qs57wV6K4vCu0O9ir0s7LJnduFq2aA=ivAbug@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mm/memory-failure: add panic option for
 unrecoverable pages
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 2:11=E2=80=AFAM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Thu, Apr 16, 2026 at 09:26:08AM -0700, Jiaqi Yan wrote:
>
> > So we will always get the same stack trace below, right?
> >
> >           panic+0xb4/0xc0
> >           action_result+0x278/0x340
> >           memory_failure+0x152b/0x1c80
> >
> > IIUC, this stack trace itself doesn't provide any useful information
> > about the memory error, right? What exactly can we use from the stack
> > trace? It is just a side-effect that we failed immediately.
>
> We can use it to correlate problems across a fleet of machines. Let me
> share how crash dump analysis works in large datacenters.
>
> There are thousands of crashes a day (to stay on the low ballpark), and
> different services try to correlate and categorize them into a few
> buckets, something like:
>
>         1. New crash =E2=80=94 needs investigation
>         2. Known issue =E2=80=94 fix is being rolled out
>         3. Hardware problem =E2=80=94 do not spend engineering time on it
>
> When a machine crashes at a random code path like d_lookup() 67 seconds
> after the memory error, the automated triage classifies it as a kernel
> bug in VFS/dcache and assigns it to the filesystem team for
> investigation. Engineers spend time chasing a bug that doesn't exist in
> software =E2=80=94 it's a hardware problem.
>
> With the immediate panic at memory_failure(), the stack trace is always
> recognizable and can be automatically classified as category 3 (hardware
> problem). The static stack trace is the feature, not a limitation: it
> gives triage automation a stable signature to match on.
>
> The value isn't in what the stack trace and the panic() tells a human rea=
ding
> one crash =E2=80=94 it's in what it tells automated systems processing th=
ousands of
> them.

Yeah, in this setting, a crash dump with a fixed signature totally makes se=
nse.

>
> > You can still correlate failure with "Memory failure: 0x1: unhandlable
> > page" and keep running until the actual fatal poison consumption takes
> > down the system. Drawback is that these will be cascading events that
> > can be "noisy". What I see is the choice between failing fast versus
> > failing safe.
>
> Correlating the "unhandlable page" log with a later crash is
> theoretically possible but breaks down in practice at scale:
>
> - The crash may happen seconds, minutes, or hours later =E2=80=94 or neve=
r, if
> the page isn't accessed again before a reboot.
>
> - The crash happens on a different CPU, different task, different context
>
> =E2=80=94 there's no breadcrumb linking it back to the memory error.
>
> - Automated triage systems work on stack traces and panic strings, not
> by correlating dmesg lines across time with later crashes.
>
> - The later crash looks completely different depending on the
> architecture. On arm64, you get a "synchronous external abort". On
> x86, it's a machine check exception. On some platforms, it might be a
> generic page fault or a BUG_ON in a subsystem that found inconsistent
> data. There is no single signature to match =E2=80=94 every architecture =
and
> every consumption path produces a different crash, making automated
> correlation essentially impossible.
>
> - Worse, the crash may never happen at all. If the corrupted memory is
> read but the corruption doesn't trigger a fault =E2=80=94 say, a flipped =
bit
> in a permission field, a size, a pointer that still maps to valid
> memory, or a data buffer =E2=80=94 the result is silent data corruption w=
ith
> no crash to correlate against. The system continues operating on wrong
> data with no indication anything went wrong.
>
> Also, I wouldn't call continuing with known-corrupted kernel memory
> "failing safe" =E2=80=94 it's the opposite. The kernel has no mechanism t=
o
> fence off a poisoned slab page or page table from future access.
> Continuing is failing unsafely with a delayed, unpredictable
> consequence.
>
>
> > > Isn't the clean approach way better than the random one?
> >
> > I don't fully agree. In the past upstream has enhanced many kernel mm
> > services (e.g. khugepaged, page migration, dump_user_range()) to
> > recover from memory error in order to improve system availability,
> > given these service or tools can fail safe. Seeing many crashes
> > pointing to a certain in-kernel service at consumption time helped us
> > decide what services we should enhance, and which service we should
> > prioritize. Of course not all kernel code can be recovered from memory
> > error, but that doesn't mean knowing what kernel code often caused
> > crash isn't useful.
>
>
> That's a fair point =E2=80=94 consumption-time crashes have historically =
been
> useful for identifying which kernel services to harden. But I'd argue
> this patch doesn't prevent that analysis, it complements it.
>
> The sysctl defaults to off. Operators who want to observe where poison
> is consumed =E2=80=94 to prioritize which services to enhance =E2=80=94 c=
an leave it
> disabled and get exactly the behavior they have today.
>
> But for operators running large fleets where the priority is fast
> diagnosis and machine replacement rather than kernel hardening research,
> the immediate panic is what they need. They already know the memory is
> bad, they don't need the kernel to keep running to find out which
> subsystem hits it first.
>
> Also, the services you mention =E2=80=94 khugepaged, page migration,
> dump_user_range() =E2=80=94 were enhanced to handle errors in user pages,
> where recovery is possible (kill the process, fail the migration). The
> pages this patch panics on =E2=80=94 reserved pages, unknown page types =
=E2=80=94 are
> kernel memory where _no_ recovery mechanism exists or is likely to exist.

Maybe, but I won't be surprised if one day someone comes up with some idea.

> There's no service to enhance for those; the only options are crash now
> or crash later, given a crucial memory page got lost.
>
> > Anyway, I only have a second opinion on the usefulness of a static
> > stack trace. This fail-fast option is good to have. Thanks!
>
> Thanks for the review! Just to make sure I understand your position corre=
ctly =E2=80=94
> are you saying you'd like changes to the patch, or is this more of a gene=
ral
> observation about the tradeoff?

No change needed. I just hope to get more clarification from you on
the usefulness of the stack track, and I do get it. Thanks!

>
> --breno
