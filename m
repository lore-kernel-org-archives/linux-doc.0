Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 317B57D09E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 14:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751517AbeE3Otg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 10:49:36 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:41287 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751191AbeE3Otf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 10:49:35 -0400
Received: by mail-wr0-f195.google.com with SMTP id u12-v6so29803229wrn.8
        for <linux-doc@vger.kernel.org>; Wed, 30 May 2018 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IDgA5K7I0GxeyPvD9JfEgpIr3ANxC6/6aIkueI4vNwo=;
        b=Hrfkxg31ej5tRBrYftpB7MyijsifMBxHdDH9bgNv0ghbE12nqZXQ8GreI4LyfpWJNr
         8Hn3kaMwPqWQ2IRyJPSi/5f8pUovhgf9UkEBX1kjb5TNGLE+pVyA/adrb+ooHnZ6xwQD
         oE0RF6tHkGYkLQU8YKSzWHW4rraGP456SsAxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IDgA5K7I0GxeyPvD9JfEgpIr3ANxC6/6aIkueI4vNwo=;
        b=iWXrSfQ21cNoFTjJSfAUnoCWCT0qaT8p0w5vkFkq9uVcJeulul73yR5JN2LEZ4fVAR
         2qTup1xzmnNd2NXFMCIN+Ze/LAzrY+cGIlFYBV7jBjwYdFygb1riELfSyqITeTTOGBfL
         K5zkKIaGZjaHImFkvcj0P/pGlQ/ysaPDp9bvs0uzL7mLYaYVjUb2dtK1rWpTWnjTt6sB
         MREHG3z+1dSIZZHltV0vBLXuzhaVHhGKFLWhUI0klMS8yEmUcX6jVeKM6wSuQl6VbAee
         EIwRSbSojLP2FRZ2W6Cr28FedvPvWYtYowx+dxt6CGY6ObhccuL4urXZuF7Z65Xsqn8P
         q/7Q==
X-Gm-Message-State: ALKqPwdpY0bVBB4RTCNJHByxDwpftiZS+rhGj5VL5HIpzS4yT0Au++D4
        nljDrHnYLUgzpuDBjex2mcFb9Q==
X-Google-Smtp-Source: ADUXVKKSTubaVRa9sPmSV9WHe/dfvnk8JU/3gzx/MJL3x8Wt9gnq2icN/x96jNZyeagW8ixtw/XphA==
X-Received: by 2002:adf:8607:: with SMTP id 7-v6mr2310922wrv.255.1527691774395;
        Wed, 30 May 2018 07:49:34 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([45.76.138.171])
        by smtp.gmail.com with ESMTPSA id k36-v6sm12133580wrc.20.2018.05.30.07.49.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 May 2018 07:49:32 -0700 (PDT)
Date:   Wed, 30 May 2018 22:49:22 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Robert Walker <Robert.Walker@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Kim Phillips <kim.phillips@arm.com>,
        Tor Jeremiassen <tor@ti.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        coresight@lists.linaro.org
Subject: Re: [RFT v3 1/4] perf cs-etm: Generate branch sample for missed
 packets
Message-ID: <20180530144922.GB12368@leoy-ThinkPad-X240s>
References: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
 <1527497103-3593-2-git-send-email-leo.yan@linaro.org>
 <20180528221347.GA4109@xps15>
 <20180529002538.GA11317@leoy-ThinkPad-X240s>
 <CANLsYkzEU90aVtPMRqf=YHzee8DHq8JZttRuxjLKGz-gRYiBuw@mail.gmail.com>
 <20180530002837.GB11923@leoy-ThinkPad-X240s>
 <CANLsYkzPShMj1cbXZPb7Lzio+gKcmvhD2+KTYr7vP9ec1d6bmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzPShMj1cbXZPb7Lzio+gKcmvhD2+KTYr7vP9ec1d6bmg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 30, 2018 at 08:45:46AM -0600, Mathieu Poirier wrote:
> On 29 May 2018 at 18:28, Leo Yan <leo.yan@linaro.org> wrote:
> > Hi Mathieu,
> >
> > On Tue, May 29, 2018 at 10:04:49AM -0600, Mathieu Poirier wrote:
> >
> > [...]
> >
> >> > As now this patch is big with more complex logic, so I consider to
> >> > split it into small patches:
> >> >
> >> > - Define CS_ETM_INVAL_ADDR;
> >> > - Fix for CS_ETM_TRACE_ON packet;
> >> > - Fix for exception packet;
> >> >
> >> > Does this make sense for you?  I have concern that this patch is a
> >> > fixing patch, so not sure after spliting patches will introduce
> >> > trouble for applying them for other stable kernels ...
> >>
> >> Reverse the order:
> >>
> >> - Fix for CS_ETM_TRACE_ON packet;
> >> - Fix for exception packet;
> >> - Define CS_ETM_INVAL_ADDR;
> >>
> >> But you may not need to - see next comment.
> >
> > From the discussion context, I think here 'you may not need to' is
> > referring to my concern for applying patches on stable kernel, so I
> > should take this patch series as an enhancement and don't need to
> > consider much for stable kernel.
> 
> Yes, that is what I meant.

Thanks for confirmation, will send new patch series according to the
discussion.

[...]

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
