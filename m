Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756F5C433E9
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 16:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B26C208CA
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 16:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="QqfpLKXB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgICQFv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:05:51 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:39284 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728468AbgICQFu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599149148; bh=6i0DqJnENQdGfDopdWnFNlTiBQ+JjTsPKfiNbua8tbc=;
        h=From:To:Cc:Subject:Date;
        b=QqfpLKXBoUsZCLGFmgV+dPdYE+48hklS+nEnbCdCB+PLNL9IbcBA3zyNw33ffVu6w
         Up4EpvVjzr1XAk/sKQ+32Cm5ae6Jybi60ZCg+2G/mjz/1VkwZ0okNqQqObghW8PYo2
         SwOrIaM6dpLWSZXEdCB76yVbSoyvR6jhWIda4IA4=
From:   Drew DeVault <sir@cmpwn.com>
To:     "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Drew DeVault <sir@cmpwn.com>
Subject: [PATCH v3 0/4] Improvements to submitting-patches.rst
Date:   Thu,  3 Sep 2020 12:05:41 -0400
Message-Id: <20200903160545.83185-1-sir@cmpwn.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for the feedback Jonathan! This one should be good to go.

- Fixes the allocation of header numbering removal between the patches
- Corrects the length of the --- under each header
- Adds DCO context to the new maintainer document
- Removes information about git request-pull

Drew DeVault (4):
  submitting-patches.rst: remove heading numbering
  Documentation/process: expand plain-text advice
  Documentation/maintainer: rehome sign-off process
  submitting-patches.rst: presume git will be used

 Documentation/maintainer/index.rst            |   1 +
 .../maintainer/modifying-patches.rst          |  50 ++++
 Documentation/process/email-clients.rst       |   5 +
 Documentation/process/submitting-patches.rst  | 257 ++++--------------
 4 files changed, 105 insertions(+), 208 deletions(-)
 create mode 100644 Documentation/maintainer/modifying-patches.rst

-- 
2.28.0

