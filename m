Return-Path: <SRS0=MCi+=BN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6703C433E0
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 02:53:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3208206E6
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 02:53:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=vfemail.net header.i=@vfemail.net header.b="pMTkGRI4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgHCCxu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 2 Aug 2020 22:53:50 -0400
Received: from nl101-3.vfemail.net ([149.210.219.33]:20313 "EHLO
        nl101-3.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgHCCxu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 2 Aug 2020 22:53:50 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 Aug 2020 22:53:49 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:mime-version:content-type
        :content-transfer-encoding; s=2018; bh=08R9KsxFKpKXX1ubkuITdn0Va
        XztBOhySsMuSKH/UO4=; b=pMTkGRI4rTnt5KFjq6poid+bZHQzJJvnIwFTuIccs
        TdkfI/E2GGTc4mZZFvp1qZlize3YrmZ3XsT2w2Q3oXrX45ug7SRndCNfxuRI/T/W
        l6T+j1KG+ZVBx87GloDew4nPSYE1uKMqdq2IhfDz8vPvUzSDwXL7XcU0RTudBzsn
        lc=
Received: (qmail 82500 invoked from network); 3 Aug 2020 02:47:09 -0000
Received: by simscan 1.4.0 ppid: 82491, pid: 82498, t: 0.2482s
         scanners:none
Received: from unknown (HELO d3d3MTkyLnZmZW1haWwubmV0) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 3 Aug 2020 02:47:09 -0000
Date:   Sun, 2 Aug 2020 22:46:52 -0400
From:   David Niklas <Hgntkwis@vfemail.net>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net
Subject: Re: PROBLEM: Missing debug instructions when EIP is not present
Message-ID: <20200802224652.6be413fe@Phenom-II-x6.niklas.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

I tried categorizing under documentation, but there's only man-pages as
the component and my bug was closed as invalid.
I've updated the bugzilla link.

The file: Documentation/admin-guide/bug-hunting.rst
gives instructions on how to find the offending line of code using EIP.
My particular bug that I need to report doesn't have EIP listed -- at
least not by name. I tried to guess what EIP was in
my case "__schedule+0x29e/0x6c0" but that didn't produce any results in
gdb on my debug kernel.
I don't appear to have the referenced module type problem:
"[<ffffffff8802c8e9>] :jbd:log_wait_commit+0xa3/0xf5"

I'm totally new to kernel debugging so the documentation is really
important and I'm rather frustrated in even bothering to read it as it's
incomplete/unhelpful.

Here's the exact bug I'm trying to tackle.

[68812.480447] INFO: task CacheThread_Blo:9414 blocked for more than 480
seconds. [68812.480459]       Not tainted 4.14.184-nopreempt-AMDGPU-dav9
#1 [68812.480464] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message. [68812.480469] CacheThread_Blo D    0  9414   9082
0x00000080 [68812.480476] Call Trace:
[68812.480494]  __schedule+0x29e/0x6c0
[68812.480505]  schedule+0x32/0x80
[68812.480513]  schedule_preempt_disabled+0xa/0x10
[68812.480520]  __mutex_lock.isra.1+0x26b/0x4e0
[68812.480550]  ? do_journal_begin_r+0xbe/0x390 [reiserfs]
[68812.480570]  do_journal_begin_r+0xbe/0x390 [reiserfs]
[68812.480586]  ? __switch_to_asm+0x35/0x70
[68812.480588]  ? __switch_to_asm+0x41/0x70
[68812.480590]  ? __switch_to_asm+0x35/0x70
[68812.480592]  ? __switch_to_asm+0x41/0x70
[68812.480593]  ? __switch_to_asm+0x35/0x70
[68812.480595]  ? __switch_to_asm+0x41/0x70
[68812.480597]  ? __switch_to_asm+0x35/0x70
[68812.480601]  journal_begin+0x80/0x140 [reiserfs]
[68812.480606]  reiserfs_dirty_inode+0x3d/0xa0 [reiserfs]
[68812.480609]  ? __switch_to+0x1ee/0x3f0
[68812.480610]  ? __switch_to+0x1ee/0x3f0
[68812.480612]  __mark_inode_dirty+0x163/0x350
[68812.480615]  generic_update_time+0x79/0xc0
[68812.480617]  ? current_time+0x38/0x70
[68812.480619]  file_update_time+0xbe/0x110
[68812.480622]  __generic_file_write_iter+0x99/0x1b0
[68812.480624]  generic_file_write_iter+0xe2/0x1c0
[68812.480626]  __vfs_write+0x102/0x180
[68812.480628]  vfs_write+0xb0/0x190
[68812.480630]  SyS_pwrite64+0x90/0xb0
[68812.480632]  do_syscall_64+0x6e/0x110
[68812.480634]  entry_SYSCALL_64_after_hwframe+0x41/0xa6
[68812.480637] RIP: 0033:0x7f8a92976983
[68812.480638] RSP: 002b:00007f8a779e1630 EFLAGS: 00000293 ORIG_RAX:
0000000000000012 [68812.480640] RAX: ffffffffffffffda RBX:
00007f8a779e1640 RCX: 00007f8a92976983 [68812.480641] RDX:
0000000000000128 RSI: 000001790ddf3c00 RDI: 0000000000000040
[68812.480642] RBP: 00007f8a779e16f0 R08: 00007f8a779e1558 R09:
0000000000000001 [68812.480643] R10: 0000000000002000 R11:
0000000000000293 R12: 0000000000002000 [68812.480644] R13:
000001790a6b8dd0 R14: 000001790ddf3c00 R15: 0000000000000128
[68812.480647] INFO: task ThreadPoolSingl:9908 blocked for more than 480
seconds.

4.14.184

https://bugzilla.kernel.org/show_bug.cgi?id=208777

Thanks,
David

