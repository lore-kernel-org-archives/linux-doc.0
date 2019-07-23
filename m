Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 523557D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Jul 2019 00:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730234AbfGWAiV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 20:38:21 -0400
Received: from smtprelay0131.hostedemail.com ([216.40.44.131]:53388 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728573AbfGWAiV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 20:38:21 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 5F00218029128;
        Tue, 23 Jul 2019 00:38:20 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wax36_2b6c9e6a2e81f
X-Filterd-Recvd-Size: 1295
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf13.hostedemail.com (Postfix) with ESMTPA;
        Tue, 23 Jul 2019 00:38:18 +0000 (UTC)
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
Subject: [PATCH 0/2] string: Add stracpy and stracpy_pad
Date:   Mon, 22 Jul 2019 17:38:14 -0700
Message-Id: <cover.1563841972.git.joe@perches.com>
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
 include/linux/string.h                | 46 +++++++++++++++++++++++++++++++++--
 lib/string.c                          | 10 +++++---
 3 files changed, 53 insertions(+), 6 deletions(-)

-- 
2.15.0

