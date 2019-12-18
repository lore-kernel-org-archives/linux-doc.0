Return-Path: <SRS0=pwJD=2I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7659EC43603
	for <linux-doc@archiver.kernel.org>; Wed, 18 Dec 2019 07:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53EB62176D
	for <linux-doc@archiver.kernel.org>; Wed, 18 Dec 2019 07:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfLRHGB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Dec 2019 02:06:01 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:44795 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfLRHGB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Dec 2019 02:06:01 -0500
Received: by mail-il1-f198.google.com with SMTP id h87so1032305ild.11
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2019 23:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=G6GWGSCGYBM0pdmoLce8hCcVh4IRjkjoIvq92n6KsqA=;
        b=ie4Rv0SocPrgv4gwtLnl7REbSEr+idwhMMGWVx85GCE3wMGZ9LQ1y7Dnzbhf1lWvWe
         SDlBnn1cEYM+VXyjwYyqVSg3HtNm62/X66z2zV1ciSTOcCoBdIQ8DWLRoVVrmiMiF1Cp
         0a6KKfPiP1UW/VtjOzk5U5VIIeojyDVjOup7CybV9AThrKEbw0l03Ld4mgfX9sb957MT
         Tb1J7wv0XVjdpIdl7WuzO+PraPYkH+xSaBWv6QnusJRSkeJHQs+LE4LXreY6RoK1vNVq
         lLWOSM/jrrnB+zp6jtvNaX+sML+SV0ajkv+Jqq71FMSdidEz66tg/qCD9ZBvCxX2zkw5
         P+Gw==
X-Gm-Message-State: APjAAAW0NgEC2c1w/BaX3ju4W/12MoY+PChsYKrzTCqpmekzmhlFEtN7
        8wRP9nlb48/pM+LcHZzeRwpstoMTZkN0HvxnSU4i+iEA+B4U
X-Google-Smtp-Source: APXvYqy725bW+YQJ+KhlbU4uCwlb37sWXU+LVyGIf+hBtmotYyM03RfqBfzAwZnudC2KpWSUF9vy3+uzRWPHqx44bx/R0Vpqzhy5
MIME-Version: 1.0
X-Received: by 2002:a5d:9f51:: with SMTP id u17mr533695iot.258.1576652760916;
 Tue, 17 Dec 2019 23:06:00 -0800 (PST)
Date:   Tue, 17 Dec 2019 23:06:00 -0800
In-Reply-To: <00000000000024aa520599f4c933@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bfac3c0599f513fe@google.com>
Subject: Re: KASAN: slab-out-of-bounds Write in watch_queue_ioctl
From:   syzbot <syzbot+5a774ffe70862ca9ebc7@syzkaller.appspotmail.com>
To:     arnd@arndb.de, axboe@kernel.dk, corbet@lwn.net,
        derek.kiernan@xilinx.com, dhowells@redhat.com,
        dragan.cvetic@xilinx.com, ebiggers@google.com,
        gregkh@linuxfoundation.org, hare@suse.com, jaegeuk@kernel.org,
        james.morris@microsoft.com, jannh@google.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab+samsung@kernel.org, syzkaller-bugs@googlegroups.com,
        tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot has bisected this bug to:

commit fe78d401ca6b3639385cf7a9a1597b9cd48f64eb
Author: David Howells <dhowells@redhat.com>
Date:   Fri Oct 11 07:48:08 2019 +0000

     General notification queue with user mmap()'able ring buffer

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1163cafee00000
start commit:   fca4fe89 Add linux-next specific files for 20191217
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1363cafee00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1563cafee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=634b7ce01f79423d
dashboard link: https://syzkaller.appspot.com/bug?extid=5a774ffe70862ca9ebc7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13df92fee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1003cafee00000

Reported-by: syzbot+5a774ffe70862ca9ebc7@syzkaller.appspotmail.com
Fixes: fe78d401ca6b ("General notification queue with user mmap()'able ring  
buffer")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
