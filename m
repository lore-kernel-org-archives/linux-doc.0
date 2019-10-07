Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 38BA97D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 22:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbfJGWEl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Oct 2019 18:04:41 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38550 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728983AbfJGWEl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Oct 2019 18:04:41 -0400
Received: by mail-pl1-f194.google.com with SMTP id w8so7508848plq.5
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2019 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ixInCzHTHuGPoMvc/4LEqiBnoIwsvH2ChHMVP5v+VmY=;
        b=uOe86C3vj6CaS6uwMW2GJRTthVEBShtNmMQn6K5ZgQOd13S77DKyAScS4t5Sp05CAr
         frkcDaQ0fR3BQn5RCygrrLLnk/8iVh9zI6nJ0h3oKPxTH2KD8QT8wcCJwD5c/+XzVjdQ
         0ni6r7S0CGsFBqLR5kowdiHW0a9wPlQc7M5r4Pcyub+6185zjMkKPrjGVE5PaR5qKf5X
         fBMtY8GbTPyrb1j8iRMXeMKURnv9Puz17sJEnNLlBeSKjR0ZuNRpRGq5nFrEzeOSRDmq
         QUFwXjVrGYTYw1/HYi7C+LfirFMTRYkfOyjo+j8JgZPXOs+2VOHV4baVcsTSXzea3MmO
         iR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ixInCzHTHuGPoMvc/4LEqiBnoIwsvH2ChHMVP5v+VmY=;
        b=Q22HOoJn0zk7IJTsrU2yqta2hJIQxmUOd/mTexSo1Y24UtpJ2IfrNtm0Atc5uIcuj3
         Wzq/FdmHFSoRmNG8Zb3LVrJCK4/adXpdxKo73s3OZSdzYQu4okY+e0N4peeVqVNsBSt3
         OozPq/nAeNUKSYpnsDAp0ycxmA8osrTx7/0NQXbUoV2Q1pKAktD+Va/ptQuQQgddnwZQ
         muXTe1q6cvF+yywnv/GbdchPI53jkdMc4870chONd/b4Fv7FRGheI04+4GCln5wSbv11
         8/uwed29hycoV2iZse8OWym6mup8Dq8J3n5aB9zoScdMvfD8yWmK2xAAAc8YEDEOV8tC
         YmcA==
X-Gm-Message-State: APjAAAUtauxuSVOGZ3jd6rSmQExq54QEOD8xTh+jKBGCykrtIu8Sp3yb
        J9fGfYwXbJ630x7ji3RBc7CyJ0+6ZN9wVoGjavA/Tg==
X-Google-Smtp-Source: APXvYqxdfUw8NUeJtuRGGEzEqvtnI3iP4U3bEOpjmRAhZp4oxYNIfoAO20zZhTj+4G8d6lAZz65Epk8t27NgaZEGRYg=
X-Received: by 2002:a17:902:d887:: with SMTP id b7mr30655303plz.297.1570485879868;
 Mon, 07 Oct 2019 15:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <1567890091-9712-1-git-send-email-sj38.park@gmail.com> <CAFd5g46MNYcY-o8Z-1tSi0Kva02CjhcWC-xwkeNc6kfiDzLpLQ@mail.gmail.com>
In-Reply-To: <CAFd5g46MNYcY-o8Z-1tSi0Kva02CjhcWC-xwkeNc6kfiDzLpLQ@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 7 Oct 2019 15:04:28 -0700
Message-ID: <CAFd5g47sUx6ZRxcH4KdKjftv=wo9HmWn+bZukd8gU-YcJv24zQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Fix verification command
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     shuah <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, kunit-dev@googlegroups.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 8, 2019 at 4:40 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Sat, Sep 7, 2019 at 2:01 PM SeongJae Park <sj38.park@gmail.com> wrote:
> >
> > kunit wrapper script ('kunit.py') receives a sub-command (only 'run' for
> > now) as its argument.  If no sub-command is given, it prints help
> > message and just quit.  However, an example command in the kunit
> > documentation for a verification of kunit is missing the sub-command.
> > This commit fixes the example.
> >
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Shuah, can you apply this to the kselftest KUnit branch? This should
not require a resend.
