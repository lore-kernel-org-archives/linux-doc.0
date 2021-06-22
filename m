Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A61C48BE5
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 18:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4696C6128E
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 18:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhFVSZm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 14:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhFVSZl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 14:25:41 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457B2C061574
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 11:23:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d16so29983983lfn.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 11:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FV61UP5NcLLWWDvVqg5arfYv7gGM3LSFINIkuHzruNQ=;
        b=pONLFwGx3+EykTnB4ze62pOkv+Jpo7Ut9deKl05K8YRybGrbGTHE9TcZrjOqYHA28Y
         F7juG7LTnIcPuAGg8REQ+Iji7/5RqEAg7qrLnLuSBbfT2GkPwsfo//Ial3EVdkYFzmxk
         CKybBao4DyUQrD4zyl1LJix8iEHCiuTdudedyCJj8fJLBqDZlxJLQWMgOWG6HOoOvKL/
         ghDU6yPvt3hY0VAenfRzHeMii2YCtRH9J7Q1REnR9dErOy4R3iGLRKF98tdiMwVov9Ox
         gMKEdHNZ/5q9PjN9ckMqJABLMlGWz/DY5Kz8rSmRZ/EUazFMXEsN2dlAUziGJewcQaWU
         dnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FV61UP5NcLLWWDvVqg5arfYv7gGM3LSFINIkuHzruNQ=;
        b=qD9gqB9I7K7wpQsxJohovSdO2KOqmdNbOlYZ6UzXkO3VH6Iv5QdVJzzK/ElOsNJ/VT
         V8DMbqSc0HWEB+WHtO8P8GOithVc+LomAE05bIXtWgraUCTncrZK/+QTp1oatkjuZ+sp
         +fVqWF45Zvy7Rqxrx6rnP8ngnzv8QRtr9dq2gSM2wz1QTClB2/Ofk/D91Yt30Q+Oyqi6
         fNumXVtYD16eGEJuumGn9xnaIQVDkp5h24mrOjKRDdPVhPT1F13kOeLsPBNWyHqVYOnc
         S05MmgqQY6I5ZI5b24jDq/I50l6yUgJaz4f/PaM+MSXyttgA7CsYSVg7ehRhqyotjYw6
         SFPQ==
X-Gm-Message-State: AOAM532j1JkeRkE7Ov7yjRm4bXjWf0zJ7OlYALQ36y1eglko1KF3AORV
        dmpZqa3AzQUyBv0P7luPiH0DfJjLW+bIgmu8OdSSxw==
X-Google-Smtp-Source: ABdhPJwnrjT3krbKSxFrRsFi3ZXwowgc1qJaQEQ1sCLbnNdI8yM24TC4myf8Qi5w66rYqP+zehgwQks6GADvBFg0XWA=
X-Received: by 2002:a19:ac06:: with SMTP id g6mr3959111lfc.299.1624386203402;
 Tue, 22 Jun 2021 11:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210621083108.17589-1-sj38.park@gmail.com> <20210621083108.17589-9-sj38.park@gmail.com>
In-Reply-To: <20210621083108.17589-9-sj38.park@gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 22 Jun 2021 11:23:12 -0700
Message-ID: <CALvZod703WD0Ab8EMpd6+JxzhKEjnwZkYRA9VB5LoUmG_yccSQ@mail.gmail.com>
Subject: Re: [PATCH v31 08/13] mm/damon/dbgfs: Export kdamond pid to the user space
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
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

On Mon, Jun 21, 2021 at 1:31 AM SeongJae Park <sj38.park@gmail.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> For CPU usage accounting, knowing pid of the monitoring thread could be
> helpful.  For example, users could use cpuaccount cgroups with the pid.
>
> This commit therefore exports the pid of currently running monitoring
> thread to the user space via 'kdamond_pid' file in the debugfs
> directory.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Reviewed-by: Fernand Sieber <sieberf@amazon.com>
> ---

[...]

>
> +static const struct file_operations kdamond_pid_fops = {
> +       .owner = THIS_MODULE,

I don't think you need to set the owner (and for other fops) as these
files are built into modules. Otherwise it looks good.
