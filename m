Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C3F2236F2
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286611; cv=pass; b=HppZrE+lH9dowV5scj74VyPLQkiqFy3eoFy/mHVVAm2zE8mIGuU8jDUDXeaF8LPaJkJF4x4ihyeGPplqppen7xs27vxvkBXdz4tt85qRM41nYhwoXAyE8d0eOC6lpaLUeLsIHKnU+raqDaX13z9pZ3+m0x6vTUCY2HXDVbi1F4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286611; c=relaxed/simple;
	bh=S6quRijRpUFT51EqQ3nik6KXpqTtV6Q1q6MKozapkr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iv1D79Iu0oCWauDjQsMy6ql4/aQAvW90PNGiHtOmRpthe6TqN9BTuNOICkpsilwtaM09qFpYP7djvZriIZFH/JTfovUeVcR++C612SnMU3JYX8CAbWXkqBcvP0fguE/E22LCQAfuinlD+6V3Yk4Uyyy8zyOQSJl9VZGFRNp5EnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AukW893s; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AukW893s"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488879dcbc3so3895e9.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 13:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776286607; cv=none;
        d=google.com; s=arc-20240605;
        b=erYSCi3QihvkxqLkzJIp0XzwwYg07byfskaPqoempBiiqzjpMthv11cyOhTsV3xbcE
         rB77saSuPwbsA3NtAlz4A4NYitgvjOnzoWlyIP8we7I+vpSDoG8kutYgh+BNkLgH3Trk
         R1ADrdevsDCQjHjGgb7kQZ1Sgbd9XEf8/ZZ2NVs265HZ4I4yNe06QMPiz66NQSQmCYDo
         8az6vCCWBAVeBLB0s0BZix8E82ybPHeaGlQEEeck+K6zXCDmJDwJfp8sNX2jnicC/jhc
         1U3GV7e/lWyew95gHFKPyjF8udAtP7iygPYgFTkFssHfV6nLN6BrYzYXUeARJM1WfB/d
         1/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JqmrcX9qSaqHr61SrWlzMf7ZmFlrG/fsUaqnrdHct58=;
        fh=7FE+0PN8SqNlEd1WqnnwI3szhT4Jd9WzlTJTuDZpeXo=;
        b=L3vQ0p3UQ7A2Y+NBQTTK4OjXAWGw08/hu2OBYnJUVOcfjfzo4jqo8lYS5ZDifIT2EO
         l6gJuXoSfKluwv1GtSGvo8j0CY7nWd3tX4OCYLxsmz5B8Llg68wp9jsDYloqaHHvQ8Nq
         0S0xs6viq21Aray1T7ziNB8bDLqwjrEhyTbTx9qkEXFmo1TaadaXvol/gVYn6hUltusc
         TWR+tV29PC+UB0bH8cYXdzQOap0W0Puxcvz7QxeJUWiS5wotQ8DDzWlUzlxk7gmAVcEp
         DCsODgdLVDCOk+9Z+sgo6BIYDdD3gpXDoQ9yhpaxp6oKnySe64vSJONXULWauDTmXEh1
         QC+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776286607; x=1776891407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqmrcX9qSaqHr61SrWlzMf7ZmFlrG/fsUaqnrdHct58=;
        b=AukW893sfLjlrB2Lt39KDdOLGh8p4cgBusiXNCSx+7eSHbDDQoGiTAcomAHhgqsYp4
         uavayzCRFKfMNLxtk67jqyLUJlc8W3x/hlE0FPjFBNF018MmxWeWlow4rQjF+wltyTJA
         5ayrs1QkigJMdJSIXf+ZwFd1CxbBoMpboFLNK+/wxhbE5Ysu2Eg88UWrIdxjTNLkoeyQ
         QvcJKPsFdgxlBdImdozlrpKDLYoUnPR1Nzvv+yQaIoFLnAjkjFJTbuh3hUF4YZPqD7rI
         NmLQe25/bEssUs/OzmSC4BWH96OC3vWfT9SNYSr+cvfmyDrZZjaL9g9plX/7LIsVykXa
         Hqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286607; x=1776891407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JqmrcX9qSaqHr61SrWlzMf7ZmFlrG/fsUaqnrdHct58=;
        b=hvA75kPtTS5wbO/8heuVWaMrCnBrWgwxcZR6B795ITAHHcCHyKRThlW7MsHRuvfCiH
         P5In97c+Gs+fxaotN4xnrDAwiPSv6unFGprAGP0G4ylucDyu4pCHmtp9TjEwjvlxU6Lc
         G+rmhfnpd7EukqXdEqssz7MVaXxZJhn5zAOiUqyouySqCd9dNbbo9U27+7eYtsOFdcHH
         B7h9ibap2PYOA1oU0RSzZjSX69YMR4yfoUBiTeKsj8kG5MP0h+BJ2umAHr8cS6Z0F+Cm
         3fa3OZyu0Jc1TRdbnh/N+l0oS1jbEhYYecR2IzAvxad8y9u3yrCWyKI12yaTmexP8zKQ
         x/oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9We1oJES+3eoHtbPZM0yPMSHBsGqXtI5091k1hg71cjaoBqheE1ON7je3aJjfsx4PCEBDQGk6TCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6t07xIjOP+QzSzaeSS9OJtbVDrlHRgck6fG5BErsaA0WJusx/
	5pxNV8sbp994dCTrM1jJhqVuns/JOwO4QZI/oipT1h1iQ44jS6635Hk0EVzgpSCnZOd4kW44eXn
	9pPAFV+XsuI1ffESYGaSEVPZ+aIO+GiSPk84Gjv9QWoteOs9l763cchwIN2k=
X-Gm-Gg: AeBDieu1UdPAfMA7KxKbxzEUZmh5KKG1vGO8DaqS6oliY2GvCzr54zj7HwxBo64HqBU
	WcXtnscsZIiXtKF8FMBXRoaVBjkr/rmV6/l57j6Gms9UJJUy34CZ9BeO6QvMBeNb5KYvyxWlQQy
	0oI6ZF4VGuJ0Txf2bvVj/eb4jYVL8104UiPOiBA6j8EdOemPGANVvYpyw1RH9fT+0YrE8awqACs
	CUhpOrlOFQPFdC13dxQLHlTa4JISimqp4uzTG/5UDH0d5zMOWEHya4kvxsNe8YltUxjVa5a2XMD
	JYGJVq5TcrMtDR4sfavD2juGy9chR5Ra7FmbyG4+ULlxPQqpC1QEWkMgog==
X-Received: by 2002:a05:600c:32af:b0:477:86fd:fb47 with SMTP id
 5b1f17b1804b1-488f4a9d81emr153385e9.8.1776286606809; Wed, 15 Apr 2026
 13:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
In-Reply-To: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Wed, 15 Apr 2026 13:56:35 -0700
X-Gm-Features: AQROBzC_-yVQi7CjcD3DiHe7zBgEWti0V3awpLyPpMnYVTnD0d4omoeELg1sqHw
Message-ID: <CACw3F51PC0iB6mfbiceQ_Kh242FN8zdXOfTyE5Pa_5+gjTPPGg@mail.gmail.com>
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

Hi Breno,

On Wed, Apr 15, 2026 at 5:55=E2=80=AFAM Breno Leitao <leitao@debian.org> wr=
ote:
>
> When the memory failure handler encounters an in-use kernel page that it
> cannot recover (slab, page tables, kernel stacks, vmalloc, etc.), it
> currently logs the error as "Ignored" and continues operation.
>
> This leaves corrupted data accessible to the kernel, which will inevitabl=
y
> cause either silent data corruption or a delayed crash when the poisoned =
memory
> is next accessed.
>
> This is a common problem on large fleets. We frequently observe multi-bit=
 ECC
> errors hitting kernel slab pages, where memory_failure() fails to recover=
 them
> and the system crashes later at an unrelated code path, making root cause
> analysis unnecessarily difficult.
>
> Here is one specific example from production on an arm64 server: a multi-=
bit
> ECC error hit a dentry cache slab page, memory_failure() failed to recove=
r it
> (slab pages are not supported by the hwpoison recovery mechanism), and 67
> seconds later d_lookup() accessed the poisoned cache line causing
> a synchronous external abort:
>
>     [88690.479680] [Hardware Error]: error_type: 3, multi-bit ECC
>     [88690.498473] Memory failure: 0x40272d: unhandlable page.
>     [88690.498619] Memory failure: 0x40272d: recovery action for
>                    get hwpoison page: Ignored
>     ...
>     [88757.847126] Internal error: synchronous external abort:
>                    0000000096000410 [#1] SMP
>     [88758.061075] pc : d_lookup+0x5c/0x220
>
> This series adds a new sysctl vm.panic_on_unrecoverable_memory_failure
> (default 0) that, when enabled, panics immediately on unrecoverable
> memory failures. This provides a clean crash dump at the time of the

I get the fail-fast part, but wonder will kernel really be able to
provide clean crash dump useful for diagnosis?

In your example at 88757.847126, kernel was handling SEA and because
we are under kernel context, eventually has to die(). Apparently not
only your patch, but also memory-failure has no role to play there.
But at least SEA handling tried its best to show the kernel code that
consumed the memory error.

So your code should apply to the memory failure handling at
88690.498473, which is likely triggered from APEI GHES for poison
detection (I guess the example is from ARM64). Anything except SEA is
considered not synchronous (by APEI is_hest_sync_notify()). If kernel
panics there, I guess it will be in a random process context or a
kworker thread? How useful is it for diagnosis? Just the exact time an
error detected (which is already logged by kernel)?

On X86, for UCNA or SRAO type machine check exceptions, I think with
your patch the panic would also happen in random process context or
kworker thread,

Can you share some clean crash dumps from your testing that show they
are more useful than the crash at SEA? Thanks!

> error, which is far more useful for diagnosis than a random crash later
> at an unrelated code path.
>
> This also categorizes reserved pages as MF_MSG_KERNEL, and panics on
> unknown page types (MF_MSG_UNKNOWN).
>
> Note that dynamically allocated kernel memory (SLAB/SLUB, vmalloc,
> kernel stacks, page tables) shares the MF_MSG_GET_HWPOISON return path
> with transient refcount races, so it is intentionally excluded from the
> panic conditions to avoid false positives.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Changes in v4:
> - Drop CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC kernel configuration option.
> - Split the reserved page classification (MF_MSG_KERNEL) into its own
>   patch, separate from the panic mechanism.
> - Document why the buddy allocator TOCTOU race (between
>   get_hwpoison_page() and is_free_buddy_page()) cannot cause false
>   positives: PG_hwpoison is set beforehand and check_new_page() in the
>   page allocator rejects hwpoisoned pages.
> - Document the narrow LRU isolation race window for MF_MSG_UNKNOWN and
>   its mitigation via identify_page_state()'s two-pass design.
> - Explicitly document why MF_MSG_GET_HWPOISON is excluded from the
>   panic conditions (shared path with transient races and non-reserved
>   kernel memory).
> - Link to v3: https://patch.msgid.link/20260413-ecc_panic-v3-0-1dcbb2f12b=
c4@debian.org
>
> Changes in v3:
> - Rename is_unrecoverable_memory_failure() to panic_on_unrecoverable_mf()
>   as suggested by maintainer.
> - Add CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC kernel configuration option,
>   similar to CONFIG_BOOTPARAM_HARDLOCKUP_PANIC.
> - Add documentation for the sysctl and CONFIG option.
> - Add code comments documenting the panic condition design rationale and
>   how the retry mechanism mitigates false positives from buddy allocator
>   races.
> - Link to v2: https://patch.msgid.link/20260331-ecc_panic-v2-0-9e40d0f64f=
7a@debian.org
>
> Changes in v2:
> - Panic on MF_MSG_KERNEL, MF_MSG_KERNEL_HIGH_ORDER and MF_MSG_UNKNOWN
>   instead of MF_MSG_GET_HWPOISON.
> - Report MF_MSG_KERNEL for reserved pages when get_hwpoison_page() fails
>   instead of MF_MSG_GET_HWPOISON.
> - Link to v1: https://patch.msgid.link/20260323-ecc_panic-v1-0-72a1921726=
c5@debian.org
>
> ---
> Breno Leitao (3):
>       mm/memory-failure: report MF_MSG_KERNEL for reserved pages
>       mm/memory-failure: add panic option for unrecoverable pages
>       Documentation: document panic_on_unrecoverable_memory_failure sysct=
l
>
>  Documentation/admin-guide/sysctl/vm.rst | 37 +++++++++++++
>  mm/memory-failure.c                     | 92 +++++++++++++++++++++++++++=
+++++-
>  2 files changed, 128 insertions(+), 1 deletion(-)
> ---
> base-commit: e6efabc0afca02efa263aba533f35d90117ab283
> change-id: 20260323-ecc_panic-4e473b83087c
>
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
>
>
