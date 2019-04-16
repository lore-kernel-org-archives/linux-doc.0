Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EB6A47D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 14:26:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfDPO0y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 10:26:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:33874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726215AbfDPO0y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Apr 2019 10:26:54 -0400
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65EC320693;
        Tue, 16 Apr 2019 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555424813;
        bh=SW+knCHMKnNsSOhDX+aycQOVRyyXv6exYV4WrlOgHZU=;
        h=From:To:Cc:Subject:Date:From;
        b=tHMRNLf7xXbMl6oEN0FJHdte+wGCNfHEa2haSsmBlZWd6qSXJAZjhwwcLALkHTZ5L
         9iKVYRt7F7xrdm1aldEh7s6AnkGRoogfMlD2XBbhECaNHv2i274Uz4Opg8b8Vw/B0g
         tgRA7W5feXrWg183ech8G5H3cBzdWNf4ga0prU9s=
From:   Shuah Khan <shuah@kernel.org>
To:     shuah@kernel.org, corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] doc: kselftest: Fix KBUILD_OUTPUT usage instructions
Date:   Tue, 16 Apr 2019 08:26:51 -0600
Message-Id: <20190416142651.7048-1-shuah@kernel.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix KBUILD_OUTPUT usage instructions. The current documentation
is incorrect.

Signed-off-by: Shuah Khan <shuah@kernel.org>
---
 Documentation/dev-tools/kselftest.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index c8c03388b9de..6c910ddaa9f9 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -39,9 +39,9 @@ Build and run from user specific object directory (make O=dir)::
 
   $ make O=/tmp/kselftest kselftest
 
-Build and run KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
+Build and run from KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
 
-  $ make KBUILD_OUTPUT=/tmp/kselftest kselftest
+  $ export KBUILD_OUTPUT=/tmp/kselftest; make kselftest
 
 The above commands run the tests and print pass/fail summary to make it
 easier to understand the test results. Please find the detailed individual
@@ -65,9 +65,9 @@ Build and run from user specific object directory (make O=dir)::
 
   $ make O=/tmp/kselftest TARGETS="size timers" kselftest
 
-Build and run KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
+Build and run from KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
 
-  $ make KBUILD_OUTPUT=/tmp/kselftest TARGETS="size timers" kselftest
+  $ export KBUILD_OUTPUT=/tmp/kselftest; make TARGETS="size timers" kselftest
 
 The above commands run the tests and print pass/fail summary to make it
 easier to understand the test results. Please find the detailed individual
-- 
2.17.1

