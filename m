Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4C54C65
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 00:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712190667; cv=none; b=pAPxO5Oi37L+6RK0uOlMqoOfVRaHIrHiNKIQRrhwq5hF9D+EAoE3VEQMwOs2M8wWZTJvHunkWN1DgEVpBXzcwvf7PR0W5bfGc1LHErM9OOqtiwMqxUr2UF5cAGkM95HxtgA6HuO0DulvCWfMTUW+QY3/ni3Bk0+pc441rcoLuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712190667; c=relaxed/simple;
	bh=UQfToq7sHE8H1SK79LSIX5alp+MDzLz7Pi+OgG0nm6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pY5xA7hcscsNz6jfjf+5K9AUmD+5ueyZZ32wCiy2sOoIwTNnkjUbj85gjZuSabZNcgYlAdoME4TrsSTppwxhycZoUghGtDicX6N+xGWYzvCxVmATvSDWzarlqcKdhNVndlrb8drFENbNPtM5od/IH0sOcYsbDGNMw1x6Ovsup0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lteTYVgA; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lteTYVgA"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-432d55b0fa9so85131cf.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 17:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712190665; x=1712795465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiIJ27wFv77rEJSbeQ8wmknGDI5PJs1qaRDO/vaKY78=;
        b=lteTYVgAf9VjOYK0W9h4y6qvN801C8325t7qw8+bM4ALVcme4TmdUyjpMBQ+t+4UyZ
         jUxDtJnZCu46VlnihYiql1rHRiqRgPBPjA7Va7XiT6p3046QfvqMk0NvqW1FVKZwuhbG
         ZRmk9mXqtJEw5uXYvlQCI///XwKyAte21DeVWrdem3FkL14fmWBY/w2VKFp+eXmc0gfC
         UBFQWoCSOVB9Z67YxZu5Mw9rDq5cvBhabtC4fKrsGnVV5hqTRl8NnS5wQVPg+tMWziV6
         ODF4fMErBqwBfHy8WEx23TDCMLpSD5zga2wka5D6bOtiqDgBsiP5UEcdztEjubGl45Sp
         TveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712190665; x=1712795465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiIJ27wFv77rEJSbeQ8wmknGDI5PJs1qaRDO/vaKY78=;
        b=udM95K2BSV2Ry1oAG8ZTYsl2CHIlxI8uJXoSKplzZceSbUNf56PJenPqCnjA/nTOec
         tTLjIHd9T+++yLfXBZ0W6dKspVnz4xFN34TTwpYngb0Z1jbE7vhADmwZ/uftNoojM7o3
         reNlchwM3l8lsErgCpluDGCROyIIoJC10qWY9PH005fb6/0MKM3dyZyeCJ0GR86dxC26
         x9X5XtiSlB4Ha0wTZBTzpefI/YBtjYEe7SDzjMvFlJN4Em4I0PW7vC0EXZxnfLboBu85
         0Gq0CsQcXyvkMRYdEx5HfXd2CFLF2+XAG8grtdcrPMpgWJwCoK9z2o5FgjW09p+lmzq0
         uQiw==
X-Forwarded-Encrypted: i=1; AJvYcCUU2xy7+0IXIQ/oXhtdrh5/SN3foUtAu8wWhekMakrnQeNmRg/VK4zev1lJAHHFe4rzfCAAhA96/q51EAEgcNRxCWhngbJ+Vu/W
X-Gm-Message-State: AOJu0YzPhN5Rm71uEMVH6tn5ZUx1cXdFA+Ff7UVVNB2jTJjQem6RpQ87
	uTsPqlNSzaQBKeWW1WCyngeifhT2qsr0X53hTvWPWGd1qHL22VVSPc0b3WuOVh9L9t2RAixYT4D
	EGaNWWHbSc9E4TK5aQVxrrgYKmqPEKL8sqfAT
X-Google-Smtp-Source: AGHT+IHQMGoJKpmuRBhGO/nc6Y1VL8a56DE2t917MgYqdaVEfIh6Tq6+DJ4I6gRn4yObflFj0KJjM+GNNall5ISiLQQ=
X-Received: by 2002:a05:622a:154:b0:431:814b:7618 with SMTP id
 v20-20020a05622a015400b00431814b7618mr545679qtw.2.1712190664534; Wed, 03 Apr
 2024 17:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1711674410.git.babu.moger@amd.com> <0db75c94886da62b8da498ef159d8fe27b0b3811.1711674410.git.babu.moger@amd.com>
In-Reply-To: <0db75c94886da62b8da498ef159d8fe27b0b3811.1711674410.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Wed, 3 Apr 2024 17:30:53 -0700
Message-ID: <CALPaoCgRtYLnzpkL6uVjb+LvBbxD8ANRuzACP1UQ=rkzk8TCqg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 07/17] x86/resctrl: Add support to enable/disable
 ABMC feature
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
>  struct rdt_fs_context {
>         struct kernfs_fs_context        kfc;
>         bool                            enable_cdpl2;
> @@ -433,6 +436,7 @@ struct rdt_parse_data {
>   * @mbm_cfg_mask:      Bandwidth sources that can be tracked when Bandwi=
dth
>   *                     Monitoring Event Configuration (BMEC) is supporte=
d.
>   * @cdp_enabled:       CDP state of this resource
> + * @abmc_enabled:      ABMC feature is enabled
>   *
>   * Members of this structure are either private to the architecture
>   * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g=
.
> @@ -448,6 +452,7 @@ struct rdt_hw_resource {
>         unsigned int            mbm_width;
>         unsigned int            mbm_cfg_mask;
>         bool                    cdp_enabled;
> +       bool                    abmc_enabled;
>  };
>
>  static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_res=
ource *r)
> @@ -491,6 +496,13 @@ static inline bool resctrl_arch_get_cdp_enabled(enum=
 resctrl_res_level l)
>
>  int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
>
> +static inline bool resctrl_arch_get_abmc_enabled(enum resctrl_res_level =
l)
> +{
> +       return rdt_resources_all[l].abmc_enabled;
> +}

This inline definition will not work in either this file or
fs/resctrl/internal.h, following James's change[1] moving the code.

resctrl_arch-definitions are either declared in linux/resctrl.h or
defined inline in a file like asm/resctrl.h.


> +
> +int resctrl_arch_set_abmc_enabled(enum resctrl_res_level l, bool enable)=
;
> +
>  /*
>   * To return the common struct rdt_resource, which is contained in struc=
t
>   * rdt_hw_resource, walk the resctrl member of struct rdt_hw_resource.
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu=
/resctrl/rdtgroup.c
> index 05f551bc316e..f49073c86884 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -850,9 +850,15 @@ static int rdtgroup_mbm_assign_show(struct kernfs_op=
en_file *of,
>                                     struct seq_file *s, void *v)
>  {
>         struct rdt_resource *r =3D of->kn->parent->priv;
> +       struct rdt_hw_resource *hw_res =3D resctrl_to_arch_res(r);
>
> -       if (r->mbm_assign_capable)
> +       if (r->mbm_assign_capable && hw_res->abmc_enabled) {
> +               seq_puts(s, "[abmc]\n");
> +               seq_puts(s, "legacy_mbm\n");
> +       } else if (r->mbm_assign_capable) {
>                 seq_puts(s, "abmc\n");
> +               seq_puts(s, "[legacy_mbm]\n");
> +       }

This looks like it would move to fs/resctrl/rdtgroup.c where it's not
possible to dereference an rdt_hw_resource struct.

It might be helpful to try building your changes on top of James's
change[1] to get an idea of how this would fit in post-refactoring.
I'll stop pointing out inconsistencies with his portability scheme
now.

>
>         return 0;
>  }
> @@ -2433,6 +2439,74 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_=
level l, bool enable)
>         return 0;
>  }
>
> +static void resctrl_abmc_msrwrite(void *arg)
> +{
> +       bool *enable =3D arg;
> +       u64 msrval;
> +
> +       rdmsrl(MSR_IA32_L3_QOS_EXT_CFG, msrval);
> +
> +       if (*enable)
> +               msrval |=3D ABMC_ENABLE;
> +       else
> +               msrval &=3D ~ABMC_ENABLE;
> +
> +       wrmsrl(MSR_IA32_L3_QOS_EXT_CFG, msrval);
> +}
> +
> +static int resctrl_abmc_setup(enum resctrl_res_level l, bool enable)
> +{
> +       struct rdt_resource *r =3D &rdt_resources_all[l].r_resctrl;
> +       struct rdt_domain *d;
> +
> +       /* Update QOS_CFG MSR on all the CPUs in cpu_mask */
> +       list_for_each_entry(d, &r->domains, list) {
> +               on_each_cpu_mask(&d->cpu_mask, resctrl_abmc_msrwrite, &en=
able, 1);
> +               resctrl_arch_reset_rmid_all(r, d);
> +       }
> +
> +       return 0;
> +}
> +
> +static int resctrl_abmc_enable(enum resctrl_res_level l)
> +{
> +       struct rdt_hw_resource *hw_res =3D &rdt_resources_all[l];
> +       int ret =3D 0;
> +
> +       if (!hw_res->abmc_enabled) {
> +               ret =3D resctrl_abmc_setup(l, true);
> +               if (!ret)
> +                       hw_res->abmc_enabled =3D true;

Presumably this would be called holding the rdtgroup_mutex? Perhaps a
lockdep assertion somewhere would be appropriate?

Thanks!
-Peter

[1] https://lore.kernel.org/lkml/20240321165106.31602-32-james.morse@arm.co=
m/
