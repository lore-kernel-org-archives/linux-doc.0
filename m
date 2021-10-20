Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F832C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 15:23:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44B706137C
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 15:23:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhJTPZ7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Oct 2021 11:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhJTPZ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 11:25:57 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FB2C06161C
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 08:23:43 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g184so22821404pgc.6
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9G/tgOu2U++uQPjqj0kkd4nYpGihFaCQehhixgnnnLM=;
        b=FdohNWF0lePfGiRKbumHGZsAGaLjjDCPzFQFJ5ok+qZV3MvXQXsTce3m8nzuOrUnOr
         HttiXl3VBBlg2SEnXtxSdhhz7nt7n32i+kurO9oz+oBp7/JUPLTfrw8bVeIzI8il5S7y
         +Su1eI0BuwtFDay0O0erLFi3b/nM3KpBQZVvhdsPE7Gp/4mGxEFqpqGmj9rBVgryz6BN
         SaPNpOoiKt0kp6fO0TlMNeoK0ocPWI1b1P11Y8XNcreX1k1KK3F385FOV+dWpZEiNGVx
         5/jrgrsNrsP+j27vJioi2jBsc8BHASyJCxdF9Sg4ljAVZm8zss22Mwm4hbaf1v0w9NTN
         w+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9G/tgOu2U++uQPjqj0kkd4nYpGihFaCQehhixgnnnLM=;
        b=BeT7wiVYH42jYWzCSTz08ZQ4EY5/y7ZiiIPb6thC7TP77+Z55zW7K5gh2RFxgJs2sf
         1ljSVeBxd1nRlk3B0IKCKDkHgzJfAvL51Sl83KbgLadAkEEZ14wUD4a+kr/U/1jAOa5B
         y0IomsZBNl/FcCAcfomB6b1bxFOb/ktHUZsBBCPjcsQW84iSXOI0IIAYWxc8k1O7Nlv6
         lsB7JAZ2d48Xp4q1fh+znkobCgxGl5YxSsMqXE+FZl8SfZlDPxyP5c/aSFlcwt6ZGh98
         9k0fv2uaNQSRomVZMD8tLSc3VWYTxkn0/LsH97BtyahBB2V5B1/qzGCpMLP5RH19hREM
         0QnQ==
X-Gm-Message-State: AOAM530Q3yu1FjKjE/TdZ1K8QuKa7lWY0lgg1BBuoA6usdndHozcx3JB
        HLFEdeZ2o/g4AUk1SDpotzk02qt5h7+rl1e2zZrMlQ==
X-Google-Smtp-Source: ABdhPJxMcqpB7sT6+TEBLZlfW/zH2N29UinV40wClq1lYF1N0TvyDt6Cn320FsJLqNSwctbV9rFqwmrYd7zmA3a7PEk=
X-Received: by 2002:a65:6499:: with SMTP id e25mr91668pgv.146.1634743422326;
 Wed, 20 Oct 2021 08:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211020013153.4106001-1-kaleshsingh@google.com>
 <20211020013153.4106001-3-kaleshsingh@google.com> <20211019222756.1fde436b@gandalf.local.home>
 <CAC_TJvcZ4ndpQpsj4ANj9LpzSu6GfPSdxpVc0XShbi9u_bSUyw@mail.gmail.com> <20211020111301.0032a43d@gandalf.local.home>
In-Reply-To: <20211020111301.0032a43d@gandalf.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Wed, 20 Oct 2021 08:23:31 -0700
Message-ID: <CAC_TJve8pEHSvPAWecX9Lx04q7_bWd2izv=5FJLc=3vSKiDnZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] tracing: Add division and multiplication support
 for hist triggers
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 20, 2021 at 8:13 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 20 Oct 2021 07:54:59 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > Is it worth adding something like this for the multiplication case as well?
>
> No, multiplication is a pretty fast operation, and the added branches to
> test would cause more overhead than what you would save. But, division is a
> very slow operation, and I believe that even with the extra branches it
> would still help.
>
> If we do this, it should be a separate patch anyway, where we can actual do
> measurements to see if there was an improvement, and revert if not.

Sounds good. Thanks for the clarification Steve.

- Kalesh

>
> -- Steve
