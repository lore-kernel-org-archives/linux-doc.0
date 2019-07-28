Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 90F7D7D91A
	for <lwn-linux-doc@archive.lwn.net>; Sun, 28 Jul 2019 03:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfG1DqC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 27 Jul 2019 23:46:02 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:53486 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfG1DqB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Jul 2019 23:46:01 -0400
Received: by mail-io1-f69.google.com with SMTP id h3so63580450iob.20
        for <linux-doc@vger.kernel.org>; Sat, 27 Jul 2019 20:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=o2kzyTbMhQL/kAorHcC+7ID+BqHWTQyphajjOBsUUz8=;
        b=TiERs5WeWK2/LHDowNePkTHtya05vIi/Fv66Jl3H1HgZZifgvPIawYvnlFrm6epFHU
         ++OvsHhrmmkVMrkkGf06FYKUXsD/QnaoTre/E4b43llk6AzLRo062VdCHGiFudMz5pbF
         GzSm7+SzPWaxZRV0QBHcZWojpxsV0zoL5EtiNbMHUSZov0gpbg+c+yVFKe7522+5N2+3
         UPW+u9UgpbvisV0gIDtHG/lBIM3JPNmputOf9LGjamuGT5MiuqGQ4MLdjZtyT92Fn1W1
         M8wZM3AQaOW01RerhLHKTcSeMOoi/wo1QQPWzGEMdHHQDA38dhso0eCitS4Noga/oKbe
         19UQ==
X-Gm-Message-State: APjAAAVvHVJOaofvzG+tgeYd13Z1JNnPkhiJod2PaUrVdzzwVX3f3aeA
        WXQq2/8CjgiHdb+iMktK5MbvpQmmTQNbNnx7Ogjlg7YbAe97
X-Google-Smtp-Source: APXvYqxXM+e7HkG1ndOj4S4xy8tLRGbSOz7rHomFcVxe9opbIqsbCOX/jEqUOK4tXAcI7y8l03aMdveo9Zu26OKpCrjDuyQnBW0q
MIME-Version: 1.0
X-Received: by 2002:a02:878a:: with SMTP id t10mr33742269jai.112.1564285560945;
 Sat, 27 Jul 2019 20:46:00 -0700 (PDT)
Date:   Sat, 27 Jul 2019 20:46:00 -0700
In-Reply-To: <0000000000002b4896058e7abf78@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000300996058eb59dd7@google.com>
Subject: Re: general protection fault in tls_trim_both_msgs
From:   syzbot <syzbot+0e0fedcad708d12d3032@syzkaller.appspotmail.com>
To:     ast@kernel.org, aviadye@mellanox.com, borisp@mellanox.com,
        bpf@vger.kernel.org, corbet@lwn.net, daniel@iogearbox.net,
        davejwatson@fb.com, davem@davemloft.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com,
        kafai@fb.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot has bisected this bug to:

commit 32857cf57f920cdc03b5095f08febec94cf9c36b
Author: John Fastabend <john.fastabend@gmail.com>
Date:   Fri Jul 19 17:29:18 2019 +0000

     net/tls: fix transition through disconnect with close

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=155064d8600000
start commit:   fde50b96 Add linux-next specific files for 20190726
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=175064d8600000
console output: https://syzkaller.appspot.com/x/log.txt?x=135064d8600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4b58274564b354c1
dashboard link: https://syzkaller.appspot.com/bug?extid=0e0fedcad708d12d3032
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14779d64600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1587c842600000

Reported-by: syzbot+0e0fedcad708d12d3032@syzkaller.appspotmail.com
Fixes: 32857cf57f92 ("net/tls: fix transition through disconnect with  
close")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
