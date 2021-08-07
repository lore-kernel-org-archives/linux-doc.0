Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CB3C4338F
	for <linux-doc@archiver.kernel.org>; Sat,  7 Aug 2021 18:28:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C38F610A6
	for <linux-doc@archiver.kernel.org>; Sat,  7 Aug 2021 18:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhHGS2m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 7 Aug 2021 14:28:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229471AbhHGS2m (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 7 Aug 2021 14:28:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A203960F10;
        Sat,  7 Aug 2021 18:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1628360903;
        bh=hUy6JCFT7S9GDfapP7Jen82ePlO0aa/6QvYnH01I6KE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0laZdmp6mlS97qz3LHmO1crutgDpb0s9DZKQtGk0YGTw81d+4EXyrvedzyg7mlF4H
         L5wLTkyuNsKp8/DwhTd1yRHLoUp6IsZ6RJeyW57poFwmVVBFac/WHZrdiONU6ZvZgp
         JOhNfHNer1F53YyxgIkZHEQi5c8b8TqWRooXP90g=
Date:   Sat, 7 Aug 2021 11:28:20 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, joe@perches.com,
        mgorman@suse.de, mheyne@amazon.de, minchan@kernel.org,
        mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org,
        riel@surriel.com, rientjes@google.com, rostedt@goodmis.org,
        rppt@kernel.org, shakeelb@google.com, shuah@kernel.org,
        sieberf@amazon.com, snu@zelle79.org, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v34 00/13] Introduce Data Access MONitor (DAMON)
Message-Id: <20210807112820.dd8d0a7ae972730f196631c3@linux-foundation.org>
In-Reply-To: <20210806114831.7009-1-sjpark@amazon.de>
References: <20210805174324.2aaf0fb67cd19da893a86d80@linux-foundation.org>
        <20210806114831.7009-1-sjpark@amazon.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  6 Aug 2021 11:48:30 +0000 SeongJae Park <sj38.park@gmail.com> wrote:

> > 
> > Presumably there are companion userspace tools for DAMON.  Are they
> > available?  Is there a plan to release and maintain these?
> 
> Yes, the userspace tool[1] is available, released under GPLv2, and actively
> being maintained.  I am also planning to implement another basic user interface
> in perf[2].  Also, the basic test suite for DAMON is available under GPLv2[3].
> 
> [1] https://github.com/awslabs/damo
> [2] https://lore.kernel.org/linux-mm/20210107120729.22328-1-sjpark@amazon.com/
> [3] https://github.com/awslabs/damon-tests

Ah.  Useful info to have in the changelogs!  I added the above words to the [0/n] introduction in mm-introduce-data-access-monitor-damon.patch
