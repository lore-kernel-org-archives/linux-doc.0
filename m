Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F615C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 14 Nov 2022 06:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235612AbiKNG2m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Nov 2022 01:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbiKNG2l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Nov 2022 01:28:41 -0500
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B81E0DF
        for <linux-doc@vger.kernel.org>; Sun, 13 Nov 2022 22:28:40 -0800 (PST)
Received: by mail-il1-f197.google.com with SMTP id o10-20020a056e02102a00b003006328df7bso8767423ilj.17
        for <linux-doc@vger.kernel.org>; Sun, 13 Nov 2022 22:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJiL9xWm5bLdKCJM8IsG/cInozUc08NmnAVMegAdjF4=;
        b=NPCl/IkroLi/mFKcL1+EPdJJwhE+tz/JJIPJ7/qlA8U9uV2b3Q0y4T2YXfUCnum0vi
         /Y4gXHXH7qCCYE+lzkgCj8WlMF0ss3w75jz+5t/LgAQ/tiwNXPT0U1jbkui8uTXPkT7l
         7Mwtg2nYa2aazBZfSc7NQpCqFC/EiwMnXZH7iUqoT4VuTIZ7KXbzDUwBL1iqYDgzzNMb
         GFMWAxicyJJX/jQHcL5PdnKuRqSVpJSQ+u+tIUH+z61/jZ/Jeiexa45QFk/oBOhYHfwq
         rJ16xy0jRSV7c2jmlEZME/XUOdFrGtL521brcswD0FNcV3JV9z10E7hVXVMEz1WHnv+I
         GMiQ==
X-Gm-Message-State: ANoB5pnbBlTWizRFKcgfxDEGQvRNFWecWlCb10+LTBAl0x7nJ6WjNhOt
        j+AUpoe/jj5DixVd+wNrWw6tf/lLTkNQDlCBvN0iissf55xD
X-Google-Smtp-Source: AA0mqf6SGWymgXRi0wgULQbn4id71HFLVMFJUJEe1jL5o23rWiN5E88SEiiieuXXf8Izh5Sv+MbwhlzvEfsg8qxdoOrSyxcTN1Ii
MIME-Version: 1.0
X-Received: by 2002:a92:c509:0:b0:300:e232:e0c3 with SMTP id
 r9-20020a92c509000000b00300e232e0c3mr5272436ilg.320.1668407319491; Sun, 13
 Nov 2022 22:28:39 -0800 (PST)
Date:   Sun, 13 Nov 2022 22:28:39 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009e9c8805ed685987@google.com>
Subject: [syzbot] WARNING in anon_vma_name
From:   syzbot <syzbot+62ed954113bf02c79f74@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, arnd@arndb.de, brauner@kernel.org,
        ccross@google.com, corbet@lwn.net, david@redhat.com,
        hannes@cmpxchg.org, hughd@google.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, pasha.tatashin@soleen.com,
        paul.gortmaker@windriver.com, peterx@redhat.com,
        shy828301@gmail.com, syzkaller-bugs@googlegroups.com,
        vbabka@suse.cz, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    f8f60f322f06 Add linux-next specific files for 20221111
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12f0f3fe880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85ba52c07cd97289
dashboard link: https://syzkaller.appspot.com/bug?extid=62ed954113bf02c79f74
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=171f6c49880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16fdfd99880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6008df424195/disk-f8f60f32.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/394340525f66/vmlinux-f8f60f32.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b13604a3343a/bzImage-f8f60f32.xz

The issue was bisected to:

commit 2220e3a8953e86b87adfc753fc57c2a5e0b0a032
Author: Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Mon Nov 7 18:47:15 2022 +0000

    mm: anonymous shared memory naming

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16d32f66880000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=15d32f66880000
console output: https://syzkaller.appspot.com/x/log.txt?x=11d32f66880000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+62ed954113bf02c79f74@syzkaller.appspotmail.com
Fixes: 2220e3a8953e ("mm: anonymous shared memory naming")

------------[ cut here ]------------
WARNING: CPU: 0 PID: 5239 at include/linux/mmap_lock.h:155 mmap_assert_locked include/linux/mmap_lock.h:155 [inline]
WARNING: CPU: 0 PID: 5239 at include/linux/mmap_lock.h:155 anon_vma_name+0x11c/0x170 mm/madvise.c:97
Modules linked in:
CPU: 1 PID: 5239 Comm: syz-executor276 Not tainted 6.1.0-rc4-next-20221111-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:mmap_assert_locked include/linux/mmap_lock.h:155 [inline]
RIP: 0010:anon_vma_name+0x11c/0x170 mm/madvise.c:97
Code: 8d bd 58 01 00 00 be ff ff ff ff e8 1e fc e0 07 31 ff 41 89 c4 89 c6 e8 c2 27 bc ff 45 85 e4 0f 85 5c ff ff ff e8 e4 2a bc ff <0f> 0b e9 50 ff ff ff e8 d8 2a bc ff 48 89 ef e8 00 e7 f2 ff 0f 0b
RSP: 0018:ffffc90003c7f810 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffffffff8b9ae000 RCX: 0000000000000000
RDX: ffff88801d5fba80 RSI: ffffffff81c0a28c RDI: 0000000000000005
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffffffff8b9ae008 R14: ffffffff8b9ae010 R15: 0000000000000000
FS:  0000555556387300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000061ba0c CR3: 000000007d6c4000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 show_map_vma+0x22d/0x620 fs/proc/task_mmu.c:297
 show_smap+0xe4/0x490 fs/proc/task_mmu.c:866
 traverse.part.0+0xcf/0x5f0 fs/seq_file.c:111
 traverse fs/seq_file.c:101 [inline]
 seq_read_iter+0x90f/0x1280 fs/seq_file.c:195
 seq_read+0x16d/0x210 fs/seq_file.c:162
 do_loop_readv_writev fs/read_write.c:756 [inline]
 do_loop_readv_writev fs/read_write.c:743 [inline]
 do_iter_read+0x4f8/0x750 fs/read_write.c:798
 vfs_readv+0xe5/0x150 fs/read_write.c:916
 do_preadv fs/read_write.c:1008 [inline]
 __do_sys_preadv fs/read_write.c:1058 [inline]
 __se_sys_preadv fs/read_write.c:1053 [inline]
 __x64_sys_preadv+0x22b/0x310 fs/read_write.c:1053
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f545e62b239
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffed9c02fe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f545e62b239
RDX: 0000000000000001 RSI: 00000000200006c0 RDI: 0000000000000003
RBP: 00007ffed9c02ff0 R08: 0000000000000000 R09: 65732f636f72702f
R10: 00000000fffffffe R11: 0000000000000246 R12: 00007f545e5ef120
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
