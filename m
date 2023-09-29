Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F367E71D3D
	for <linux-doc@archiver.kernel.org>; Fri, 29 Sep 2023 14:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbjI2OWJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Sep 2023 10:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbjI2OWH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Sep 2023 10:22:07 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9241B0
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 07:22:05 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c6185cafb3so155885ad.1
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695997325; x=1696602125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYEFurrEEC58Pi6MuErcWJ3A1NxFP/ysymFeMwH4+H0=;
        b=mMBB6A5LeNbzcZjewRwcSRWyKv/Ix9npFPNe56/IChsDgxIIKy9kUAZllIkUsFPfkX
         HYFgGux5rx6NgVB1JLOhCi+MXERMWtvL8ImhPfO/viR0jCcwr6bEPnFAVfbK/5YPS0w4
         6zsfu/U1Z6Fa3IYYmrzLfNmRXCSdjkFKYXsy/KzbY2LtklW/nI8J8VH7U3DOZQlbZAXa
         4JJKFWug8DEn944qxSYVI/x585o1tEaw8+IAmTyhYx6e2em0ZIKVEDQnB66ef0u8/tCw
         CTpLkvqIJWHtqO3zkKwaOMvr0FFrYgS8GOIg5B6NO9aW56R2iYbF7r+nnNZ4Rfix0nmW
         E34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695997325; x=1696602125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYEFurrEEC58Pi6MuErcWJ3A1NxFP/ysymFeMwH4+H0=;
        b=R6tfU9WMOLTp6whbbuBObEUqepigMqKLRGJdGjEx0hcvSHr5n3cFJAmt81CYeloI2L
         BU9o0fz5X66Pbnhuk6n7r7TZ7m7TEciihB9LVc1kpQ508mjkJv75uXzevqrp1qGXYLTW
         OkWLPyMoc2pHlM8pMDrvz27TRfF+RsSJuiPep9Q6iqMJLzAxPPUsnzUAunXk5nmRtKhI
         YDa16OHwIFlDXde08GYuuETH9haxmmJG0H5u1kWYFgnLrGWYMGo1NqlwIiu6ZUdA1+w5
         j4KI/F/lcyaI17Fbtu5fFVO60PJEl3VyRbpVKxK64GJU7/k/nHUFAjNY/ulrgulMRf1+
         HjJw==
X-Gm-Message-State: AOJu0YyJISvaM/oRgyK7F564LKf/FN0SL/b5MlzErbIvliPTdz62qsRi
        TGXhdBwiasLAHvfbe3v+Q42EeaHFzFhCo3xHN81AWg==
X-Google-Smtp-Source: AGHT+IHONXaoBfwbXAGD+xhM6NPRFrExlJFSRqqfsw7iuwEyKFEv1rwMEELo7No+ciZsiAeOEkmQIOfvUjDaN2Qc5nA=
X-Received: by 2002:a17:902:ab18:b0:1c4:21fe:2823 with SMTP id
 ik24-20020a170902ab1800b001c421fe2823mr930677plb.13.1695997324947; Fri, 29
 Sep 2023 07:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230829234426.64421-1-tony.luck@intel.com> <20230928191350.205703-1-tony.luck@intel.com>
 <20230928191350.205703-7-tony.luck@intel.com>
In-Reply-To: <20230928191350.205703-7-tony.luck@intel.com>
From:   Peter Newman <peternewman@google.com>
Date:   Fri, 29 Sep 2023 16:21:54 +0200
Message-ID: <CALPaoCh0dzx2T8-u5ZQXXM0XqaZgJbUAGnRVBmbzHmQiHjvWTA@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] x86/resctrl: Introduce snc_nodes_per_l3_cache
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
> Intel Sub-NUMA Cluster (SNC) is a feature that subdivides the CPU cores
> and memory controllers on a socket into two or more groups. These are
> presented to the operating system as NUMA nodes.
>
> This may enable some workloads to have slightly lower latency to memory
> as the memory controller(s) in an SNC node are electrically closer to the
> CPU cores on that SNC node. This cost may be offset by lower bandwidth
> since the memory accesses for each core can only be interleaved between
> the memory controllers on the same SNC node.
>
> Resctrl monitoring on Intel system depends upon attaching RMIDs to tasks
> to track L3 cache occupancy and memory bandwidth. There is an MSR that
> controls how the RMIDs are shared between SNC nodes.
>
> The default mode divides them numerically. E.g. when there are two SNC
> nodes on a socket the lower number half of the RMIDs are given to the
> first node, the remainder to the second node. This would be difficult
> to use with the Linux resctrl interface as specific RMID values assigned
> to resctrl groups are not visible to users.
>
> The other mode divides the RMIDs and renumbers the ones on the second
> SNC node to start from zero.
>
> Even with this redumbering SNC mode requires several changes in resctrl
> behavior for correct operation.

redumbering? Harsh.


> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu=
/resctrl/rdtgroup.c
> index b0901fb95aa9..a5404c412f53 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1357,7 +1357,7 @@ unsigned int rdtgroup_cbm_to_size(struct rdt_resour=
ce *r,
>                 }
>         }
>
> -       return size;
> +       return size / snc_nodes_per_l3_cache;

To confirm, the size represented by a bit goes down rather than the
CBM mask shrinking in each sub-NUMA domain?

I would maybe have expected the CBM mask to already be allocating at
the smallest granularity the hardware supports.

>  }
>
>  /**
> @@ -2590,7 +2590,7 @@ static int rdt_parse_param(struct fs_context *fc, s=
truct fs_parameter *param)
>                 ctx->enable_cdpl2 =3D true;
>                 return 0;
>         case Opt_mba_mbps:
> -               if (!supports_mba_mbps())
> +               if (!supports_mba_mbps() || snc_nodes_per_l3_cache > 1)

Factor into supports_mba_mbps()?

>                         return -EINVAL;
>                 ctx->enable_mba_mbps =3D true;
>                 return 0;
> --
> 2.41.0
>

Reviewed-by: Peter Newman <peternewman@google.com>
