Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 56BBC7DF86
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 16:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755619AbeEaQWg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 12:22:36 -0400
Received: from mail.netline.ch ([148.251.143.178]:37521 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755678AbeEaQWe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 12:22:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id 2C1222A6046;
        Thu, 31 May 2018 18:17:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id hbr2M-B-5l7U; Thu, 31 May 2018 18:17:10 +0200 (CEST)
Received: from kaveri (252.228.127.176.dynamic.wline.res.cust.swisscom.ch [176.127.228.252])
        by netline-mail3.netline.ch (Postfix) with ESMTPSA id 4AEB92A6048;
        Thu, 31 May 2018 18:17:09 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.91)
        (envelope-from <michel@daenzer.net>)
        id 1fOQGC-0001Xt-F8; Thu, 31 May 2018 18:17:08 +0200
From:   =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To:     amd-gfx@lists.freedesktop.org
Cc:     Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/doc: Add initial amdgpu driver documentation
Date:   Thu, 31 May 2018 18:17:07 +0200
Message-Id: <20180531161708.5894-2-michel@daenzer.net>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180531161708.5894-1-michel@daenzer.net>
References: <20180531161708.5894-1-michel@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Michel Dänzer <michel.daenzer@amd.com>

Signed-off-by: Michel Dänzer <michel.daenzer@amd.com>
---
 Documentation/gpu/amdgpu.rst  | 6 ++++++
 Documentation/gpu/drivers.rst | 1 +
 2 files changed, 7 insertions(+)
 create mode 100644 Documentation/gpu/amdgpu.rst

diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
new file mode 100644
index 000000000000..41a14e4aa4ac
--- /dev/null
+++ b/Documentation/gpu/amdgpu.rst
@@ -0,0 +1,6 @@
+=========================
+ drm/amdgpu AMDgpu driver
+=========================
+
+The drm/amdgpu driver supports all AMD Radeon GPUs based on the Graphics Core
+Next (GCN) architecture.
diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index e8c84419a2a1..604b6d6975af 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -4,6 +4,7 @@ GPU Driver Documentation
 
 .. toctree::
 
+   amdgpu
    i915
    meson
    pl111
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
