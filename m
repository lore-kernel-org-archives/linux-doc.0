Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DA7C05027
	for <linux-doc@archiver.kernel.org>; Sun, 29 Jan 2023 23:57:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjA2X5q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 29 Jan 2023 18:57:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjA2X5p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 29 Jan 2023 18:57:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00AD5BB5
        for <linux-doc@vger.kernel.org>; Sun, 29 Jan 2023 15:57:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 66ACDB80DD1
        for <linux-doc@vger.kernel.org>; Sun, 29 Jan 2023 23:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BC4C433EF;
        Sun, 29 Jan 2023 23:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675036662;
        bh=3M9RArcAY8Mxrx+FHI+PUewWDlb3iuK8seiKci0ECWM=;
        h=From:To:Cc:Subject:Date:From;
        b=qm9FRuxQ6sxYlf1KDnfQEGQOGs2WgOGusRMvN2n5z6LRAgy4OtJpbGS52ldJIWaXS
         WgCOzME0mhJrUlIDFiZeZrJyo+mafekXCF5rfuX0J8K6IxB1tlHZEtuJQ+z5/gLQqV
         Koy5HXYl3AI0rbgXqqRw5YmJHT9w1brG9mytpvWRL+k9dZDfj8iG4KYZiI9lKDad2e
         tPgcQ/LdwjJ1FX0kNV9bn4j6H/O7MH3PV+9WC32+Ks9AoVcqV/ZMzCbvkDspSBdJgx
         PgpEYhP1tcHGnM4aUBpou1LL1HX1m1R5Le7zNgmw7UEgciLKsVXTFNCFRg11fmees/
         db14HMtt2dTww==
From:   Conor Dooley <conor@kernel.org>
To:     palmer@dabbelt.com
Cc:     conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, kernel test robot <lkp@intel.com>
Subject: [PATCH] Documentation: riscv: fix insufficient list item indent
Date:   Sun, 29 Jan 2023 23:57:01 +0000
Message-Id: <20230129235701.2393241-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=conor.dooley@microchip.com; h=from:subject; bh=/JT1iPSOFYOqM725NwkI9fejoWCY457nSjP9BGE5Es0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnX2Y9/VPyWIZ75b2Z0tGDTXA/7G9/3zJeaf+7EeRvVPpH2 3rUaHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZgIXyvDf+eH4jrzZu387hKqZbZrRZ rzx0Mrnv53VHzzfDv/TFfPoMsM//P5IndMucvSuH1nVvqiF/8/6zbN/Oq1semG/olVm6b+3cYGAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

When adding the ISA string ordering rules, I didn't sufficiently indent
one of the list items.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/riscv/uabi.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index 2ebec4c52230..8960fac42c40 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -21,10 +21,10 @@ so for our purposes the following rules apply:
    single-letter extensions and before any higher-privileged extensions.
 
 #. For additional standard extensions, the first letter following the 'Z'
-  conventionally indicates the most closely related alphabetical
-  extension category. If multiple 'Z' extensions are named, they will be ordered
-  first by category, in canonical order, as listed above, then alphabetically
-  within a category.
+   conventionally indicates the most closely related alphabetical
+   extension category. If multiple 'Z' extensions are named, they will be
+   ordered first by category, in canonical order, as listed above, then
+   alphabetically within a category.
 
 #. Standard supervisor-level extensions (starting with 'S') will be listed
    after standard unprivileged extensions.  If multiple supervisor-level
-- 
2.39.1

