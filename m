Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B005C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 08:05:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2178610EA
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 08:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbhJGIG6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Oct 2021 04:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240504AbhJGIG6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Oct 2021 04:06:58 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D158BC061746;
        Thu,  7 Oct 2021 01:05:04 -0700 (PDT)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1mYOOj-0004cv-Ue; Thu, 07 Oct 2021 10:05:02 +0200
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Prefer lore.kernel.org and explain Link: tags better
Date:   Thu,  7 Oct 2021 10:04:59 +0200
Message-Id: <cover.1633593385.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1633593904;7fc1a588;
X-HE-SMSGID: 1mYOOj-0004cv-Ue
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Lo! The regression tracking bot I'm working on can automatically mark an
entry as resolved, if the commit message of the fix uses a 'Link' tag to
the report.  Many developers already place them, but it afaics would
improve matters to make this more explicit. Especially as I had missed
the modified section myself at first, as I simply grepped for 'Link:'
and only found an explanation in configure-git.rst.

Konstantin after posting v1 suggested to use lore.kernel.org instead or
lkml.kernel.org, which made me add a patch to realize this everywhere in
the docs.

v2:
- slightly reword after suggestiones from Konstantin (thx!)
- make this a patch series with an preparatory patch that does
  s!lkml.kernel.org!lore.kernel.org! everywhere in the docs

v1: https://lore.kernel.org/r/7dff33afec555fed0bf033c910ca59f9f19f22f1.1633537634.git.linux@leemhuis.info/
- initial version

Ciao, Thorsten

Thorsten Leemhuis (2):
  docs: use the lore redirector everywhere
  docs: submitting-patches: make section about the Link: tag more
    explicit

 Documentation/asm-annotations.rst             |  2 +-
 .../kbuild/Kconfig.recursion-issue-02         |  2 +-
 Documentation/maintainer/pull-requests.rst    |  2 +-
 Documentation/networking/msg_zerocopy.rst     |  2 +-
 Documentation/process/maintainer-tip.rst      |  4 +--
 Documentation/process/submitting-patches.rst  | 34 ++++++++++++-------
 .../it_IT/process/submitting-patches.rst      |  4 +--
 .../zh_CN/maintainer/pull-requests.rst        |  2 +-
 .../zh_CN/process/submitting-patches.rst      |  4 +--
 .../zh_TW/process/submitting-patches.rst      |  4 +--
 Documentation/x86/entry_64.rst                |  2 +-
 Documentation/x86/orc-unwinder.rst            |  4 +--
 12 files changed, 38 insertions(+), 28 deletions(-)


base-commit: b19511926cb50d59c57189739d03c21df325710f
-- 
2.31.1

