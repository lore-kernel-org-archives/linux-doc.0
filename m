Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D38A57D92A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Jul 2019 15:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730290AbfGOPqx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Jul 2019 11:46:53 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40089 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731894AbfGOPpG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Jul 2019 11:45:06 -0400
Received: by mail-io1-f68.google.com with SMTP id h6so34797775iom.7
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2019 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=indeed.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ScxfIM+hKDT1VQaIZy4BKqol+JPqVs71rTa7fK4KN1M=;
        b=gnHK+c2cwZGKOdspduqrUgKCh6lVrsKIInyhuuavEpiiOcbGli77C58lcIXgh934gd
         X+tLt3k+Ik4aenfsxG9NFO2TPCD832u+KzaI36GcEuU2FPeWtzF+N76i6iSHvlttqWsR
         k+frcRdRsmUd5oRFAvWQ9JfUk8UTM29DlkBao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ScxfIM+hKDT1VQaIZy4BKqol+JPqVs71rTa7fK4KN1M=;
        b=rrdJeVZVN6BHsHmWl1PLQnVER728yG8i0rIXe+JoPXf0eMb7I4d5+H1K301F/Ja25k
         7vIzYM+8MqMWbujTcH/W/u8iFloz2f4NWBhAFqR89Cyq7eYQ/6O6o7Lzr42o/WznAD99
         N0a3oe2sgYouswTq/Gr7vwD2hQwW+fpFVwRnR6hbDbmFUJYtEILyh3Q/kqc7VpRQB15n
         5bOCLU5xZ+7Zb9mCz+xQlgGCS32Z2PmyFZ5T0AdOLkLxfUPFeBAyOhUiu4QVUQ4+SPpK
         i+uknawZI0NlyQmFReabWph98CXa6SAsDKLWQosLZdIWSqb4hCudLtrNoy0IPcpwId3g
         f+DA==
X-Gm-Message-State: APjAAAWWlO0w+ar53fy7CB+XZdEaQsjXqz1gugpEQ+vpw9S6noq5pKvZ
        Me2K8gnEFFKsc/afymdS4/INeisz091LBa8qAmvGLg==
X-Google-Smtp-Source: APXvYqzbMN6ZWpAf5P2ZPcRYCxnKHbAAGVINWdGhBwNhv+b97qeWrnWhIxrRo/FNE6Q1bMyE5Gf6q1fus5Od5lXuuKQ=
X-Received: by 2002:a6b:790a:: with SMTP id i10mr24067436iop.150.1563205505726;
 Mon, 15 Jul 2019 08:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
 <1561664970-1555-1-git-send-email-chiluk+linux@indeed.com>
 <1561664970-1555-2-git-send-email-chiluk+linux@indeed.com>
 <xm26lfxhwlxr.fsf@bsegall-linux.svl.corp.google.com> <20190711095102.GX3402@hirez.programming.kicks-ass.net>
 <xm26v9w8jwgl.fsf@bsegall-linux.svl.corp.google.com> <CAC=E7cV4sO50NpYOZ06n_BkZTcBqf1KQp83prc+oave3ircBrw@mail.gmail.com>
 <xm26muhikiq2.fsf@bsegall-linux.svl.corp.google.com>
In-Reply-To: <xm26muhikiq2.fsf@bsegall-linux.svl.corp.google.com>
From:   Dave Chiluk <chiluk+linux@indeed.com>
Date:   Mon, 15 Jul 2019 10:44:39 -0500
Message-ID: <CAC=E7cVSVqg8raXgVC8f7wB+BJO8TAjSU=0UN-M+Oxuo2raXAw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] sched/fair: Fix low cpu usage with high throttling
 by removing expiration of cpu-local slices
To:     Ben Segall <bsegall@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Pqhil Auld <pauld@redhat.com>, Peter Oskolkov <posk@posk.io>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Gregg <bgregg@netflix.com>,
        Kyle Anderson <kwa@yelp.com>,
        Gabriel Munos <gmunoz@netflix.com>,
        John Hammond <jhammond@indeed.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Paul Turner <pjt@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 12, 2019 at 5:10 PM <bsegall@google.com> wrote:
> Ugh. Maybe we /do/ just give up and say that most people don't seem to
> be using cfs_b in a way that expiration of the leftover 1ms matters.

That was my conclusion as well.  Does this mean you want to proceed
with my patch set?  Do you have any changes you want made to the
proposed documentation changes, or any other changes for that matter?
