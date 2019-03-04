Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6FB647D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Mar 2019 21:07:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfCDVHy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Mar 2019 16:07:54 -0500
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:48527 "EHLO
        7.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfCDVHx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Mar 2019 16:07:53 -0500
X-Greylist: delayed 2151 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Mar 2019 16:07:53 EST
Received: from player789.ha.ovh.net (unknown [10.109.160.62])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id AED1A186788
        for <linux-doc@vger.kernel.org>; Mon,  4 Mar 2019 21:32:00 +0100 (CET)
Received: from jwilk.net (ip-5-172-255-165.free.aero2.net.pl [5.172.255.165])
        (Authenticated sender: jwilk@jwilk.net)
        by player789.ha.ovh.net (Postfix) with ESMTPSA id E2A953462004;
        Mon,  4 Mar 2019 20:31:56 +0000 (UTC)
From:   Jakub Wilk <jwilk@jwilk.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>
Subject: [PATCH 1/2] Documentation: seccomp: fix reST markup
Date:   Mon,  4 Mar 2019 21:31:51 +0100
Message-Id: <20190304203152.8236-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10034019973716825996
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrfedugddufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 Documentation/userspace-api/seccomp_filter.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/seccomp_filter.rst b/Documentation/userspace-api/seccomp_filter.rst
index b1b846d8a094..0f09a63ea923 100644
--- a/Documentation/userspace-api/seccomp_filter.rst
+++ b/Documentation/userspace-api/seccomp_filter.rst
@@ -133,7 +133,7 @@ In precedence order, they are:
 	call.  If there is no tracer present, ``-ENOSYS`` is returned to
 	userland and the system call is not executed.
 
-	A tracer will be notified if it requests ``PTRACE_O_TRACESECCOM``P
+	A tracer will be notified if it requests ``PTRACE_O_TRACESECCOMP``
 	using ``ptrace(PTRACE_SETOPTIONS)``.  The tracer will be notified
 	of a ``PTRACE_EVENT_SECCOMP`` and the ``SECCOMP_RET_DATA`` portion of
 	the BPF program return value will be available to the tracer
-- 
2.20.1

