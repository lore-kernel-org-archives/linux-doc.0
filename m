Return-Path: <SRS0=0k1m=44=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3D2C10DCE
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 00:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28103222C3
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 00:26:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgCKA0Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 20:26:16 -0400
Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149]:53877 "EHLO
        7.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbgCKA0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Mar 2020 20:26:16 -0400
X-Greylist: delayed 8400 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Mar 2020 20:26:16 EDT
Received: from player779.ha.ovh.net (unknown [10.108.54.209])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id 84EEB121685
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2020 22:58:51 +0100 (CET)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player779.ha.ovh.net (Postfix) with ESMTPSA id C61D8103FEFF3;
        Tue, 10 Mar 2020 21:58:38 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Andrii Nakryiko <andriin@fb.com>, bpf@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH v3] docs: sysctl/kernel: document BPF entries
Date:   Tue, 10 Mar 2020 22:58:24 +0100
Message-Id: <20200310215824.17139-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 980377346576829727
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddvtddgudegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Based on the implementation in kernel/bpf/syscall.c,
kernel/bpf/trampoline.c, include/linux/filter.h, and the documentation
in bpftool-prog.rst.

The section style doesn't match the surrounding sections; it matches
the style of the reworked kernel.rst queued up in docs-next.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---

Notes:
    Changes since v2:
    - fixed "will disabled" typo.
    
    Changes since v1:
    - rebased on bpf-next instead of docs-next.

 Documentation/admin-guide/sysctl/kernel.rst | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index def074807cee..9e1417628572 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -174,6 +174,20 @@ See the type_of_loader and ext_loader_ver fields in
 Documentation/x86/boot.rst for additional information.
 
 
+bpf_stats_enabled
+=================
+
+Controls whether the kernel should collect statistics on BPF programs
+(total time spent running, number of times run...). Enabling
+statistics causes a slight reduction in performance on each program
+run. The statistics can be seen using ``bpftool``.
+
+= ===================================
+0 Don't collect statistics (default).
+1 Collect statistics.
+= ===================================
+
+
 cap_last_cap:
 =============
 
@@ -1123,6 +1137,16 @@ NMI switch that most IA32 servers have fires unknown NMI up, for
 example.  If a system hangs up, try pressing the NMI switch.
 
 
+unprivileged_bpf_disabled
+=========================
+
+Writing 1 to this entry will disable unprivileged calls to ``bpf()``;
+once disabled, calling ``bpf()`` without ``CAP_SYS_ADMIN`` will return
+``-EPERM``.
+
+Once set, this can't be cleared.
+
+
 watchdog:
 =========
 

base-commit: 3e7c67d90e3ed2f34fce42699f11b150dd1d3999
-- 
2.20.1

