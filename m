Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D314C7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Mar 2019 20:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfCDUuv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Mar 2019 15:50:51 -0500
Received: from 7.mo68.mail-out.ovh.net ([46.105.63.230]:51613 "EHLO
        7.mo68.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfCDUuv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Mar 2019 15:50:51 -0500
X-Greylist: delayed 602 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Mar 2019 15:50:50 EST
Received: from player758.ha.ovh.net (unknown [10.109.146.163])
        by mo68.mail-out.ovh.net (Postfix) with ESMTP id 4C14C1159EC
        for <linux-doc@vger.kernel.org>; Mon,  4 Mar 2019 21:32:08 +0100 (CET)
Received: from jwilk.net (ip-5-172-255-165.free.aero2.net.pl [5.172.255.165])
        (Authenticated sender: jwilk@jwilk.net)
        by player758.ha.ovh.net (Postfix) with ESMTPSA id EED963580F4F;
        Mon,  4 Mar 2019 20:32:01 +0000 (UTC)
From:   Jakub Wilk <jwilk@jwilk.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>
Subject: [PATCH 2/2] Documentation: seccomp: unify list indentation
Date:   Mon,  4 Mar 2019 21:31:52 +0100
Message-Id: <20190304203152.8236-2-jwilk@jwilk.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190304203152.8236-1-jwilk@jwilk.net>
References: <20190304203152.8236-1-jwilk@jwilk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10036271772506249100
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrfedugddufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use tabs to indent SECCOMP_RET_USER_NOTIF definition, for consistency
with other items in this list.

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 Documentation/userspace-api/seccomp_filter.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/seccomp_filter.rst b/Documentation/userspace-api/seccomp_filter.rst
index 0f09a63ea923..bd9165241b6c 100644
--- a/Documentation/userspace-api/seccomp_filter.rst
+++ b/Documentation/userspace-api/seccomp_filter.rst
@@ -123,9 +123,9 @@ In precedence order, they are:
 	to userland as the errno without executing the system call.
 
 ``SECCOMP_RET_USER_NOTIF``:
-    Results in a ``struct seccomp_notif`` message sent on the userspace
-    notification fd, if it is attached, or ``-ENOSYS`` if it is not. See below
-    on discussion of how to handle user notifications.
+	Results in a ``struct seccomp_notif`` message sent on the userspace
+	notification fd, if it is attached, or ``-ENOSYS`` if it is not. See
+	below on discussion of how to handle user notifications.
 
 ``SECCOMP_RET_TRACE``:
 	When returned, this value will cause the kernel to attempt to
-- 
2.20.1

