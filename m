Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7EBC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 16 Oct 2021 22:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1939D6101E
	for <linux-doc@archiver.kernel.org>; Sat, 16 Oct 2021 22:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235882AbhJPWZg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Oct 2021 18:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235717AbhJPWZf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Oct 2021 18:25:35 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D397CC061767
        for <linux-doc@vger.kernel.org>; Sat, 16 Oct 2021 15:23:26 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z11so56257764lfj.4
        for <linux-doc@vger.kernel.org>; Sat, 16 Oct 2021 15:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p3FVWFHYEJvia2KboNohOnop6t5qjPeV+JIRsjfGAvQ=;
        b=PcAfAJ7La6ATrlQFcKj7Yet2plWqrYwTqKqG/hqo3fQBaEj6mz9AjBYZpLX7Goa7kG
         WONoO8E7+mM4nmkHFzZLwRWN6R7cbBo4QYHHG456kCYDvZ/RRM58fp3jMbBN9mJ8Lgi2
         sLYv9K5RYXsm+91VwuyzZBqiIq5H/yAlZVhhGN9Odnp43B2MXKkQ9N3p0KsiiVgVTciD
         OOEmPLMpfxafQu6UWwRvwDG7p77SdPnKMTg+bsSib0rt16VzJNDug1yI1+Y5Vqw7FaQK
         /9lxOCfxHnxNFisfQXozF2WYWF0N6v27DXcrdxFuYLthvGEUF3EWFtE6Nj4sNnzORmBs
         X0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p3FVWFHYEJvia2KboNohOnop6t5qjPeV+JIRsjfGAvQ=;
        b=KHKcI8ikMmp4A5X1NVJzHXlRgPTiOS0K0LEcQ0PGIO5/KIiNfsNEhxf9l2O7X26w9u
         PZsIIM37dxkQesqcoISG128kS0cn4uh8iitBQZCLjq3Wk6dmthK7QGsenQmz4Sw23cox
         eKzzvvdTQXj80KyPjZE0Tzbv5Jtroen95oB6v00aJRh+ZK5muMnF3OYq8E6UELxddkIr
         axE5vgusiLiccWMINYxm6PjKz71Q5RBzCV6OfudFYYQXeXdBzGbRZwD+K8Rk8PqSg0VA
         1ixcSjJDhGE7L26uHZE1vrVWoqIJU0z3QLHh4UtYIdhW/McpSH+VohAuV7hdLcUhtKxs
         DgSA==
X-Gm-Message-State: AOAM530p8vrawsXvIip91FvTA0mu+8t47hgfnbMQFg9iCyXaxxx+t85Z
        x9CXSBWGwu8YUu6AbmCmKIZtLOgmVrVMJEZnAosHdA==
X-Google-Smtp-Source: ABdhPJy82eQjg2a0KgyXHCV7OyYHGgWPCMzm75KYH0/22I29cGhFGc7f/I9ftrW1M4rzVCVFOHqliZaq2imdQccEUC4=
X-Received: by 2002:a05:6512:3e9:: with SMTP id n9mr21107873lfq.72.1634423005077;
 Sat, 16 Oct 2021 15:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211008081739.26807-1-brgl@bgdev.pl> <CAMRc=McpCw2TgLFCzvwOupd+RW2BoQRJKVTdbR6s2z+O2pJuUQ@mail.gmail.com>
In-Reply-To: <CAMRc=McpCw2TgLFCzvwOupd+RW2BoQRJKVTdbR6s2z+O2pJuUQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 00:23:13 +0200
Message-ID: <CACRpkdYtD-3vX1VW9uLn3zqxD7gYjCXs+NgLHfnsZHhcA4nJyw@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] gpio: implement the configfs testing module
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 15, 2021 at 4:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Another ping...

If it's hard to get attention I would simply queue these on a immutable branch
in the GPIO tree, then merge it into what you send to linux-next and offer
the interested parties to pull it in.

If noone complains as we get really close to the merge window, just offer
this branch to Torvalds in a separate pull request.

Yours,
Linus Walleij
