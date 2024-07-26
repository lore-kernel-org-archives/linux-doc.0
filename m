Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35650149C61
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 22:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722034099; cv=none; b=joXJ3o1drmqxtCQhMIplt+btXiGXW1xJW4ZcrYRY8ZaHVpaW45OJsXMw6KKVuofCrh3NLPj/KkyrDkufFbMT+fQFEQCkqUfx3Hq56BmjS+gUcEiUJS9UfH3iop69z4QVQnzI8nWLuwuPCwFtMe2cVqprC5IBLXtsC4aKnhs/TW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722034099; c=relaxed/simple;
	bh=ik05G7iwnI78HfDCCFcvEPtupzj6vuYvWeqIXABJP8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mn5KW2lA0pWttwaviYDSoHT8iYrvvPnBC8vHBNuhNBu9FO6eSW1E7q7QZbHwH/D7e4/3BXWgNpVH489OBlfazi5a8KE64NafjVzRVqBMrUxJfEkguae/wBeq5es0Aa78MdA9BnHyNOAJJeo3XebhXLEnVuhfrqy24sRz9Mwp/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aoFGNQzV; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aoFGNQzV"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a869e3e9dfso5602a12.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 15:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722034096; x=1722638896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IISxiKaE69HlxW9zSbdzn0yNE5018cgYeG2mOlmSYSI=;
        b=aoFGNQzVCIrUgsd6uW/36mpCGbdCGaHLaGCW2fhAUL1hBOIN9o/JDLazm7VLzbwTNt
         r2ME1jI1JANcAK3Nl7fBDQ/5hu6tePWZlAdxw8aITfKMA1dFpsKZurT0kaGAxAG+piQL
         50ci9GhwOtPE1USaF1WREznN7AzVY/m7KtCx3D+B/pRr9JgfmY7lnXePItO3DLFMp2I2
         +1yjmnx2ZEC3nId+fZ5tGHzKPCIVHcvUctE+85qMo8xdS5rD/qFO2LLspgGmbKdqxwDD
         7UXTt1/Q4NE4E8Vr1O9s0rAUGh2PKsw04QjFgIofADlVN7jFBXDQqF2S4XQaaCCZfA5B
         5K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722034096; x=1722638896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IISxiKaE69HlxW9zSbdzn0yNE5018cgYeG2mOlmSYSI=;
        b=hhkIJcASSLRXU8pH+jqlDA3Tiw+kG6943NYDe3wHp7g4USBjg42lAPIp6ApGVlTXOD
         OnMCiRn9v8/6LDG/J8Kwq59+gRibzHW9wdGNIZiaz7iRM66aIXuOGicltJQlaC+0eJJa
         T/MKMSOhOl/ziJXxfOwDLUeQs/vc/xxltql0Q4HBt05l8pfI3y5SdtGWA0qTJDwl1coK
         2PPrHpHwlcj50FIzeCe3xam9hwX4xfYRuAtAoSFfixeDsimHR2PAUpLMskV3U9XFNOei
         Fxj7jnR8X2NziiSA/I1ZcaGTLDAeeeCIbQY6bX48KV7JsBzuo0qGEepvh8wcfqeyS9TB
         sDRg==
X-Forwarded-Encrypted: i=1; AJvYcCUzhIRR8lgnoF40DYFm/f4hcqEePatlD2+hMvXEtDeCbsM/r2XB3Cgy8/9wFBiEjBQF4mi81UTANVaBkisJtWYpqCLqRo/+i4oT
X-Gm-Message-State: AOJu0YxxUkdDmA9/98z8HqFKf6kkN1fLcsk5VVmAg6dcubdbIyalha8D
	h+LatiHUrKgshAfAGL+G4vo5bfKDEBpCALfg5/VxW3HY12Y1h5uwefBwkEBECoOvjjqkd6G6pKT
	NWlPV5Bu34vJiU0wH+487sZFB6LF856oWhILz
X-Google-Smtp-Source: AGHT+IHDvwVw23uSTcDi4SzHL+t6WXgiACBRlhQpwZ+TMNL+bUR6puGV+HLKl3cR72B/zvuFm3wC9iotOGgbxu+qgRA=
X-Received: by 2002:a05:6402:2694:b0:5a1:4658:cb98 with SMTP id
 4fb4d7f45d1cf-5aed459c474mr321422a12.0.1722034096206; Fri, 26 Jul 2024
 15:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720043311.git.babu.moger@amd.com> <28866653751deb8405f575e40df6f08affdb25d6.1720043311.git.babu.moger@amd.com>
In-Reply-To: <28866653751deb8405f575e40df6f08affdb25d6.1720043311.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 26 Jul 2024 15:48:05 -0700
Message-ID: <CALPaoChGp+JHeyxsqDvix=t=ik5eTqc3bf+ihUL=RXx5p9r5Cw@mail.gmail.com>
Subject: Re: [PATCH v5 09/20] x86/resctrl: Initialize monitor counters bitmap
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

On Wed, Jul 3, 2024 at 2:50=E2=80=AFPM Babu Moger <babu.moger@amd.com> wrot=
e:
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu=
/resctrl/rdtgroup.c
> index 4f47f52e01c2..b3d3fa048f15 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -185,6 +185,23 @@ bool closid_allocated(unsigned int closid)
>         return !test_bit(closid, &closid_free_map);
>  }
>
> +/*
> + * Counter bitmap and its length for tracking available counters.
> + * ABMC feature provides set of hardware counters for enabling events.
> + * Each event takes one hardware counter. Kernel needs to keep track
> + * of number of available counters.
> + */
> +static unsigned long mbm_cntrs_free_map;
> +static unsigned int mbm_cntrs_free_map_len;

If counter assignment is supported at a per-domain granularity, then
counter id allocation needs to be done per-domain rather than
globally. For example, if I free a counter from one group in a
particular domain, it should be available to allocate to another group
only in that domain.

When I attempt this using the current series, the resulting behavior
is quite interesting. I noticed Reinette also commented on this later
in the series, noticing that counters are only allocated permanently
to groups and never move as a result of writing to mbm_control.

# grep 'g1[45]' info/L3_MON/mbm_control
test/g14/0=3Dtl;1=3Dtl;2=3Dtl;3=3Dtl;4=3Dtl;5=3Dtl;6=3Dtl;7=3Dtl;8=3Dtl;9=
=3Dtl;10=3Dtl;11=3Dtl;12=3Dtl;13=3Dtl;14=3Dtl;15=3Dtl;16=3Dtl;17=3Dtl;18=3D=
tl;19=3Dtl;20=3Dtl;21=3Dtl;22=3Dtl;23=3Dtl;24=3Dtl;25=3Dtl;26=3Dtl;27=3Dtl;=
28=3Dtl;29=3Dtl;30=3Dtl;31=3Dtl;
test/g15/0=3D_;1=3D_;2=3D_;3=3D_;4=3D_;5=3D_;6=3D_;7=3D_;8=3D_;9=3D_;10=3D_=
;11=3D_;12=3D_;13=3D_;14=3D_;15=3D_;16=3D_;17=3D_;18=3D_;19=3D_;20=3D_;21=
=3D_;22=3D_;23=3D_;24=3D_;25=3D_;26=3D_;27=3D_;28=3D_;29=3D_;30=3D_;31=3D_;

[domains 2-31 omitted for clarity below]

# echo 'test/g14/1-t' > info/L3_MON/mbm_control
# grep 'g1[45]' info/L3_MON/mbm_control
test/g14/0=3Dtl;1=3Dl;
test/g15/0=3D_;1=3D_;

# echo "test/g15/1+t" > info/L3_MON/mbm_control
# grep 'g1[45]' info/L3_MON/mbm_control
test/g14/0=3Dtl;1=3D_;
test/g15/0=3D_;1=3D_;


-Peter
