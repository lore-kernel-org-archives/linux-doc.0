Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19BEC433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 09:33:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96A3561103
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 09:33:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350144AbhDGJdU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 05:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234588AbhDGJdT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 05:33:19 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EF6C061761;
        Wed,  7 Apr 2021 02:22:06 -0700 (PDT)
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83] helo=truhe.fritz.box); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1lU4Np-0004en-6P; Wed, 07 Apr 2021 11:21:57 +0200
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 0/2] Add regression mailing list with basics for tracking
Date:   Wed,  7 Apr 2021 11:21:54 +0200
Message-Id: <cover.1617786974.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1617787326;a3c7d107;
X-HE-SMSGID: 1lU4Np-0004en-6P
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi! A mailing list for regressions was finally created as
regressions@lists.linux.dev (we dropped the linux- prefix as the term is already
in the domain name). Hence, add it to MAINTAINERS, as that where people will
look it up. I was a bit unsure how to actually do that, see the note in the
first patch of the series for details.

The second patch makes reporting-issues.rst mention the new list, so people CC
it. At the same time it also tells them to adds a special line to help with
manual or automatic tracking. This is not done yet, but I will work on this over
the next few months, so it seemed wise to add it right from the start. See the
patch for details and the comment in it for some things where some input from
others might be helpful.

@Jonathan: this hopefully is the last round of patches for reporting-issues.rst
for this cycle. Please let me known if you think the addition to the MAINTAINERS
file should better go through a different maintainer.

Ciao, Thorsten

Thorsten Leemhuis (2):
  MAINTAINERS: add regressions mailing list
  docs: reporting-issues: make everyone CC the regressions list

 .../admin-guide/reporting-issues.rst          | 64 +++++++++++++------
 MAINTAINERS                                   |  4 ++
 2 files changed, 48 insertions(+), 20 deletions(-)


base-commit: a4f413348f268c4313f58ca383173ee5986d968a
-- 
2.30.2

