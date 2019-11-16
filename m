Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 21AE87D90F
	for <lwn-linux-doc@archive.lwn.net>; Sat, 16 Nov 2019 21:58:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfKPV6B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 16 Nov 2019 16:58:01 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:52422 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727632AbfKPV6B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Nov 2019 16:58:01 -0500
Received: by mail-il1-f200.google.com with SMTP id t23so12483544ila.19
        for <linux-doc@vger.kernel.org>; Sat, 16 Nov 2019 13:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=FivOluRux2/DVAkTpjJWtSvpnnKGD4Lb0eJIgMOZqFE=;
        b=PwK5WYQhx23p1d0cs81t1uezkmYKcewmexQ5NnLHFCP5doAv9ZU7mvsv/+EtfmeFG9
         rwctpS7y0jtv1mhsGH2K2x6s+fGCEt9g6JUK1kxzVIUDYNOt0D1dbx5nZS209+iUSx1L
         HVs5q79H0bfpa/TOCeepVsTA+dEhUeAv+Tbc2o52pUlOMTw34GY5qXKTvQBaeVp+jVoD
         AC7pqT/hsXJA3MXYwbTFvTenzng4R4K/suGBfZDZ6Qce6Mm25UfXO8cJKJrY6o85etXs
         AGyxflbTMCRX6NXDcoaxXQH9mQGV+W2G9iEnF7NNrlVbGLVsR2VvQFkBeTChNmx35kJD
         WjIA==
X-Gm-Message-State: APjAAAV79+RmBUSMvcadBAuJVKuTxy+NrbNFgRlaluwZoiTqAH4mPNSg
        x3Jw+n1UDicIGY2HZtLqE9geaCfks9OLt5+aY+a3M5dVjOWq
X-Google-Smtp-Source: APXvYqyBClsLcSrM3dmH+CTnYr4efRlSIxtAlH+yao3jUBN/eeOlTRZsa2EivhAtWsDIyW2jCsP5hnuY0bzWexF2Lwoo7rY/12fX
MIME-Version: 1.0
X-Received: by 2002:a92:5fc2:: with SMTP id i63mr7652353ill.218.1573941480648;
 Sat, 16 Nov 2019 13:58:00 -0800 (PST)
Date:   Sat, 16 Nov 2019 13:58:00 -0800
In-Reply-To: <000000000000029056057cd141cb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d9f8a805977dce36@google.com>
Subject: Re: possible deadlock in neigh_change_state
From:   syzbot <syzbot+6a3c02010a025ac7b7cf@syzkaller.appspotmail.com>
To:     christian@brauner.io, corbet@lwn.net, davem@davemloft.net,
        dsahern@gmail.com, dvyukov@google.com, ebiggers@kernel.org,
        edumazet@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        roopa@cumulusnetworks.com, syzkaller-bugs@googlegroups.com,
        w.bumiller@proxmox.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

syzbot has bisected this bug to:

commit 58956317c8de52009d1a38a721474c24aef74fe7
Author: David Ahern <dsahern@gmail.com>
Date:   Fri Dec 7 20:24:57 2018 +0000

     neighbor: Improve garbage collection

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1328a1e2e00000
start commit:   addb0679 Merge git://git.kernel.org/pub/scm/linux/kernel/g..
git tree:       net-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=10a8a1e2e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1728a1e2e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9655b05acfc97ff
dashboard link: https://syzkaller.appspot.com/bug?extid=6a3c02010a025ac7b7cf
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13317705400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=177bb01b400000

Reported-by: syzbot+6a3c02010a025ac7b7cf@syzkaller.appspotmail.com
Fixes: 58956317c8de ("neighbor: Improve garbage collection")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
