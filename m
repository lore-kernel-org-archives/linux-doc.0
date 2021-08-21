Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BA7C4338F
	for <linux-doc@archiver.kernel.org>; Sat, 21 Aug 2021 02:29:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F0A0611C6
	for <linux-doc@archiver.kernel.org>; Sat, 21 Aug 2021 02:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhHUC3p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Aug 2021 22:29:45 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:56122 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhHUC3p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Aug 2021 22:29:45 -0400
Received: by mail-il1-f199.google.com with SMTP id c16-20020a92cf500000b02902243aec7e27so6446138ilr.22
        for <linux-doc@vger.kernel.org>; Fri, 20 Aug 2021 19:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=iHf8LUR6Ovn1Eydbqz2P3rlkkwnXm6QsDeIBC7GD3Qg=;
        b=LbY8ClJTgRKAT2uDexYIyD9VMPKWrlro8bQxqLxLTHJPTsBAMuWv4a8r4YAR6GkJqZ
         JIpWeNUoMhpt8LK/f35vLQltVuUsSESHl9XZQtz7rs/2SXh/WTUxknCnMLJ0qSIRwc6J
         2l5fijfDyqAeDcdvrJQslnsUWFnFACoAoQhloqp6XzBsR5LpjvcBCDfiDKB4nZ/OwQ2B
         SPDf7xm50bWSZAZbpN1fxfDyuAEruKlHVb+4kXz0WmsYVRi1rCV0vHcJwGU/loxzkm4x
         UFQSB4N+ahlwJHYSwT/3uNrkfHwQTThLu4MjpPw1yDz0gCc9uihY1zd23XKBim8BR77W
         g8Tg==
X-Gm-Message-State: AOAM5307e0VKtAeBZUGzCS9rC5uO31TuwLGRpej8Uqmwdk0Tjwl0/h2P
        gqV4RaT1SbH3tq2k6C8vnzVHc5zXx7srCjhC2/N3s+QrMrGm
X-Google-Smtp-Source: ABdhPJzK0a8DAE41lfsQEjn583iPFBrbzLkXnZnYep9X4S+LuDPXekPfSUKswjhPhf9qYgtRx0WLpEqRtx7gWnRPEARQrCKJT9xa
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5c8:: with SMTP id l8mr16040022ils.282.1629512946491;
 Fri, 20 Aug 2021 19:29:06 -0700 (PDT)
Date:   Fri, 20 Aug 2021 19:29:06 -0700
In-Reply-To: <00000000000000410c05c8e29289@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000552aaf05ca088c20@google.com>
Subject: Re: [syzbot] KASAN: invalid-free in bdev_free_inode (2)
From:   syzbot <syzbot+5fa698422954b6b9307b@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, balbi@kernel.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, linux-block@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        lorenzo@google.com, manish.narani@xilinx.com, maze@google.com,
        netdev@vger.kernel.org, phind.uet@gmail.com,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot has bisected this issue to:

commit 63d152149b2d0860ccf8c4e6596b6175b2b7ace6
Author: Lorenzo Colitti <lorenzo@google.com>
Date:   Wed Jan 13 23:42:22 2021 +0000

    usb: gadget: u_ether: support configuring interface names.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=155abcc1300000
start commit:   d3432bf10f17 net: Support filtering interfaces on no master
git tree:       net-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=175abcc1300000
console output: https://syzkaller.appspot.com/x/log.txt?x=135abcc1300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8075b2614f3db143
dashboard link: https://syzkaller.appspot.com/bug?extid=5fa698422954b6b9307b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=174ebaf6300000

Reported-by: syzbot+5fa698422954b6b9307b@syzkaller.appspotmail.com
Fixes: 63d152149b2d ("usb: gadget: u_ether: support configuring interface names.")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
