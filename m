Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6894AC388F7
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 15:30:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DED722226
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 15:30:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbgKCPaI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Nov 2020 10:30:08 -0500
Received: from ms.lwn.net ([45.79.88.28]:46094 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728750AbgKCPaH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Nov 2020 10:30:07 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 09910384;
        Tue,  3 Nov 2020 15:30:06 +0000 (UTC)
Date:   Tue, 3 Nov 2020 08:30:06 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation fixes for 5.10-rc3
Message-ID: <20201103083006.06d519fc@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following changes since commit
3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-5.10-3

for you to fetch changes up to 4f3e69060dc9cc8f14ad9e172ada7120dc76445b:

  docs: fix automarkup regression on Python 2 (2020-11-03 08:22:00 -0700)

----------------------------------------------------------------
A small number of fixes, plus a build tweak to respect the desire for
silence in V=0 builds.

----------------------------------------------------------------
Jonathan Corbet (1):
      docs: fix automarkup regression on Python 2

Mauro Carvalho Chehab (3):
      docs: Makefile: honor V=0 for docs building
      scripts: kernel-doc: fix typedef parsing
      scripts: kernel-doc: split typedef complex regex

Wilken Gottwalt (1):
      documentation: arm: sunxi: add Allwinner H6 documents

 Documentation/Makefile             |  4 ++++
 Documentation/arm/sunxi.rst        | 10 ++++++++++
 Documentation/sphinx/automarkup.py | 20 ++++++++++++++------
 scripts/kernel-doc                 | 15 ++++++++++-----
 4 files changed, 38 insertions(+), 11 deletions(-)
