Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424DF3E95BD
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371429; cv=pass; b=CgpFYEGV+uT66b17ZFvzMs+jRh/Vy3b/9YLcM+Ho80xEKo62dGyPeMP4JBRicyx88fusS1CO39j5psaQgBzV68uL003n9ut15kjWTNiHbG25KXNazFbkof/wArskhEzQqvHPHyNixHcNyq5xtp7yREp9yf5nAEUY596mjYWJZvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371429; c=relaxed/simple;
	bh=yqy5uFhObiChFJDfYfYx1G/Ax8qsyPONwMvYYpHWwiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sINlmZnQNdU+0erKy1q6xSBpYG54+f9xDvd+yh3aujy7466ybEs64uBS2WVpWlSjdPD6+mHWfx07cgZ45LY47hoYBVCxlWL+GqdAvfjWISMuBDtw3Z0WLKyyRn+T7/EUW/0WCaCCohpUD/FYcZ7JSaiJt9Zta3Dpt4J/X0dWmt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H+pYQevQ; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H+pYQevQ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b93698bb57aso2057224866b.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 03:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777371419; cv=none;
        d=google.com; s=arc-20240605;
        b=OyVCfUE9VVLMUtl7w4EBqqt9br6tGzE2rvOHtB0+TlvJre1DxIkXRWbZUi/u2g3Wn8
         ekd5R/Hs7I5o0OHYNCySy/md0no4iU7/Zo/pjLEzYX5/JA1c1ZhH+AxyVsyGJmMBT3CM
         gGZDPuJgsReJOjJ7fuOVH+aGwlsW4HK8CXskneCJB00y/cqrC2e6a7m8UloUO0g9dvtL
         jE7G9Kg3Dw0CGkSZlZsI0ezyy8lqPCUcqsyM1njqZv8KCCpQh/6RVCpwss2mlI1T1Pii
         2fMkNdoweNpGhUpxESP9JpJQVrVxVN7i33S2lB0H6PaB0Eq/dcCpyL6nMZMeR4IJCEw0
         FR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I6Z+pHNBg/5W4l4RDX4uY0xtRgolrfzlhPOcu1W4h78=;
        fh=iOHTJDclC94ope9qrbh8P4iNMHtRJFwkfY6GP04t6jg=;
        b=cJjfWl6UI5H3E3zruEFD7ZAn2Ihlg8ORc2fsRABXY50R2PV059IR6wB1wuqA+7PTpb
         dQwUQdStUe9AnhTgzN9rN6v+3+EWF7bD5DjudBSiEn0OAgLDWqyxI9eqQeeUkvb3m4hn
         77mbagJYAADVgGUu5eB5d34BpmqH12zJ9jZW5OLQtEy7h8QRUfqkGZ7vT98ea4QAZ/E4
         9pWLp1Ui4PKrPYO//sJ/q2xg8N1Ec/WpEBwq6WbMFX4OLblXDzVTNBcwANLxD9bs0j6N
         0Rf1LGtNCmNfnD9juz6PP5BEjjy6dMcMCkk+Rkgs8Ar8FUNFI+Vdgdp6Yyc1D/wj5RTs
         ensQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777371419; x=1777976219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6Z+pHNBg/5W4l4RDX4uY0xtRgolrfzlhPOcu1W4h78=;
        b=H+pYQevQtoIl0Kdtgiqw+XEp8SxZKd50jbNXKP+FW9qmeCWP6WWUx2BDUWJHylCWBH
         BWnlWalnaEfViSxckXORIzTLwvZMW2VRrEOu2bZai2K0ERDcgjmn/e1EE4SZYlqfKFiy
         OcXhfD83U16zDqA/mmnXNliMPMtR4t+aN5ICnypFsj1kvaCNRGdUxQYhCyLFoHIHqhzw
         KZ3E/OjXykVdMQmcgTaXdS7YEOx4kOWBPvm9bxek0RaDYHsxryGzxcNrGcK+OsH/SGHG
         NbCaYzcKTB7+52EKfT73aQpSJy/x5SXtKBtf1WDPTIw6uj0M0J71dv5/O5JgoeHGPvAq
         lEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777371419; x=1777976219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I6Z+pHNBg/5W4l4RDX4uY0xtRgolrfzlhPOcu1W4h78=;
        b=rwrfj3wVcrbJ41NOJgSfKievTd/UI29giZ2Z49o2P5a2mrhjxrmn6vLp3nQpBxmj4R
         pGN3GHcWtzKY4OKqFBZw5IHr57ub/9wABCedBpIMwuGT71vXW7iCGjNZzjf9j8hWjls9
         4ubOHg2Y8qRFYliL6lGx3Hp9LwIOzMZSqjt3UURJ38VE+dnGXqJX2ghvU/Nik0KGHSRi
         4oXJON/aoxdpDlWBvQOuc/oUXMKwT8WECIB6TNAyRbbNwFD8jyYLyGWrzPuok8iKPElX
         kjYUNHeDnBY/7XDWrY7nPMJiozp0SGeBXP53XTqbJkUrlw+z2gEBoDXhU6wIq/UXOKNg
         W/3g==
X-Forwarded-Encrypted: i=1; AFNElJ8W8QYrr4pRT2jMu0LuUG2hIurcW6Zq9N/Xidac2HlUe47Tauo1JEtfPBgkAFjQOBI6SQxoHSCv9+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDKFEBtr68ydPk1ECgikg/AoPkQcIZ9EZGRMgd9E8wYOzNnoB
	4ig66zOzzA0MPzm42reZnNZIzSjUpmHOxSIdV6DUVGFg+GrHFrsnnlc2S8PvdNJrLVROY7Qy4Pk
	+Kl+DilNyYHAZinbGkurxkIfb7+p9+fVubuXGocDe
X-Gm-Gg: AeBDievb29T0e4uRSzS+SL8SskIWlPWNr+aiBll673MmSVUQbVI1YrkVukA2eARd32v
	9xt/6BGzGVufjDuY9p09qZmVspHBE60CDD3fXmbAMlyOyAmwKhBBSMteDSVKLVyNWeTYdjZvDGr
	7tFadJaxHVg4gBDAWVnR265oULQ8Ulf4f1kQcjOAFoJ1a/T1NXmfSDbOPNu8aoBxdExOkqMCtrl
	31kx3FtQ5JeVrsk63OTyn62DqEFucv7uuwHcAGdVZWZO/zN2KId1IXkQLYxMAi2GLL7nrqx1ICM
	xP4Xj9XEx8NLCnnYD8BTdelAw5hqZBHuhpb2JWWf36rJhCsswUJvCHlc8B5+QTXFiHp6ntm4p60
	wFLTZ
X-Received: by 2002:a17:907:9620:b0:ba7:79ef:8694 with SMTP id
 a640c23a62f3a-bb84743ef85mr95889566b.14.1777371418452; Tue, 28 Apr 2026
 03:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776980182.git.babu.moger@amd.com> <8f77f498b1c77fa8fd8f5d5687f03ae598068544.1776980182.git.babu.moger@amd.com>
In-Reply-To: <8f77f498b1c77fa8fd8f5d5687f03ae598068544.1776980182.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Tue, 28 Apr 2026 12:16:47 +0200
X-Gm-Features: AVHnY4L01rhXGXmQTIOth9PYXe__ymBXfqIbDQ_NVSnk6OCALb-Qy0jpif9KmV0
Message-ID: <CALPaoCgAq4gm-aqAriFCiHGBqY3Ryqrgj9QOMyj+wFA3FVkozg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD
 NPS-aligned domains
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	skhan@linuxfoundation.org, x86@kernel.org, Dave.Martin@arm.com, 
	james.morse@arm.com, hpa@zytor.com, akpm@linux-foundation.org, 
	rdunlap@infradead.org, dapeng1.mi@linux.intel.com, kees@kernel.org, 
	elver@google.com, lirongqing@baidu.com, ebiggers@kernel.org, 
	paulmck@kernel.org, seanjc@google.com, pawan.kumar.gupta@linux.intel.com, 
	nikunj@amd.com, yazen.ghannam@amd.com, peterz@infradead.org, 
	chang.seok.bae@intel.com, kim.phillips@amd.com, thomas.lendacky@amd.com, 
	naveen@kernel.org, elena.reshetova@intel.com, xin@zytor.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Fri, Apr 24, 2026 at 3:42=E2=80=AFAM Babu Moger <babu.moger@amd.com> wro=
te:
>
> Global Memory Bandwidth Allocation (GMBA) control domains on AMD follow t=
he
> Nodes Per Socket (NPS) configuration. With NPS 4 there is a single domain
> per package; otherwise the domain aligns with the NUMA node.
>
> By default, all QOS Domains in the system are included in a single GLBE
> Control Domain. However, BIOS options may establish several GLBE Control
> Domains within the system using NPS configuration. When configured, each
> NUMA node functions as an individual GLBE domain, except when the system =
is
> configured in NPS=3D4 mode in which case only a single GLBE domain exists
> which contains all QOS Domains in the system.

The previous paragraph said NPS 4 is a single domain per package, not
system-wide.

>
> Add RESCTRL_NPS_NODE to enum resctrl_scope and implement
> get_domain_id_nps().
>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v2: Add RESCTRL_NPS_NODE scope to add support for NPS-aligned resource.
> ---
>  arch/x86/kernel/cpu/resctrl/core.c | 20 ++++++++++++++++++++
>  include/linux/resctrl.h            |  1 +
>  2 files changed, 21 insertions(+)
>
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/res=
ctrl/core.c
> index 269265d98ad7..0f58f5e3b853 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -451,6 +451,24 @@ static int l3_mon_domain_mbm_alloc(u32 num_rmid, str=
uct rdt_hw_l3_mon_domain *hw
>         return -ENOMEM;
>  }
>
> +/**
> + * get_domain_id_nps() - Domain id for %RESCTRL_NPS_NODE (AMD NPS / GMBA=
)
> + * @cpu:       CPU to query.
> + *
> + * Global memory bandwidth allocation (GMBA) control domains on AMD foll=
ow
> + * the socket NPS layout. With NPS 4 there is a single control domain pe=
r
> + * package, so every CPU maps to domain id 0. For other NPS settings the
> + * domain matches the CPU's NUMA node.
> + *
> + * Return: 0 when NPS is 4, otherwise the NUMA node id for @cpu.
> + */
> +static int get_domain_id_nps(int cpu)
> +{
> +       if (topology_num_nodes_per_package() =3D=3D 4)
> +               return 0;

ID is 0 regardless of the number of packages, unlike the
RESCTRL_PACKAGE case below?

> +       return cpu_to_node(cpu);
> +}
> +
>  static int get_domain_id_from_scope(int cpu, enum resctrl_scope scope)
>  {
>         switch (scope) {
> @@ -459,6 +477,8 @@ static int get_domain_id_from_scope(int cpu, enum res=
ctrl_scope scope)
>                 return get_cpu_cacheinfo_id(cpu, scope);
>         case RESCTRL_L3_NODE:
>                 return cpu_to_node(cpu);
> +       case RESCTRL_NPS_NODE:
> +               return get_domain_id_nps(cpu);
>         case RESCTRL_PACKAGE:
>                 return topology_physical_package_id(cpu);
>         default:
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 006e57fd7ca5..80290ded0b82 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -271,6 +271,7 @@ enum resctrl_scope {
>         RESCTRL_L2_CACHE =3D 2,
>         RESCTRL_L3_CACHE =3D 3,
>         RESCTRL_L3_NODE,
> +       RESCTRL_NPS_NODE,
>         RESCTRL_PACKAGE,
>  };
>
> --
> 2.43.0
>
