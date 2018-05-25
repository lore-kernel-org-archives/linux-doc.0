Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2B55F7DF8F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 15:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965666AbeEYPyd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 11:54:33 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:40335 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966735AbeEYPya (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 11:54:30 -0400
Received: by mail-wr0-f194.google.com with SMTP id l41-v6so10066577wre.7
        for <linux-doc@vger.kernel.org>; Fri, 25 May 2018 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jnmSUnLH4bKCNQyK1odKZz35zKGoqJvTGKFhXilRZNc=;
        b=fIiVR97SvdxOAMcf7eV05QfR9Csn6mOH0jbcIBvzjfbz/wBkspZuYvAxaxhm2UQ/Cb
         S/4WZnbE9dnecUUuxyGNiwEuKsQXRC6u7f2hMLky077X3pjTT3dQjS933tSwlMjYxWt0
         jnyxx9pM3q4mcYucKO5hV5Fy8guOMM4eHRI84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jnmSUnLH4bKCNQyK1odKZz35zKGoqJvTGKFhXilRZNc=;
        b=dytfTbe7RdOa/7Ms7yMlxr9oynyYTHruQ//CwdCnNJ3pWrihybSMHWbkUuTncnmIUN
         4zSngEcXrKyVNUC+nq+GTQc3L345ifZyObc+4j+3V0Oj7PLMgr7mhp0wFOopeDPQeQWF
         hRW9cRnw1bFzeyGDTlO3efM1phHvdRpUN7QJgqOUdV3LrYBrU60aiV5YNzRfZxmUbUg6
         K9xvN6yzWRVQDVXpiYQxL6mTQxSGEpDyE1VKit7pHo6oxoEyFb4Tn8FXBwLI3utSSUpW
         nBK12tSq+hd9UzdL6/+f26K3kWsqbnSjyFFoVgPuntv8wYrNf7B6Y4sC1ZxUR6tOVIVz
         hmaQ==
X-Gm-Message-State: ALKqPwck5zyRfcfOli6NDd1FEpA3EaIUZJhdxKCW+8tSz8PjA1WmJzQX
        8R605oHg/E3S0ifgN0pkkCQ3VQ==
X-Google-Smtp-Source: AB8JxZoyeF+nDbIYqmEXJsoioBcDugTN4/KjfHfrVs+gVADjiZWNf1nsyIEJ/QcC9NU9rRKtHL0qRQ==
X-Received: by 2002:adf:e8c3:: with SMTP id k3-v6mr2422222wrn.182.1527263669737;
        Fri, 25 May 2018 08:54:29 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([45.76.138.171])
        by smtp.gmail.com with ESMTPSA id o2-v6sm6576162wmo.24.2018.05.25.08.54.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 08:54:28 -0700 (PDT)
Date:   Fri, 25 May 2018 23:54:18 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Robert Walker <robert.walker@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tor Jeremiassen <tor@ti.com>,
        mike.leach@linaro.org, kim.phillips@arm.com,
        coresight@lists.linaro.org, Mike Leach <mike.leach@arm.com>
Subject: Re: [RFT v2 1/4] perf cs-etm: Generate sample for missed packets
Message-ID: <20180525155418.GA27273@leoy-ThinkPad-X240s>
References: <1526892748-326-1-git-send-email-leo.yan@linaro.org>
 <1526892748-326-2-git-send-email-leo.yan@linaro.org>
 <bc320d6d-a21d-b5a4-e30d-511bb69aba32@arm.com>
 <20180522083920.GD31075@leoy-ThinkPad-X240s>
 <03a53a72-8af5-02de-21a8-fd02a0974ed6@arm.com>
 <20180525152713.GD4091@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180525152713.GD4091@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Arnaldo, Rob,

On Fri, May 25, 2018 at 12:27:13PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Fri, May 25, 2018 at 03:03:47PM +0100, Robert Walker escreveu:
> > Hi Leo,
> > 
> > Following the discussions from your reply to this with a simplified patch,
> > this version of the patch works better as you also need to emit a branch
> > sample when handling a CS_ETM_TRACE_ON packet to indicate the end of a block
> > of trace.

I also will follow the suggestion as Rob mentioned in another email:
"The deadbeefdeadbeef addresses are a bit ugly - these are just dummy
values emitted in the decoder layer - maybe these should be changed
to 0."

> > This patch does not break the output from perf inject to generate
> > instruction samples for AutoFDO, so I am happy with that.

Thanks for confirmation.

> > Regards
> > 
> > Rob
> > 
> > Reviewed-by: Robert Walker <robert.walker@arm.com>
> 
> So, Leo, can you please resubmit, bumping the v2 to v3 (or the latest
> one, I haven't fully reread this thread) add this "Reviewed-by: Robert"
> tag and any other that people may have provided, so that I can merge it?

Sure!  I will respin the v3 patch series by following up Rob's
suggestion and add Rob's review tag.

BTW, I'd like to get ack from Mathieu as well.  Mathieu is working on
CPU wide tracing, so I talked with Mathieu he will review the patch
series if has conflict with CPU wide tracing.

[...]

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
