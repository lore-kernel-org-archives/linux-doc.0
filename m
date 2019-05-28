Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_HIGH,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B0DA47D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 May 2019 22:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfE1WZt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 May 2019 18:25:49 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:34107 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfE1WZt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 18:25:49 -0400
Received: by mail-it1-f195.google.com with SMTP id g23so3819116iti.1
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 15:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=indeed.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M9EQwLvAO9oXFChsQAamKMxe068zBhP/svdhcV040aU=;
        b=oZO5Y0/DQnUWbpFkchPEk+KHgUZmbFsV53HDF5Y2snBl8sfk23OBpMHuYhiQnjogbn
         Pypla7gFHvnyePY6+WprzNqKLk3FagutRMWa9TFsABvcrJGecUYKfDQk8MBHawwtWdLt
         nT+OHEv2XEM1YDavmsCLBLsIK2pCcvpfcsM94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M9EQwLvAO9oXFChsQAamKMxe068zBhP/svdhcV040aU=;
        b=RA7tQl2BTL0TMM9f12AFAMBPlenQuhZCZ/hYPpniUfA6GdSgO0ylW28pvUge6vuSG9
         CS6rt0C0xxVedm6OW/DXX2gd1BB/Va/cM4bOCe03potdLDTk/A3HXzaf/P5iaEpUWBl9
         ygAoxfsOyS9bURDlADaVGyaTNMSahZ1rHzw9kebgUqglZXNzOO6rNZ9mdwA9X00F87jo
         lAAq3g/YAYgvehq2ZEivlTyvqy0dSXDHDtTafEj+pZrPmkEOFfUi9rY1HRE+TesxPiqq
         /COyjBPWar1IZqunLoi/yCzsMdKxXEG7qP15AxR35AliEOi0ZCvMjOOrZ0YG2r5nO/80
         AqPQ==
X-Gm-Message-State: APjAAAXflws0YRv1QU7+yrlKCXaegkXXd5y9vD5V2byq9hRnTjtD+06/
        V1PdWqn+cJo4keHboGhIA7MDCtMHgaTBcW8INRMbfA==
X-Google-Smtp-Source: APXvYqwjrxpOFdzc5YSwWMqBJZhisJgsSpvWXZgotkxIyikt6pPN38HtmxmJRw/90O11/yml8aEQ+U4Iies2fr6ATd8=
X-Received: by 2002:a24:680c:: with SMTP id v12mr4820680itb.67.1559082348194;
 Tue, 28 May 2019 15:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
 <1558637087-20283-1-git-send-email-chiluk+linux@indeed.com>
 <1558637087-20283-2-git-send-email-chiluk+linux@indeed.com>
 <CAFTs51W0KdK4nw6wydn2HjNYvFRC8DYMmVeKX9FAe+4YUGEAZg@mail.gmail.com>
 <20190524143204.GB4684@lorien.usersys.redhat.com> <CAC=E7cXxsyMLw1PR+8QchTH8FYL7WX6_8LBVdqueR1yjW+VVkQ@mail.gmail.com>
 <CAFTs51Vm258CkDXi_Jj_cGOMotTvhdYR_VW8aUwAUvgistZOFQ@mail.gmail.com>
 <CAC=E7cXVrGRKMNkJPhd4fJi7wgdYk=YcXPV7B8GVNL5M69BarQ@mail.gmail.com> <CAFTs51VhpDk9iW5UT62CkPCN3SjgUHHO1nVqhe+ssHMYqou6Bg@mail.gmail.com>
In-Reply-To: <CAFTs51VhpDk9iW5UT62CkPCN3SjgUHHO1nVqhe+ssHMYqou6Bg@mail.gmail.com>
From:   Dave Chiluk <chiluk+linux@indeed.com>
Date:   Tue, 28 May 2019 17:25:22 -0500
Message-ID: <CAC=E7cVrLFDOm3uNQ_45DzmMVJ_i9bNvjsi7yRPaPe0HcaykUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] sched/fair: Fix low cpu usage with high throttling
 by removing expiration of cpu-local slices
To:     Peter Oskolkov <posk@posk.io>
Cc:     Phil Auld <pauld@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Gregg <bgregg@netflix.com>,
        Kyle Anderson <kwa@yelp.com>,
        Gabriel Munos <gmunoz@netflix.com>,
        John Hammond <jhammond@indeed.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Ben Segall <bsegall@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 24, 2019 at 5:07 PM Peter Oskolkov <posk@posk.io> wrote:
> Linux CPU scheduling tail latency is a well-known issue and a major
> pain point in some workloads:
> https://www.google.com/search?q=linux+cpu+scheduling+tail+latency
>
> Even assuming that nobody noticed this particular cause
> of CPU scheduling latencies, it does not mean the problem should be waved
> away. At least it should be documented, if at this point it decided that
> it is difficult to address it in a meaningful way. And, preferably, a way
> to address the issue later on should be discussed and hopefully agreed to.

Pursuing reducing tail latencies for our web application is the
precise reason I created this patch set.  Those applications that
previously were responding in 20ms 95% where now taking 220ms.  Those
were correctly sized applications prior to 512ac999. After which, they
started seeing massive increases in their latencies  due to hitting
throttling with lower than quota amounts of cpu usage.

I'll see if I can rework the documentation.  Any specific
suggestions for how that can be worded would be appreciated.
