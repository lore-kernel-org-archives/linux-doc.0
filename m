Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC0987DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 06:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751007AbeEBGKt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 02:10:49 -0400
Received: from mail-pg0-f67.google.com ([74.125.83.67]:43197 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbeEBGKs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 02:10:48 -0400
Received: by mail-pg0-f67.google.com with SMTP id k11-v6so8738911pgo.10
        for <linux-doc@vger.kernel.org>; Tue, 01 May 2018 23:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nyg9l8Qn9OaFOnoASwyT1EkDO86IN5B51WxoVSTvMro=;
        b=JTJV5zaJcIExJTlzuEjj4X+XWpkJ2pug9h7DbC6eTlDLakOmkpuA388eb6mJzqC6Vd
         /B6w5/d3QEbrMKrPkITVChUzJm1bU+JfdDXS/GJkCm2KlK0oUONLhCjZ+IaqV8KF9G5V
         IA+8RLtqzaQP2kzDVn4w13gUon/Auae454Lgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nyg9l8Qn9OaFOnoASwyT1EkDO86IN5B51WxoVSTvMro=;
        b=iqM0izx0s8ymEzutAeijRXbChyl5KdMZVlOtKrSTQbbK1QxqEKLG0vxnHnzRQCvVBj
         nGoS1poYcmAV8NcKQrTcjjFId3fFTTzby+zGkGiImn0Rs9WpqySxj2p6AyF9DJuKn7cA
         DEm93M2HBSrpk2OXNk4lOsaxtJH45ai7/K7nOt1k35ElCJAdKc/MN3tgH2ZTA4OyvOda
         fmkGrZW5XG73YQwTnuhgPzPElDVHy29zHfltR5YNd4JOXDxchsa4/1zvc/fCaYEuNk+4
         OacjSm92pF0rmRXNQodpNBfajAOO2J8MmEvtjmJTvk4nLT2hgmBNSXXq3fQiscvX4giE
         qomg==
X-Gm-Message-State: ALQs6tDBJRnSZYIE/wfarOK5i6+u+C1RmevEWFN1on1vEPC5GPtUy9ks
        JHWBGtzWv9byZqTk6luPTO/GXQ==
X-Google-Smtp-Source: AB8JxZrCi7KYf8sKW4xvcVUmD9KWonxukXVyjT5f/2gi2fLcirCJVwSq/SK8Dqi8dpVBFsH24FOl1g==
X-Received: by 2002:a17:902:7e05:: with SMTP id b5-v6mr18472957plm.230.1525241447493;
        Tue, 01 May 2018 23:10:47 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li1168-94.members.linode.com. [45.79.69.94])
        by smtp.gmail.com with ESMTPSA id y24sm6344339pfn.23.2018.05.01.23.10.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 May 2018 23:10:45 -0700 (PDT)
Date:   Wed, 2 May 2018 14:10:39 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] coresight: Remove %px for printing pcsr value
Message-ID: <20180502061039.GB332@leoy-ThinkPad-X240s>
References: <1525237251-32496-1-git-send-email-leo.yan@linaro.org>
 <CAGXu5jJjCJuDNOJPMHmu94naQvKke47LVv-Y=t9vji88FtkRDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXu5jJjCJuDNOJPMHmu94naQvKke47LVv-Y=t9vji88FtkRDw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 01, 2018 at 10:29:46PM -0700, Kees Cook wrote:
> On Tue, May 1, 2018 at 10:00 PM, Leo Yan <leo.yan@linaro.org> wrote:
> > The driver prints pcsr twice: the first time it uses specifier %px to
> > print hexadecimal pcsr value and the second time uses specifier %pS for
> > output kernel symbols.
> >
> > As suggested by Kees, using %pS should be sufficient and %px isn't
> > necessary; the reason is if the pcsr is a kernel space address, we can
> > easily get to know the code line from %pS format, on the other hand, if
> > the pcsr value doesn't fall into kernel space range (e.g. if the CPU is
> > stuck in firmware), %pS also gives out pcsr hexadecimal value.
> >
> > So this commit removes useless %px and update section "Output format"
> > in the document for alignment between the code and document.
> >
> > Suggested-by: Kees Cook <keescook@chromium.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> 
> Thanks!
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks for reviewing, Kees.

> -Kees
> 
> > ---
> >  Documentation/trace/coresight-cpu-debug.txt       | 4 ++--
> >  drivers/hwtracing/coresight/coresight-cpu-debug.c | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/trace/coresight-cpu-debug.txt b/Documentation/trace/coresight-cpu-debug.txt
> > index 2b9b51c..89ab09e 100644
> > --- a/Documentation/trace/coresight-cpu-debug.txt
> > +++ b/Documentation/trace/coresight-cpu-debug.txt
> > @@ -177,11 +177,11 @@ Here is an example of the debugging output format:
> >  ARM external debug module:
> >  coresight-cpu-debug 850000.debug: CPU[0]:
> >  coresight-cpu-debug 850000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
> > -coresight-cpu-debug 850000.debug:  EDPCSR:  [<ffff00000808e9bc>] handle_IPI+0x174/0x1d8
> > +coresight-cpu-debug 850000.debug:  EDPCSR:  handle_IPI+0x174/0x1d8
> >  coresight-cpu-debug 850000.debug:  EDCIDSR: 00000000
> >  coresight-cpu-debug 850000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
> >  coresight-cpu-debug 852000.debug: CPU[1]:
> >  coresight-cpu-debug 852000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
> > -coresight-cpu-debug 852000.debug:  EDPCSR:  [<ffff0000087fab34>] debug_notifier_call+0x23c/0x358
> > +coresight-cpu-debug 852000.debug:  EDPCSR:  debug_notifier_call+0x23c/0x358
> >  coresight-cpu-debug 852000.debug:  EDCIDSR: 00000000
> >  coresight-cpu-debug 852000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
> > diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > index 9cdb3fb..78a054e 100644
> > --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> > @@ -315,7 +315,7 @@ static void debug_dump_regs(struct debug_drvdata *drvdata)
> >         }
> >
> >         pc = debug_adjust_pc(drvdata);
> > -       dev_emerg(dev, " EDPCSR:  [<%px>] %pS\n", (void *)pc, (void *)pc);
> > +       dev_emerg(dev, " EDPCSR:  %pS\n", (void *)pc);
> >
> >         if (drvdata->edcidsr_present)
> >                 dev_emerg(dev, " EDCIDSR: %08x\n", drvdata->edcidsr);
> > --
> > 2.7.4
> >
> 
> 
> 
> -- 
> Kees Cook
> Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
