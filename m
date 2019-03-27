Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NORMAL_HTTP_TO_IP,RCVD_IN_DNSWL_HI,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 16C897D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Mar 2019 13:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbfC0NCJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Mar 2019 09:02:09 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:48524 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725829AbfC0NCJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Mar 2019 09:02:09 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04391;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0TNmcUk0_1553691723;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TNmcUk0_1553691723)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 27 Mar 2019 21:02:04 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     alex.shi@linux.alibaba.com, harryxiyou@gmail.com, corbet@lwn.net,
        leoyang.li@nxp.com, linux-doc@vger.kernel.org
Subject: [PATCH 00/42] Chinese doc translation series 2
Date:   Wed, 27 Mar 2019 21:01:06 +0800
Message-Id: <20190327130148.3258-1-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series add a few new docs in Chinese, updated 
submitting-patches and howtod docs, All docs rebased on Jon's
docs-next branch.

	make htmldocs result show at:
	http://176.122.172.82/translations/zh_CN/index.html

Comments are appreciated!

Cheers!
Alex
---
Alex Shi (42):
  docs/zh_CN: translate development-process into Chinese
  docs/zh_CN: add disclaimer and translator info in development-process
  docs/zh_CN: link development-process into process index
  docs/zh_CN: add Chinese 1.Intro file
  docs/zh_CN: add disclaimer and translator info into 1.Intro
  docs/zh_CN: add 2.Process.rst for development-process
  docs/zh_CN: add disclaimer and translator info in 2.Process
  docs/zh_CN: translate 3.Early-stage of development process
  docs/zh_CN: add disclaimer/translator info in 3.Early-stage
  docs/zh_CN: add 4.Coding.rst
  docs/zh_CN: add disclaimer and translator info in 4.Coding
  docs/zh_CN: add 5.Posting.rst into development-process
  docs/zh_CN: add disclaimer and translator info in 5.Posting
  docs/zh_CN: add the 6th doc 6.Followthrought.rst
  docs/zh_CN: add disclaimer and translator info in 6.Followthrough
  docs/zh_CN: translate 7.AdvanceTopics.rst
  docs/zh_CN: add disclaimer and translator info in 7.Advancedtopics
  docs/zh_CN: add 8.Conclusion.rst in development-process
  docs/zh_CN: add disclaimer and translator info in 8.Conclusion
  docs/zh_CN: add license-rules Chinese translation
  docs/zh_CN: fix links failure in license-rules
  docs/zh_CN: include Chinese translation header for license-rules
  docs/zh_CN: link the license-rules file into process index
  docs/zh_CN: add submit-checklist file
  docs/zh_CN: add disclaimer and transtlator info in submit-checklist
  docs/zh_CN: link the submit-checklist into process/index
  docs/zh_CN: add CoC doc
  docs/zh_CN: add disclaimer and translator info in CoC
  docs/zh_CN: link the CoC into process/index
  docs/zh_CN: add CoC interpretation
  docs/zh_CN: add disclaim and translator into CoC interp
  docs/zh_CN: link CoC interpretation into index
  docs/zh_CN: fix link issue in howto.rst
  docs/zh_CN: update howto.rst to latest version
  docs/zh_CN: update translator info and comments in howto
  docs/zh_CN: redirect license-rules to Chinese doc
  docs/zh_CN: redirect howto.rst link to Chinese version
  docs/zh_CN: update to latest submitting-patches.rst
  docs/zh_CN: update translator info in submitting-patches
  docs/zh_CN: redirect the submitting-patches to Chinese doc
  docs/zh_CN: redirect submit-checklist
  docs/zh_CN: update co-developed-by info after English version

 .../translations/zh_CN/process/1.Intro.rst    | 186 +++++
 .../translations/zh_CN/process/2.Process.rst  | 360 ++++++++++
 .../zh_CN/process/3.Early-stage.rst           | 161 +++++
 .../translations/zh_CN/process/4.Coding.rst   | 290 ++++++++
 .../translations/zh_CN/process/5.Posting.rst  | 240 +++++++
 .../zh_CN/process/6.Followthrough.rst         | 145 ++++
 .../zh_CN/process/7.AdvancedTopics.rst        | 124 ++++
 .../zh_CN/process/8.Conclusion.rst            |  64 ++
 .../code-of-conduct-interpretation.rst        | 108 +++
 .../zh_CN/process/code-of-conduct.rst         |  72 ++
 .../zh_CN/process/development-process.rst     |  26 +
 .../translations/zh_CN/process/howto.rst      | 199 ++----
 .../translations/zh_CN/process/index.rst      |   5 +
 .../zh_CN/process/license-rules.rst           | 370 ++++++++++
 .../zh_CN/process/stable-kernel-rules.rst     |   2 +-
 .../zh_CN/process/submit-checklist.rst        | 107 +++
 .../zh_CN/process/submitting-drivers.rst      |   2 +-
 .../zh_CN/process/submitting-patches.rst      | 650 +++++++++++++-----
 18 files changed, 2795 insertions(+), 316 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/1.Intro.rst
 create mode 100644 Documentation/translations/zh_CN/process/2.Process.rst
 create mode 100644 Documentation/translations/zh_CN/process/3.Early-stage.rst
 create mode 100644 Documentation/translations/zh_CN/process/4.Coding.rst
 create mode 100644 Documentation/translations/zh_CN/process/5.Posting.rst
 create mode 100644 Documentation/translations/zh_CN/process/6.Followthrough.rst
 create mode 100644 Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
 create mode 100644 Documentation/translations/zh_CN/process/8.Conclusion.rst
 create mode 100644 Documentation/translations/zh_CN/process/code-of-conduct-interpretation.rst
 create mode 100644 Documentation/translations/zh_CN/process/code-of-conduct.rst
 create mode 100644 Documentation/translations/zh_CN/process/development-process.rst
 create mode 100644 Documentation/translations/zh_CN/process/license-rules.rst
 create mode 100644 Documentation/translations/zh_CN/process/submit-checklist.rst

-- 
2.19.1.856.g8858448bb

