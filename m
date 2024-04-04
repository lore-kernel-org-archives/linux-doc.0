Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFD612D201
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257736; cv=none; b=Aw5kZ79qLsTGJHuV5IO9UphfhTFUhDfBCyhrd567DTE/IxXDWbaeAH0umpNsUq150vAP3nLTYKwQxmvKVZJxd1rPt5PRIPCWzFiVgb7w6ut6xFeGm06GE89C69gkKimv/vNFx2eIcimNgqSdbAp1YAUGWWavZl8jNNHH6xirXUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257736; c=relaxed/simple;
	bh=WxeAqvvN/v7ktneYk9JoOYaf4wH/gjJj72H4zKdF+ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWNlEk5c7VeL8T3t2pLNjehcECC2+/YwcCjcJTTrLc8jD1zH7BYf9GlfP5za5ybu9HQOdIMlVl2vJ160IhcRDsZT4MYZoL3gff9YtAhcKJELgjeUJ75eK0pV98nXAcyQowGWV5A5aiZWgkoO1tcm/0SxDGzINyia84iMkh/z4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uZdo5tf2; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uZdo5tf2"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-430d3fcc511so54591cf.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 12:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712257734; x=1712862534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2FS3zsbt8L4jeaVkTvzqGihSw/YCQu8ub3DPuvSaF0=;
        b=uZdo5tf2PBHHmoUmpJYi/ZNTG+TcIConAiXCqPIOzIWxY1KUS1/Wq+LsVpFt/RChqZ
         AjUG3doKkyIN/bEz1rNe0wY+LcqMo1GCJNc7y0Ga8HRHHXa0KzVusB4YpeX1pSwM5vNc
         Dux85gt4wWQjGuPW1EQUz+Q5JGX+PfylOdZy5nEBscoMRvb7T9y5ZD/PDz5hmr4oP3la
         ZGe7aaV8slzvtzDu1sWDEqHAqnf3pXP+yXZFrYMG09JoVQCVVnH2wHrceDaunlXc2x4Y
         Wnu2GJDq8oCC9WpN9b90vO3L1Ce7PfsqtnOY3g0+YJm4ek/L1Q0/s//jI5LK0zbtYbxg
         eNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712257734; x=1712862534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2FS3zsbt8L4jeaVkTvzqGihSw/YCQu8ub3DPuvSaF0=;
        b=RjBwYKXwnv9kXG7s35u0Pba1ir6o5q0pFtjkTKP6kug2VPoUB4v6snfA00YK+3EA8w
         NIp3sekLGJv8V03mgr9MvlOp3naCDXZu1QNPlS1oUJrB0vaPTXvZkSXk4bP0+OWpY8Au
         wpq97j8jUmDwE1WRlaV14ELRe8BnLsk+PjCmjIIGmeoPYWs6bfEfB44XxQMOWzQE05mJ
         ouslgHZ4nz1yeE4jUsARjVoCR1cTKPjb65OA7wAtU+bBy9025hq3ci8UyqFv36enH1rn
         Y7RxYsi/IhEV2GBMwvYJ6Lw3U9gU9T/PCgmqsePJ1OeBJ34XxcVzqtZMq2T4/TejqCmY
         g7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUfBvghOfpuSFiIbwH/ndjYmNDr55Up1hsuRaZHYBg3VRK6Pvvpzgy48AEoIB9+OsNJXTIJN6mUx46ItBaoTfYWttH68DbnM2Kg
X-Gm-Message-State: AOJu0YywGyny1TnctzBvF7Mg+uQU6+qc4OIQMPMiaC5sTN5ARhzEee5R
	rAi1XyH6iVxw8DZNzwphSlwEAufTjB0MvLDlqba4ix1o+4UW67P4sw0ZN2HaCqF+8KCDguz5Xvf
	1UIyYfNj1DdxFKgtDTkgzuQmf9u2VlUZSMyyS
X-Google-Smtp-Source: AGHT+IFRY4QGSGiwJ3A8YX2yjQXNwm/FJuEvmJf5VoD79vrLqSU2/o1QqH8DeNhZ00svTvH3AICvuXJRA+LVIptBTb8=
X-Received: by 2002:a05:622a:1a82:b0:434:5c3f:6d55 with SMTP id
 s2-20020a05622a1a8200b004345c3f6d55mr7835qtc.1.1712257734134; Thu, 04 Apr
 2024 12:08:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1711674410.git.babu.moger@amd.com>
In-Reply-To: <cover.1711674410.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 4 Apr 2024 12:08:43 -0700
Message-ID: <CALPaoCheW=Jz2R3gMKcgwQe6ONDrRqu3tUxeg=A3USg6BC8buA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/17] x86/resctrl : Support AMD Assignable
 Bandwidth Monitoring Counters (ABMC)
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, fenghua.yu@intel.com, reinette.chatre@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Thu, Mar 28, 2024 at 6:07=E2=80=AFPM Babu Moger <babu.moger@amd.com> wro=
te:
>    The list follows the following format:
>
>        * Default CTRL_MON group:
>                "//<domain_id>=3D<assignment_flags>"
>
>        * Non-default CTRL_MON group:
>                "<CTRL_MON group>//<domain_id>=3D<assignment_flags>"
>
>        * Child MON group of default CTRL_MON group:
>                "/<MON group>/<domain_id>=3D<assignment_flags>"
>
>        * Child MON group of non-default CTRL_MON group:
>                "<CTRL_MON group>/<MON group>/<domain_id>=3D<assignment_fl=
ags>"
>
>        Assignment flags can be one of the following:
>
>         t  MBM total event is assigned
>         l  MBM local event is assigned
>         tl Both total and local MBM events are assigned
>         _  None of the MBM events are assigned
>
>         Examples:
>
>         # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>         non_defult_group//0=3Dtl;1=3Dtl;2=3Dtl;3=3Dtl;4=3Dtl;5=3Dtl;6=3Dt=
l;7=3Dtl;
>         non_defult_group/non_default_mon1/0=3Dtl;1=3Dtl;2=3Dtl;3=3Dtl;4=
=3Dtl;5=3Dtl;6=3Dtl;7=3Dtl;
>         //0=3Dtl;1=3Dtl;2=3Dtl;3=3Dtl;4=3Dtl;5=3Dtl;6=3Dtl;7=3Dtl;
>         /default_mon1/0=3Dtl;1=3Dtl;2=3Dtl;3=3Dtl;4=3Dtl;5=3Dtl;6=3Dtl;7=
=3Dtl;
>
>         There are four groups and all the groups have local and total eve=
nt assigned.
>
>         "//" - This is a default CONTROL MON group
>
>         "non_defult_group//" - This is non default CONTROL MON group
>
>         "/default_mon1/"  - This is Child MON group of the defult group
>
>         "non_defult_group/non_default_mon1/" - This is child MON group of=
 the non default group
>
>         =3Dtl means both total and local events are assigned.

I recall there was supposed to be a way to perform the same update on
all domains together so that it isn't tedious to not do per-domain
customizations. (And also to avoid serializing programming all the
domains the same way.)


>
>  .../admin-guide/kernel-parameters.txt         |   2 +-
>  Documentation/arch/x86/resctrl.rst            | 144 ++++
>  arch/x86/include/asm/cpufeatures.h            |   1 +
>  arch/x86/include/asm/msr-index.h              |   2 +
>  arch/x86/kernel/cpu/cpuid-deps.c              |   3 +
>  arch/x86/kernel/cpu/resctrl/core.c            |  25 +-
>  arch/x86/kernel/cpu/resctrl/internal.h        |  56 +-
>  arch/x86/kernel/cpu/resctrl/monitor.c         |  24 +-
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 714 +++++++++++++++++-
>  arch/x86/kernel/cpu/scattered.c               |   1 +
>  include/linux/resctrl.h                       |  12 +
>  11 files changed, 964 insertions(+), 20 deletions(-)
>
> --
> 2.34.1
>

This should be fine for me to get started with. I'll see if I can work
backwards from the patches adding the parsing code to see how I'll
work the software implementation in.

Thanks!
-Peter
