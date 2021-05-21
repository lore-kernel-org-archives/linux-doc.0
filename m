Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75D7C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 02:53:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF140611AE
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 02:53:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbhEUCyi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 May 2021 22:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234848AbhEUCyi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 May 2021 22:54:38 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF2FC061763
        for <linux-doc@vger.kernel.org>; Thu, 20 May 2021 19:53:16 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id w15so22201855ljo.10
        for <linux-doc@vger.kernel.org>; Thu, 20 May 2021 19:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HPsBeMePr6vNdl72dFl2jE/e5Ses/6iw4P/zMQwFaso=;
        b=AxonyiUB4cI7lnYP4SAkb8Vsvx8mWYBMqHGhHg42AGxs+j0IwBEFYBeK5q+8EJUeky
         +BSqrp8QwZ3CSd+L3OPwpzea30xyBnCiPm57229g/kfmKreEFXr8Qrob5TMgUaIHLUII
         A6LmlyR50kCeiG0gBAfJoG7BNHrZ8Q7g0ohaVbdoLSACZ+2EbQtHdbGCGpcnNcSp2a+O
         CyBBT1WLPiiTJ0QJoI/xTEnFJNwf4Km8rJ4e1I8W9oTKjugrbIDCPOfSxvFuHfI0KJG+
         gHb5G7Z84ZFcu7KJGarPvHvxf5IFf0SSATRg1cvBa4X2KumCgkSpJUXo/fMyPi6yyrv+
         bVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HPsBeMePr6vNdl72dFl2jE/e5Ses/6iw4P/zMQwFaso=;
        b=c+vfufjIw/QzT9qWslJy3+sPKEdqMWSmpVGEr/ngry/n3KEjBJV22s8oxHxIMWR700
         diUhmm6QDmVSPwg1nfxQxy39VrBDdayc1yfPeuDDRLGbXyQhOdpB2Osyh72f/JXdIHWx
         HrLIcGGTJIgl/1cDbTcfsmRSNSLPYQPoXHj3lfYKW1QduQdwRDgAigbG42FQQh0TViBy
         C4Lm6kYYYUgOxradKq7PjSK/znXBMlo/G1Odxgernnj33r4O5prb7DOXTlSIsiDcAidG
         I3vzIoshxQl11jlVt0GaSC+OIJSjhstqTjt1UuLRY/FT2PzzgfwQS+QMkdaJw7aEEnBS
         7FHA==
X-Gm-Message-State: AOAM5338cO31jjOVK3kgDoBIEF3Gr9veK40VEATV0HxJZOWuZO8UF+VE
        ivuwl6PMRRic+pz/gWHIc0AqKihhDK6zZiu6EAd//w==
X-Google-Smtp-Source: ABdhPJwmTj06ZQyTfrxk0pdEXL5KraZDbrSM5Z7Pn1woEo07LA+UBY5tagvIYBA4Vn2kFt6dmcK2nwRYdXDbJ8Sjk2I=
X-Received: by 2002:a2e:9e87:: with SMTP id f7mr5070278ljk.81.1621565593987;
 Thu, 20 May 2021 19:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210520075629.4332-1-sj38.park@gmail.com> <20210520153426.34bfe5ab64ca1f06cca6f231@linux-foundation.org>
In-Reply-To: <20210520153426.34bfe5ab64ca1f06cca6f231@linux-foundation.org>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Thu, 20 May 2021 19:53:02 -0700
Message-ID: <CALvZod6Q1kMaEN+PTEJ39D4hYfjtLcPQhKND8m2p7KYui5pKTA@mail.gmail.com>
Subject: Re: [PATCH v29 00/13] Introduce Data Access MONitor (DAMON)
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj38.park@gmail.com>,
        SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, greg@kroah.com,
        Greg Thelen <gthelen@google.com>, guoju.fgj@alibaba-inc.com,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>,
        snu@amazon.de, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        zgf574564920@gmail.com, linux-damon@amazon.com,
        Linux MM <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 20, 2021 at 3:34 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 20 May 2021 07:56:16 +0000 SeongJae Park <sj38.park@gmail.com> wrote:
>
> > Changes from Previous Version (v28)
>
> Thanks for persisting with this.
>
> I'd be interested in people's overall take on this work, please.
> Mainly a high-level "should we merge this" view.  Detailed review of
> implementation and interface details can follow on in the usual fashion.

I am planning to go over the whole series but first let me give my
high-level view on the patch series.

In my personal opinion, this patch series is in the state where we can
merge this or at least add to the mm tree for further exposure.

I have pushed SeongJae to keep the functionality to bare minimum in
the first version and focus more on making the design extensible, so
as more use-cases arise, the core can be extended accordingly.

I am actually more interested in the followup of this work which would
be extended to monitor cgroups for use-cases like hugepages, balancing
hot/cold memory in memory tiers and hints for malloc implementations.
