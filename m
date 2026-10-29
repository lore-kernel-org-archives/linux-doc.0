Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793245238;
	b=poOv88lD6PjB5JLhmBmAzjHFXq1d/LGqk81hrJWF1fCEfwvAuO7gb3FtKFC6oxtBnxtm
	 DYRWtVZqwYwbCpSZftKpIO5i70uj1wOfVCkgYI41dkR+POgeENURK24DlWzbD+03XPKc7
	 f5aWx3A/piajCo+kxgOzTOyr/cOy5jG6EA+sCVScQdJKngDus5KXkte4z4rnK/bDMcHIQ
	 ChMWFIX1jCnSuI3YPcnj8O97LpuB8ig+8Ix898sqrqGRvO260E4iPUwUpY1tbgqUHcihB
	 9hotL6ZeaEjBYM7qaVRM0LfCJigHPec1sly3T3+zOqzfrhHIvDbQHIuk+KM0Wef4GeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Original-From:From:User-Agent:Mime-Version:References:
	 In-Reply-To:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
	b=QqRRfHUAEsXQQMYkYz+s9cmFZDJvysjAmggqQN8gLuM6naj4BVyBh+u+U3UaSYzFYZgs
	 Me/YqhtZq1db7bGlnlTL/50cOFPwNJTiCCyJ/9g4+S348NxXn5bQ7tzrKaQWSp/g6BhXu
	 MTyyg3bzHaDCt/JkhopALIiTP7Vs5dmyl+lc0Kh9XwCs9N6RjBsLKeCI7AWXigBMx2ntN
	 0KdhAoZEPJ2H6pqe0iJtGAqznxnMXzUohb3E8k5ijd4T5Z0+1llkJmxEPMnD+5knvv4G0
	 VILFMFqgaHHl6nVUapWNiZSYPWvGlBNlomGu7DGWUTbpUUUamGDqjUyqvJ7SS0oHBXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="kyEj/xtI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD86D606A31F
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 03:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD86D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=kyEj/xtI
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so289520e87.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 20:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793245236; cv=none;
        d=google.com; s=arc-20260327;
        b=hrtO1gJjQn9gpMK0tlCJh8Yy5WJoXT5HbOcE9jCbW4+ckQ987T9uI6Yuqb+QGskxJU
         /V4CrjAOYSt27v1MlwZdskhHhmO8VBcB8QoBa4FNWdaFCC6D2DtI3rbUaHrlDqYxO6gA
         Y6WUAyE2/jS7rHV8wNCFEGRxIxZuW8aWgjOfXK7x5r1C3y2jjYpVnvdK/q8Tfd28TQXp
         th3p4eb1PuPf6Fv6xnexjge4J5+nuXbC/anrwbQCLLgvzY5+tYtHnOcqhMDHSUATUTIN
         5v0a+hd2uRAdcYTepYpbyzUrxg+OnPMSvfPUhWwy36oduZ9CBwZiFkPRyLut0bFfT0Uy
         Xjig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:user-agent:from:dkim-signature;
        bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
        fh=XuRNbs016z6azGFLutm+cISRO8hGoc4Iv+fdh4qOqz8=;
        b=io5WkfCcWuoC48ZpdVbD4VCEcu57PPXMQzVQMVHieVexAmLjFJNG9IvQ7HEsqDbkDH
         3lSs4NIVgTAQnIkBqiRoFPVf290Plf5YHo4lJKMxzz9LDqC3RcN6VmCewUPkNB7mRBA9
         txT2d0BQuDv9tsYg6TyXeeCG7c1k4PqzCF+cs6fnxTcXR9goB48Eku1l0vPc1Zf+bAwD
         lVKdR0XbAl/v7+WHVyDH8oS7rbDFZRms2CX8+VUZEacsPEFDyUIRPm9X+W7bki6N3dRy
         3IerFLUkREIuL38G2FJwYF3sNHe6Hr3TfFQ6AxkoZJgEAniZ9fxGdBrsTUYlr/k0+puK
         vRlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793245236; x=1793850036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:user-agent:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
        b=kyEj/xtIfG1psDrutwEjeBnQE+zyFD2DaTTga09yoiHeGT32/X6hjSuC/PkGQYy4AN
         jxbm+XcIUg9rbPD5CmsU8sKB/161+m5yz53nivZT1jDhRJUVIf3LW5jLFebOjRPE/7d2
         2ek2z4aMTQ/VvXgiLPGKoLZo3iMFnjLV/5nrI/1aadQkVsOd6UnQX8Iq/tpil76gJLC8
         eYKBS+OTM9cmsD+w+h52sPAK3q/JBFg8lnKIw9RC80ow8+xtY0n9XWnPI7srxOFfqG5x
         lxN7/Ixn+7z/vG5AT661jRaOMyMxmm2Pfu8XVebUs0Wkim+Jj4o23KryJnWdfqNV78/R
         RirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245236; x=1793850036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:user-agent:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
        b=MMybrRqcdxLcEiUGy0NRLJU2HxR2qR3eavOgi7m8dM6jziV9hp85SQc1euBf5UQJB0
         68lV1zJRguleX2w351P/shtW8ds1bj/HjCgYSFhcfkMWMhRJGT9t3cuB0EaGilpQH7wS
         L3WtuHID3GRAnGQEgoFhCPiYkA/72XjavVbFs7FEMr/UAEk0mldhb16R43v/veEWmsuP
         LF2S7VytVpfcxlliTQjaoU8CZ0eiXEpfGT62WR4fpayeniG9xFSA7msZm/S9TVcUazo/
         AQn0T7a4crCt5j6BY8Y+nNikS8Texa3NU8H0Ia3vX+ZqgaFxsJ8bY/OhUgmYYyV1sZW6
         KlHw==
X-Forwarded-Encrypted: i=1; AKwUvBz4eoQjw6cPjjB5LWN9kfOr3RQDVz4F5uB2rAo7W4YAR24Y9mh8yqxsjL9+MF+UZW6RetHCh8IfYmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/J2PaoDuKw4m+1EPn3u53BtAHSfsmIGUGWga8BMrNPLas8hkg
	W9mGYNdJuUtBjaC6il3EUgOY0tzGPOjj/XMZecntvVIADy1+Gzhyod+8pLr/JkprB3yUO1/HfnN
	IAvh1EqgcdH55hrtQl32U62RGdoTUOLwZQe1SjmDxJw==
X-Gm-Gg: AYBFou3RE0lGs6t2HengdtOc6dBhAaAUFYoOqjCMi7RKpHXmD1FldtHpV2EMjN2FM9E
	JwIhu0HIzx53vs0fm1dVEA4Ig4ksjY97hTQM4QBazZfhBXgsIzeAnaZPilstKEAoiKmyJ9Hf1+P
	YUyFh1J7Uaqk7rC+4TGOMW6llDV+eL8YU4BvV7+DdL30CgD9tweJBdKMGGvWqeMo4ZPnRlHFB2X
	gKQvQSBRoOZ+GXAZrZUwrvzGdwwsVsashAMJjulqrhpn0wRzTEEeBcNvELccO4Q9If4N81iP12c
	raHbJgeKChfknsG7CtkP1EWjiinZJ13uk7i/FWDwD+vESydiENVsoZLLQfQXyAh35qeNElOeyLf
	L/0h7JpqZBIAz0FqlEBFL1q2/tqIAGg/BfVTV5g==
X-Received: by 2002:a05:6512:10cd:b0:5bf:b6f6:e81a with SMTP id
 2adb3069b0e04-5bfd11b6e58mr399145e87.19.1793245235608; Wed, 28 Oct 2026
 20:40:35 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 20:40:34 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 20:40:34 -0700
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com> <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
In-Reply-To: <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
Date: Wed, 28 Oct 2026 20:40:34 -0700
X-Gm-Features: AclHuK8WQ6e-ALzK5a1gaSR322umexfJNu7ra0n_GcOfKrsqQ5w5YBowqgksE4o
Message-ID: <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
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

Hi all,

On 10/29/26 11:17 AM, Anup Patel wrote:
> On Thu, Oct 29, 2026 at 8:36=E2=80=AFAM Zhanpeng Zhang
> <zhangzhanpeng.jasper@bytedance.com> wrote:
>>
>> Hi Anup, Paul, Himanshu,
>>
>> On 10/29/26 12:55 AM, Anup Patel wrote:
>>
>>> [...]
>>>
>>> Changes in v11
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65=
cee).
>>> Also, tested PMU driver with both PMU irqs and PMU SSE events.
>>>
>>
>> Thanks for rebasing and testing the series. I was a little surprised
>> to see v11 posted, as I am still working through Himanshu's v10 review
>> and validating the fixes on hardware. It would have been helpful to
>> coordinate before reposting so that those changes could be included.
>>
>> I guess this follows Paul's request to rebase onto riscv/for-next.
>> However, there is one change beyond the rebase that I would like to
>> clarify: why does patch 4 remove the scoped_guard(preempt) sections
>> from the CPU hotplug paths? These were present in v10 RESEND, and
>> the local helpers still retain their preemption-disabled assertions.
>> Is there a reason this protection is no longer needed?
>
> Yes, this is based on discussion with Paul yesterday.
>
> This series is blocking the whole RAS ACPI support.
>
>>
>> The changes discussed on the v10 threads are still outstanding in
>> this posting:
>>
>> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
>> - Replace the temporary GUP-based perf user-stack copy with nofault
>>     uaccess, following the x86 approach.
>> - Address the per-CPU initialization/preemption concern.
>> - Split the MAINTAINERS updates into a separate patch.
>
> There is always going to be new updates since it will take
> time to harden the SSE implementation. All these changes
> can be done as separate follow-on patches.
>
>>
>> Additional fixes from Sashiko review, the kernel test robot report,
>> and our follow-up debugging are also being consolidated:
>>
>> - NMI-safe entry and lockdep irqflags tracking.
>> - The unused-function warning reported by the kernel test robot.
>> - RV32 vmalloc synchronization before nofault fixup.
>> - Faulting-PC validation in the kprobe single-step fault path.
>> - Per-counter STOP handling in SSE error paths.
>> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.
>
> Same comment as above, please do this as separate series.
> No point in holding all other dependent work endlessly.
>

I agree that we should unblock the dependent work. However, I would
not characterize addressing a known, reproduced issue as holding things
up endlessly.

>>
>> In particular, Himanshu identified the missing preservation of
>> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
>> I validated the fix with hardware A/B testing: removing it reproduced
>> corruption, while the fixed kernel completed the same test sequence.
>> This also gives us a solid basis for replacing the temporary GUP
>> workaround with nofault uaccess.
>>
>> Paul, please hold off on taking this version into for-next until
>> these fixes are included. The rebase and PMU testing are useful, but
>> there are still outstanding correctness issues.
>>
>> I will consolidate the changes and post v12 against riscv/for-next,
>> with an updated changelog and validation results. Let's coordinate
>> the next posting to keep everything together.
>>
>> Thanks,
>> Zhanpeng
>>
>> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.c=
om/
>
> Regards,
> Anup

I'll post a focused v12 before this weekend with the immediate
correctness fixes. Further improvements can follow separately.

Thanks,
Zhanpeng
