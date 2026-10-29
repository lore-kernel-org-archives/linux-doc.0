Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793275254;
	b=5QsHaZE3pvdTKzvGOU4Uze0l3x9RNgR1E4s+SXP9e+FbtgiAzojixfXaO94kKWRs5egh
	 MjLGhjQIFC27jiqotKZNHOxuQoDn9wznS2x3pqVhHypDxdNJLxEKWdkGboNL0v3SJlshk
	 YMN92Netum2GlriM22RAjjcf9vK4esN8VM5HJAvrftH30o/mua1gGSkQiiFN1l7uhKiP5
	 g+rcAYG/ha8dLnVYLU1d8XZia8zNFh3gSCuOuJYp3eu54+GzTWRkiCuHPmozj3rXBdHdD
	 NZ6zAbjBkW7cr5lU7lpZwMRSeWciCsfV4Lg8/6tb87p7M1sxNq6tRf1WmtnDcCLbCNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Mime-Version:X-Original-From:User-Agent:From:In-Reply-To:
	 References:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
	b=19OJnMkuvTYbhOXExEL0fsxPMouQV1Y9nGctgTouctGhNj1766IahKWh0ty/3xFJrCfG
	 stHMoo4qFmFU8AD1sQRBrPD9QO0fxdtVi1k3k1rjtr779ao1xttr+zf85fOZaH311nF2Y
	 vI7M9N0H4KXl/FwX/Rk8tbkBHfRQZQQnL8s4KHKsz9as87xHqPGR+2fvKBdmR7nm73S7i
	 gaZstD8qqEe4eGAPqqPVZEtdcTMzadfik1qa0QzUDtivOFFk1D66GMWdIWhPgCsLJyoSV
	 elWkOSlACxN82NyKUfBUsU3Aavc5rRt3Gbzx/S1iMI3kFNUBa5E4PDjkBrM5KZ7NM6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DPz8UE+T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36E606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 12:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F36E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DPz8UE+T
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba328513b9so2195758e87.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793275246; cv=none;
        d=google.com; s=arc-20260327;
        b=r1WuklcrKh8B3rPWD27mhgf6vXLj6CMeJtkCATxP5/xFph0H8u6M69anG5g51nF6sF
         rM+ydvbFaWWZvcrbWs9R2iMt6yLTYvODr9OqqvYWaPm+5jN3UGyB6GvNlyca2721uPw9
         bFACC3B8BZTU8ozMPf4i2dEMAxTzWYtSXrIAU1LitaK/96TRuAKlCE/LdnKYca2whDQD
         Su+TuRIYsStA5SLwLs34hV5eGLwBd0nOcUdgOKZ/Ip2JEagWnEhr6xYGb8YYIo5/RiAE
         Yse3ZwxWPBfn7Q0iWolyxWKn5rH567OYszsW5shBolK/kqDMu0k+VPrSsz/8FpzS6aM/
         x2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:user-agent:mime-version:dkim-signature;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        fh=yrPltwJ/1YLk8ILpb35zQJhj/rq8pKe8Ci3DuOC3SAQ=;
        b=ArAZd3UYgqSoW9xXYaWbyKjQyDUI8OysH8yqUh4wF4sZHvOkv3zf3pyEPt+vpM+fMk
         afKMgUUhEl0Lcys10lTl7WRXwzEo8GO/ToX+PTq77plBFMZdn3syq26bNV16jtlRx1cI
         t018kBduKjb2iQclvwPnu935hw9PX+jm5ocqbvn9GYKfnMbZpraA33nEQR+FOK5gQXQn
         AT/g30L2K3VcgaGqupAE/+YKVKrbdgxCjHY4FlR8SCH/kveisLcTjI8vnB15WwGCjF+a
         iNTGMCZGHVV9vie9s2ER7EIgoQWWyzcDd5ETnhrPazLKMKJRnvbbS2gfcL09KZDh10GF
         j41g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793275246; x=1793880046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:user-agent:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        b=DPz8UE+Tyq/cYPEl4w9kY6RF8oUPSIePH2cHsTWTsyIww8cgzD+L4D6RUw7K7cWW8o
         5bT6/92MEzA94ZSo9BosrD4q/8jYMsNjrBbEJbcait+RXDxiIjBHhTsmvsq8563TjuoW
         v1ABBvVvDyu9Gu32MGKQvkCCIy5rvYW/syrlIQuko6y/kiNEMf+iNoL28ME+J/WphOGq
         yZbm9hNqjWElPQXS2RMtV9pPlxKbl14jwd/SAR7ig0ALG3rhefYwqE+XXPLp9xRw6ZJO
         S20d4XV4bJLSlIKAqfLFe9CMRHcOH7RmLI/OjGvEGB8AqZUUPG9kp+rQGEEtoQPZGtlR
         IMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275246; x=1793880046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:user-agent:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        b=SlRWIAZs1yAqhLnoEA5E34L4C/OS9b2vgzeT1WBnkRyMYgWvqmWOnmOQ0izOPPgmgx
         KPekOEhipi3VreryLtQvzoT9dCGkxz8YII4HZW8xzvTeK4SLWbbBxxHM+aQLa7kQ9xc1
         T8/UKgUOkl82WTpXXV/NRwn0kVfApKG74YPhe84vd6sqwQSixw3zHqxoeOr2w+hGpqeH
         +/xbP5hd9i1lb/sXFhL0dULNcdCNIfMxjkIp5MGOQSRGLDwFdPSAuGCsDK9ZI2UWfZ+G
         +OC9CTNhgpYN8ZbFFPgFTx+e3cKlyhi6X8PqKpC5X47q6NPjw5XLY4AStUu++wy7HB36
         IsOw==
X-Forwarded-Encrypted: i=1; AKwUvBxEpTXUN71XRjXyfqE8GfNA0mdRhuZuSQ1d+iQpu4Zb0/1tEQxPsVT6whHT5D9jGaAmdbj1pf532LA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGSzHziGX9ZeGO6Zfgy6je91Pehdg7tF4RKVSu+W17pjMfmYC6
	WWLf3w09tFgHJseKhhLbtbdGjH8X84OwrWNKjWVB+Zm/6BodpVKHmUCWsm34HLjhPMNp4dV4iFX
	gNUh57kVbNc5yGc0QgFxbZoRl5kAJe2CYs8O/aRZ8OQ==
X-Gm-Gg: AYBFou28gW9MlWSpo47dKofxbcjymb33IzmkyJxL582U0UfxHSywmOAzTvAFiFFnEw6
	v4tGWlM5+42QKzq3OPCClpPe0CJh8ddz711kXxTk11Qmh+enRH2qV3/QAsfpDSKrZWLVO8HAUZN
	D1HmyPHTe7yTllB4hS1OWDT1YiPrgiL7zrtSwzOmR3pcCJ6bogP1aZe8L/f875TW3zJfxdhRCt/
	11g51IHnNAjY1dxRVRr6fJvQXnlzOWYhs7SQDJF5TSmx1O1jjf6D2tKqzKaxRdAsuvPTeRoyIUO
	nRtkZfrw5nWgI2oiH4hNvxBC+vSyFj89GU1CEkmYE1vicohRrs7Lz+29BXh1c+ScUBbR26IPpzO
	QKqn8a7vGGnUY7Q2nb3Xq5ZEpR8GVVoiySyvEEA==
X-Received: by 2002:a05:6512:340d:b0:5bf:d653:ff01 with SMTP id
 2adb3069b0e04-5bfd6540187mr229252e87.34.1793275246438; Thu, 29 Oct 2026
 05:00:46 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:00:45 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:00:45 -0500
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com> <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
Date: Thu, 29 Oct 2026 07:00:45 -0500
X-Gm-Features: AclHuK_sbU548xic3ZPbWuif9uJX5ACTcms_1cHQ__pmhhaKq4RoduWrhke4WpA
Message-ID: <CACnXVnc0jFcNn0bmU5MSm81QTm6Ht+deSRED=91dViZnq1dNmQ@mail.gmail.com>
Subject: Re: [PATCH v12 03/11] riscv: sse: mask events during shutdown and kexec
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, yuanzhu@bytedance.com, yang.yicong@picoheart.com, 
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Himanshu,

On 10/29/26 7:49 PM, Himanshu Chauhan wrote:
> On Thu, Oct 29, 2026 at 03:48:45PM +0800, Zhanpeng Zhang wrote:
>> SSE delivery is independent of normal S-mode interrupts. Firmware may al=
so
>> retain an event registration until Linux explicitly unregisters it. A ha=
rt
>> must therefore stop accepting SSE events before Linux stops servicing th=
e
>> registered handler.
>>
>> Mask SSE on the local hart before panic stop, CPU stop, restart, powerof=
f,
>> and crash shutdown paths. This prevents firmware from entering Linux-own=
ed
>> handler state after the corresponding CPU or kernel context is no longer
>> valid.
>>
>> A crash kernel cannot identify or take ownership of registrations
>> inherited from the crashed kernel. Reject a later normal kexec while suc=
h
>> SSE state may still exist, rather than transferring unknown firmware sta=
te
>> to another kernel.
>>
>> The restriction is deliberately based on firmware SSE availability, not
>> CONFIG_RISCV_SBI_SSE or registrations made by the crash kernel. Disablin=
g
>> SSE in the crash kernel does not establish that registrations left by th=
e
>> crashed kernel are absent. Consequently, normal kexec from a crash kerne=
l
>> is also rejected when firmware advertises SSE but no registrations were
>> actually left behind. This conservative restriction remains until a safe
>> way to establish or clear inherited firmware state is available.
>>
>> Link: https://lore.kernel.org/r/as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm=
.com/
>> Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>>   arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>>   arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>>   3 files changed, 46 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machi=
ne_kexec.c
>> index 738df176ff6..24e7affae70 100644
>> --- a/arch/riscv/kernel/machine_kexec.c
>> +++ b/arch/riscv/kernel/machine_kexec.c
>> @@ -14,10 +14,13 @@
>>   #include <asm/set_memory.h>	/* For set_memory_x() */
>>   #include <linux/compiler.h>	/* For unreachable() */
>>   #include <linux/cpu.h>		/* For cpu_down() */
>> +#include <linux/crash_dump.h>
>>   #include <linux/reboot.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/irq.h>
>>
>> +#include <asm/sse.h>
>> +
>>   /*
>>    * machine_kexec_prepare - Initialize kexec
>>    *
>> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>>   	unsigned int control_code_buffer_sz =3D 0;
>>   	int i =3D 0;
>>
>> +	/* A crash kernel cannot tear down registrations inherited from firmwa=
re. */
>> +	if (is_kdump_kernel() && image->type !=3D KEXEC_TYPE_CRASH &&
>> +	    riscv_sse_available()) {
>> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
>> +		return -EOPNOTSUPP;
>
> I think I had pointed this out in v10 also. This rejects a normal kexec f=
rom any kdump kernel whenever firmware merely advertises SSE, regardless of=
 CONFIG_RISCV_SBI_SSE or whether anything is registered. Can you check if i=
ts breaking kexec() with SSE just being advertised?
>
> Regards
> Himanshu

Thanks for following up. Yes, the current check rejects that case based
on firmware advertising SSE alone. I noted this restriction in the
commit message, but it still needs to be narrowed.

With the merge window closing, I kept that change out of v12 and will
address it in a separate follow-up patch like we discussed.

Thanks,
Zhanpeng
