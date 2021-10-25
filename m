Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27E5C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Oct 2021 09:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6FDA60FBF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Oct 2021 09:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbhJYJJA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Oct 2021 05:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbhJYJJA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Oct 2021 05:09:00 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34869C061764;
        Mon, 25 Oct 2021 02:06:38 -0700 (PDT)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1mevwB-0005ei-IU; Mon, 25 Oct 2021 11:06:35 +0200
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] docs: improve when and how to use Link: tags
Date:   Mon, 25 Oct 2021 11:06:34 +0200
Message-Id: <cover.1635152553.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1635152798;d914673d;
X-HE-SMSGID: 1mevwB-0005ei-IU
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Lo! The regression tracking bot I'm working on can automatically mark an
entry as resolved, if the commit message of the fix uses a 'Link' tag to
the report.  Many developers already place them, but it afaics would
improve matters to make this more explicit. Especially as I had trouble
finding the explanation myself at first, as I simply grepped for 'Link:'
and only found an explanation in configure-git.rst. But that only covers
how maintainers should use it to make git automatically add links to the
patch review in the archives.

v3:
- drop the first patch (merged)
- slightly improve the text again due to the questions raised during the
  review (that's also why I didn't pick up Konstantin's 'reviewed-by' on
  v2) and something Linus meanwhile said coincidentally

v2: https://lore.kernel.org/r/cover.1633593385.git.linux@leemhuis.info/
- slightly reword after suggestiones from Konstantin (thx!)
- make this a patch series with an preparatory patch that does
  s!lkml.kernel.org!lore.kernel.org! everywhere in the docs

v1: https://lore.kernel.org/r/7dff33afec555fed0bf033c910ca59f9f19f22f1.1633537634.git.linux@leemhuis.info/
- initial version

Thorsten Leemhuis (1):
  docs: submitting-patches: make section about the Link: tag more
    explicit

 Documentation/process/submitting-patches.rst | 33 +++++++++++++-------
 1 file changed, 22 insertions(+), 11 deletions(-)


base-commit: 2df9f7f57905e61cf638284bf86af30f7849ed6b
-- 
2.31.1

