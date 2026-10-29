Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793243208;
	b=i7DPCimNNOAW7Am/O5QZ/JE1G17nhIS78AWJjV7x/xL6yn+vC1WLrE6BskpGBK6VykL8
	 Mu9qiLEpP6ra0ckRjih0dm1jPBKXcsAvouaXSc3PuG1FodtmtZh65IdREAbQb6GRyD3Wp
	 529Mp4hhmQ8oB7UakC4SL0OxhJNi5o5o5XuD0wGPo4R8vA63LeIY5CZxVFbb3eidZXwPe
	 pxK2tk9g3oB92RlyZUB5Jj0EFoThMZuzIhbW8VNm27txvqPIZn0PJc/UIojDNaYsyGF0w
	 YhYtrtpefF0IUxljqdKe4h560sV16sm7hMfsgoInlnlUiKiAEk6vdj95hvs6SYrgFcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:User-Agent:X-Original-From:References:From:Mime-Version:
	 In-Reply-To:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
	b=R5ce/autOwXmqThc2VQzEDJkqnpmJAzFqYwWP2xaOf5BqynCYPNq0emWPwDFjVQBeVVH
	 xVHgyoGeuPimPCaF+sdJFXHYl8WMMwskXPU8y4rSgoBYpN4bBt/EDtbW40925xagUevac
	 5bHGrepFPK8TivkzaIadzdaUyrMp9/UjAaMPiMtC2EYLcz6/MbnGobjDXK4QRUlIuj2Lm
	 KsEiMZyOZnyhTSbsHVW0JubTcjAxtzNZFGVMO/9WKFruYn8++zuf5/C2vVeP3Pe8q7gmD
	 g5PCiRX4WBB1ot/wg9aGOqDHSe4ISIsFusQoiD+UnzDv9rdDY/cf/aquJFRLt1C12AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=h6ziHXdx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9B7606A31D
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 03:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9B7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=h6ziHXdx
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso1727981e87.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 20:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793243205; cv=none;
        d=google.com; s=arc-20260327;
        b=eJKrQVVSYvfL3ozSRcCpkVgQKYWLhTxZR9RzUr47PeyaU6peu+wUJSfLINsn/Usvqk
         jDboX+MOTrZw5wK8erTi/c1e8m2BGiZU9CytG8AbVxMP9lFgGcVk2sds3CcUg/lkMg7+
         qsFYRlvoeWumlLchJA9fVhZj6YI7GzOWPmeY6daGsrnFWVf8qDFd5blLtdBPF5oTPm+U
         gIh0rtpbjH4XXlnKur9F46buqqcAKbpo8iiHpHvGxXP/vumt7dpAxeLWix3b4z1LueWZ
         /3GcfXBL1Ra8xOzWbRAL/kamf1kM63lrJ7bRWsr1a2ZFXRAXiXcvlS39qJ9qbectsfzl
         47+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:from
         :references:user-agent:dkim-signature;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        fh=mFyBdSZvKH8+s2wZHp9NfAC9BFxSSKRYojI3md09VuM=;
        b=Vj4ZZ0fytnUinsWWYniA0nXUd/SxMFqN7oL/lAHBCIiKptfpzeFLZMRPygNAMGjagZ
         DeRtmhFxEm+kx5ClCRkWLq2FULpDEXKkR4tN8UnqVuunPUo45hQuuT4d1ir71PV4isxr
         gnb3j6WnMJTRq/0cmqmsaRSuCweaPfW7Tex6DIh5gtcE+4N/KU3guZVNbzOi3gqEhY0H
         awLKEEROpqledZ7UXmPccaLAemRrKij7NeiKGG5BBOwhhtOpKCi3t475Q+Rc1mV3yIPu
         6yVfMTwlIW2nQQ8ikyTF1v1gRQ3wCq1no7+9VkHokV/XZ+lwmZ2bIrol7CWVp10oTyOS
         Cabw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793243205; x=1793848005; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :from:references:user-agent:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        b=h6ziHXdxperKw0FMhtwDYC/nSyqfN66VH9iz1mtw8jkUEvdOawkjO1VfElLR2jSpP+
         jqqjO8GakTohp8gam+tBwY1/eCqNz745YmdHtDmysTJhQXVQk1KHkqHBuCjAG80VMoKr
         UsPvcHWdqdCDP6IdasdeBSbB9R/wSwCgEerazu4r+/iYkH4qZfT3rDsaZKzZ4RWfMayf
         CQDQBq60IHafmR+XVjCAYc9Aa0nv2+nvmQ2rc7Vfblp0ZCQcn3mnB361DJv5d9I8chlY
         w+bLmgtYklxeK9Yg/5NDZrStW1Ky6qVVfdEvSOpUq9D9p/9XftRnMGkcVdvm01gl2an0
         OvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243205; x=1793848005;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :from:references:user-agent:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        b=XyGpEuwU8SpVOFtF0bRvggcBNKQdDSazTKgPNTih5mF6R72F9PH7IgDA+5UDBYCeqg
         vUPdIPaxhul2HCNfUhaFsZ396lS0vbGKFqXQUgdqaSNyNSm/ceIaUumKFE07aPBNXt5o
         5BJEp51GWznOkeHO+HsCT1Si1ERTe0xHX1/W5pXvK2qzzYuVCY0/4XyAO4rzISeHt8UR
         zZgQqW/P/NRKpRCHVsk455QT1t9+jCr4v2CKOPdVHclJMoQOXpQaX5Ye7C/b0dESowSY
         eOKtscpkmdcXzXDXcUcAAwDTsS7LWn7Cn6D2ot1/ZyeOfkcO4mqphjgkM4LIIyf8zDl4
         vdPA==
X-Forwarded-Encrypted: i=1; AKwUvBzBDASp5MT4n5bZ/eOHr4qnbpJ+imTY++apCRWnruaWSjLSJpZ2sR9vIvqlla5VAV+aJ1U7cDQ3Od0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBMVP287XYwwPGCJBc45vNIe1Itx9grSE4Nj/R/HYgf1GpNv18
	FWDpz95K342ZVpgSLzxv2qpBmJyxFUA6PSLDTSPCAW38omBLvxFOw0psYW7YnwrtcvFqsb7fwcj
	ym2jWpB6y9UlPVPfr3zziP+uVOZYEuz6YNnfB1/DKCg==
X-Gm-Gg: AYBFou2jStffPixxrXULURJjYZocGBLLWBwiyt5llFeyBm2UyObO1OOMf35NxSqDn1G
	voc3IjOVDf5Tceg5KGCoVbEJAvBFhcD5Ky9dSSjbE5VXXO/b1g38rmIWs1+yJNREOmD0+NUPUhX
	zh1XlPtev/0/jdjCktzVGA0hFkRDPAFOX6OeEAfDro8je4peH+S1IK9EJKk3+s37ewJWvZKI9lU
	ThyzCsYzmeA9HLFEDp1N7F4uUlj+cojkU9ozwsn0zfuHvONuyEPnkgt19FDXLRp8Shu7OaP4a5I
	jKXeyP9gd3SYgct24ZHoltsOhryBF0W1xLBj8ZgdCuNTbGexc49z2I1Yb5HxDr/uIhdOLT3K4zJ
	qsY9bGWYIW/+GiGsqv3SUx2rLpdDjD5Op3WSgJQ==
X-Received: by 2002:a05:6512:1250:b0:5b8:997b:c606 with SMTP id
 2adb3069b0e04-5bfcad9e1a6mr1490725e87.41.1793243205235; Wed, 28 Oct 2026
 20:06:45 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:06:44 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:06:44 -0500
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:06:44 -0500
X-Gm-Features: AclHuK_OONCiZpFhomM73vca1DSs-MUlsV-8C6gmVeQhDkNqE4BPqIm0xCP39ic
Message-ID: <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Anup Patel <anup.patel@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atish.patra@linux.dev>, 
	Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anup, Paul, Himanshu,

On 10/29/26 12:55 AM, Anup Patel wrote:

> [...]
>
> Changes in v11
> ==============
>
> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65cee).
> Also, tested PMU driver with both PMU irqs and PMU SSE events.
>

Thanks for rebasing and testing the series. I was a little surprised
to see v11 posted, as I am still working through Himanshu's v10 review
and validating the fixes on hardware. It would have been helpful to
coordinate before reposting so that those changes could be included.

I guess this follows Paul's request to rebase onto riscv/for-next.
However, there is one change beyond the rebase that I would like to
clarify: why does patch 4 remove the scoped_guard(preempt) sections
from the CPU hotplug paths? These were present in v10 RESEND, and
the local helpers still retain their preemption-disabled assertions.
Is there a reason this protection is no longer needed?

The changes discussed on the v10 threads are still outstanding in
this posting:

- Preserve TASK_TI_A0/A1/A2 across nested exceptions.
- Replace the temporary GUP-based perf user-stack copy with nofault
   uaccess, following the x86 approach.
- Address the per-CPU initialization/preemption concern.
- Split the MAINTAINERS updates into a separate patch.

Additional fixes from Sashiko review, the kernel test robot report,
and our follow-up debugging are also being consolidated:

- NMI-safe entry and lockdep irqflags tracking.
- The unused-function warning reported by the kernel test robot.
- RV32 vmalloc synchronization before nofault fixup.
- Faulting-PC validation in the kprobe single-step fault path.
- Per-counter STOP handling in SSE error paths.
- Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.

In particular, Himanshu identified the missing preservation of
TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
I validated the fix with hardware A/B testing: removing it reproduced
corruption, while the fixed kernel completed the same test sequence.
This also gives us a solid basis for replacing the temporary GUP
workaround with nofault uaccess.

Paul, please hold off on taking this version into for-next until
these fixes are included. The rebase and PMU testing are useful, but
there are still outstanding correctness issues.

I will consolidate the changes and post v12 against riscv/for-next,
with an updated changelog and validation results. Let's coordinate
the next posting to keep everything together.

Thanks,
Zhanpeng

[1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
