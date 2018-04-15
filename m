Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D12EE7E86A
	for <lwn-linux-doc@archive.lwn.net>; Sun, 15 Apr 2018 08:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751135AbeDOIHl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 15 Apr 2018 04:07:41 -0400
Received: from smtpbgbr2.qq.com ([54.207.22.56]:40678 "EHLO smtpbgbr2.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751113AbeDOIHk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 15 Apr 2018 04:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1523779647;
        bh=xg/EIm0JKKw6tdLhqDDUZ7aA5ZT8seKx41L6p9Fi2+g=;
        h=From:To:Subject:Date:Message-Id;
        b=qF6+EPFp4gpB3GiqPNX0QsoQAkeix8uGdhe7x63t/rtOl1BYK7rBSjza+ezclklHS
         PhoxxD7S+qZYiCMDE0u11aXUxr2vcikIkMTFZDIXbsTZ0QbBkvedqho29waZ9qPerW
         Ff0rI30HGd89QRp4ZibH67hfsNOu4qcT8f2GgFOA=
X-QQ-mid: esmtp15t1523779645t2slefje7
Received: from localhost.localdomain (unknown [114.244.137.159])
        by esmtp5.qq.com (ESMTP) with 
        id ; Sun, 15 Apr 2018 16:07:13 +0800 (CST)
X-QQ-SSF: 01000000000000F0FF2003000000000
X-QQ-FEAT: /A5Igf99+LSyVwyL7cCPVYNFllTHmlvuD86EFfwb4aWpYpQpxr/K1xWVPiSGS
        FpuRWF2qMHbbTh7DaJyeka3FKVm/urxE0vijF4gkr1erHrQy6wT676DCaG6+VFx6arXf7p4
        kMd1I81T9cNVSOhko/ZI0+paAmXdQVV4yhM3rpsJNgYu0bs295t6SeXXjiDPk29Brf82hKS
        QbqobbLmeRS/dWGEO7oCainGjPaarEzJXQyqihqHJG3scHRJCqbnq9gkcEm6aJHLA3Dpj1u
        L5lcgZI3P9aEmfHeKPFixxq6A=
X-QQ-GoodBg: 0
From:   Wang Sheng-Hui <shhuiw@foxmail.com>
To:     ast@kernel.org, daniel@iogearbox.net, corbet@lwn.net,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] filter.txt: update 'tools/net/' to 'tools/bpf/'
Date:   Sun, 15 Apr 2018 16:07:12 +0800
Message-Id: <20180415080712.2213-1-shhuiw@foxmail.com>
X-Mailer: git-send-email 2.11.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:foxmail.com:bgforeign:bgforeign3
X-QQ-Bgrelay: 1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The tools are located at tootls/bpf/ instead of tools/net/.
Update the filter.txt doc.

Signed-off-by: Wang Sheng-Hui <shhuiw@foxmail.com>
---
 Documentation/networking/filter.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/filter.txt b/Documentation/networking/filter.txt
index a4508ec1816b..fd55c7de9991 100644
--- a/Documentation/networking/filter.txt
+++ b/Documentation/networking/filter.txt
@@ -169,7 +169,7 @@ access to BPF code as well.
 BPF engine and instruction set
 ------------------------------
 
-Under tools/net/ there's a small helper tool called bpf_asm which can
+Under tools/bpf/ there's a small helper tool called bpf_asm which can
 be used to write low-level filters for example scenarios mentioned in the
 previous section. Asm-like syntax mentioned here has been implemented in
 bpf_asm and will be used for further explanations (instead of dealing with
@@ -359,7 +359,7 @@ $ ./bpf_asm -c foo
 In particular, as usage with xt_bpf or cls_bpf can result in more complex BPF
 filters that might not be obvious at first, it's good to test filters before
 attaching to a live system. For that purpose, there's a small tool called
-bpf_dbg under tools/net/ in the kernel source directory. This debugger allows
+bpf_dbg under tools/bpf/ in the kernel source directory. This debugger allows
 for testing BPF filters against given pcap files, single stepping through the
 BPF code on the pcap's packets and to do BPF machine register dumps.
 
@@ -483,7 +483,7 @@ Example output from dmesg:
 [ 3389.935851] JIT code: 00000030: 00 e8 28 94 ff e0 83 f8 01 75 07 b8 ff ff 00 00
 [ 3389.935852] JIT code: 00000040: eb 02 31 c0 c9 c3
 
-In the kernel source tree under tools/net/, there's bpf_jit_disasm for
+In the kernel source tree under tools/bpf/, there's bpf_jit_disasm for
 generating disassembly out of the kernel log's hexdump:
 
 # ./bpf_jit_disasm
-- 
2.11.0



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
