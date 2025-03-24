Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3022A1411DE
	for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 18:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742841658; cv=none; b=j25xoXyqzUviWbwbC/VSkr3dotuc0xLZACHnYctW0WJP6SM+wOCu+u3FyF0eTO4g0NANLhhwEZBmcsyropC00obe0Lrnwx8p3cGJBnd066L/Ps5qBBFCJlWcCG7Xkdj5SpUS4e0vndN78NMGRinvn1WOvNYP8Anx6MKd9pONNyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742841658; c=relaxed/simple;
	bh=f4DdomVr0nagMtgc+/I4m7RjU+SfBMD1Z8bRaM4ug24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhMgszscpXkNPPhfATMfJ+VMrZxxoRyWE1u1bj22EeVZhYWFa2ya2x9LAbPWdUFvPCikJjkPsWmBOyDaahBRcLKwc3EBx0BZnGphTVoslfVugDJHx4fIjXbqKsWf7AJcMiv9QLQgNNDpjxRaBnwnxCyRZd6inMJ9k4XjRNQV57M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FVWcJ/DA; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FVWcJ/DA"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47666573242so81991cf.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 11:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742841655; x=1743446455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVFFcWh5dZoKRR9sK5sDoRV9h4cdUzLL2+BzZ81kSD4=;
        b=FVWcJ/DAyPeQjruz6D0IltEw1GE2o5uBRFsoT1jO48Qw4gOTOLTyG6rbPCL/7ZoK7W
         zIs5woQMJhmqkx7tWt+t3+tlwxgDvnievXBp2csINaHtd7S0yhsFAJqu64AIoxl4xSuu
         d0GPi4R2LjoUW7GwtdnK7r5b/+5e/FRTraE5VU5iLHrvOsq1+ARUKHGZradRVsUEz9u9
         W2kFWIfTeplAb8TEOUrIgHrSJnRs09QMNX/xSNritvK40SfhcjwIdD1QetKu+QdJZ07d
         fwAB4driL99492Fv++wB6axZSRH2SMseCinuu8SSSSKL2G5Vr7dVWztsKmpeZXiSa0WW
         Ystg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742841655; x=1743446455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVFFcWh5dZoKRR9sK5sDoRV9h4cdUzLL2+BzZ81kSD4=;
        b=SRqMXdtjTRXiQvwJa2Tdo5qhQWjmTeV0U9uXbB22au4rhyBTFUYgJ4Lqztf26Wf1ZG
         g46XhM80UkauQX8tZYE1bmY8cGQGC2R2zCBHiHh9JEN3M0XQ8eoUkO9/4GrjzV+c7bxr
         zLPJE++PvVecwN3aqC64frhUX2xofhSoFtZBtQ5ev4ME6dOsXCjlUx4nENLOb56Aw6Na
         u5VJBpqf+lKkzzeti8cNcn647vidaVLVa9pSvAYMxCI/hXrpoQLxdGh7fT3Xv4q66E00
         ADZqmeYF7VzZaOzfEE0X6EySmqdkOtVtspJ5+dWQkIqp49+NTYgNuYB67KsvYxzcur3G
         e6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUBSCxCLZ29AKKU44PCrsW1htAQFrX+zn8A1AjVDSjdw06suFgNnBymZqkfAWqOEVhWDq0lNdjXPnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ53mKzWq69inK0Zy0h3o0kP8gzzSIfLtYQvmYSXWzbXfufqyV
	hlrqtXJbTkvoblvs+hpF7t8jR8xlyPUBcTXbOvY0KQ42kFtSxR1mSpxEuUSlsPYEd5AsVpGn7h1
	9x17XgJ9V3oKzdFw7HBGkbCfftcjgXyyLaDwM
X-Gm-Gg: ASbGnct2AFADerKO4GN9lbix+R8SG7otQD9uN9Z8JKD5E8N65N60WaOcUTqoa5r1hRT
	4YqZcPRAwggneUMZ0BIhXSUHHVu4reYGLj1xDR066+03SV94IxHYQIehBjopDK94tr0cHVU0pre
	CNtWK647NSJ7cLsw3dXuMXeCs=
X-Google-Smtp-Source: AGHT+IE5+gZ94fZfEMa4/mu+5y69Keqgf6GYglfVDQZk9TGfgwTjD/V2nGDREwNflvI0c0qaa+IqDh+lZikxQgFL/jU=
X-Received: by 2002:a05:622a:17c4:b0:475:1410:2ca3 with SMTP id
 d75a77b69052e-4772be23f26mr9607281cf.15.1742841654660; Mon, 24 Mar 2025
 11:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com> <20250320015551.2157511-8-changyuanl@google.com>
In-Reply-To: <20250320015551.2157511-8-changyuanl@google.com>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 24 Mar 2025 11:40:43 -0700
X-Gm-Features: AQ5f1JqgK3t9nzg4mdWiXWpH_sA43D2BNXiBuTZpvx6PAjAQCpPGjdYAtW64c_s
Message-ID: <CAPTztWbFXajArSN8yKu32eSoR=xsk1CHM_4V7MJ0eQxydFqPUQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/16] kexec: add Kexec HandOver (KHO) generation helpers
To: Changyuan Lyu <changyuanl@google.com>
Cc: linux-kernel@vger.kernel.org, graf@amazon.com, akpm@linux-foundation.org, 
	luto@kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Changyuan Lyu <changyuanl@google.co=
m> wrote:
>
> From: Alexander Graf <graf@amazon.com>
>
> Add the core infrastructure to generate Kexec HandOver metadata. Kexec
> HandOver is a mechanism that allows Linux to preserve state - arbitrary
> properties as well as memory locations - across kexec.
>
> It does so using 2 concepts:
>
>   1) State Tree - Every KHO kexec carries a state tree that describes the
>      state of the system. The state tree is represented as hash-tables.
>      Device drivers can add/remove their data into/from the state tree at
>      system runtime. On kexec, the tree is converted to FDT (flattened
>      device tree).
>
>   2) Scratch Regions - CMA regions that we allocate in the first kernel.
>      CMA gives us the guarantee that no handover pages land in those
>      regions, because handover pages must be at a static physical memory
>      location. We use these regions as the place to load future kexec
>      images so that they won't collide with any handover data.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Co-developed-by: Pratyush Yadav <ptyadav@amazon.de>
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> ---
>  MAINTAINERS                    |   2 +-
>  include/linux/kexec_handover.h | 109 +++++
>  kernel/Makefile                |   1 +
>  kernel/kexec_handover.c        | 865 +++++++++++++++++++++++++++++++++
>  mm/mm_init.c                   |   8 +
>  5 files changed, 984 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/kexec_handover.h
>  create mode 100644 kernel/kexec_handover.c
[...]
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 04441c258b05..757659b7a26b 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -30,6 +30,7 @@
>  #include <linux/crash_dump.h>
>  #include <linux/execmem.h>
>  #include <linux/vmstat.h>
> +#include <linux/kexec_handover.h>
>  #include "internal.h"
>  #include "slab.h"
>  #include "shuffle.h"
> @@ -2661,6 +2662,13 @@ void __init mm_core_init(void)
>         report_meminit();
>         kmsan_init_shadow();
>         stack_depot_early_init();
> +
> +       /*
> +        * KHO memory setup must happen while memblock is still active, b=
ut
> +        * as close as possible to buddy initialization
> +        */
> +       kho_memory_init();
> +
>         mem_init();
>         kmem_cache_init();
>         /*


Thanks for the work on this.

Obviously it needs to happen while memblock is still active - but why
as close as possible to buddy initialization?

Ordering is always a sticky issue when it comes to doing things during
boot, of course. In this case, I can see scenarios where code that
runs a little earlier may want to use some preserved memory. The
current requirement in the patch set seems to be "after sparse/page
init", but I'm not sure why it needs to be as close as possibly to
buddy init.

- Frank
