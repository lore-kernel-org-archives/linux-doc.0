Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A019C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 22:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01667611CE
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 22:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347448AbhDMWhV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 18:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhDMWhU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 18:37:20 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8902AC061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 15:37:00 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id m18so6813524plc.13
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 15:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Z8LMkVFdC3qnq2dD8BfKPmtkUYkpr1QRCTd0fnRzxxI=;
        b=KStbKjAzb6vdr/sBL0HSB39SMn4gVlGAgmmlC2FTK88ze+zyBYlLPlno47J42f+b5N
         85pOJjA/9l9W0ZOmZSAi4tH0EpPuTGlVSauT3Y+Rmx2DuZnhwrn/Ti+Bd9gjjjfS7ddf
         2Z6kDhda9hfJdVJ9rZGG4mL1d7K3G8NDjO0Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Z8LMkVFdC3qnq2dD8BfKPmtkUYkpr1QRCTd0fnRzxxI=;
        b=ZiRVnBeAfvk0TetE9kws5KWUVBZxGqPEfymTYPF+zWJ85uyB1xRRXIIConq3HEs0pm
         QuyUiNQ+P+A5SfSg63clUSSoS7ZAASpW8Wd4E22CCoWyDGRgqDLyoNYNEGwXe6IV5uFK
         9jDSTOOmBA0US6Yu5gw3aPH16MrAGuAuCOsKUoZME4tquHlRmPAIPNQifwWh+UHwzEK+
         ER0KN2t1mGnzYa4j80s+y8LewDHu6cODtBsyF8Z3EcjwsLKHtk5aL7ZHkBHAs/2y5xJI
         THijTGhiqgn6n4Y2fojy1C5DaLRZYFhF8FiL+p4r521IBlkMLBICPEatyawrYB7QSIEk
         wEcA==
X-Gm-Message-State: AOAM530TxSgi7P0ENoBLXfKnOAk7w86vIF9JbVYgZUqPfmk4C3TorRB0
        +nxGsFkbmWweObkyuLVToqR/Hw==
X-Google-Smtp-Source: ABdhPJxKMRmRcunkUsRcrSC97ypk9VSR1U5pI4iIvlJwEaSKwnBQgIs3iflhoQTlZw55U4FVR3R2aw==
X-Received: by 2002:a17:903:208d:b029:e9:9214:432e with SMTP id d13-20020a170903208db02900e99214432emr29350932plc.59.1618353420100;
        Tue, 13 Apr 2021 15:37:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
        by smtp.gmail.com with ESMTPSA id w18sm3052080pjh.19.2021.04.13.15.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 15:36:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <161834460576.3764895.758141455860109099@swboyd.mtv.corp.google.com>
References: <20210410015300.3764485-1-swboyd@chromium.org> <20210410015300.3764485-6-swboyd@chromium.org> <YHQ1yqVkweZeN5+1@smile.fi.intel.com> <161825574550.3764895.4387100574176584209@swboyd.mtv.corp.google.com> <YHV4369VJAGpfW/c@smile.fi.intel.com> <YHW1xBvOeHrAHWkK@alley> <161834460576.3764895.758141455860109099@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 05/13] module: Add printk formats to add module build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>
Date:   Tue, 13 Apr 2021 15:36:57 -0700
Message-ID: <161835341789.3764895.11018828620037960038@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Stephen Boyd (2021-04-13 13:10:05)
> Quoting Petr Mladek (2021-04-13 08:16:20)
> > On Tue 2021-04-13 13:56:31, Andy Shevchenko wrote:
> > > On Mon, Apr 12, 2021 at 12:29:05PM -0700, Stephen Boyd wrote:
> > > > Quoting Andy Shevchenko (2021-04-12 04:58:02)
> > > > >=20
> > > > > First of all, why not static_assert() defined near to the actual =
macro?
> > > >=20
> > > > Which macro? BUILD_ID_SIZE_MAX?
> > >=20
> > > Yes.
> > >=20
> > > > I tried static_assert() and it didn't
> > > > work for me but maybe I missed something.
> >=20
> > I guess that you wanted to use it inside macro definition:
> >=20
> > #define VMCOREINFO_BUILD_ID(value) \
> >         static_assert(ARRAY_SIZE(value) =3D=3D BUILD_ID_SIZE_MAX); \
> >         vmcoreinfo_append_str("BUILD-ID=3D%20phN\n", value)
> >=20
> > Instead, you should do it outside the macro:
> >=20
> > static_assert(ARRAY_SIZE(value) =3D=3D BUILD_ID_SIZE_MAX);
> > #define VMCOREINFO_BUILD_ID(value) \
> >         vmcoreinfo_append_str("BUILD-ID=3D%20phN\n", value)
>=20
> In this example "value" is not defined because it's an argument to the
> macro. How can this work?
>=20
> From what I can tell static_assert() is for the case that you want to
> assert something at the global scope level. BUILD_BUG_ON() can't be used
> at global scope. I see the usage is usually to assert struct members and
> alignment of those members. In turn, static_assert() can't be used at
> function level scope. Each has a use and in this case I want to assert
> at function level scope to be as close as possible to the place that
> would need to change.
>=20

Good news. I can do this to force a basic block and then GCC doesn't compla=
in.

---8<---
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 2174dab16ba9..de62a722431e 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -38,9 +38,12 @@ phys_addr_t paddr_vmcoreinfo_note(void);

 #define VMCOREINFO_OSRELEASE(value) \
        vmcoreinfo_append_str("OSRELEASE=3D%s\n", value)
-#define VMCOREINFO_BUILD_ID(value) \
-       BUILD_BUG_ON(ARRAY_SIZE(value) !=3D BUILD_ID_SIZE_MAX); \
-       vmcoreinfo_append_str("BUILD-ID=3D%20phN\n", value)
+#define VMCOREINFO_BUILD_ID()                                          \
+       ({                                                              \
+               static_assert(sizeof(vmlinux_build_id) =3D=3D 20);         =
 \
+               vmcoreinfo_append_str("BUILD-ID=3D%20phN\n", vmlinux_build_=
id); \
+       })
+
 #define VMCOREINFO_PAGESIZE(value) \
        vmcoreinfo_append_str("PAGESIZE=3D%ld\n", value)
