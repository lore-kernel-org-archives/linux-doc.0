Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B350C433E6
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 16:11:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9E7E64F59
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 16:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236091AbhBBQLP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Feb 2021 11:11:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbhBBQJK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Feb 2021 11:09:10 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC185C061573
        for <linux-doc@vger.kernel.org>; Tue,  2 Feb 2021 08:08:27 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id c18so24589671ljd.9
        for <linux-doc@vger.kernel.org>; Tue, 02 Feb 2021 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2YbBZ+pwxqYqGzzslaIJ05HgU3i6tDAPJx6PUutsceU=;
        b=lYNrLp7icuVClG0J9fazYAw2HM9uY8RmEN9hHo7P5itgPqG2WIJTzOhd39iPxinGqX
         p7SCNjwgUtHtoJTXNDdZqlSzYIppcWDa4Iov5zQZpxhQcq7KDCwba/5sCn6FNSDJmHoj
         RpsFJRI7q6c32wXQHvkWwPNRzBXO7265qJG52v1B/YQhrLmkXXeYEETrDFcB9M/7Aocb
         X/38zQNOS+bosCtRqsUVROsM7x16u43skQAHKHGQk+tpCcWKSi3JqVGVT6KQS8niirx5
         fW+x23EaI01b8G99oI5I6BoltgQMzl3oC9QscMJTd+fiQVIbKO2EZk2D1nPCm0hWE9ST
         /kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2YbBZ+pwxqYqGzzslaIJ05HgU3i6tDAPJx6PUutsceU=;
        b=cu/tyIG4fb5Uwtrq43ddmN/w2RCQbTLzd0ok4qoKocLd0c4WEDr8wkVTVnYhUTEcNq
         pOv6IWXEnSnfkzxcnZRnM5ihWfugQecfsYlG57uCpgrULOPuJA9WDEViUB9c+4xUsoQz
         QNleUifLmK6icrx39+hj+s0TZDvQn9O6jgidbCEqy/AVK/gg5bajBcWiFoRDyVuQSFRj
         XhVDV0k0aNwRcr6btagjw/JJOeHCiJaMQdiemDzhLK4lL6dSTHsvxi8YR0iEKte6JZMU
         aCTMpWTNGFzLJRZvWaj2zUnvrMfUeIctPKw5zjrXZXhxKiaUaRX9vyQ93c23UCopmwM/
         5JdA==
X-Gm-Message-State: AOAM53164Hp+N9K+nCDaM9unBQxBSiAm3uMPF2MXufEU4SDqBmvCGD03
        /0GKxdFdb6Q4utQX+u4oSfFqQ60UPrbeuw7BI/T9oQ==
X-Google-Smtp-Source: ABdhPJwXVLSF4NT9/m9vekSoU52Sgvq+jardrJsLqwnr7vXRLhHa4uWJiDuD7UN5qVnToEL98kCCsdgLc9C1KSW3NoU=
X-Received: by 2002:a2e:8005:: with SMTP id j5mr13857540ljg.34.1612282104958;
 Tue, 02 Feb 2021 08:08:24 -0800 (PST)
MIME-Version: 1.0
References: <CALvZod7tv=z3XwGx3pn5qNHQd1EAnhvBaM3EGRjWmo7G2RJEuw@mail.gmail.com>
 <20210202154506.29682-1-sjpark@amazon.com>
In-Reply-To: <20210202154506.29682-1-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 2 Feb 2021 08:08:13 -0800
Message-ID: <CALvZod7j0pjJhAsY6qjvbOm0ZmR+mXebsiF_AqMuxBx1m66UJw@mail.gmail.com>
Subject: Re: [PATCH v23 07/15] mm/damon: Implement a debugfs-based user space interface
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrea Arcangeli <aarcange@redhat.com>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendan.d.gregg@gmail.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Qian Cai <cai@lca.pw>,
        Colin Ian King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, Greg Thelen <gthelen@google.com>,
        Ian Rogers <irogers@google.com>, jolsa@redhat.com,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Mark Rutland <mark.rutland@arm.com>,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, sblbir@amazon.com,
        Shuah Khan <shuah@kernel.org>, sj38.park@gmail.com,
        snu@amazon.de, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Huang Ying <ying.huang@intel.com>, zgf574564920@gmail.com,
        linux-damon@amazon.com, Linux MM <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 2, 2021 at 7:46 AM SeongJae Park <sjpark@amazon.com> wrote:
>
[snip]
> >
> > You can simplify by simply restricting to one pid/target per each write syscall.
>
> Right, thanks for the suggestion.  However, I already almost finished writing
> the fix.  If there is no other concern, I'd like to keep current interface.
>
>

Please go ahead with the current.
