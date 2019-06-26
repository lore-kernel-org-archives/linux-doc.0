Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 631C17D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 26 Jun 2019 17:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfFZRf5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 26 Jun 2019 13:35:57 -0400
Received: from ms.lwn.net ([45.79.88.28]:40904 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfFZRf4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Jun 2019 13:35:56 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 5D1554BF;
        Wed, 26 Jun 2019 17:29:10 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 0/4] docs: Automatically mark up function references
Date:   Wed, 26 Jun 2019 11:28:55 -0600
Message-Id: <20190626172859.16113-1-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For the record, I hope that this is the version I will actually merge.  It
adds an extension to automatically recognize references to functions and
create cross references for them, eliminating the need to use the unsightly
:c:func:``function`` notation.

Since v2 little has happened:
  - Expand the skip list of system-call names that we shouldn't even
    try to mark up.
  - Improve the comments in the extension code slightly
  - Add a paragraph to the doc-guide discouraging use of :c:func:

Jonathan Corbet (4):
  Docs: An initial automarkup extension for sphinx
  docs: remove :c:func: annotations from xarray.rst
  kernel-doc: Don't try to mark up function names
  docs: Note that :c:func: should no longer be used

 Documentation/conf.py              |   3 +-
 Documentation/core-api/xarray.rst  | 270 ++++++++++++++---------------
 Documentation/doc-guide/sphinx.rst |  13 +-
 Documentation/sphinx/automarkup.py |  93 ++++++++++
 scripts/kernel-doc                 |   2 +-
 5 files changed, 239 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/sphinx/automarkup.py

-- 
2.21.0

