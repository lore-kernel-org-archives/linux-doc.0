Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C870C7D071
	for <lwn-linux-doc@archive.lwn.net>; Sat,  7 Jul 2018 03:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932790AbeGGDu2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Jul 2018 23:50:28 -0400
Received: from mail-oi0-f65.google.com ([209.85.218.65]:34369 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932635AbeGGDu2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Jul 2018 23:50:28 -0400
Received: by mail-oi0-f65.google.com with SMTP id 13-v6so27018346ois.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Jul 2018 20:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yZFPDMKMC8Eb1D2j6cSBeRYiMdxx9JLVUOuuPUpfaXI=;
        b=K03KDV41v0XLvp7iD6bJ6nInv/rN8lErCSaUJE3Bz8qSFQr282a0nZF+NS98zg5GKA
         bY0cNkdqx7Kw7wy19ph8y4Ptqp+aZvQx+drkY1GieJlg4nVNSzES5ZfnW4iB4UJalD9d
         SroOdMRMvlmqH6JLq+fpcNB4bi5bq5+DxeogEvXKDB9GNE4xMQq2S3TTlnokx4IyrJKI
         61N1Y0m/3MH8uy4MZ6WRv1WY1dpnk86+oGTORyRROG077UCcJ2CLTLsNiSwjQHEFa1pa
         xrd3i7VHgy8mLZKND0PF34+EffL75ZZxZCjUnmdW7PMebTi5xChS4cbse6+3QZxT8xte
         /jAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yZFPDMKMC8Eb1D2j6cSBeRYiMdxx9JLVUOuuPUpfaXI=;
        b=Hzl2r8zstDO3gSivh065WEYkH6PsbNBMThNZLGwMxikI7hbNnH3sMJ5xo0BZGuHyWT
         qpUxVywW3ifsTiFULowcB4OJqve5Cxg31oY0bwckN75ocXyqum8yNnMO/oU/d+FeNsVp
         Qf/Lc5MZ+eaxQU5g75ZNSA+V5ri4b5lTkXdPp10P12E4O2faoLDpa4j6VnxCFJzKvieA
         1g/QlpHhJGKpwm5cUe0ad+LB7nyoGgAUZzD0LaToy9r18jRn7FFJu6EyOgPekyYbElds
         jDHp/pHW56smn/31GGFuR4PXJ/oP4AO9CDrAqkmDE1dgxBRFgrL1uYO3EUNZIQV8WDnC
         Qh1w==
X-Gm-Message-State: APt69E3Q6T+XukIB8qJJVjw2/Ungdul9p0xISQEHk8FxFPvYygZ1ERzB
        T1gKm1veTXCPPv8WBZmnJO6B5eocz6rcWSD6vt+rbA==
X-Google-Smtp-Source: AAOMgpeyuqsxnhJG6KySFifhDweCbuiNWuP1jEn14qdWlSmzGkOBlgLmlwOCT1yfbaQ6Z3nLmYxXRKp84DD1urG3K7Q=
X-Received: by 2002:aca:d015:: with SMTP id h21-v6mr14971245oig.142.1530935427165;
 Fri, 06 Jul 2018 20:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <87vacsrt0r.fsf@notabene.neil.brown.name> <87fu3dihtf.fsf@notabene.neil.brown.name>
 <874lintqa6.fsf@notabene.neil.brown.name> <87y3fcegnn.fsf@notabene.neil.brown.name>
 <CAG48ez2yTZMye0W3_5R04bV-Qyaz-=zSiVonw_zvRQNH6dcfeg@mail.gmail.com>
 <878t6nybj7.fsf@notabene.neil.brown.name> <87601ryb8a.fsf@notabene.neil.brown.name>
In-Reply-To: <87601ryb8a.fsf@notabene.neil.brown.name>
From:   Jann Horn <jannh@google.com>
Date:   Sat, 7 Jul 2018 05:50:00 +0200
Message-ID: <CAG48ez1XSV9a-SBob6_p3RNC2vU3FnMnsm9Cd6deChh6QexpzQ@mail.gmail.com>
Subject: Re: [PATCH mm] VFS: seq_file: ensure ->from is valid.
To:     neilb@suse.com
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 7, 2018 at 5:29 AM NeilBrown <neilb@suse.com> wrote:
> Previous patch ("VFS: simplify seq_file iteration code and interface")
> removed code to set ->from to zero when ->count is zero, as ->from is
> dead at that time.  However it didn't ensure ->from was set properly
> whenever ->count becomes non-zero.
> This can only happen when ->show() is called.  Of the three places it
> is called one already has ->from set to zero.  The other two are
> fixed by setting from to zero after fully flushing the buffer (at which
> point ->count will also be zero).
>
> Reported-by: Jann Horn <jannh@google.com>
> Signed-off-by: NeilBrown <neilb@suse.com>

Tested-by: Jann Horn <jannh@google.com>

> ---
>  fs/seq_file.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/seq_file.c b/fs/seq_file.c
> index fd82585ab50f..1dea7a8a5255 100644
> --- a/fs/seq_file.c
> +++ b/fs/seq_file.c
> @@ -220,6 +220,7 @@ ssize_t seq_read(struct file *file, char __user *buf, size_t size, loff_t *ppos)
>                         goto Done;
>         }
>         /* we need at least one record in buffer */
> +       m->from = 0;
>         p = m->op->start(m, &m->index);
>         while (1) {
>                 err = PTR_ERR(p);

This looks correct to me. I have also tested that with this patch
applied, my crasher doesn't work anymore.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
