Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF740C4320A
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 18:43:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DF9760F44
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 18:43:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243298AbhHZSn7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Aug 2021 14:43:59 -0400
Received: from smtprelay0028.hostedemail.com ([216.40.44.28]:45120 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S243288AbhHZSn7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Aug 2021 14:43:59 -0400
Received: from omf02.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id B1AA818043DA1;
        Thu, 26 Aug 2021 18:43:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf02.hostedemail.com (Postfix) with ESMTPA id 9E4991D42F9;
        Thu, 26 Aug 2021 18:43:09 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-scsi@vger.kernel.org, storagedev@microchip.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 0/5] vsprintf and uses: Add upper case output to %*ph extension
Date:   Thu, 26 Aug 2021 11:43:00 -0700
Message-Id: <cover.1630003183.git.joe@perches.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: 5qo1ggz7qwszc1wst9d448dq13egb5nf
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 9E4991D42F9
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18tDOuVkOskG6mYbV8tAOcLCqBs2xKzHBg=
X-HE-Tag: 1630003389-741109
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Several sysfs uses that could use %*ph are upper case hex output.
Add a flag to the short hex formatting routine in vsprintf to support them.
Add documentation too.

Joe Perches (5):
  vsprintf/Documentation: Add X to %*ph extension to output upper case hex
  scsi: aacraid: Use vsprintf %phNX extension
  scsi: hpsa: Use vsprintf %phNX extension
  scsi: smartpqi: Use vsprintf %phNX extension
  staging: r8188eu: Use vsprintf extension %phCX to format a copy_to_user string

 Documentation/core-api/printk-formats.rst    |  6 +++
 drivers/scsi/aacraid/linit.c                 |  7 +---
 drivers/scsi/hpsa.c                          |  8 +---
 drivers/scsi/smartpqi/smartpqi_init.c        |  8 +---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  9 ++---
 lib/vsprintf.c                               | 42 ++++++++++++--------
 6 files changed, 37 insertions(+), 43 deletions(-)

-- 
2.30.0

