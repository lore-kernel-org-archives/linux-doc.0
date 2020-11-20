Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A53C388F9
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 02:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C08922282
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 02:29:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYGcanCN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgKTC3A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 21:29:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:53782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbgKTC27 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Nov 2020 21:28:59 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F1A422267;
        Fri, 20 Nov 2020 02:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605839339;
        bh=bu0f4nai4GWUco97RbnqLeOuE/BnaVOIzMAKOz8dcGo=;
        h=From:To:Cc:Subject:Date:From;
        b=eYGcanCN6Rgx2Aj8sMZejznt6Afjh4ySwDTIlhsYq6w+nSeHIkr2lN60FujjxhtPM
         gN3m/nhnz0xC0B0orVSSRrUiGB8y6tGjxnfLm5Wl2ae/+GUesHz0g7t3dMBjjct15R
         DuGmu8mr4nUww3U0UwRv1hBvdjz/yv3DMbFHi3h8=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Chen Yu <yu.c.chen@intel.com>, Chen Yu <yu.chen.surf@gmail.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 0/3] bootconfig: Make size and checksum fields le32
Date:   Fri, 20 Nov 2020 11:28:55 +0900
Message-Id: <160583933538.547349.272918354455492444.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

This is a series of patches to make the size and the checksum fields
in the footer le32 instead of u32.

In the thread for alignment series[1], Steve pointed that the current
footer format didn't specify the endianness thus it is hard to apply
the bootconfig for cross-build initrd if the target endianness is
different from the host machine.

I've proposed that the hexadecimal ASCII string in the previous series
[2] but Linus pointed that making it le32 was enough.

So this just make those fields le32.

Thank you,

[1] https://lore.kernel.org/lkml/20201118112249.30d20147@gandalf.local.home/
[2] https://lore.kernel.org/linux-doc/CAHk-=wi9RedSQoGF06dVs2mp7tBp4QoiW8+XZzNcDFJr3Zo5gg@mail.gmail.com/

---

Masami Hiramatsu (3):
      bootconfig: Load size and checksum in the footer as le32
      tools/bootconfig: Store size and checksum in footer as le32
      docs: bootconfig: Add the endianness of fields


 Documentation/admin-guide/bootconfig.rst |    4 +++-
 init/main.c                              |    4 ++--
 tools/bootconfig/main.c                  |    7 +++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

--
Masami Hiramatsu (Linaro) <mhiramat@kernel.org>
