Return-Path: <SRS0=vEmV=ZM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21A1C432C0
	for <linux-doc@archiver.kernel.org>; Wed, 20 Nov 2019 19:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3EA320726
	for <linux-doc@archiver.kernel.org>; Wed, 20 Nov 2019 19:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbfKTTwE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Nov 2019 14:52:04 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:51259 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfKTTwD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Nov 2019 14:52:03 -0500
Received: by mail-il1-f197.google.com with SMTP id x2so622317ilk.18
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2019 11:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=XhBRlgTYSsBApDath+tcXSTGDYeEdj9JFcoeoXzALkc=;
        b=l9wf2vEp6vtjKooQ2+FBvWXOboPbn5ph43syOeHVt7AStz34V2QkPAtfw/PSXOIpgG
         IN/bCTRVZE5e2zF2mBQv7YPVCAKIpS7iKZdxzBtCQqtKbcVGVeNV9Q/3p4ckTtLp3/IJ
         /YzDDXoIGdlg9gYNuYWwp6ydlCTwlJQLDWYhuGcZD3EAkOmN3KevWw6uAIlGgxr3xAzm
         TjSkCEKkZwMHjAsjxHu51oAi47tWkvdlkLZEU0mWTT/hCyqfiuu3oyCCIK8fW5BkwnNy
         beIeqw5mzO6I6wdvcuZJSRZbeAFW7ZY2jmqxIh6VROfXxBabqdxQiQ0vD0QmNtYAOKUW
         nhLQ==
X-Gm-Message-State: APjAAAUfwrRbVEjlulvXraj0rc7VaqwefgF4UhvF//7IiO+rX9TOX8wM
        zh/0nAELtcDWgL4rfiDbl+knrSyIX/FWGEB+u6PtgqUN5Oxa
X-Google-Smtp-Source: APXvYqw3+A+07brQWjAPceJpRxuwfPPco+IwB2wmSin7utykaTY7p8Bz5xO7eX7AKCM3IovDSsUHEzwIE7wdHi9CUYsqWNMP16eD
MIME-Version: 1.0
X-Received: by 2002:a92:3b9a:: with SMTP id n26mr5774182ilh.82.1574279521405;
 Wed, 20 Nov 2019 11:52:01 -0800 (PST)
Date:   Wed, 20 Nov 2019 11:52:01 -0800
In-Reply-To: <0000000000006e31980579315914@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a6993c0597cc8375@google.com>
Subject: Re: INFO: task hung in __do_page_fault (2)
From:   syzbot <syzbot+6b074f741adbd93d2df5@syzkaller.appspotmail.com>
To:     acme@kernel.org, akpm@linux-foundation.org, arnd@arndb.de,
        corbet@lwn.net, ebiederm@xmission.com, keescook@chromium.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux@dominikbrodowski.net, luto@kernel.org,
        mcgrof@kernel.org, mingo@redhat.com, peterz@infradead.org,
        sudipm.mukherjee@gmail.com, syzkaller-bugs@googlegroups.com,
        torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot has bisected this bug to:

commit 0161028b7c8aebef64194d3d73e43bc3b53b5c66
Author: Andy Lutomirski <luto@kernel.org>
Date:   Mon May 9 22:48:51 2016 +0000

     perf/core: Change the default paranoia level to 2

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15910e86e00000
start commit:   18d0eae3 Merge tag 'char-misc-4.20-rc1' of git://git.kerne..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=17910e86e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=13910e86e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=342f43de913c81b9
dashboard link: https://syzkaller.appspot.com/bug?extid=6b074f741adbd93d2df5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12482713400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=158fd4a3400000

Reported-by: syzbot+6b074f741adbd93d2df5@syzkaller.appspotmail.com
Fixes: 0161028b7c8a ("perf/core: Change the default paranoia level to 2")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
