Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2FAC4360C
	for <linux-doc@archiver.kernel.org>; Wed,  3 Mar 2021 10:39:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD3B64EF6
	for <linux-doc@archiver.kernel.org>; Wed,  3 Mar 2021 10:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhCCKgx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 05:36:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2361116AbhCBXZ2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 18:25:28 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4D7C061788
        for <linux-doc@vger.kernel.org>; Tue,  2 Mar 2021 15:24:48 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id d13-20020a17090abf8db02900c0590648b1so1917387pjs.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Mar 2021 15:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=cVH5d/wlkVioJQ8yaRjGio3SpYP+21NMWCupiYF1zx0=;
        b=ZZ9TYiWE+HaCf38K23Z0mjbPlwSC7Mpp2LTsWQfleMxBr4rObP317sK7ZdUNxOll0X
         FWLhYARPvJNfcrwwzUbFf3r12KOCKxrrOnA8zjRgEKEYKwcykyv8XfN56OCs9dCV2gif
         cw0yeZCsZBlQpAVqag7uBB+HSMW1CZ9OhFC9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=cVH5d/wlkVioJQ8yaRjGio3SpYP+21NMWCupiYF1zx0=;
        b=FLRbZwyo/4FoREzQLGVJRRz1OP+m5emisq373TIvqLgaY5v6wJVFcSG90J2q4vdC9Z
         +gKSdmPNFroPbqvwcR2XGnrH2npFGefvZ588QrREwdSJrqaoTS6hOk7e19aJqmL7lH4J
         vXr47ZIVOTnC9zm1o7vsQWJhd88YXLGjV1/b3LptcucwIPWR79FMcD0HPQDRkzIBiAZc
         D9pZlnpcFdhWOpbEaOZTrfJ9ul3e8e881/6jn48RJVoUJ5DFpByaipWWhPcX1gEIowzv
         vIJqcpfba4IgMgmTt0zVHSzTh/AqvKx4xBiSqb2CnqGEaitpBK4tZqASiTG3ElqGuave
         FwyQ==
X-Gm-Message-State: AOAM533lHIaKxXbMuYngE3+rXXwexRPwfPiynHC94NUQmsg1uCquyP2f
        pruHnzHs8QuHtz8NGyUqeag9HA==
X-Google-Smtp-Source: ABdhPJx2JFIPDEGodpwstGmoV3rikG48R+IdlndamcWqTTLhtHjYOUQS/fBVQdkv6MgRQBu+0swIng==
X-Received: by 2002:a17:90a:6587:: with SMTP id k7mr6812294pjj.34.1614727488133;
        Tue, 02 Mar 2021 15:24:48 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id cv3sm4694590pjb.9.2021.03.02.15.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 15:24:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210301214319.7e54c66f@oasis.local.home>
References: <20210301174749.1269154-1-swboyd@chromium.org> <20210301174749.1269154-6-swboyd@chromium.org> <20210301214319.7e54c66f@oasis.local.home>
Subject: Re: [PATCH 5/7] printk: Make %pS and friends print module build ID
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org
To:     Steven Rostedt <rostedt@goodmis.org>
Date:   Tue, 02 Mar 2021 15:24:46 -0800
Message-ID: <161472748610.1478170.16522080242572382702@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Steven Rostedt (2021-03-01 18:43:19)
> On Mon,  1 Mar 2021 09:47:47 -0800
> Stephen Boyd <swboyd@chromium.org> wrote:
>=20
> > The %pS printk format (among some others) is used to print kernel
> > addresses symbolically. When the kernel prints an address inside of a
> > module, the kernel prints the addresses' symbol name along with the
> > module's name that contains the address. Let's make kernel stacktraces
> > easier to identify on KALLSYMS builds by including the build ID of a
> > module when we print the address.
>=20
> Please no!
>=20
> This kills the output of tracing with offset, and can possibly break
> scripts. I don't want to look at traces like this!
>=20
>           <idle>-0       [004] ..s1   353.842577: ipv4_conntrack_in+0x0/0=
x10 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051) <-nf_hook_slo=
w+0x40/0xb0
>           <idle>-0       [004] ..s1   353.842577: nf_conntrack_in+0x0/0x5=
c0 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051) <-nf_hook_slow=
+0x40/0xb0
>           <idle>-0       [004] ..s1   353.842577: get_l4proto+0x0/0x190 [=
nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051) <-nf_conntrack_in+=
0x92/0x5c0 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051)
>           <idle>-0       [004] ..s1   353.842577: nf_ct_get_tuple+0x0/0x2=
40 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051) <-nf_conntrack=
_in+0xec/0x5c0 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051)
>           <idle>-0       [004] ..s1   353.842577: hash_conntrack_raw+0x0/=
0x170 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051) <-nf_conntr=
ack_in+0x28c/0x5c0 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051)
>           <idle>-0       [004] ..s1   353.842578: __nf_conntrack_find_get=
.isra.0+0x0/0x2f0 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051)=
 <-nf_conntrack_in+0x29d/0x5c0 [nf_conntrack] (3b39eb771b2566331887f671c741=
f90bfba0b051)
>           <idle>-0       [004] ..s1   353.842578: nf_conntrack_tcp_packet=
+0x0/0x1760 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051) <-nf_=
conntrack_in+0x3c8/0x5c0 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfb=
a0b051)
>           <idle>-0       [004] ..s2   353.842578: nf_ct_seq_offset+0x0/0x=
40 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051) <-nf_conntrack=
_tcp_packet+0x26d/0x1760 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfb=
a0b051)
>           <idle>-0       [004] ..s1   353.842578: __nf_ct_refresh_acct+0x=
0/0x50 [nf_conntrack] (3b39eb771b2566331887f671c741f90bfba0b051) <-nf_connt=
rack_tcp_packet+0x558/0x1760 [nf_conntrack] (3b39eb771b2566331887f671c741f9=
0bfba0b051)
>=20
>  NACK!
>=20

Heh, OK. Would adding a new printk format work then? From after the cut:

> Yet another alternative is to add a printk format like %pSB for
> backtrace prints. This would require a handful of architecture updates
> and I'm not sure it's worth the effort for that.
>

Or maybe take the approach of putting all the linked in module build IDs
in the "Modules linked in:" section? But as I said in the commit text
that can become quite verbose. Looking forward to your suggestions here.
