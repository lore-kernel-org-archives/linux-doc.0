Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC914C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 10 Feb 2022 09:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238634AbiBJJ3S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Feb 2022 04:29:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238538AbiBJJ3E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Feb 2022 04:29:04 -0500
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9965F10B2
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 01:29:06 -0800 (PST)
Received: by mail-io1-f72.google.com with SMTP id d6-20020a6b6e06000000b006101dc42ec8so3728839ioh.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 01:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=lbZClnawL85i6y/f1XZKEH3U2806L2hF7lFn0+Ro7Ew=;
        b=kNzwzhGfvgHVOqjtm0lxeEdfTpCgQueBRvL1Y6J288Yb9lw/Q3lpeLqsWTfV5KphM4
         dO/UdPVpCzqp1oC9Wp+7Hxtxlaj03bRdb7Oohip1K7FhL38DOAcje76xmiX48euFG4qU
         SnP+Ry0vQqkgJ5xD4VL9cntlpB521sjo+M4p3MPtFCEQbO5gaC5lMfBVed6zCj+suqsR
         EqQXigSEA9R3GAzpMoKEQuWeJqFwP3WhB2XrsL1Ch2Sq44RMdhU8Y3q17vNz0M2Z+4Hq
         E8w908/oolv5vXmnKQADLdjoXS1fZgpfs7O6pGTWsPo81y3vTsZ022j0nLEBkpHuKZ5u
         UKCQ==
X-Gm-Message-State: AOAM533L7Vwa2dEFGamsgVGYyN2cTxCthUj4uX4jPJoGoNhN3jNJZW7Z
        Y+QrmkK8ZpywWqgWOxnQqLzECr7V7DIsvAZNdh0/FRNZGzAM
X-Google-Smtp-Source: ABdhPJx22vdsd9ZwS5xcJlnZq2r7nAA5BqmnE9xXQOkXPLW5oeCWMIkcNmqMItDy/Lg+pycfhLQYxawcp7pQ1kDwS81fqOWh7+0x
MIME-Version: 1.0
X-Received: by 2002:a02:aa0a:: with SMTP id r10mr3655553jam.246.1644485345948;
 Thu, 10 Feb 2022 01:29:05 -0800 (PST)
Date:   Thu, 10 Feb 2022 01:29:05 -0800
In-Reply-To: <000000000000a16ad7059cbcbe43@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e238bf05d7a69450@google.com>
Subject: Re: [syzbot] WARNING in bpf_warn_invalid_xdp_action
From:   syzbot <syzbot+8ce4113dadc4789fac74@syzkaller.appspotmail.com>
To:     andrii@kernel.org, andriin@fb.com, ast@kernel.org,
        bpf@vger.kernel.org, corbet@lwn.net, daniel@iogearbox.net,
        davem@davemloft.net, dsahern@gmail.com, dvyukov@google.com,
        eric.dumazet@gmail.com, hawk@kernel.org, john.fastabend@gmail.com,
        kafai@fb.com, kpsingh@kernel.org, kuba@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, pabeni@redhat.com, songliubraving@fb.com,
        syzkaller-bugs@googlegroups.com, toke@redhat.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 2cbad989033bff0256675c38f96f5faab852af4b
Author: Paolo Abeni <pabeni@redhat.com>
Date:   Tue Nov 30 10:08:06 2021 +0000

    bpf: Do not WARN in bpf_warn_invalid_xdp_action()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10d50baa700000
start commit:   b3c8e0de473e Merge branch '40GbE' of git://git.kernel.org/..
git tree:       net
kernel config:  https://syzkaller.appspot.com/x/.config?x=1a86c22260afac2f
dashboard link: https://syzkaller.appspot.com/bug?extid=8ce4113dadc4789fac74
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=113c8a3bb00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16eb4307b00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bpf: Do not WARN in bpf_warn_invalid_xdp_action()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
