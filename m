Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51538C54EAA
	for <linux-doc@archiver.kernel.org>; Fri, 27 Jan 2023 16:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbjA0QDE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Jan 2023 11:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233036AbjA0QCx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 11:02:53 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E720087360
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 08:02:30 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id w21so2547705qkf.8
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 08:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K6anF/hme5CxdN/v2AxIOwVlqBuJbrYgKdBlK4gdSTc=;
        b=rfn4ZOVzxnWfwhSIE8fkDMAxjolzF6kjdNho2Tt2KbjgrwOdvpYDCJg4XE0UF1ww/a
         DWLoEkC3WvlpmCpGmzy3JCRm3y/ekNQ+VJw9Qg7YbBn+BgaNixIipxSUP2aDLyvAxgxF
         UPK5ciVbW056HreDoSQSF+UlIbC9KGmzM7XwOsEcakZrPTNLVPUt5OPuiasL5WCFprKe
         YIOdWzPY2MmanVRj6NrjOTbou6mKwojzy1wHVjNqyA/zS4Q39L/ppG+JRF63KRUra/KH
         n9N1B4wF13I2sHApXGUIF5wHHVZzE/u49bCFteRMP50r6EZenFdZADc/bJztTjD9/z2R
         ZlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6anF/hme5CxdN/v2AxIOwVlqBuJbrYgKdBlK4gdSTc=;
        b=vwif/Mm+dgcdHcTMgAnH+zLWtj3UNEB6DUxx1QUIhbYbQ9fEbnfAm4hG6+1/6Vc1Pq
         uJKCfM7AxIoHJnLNbmmSdW4itgt9A5pQ+T/bk5vBhOxPN5yS8TNRY7vfkb0bGaqX/ViD
         EFip0FSOXHy0afUNjbXxq7db3aEnk8oT9CU4ejsrcLeYhLd4H7yfK//dfX0vibKF2cuX
         grK6mdHNNBXOqTjmEW31L2nmNkiJsaTPGwjPkS0zbuXp0RdGCF901MF49hS89nBxUVNB
         c6VWRJbNPVAXnuLYGCo1oocjmNBef7+PkP8Zfxijjcm6CzrPEqYtavtrNFvHzTrJ/6G6
         Kf9Q==
X-Gm-Message-State: AFqh2krP7mJgSUfz+B3UdJyVi+4ENWUW5zv2sdaZDQCXfjWdLNOJHe5V
        CrV7Q+Skddn0TCBJuSlwRR+v5ZTtDispjW/+1CTtlw==
X-Google-Smtp-Source: AMrXdXtQsGdbJsrbBeF3q8V17XDVqU2isO6dhJveWB03TYXftJcVZ2ElfilNcMywMtoyOtMxp8PqMFzRNq5S/xKnSpc=
X-Received: by 2002:a05:620a:9cf:b0:706:8a3f:f17a with SMTP id
 y15-20020a05620a09cf00b007068a3ff17amr1913224qky.52.1674835346359; Fri, 27
 Jan 2023 08:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20230126184157.27626-1-tony.luck@intel.com> <20230126184157.27626-4-tony.luck@intel.com>
 <IA1PR11MB6097400A3056553FCC8E193C9BCC9@IA1PR11MB6097.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6097400A3056553FCC8E193C9BCC9@IA1PR11MB6097.namprd11.prod.outlook.com>
From:   Peter Newman <peternewman@google.com>
Date:   Fri, 27 Jan 2023 17:02:15 +0100
Message-ID: <CALPaoCiFotg80LJZ3d+QeO=bNUh85AuP2VgmLaWXX7JaAMYfLQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] x86/resctrl: Add a new node-scoped resource to rdt_resources_all[]
To:     "Yu, Fenghua" <fenghua.yu@intel.com>
Cc:     "Luck, Tony" <tony.luck@intel.com>,
        "Chatre, Reinette" <reinette.chatre@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "x86@kernel.org" <x86@kernel.org>,
        Shaopeng Tan <tan.shaopeng@fujitsu.com>,
        James Morse <james.morse@arm.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Babu Moger <babu.moger@amd.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "patches@lists.linux.dev" <patches@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tony,

On Fri, Jan 27, 2023 at 6:25 AM Yu, Fenghua <fenghua.yu@intel.com> wrote:
>
> On 1/26/23 10:41, Tony Luck wrote:
> > diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> > index 6914232acf84..19be6fe42ef3 100644
> > --- a/arch/x86/kernel/cpu/resctrl/core.c
> > +++ b/arch/x86/kernel/cpu/resctrl/core.c
> > @@ -100,6 +100,16 @@ struct rdt_hw_resource rdt_resources_all[] = {
> >                       .fflags                 = RFTYPE_RES_MB,
> >               },
> >       },
> > +     [RDT_RESOURCE_NODE] =
> > +     {
> > +             .r_resctrl = {
> > +                     .rid                    = RDT_RESOURCE_NODE,
> > +                     .name                   = "L3",
> "L3" was named as RDT_RESOURCE_L3 already. The duplicate name here may
> cause duplicate file names in info dir. Maybe rename it as "L3_NODE"?

I'm trying to get some feedback from our own users on whether changing
the directory names would bother them. At least from my own testing, I
did learn to appreciate the interface change a bit more: I needed an
SNC and non-SNC case to correctly predict which mon_data subdirectory
the data would appear in.

I was able to confirm that this change allows bandwidth to be counted
on RMID/CPU combos where it didn't work before on an SNC2
configuration.

If I'm understanding this correctly, it might be helpful to highlight
that the extra resource is needed to allow a different number of L3
domains in L3 monitoring vs allocation.

Thanks!
-Peter

Tested-By: Peter Newman <peternewman@google.com>
Reviewed-By: Peter Newman <peternewman@google.com>
