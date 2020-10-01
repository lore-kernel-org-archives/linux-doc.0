Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E7DC4727C
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 10:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1671820B1F
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 10:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731647AbgJAKrk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 06:47:40 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:34193 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731131AbgJAKrk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 06:47:40 -0400
Received: (qmail 26659 invoked by uid 484); 1 Oct 2020 10:47:38 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.44 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.089011 secs); 01 Oct 2020 10:47:38 -0000
Received: from unknown (HELO ingpc2.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <corbet@lwn.net>; 1 Oct 2020 10:47:37 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 0/1] docs: process: Submitting a patch for a single git commit.
Date:   Thu,  1 Oct 2020 12:47:23 +0200
Message-Id: <20201001104724.3876-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When I tried to submit a patch to the Linux Kernel source code
one year ago, I needed a short explanation how to submit the patch.

The code modification was already written and tested, but I did 
not know the mechanics how to submit the code modification.

I found out that "submitting-patches" unfortunately does not
tell you how to submit a patch; especially not how to submit
a minor bug-fix.

Here is a short primer trying to alleviate this particular
use case.

Ingo Rohloff (1):
  docs: process: Submitting a patch for a single git commit.

 Documentation/process/submitting-patches.rst | 72 ++++++++++++++++++++
 1 file changed, 72 insertions(+)

-- 
2.17.1

