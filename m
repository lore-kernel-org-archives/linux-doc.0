Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 397697D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 27 May 2019 22:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfE0W1E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 27 May 2019 18:27:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:58672 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbfE0W1E (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 May 2019 18:27:04 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 10D6A6A2;
        Mon, 27 May 2019 22:27:04 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/7] The eternal battle against docs-build warnings
Date:   Mon, 27 May 2019 16:26:51 -0600
Message-Id: <20190527222658.27304-1-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Here's a collection of trivial changes meant to eliminate a number of
"no structured comments found" warnings - plus a kernel-doc tweak to
make those problems easier to track down.

Jonathan Corbet (7):
  docs: Do not seek comments in kernel/rcu/tree_plugin.h
  docs: Fix a misdirected kerneldoc directive
  docs: Do not seek kerneldoc comments in hw-consumer.h
  docs: No structured comments in target_core_device.c
  docs: no structured comments in fs/file_table.c
  docs: No structured comments in include/linux/interconnect.h
  kernel-doc: always name missing kerneldoc sections

 Documentation/core-api/kernel-api.rst            |  2 --
 Documentation/driver-api/basics.rst              |  3 ---
 .../driver-api/firmware/other_interfaces.rst     |  2 +-
 Documentation/driver-api/iio/hw-consumer.rst     |  1 -
 Documentation/driver-api/target.rst              |  4 ++--
 Documentation/filesystems/api-summary.rst        |  3 ---
 Documentation/interconnect/interconnect.rst      |  5 ++---
 scripts/kernel-doc                               | 16 +++++++++-------
 8 files changed, 14 insertions(+), 22 deletions(-)

-- 
2.21.0

