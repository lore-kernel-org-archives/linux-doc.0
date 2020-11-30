Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2706C64E8A
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 16:10:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7234420665
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 16:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728619AbgK3QKN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 11:10:13 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:54832 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgK3QKN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 11:10:13 -0500
Received: by mail-io1-f72.google.com with SMTP id m3so7608387iok.21
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 08:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=JEM1Q+fPylejK956r/1g6x98BapLMz2U230V1cVbRYo=;
        b=cXBEhx/EiQzKCR19/As0Mr50cKU+LrAHnnY6VjAAs1+S6A5hpQ6ew39LKqwUzhy8mz
         5+IoVm3TjYu0SEAwTlXUkVhG7wBfklgsvCah5eTCeiq2lNfr+twm2/p3DMGTP7J1cagw
         4upXCJAFQuy7FH3eBFFcsKvrl4xPpeWrPh2ywRL8WRgYNbUorAl4kLQu+ZDhKnLb0H6n
         mzj0yOlPqt3eQaM0HPCZAfSAPSAivabHSU8NdnlNEk+zNCrrneU3PStdGKRVzkSt5rlB
         MEjPE2hqicuj4ky3ULgOrKwel2gtX/Xn9SsPqwtjYImF5tfvAFjpWVwvbURKOKkMOCh/
         YWww==
X-Gm-Message-State: AOAM533ofp2Vy+x1O7bYa29vsVOZIQSAiUxzW6w5m+qtkRbaOBqOTabA
        maX/oA+2vVmxaYfm272eVS5Ymwp7CU1aiI4U+WokF083Q4BA
X-Google-Smtp-Source: ABdhPJyacoQ0MsNytyApl+uu7UDTpCTIIGXVwWqLth17j6D2wgl55EQNneJR7M/E9S8OOriKx7hHzD24rweoMtsZkDmO4auYF4O2
MIME-Version: 1.0
X-Received: by 2002:a92:6512:: with SMTP id z18mr18870577ilb.220.1606752565812;
 Mon, 30 Nov 2020 08:09:25 -0800 (PST)
Date:   Mon, 30 Nov 2020 08:09:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ed639f05b5553b4a@google.com>
Subject: KASAN: stack-out-of-bounds Write in bitmap_from_arr32
From:   syzbot <syzbot+9d39fa49d4df294aab93@syzkaller.appspotmail.com>
To:     andrew@lunn.ch, corbet@lwn.net, dan.carpenter@oracle.com,
        davem@davemloft.net, f.fainelli@gmail.com, kuba@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mkubecek@suse.cz, netdev@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    594e31bc Merge branch '40GbE' of git://git.kernel.org/pub/..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=179b8349500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df65150a33f23d8c
dashboard link: https://syzkaller.appspot.com/bug?extid=9d39fa49d4df294aab93
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11dc60c9500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e130a5500000

The issue was bisected to:

commit 0980bfcd6954f124e40a000b85335c197764de14
Author: Michal Kubecek <mkubecek@suse.cz>
Date:   Thu Mar 12 20:07:58 2020 +0000

    ethtool: set netdev features with FEATURES_SET request

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=116dec63500000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=136dec63500000
console output: https://syzkaller.appspot.com/x/log.txt?x=156dec63500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9d39fa49d4df294aab93@syzkaller.appspotmail.com
Fixes: 0980bfcd6954 ("ethtool: set netdev features with FEATURES_SET request")

==================================================================
BUG: KASAN: stack-out-of-bounds in bitmap_from_arr32+0x199/0x1f0 lib/bitmap.c:1278
Write of size 8 at addr ffffc9000151f5b0 by task syz-executor624/8469

CPU: 0 PID: 8469 Comm: syz-executor624 Not tainted 5.10.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x4c8 mm/kasan/report.c:385
 __kasan_report mm/kasan/report.c:545 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:562
 bitmap_from_arr32+0x199/0x1f0 lib/bitmap.c:1278
 ethnl_parse_bitset+0x448/0x7a0 net/ethtool/bitset.c:631
 ethnl_set_features+0x2ac/0xa70 net/ethtool/features.c:240
 genl_family_rcv_msg_doit+0x228/0x320 net/netlink/genetlink.c:739
 genl_family_rcv_msg net/netlink/genetlink.c:783 [inline]
 genl_rcv_msg+0x328/0x580 net/netlink/genetlink.c:800
 netlink_rcv_skb+0x153/0x420 net/netlink/af_netlink.c:2494
 genl_rcv+0x24/0x40 net/netlink/genetlink.c:811
 netlink_unicast_kernel net/netlink/af_netlink.c:1304 [inline]
 netlink_unicast+0x533/0x7d0 net/netlink/af_netlink.c:1330
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec net/socket.c:651 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:671
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2331
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2385
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2418
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x440899
Code: 18 89 d0 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 5b 11 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffe5de83088 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 0000000000440899
RDX: 0000000000000000 RSI: 0000000020000440 RDI: 0000000000000003
RBP: 00000000006cb018 R08: 0000000000000000 R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000401e80
R13: 0000000000401f10 R14: 0000000000000000 R15: 0000000000000000


addr ffffc9000151f5b0 is located in stack of task syz-executor624/8469 at offset 264 in frame:
 ethnl_set_features+0x0/0xa70 net/ethtool/features.c:58

this frame has 9 objects:
 [32, 40) 'reply_payload'
 [64, 80) 'req_info'
 [96, 104) 'wanted_diff_mask'
 [128, 136) 'active_diff_mask'
 [160, 168) 'old_active'
 [192, 200) 'old_wanted'
 [224, 232) 'new_active'
 [256, 264) 'req_wanted'
 [288, 296) 'req_mask'

Memory state around the buggy address:
 ffffc9000151f480: 00 00 00 00 00 f1 f1 f1 f1 00 f2 f2 f2 00 00 f2
 ffffc9000151f500: f2 00 f2 f2 f2 00 f2 f2 f2 00 f2 f2 f2 00 f2 f2
>ffffc9000151f580: f2 00 f2 f2 f2 00 f2 f2 f2 00 f3 f3 f3 00 00 00
                                     ^
 ffffc9000151f600: 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1 f1 f1
 ffffc9000151f680: 00 00 00 00 00 00 00 00 00 f3 f3 f3 f3 f3 00 00
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
