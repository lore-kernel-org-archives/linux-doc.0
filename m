Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793261715;
	b=Y2EZWdrCY0htgBxRkoWwTkt9vVP9XA3phgyO0CffsYLGbFXUjcwjPUbf2dK46ee/WDqi
	 ZigjMRBVIpJ0CbcULKjitHItg3F4ouxVusLe03XNlMYqOuvbd+vBVL/GKJucTJPfdWk/k
	 pNqbnEnWYHCPxDp8YMPCWUUu3q4uYlZ/vBuCrCA6RsYOBQAXD0Ds/kzFwm1bPPfQJ0/Ic
	 U/j5Ewtc0Q3mBgpbFiYm36utnOqMorU7a8hT4A9CKMOVrdaAdwNC9p+R6Vahc+iq/Q/ma
	 q3QJxEpFNp8h+N0MDwLa2PDL/YY2D475SFgN/ZTXbYjf5kbjfrbwzLTOQvCmwV52rew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:User-Agent:X-Original-From:References:Mime-Version:
	 In-Reply-To:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
	b=XkfxIuxR2yAsFmnsdo2b9yfy4AWgc9sxu7NQKEAi2zaY5l9giwnl9PCsawGXVK3W7U3O
	 SH4dadYVUTbOgkQ/Mbe6YOpkQYebXmz/3gw0GXkh5p69j57q9MRm/4mE7MRgR0tUPGX2w
	 9tyht2gdV5sy+voc+gEulYqthqluPwMwh3FsaVn8LxxHnLrYnI7sVPmGNcfdBg62YewjM
	 qxxYBM093IFIvr8OpBr8Hp+RX+AHaD3n+ZE2fphox1W7maw6xql/GnEQn+7nEhWb72C9l
	 5qH0SD8yoAzvSlinaOI0awBunvmr+E4NOObh79v/vq2SBbPNqg38UFKkWfz1YVz/EPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RFI4zuaC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C0606A31E
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C38C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RFI4zuaC
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea0efd636dso15111895ad.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261714; cv=none;
        d=google.com; s=arc-20260327;
        b=Kn4EoL6fFWa72G3GRWneauRq7axQczl1UkhXa+3GiUL4JCSsVm1mskh9nkvPsHPmq0
         MHavt3jiQnrY2O4rzM6ZPUfZ0+4wNodbCQ9PIwz16irrPHLMewz5I3J83Z64lQk4ffH7
         BL1N3DvvhUQlhfqG6KimfeiwbGEjjdnaL7PgFNnNDqUVGtifljXz2wtHmS3Mmb+V7Zgy
         5N3F9P8j6tkiGx5kJnWR+p4NZ70NMaXO2lzzXO7RzSOLe1wErZRfI0fOX4b08W9c2bvT
         HqrCce9bqMr0/c7WXGgekQz/0ysA9BZO1nniPGYJTCdfF5f4EjuwFQZmqnBZjegxy6jD
         2l1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :user-agent:from:dkim-signature;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        fh=QzhE6khd8fIDbFZGGfMYaSPbaghIzo/BgBRPwKn/GcY=;
        b=CFgFz/rZ9Jc+8E1k/wTfna6MIlxboBmtMPDwPj9TASHh2TRSfS/CkoysdzXlvBLokj
         PFwggDly9OtGF77D1z8LeLtJFZi1pjnYVD87GMXezuyqDWKZ8gyQonyIoMQulCggg9Ie
         GW0AnrtmX+OiZ/SgRRV/+0q37xXYWWiUIqU0JmqB52fcNelMR8lP5YCFdLYhM0xumMJa
         f4Ec6lz7XYOrEN68fEd4SY0qnvE+lTnDQ5fhU2E2n5YJYlGOaj6RYhAmzvsNXMWQwRJg
         U2h4WT7eesMr4RffwtPxPUS2pOLhZWqiog045vS3T5Nsq4yzVC1N5j3wjn/i4Hb+wdN0
         VVRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793261714; x=1793866514; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:user-agent:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        b=RFI4zuaCnjf0fN5tmtBIH0lhUxmF5UpTQqI0bfI2MJ62zdrjSQoUtfKJemeQNxuLMT
         NN9a/1T+6gwPT42Q2S0zE5NokPyuA/PXaghdfrs2kAawogxGcm3jZekQYMkRO4pA4gq/
         DUPJb+yu+jrfBPnSQlr19DYYvE73xW5bleANLI/WN25oQzFOCPbkJURptYuxPecPkOgb
         9+XQUwYi6ZOwVgPgHs26aeQSPy2FvOkwQdVoAzd7U7w5BU9vTnox/GApfw1Ube3nSUJt
         kTBY7z68hwvB8/OV2Thb8A4WM7AVMQCFW7CL+jJRC42ITMx78QZ2rRMGEy4uF6S35MZm
         7rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261714; x=1793866514;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:user-agent:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        b=PfY+dUxmJAbfc9oW8IJtPFaOImjCS2YY0Q9HyDJhzTodKb98KMaAklgIgkyA2S46m7
         Npn2o6lsF8P4GZKsFFpLOJNOym4fKrqBEzULWQGv4+fi2jFC/0pdtCd6ghmTkffMT8sw
         GwK/nMuuw+stlcedbLkp2hY0O8R1ZuYDZB3AoMZCAITU5E00xRaOOAm9/qcDOmX8DuRC
         jH2q4yaRWfpGsNUQYZPUbSUtwX9DS7VogkMftwE7Bn/LbRAwBjelQ9naFy613FEFFoEW
         VtTk6ZXqQ9k3oZ4GFsm+NDGz99d6NH/IyS+uYEGrC57YK9L8tDDHjK9+v+L4vJ/SPsSW
         moSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXjLiANnbxxt2uBsctpFopJCA3jqlVhxtQbHRTnwp0Rpmujopu9T3CA4Oyc/cYSjJcO4StxWVIWrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6DhtuzNngd+8cPqKanqlRMvDnpZ6dwzCRTqVvVeGEU/cmpEdA
	7FvdNuV6ieRh3T/YMY9TJTubTRlScEU3qulX5ILnMZwGVyxpF9HfvVmcZHbL064CvANga+cKLjL
	ibRp//UbGdQz1LBuCrJAJ5hEWb9pbMvz58Wx7qK3Uzw==
X-Gm-Gg: AYBFou0at0THFnmXcTnmoiDbyeRL0LJq9Jnbh6pE7JScn0eg14D3HqVaeLDnG2nEoJ+
	0jG+Fdnn7RkGXjmHT8v/dMfhu0JuiP25KLhCjcJt4vQGHIOT8oK7quj7Uq4NthZXH5LqcWLlGIm
	YzyqKxwf3OyoZlgAj+4UcCD9Q0VO4ivLc2QW0CKQxa9Pb5WOvXfwBGwupwB+uWU3AVZMftvDzFx
	Z/MpOqD6VCamO0nZps7HNWSQ8S6pPwN2g4l3cu/CMLJSdSUzu0TVYuCXMvxk8IW7IYpo/I+pRXU
	sIO93A3DO89Y8eMvDIfE2zPMnTAKpQlgbhLSjar9qzsR9R8O4fBPmzQiNLFVLf4im+8X79VIp6t
	orsdhw/M4AXlGv8UyR3W25Zkqe+5q6WqNN9x2OqpWTghlse/6N3P4pBxWZQ==
X-Received: by 2002:a17:90b:1644:b0:3ac:bc3d:6fe5 with SMTP id
 98e67ed59e1d1-3ae57df3d9cmr3792452a91.7.1793261714053; Thu, 29 Oct 2026
 01:15:14 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 01:15:09 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 01:15:09 -0700
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
 <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
 <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com> <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
Date: Thu, 29 Oct 2026 01:15:09 -0700
X-Gm-Features: AclHuK_f9UmrKyQEn9kevLn5RZ0DxR6jXXwQ6CxrknwZt6gPcFhXWT1BqyQH4Dk
Message-ID: <CACnXVndTuZd8jyVG0=KEq1WicQ4iCA22_TkOnSMyrtbTD+ybWA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Paul Walmsley <pjw@kernel.org>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
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

Hi Himanshu, Paul,

On 10/29/26 3:09 PM, Himanshu Chauhan wrote:
> On Thu, Oct 29, 2026 at 11:32:36AM +0530, Anup Patel wrote:
>>>>> [...]
>>>>> Paul, please hold off on taking this version into for-next until
>>>>> these fixes are included. The rebase and PMU testing are useful, but
>>>>> there are still outstanding correctness issues.
>>>>>
>>>>> I will consolidate the changes and post v12 against riscv/for-next,
>>>>> with an updated changelog and validation results. Let's coordinate
>>>>> the next posting to keep everything together.
>>>>>
>>>>> Thanks,
>>>>> Zhanpeng
>>>>>
>>>>> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
>>>>
>>>> Regards,
>>>> Anup
>>>
>>> I'll post a focused v12 before this weekend with the immediate
>>> correctness fixes. Further improvements can follow separately.
>>
>> Linux-7.4 merge window closes end-of this week so your v12
>> will be too late for it hence I suggest sending incremental fixes
>> separately.
>>
>
> Hi Zhanpeng,
>
> I agree with Anup. IMO, SSE as a feature is ready. It will be easier
> for you and for me if the patches are merged. It has become a pain to
> send revised RAS patches because of the dependency.The issue that I
> identified can be sent incrementally in coming weeks.
>
> I would request Paul to pick up the SSE patches now.
>
> Regards
> Himanshu

SSE v12[1] is ready with the correctness fixes discussed on the v10 threads.

Himanshu, I checked your posted RAS v5 series against v12: all nine
patches apply cleanly without modification. V12 uses the same
riscv/for-next base as v11, so switching the dependency requires no
changes to your patches.

Paul, please pick up v12 rather than v11 so these fixes are included
from the start.

Thanks,
Zhanpeng

[1]
https://lore.kernel.org/linux-riscv/20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com/
