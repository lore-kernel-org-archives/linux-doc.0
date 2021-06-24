Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21124C49EAB
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 14:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A6D0613EC
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 14:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhFXOhO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Jun 2021 10:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbhFXOhN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Jun 2021 10:37:13 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138EAC061756
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 07:34:52 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a15so2873843lfr.6
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GJrgmUk4MBeaLhPgL5J6HKmLfh86Hi7USjfP1jfq3Xg=;
        b=HkKrqNlJCRqVpsIJ0cu3IhrKJ2TsbGOb9M1uFceUtw6oX+ZSkuYkbbg4tyuKiUqINX
         FWkLJOsD3N/Wd0VK3P431vkL+OQ3kakrPNc8UCnvSL+cJYkadLEzexqZiJqn37a9Yvs/
         e295QEmuKGLZEHicPtisW9GeALJg0px/oJqTtl58TFFhrPxJTbFwhezbnfIig+GO0QbO
         wyNFQVAEzc3GbzAp3M/Oe+Py087BDI5VZBiZP6NJyItpoqQ0faP1RZWyPW43wEnNCHpa
         y5crsTxCeneBsRlbpXvfVTvRb02W5dLX242iJx2LReJimvMRz0c4DHNyAOYmMVqA7ls1
         xsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GJrgmUk4MBeaLhPgL5J6HKmLfh86Hi7USjfP1jfq3Xg=;
        b=FrYumiAMLfwXOHh8vz9HzZmQHKRKtLyeFbGFOqmyz8iJtuLJBoMXot3Me4vuVJqSjG
         5vNTrqUwPOpHeKi9o3wZd2/zyZcLWvX8geZL9KbG4HnZyZkOjWOK68GRXfBT7L01uJPl
         ZTcvUVz8wOPzFhwyUawOynGiP6YNJJD6XECnZWlF47J4jI0P3zM1AQOf5K/+peJ5ZsNF
         a9WUW95UCMHsLHq6oliAN7UUPI7j7WK949GHs0Jks43cbZJ/oW/jqNQroZIriX8+NDSw
         D6UCvSpB2nxo8Kf4bscINq9b0d8y4fzEH10b/uuIoZHTaXaZPubGRvXIfan2eoXjHXM1
         bNsQ==
X-Gm-Message-State: AOAM530R7siQjPxD/a9A5x65bNnt3Ihl+6MEen86kp72+6ALteUc0us+
        OuJ6VpttqIkvO6fEZU+Iuwn20w8/oH6RELdRD8HeQg==
X-Google-Smtp-Source: ABdhPJxBYv0UJTTLxHw1kaaaspf3Pmt0iwRN3IFZOKILLHVb0uLwmK4KT9JpC6yVOxPpLZDIvKuugOV8lPtmkTuH9DI=
X-Received: by 2002:a05:6512:1104:: with SMTP id l4mr349702lfg.549.1624545290734;
 Thu, 24 Jun 2021 07:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <CALvZod7byYA5jfzF3Vtr1czwWoiaHjkqn9M4e1Ajn1PP47k9=w@mail.gmail.com>
 <20210624102623.24563-1-sjpark@amazon.de>
In-Reply-To: <20210624102623.24563-1-sjpark@amazon.de>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Thu, 24 Jun 2021 07:34:39 -0700
Message-ID: <CALvZod4xDNSAHuoAyJHtAccELOeM0pAc30mJ_-ahkK2KPDJVPg@mail.gmail.com>
Subject: Re: [PATCH v31 01/13] mm: Introduce Data Access MONitor (DAMON)
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, greg@kroah.com,
        Greg Thelen <gthelen@google.com>, guoju.fgj@alibaba-inc.com,
        jgowans@amazon.com, Mel Gorman <mgorman@suse.de>, mheyne@amazon.de,
        Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>,
        sieberf@amazon.com, snu@zelle79.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        zgf574564920@gmail.com, linux-damon@amazon.com,
        Linux MM <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 24, 2021 at 3:26 AM SeongJae Park <sj38.park@gmail.com> wrote:
>
[...]
> > >         if time() % update_interval == 0:
> >
> > regions_update_interval?
>
> It used the name before.  But, I changed the name in this way to use it as a
> general periodic updates of monitoring primitives.  Of course we can use the
> specific name only in this specific example, but also want to make this as
> similar to the actual code as possible.
>
> If you strongly want to rename this, please feel free to let me know.
>

Nah, it is ok.

[...]

> >
> > Any reason to not use kthread_stop() here?
>
> Using 'kthread_stop()' here will make the code much simpler.  But, 'kdamond'
> also stops itself when all monitoring targets became invalid (e.g., all
> monitoring target processes terminated).  However, 'kthread_stop()' is not easy
> to be used for the use case (self stopping).  It's of course possible, but it
> would make the code longer.  That's why I use 'kdamond_stop' flag here.  So,
> I'd like leave this as is.  If you think 'kthread_stop()' should be used,
> please feel free to let me know.
>

Fine as it is.
