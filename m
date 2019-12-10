Return-Path: <SRS0=aN+I=2A=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDC4C43603
	for <linux-doc@archiver.kernel.org>; Tue, 10 Dec 2019 01:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76F492073D
	for <linux-doc@archiver.kernel.org>; Tue, 10 Dec 2019 01:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfLJBiC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Dec 2019 20:38:02 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:54841 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfLJBiB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Dec 2019 20:38:01 -0500
Received: by mail-io1-f71.google.com with SMTP id h10so10525967iov.21
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2019 17:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=d/rLwgpGcOLrJAfYzylpfLq8TO3Ppq0ukiadwzb7btY=;
        b=tMmLBe/mlRPqrgAaSzQcscv2oGKGqySr4s1N57fTMw40Bo1pXALKnuQu9WyST9Ty4Q
         LWRVdR58wxCn/h8yET5AhgajZZStrjcQwd4X4yVJPxnApOOxmtfg8/4EpnYD4y3de3zI
         8q9uJuC4FfKM+0Ml+aZeFohCARJovS2yid4o+OIQBTrwkd7TZVvWUI5VfzjH9Nbl9lB0
         vok+/ghwNAdKX6t8Ol46K+1sk2nGnFZKja93ApSgQwN07XiRMMxUEfgzuYHr3rxWlcz6
         CWOe/toCvTe8mcHnjFD8+uB/15LnHC/kQcaRis0m7UV+gY2DhXxQUCFHqsNwG4FIH9qg
         I9Ag==
X-Gm-Message-State: APjAAAXBXfjdRdodi/U0PkjB6jJlCIFzPFP0/JMqn21rNIkla06YzQw1
        hBvkkS0xASdMbA1eeSC87fzp99ykU7/2HTTs5bhOkgAR6bM9
X-Google-Smtp-Source: APXvYqx3F0Ru+DmMowW3EN6d2QYATYtlFpjQe/HbQv1AYpW3UNnTiZ8L2MNSyTDTtQA/qzP66Ug/fqFZPiweGeK/5P/FGvCtPAyx
MIME-Version: 1.0
X-Received: by 2002:a6b:5b12:: with SMTP id v18mr24150486ioh.112.1575941881185;
 Mon, 09 Dec 2019 17:38:01 -0800 (PST)
Date:   Mon, 09 Dec 2019 17:38:01 -0800
In-Reply-To: <00000000000044a65205994a7e13@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000003cc8505994f9036@google.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in mem16_serial_out
From:   syzbot <syzbot+92f32d4e21fb246d31a2@syzkaller.appspotmail.com>
To:     andriy.shevchenko@linux.intel.com, asierra@xes-inc.com,
        corbet@lwn.net, ext-kimmo.rautkoski@vaisala.com,
        gregkh@linuxfoundation.org, jslaby@suse.com,
        kai.heng.feng@canonical.com, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, mika.westerberg@linux.intel.com,
        paulburton@kernel.org, peter@hurleysoftware.com, sr@denx.de,
        syzkaller-bugs@googlegroups.com, yamada.masahiro@socionext.com,
        yegorslists@googlemail.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot has bisected this bug to:

commit bd94c4077a0b2ecc35562c294f80f3659ecd8499
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed Oct 28 03:46:05 2015 +0000

     serial: support 16-bit register interface for console

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13723196e00000
start commit:   e42617b8 Linux 5.5-rc1
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=10f23196e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=17723196e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3754e2c78c1adb82
dashboard link: https://syzkaller.appspot.com/bug?extid=92f32d4e21fb246d31a2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136f7e41e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=112b7c82e00000

Reported-by: syzbot+92f32d4e21fb246d31a2@syzkaller.appspotmail.com
Fixes: bd94c4077a0b ("serial: support 16-bit register interface for  
console")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
