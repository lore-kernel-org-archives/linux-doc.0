Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649F7C433C1
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 23:19:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33B9A61A0D
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 23:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbhCYXTX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 19:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbhCYXS5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 19:18:57 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A582C06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 16:18:57 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id g15so3634041pfq.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=E8j/bdX2kJWue1KfFfCvsB+FUorkATZNWqrPIA9V9io=;
        b=fPenDc9g4ElZjbnp9wO0ZEo9yJBBmKT4skMDK1gIw7yzZ35xxLWcOcn7+Y1OvWo2op
         WbNhplaWof6tDYhjhgoYKgr1C4E6/xabG93hv9JLwCaXf0NIIy2XegAbUI37I+y68UHS
         BHZIs0CAvyofBUY/+7sH2EXthFU/EzsBjQcCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=E8j/bdX2kJWue1KfFfCvsB+FUorkATZNWqrPIA9V9io=;
        b=bJmfCUUZGFylsdSVGLNnbtF8ap6+84fQTbLvLIz6mkRvStZ2gEA0ffXh8JUcTjUDjm
         Wp16Rl5X5bCN7Qeck7lxWdGv+LSgXOpjFSoYMFl7UkA8+affAAjx/+fW8qJahRasEQxZ
         TURk7izdUD9mW0uuac7seUE1zjaFk1GATr/NzgsSRohXqatls1HXScqdeJVUNCVmCrv0
         cK4n+VmD0LqYz1RMvkU2ub2ZbMjsyw2e7whCXm826VhNDkl4wn/+5AQOOEJpobFkJB9d
         ZBQcumiGccIWgNd+8lcKzPv2ouYBUqFb9EEYO8lVFm58h9505iNVO9WcoEK00Wbgpcbi
         y7XA==
X-Gm-Message-State: AOAM532CIoXXUx/zMfoKC8U6pfmQ3mZfHw5OoU1eU8YjUHu7U+LHHeUa
        yxiXDnmvKoM9X8Veqb5Y2fLe9A==
X-Google-Smtp-Source: ABdhPJys5ddfm6i49Gf1rvQpJirSrhY5z4HOtE0oXEK58wl0DIRsoGxj6h+wB3BH871rWsH7gxPVtw==
X-Received: by 2002:a63:24d:: with SMTP id 74mr9447813pgc.98.1616714336899;
        Thu, 25 Mar 2021 16:18:56 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id z18sm7253821pfa.39.2021.03.25.16.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 16:18:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a7a5e6b4-109b-fdf6-5d72-1d8675a2b1ae@sony.com>
References: <20210324020443.1815557-1-swboyd@chromium.org> <a7a5e6b4-109b-fdf6-5d72-1d8675a2b1ae@sony.com>
Subject: Re: [PATCH v2 00/12] Add build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
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
To:     Andrew Morton <akpm@linux-foundation.org>,
        peter enderborg <peter.enderborg@sony.com>
Date:   Thu, 25 Mar 2021 16:18:54 -0700
Message-ID: <161671433461.3012082.9521190652380269571@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting peter enderborg (2021-03-25 04:14:31)
> >   el0_sync_compat_handler+0xa8/0xcc
> >   el0_sync_compat+0x178/0x180
> >  ---[ end trace 3d95032303e59e68 ]---
>=20
> How will this work with the ftrace?
>=20

It won't affect ftrace, if that's the question you're asking.
