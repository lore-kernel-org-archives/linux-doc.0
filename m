Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3026C7D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 21:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbeJCDwV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 23:52:21 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:38077 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbeJCDwU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 23:52:20 -0400
Received: by mail-yw1-f68.google.com with SMTP id d126-v6so1395540ywa.5
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=SlSQfw0xp3O/jily8Cdg5l91uvI7kPLnrpqWdEbMJ5U=;
        b=MTqduOB5dXT6MS/TslnIP5rrSWhnvvrxQ50k+lE6Gf/VSz+oUgYUZMrs47ousOOuFl
         p+tA4UVuq7CJ+RYgBBmF2DRp6VXDwyg2RtM3qpyH7OS9CxaBDC5sPFvP97PQySfD6Yc4
         pwuJZMpWiiDnqNqXrX0pWhjIu/gy8Lgv4yzXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=SlSQfw0xp3O/jily8Cdg5l91uvI7kPLnrpqWdEbMJ5U=;
        b=K3NK8c+RWYXJjUgvU1XNeukmQydgyKpTSrFCGIfuJI0QHvrvgTRGbsoet5UVd1kECc
         AY3XUCLs2W9phZyn79OjaEQ+oRjlUjdl/drnzDIi8oJFvJ/txNrZKUgoRBdPrRbVfkV9
         zUhTlqu0Qq53dhTJ8eDd23FuMBcdSUinCfE7OcahUxmpl5vqvOyTLvR0IqBi5EUz1asu
         dE2RxrdZWq4ukST3j/CX7LY3ATYW7Fd+ghNp60NgQd6zpA1YsZF0/AcWHEv0G9HCamK7
         AdNvVUVOrTq/5mGaUW95kcAd08EDdds0DB0fYlxlIJzJyWV0n2evGMSLzx9lLsN+pjXj
         1YrQ==
X-Gm-Message-State: ABuFfogQHzP6q1aVbDXZjfESnmc0esdR0QLS2q5VSLtXke+gJibEkWAV
        I1ZGbPi9mqTREGchlCQEjqgGzeBBDWs=
X-Google-Smtp-Source: ACcGV63S8H8T0AVu1PokLD9S6F2GBb/q+XcO/0WTq3H+RLR+hGlALU3K+dkN4BUwwv72s84OuDSczw==
X-Received: by 2002:a81:1153:: with SMTP id 80-v6mr9666912ywr.302.1538514423942;
        Tue, 02 Oct 2018 14:07:03 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id j186-v6sm6232460ywd.88.2018.10.02.14.07.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 14:07:03 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id o63-v6so1450174yba.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 14:07:02 -0700 (PDT)
X-Received: by 2002:a25:2395:: with SMTP id j143-v6mr1488663ybj.137.1538514422382;
 Tue, 02 Oct 2018 14:07:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 14:07:01 -0700 (PDT)
In-Reply-To: <20181002205259.GA16090@bombadil.infradead.org>
References: <20181002204722.GA9610@scapa.corsac.net> <20181002205259.GA16090@bombadil.infradead.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 2 Oct 2018 14:07:01 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJs-FQT93Og6ULiyugOs1nBCvMKXVrM_dnWTMLKj6ORLg@mail.gmail.com>
Message-ID: <CAGXu5jJs-FQT93Og6ULiyugOs1nBCvMKXVrM_dnWTMLKj6ORLg@mail.gmail.com>
Subject: Re: [PATCH] yama: clarify ptrace_scope=2 in Yama documentation
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Yves-Alexis Perez <corsac@corsac.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 2, 2018 at 1:52 PM, Matthew Wilcox <willy@infradead.org> wrote:
> On Tue, Oct 02, 2018 at 10:47:23PM +0200, Yves-Alexis Perez wrote:
>> Current phrasing is ambiguous since it's unclear if attaching to a
>> children through PTRACE_TRACEME requires CAP_SYS_PTRACE. Rephrase the
>> sentence to make that clear.
>
> I disagree that your sentence makes that clear.  How about:
>
>>  2 - admin-only attach:
>> -    only processes with ``CAP_SYS_PTRACE`` may use ptrace
>> -    with ``PTRACE_ATTACH``, or through children calling ``PTRACE_TRACEME``.
>> +    only processes with ``CAP_SYS_PTRACE`` may use ptrace, either with
>> +    ``PTRACE_ATTACH`` or through children calling ``PTRACE_TRACEME``.
>
> +    only processes with ``CAP_SYS_PTRACE`` may use ptrace.  This
> +    restricts both ``PTRACE_ATTACH`` and ``PTRACE_TRACEME``.

PTRACE_TRACEME is done by the child, not the process with
CAP_SYS_PTRACE, so I still think the Yves-Alexis's is clearer. But if
other agree, I'm fine with it. :)

-Kees

-- 
Kees Cook
Pixel Security
