Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 089FA7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 Oct 2019 10:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731534AbfJXKqT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 Oct 2019 06:46:19 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36050 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730032AbfJXKqT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Oct 2019 06:46:19 -0400
Received: by mail-qk1-f193.google.com with SMTP id y189so22964656qkc.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2019 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G11veEDwRRtVECFg7gLtwnqO3RbQT5sno5+UXzVEXSg=;
        b=ekruNEz5Dsu5+RobqAiVscjSTBrA9KrZTNIcS2Yyis9GeB1DC3JqNwbOBOp9455aDX
         HfDF+okJhIRqLi3jnn7S9YXZqQUoBo1E9ByUB7xst1rOvwTHjq60BIpKwFD5tosqcgGG
         0cLiLl8UF5F7PVWqB4H8O8yGIkQlYA0immj93XMhfn9/TM0qnrFlu0gCtbdFeQ7FktQ+
         zzOKPMouin50Cs4kBWdxP/wbIVAUdpqZB193gFkPFeVfMSQMyKP7rXZG/xx5PkAp3U9r
         eaPq/Rp9we8jraxJngMOkoYKipDtab4ydftcYq8g+5OYimaUyeKDQ9aGbG2OSGDxyGqY
         evPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G11veEDwRRtVECFg7gLtwnqO3RbQT5sno5+UXzVEXSg=;
        b=N3AoHqNYkHaaCyUUV8xHLfIZpuTjJfn1P+0+g4k1DZIdU/U08GvWoHJnkeza11RRsY
         zsJxHdK3d6gKDl5VqMiIjLujRp7jnbBhHr+lFV8kFI3FleKOmv+ZQCH60K0955ZKhX2y
         N8BM9wJyDegBJu66D+FY/v/KXh4ewApJHndrNTUuimu0PjZd6YxB0iCBzBWFw7/4CkeI
         lkowLjFqS9fl6pz73jhLkOt1dbuO0W54ZH/gAu34jeCOllq02c8+Yhg9czDtpl5Jf0xS
         TTCgqBla1OiKiyHnotdZZieDuTilb1jNZ1j/2BCu1P33/UdAoI+GTEetjfPo7Vufm2yN
         Xb/Q==
X-Gm-Message-State: APjAAAUVpi2/G6JqTsR84uvbmmn+Qzxgt26muwmQxg4gWFuBBxWvEi/0
        +xaqgLqmNwZGQ2lMRIN+UYKqsoiy773S5KyuVvJnDw==
X-Google-Smtp-Source: APXvYqwo/b+2HVcnyVCcfZFbVXzCjk3hhRNuG9DqvZ0qdvEGSZIWiom+14vAVEWOoaAFprOhB5tUTPjcnRXq/CV42To=
X-Received: by 2002:a37:bbc5:: with SMTP id l188mr12631714qkf.118.1571913978255;
 Thu, 24 Oct 2019 03:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191015212004.24748-1-mike.leach@linaro.org> <20191015212004.24748-11-mike.leach@linaro.org>
 <20191018162009.GB12883@xps15> <CANLsYkyYwNv0dApJws+e=M3h6MKqX7triVgY6qy74oOYJe7FMw@mail.gmail.com>
In-Reply-To: <CANLsYkyYwNv0dApJws+e=M3h6MKqX7triVgY6qy74oOYJe7FMw@mail.gmail.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Thu, 24 Oct 2019 11:46:07 +0100
Message-ID: <CAJ9a7VgKwZSjh13_f1QgJVAPgt2=1AnC0rm+gYS+=G-c8NWxBg@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] coresight: docs: Create common sub-directory for
 coresight trace.
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jon Corbet <corbet@lwn.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

OK redone with patch09 split, indexes sorted - coresight now has its
own sub-index.
v5 to follow with the docs only patches.

Mike

On Fri, 18 Oct 2019 at 18:31, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Fri, 18 Oct 2019 at 10:20, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, Oct 15, 2019 at 10:20:03PM +0100, Mike Leach wrote:
> > > There are two files in the Documentation/trace directory relating to
> > > coresight, with more to follow, so create a Documentation/trace/coresight
> > > directory and move existing files there. Update MAINTAINERS to reference
> > > this sub-directory rather than the individual files.
> > >
> > > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > > ---
> > >  Documentation/trace/{ => coresight}/coresight-cpu-debug.rst | 0
> > >  Documentation/trace/{ => coresight}/coresight.rst           | 2 +-
> > >  Documentation/trace/{ => coresight}/stm.rst                 | 0
> > >  MAINTAINERS                                                 | 3 +--
> > >  4 files changed, 2 insertions(+), 3 deletions(-)
> > >  rename Documentation/trace/{ => coresight}/coresight-cpu-debug.rst (100%)
> > >  rename Documentation/trace/{ => coresight}/coresight.rst (99%)
> > >  rename Documentation/trace/{ => coresight}/stm.rst (100%)
> > >
> > > diff --git a/Documentation/trace/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
> > > similarity index 100%
> > > rename from Documentation/trace/coresight-cpu-debug.rst
> > > rename to Documentation/trace/coresight/coresight-cpu-debug.rst
> > > diff --git a/Documentation/trace/coresight.rst b/Documentation/trace/coresight/coresight.rst
> > > similarity index 99%
> > > rename from Documentation/trace/coresight.rst
> > > rename to Documentation/trace/coresight/coresight.rst
> > > index 72f4b7ef1bad..835e8aa0bf8c 100644
> > > --- a/Documentation/trace/coresight.rst
> > > +++ b/Documentation/trace/coresight/coresight.rst
> > > @@ -493,6 +493,6 @@ Details on how to use the generic STM API can be found here [#second]_.
> > >
> > >  .. [#first] Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
> > >
> > > -.. [#second] Documentation/trace/stm.rst
> > > +.. [#second] Documentation/trace/coresight/stm.rst
> > >
> > >  .. [#third] https://github.com/Linaro/perf-opencsd
> > > diff --git a/Documentation/trace/stm.rst b/Documentation/trace/coresight/stm.rst
> > > similarity index 100%
> > > rename from Documentation/trace/stm.rst
> > > rename to Documentation/trace/coresight/stm.rst
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 296de2b51c83..f903160b507c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1608,8 +1608,7 @@ R:      Suzuki K Poulose <suzuki.poulose@arm.com>
> > >  L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > >  S:   Maintained
> > >  F:   drivers/hwtracing/coresight/*
> > > -F:   Documentation/trace/coresight.rst
> > > -F:   Documentation/trace/coresight-cpu-debug.rst
> > > +F:   Documentation/trace/coresight/*
> > >  F:   Documentation/devicetree/bindings/arm/coresight.txt
> > >  F:   Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> > >  F:   Documentation/ABI/testing/sysfs-bus-coresight-devices-*
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> I'm taking that back - please remove mentions of coresight files in
> Documentation/trace/index.rst.
>
> Since you do have to respin, please split patch 09.  And now that I
> have applied all the other patches, your next revision should be a
> documentation set.
>
> Thanks,
> Mathieu
> >
> > > --
> > > 2.17.1
> > >



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
