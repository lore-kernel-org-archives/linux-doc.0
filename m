Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0D7B57D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 22 May 2019 20:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730336AbfEVUu7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 22 May 2019 16:50:59 -0400
Received: from ms.lwn.net ([45.79.88.28]:49324 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729848AbfEVUu7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 22 May 2019 16:50:59 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id B83CA130D;
        Wed, 22 May 2019 20:50:58 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Oleksandr Natalenko <oleksandr@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 6/8] docs/gpu: fix a documentation build break in i915.rst
Date:   Wed, 22 May 2019 14:50:32 -0600
Message-Id: <20190522205034.25724-7-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522205034.25724-1-corbet@lwn.net>
References: <20190522205034.25724-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation/gpu/i915.rst is not included in the TOC tree, but newer
versions of sphinx parse it anyway.  That leads to this hard build failure:

> Global GTT Fence Handling
> ~~~~~~~~~~~~~~~~~~~~~~~~~
>
> reST markup error:
> /stuff/k/git/kernel/Documentation/gpu/i915.rst:403: (SEVERE/4) Title level inconsistent:

Make the underlining consistent and restore a working docs build.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/gpu/i915.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 055df45596c1..cf9ff64753cc 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -401,13 +401,13 @@ GTT Fences and Swizzling
    :internal:
 
 Global GTT Fence Handling
-~~~~~~~~~~~~~~~~~~~~~~~~~
+-------------------------
 
 .. kernel-doc:: drivers/gpu/drm/i915/i915_gem_fence_reg.c
    :doc: fence register handling
 
 Hardware Tiling and Swizzling Details
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+-------------------------------------
 
 .. kernel-doc:: drivers/gpu/drm/i915/i915_gem_fence_reg.c
    :doc: tiling swizzling details
-- 
2.21.0

