Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8184C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jul 2022 21:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235308AbiGSVcs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jul 2022 17:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234436AbiGSVcr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 17:32:47 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF8A52441
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 14:32:46 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id r9so27080463lfp.10
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Dq3BidAWXF3mZuD1Rh6w8sj6eQVsyFOTXwTqdKPDzg=;
        b=o2UbTMDQRvmAaj4IvLkNE/FiXkeD+SDSNUB8fRNlE/PGQBHuurKZjnvjeYWbN9Juii
         YpvH2w4grIewoEF/OOp/BHDkXumod/MThxXEVdMPGiLUaH0DbASqUjfcpo1CkvWcgek9
         oWcBsORW5NBNXbn/foFhhDkjDHu4/H2kc1AjHlS5gL8TKb3c9mz9KvlPAvcFQCMW/sFG
         pKb/pTaK6yJcBWDc0++c5eoOiboyIp2PZQEhd12akE80lvbwo5utANs6F6hwfLfEktyo
         CVuJK4BLxqzvYp482dPxWddJRg1FcsrO8F46QcL7TyVmR+HwlqkeDXhNrcBENvBxsETE
         sFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Dq3BidAWXF3mZuD1Rh6w8sj6eQVsyFOTXwTqdKPDzg=;
        b=b58svLJCMePR1tjbcfAW3K3VdtXB1qfs2Qv3NJEs9QVk/zCMjh9Bzkjl1/xLr3QUmr
         oH3UVQD9xb4WXQfdfHsdEXHWaKQekpmB7RGuMjV9CIj+uVmEbl9qG4dTqc6AWaf92cUh
         CsyvlXHFYXYgUetyJyG5mH3lS+EQRWWLzNrrx/Bjk2zMxegty9VrouiSAutAZ05QCxsP
         prH/tD/o3+hig2467iWPW0AhKnlnkiuYXukiY/A3yDmsz+YHkm/C2duDhC95gvnlJkQ9
         mRm/8lxl//xOztyfER1jcCXu8OO0Eqx4Zs/17IcWRGqCofJZE8F9QirBtYeNowUIyH/R
         pYew==
X-Gm-Message-State: AJIora/zDrYKtIEnGPBAaRS75JZqfJJa0d6vk3rIni+JIRLdU8Q/Ephl
        Qgb9cHyClvzbOfa26t1MdvNF9xjoEZdbpcjjEK4=
X-Google-Smtp-Source: AGRyM1vUDarry3sxaIPHoEon1C7UCSFnpWbIAp0eLFRV9Ylv0ac2Fzv7bwc9MUnLIgOSCVGIW/refjMruYEVb/iUNII=
X-Received: by 2002:a05:6512:159c:b0:489:e201:1736 with SMTP id
 bp28-20020a056512159c00b00489e2011736mr18730851lfb.374.1658266364996; Tue, 19
 Jul 2022 14:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220718194717.31319-1-jim.cromie@gmail.com> <20220718194717.31319-20-jim.cromie@gmail.com>
 <7290298b-b615-c80c-8d7f-e05ad6e5eb0a@gmail.com>
In-Reply-To: <7290298b-b615-c80c-8d7f-e05ad6e5eb0a@gmail.com>
From:   jim.cromie@gmail.com
Date:   Tue, 19 Jul 2022 15:32:18 -0600
Message-ID: <CAJfuBxwYnMDGBzu-Q2XzpeZ_d-5WidbJ20x=s7Tyc7cujN57ew@mail.gmail.com>
Subject: Re: [PATCH v4 19/41] doc-dyndbg: edit dynamic-debug-howto for
 brevity, audience
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     lkml@kernel.org, Jason Baron <jbaron@akamai.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 18, 2022 at 7:44 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 7/19/22 02:46, Jim Cromie wrote:
> > -You can view the currently configured behaviour of all the debug
> > -statements via::
> > +You can view the currently configured behaviour in the *prdbg* catalog:
> >
> > -  nullarbor:~ # cat <debugfs>/dynamic_debug/control
> > +  :#> head -n7 /proc/dynamic_debug/control
> >    # filename:lineno [module]function flags format
> > -  net/sunrpc/svc_rdma.c:323 [svcxprt_rdma]svc_rdma_cleanup =_ "SVCRDMA Module Removed, deregister RPC RDMA transport\012"
> > -  net/sunrpc/svc_rdma.c:341 [svcxprt_rdma]svc_rdma_init =_ "\011max_inline       : %d\012"
> > -  net/sunrpc/svc_rdma.c:340 [svcxprt_rdma]svc_rdma_init =_ "\011sq_depth         : %d\012"
> > -  net/sunrpc/svc_rdma.c:338 [svcxprt_rdma]svc_rdma_init =_ "\011max_requests     : %d\012"
> > -  ...
> > +  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
> > +  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
> > +  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
> > +  init/main.c:1426 [main]run_init_process =_ "    %s\012"
> > +  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
> > +  init/main.c:1429 [main]run_init_process =_ "    %s\012"
> >
>
> The block above is screen output, so keep using literal code block
> marker (::).
>

yup.


> What isn't described in the patch description is $PS1, which changed
> to just root prompt (without username).
>

I lumped it under general de-cluttering.
the alias makes the pwd irrelevant, so no point in showing it.
I'll add a note to the commit-msg

>
> > +Kernel Configuration
> > +====================
> > +
> > +Dynamic Debug is enabled via kernel config items:
> > +
> > +  CONFIG_DYNAMIC_DEBUG=y     # build catalog, enables CORE
> > +  CONFIG_DYNAMIC_DEBUG_CORE=y        # enable mechanics only, skip catalog
> > +
>
> Also use literal code blockhere
>
> > +Fedora's distro-kernel has both, and has 7250 *prdbgs*.  Each callsite
> > +record uses 56 bytes, so the impact on memory is non-trivial.
> > +
> > +If you do not want to enable dynamic debug globally (i.e. in some embedded
> > +system), you may set ``CONFIG_DYNAMIC_DEBUG_CORE`` as basic support of dynamic
> > +debug and add ``ccflags := -DDYNAMIC_DEBUG_MODULE`` into the Makefile of any
> > +modules which you'd like to dynamically debug later.
> > +
>
> This assumes one has Fedora installed, so I think this should be
> written as distro-agnostic.
>

I just used the specifics I knew.
The point was size info tradeoffs for folks building their own kernels.
I'll just drop it, the numbers are subject to change anyway.

> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
