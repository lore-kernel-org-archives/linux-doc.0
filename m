Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328C0C433E6
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 11:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4A7264DE1
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 11:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhBJL7Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Feb 2021 06:59:24 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:39675 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbhBJL5K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Feb 2021 06:57:10 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l9o6a-000859-Bz; Wed, 10 Feb 2021 11:56:24 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Alexey Budankov <alexey.budankov@linux.intel.com>,
        linux-doc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] doc/admin-guide: fix spelling mistake: "perfomance" -> "performance"
Date:   Wed, 10 Feb 2021 11:56:24 +0000
Message-Id: <20210210115624.53551-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the perf-security documentation. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/admin-guide/perf-security.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/perf-security.rst b/Documentation/admin-guide/perf-security.rst
index 904e4eb37f99..34aa334320ca 100644
--- a/Documentation/admin-guide/perf-security.rst
+++ b/Documentation/admin-guide/perf-security.rst
@@ -72,7 +72,7 @@ monitoring and observability operations, thus, bypass *scope* permissions
 checks in the kernel. CAP_PERFMON implements the principle of least
 privilege [13]_ (POSIX 1003.1e: 2.2.2.39) for performance monitoring and
 observability operations in the kernel and provides a secure approach to
-perfomance monitoring and observability in the system.
+performance monitoring and observability in the system.
 
 For backward compatibility reasons the access to perf_events monitoring and
 observability operations is also open for CAP_SYS_ADMIN privileged
-- 
2.30.0

