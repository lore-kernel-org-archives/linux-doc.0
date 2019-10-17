Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 20F7D7D918
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Oct 2019 07:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387489AbfJQHrK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Oct 2019 03:47:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:48244 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387930AbfJQHrK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Oct 2019 03:47:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 1CB2CB591;
        Thu, 17 Oct 2019 07:47:09 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch
Cc:     corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/1] drm: Add TODO item for fbdev driver conversion
Date:   Thu, 17 Oct 2019 09:47:05 +0200
Message-Id: <20191017074705.9140-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017074705.9140-1-tzimmermann@suse.de>
References: <20191017074705.9140-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The DRM TODO list now contains an entry for converting fbdev
drivers over to DRM.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 79785559d711..23b3a67794ba 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -462,3 +462,30 @@ Contact: Sam Ravnborg
 
 Outside DRM
 ===========
+
+Convert fbdev drivers to DRM
+----------------------------
+
+There are plenty of fbdev drivers for older hardware. Some hwardware has
+become obsolete, but some still provides good(-enough) framebuffers. The
+drivers that are still useful should be converted to DRM and afterwards
+removed from fbdev.
+
+Very simple fbdev drivers can best be converted by starting with a new
+DRM driver. Simple KMS helpers and SHMEM should be able to handle any
+existing hardware. The new driver's call-back functions are filled from
+existing fbdev code.
+
+More complex fbdev drivers can be refactored step-by-step into a DRM
+driver with the help of the DRM fbconv helpers. [1] These helpers provide
+the transition layer between the DRM core infrastructure and the fbdev
+driver interface. Create a new DRM driver on top of the fbconv helpers,
+copy over the fbdev driver, and hook it up to the DRM code. Examples for
+several fbdev drivers are available at [1] and a tutorial of this process
+available at [2]. The result is a primitive DRM driver that can run X11
+and Weston.
+
+ - [1] https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv
+ - [2] https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/drivers/gpu/drm/drm_fbconv_helper.c
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>
-- 
2.23.0

