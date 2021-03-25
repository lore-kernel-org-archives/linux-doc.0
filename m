Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF61C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 23:22:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EE5261A0F
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 23:22:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhCYXWD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 19:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbhCYXVt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 19:21:49 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB93FC06175F
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 16:21:48 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id x26so3672345pfn.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 16:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=9Ws84vBwdALUNuDSs4jVAMy+diRDx2Md148g1OQbTTc=;
        b=bIomJr2Bk4Zm9vhKtqgmB0DgBhdG+cAXemq/KNJQ5YjdF4Ir8D3FPn0QzrNvJQji2X
         0FSNW5TDAS+UMEl7QAIPqKT4l92ItP2sI3vIMDpml6JDcdQeH+0GBbK+2yeD05dBYQHk
         rx5DXqpnAmlg6KEw7mE6P1laO6ApWHZvR4K+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=9Ws84vBwdALUNuDSs4jVAMy+diRDx2Md148g1OQbTTc=;
        b=hnGArxkwUL0ypAzcS/KK5QUZt7yitUCM2lpLTFseZX/5RwqALH+uz7bvNpwjh9+Ch5
         nA9eyOWrrkztMNQ72HDgPfCUci95EYGbBi/rJp6FJxRRYSlF2U+TnEBsIHhJ+QML0y/r
         hHLTFM0JbwO2+0566oG9GuHDbJr4IbLLQWj+PhTCy7TIdfyUJQi5z4O6UDYrR7vGAbHy
         odiisPzJQqWsOA5eKYgylqQuD3vUYSU+BcK8mHCBXPD1UcaVwam2jBHoT2ctsivuZKjG
         IuuOq1ukXOZUEJF30MLY+Fn7cs8zZZBBeCWC6QhY059/k7bqwrhl1gADSPV3kL1CfBRq
         EefA==
X-Gm-Message-State: AOAM533PgGmHO6uTJMSI3+wylcyaZbFMRjbeeu8Hn9LTNl4uXy2sDudm
        t0IomAi+y+03kc32tlEhnOZi02t0yYsaew==
X-Google-Smtp-Source: ABdhPJykDfKVVwZo+5CSu0mjkD2WFYRhREfbbV6tuLaHdiUl06r8vWpbnf33gx07jSpcUGpHl/oFiQ==
X-Received: by 2002:a17:902:bc49:b029:e6:6750:7fab with SMTP id t9-20020a170902bc49b02900e667507fabmr12773405plz.4.1616714508455;
        Thu, 25 Mar 2021 16:21:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id v18sm8077901pgo.0.2021.03.25.16.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 16:21:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dbb430e1-2223-9df0-2563-4b017d6b409d@sony.com>
References: <20210324020443.1815557-1-swboyd@chromium.org> <20210324085543.GA2660708@infradead.org> <dbb430e1-2223-9df0-2563-4b017d6b409d@sony.com>
Subject: Re: [PATCH v2 00/12] Add build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Baoquan He <bhe@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Young <dyoung@redhat.com>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Ingo Molnar <mingo@redhat.com>, Jessica Yu <jeyu@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, kexec@lists.infradead.org,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sasha Levin <sashal@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vivek Goyal <vgoyal@redhat.com>, Will Deacon <will@kernel.org>,
        x86@kernel.org
To:     Christoph Hellwig <hch@infradead.org>,
        peter enderborg <peter.enderborg@sony.com>
Date:   Thu, 25 Mar 2021 16:21:46 -0700
Message-ID: <161671450646.3012082.10177164412320557022@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting peter enderborg (2021-03-25 04:06:17)
> On 3/24/21 9:55 AM, Christoph Hellwig wrote:
> > On Tue, Mar 23, 2021 at 07:04:31PM -0700, Stephen Boyd wrote:
> >>  x5 : 0000000000000000 x4 : 0000000000000001
> >>  x3 : 0000000000000008 x2 : ffffff93fef25a70
> >>  x1 : ffffff93fef15788 x0 : ffffffe3622352e0
> >>  Call trace:
> >>   lkdtm_WARNING+0x28/0x30 [lkdtm ed5019fdf5e53be37cb1ba7899292d7e143b2=
59e]
> >>   direct_entry+0x16c/0x1b4 [lkdtm ed5019fdf5e53be37cb1ba7899292d7e143b=
259e]
> > Yikes.  No, please do not make the backtraces a complete mess for
> > something that serves absolutely no need.

It serves a need. Please look at the patches to understand that I'm
adding the buildid to automatically find the associated debug
information on distros.

>=20
> Would a "verbose" flag be acceptable solution?=C2=A0=C2=A0=C2=A0 Somethin=
g like write 1 to /sys/kernel/debug/verbose_stack to get the extra info.
>=20
> I think I see a need for it.
>=20

Or a kernel config option and a commandline parameter? That would be OK
for me as I said on v1 of this series. I'll add that in for the next
patch series given all the distaste for some more hex characters next to
the module name.
