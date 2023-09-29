Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF75E81810
	for <linux-doc@archiver.kernel.org>; Fri, 29 Sep 2023 12:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbjI2MJ6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Sep 2023 08:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbjI2MJ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Sep 2023 08:09:57 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA851AC
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 05:09:54 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c6052422acso127005ad.1
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695989394; x=1696594194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tGzWMVpNkHmeXd9+StiHUNQluJqc763pD7utN+gAfM=;
        b=lIZLGgc3FGBDEM3LvSQV6xR4q+MYJR68AW3/OBOG30NyaDgJLCeWn6MVASZ1/4oTgm
         c+Uoaxfpz5qtMU+r9IV1WoFdGEv1HLzt7Q/MDNZXxeRzLzZfq5Z9nr4O4ofKPS3HP9DT
         BUgR3dUfXS5C0tRY5sGaTFPr2cTOYLLf8PqQ4HX+iLc2+ua/cg7ecF28EdZ4Los9j4e1
         SktCelYfHDU9ahA0PTV2cPEeIaujRLFGJUlaF0gDSDKvdxRwLshN5abNxdbpailfqOcb
         eQem9aYEjWBzl38f/LSyP5OcIFf2DmrvJhnLqR2H0ochjdLivJB3NlLedu5wXKP0UqZh
         6Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695989394; x=1696594194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tGzWMVpNkHmeXd9+StiHUNQluJqc763pD7utN+gAfM=;
        b=NSjNO1NTMhcJBxp5ZUzltVTetHLXI0unRpO+DGntVcvO9r7d7uP1JzerEAUxQr5ScJ
         MX4LAA4/AEbnVAPByTVLDervGE8bVuixQysBjoHKxNUWYXditPCisK71ymDQPhkUlGLB
         voaoHSuEzR0ZCK+RrDb/nrGqH1IGHt4IrkeqAUvluT5NIcuZNIkud3WfTizytqKiX4kL
         8/RzseI+F0UluuBH+jLKEw75li722FzCNf3m8ul5UmFWLajkYcb1qfY/ACr1V7H3a5k6
         bI/DO2zpz4RzScNTRKS/OLaK/FsA672vewJo6yp1ji3OLbcrVGEHC43vq6wDZd+IK6us
         fbCQ==
X-Gm-Message-State: AOJu0YxFtBRzdAbwhSA6GpKsGz69VhdzPXcCq44eyrktoJw/3ysPnesL
        Afs8FGgIusgX8ltZ5HeXj7i/qD9lN4s3fH/Wk4AIhw==
X-Google-Smtp-Source: AGHT+IGAyzbcOgd6nPp6UOIxRKbhqiu2HpCgiw/uVXKwWYpgnvy9crMH7Z9DQ1+e2bfTSz/u+4JbsS+CF3ZpoGwSaFs=
X-Received: by 2002:a17:903:2447:b0:1bc:66f2:4bb with SMTP id
 l7-20020a170903244700b001bc66f204bbmr957738pls.8.1695989393847; Fri, 29 Sep
 2023 05:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230829234426.64421-1-tony.luck@intel.com> <20230928191350.205703-1-tony.luck@intel.com>
 <20230928191350.205703-2-tony.luck@intel.com>
In-Reply-To: <20230928191350.205703-2-tony.luck@intel.com>
From:   Peter Newman <peternewman@google.com>
Date:   Fri, 29 Sep 2023 14:09:42 +0200
Message-ID: <CALPaoChB5ryT96ZZBQb6+3=xO+A0uR-ToN0TWqUjLJ7bgi==Rg@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] x86/resctrl: Prepare for new domain scope
To:     Tony Luck <tony.luck@intel.com>
Cc:     Fenghua Yu <fenghua.yu@intel.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org,
        Shaopeng Tan <tan.shaopeng@fujitsu.com>,
        James Morse <james.morse@arm.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Babu Moger <babu.moger@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tony,

On Thu, Sep 28, 2023 at 9:14=E2=80=AFPM Tony Luck <tony.luck@intel.com> wro=
te:
>
> Resctrl resources operate on subsets of CPUs in the system with the
> defining attribute of each subset being an instance of a particular
> level of cache. E.g. all CPUs sharing an L3 cache would be part of the
> same domain.
>
> In preparation for features that are scoped at the NUMA node level
> change the code from explicit references to "cache_level" to a more
> generic scope. At this point the only options for this scope are groups
> of CPUs that share an L2 cache or L3 cache.
>
> Provide a more detailed warning message if a domain id cannot be found
> when adding a CPU. Just check and silent return if the domain id can't
> be found when removing a CPU.
>
> No functional change.

I see a number of diagnostic checks added below. Are you sure there's
no functional change?


> diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/=
cpu/resctrl/pseudo_lock.c
> index 8f559eeae08e..8c5f932bc00b 100644
> --- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> +++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> @@ -292,10 +292,14 @@ static void pseudo_lock_region_clear(struct pseudo_=
lock_region *plr)
>   */
>  static int pseudo_lock_region_init(struct pseudo_lock_region *plr)
>  {
> +       int scope =3D plr->s->res->scope;
>         struct cpu_cacheinfo *ci;
>         int ret;
>         int i;
>
> +       if (WARN_ON_ONCE(scope !=3D RESCTRL_L2_CACHE && scope !=3D RESCTR=
L_L3_CACHE))
> +               return -ENODEV;

Functional change?


> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu=
/resctrl/rdtgroup.c
> index 725344048f85..1cf2b36f5bf8 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1345,10 +1345,13 @@ unsigned int rdtgroup_cbm_to_size(struct rdt_reso=
urce *r,
>         unsigned int size =3D 0;
>         int num_b, i;
>
> +       if (WARN_ON_ONCE(r->scope !=3D RESCTRL_L2_CACHE && r->scope !=3D =
RESCTRL_L3_CACHE))
> +               return -EINVAL;

This function returns unsigned int. That's a huge region!

-Peter
