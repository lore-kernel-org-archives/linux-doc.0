Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325C7C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 23 Dec 2020 22:57:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1C1D22273
	for <linux-doc@archiver.kernel.org>; Wed, 23 Dec 2020 22:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgLWW5D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Dec 2020 17:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbgLWW5D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Dec 2020 17:57:03 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2AAC06179C
        for <linux-doc@vger.kernel.org>; Wed, 23 Dec 2020 14:56:22 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m25so914178lfc.11
        for <linux-doc@vger.kernel.org>; Wed, 23 Dec 2020 14:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DhR9g6GISx+3RIJSrNoTktJAD8JqDRQmJMtw4uaGJsY=;
        b=wRdmlgV8vdm/6G9QgvJneWx8kAFhz2u+kJWZjg5Ut6glF0olLdK7qL+Tu3mDgLpqVI
         3VZejIMoM4rNmLWxdsG0Tbtv6UrvsUaS0z6L+gZ9I8wW+xD1W0q6X+xza/WewluIRA/y
         RseS1q2rkxaZmgL+mMUDrB+HkiYwbq6n85vTXBc4KNSP1U519L10WxI8n8zv+bJygb8O
         z98YGG39NFtconBm6oX63ItClE/OcsTrIT79+bwjjEuEWoitHNJbvRgf134QOqWpFlLP
         mwkBbGBR1eZj0PYt2EJT1KTl9o2Dd9ou32u2Tr8VyFiJbsjYB9Z58N1e34WzA3SbqtSV
         CH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DhR9g6GISx+3RIJSrNoTktJAD8JqDRQmJMtw4uaGJsY=;
        b=fd6drelYCuY7S0WaaQaakuBPizfJrqI1t0YqA7s45CU8WuPCBq6uIJ/6vs4tjwnX4L
         4JGIvHworrmr7hTCXoMAC5yudvvqnrnDBM371e3OUm7919iIoYOrrkQK/zo7o5K8m9Wx
         IwoehcpZuxRZ9CDkT67LNvsKGmvdLlnCO2fuFiftjp/7DlPRc0pvYYOFxWGwbTofUJ3m
         H2bVsFh/1ViQ38WBxLzPHWspa6wXTgTiSn4c0j1zUrAxF6trZKNrOGB0/32ckZ0UcJ5b
         u05ckPU5BnjS6YmBF0CFkb2xrN2eNx+tc4v7KWIlqmJkubuG7vRGA0tNQqa7QJ+fPKEb
         AYQw==
X-Gm-Message-State: AOAM531ekWY0DjgfSTvsm+/XpXDlqimnZ2FbcnHti3gkwek4CQ/prhAa
        eHGcF7K/Qe7L6B1zFEWeKUTgh7Rm8yglUdzSNXYzmA==
X-Google-Smtp-Source: ABdhPJxv1e3/W5GCN0xsKQTeeBsZi/Yh4mkxtO4TeDf6EejDKtjr0Gvi+BshysmBZUN39882t7NWdwHy7c2TwPMebgY=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr12220313ljh.81.1608764181058;
 Wed, 23 Dec 2020 14:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20201215115448.25633-12-sjpark@amazon.com> <20201223183721.8898-1-sjpark@amazon.com>
In-Reply-To: <20201223183721.8898-1-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 23 Dec 2020 14:56:10 -0800
Message-ID: <CALvZod5dxOJMNP3HhwYc0ePN+0V8YXruXDtQQRuy+eKsJTYhcw@mail.gmail.com>
Subject: Re: [PATCH v23 11/15] tools: Introduce a minimal user-space tool for DAMON
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan.Cameron@huawei.com,
        Andrea Arcangeli <aarcange@redhat.com>, acme@kernel.org,
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

On Wed, Dec 23, 2020 at 10:38 AM SeongJae Park <sjpark@amazon.com> wrote:
>
[snip]
>
> I will drop this patch from the next version of this patchset, because this is
> not the essential part but could only make the code review time consuming.  I
> will post another DAMON RFC patchset for convenient user space usages including
> this and the perf integration.

You can just add the link to your github repo with commit/tag
containing the usage examples in the cover letter.
