Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E048C433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 04:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A915B64E06
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 04:09:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbhBDEJ6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Feb 2021 23:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhBDEJ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Feb 2021 23:09:57 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F14C061573
        for <linux-doc@vger.kernel.org>; Wed,  3 Feb 2021 20:09:17 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id q20so1265583pfu.8
        for <linux-doc@vger.kernel.org>; Wed, 03 Feb 2021 20:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tHkbGnJBi0shnvNJUBfEJqIxLvcX6xgoJPiMaMNPfoE=;
        b=x6yKmbIknVZPXixgYWOj9j22cyLssm1YsOIuS5eYS8TTwM/1AhqaEXs3bgF1jRbumx
         pTP2lvmU0+kGsSw++Nl6sVhRblUPy3h90upzwZ0n7mafJoaBQRiYX2qPLzOJlX9Z+VJa
         rlKWllWp/6mf0c/45rN1WZKidkhLssTjqWE5Z/owhKfaDwnX9VY0vAkAZNfxymyjjA7V
         gUYfo21t1J54rOQW0EfxW0zMjc/bmSc+AOmiS/iY6SJMDP0Vup5ClDJ69V1PTEuW+4qY
         2z6yQYJWxxJagDXjX2g2358u8nF6sSYRLi9GVR7SeW8uQ148LkcuAj5qNq1Cj7W44f8E
         XMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tHkbGnJBi0shnvNJUBfEJqIxLvcX6xgoJPiMaMNPfoE=;
        b=ZbTaC1mFe7TbQsfDd2kOSZl0k2ak8xLUmLkLQeMK0auxJdsqBTZVovPz0CQ2U/S43f
         ++8g5nqZ63ZOiR8+EaSHG4RSYPkEAXWARIZB6epAVCZRQ9GgRmr+XavCzeMP0LsiVP4/
         3AGuh2gW+zstvRbfAUG3H2eE45jfiL2ydNo5r01x2kIqW/ShNUvUyDnmKuGed1g/5+J8
         IKAY18joSsC1/E+LJl9a3u5UCzt0sf1fJCTtGMK0EE20l8d4Tr6gaRdKYNlhLrjv0vti
         hOICbYCOVlM6StJtUllp2eQHTpCIEQG85cZJPkSFi6PefMO7BC88tUhphU+uH8G3Cx86
         dmQA==
X-Gm-Message-State: AOAM532gxIF/M3wnHIJSe1thvq77dEWU3bx4BI8JVRO487Y7KesFDU2k
        0yXSBcGvM3RoSGsMHT3cRcZxPw==
X-Google-Smtp-Source: ABdhPJxX58Cj13ZPiQpfNeShN2HXP+x8XdlSKLxHsq7uVAH3t5/bJkppqWS4BAt/LmT3SMM30T0e4Q==
X-Received: by 2002:a62:760b:0:b029:1b6:3897:3f86 with SMTP id r11-20020a62760b0000b02901b638973f86mr5994072pfc.24.1612411757186;
        Wed, 03 Feb 2021 20:09:17 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([202.131.71.236])
        by smtp.gmail.com with ESMTPSA id j3sm3438759pjs.50.2021.02.03.20.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 20:09:16 -0800 (PST)
Date:   Thu, 4 Feb 2021 12:09:09 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/7] Documentation: coresight: Add PID tracing
 description
Message-ID: <20210204040909.GH11059@leoy-ThinkPad-X240s>
References: <20210202163842.134734-1-leo.yan@linaro.org>
 <20210202163842.134734-8-leo.yan@linaro.org>
 <CAJ9a7VgzNphx=OkxjrxHJsuFAYEbOgHuAm9ysdwHq20=GhbgTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgzNphx=OkxjrxHJsuFAYEbOgHuAm9ysdwHq20=GhbgTg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mike,

On Wed, Feb 03, 2021 at 05:39:54PM +0000, Mike Leach wrote:

[...]

> > +2.2) Tracing PID
> > +
> > +When the kernel is running at EL2 with Virtualization Host Extensions (VHE),
> > +perf records CONTEXTIDR_EL2 in the trace data and can be used as PID when
> > +decoding; and if the kernel is running at EL1 with nVHE, CONTEXTIDR_EL1 is
> > +traced for PID.
> > +
> 
> Would this introductory paragraph be better if is explained where the
> kernel stores the PID for the different levels, then we logically move
> on to how to trace this in perf.
> 
> e.g:-
> 
> "The lernel can be built to write the PID value into the PE ContextID registers.
> For a kernel running at EL1, the PID is stored in CONTEXTIDR_EL1.
> A PE may implement ARM Virtualisation Host Extensions (VHE), were the
> kernel can run at EL2 as a virtualisation host.
> In this case the PID value is stored in CONTEXTIDR_EL2.
> perf provides PMU options which program the ETM to insert these values
> into the trace data."

Will in next spin; thanks a lot for writing up!

> > +To support tracing PID for the kernel runs at different exception levels,
> > +the PMU formats are defined as follow:
> > +
> > +  "contextid1": Available on both EL1 kernel and EL2 kernel.  When the
> > +                kernel is running at EL1, "contextid1" enables the PID
> > +                tracing; when the kernel is running at EL2, this enables
> > +                tracing the PID of guest applications.
> > +
> > +  "contextid2": Only usable when the kernel is running at EL2.  When
> > +                selected, enables PID tracing on EL2 kernel.
> > +
> > +  "contextid":  Will be an alias for the option that enables PID
> > +                tracing.  I.e,
> > +                contextid == contextid1, on EL1 kernel.
> > +                contextid == contextid2, on EL2 kernel.
> > +
> > +The perf tool automatically sets corresponding bit for the "contextid" config,
> > +therefore, the user doesn't have to bother which EL the kernel is running.
> > +
> > +  i.e, perf record -e cs_etm/contextid/u -- uname
> > +    or perf record -e cs_etm//u -- uname
> > +
> > +will always do the "PID" tracing, independent of the kernel EL.
> > +
> 
> This is telling me that both cs_etm// and cs_etm/contextid/ have the
> same effect - trace PID. Is this correct?

Correct.

> If so, then contextid, contextid1 and contextid2 have no effect except
> in specific EL2 circumstances.

Yes, exactly.

Thanks,
Leo

> > +When the kernel is running at EL2 with VHE, if user wants to trace both the
> > +PIDs for both host and guest, the two configs "contextid1" and "contextid2"
> > +can be set at the same time:
> > +
> > +  perf record -e cs_etm/contextid1,contextid2/u -- uname
> > +
> >
> 
> 
> Regards
> 
> Mike
> 
> 
> >  Generating coverage files for Feedback Directed Optimization: AutoFDO
> >  ---------------------------------------------------------------------
> > --
> > 2.25.1
> >
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK
