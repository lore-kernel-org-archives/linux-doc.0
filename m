Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4640C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 16:41:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiJMQlJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 12:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiJMQlI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 12:41:08 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791B86DAE8;
        Thu, 13 Oct 2022 09:41:07 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 13E8E7F9;
        Thu, 13 Oct 2022 16:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 13E8E7F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1665679267; bh=p7oHxdMxjg9wtFNON7uRZs688rxdjk8LL+BQ6EuZ3oE=;
        h=From:To:Cc:Subject:Date:From;
        b=D5vgJpN7CZDe4cc/xn0hSg3gW0ibBcoKhydVDEtfJAcAV6nPMwDSiFUCRAXGeN37s
         DQjh8/aWiTxo840iw+CZ1yXbeICnee2sRv1A0YQGXyqf++oE1V3cIgdf377/pShtds
         wSGVDof5scawrCtLMpAFyl7TdBaB93ZE/gwzEG+gzX6roLdCAgNzE9VPL3v5EKAc3n
         oHnXfL8pNhyMHpiuW+4VlzhICb06lNRpY9Ipbe6O3XFtUcTlUKxa5aAwdTalJDTo3r
         p0Ueq12AEexBVKdR6L7ib8ycTC3WW8EvCelKdjHPKGPQrYPbtXrf69q8TFPz6bHXqX
         fT7uwc1s7VeOg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation fixes
Date:   Thu, 13 Oct 2022 10:41:06 -0600
Message-ID: <87pmevism5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following changes since commit 69d517e6e21099f81efbd39e47874649ae575804:

  checkpatch: warn on usage of VM_BUG_ON() and other BUG variants (2022-09-29 13:20:53 -0600)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-6.1-2

for you to fetch changes up to 877d95dcfd0a56102d4b97a9691115f5fb5e9ea3:

  Documentation: rtla: Correct command line example (2022-10-13 10:37:13 -0600)

----------------------------------------------------------------
A handful of relatively simple documentation fixes, plus a set of patches
catching the Chinese translation up with the front-page rework.

----------------------------------------------------------------
Akira Yokosawa (1):
      docs/howto: Replace abundoned URL of gmane.org

Joel Stanley (1):
      Documentation: ubifs: Fix compression idiom

Leo Yan (1):
      docs: ftrace: Correct access mode

Pierre Gondois (1):
      Documentation: rtla: Correct command line example

Wu XiangCheng (4):
      docs/zh_CN: promote the title of zh_CN/process/index.rst
      docs/zh_CN: add zh_CN/arch.rst
      docs/zh_CN: Rewrite the Chinese translation front page
      docs/zh_CN: add a man-pages link to zh_CN/index.rst

Yanteng Si (3):
      docs/zh_CN: Fix build warning
      docs/zh_CN: Update the translation of ksm to 6.0-rc7
      docs/zh_CN: Update the translation of page_owner to 6.0-rc7

Yixuan Cao (1):
      Documentation/mm/page_owner.rst: delete frequently changing experimental data

 Documentation/filesystems/ubifs.rst                |   2 +-
 Documentation/mm/page_owner.rst                    |  20 +--
 Documentation/process/howto.rst                    |   2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst     |   2 +-
 Documentation/trace/ftrace.rst                     |   2 +-
 Documentation/translations/it_IT/process/howto.rst |   2 +-
 Documentation/translations/ja_JP/howto.rst         |   2 +-
 Documentation/translations/ko_KR/howto.rst         |   2 +-
 Documentation/translations/zh_CN/arch.rst          |  29 ++++
 .../translations/zh_CN/devicetree/changesets.rst   |   2 +-
 .../zh_CN/devicetree/dynamic-resolution-notes.rst  |   2 +-
 .../translations/zh_CN/devicetree/kernel-api.rst   |   2 +-
 .../zh_CN/devicetree/overlay-notes.rst             |   2 +-
 Documentation/translations/zh_CN/index.rst         | 169 +++++++--------------
 Documentation/translations/zh_CN/mm/ksm.rst        |   2 +-
 Documentation/translations/zh_CN/mm/page_owner.rst |  10 +-
 Documentation/translations/zh_CN/process/howto.rst |   2 +-
 Documentation/translations/zh_CN/process/index.rst |   1 +
 Documentation/translations/zh_TW/process/howto.rst |   2 +-
 19 files changed, 107 insertions(+), 150 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/arch.rst
