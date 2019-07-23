Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 578807D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Jul 2019 13:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390218AbfGWNvn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Jul 2019 09:51:43 -0400
Received: from smtprelay0041.hostedemail.com ([216.40.44.41]:59677 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726527AbfGWNvm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Jul 2019 09:51:42 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 79AFF485C;
        Tue, 23 Jul 2019 13:51:41 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: tiger29_82ea9ecb2fe20
X-Filterd-Recvd-Size: 1297
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Tue, 23 Jul 2019 13:51:39 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, Stephen Kitt <steve@sk2.org>,
        Kees Cook <keescook@chromium.org>,
        Nitin Gote <nitin.r.gote@intel.com>, jannh@google.com,
        kernel-hardening@lists.openwall.com,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org
Subject: [PATCH V2 0/2] string: Add stracpy and stracpy_pad
Date:   Tue, 23 Jul 2019 06:51:35 -0700
Message-Id: <cover.1563889130.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add more string copy mechanisms to help avoid defects

Joe Perches (2):
  string: Add stracpy and stracpy_pad mechanisms
  kernel-doc: core-api: Include string.h into core-api

 Documentation/core-api/kernel-api.rst |  3 +++
 include/linux/string.h                | 50 +++++++++++++++++++++++++++++++++--
 lib/string.c                          | 10 ++++---
 3 files changed, 57 insertions(+), 6 deletions(-)

-- 
2.15.0

