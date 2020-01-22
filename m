Return-Path: <SRS0=DKq9=3L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC5EC32771
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:21:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64D7E2253D
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgAVXVn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 18:21:43 -0500
Received: from ms.lwn.net ([45.79.88.28]:53440 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgAVXVm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 22 Jan 2020 18:21:42 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EC13E6D9
        for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2020 23:21:41 +0000 (UTC)
Date:   Wed, 22 Jan 2020 16:21:40 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Subject: [PATCH] Add a maintainer entry profile for Documentation/
Message-ID: <20200122162140.6a13e6a9@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation should lead by example, so here's a basic maintainer entry
profile for this subsystem.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/doc-guide/index.rst             |  1 +
 .../doc-guide/maintainer-profile.rst          | 44 +++++++++++++++++++
 .../maintainer/maintainer-entry-profile.rst   |  1 +
 3 files changed, 46 insertions(+)
 create mode 100644 Documentation/doc-guide/maintainer-profile.rst

diff --git a/Documentation/doc-guide/index.rst b/Documentation/doc-guide/index.rst
index c58de84c0d5b..7c7d97784626 100644
--- a/Documentation/doc-guide/index.rst
+++ b/Documentation/doc-guide/index.rst
@@ -11,6 +11,7 @@ How to write kernel documentation
    kernel-doc
    parse-headers
    contributing
+   maintainer-profile
 
 .. only::  subproject and html
 
diff --git a/Documentation/doc-guide/maintainer-profile.rst b/Documentation/doc-guide/maintainer-profile.rst
new file mode 100644
index 000000000000..a4e25b13250c
--- /dev/null
+++ b/Documentation/doc-guide/maintainer-profile.rst
@@ -0,0 +1,44 @@
+.. SPDX-License-Identifier: GPL-2.0
+Documentation subsystem maintainer entry profile
+================================================
+
+The documentation "subsystem" is the central coordinating point for the
+kernel's documentation and associated infrastructure.  It covers the
+hierarchy under Documentation/ (with the exception of
+Documentation/device-tree), various utilities under scripts/ and, at least
+some of the time, LICENSES/.
+
+It's worth noting, though, that the boundaries of this subsystem are rather
+fuzzier than normal.  Many other subsystem maintainers like to keep control
+of portions of Documentation/, and many more freely apply changes there
+when it is convenient.  Beyond that, much of the kernel's documentation is
+found in the source as kerneldoc comments; those are usually (but not
+always) maintained by the relevant subsystem maintainer.
+
+The mailing list for documentation is linux-doc@vger.kernel.org.  Patches
+should be made against the docs-next tree whenever possible.
+
+Submit checklist addendum
+-------------------------
+
+When making documentation changes, you should actually build the
+documentation and ensure that no new errors have been introduced.
+Generating HTML documents and looking at the result will help to avoid
+unsightly misunderstandings about how things will be rendered.
+
+Key cycle dates
+---------------
+
+Patches can be sent anytime, but response will be slower than usual during
+the merge window.  The docs tree tends to close late before the merge
+window opens, since the risk of regressions from documentation patches is
+low.
+
+Review cadence
+--------------
+
+The documentation subsystem has a single maintainer who is doing the work
+on his own time, so the response to patches will occasionally be slow.  I
+try to always send out a notification when a patch is merged (or when I
+decide that one cannot be).  Do not hesitate to send a ping if you have not
+heard back within a week of sending a patch.
diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index 3eaddc8ac56d..11ebe3682771 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -99,4 +99,5 @@ to do something different in the near future.
 .. toctree::
    :maxdepth: 1
 
+   ../doc-guide/maintainer-profile
    ../nvdimm/maintainer-entry-profile
-- 
2.24.1

