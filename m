Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAF0C64E75
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 14:32:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 485CB24698
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 14:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdZ3XcWO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgKSObh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:31:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:49798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727513AbgKSObh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Nov 2020 09:31:37 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DC7F24181;
        Thu, 19 Nov 2020 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605796297;
        bh=yLmGWtslaATkDUKppuDRrUUebo2kqyZbD0vXgVP3bh0=;
        h=From:To:Cc:Subject:Date:From;
        b=KdZ3XcWOCCCdpNsDroK2VNg+yE3iHI71L2y3oAKaXHrs/QitZuMQQi9fLEw1bSi9X
         LyzetDa1W0Npgc0LRlN/w/ySiBprotxhihJkYslfXKT670Sie+eK1RrixDmX4ftVFc
         83WSXcuc3XjnwnWuGujRyz4nR1n8zcbmPBk53yTE=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Chen Yu <yu.c.chen@intel.com>, Chen Yu <yu.chen.surf@gmail.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [RFC PATCH 0/3] bootconfig: Use hexadecimal ASCII string for size and checksum
Date:   Thu, 19 Nov 2020 23:31:32 +0900
Message-Id: <160579629161.503380.9118263439060046721.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

Here is a seires of patches to change the bootconfig footer format
to use 8-bytes hexadecimal ASCII string for size and checksum instead
of u32.

In the previous thread for alignment series[1], Steve pointed that
the current footer format makes it hard to apply the bootconfig for
cross-build initrd if the target endianness is different from the
host machine.

So, this changes the size and checksum format to 8-bytes hexadecimal
ASCII string as same as cpio. Since that is a string, we don't need
to care of the difference of the endianness anymore.

Thank you,

[1] https://lore.kernel.org/lkml/20201118112249.30d20147@gandalf.local.home/

---

Masami Hiramatsu (3):
      bootconfig: Use hexadecimal ASCII string for size and checksum
      tools/bootconfig: Use hexadecimal ASCII string for size and checksum
      docs: bootconfig: Use hexadecimal ASCII string for size and checksum


 Documentation/admin-guide/bootconfig.rst |    6 +++-
 init/main.c                              |   20 ++++++++++----
 tools/bootconfig/main.c                  |   43 +++++++++++++++++++-----------
 tools/bootconfig/test-bootconfig.sh      |    2 +
 4 files changed, 48 insertions(+), 23 deletions(-)

--
Masami Hiramatsu (Linaro) <mhiramat@kernel.org>
