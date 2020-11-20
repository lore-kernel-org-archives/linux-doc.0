Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D89DC388F9
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 02:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A68022282
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 02:29:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bu8d/gMj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgKTC30 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 21:29:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:54124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgKTC30 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Nov 2020 21:29:26 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65EBD22267;
        Fri, 20 Nov 2020 02:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605839366;
        bh=9JxH8e7YLVklhPG6Wv15mVgocpFMCSL/Gtt44Ri448c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bu8d/gMjCaV3fjfKJfp0Q7aqlrEI3g4EqUGxb/FHSX/BhGUFe6NjgMvv59D/1RWUP
         tzAWUVaD5XcWr8ZTepZPuW+nnaaxtRQbD2cYHgWbiX3Ji3xrRovJVTfYj0cc4EO5Xm
         bSHsdJ41XbT+jhkAyafqEZd/8VauSmSSoin7qWjE=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Chen Yu <yu.c.chen@intel.com>, Chen Yu <yu.chen.surf@gmail.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 3/3] docs: bootconfig: Add the endianness of fields
Date:   Fri, 20 Nov 2020 11:29:22 +0900
Message-Id: <160583936246.547349.10964204130590955409.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <160583933538.547349.272918354455492444.stgit@devnote2>
References: <160583933538.547349.272918354455492444.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description about the endianness of the size and the checksum
fields. Those must be stored as le32 instead of u32. This will allow
us to apply bootconfig to the cross build initrd without caring
the endianness.

Reported-by: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 Documentation/admin-guide/bootconfig.rst |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
index 363599683784..9b90efcc3a35 100644
--- a/Documentation/admin-guide/bootconfig.rst
+++ b/Documentation/admin-guide/bootconfig.rst
@@ -140,7 +140,9 @@ Since the boot configuration file is loaded with initrd, it will be added
 to the end of the initrd (initramfs) image file with padding, size,
 checksum and 12-byte magic word as below.
 
-[initrd][bootconfig][padding][size(u32)][checksum(u32)][#BOOTCONFIG\n]
+[initrd][bootconfig][padding][size(le32)][checksum(le32)][#BOOTCONFIG\n]
+
+The size and checksum fields are unsigned 32bit little endian value.
 
 When the boot configuration is added to the initrd image, the total
 file size is aligned to 4 bytes. To fill the gap, null characters

