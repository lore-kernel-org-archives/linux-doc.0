Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A32C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 14:55:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E23B610D1
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 14:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234643AbhINO4t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 10:56:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:45176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234453AbhINO4q (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Sep 2021 10:56:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C57F6115C;
        Tue, 14 Sep 2021 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631631328;
        bh=xRVCMucWENyWJ8E3yBpWzpx2vDi17bpiM+vX/mpE3NI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SDFa81vOiRFuz4swGyRPwQytTMR44L4MVsr3pgAMO69b2VEjNxvh/VSNu2QjFBeNK
         Bp63fS7AFqKIYvHi1C5mbK2ahOcsWQSaOrl9M03yUXPWNSjVxkbrgsezXPnfboIcXp
         d/saDrCrr25OnAA+bJfvFFDF227tX4WiIDAzr8/pkv+pQja9JVeZ7TZ9YgQgnlzEZ0
         r7lX3/GdjEiUUyXZjrDFStCi+iEVEgqIN8dm8W+viaO4XD+BStEncZsdRCL3yPjbR7
         6h91yYFbEYrPvp0BiJjOFwnRdKYMZv9NVWS0XyJxXI5ksH4iTV2O0/1UUaNVMuBdIa
         LFDxfTCHQffUw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQ9qI-000L79-SF; Tue, 14 Sep 2021 16:55:26 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] ABI: o2cb: add an obsolete file for /sys/o2cb
Date:   Tue, 14 Sep 2021 16:55:20 +0200
Message-Id: <6e78d89d722141ccfddaf7ed863cbb0338d300c2.1631630792.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631630792.git.mchehab+huawei@kernel.org>
References: <cover.1631630792.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This was renamed to /sys/fs/o2cb. Mark the old name as
obsolete.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/obsolete/o2cb | 11 +++++++++++
 Documentation/ABI/stable/o2cb   |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/obsolete/o2cb

diff --git a/Documentation/ABI/obsolete/o2cb b/Documentation/ABI/obsolete/o2cb
new file mode 100644
index 000000000000..fe7e45e17bc7
--- /dev/null
+++ b/Documentation/ABI/obsolete/o2cb
@@ -0,0 +1,11 @@
+What:		/sys/o2cb
+Date:		Dec 2005
+KernelVersion:	2.6.16
+Contact:	ocfs2-devel@oss.oracle.com
+Description:	Ocfs2-tools looks at 'interface-revision' for versioning
+		information. Each logmask/ file controls a set of debug prints
+		and can be written into with the strings "allow", "deny", or
+		"off". Reading the file returns the current state.
+		Was renamed to /sys/fs/u2cb/
+Users:		ocfs2-tools. It's sufficient to mail proposed changes to
+		ocfs2-devel@oss.oracle.com.
diff --git a/Documentation/ABI/stable/o2cb b/Documentation/ABI/stable/o2cb
index 5eb1545e0b8d..b62a967f01a0 100644
--- a/Documentation/ABI/stable/o2cb
+++ b/Documentation/ABI/stable/o2cb
@@ -1,4 +1,4 @@
-What:		/sys/fs/o2cb/ (was /sys/o2cb)
+What:		/sys/fs/o2cb/
 Date:		Dec 2005
 KernelVersion:	2.6.16
 Contact:	ocfs2-devel@oss.oracle.com
-- 
2.31.1

