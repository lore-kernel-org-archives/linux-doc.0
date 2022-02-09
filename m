Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4462DC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Feb 2022 04:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245558AbiBIEH2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Feb 2022 23:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347732AbiBIEGS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 23:06:18 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBE5C061577;
        Tue,  8 Feb 2022 20:06:15 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 04ADD2028E; Wed,  9 Feb 2022 12:06:10 +0800 (AWST)
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     netdev@vger.kernel.org
Cc:     Matt Johnston <matt@codeconstruct.com.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-doc@vger.kernel.org
Subject: [PATCH net-next v2 0/5] MCTP tag control interface
Date:   Wed,  9 Feb 2022 12:05:52 +0800
Message-Id: <20220209040557.391197-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series implements a small interface for userspace-controlled
message tag allocation for the MCTP protocol. Rather than leaving the
kernel to allocate per-message tag values, userspace can explicitly
allocate (and release) message tags through two new ioctls:
SIOCMCTPALLOCTAG and SIOCMCTPDROPTAG.

In order to do this, we first introduce some minor changes to the tag
handling, including a couple of new tests for the route input paths.

As always, any comments/queries/etc are most welcome.

Cheers,


Jeremy
---

v2:
 - make mctp_lookup_prealloc_tag static
 - minor checkpatch formatting fixes

---

Jeremy Kerr (4):
  mctp: tests: Rename FL_T macro to FL_TO
  mctp: tests: Add key state tests
  mctp: Add helper for address match checking
  mctp: Allow keys matching any local address

Matt Johnston (1):
  mctp: Add SIOCMCTP{ALLOC,DROP}TAG ioctls for tag control

 Documentation/networking/mctp.rst |  48 ++++++++
 include/net/mctp.h                |  16 ++-
 include/trace/events/mctp.h       |   5 +-
 include/uapi/linux/mctp.h         |  18 +++
 net/mctp/af_mctp.c                | 189 ++++++++++++++++++++++++++----
 net/mctp/route.c                  | 124 ++++++++++++++------
 net/mctp/test/route-test.c        | 157 ++++++++++++++++++++++++-
 7 files changed, 489 insertions(+), 68 deletions(-)

-- 
2.34.1

