Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793243851;
	b=pwASXAS03v44QWopxUPhqKdl1F7Zw+RW0gZwdL9SyfvH+HJFVRTU9VC92bIt//5mm7zr
	 SK744+gYaW6ZlrD4/Qgi2w0+yIQ+HT2/Sp8WfrHg0fQzyaUf67xPLgILAEA6hqw3n9znm
	 Y4jwc7T1c75leNma0rMANDjKbVcn87me6K0RDgNanxt0AToBVjPCOmvN+q3GhEtiRM1yC
	 eSyValhsUx0w1/mSvKieDIayl4SQFqDgcR5HSNnN8djma5csetPvBMSjyeHEJ7I41Kj0U
	 O26wG1OWZIhhWLZAwA7a0q0V3Xg4EGibMsliob8FtbvuhjZ1aUVWJZ7WM5XEwzn3hTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
	b=HSi08baVIVpuxOvfWRFfPCQY+YcJYEY8pDl1sq59aExWBXkXqMamQG28C8If8uBN7pJ8
	 wsnFskickD/SnQiGic919H2BxU5DuCfzHx51d9YLU1hzgGEqV3GLjkxpxuCUfiEi3yQBW
	 vmeAbMFH6aXZceZIwPFX9Me78W4cE6a2oYh+7f0j7IlOW7CUQjZHSysMx3on2D64BzNmV
	 E6UJi3Uop7Cl7KzENoeUUW7D0zstYbjMSyoyKjK9h60Bg9eQF9g3BejGjZ4VWpk/kZapq
	 mg7b6xmay7AaG79O0eBObbdewzo5guUs1QqKmmIjUZ7xlbR0AnFEu92bSqbVxj44vpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=uAEPxiyG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8D606A31C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 03:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC8D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=uAEPxiyG
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso14785905e9.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 20:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793243849; cv=none;
        d=google.com; s=arc-20260327;
        b=NSlDNySOCYm+o8SSiLegq0s9xAbPYXRkO8tVj2byhKeB/Ui6GLhZnq98+VoBSBj/kw
         D1u/Mcf+1xn6MEnKuTeRCrA6w2/85WUC9l5nWLvNfOoRCqXYpkmHF+aPajTNS2QNxEok
         Hbqs9YjqpyWbBgIIb9GEhvOVSFCuw9Fzm3Ih3zTZMExwQTBlPdYCH6ookLheH0Uy7TMm
         YxqNTD0DJ4ShxeMAQ0jmGXaGEsVOml1vdFGWHX0CIJdAH0EogaytkibZbT9+eONzh8db
         CLHuyYcEvFYH0kGCc8jrdG1pxXk95xBQ964vy8UFD/gO391y2OgL3v0sSxYuNqXIwvN1
         VD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        fh=Ko9ulUzgp3IR743NWMKHrf+KmMuMscErXY/yDUSRR7A=;
        b=csJr6s9IXv9UOayQoAvCso/+FrYkJcSxG+zK0wC0LZivYCqyTCfstDNz6xW8NeYAUc
         KvS/OaxJYP4LZI8MKgWZ1RE97Z1yHykg+mkShX3MRlkHwuhKpxDMkmiYocT/QUEhvls1
         /cjWHYc48jqj8SxboTVjgKHbnvBluGbVhPgNKbRWPO5YHbAKXKw1tWDVBbjH/ZUaFZ4K
         HUia6/lwNbi0+7iAeZM5AYFDTnakx6oMrMUHsuePS4ieqdLV5hugqOXMJbMMwsDYbmY2
         +WhXAeRc4x6f29eywebiZu2PpC54nN/KIrp5ZmHpAo6LggFX3JUFi5IxZ5QOYnCGnv7l
         qGQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793243849; x=1793848649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        b=uAEPxiyGlInTkE+Wmb5BaZ1pHuZp6REPd36Dg57wWZ4UVfl0fMJQPqa8Y4uG6d6lBf
         c9ufxPTbQthy0GpBCgqOrDbt3g/CyBlYJvzl0uNq7nIdKDIArZTJJA2sSRfGgzSM+XZe
         TBrD3ONoqr5J4c2Z8ai7bxRiibb0wTVPoo9eZfwISdO9M1MrpekBMVmRk2aSz4rjK+pU
         Jitq5kPI/m5o4XCjIYRAuhZc88oflH6JvUqwuNRDOwYkxPVDQOFdMiPk1bKAlj+laaSx
         swkFjm82uQp7jxr89pm8HnPGA8j/oPT6ri4h24NrOeNR+ZUhRe8uW3zu1ADZGKt+uZHl
         NYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243849; x=1793848649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        b=FZn5PXLR/LIPX5W0io0p1YgCnvUyj2kMao5cP9B+27K1ZZf46HG3Ukn5ZLzSVNkPSt
         O2KJwly+ByeHQriAuX0jkIcUF4ISofR7HHpnqzgYsve0XuC3+l/d59ujGYa766KmkdVg
         92XTsSCoJlmDUs9n5oIYpzigCZVe0zdzXN6QC/brShvTPtMpC7razUVaNwTdYYqbPK32
         LB1pRxulQB6dN4Rbm6HF4CVL0DXB3I3FZCLNUPxvAdH4sMJF0ma41rqdGzjOCVAPI2tU
         uHAmQt/V9Tqe+HOA6DBL0BktDmpRW4YWqjJBrMYwbU5EwEV4Anou/sTSqb4D7Rse9B26
         +HRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSXQzP/voyPnc3K6JmKvg/JbN2262sANXs/HLPpaDhutz0B4xlyvff/5/u0K62lQ0IdPh7sXiiXlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOia5Y7tVsKOMaT+DIyH+d0yWga/L9NTPCj63oULgDlJPeuJHB
	jtnxoxpEo1t9u1ebX9rIRcIEy7ewGa1I+YC/qAY69aM5JvFLzxanlPZxzV+ejnAJAD5p/m7NSZg
	+Dt0SnDYtyvPyhfzlX29qOP3aJs1RBRsDXuK6qUWpei7jeO5PVcPY
X-Gm-Gg: AYBFou1HKMsLl5qHAA9IUffhVnVYI1itWgawWsA0KM3mP+Fzy/EMJF+YtvjopeyGdFU
	7cP8EOX2bWwUhPK+QZqLuh5TdkEuJB5uRCpkOcJxUyy2IzydP9DwNljHlcVA6wqgUjgMOoQlWh3
	IQ2agoIF5iwAgGRQRoZKuXVWBnR6vnNAAvwFhjg0f+Q+5GaMkqmDDUSqB8mtpBNEVra1PnFp+YT
	Unqem7P+wh05xYhuhTWUdnPAEXrjuKcq/3jlcxcAgls/CGQ3o0sJsHsFbfcDMx66aQ2q1ijlLLj
	VFcifaEcR82QJIhdp29VBtezcznkIgx9oGZV+dNVHkCwxyEQmWI94vBb70hXG+YeKex/8mKgOGJ
	I3Sa7hiQ5YQs5TjUQqvOAPvhUyu4VIyS38zb4heq6NTI0+wdnmLbd/21EYy5MMfLN9nakxB5afl
	EppQUsL30OLhtHPB2D45pi44B8UU96bGRbOY6TZJOo9s3eewMqpbg8P6hgNRz20lT5qrosS3hSz
	Eur
X-Received: by 2002:a05:600c:354a:b0:4a2:74f:46c1 with SMTP id
 5b1f17b1804b1-4a96667c86dmr91055985e9.8.1793243848793; Wed, 28 Oct 2026
 20:17:28 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com> <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
In-Reply-To: <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 08:47:16 +0530
X-Gm-Features: AclHuK-lVk0iiJup6LpFGQOVP7LJYplmMO9EUMDts3fwzO894BeUhVnmdWTPpTA
Message-ID: <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:36=E2=80=AFAM Zhanpeng Zhang
<zhangzhanpeng.jasper@bytedance.com> wrote:
>
> Hi Anup, Paul, Himanshu,
>
> On 10/29/26 12:55 AM, Anup Patel wrote:
>
> > [...]
> >
> > Changes in v11
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65=
cee).
> > Also, tested PMU driver with both PMU irqs and PMU SSE events.
> >
>
> Thanks for rebasing and testing the series. I was a little surprised
> to see v11 posted, as I am still working through Himanshu's v10 review
> and validating the fixes on hardware. It would have been helpful to
> coordinate before reposting so that those changes could be included.
>
> I guess this follows Paul's request to rebase onto riscv/for-next.
> However, there is one change beyond the rebase that I would like to
> clarify: why does patch 4 remove the scoped_guard(preempt) sections
> from the CPU hotplug paths? These were present in v10 RESEND, and
> the local helpers still retain their preemption-disabled assertions.
> Is there a reason this protection is no longer needed?

Yes, this is based on discussion with Paul yesterday.

This series is blocking the whole RAS ACPI support.

>
> The changes discussed on the v10 threads are still outstanding in
> this posting:
>
> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
> - Replace the temporary GUP-based perf user-stack copy with nofault
>    uaccess, following the x86 approach.
> - Address the per-CPU initialization/preemption concern.
> - Split the MAINTAINERS updates into a separate patch.

There is always going to be new updates since it will take
time to harden the SSE implementation. All these changes
can be done as separate follow-on patches.

>
> Additional fixes from Sashiko review, the kernel test robot report,
> and our follow-up debugging are also being consolidated:
>
> - NMI-safe entry and lockdep irqflags tracking.
> - The unused-function warning reported by the kernel test robot.
> - RV32 vmalloc synchronization before nofault fixup.
> - Faulting-PC validation in the kprobe single-step fault path.
> - Per-counter STOP handling in SSE error paths.
> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.

Same comment as above, please do this as separate series.
No point in holding all other dependent work endlessly.

>
> In particular, Himanshu identified the missing preservation of
> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
> I validated the fix with hardware A/B testing: removing it reproduced
> corruption, while the fixed kernel completed the same test sequence.
> This also gives us a solid basis for replacing the temporary GUP
> workaround with nofault uaccess.
>
> Paul, please hold off on taking this version into for-next until
> these fixes are included. The rebase and PMU testing are useful, but
> there are still outstanding correctness issues.
>
> I will consolidate the changes and post v12 against riscv/for-next,
> with an updated changelog and validation results. Let's coordinate
> the next posting to keep everything together.
>
> Thanks,
> Zhanpeng
>
> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.co=
m/

Regards,
Anup
