Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44718C77B61
	for <linux-doc@archiver.kernel.org>; Mon, 24 Apr 2023 08:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbjDXIDV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Apr 2023 04:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjDXIDU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Apr 2023 04:03:20 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C188499
        for <linux-doc@vger.kernel.org>; Mon, 24 Apr 2023 01:03:19 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54f851bcd4fso48309437b3.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Apr 2023 01:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682323398; x=1684915398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XH2Lqzu08gkcssZt2/R0XUTpz7KzoWVd+cVQ+NRECjc=;
        b=B3P6ON3K/L5I+eOl3+sfH1ltNCzsYHMTc62CxV4kJ7JUaGnXF39hNW2w/CcrMOiCP3
         +B62InAj3p2XPkO5dCvO9Hkq0cNNEj/D3a2C8zl/0N7IhTpIyw6ODbes2UU/4WZVwcAS
         1QXS6yBXcKPB8tkUefPZSEWPUYDaWzd7BH+wIPb26j0e0wiV/6QBRGjEaSFIrf94SAb3
         SNZt0LdY9cAqgDYwlWadtkl03nXejkR2y/Y/dCqlZ6NJzJvZTHRmorRpO9iPo0Qhtn09
         Ig3Pb185p+/+/FDnJzZbw+F6OOa43bxlfDc6irdKelkghdMW/rRx//LTbugQqXgZtCP7
         YQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682323398; x=1684915398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH2Lqzu08gkcssZt2/R0XUTpz7KzoWVd+cVQ+NRECjc=;
        b=dZlaZ59NncpF8N/rjtSKt3pkKqAG3U4CQkHbPzz0utLE0GVwU54djmnD6aLsojtrmO
         Atsmuro7SWk3EP9gxy1UJZluYj/MWBJBvf6CsPiV1YZEl2w8HJpni96+kjPmADN/k5NX
         kbXKBpmy3hJ4UTzoEAJr1ilySu9JTVzIpLQXBTRofLCW3PqxM6+fOlsf+JDPWtYlfrh4
         6BSLGZhJq6Y9qY6GAUmhXYGhHHVcCSQM29NZFOduUY7uHhXk6sSX0WHeB9UMEysjMcJm
         e8edzN6zc6U4Y7ycSPktLpYLeQNFT9ISkUp4oYMVCxvie0Y8fI/Pc3BeYQzpeFoIUIhg
         dA/w==
X-Gm-Message-State: AAQBX9dHZSx+Efd8deqd9PVfrtNBcq8EiDzHuNvZgL1ZFu5NeUIkE/sV
        jtyzPww+bfIuYgJ5bMJm/OwUqf71sQTcRg==
X-Google-Smtp-Source: AKy350aiApqOvLrglstNylz49OjbAj9RoxHq6uW0ETfoFMgDHszHJOFWE5GSDIFln6WiPVPi5rOOxA==
X-Received: by 2002:a0d:d7cc:0:b0:54c:11e2:d32 with SMTP id z195-20020a0dd7cc000000b0054c11e20d32mr7073408ywd.27.1682323398527;
        Mon, 24 Apr 2023 01:03:18 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
        by smtp.gmail.com with ESMTPSA id x4-20020a0dee04000000b0054629ed8300sm2773911ywe.80.2023.04.24.01.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 01:03:18 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH] docs/admin-guide/mm/ksm.rst fix intraface -> interface typo
Date:   Mon, 24 Apr 2023 09:03:05 +0100
Message-Id: <20230424080305.2985-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix typo from 'intraface' to 'interface' in admin guide for KSM.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/admin-guide/mm/ksm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
index eed51a910c94..ca0c3a384f85 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -20,7 +20,7 @@ content which can be replaced by a single write-protected page (which
 is automatically copied if a process later wants to update its
 content). The amount of pages that KSM daemon scans in a single pass
 and the time between the passes are configured using :ref:`sysfs
-intraface <ksm_sysfs>`
+interface <ksm_sysfs>`
 
 KSM only merges anonymous (private) pages, never pagecache (file) pages.
 KSM's merged pages were originally locked into kernel memory, but can now
-- 
2.39.0

