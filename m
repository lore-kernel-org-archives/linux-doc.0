Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CBFA67D043
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 15:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751282AbeFDPtZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 11:49:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:55578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751266AbeFDPtY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Jun 2018 11:49:24 -0400
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1D2F2088F;
        Mon,  4 Jun 2018 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528127363;
        bh=MZkDM4Sir58IhHbQ2m4SQpBG2rCXqK+ktahtS7LyMVA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dclULVu1RoCNvFFCGxoy8NqTq4wIRGF1XtYFiXxzcdj6tRiKXE1Lz9xbJ+OxtSXQV
         Vd/dl6FxIlBd4wdjmtxc/Mo7KUVdm6iJD8Gy+xOx5g6Uf5EOnoc5uwH+v8L07Ur+rG
         Zi7mpVgvitABbXvRp3czu1Mk/sYephyA4x6jQft4=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [RFC PATCH -tip v5 01/27] Documentation/kprobes: Fix to remove remaining jprobe
Date:   Tue,  5 Jun 2018 00:49:00 +0900
Message-Id: <152812733994.10068.11973626561310254470.stgit@devbox>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <152812730943.10068.5166429445118734697.stgit@devbox>
References: <152812730943.10068.5166429445118734697.stgit@devbox>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove jps from the document, since jprobe is removed.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/kprobes.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kprobes.txt b/Documentation/kprobes.txt
index 22208bf2386d..5ae80baf3921 100644
--- a/Documentation/kprobes.txt
+++ b/Documentation/kprobes.txt
@@ -474,7 +474,7 @@ error occurs during registration, all probes in the array, up to
 the bad probe, are safely unregistered before the register_*probes
 function returns.
 
-- kps/rps/jps: an array of pointers to ``*probe`` data structures
+- kps/rps: an array of pointers to ``*probe`` data structures
 - num: the number of the array entries.
 
 .. note::

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
