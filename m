Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5243DC433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Jun 2022 14:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239952AbiFFOqa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Jun 2022 10:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239933AbiFFOqa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Jun 2022 10:46:30 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198606A03D
        for <linux-doc@vger.kernel.org>; Mon,  6 Jun 2022 07:46:28 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 85C18299;
        Mon,  6 Jun 2022 14:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 85C18299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654526788; bh=m7q0clRMyuz8pDF8C0qYxrU1OYw/jUTHCaLO1HYrLjg=;
        h=From:To:Cc:Subject:Date:From;
        b=NoqU8Y6Br+5htmpN90EqwYCPEQhfcvYLJuDuBiTyczMtM6jgtGpbD+hIPrVAiAy3q
         R0ZPMCpHtZtkwL0qoOlTA6fwUNscbrJ4/FH9EaiVYdq9QKvwwty4eOpC+g6QRrkivP
         kEZnk3m3idD35VpnhuG9YD0MCDCmO/hw/aIpjzzB06lxY120Xq8lAdHxnZmFFCaARu
         VgDbB5wKo0yXUI/dll1MvfBBoNA2KYrVIGvP7xVRX9exPTSyllj7ICeurpqqnAJ75s
         Q1mCFAgPeQJC7naKtHjevWe+qzsOXMCQSbb0MLrHIKLFbaLsUNX88js7cqvHhYI0l1
         pJKMcCZOP8UVg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thierry Reding <treding@nvidia.com>
Cc:     Dipen Patel <dipenp@nvidia.com>, linux-doc@vger.kernel.org
Subject: [PATCH] docs: Move the HTE documentation to driver-api/
Date:   Mon, 06 Jun 2022 08:46:27 -0600
Message-ID: <87a6apj1do.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The hardware timestamp engine documentation is driver API material, and
really belongs in the driver-API book; move it there.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/{ => driver-api}/hte/hte.rst          | 0
 Documentation/{ => driver-api}/hte/index.rst        | 0
 Documentation/{ => driver-api}/hte/tegra194-hte.rst | 0
 Documentation/driver-api/index.rst                  | 1 +
 Documentation/index.rst                             | 1 -
 MAINTAINERS                                         | 2 +-
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/{ => driver-api}/hte/hte.rst (100%)
 rename Documentation/{ => driver-api}/hte/index.rst (100%)
 rename Documentation/{ => driver-api}/hte/tegra194-hte.rst (100%)

diff --git a/Documentation/hte/hte.rst b/Documentation/driver-api/hte/hte.rst
similarity index 100%
rename from Documentation/hte/hte.rst
rename to Documentation/driver-api/hte/hte.rst
diff --git a/Documentation/hte/index.rst b/Documentation/driver-api/hte/index.rst
similarity index 100%
rename from Documentation/hte/index.rst
rename to Documentation/driver-api/hte/index.rst
diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/driver-api/hte/tegra194-hte.rst
similarity index 100%
rename from Documentation/hte/tegra194-hte.rst
rename to Documentation/driver-api/hte/tegra194-hte.rst
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index d76a60d95b58..a6d525cd9fc4 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -108,6 +108,7 @@ available subsections can be seen below.
    xilinx/index
    xillybus
    zorro
+   hte/index
 
 .. only::  subproject and html
 
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 8f9be0e658b4..67036a05b771 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -137,7 +137,6 @@ needed).
    scheduler/index
    mhi/index
    peci/index
-   hte/index
 
 Architecture-agnostic documentation
 -----------------------------------
diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..e5b7b78d62d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9081,7 +9081,7 @@ HTE SUBSYSTEM
 M:	Dipen Patel <dipenp@nvidia.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/timestamp/
-F:	Documentation/hte/
+F:	Documentation/driver-api/hte/
 F:	drivers/hte/
 F:	include/linux/hte.h
 
-- 
2.35.3

