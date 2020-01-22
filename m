Return-Path: <SRS0=DKq9=3L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA58C32771
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 21:01:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A11E924676
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 21:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgAVVBC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 16:01:02 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:50328 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgAVVBC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jan 2020 16:01:02 -0500
Received: by mail-il1-f197.google.com with SMTP id z12so711160ilh.17
        for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2020 13:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=lYr3VEa0Huaaj5cr2eT5ZYbboOtwrfmYEjzqbnc0FyU=;
        b=JuEPfgki+/AtFAh969AQABmbYeuePUOzgxW6TDQyKDsiaz/cohfRYmn2diZNfJ22Di
         0I4MmyGz0+a10b8lkVmuoDsL+9tmYeS9qOdjTg8dM1TuUZSuCLkmz5BghVoBNKgoxFQN
         bMQFdjPBeKBpvCTtSI921Ou+X83XDthGrV7VHoY8Z8IX3NUD5tPtTswF7F2bk7oW8WQL
         xkLPHIDT+3FR2aUAzRsAShMnHkbNMKoNpbjP69M80KjuSim/rINDo6FoYn/pNcowEUTL
         RhyAdSHWbAqXCrOa3k8OLtu7umfb+9sk8k5fKPEyEdpohijxsg4ct3VLMej+g8di6T5s
         wbAQ==
X-Gm-Message-State: APjAAAW3V7MjATyzwQzJoiNZy/KatCseOThH8psa6IiKVWz5WziK1N8M
        LIQxx+rA+iA1m60fAQ99eEK7lr7cOFdeJWehusPZysMO5bUW
X-Google-Smtp-Source: APXvYqy98tfXila0SvcgGKr7oS77gUHB1tW0UiRvSHV2F9dhjQ09YKNKJt8UX6JmXLfF/xJtAX4wfwJJc78t2tikEEKrLfVlGsr1
MIME-Version: 1.0
X-Received: by 2002:a5e:924c:: with SMTP id z12mr8598447iop.296.1579726861270;
 Wed, 22 Jan 2020 13:01:01 -0800 (PST)
Date:   Wed, 22 Jan 2020 13:01:01 -0800
In-Reply-To: <000000000000a16ad7059cbcbe43@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000068843f059cc0d214@google.com>
Subject: Re: WARNING in bpf_warn_invalid_xdp_action
From:   syzbot <syzbot+8ce4113dadc4789fac74@syzkaller.appspotmail.com>
To:     andriin@fb.com, ast@kernel.org, bpf@vger.kernel.org,
        corbet@lwn.net, daniel@iogearbox.net, davem@davemloft.net,
        dsahern@gmail.com, hawk@kernel.org, john.fastabend@gmail.com,
        kafai@fb.com, kuba@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot has bisected this bug to:

commit 58956317c8de52009d1a38a721474c24aef74fe7
Author: David Ahern <dsahern@gmail.com>
Date:   Fri Dec 7 20:24:57 2018 +0000

    neighbor: Improve garbage collection

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=124a5985e00000
start commit:   d0f41851 net, ip_tunnel: fix namespaces move
git tree:       net
final crash:    https://syzkaller.appspot.com/x/report.txt?x=114a5985e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=164a5985e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9290aeb7e6cf1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=8ce4113dadc4789fac74
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11f99369e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13d85601e00000

Reported-by: syzbot+8ce4113dadc4789fac74@syzkaller.appspotmail.com
Fixes: 58956317c8de ("neighbor: Improve garbage collection")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
