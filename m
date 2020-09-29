Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4CEC4727F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 12:46:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 034DE20C09
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 12:46:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387577AbgI2MqN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 08:46:13 -0400
Received: from mail-io1-f80.google.com ([209.85.166.80]:56601 "EHLO
        mail-io1-f80.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387571AbgI2MqJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 08:46:09 -0400
Received: by mail-io1-f80.google.com with SMTP id d21so2723079iow.23
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 05:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=aIH5+9o/WQ3U3fksD3TLsum6UmaiEhIKEW/H6MhmdWk=;
        b=VPk5MpK7NWoBFdYAn7swuPLJgQpgHAXVAwemPDP57JC2U+Hf491enJ0RuaJ6d7kn5U
         Fyrgt7MIrYMUaZshpKrBcsM9r2giFT09AGmvcoqT3K41pUNus9b/02cGc9+EtO4UhEwT
         AkuYfqejtQYYU53ytyCptWkZ2HooTsn8IlmBFIjO4+mVYReQ7OrGU1Ves+7e/t+C5XtQ
         XR6vBTM2TB0LLoUiZKz4Q1x2uWZdUnva9tjE513aOMH+IcYtzr79hLYJxk7OvTBQUO56
         /vzw8Sv6udV3kFpmESaXtevgocZsJH0WXbv/r0tRffS81GqGy92Y8EkWbCRpWTwOcma+
         w0PA==
X-Gm-Message-State: AOAM5304W49OwMKIbur5PWuYZ0kqwu3HWGpdUDblRR2rYRXjTsVITZ5u
        WFPr/hDyl2m57vtjnafOowVAN7FhhD/5OHC+UeUv8iU1ANeM
X-Google-Smtp-Source: ABdhPJwXmI8uoWFeVU57vW1YfSovrR/LKjfjYU2pu0Qiw8c9CBL2Er2mOJAkOIOmHv3XCnBwKzhAH9Zj40sRAD6sOGgoDx76gFvA
MIME-Version: 1.0
X-Received: by 2002:a92:360d:: with SMTP id d13mr2524504ila.99.1601383568081;
 Tue, 29 Sep 2020 05:46:08 -0700 (PDT)
Date:   Tue, 29 Sep 2020 05:46:08 -0700
In-Reply-To: <000000000000680f2905afd0649c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b98b5505b0732a29@google.com>
Subject: Re: BUG: unable to handle kernel paging request in bpf_trace_run2
From:   syzbot <syzbot+cc36fd07553c0512f5f7@syzkaller.appspotmail.com>
To:     andriin@fb.com, ast@kernel.org, bpf@vger.kernel.org,
        corbet@lwn.net, daniel@iogearbox.net, davem@davemloft.net,
        dsahern@gmail.com, hawk@kernel.org, john.fastabend@gmail.com,
        kafai@fb.com, kpsingh@chromium.org, kuba@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, netdev@vger.kernel.org, rostedt@goodmis.org,
        songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot has bisected this issue to:

commit 58956317c8de52009d1a38a721474c24aef74fe7
Author: David Ahern <dsahern@gmail.com>
Date:   Fri Dec 7 20:24:57 2018 +0000

    neighbor: Improve garbage collection

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d31675900000
start commit:   12450081 libbpf: Fix native endian assumption when parsing..
git tree:       bpf
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11d31675900000
console output: https://syzkaller.appspot.com/x/log.txt?x=16d31675900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ac0d21536db480b
dashboard link: https://syzkaller.appspot.com/bug?extid=cc36fd07553c0512f5f7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1365d2c3900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16d5f08d900000

Reported-by: syzbot+cc36fd07553c0512f5f7@syzkaller.appspotmail.com
Fixes: 58956317c8de ("neighbor: Improve garbage collection")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
