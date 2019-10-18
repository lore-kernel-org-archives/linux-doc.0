Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 628AF7D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 Oct 2019 17:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731530AbfJRRbr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 Oct 2019 13:31:47 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35013 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728833AbfJRRbq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Oct 2019 13:31:46 -0400
Received: by mail-il1-f195.google.com with SMTP id j9so6269860ilr.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2019 10:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4qFr7tmvxRMVc+FCpIKlwmUQdJxMZt6SVR1EnyZDw74=;
        b=PzMMC9cKAiyn6bioJIfC917EgH+5Q+lzj9JvvPPWfPETQhZKhZxhHeX4Rx7Dak39EY
         SKNwhKWjDeCnr0AGBZWMPQPe8zNVlJeRXxeAk2hJWyBA4FL0lYW25P9X4iRuQpZF8Y/W
         z4LmeUxMVctKXzincxllR8g3vWds+F3DUF9bTngvVuZBI9Bms+hzvuOhwmAH2M4rYTP9
         2WHd8UrO6nIx4H6QDgFPtYWgTIRzyoMCGXJqkfvk52XqGV8CPczQJ7EZsU9lNi7Q5A3G
         iSRTzhJIQHY5ucvFlurOO503a2/URosqxMiLqTFy8TduluG8nJspP5kE40uZK/aZl6F3
         t7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4qFr7tmvxRMVc+FCpIKlwmUQdJxMZt6SVR1EnyZDw74=;
        b=mz3O6npL+hp4i6Oab/nxPz38IfsYaNJY1HwTzFtj7UuqNiDGx9h3Ei6hi5R6SZOCE1
         mTYjbLMd5T0CDClHr1bTWRI2kxGbaInipDJcjx5YZ81TK09ipvQ1DJWhqGOAzNAGmWE2
         VzE1YHgeem6ioX9DDffQEG7BaL7E2HxVf2OA7kc0wqVwH55YeHFhoFJf/fEhLjHULsEO
         gLNbs0qXYh3c+8Gb1VNyHwyPtHbMUCvzoBNtWa5HssHW/R/znKcQFA02oUhPgPs6qBE3
         lJdPdE59cL+uQygCKEaXhZyn9qGLm6Q5EC2qv90K6/e1f+D18LN7q3QkQiDSLtLgTK53
         G4Ew==
X-Gm-Message-State: APjAAAVPEF/4p2hLP9Po4ubHQtxZiKWjpQhZgP91TtieJrH6OPUFobmK
        ZS+VOQpQ7Dm52VxzgrOM0chIBBrbkAc/B04J4PsmQ8PK
X-Google-Smtp-Source: APXvYqzQg2H4y9jctt1IvHCTaEbMKx3FQ/dOUqJ1O3p6JKEv9W1TkRHxfHw6Y3/H1JlTwwOruu18CR3RAz7N4Q1L83g=
X-Received: by 2002:a92:86ce:: with SMTP id l75mr11696428ilh.140.1571419904421;
 Fri, 18 Oct 2019 10:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191015212004.24748-1-mike.leach@linaro.org> <20191015212004.24748-11-mike.leach@linaro.org>
 <20191018162009.GB12883@xps15>
In-Reply-To: <20191018162009.GB12883@xps15>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 18 Oct 2019 11:31:33 -0600
Message-ID: <CANLsYkyYwNv0dApJws+e=M3h6MKqX7triVgY6qy74oOYJe7FMw@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] coresight: docs: Create common sub-directory for
 coresight trace.
To:     Mike Leach <mike.leach@linaro.org>
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

On Fri, 18 Oct 2019 at 10:20, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Oct 15, 2019 at 10:20:03PM +0100, Mike Leach wrote:
> > There are two files in the Documentation/trace directory relating to
> > coresight, with more to follow, so create a Documentation/trace/coresight
> > directory and move existing files there. Update MAINTAINERS to reference
> > this sub-directory rather than the individual files.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >  Documentation/trace/{ => coresight}/coresight-cpu-debug.rst | 0
> >  Documentation/trace/{ => coresight}/coresight.rst           | 2 +-
> >  Documentation/trace/{ => coresight}/stm.rst                 | 0
> >  MAINTAINERS                                                 | 3 +--
> >  4 files changed, 2 insertions(+), 3 deletions(-)
> >  rename Documentation/trace/{ => coresight}/coresight-cpu-debug.rst (100%)
> >  rename Documentation/trace/{ => coresight}/coresight.rst (99%)
> >  rename Documentation/trace/{ => coresight}/stm.rst (100%)
> >
> > diff --git a/Documentation/trace/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
> > similarity index 100%
> > rename from Documentation/trace/coresight-cpu-debug.rst
> > rename to Documentation/trace/coresight/coresight-cpu-debug.rst
> > diff --git a/Documentation/trace/coresight.rst b/Documentation/trace/coresight/coresight.rst
> > similarity index 99%
> > rename from Documentation/trace/coresight.rst
> > rename to Documentation/trace/coresight/coresight.rst
> > index 72f4b7ef1bad..835e8aa0bf8c 100644
> > --- a/Documentation/trace/coresight.rst
> > +++ b/Documentation/trace/coresight/coresight.rst
> > @@ -493,6 +493,6 @@ Details on how to use the generic STM API can be found here [#second]_.
> >
> >  .. [#first] Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
> >
> > -.. [#second] Documentation/trace/stm.rst
> > +.. [#second] Documentation/trace/coresight/stm.rst
> >
> >  .. [#third] https://github.com/Linaro/perf-opencsd
> > diff --git a/Documentation/trace/stm.rst b/Documentation/trace/coresight/stm.rst
> > similarity index 100%
> > rename from Documentation/trace/stm.rst
> > rename to Documentation/trace/coresight/stm.rst
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 296de2b51c83..f903160b507c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1608,8 +1608,7 @@ R:      Suzuki K Poulose <suzuki.poulose@arm.com>
> >  L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:   Maintained
> >  F:   drivers/hwtracing/coresight/*
> > -F:   Documentation/trace/coresight.rst
> > -F:   Documentation/trace/coresight-cpu-debug.rst
> > +F:   Documentation/trace/coresight/*
> >  F:   Documentation/devicetree/bindings/arm/coresight.txt
> >  F:   Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> >  F:   Documentation/ABI/testing/sysfs-bus-coresight-devices-*
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

I'm taking that back - please remove mentions of coresight files in
Documentation/trace/index.rst.

Since you do have to respin, please split patch 09.  And now that I
have applied all the other patches, your next revision should be a
documentation set.

Thanks,
Mathieu
>
> > --
> > 2.17.1
> >
