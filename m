Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0C3C6FA82
	for <linux-doc@archiver.kernel.org>; Tue, 27 Sep 2022 16:07:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbiI0QH6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Sep 2022 12:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbiI0QHc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Sep 2022 12:07:32 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9FA56032;
        Tue, 27 Sep 2022 09:06:17 -0700 (PDT)
Received: from meer.lwn.net (unknown [IPv6:2601:281:8300:73::5f6])
        by ms.lwn.net (Postfix) with ESMTPA id CCA5C8B2;
        Tue, 27 Sep 2022 16:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CCA5C8B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1664294777; bh=Uq/aOCxVvfG5MiT72IUzEcUWMPEku718na4X3SHiJv4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lAgIYAZ6PrjRRclwu7LkcB1V3TeNrtyBCgV/Ivc+Z/k3G7G25KY+cybxfHz+DfKNn
         32n4b1RLMwkv7Q+WY/3wJuNOmxTIb0nf2OjD8eYb/baSVVryjPe1F7zPDILxpWXdOI
         RGgpe6IqxGga/2MSdh+S7cAFnayjxZ8s4SU0cntSQoSkMVFxUfFjxc8L5d6O625WNw
         Ri5ZC1tQUFC9VVUQpwZEsinZ6tpliL7cYysJmIJeDu6r4kh+fOS078Niu8LDrPe5wG
         gvaj1xOO3NNwh+H89ceZd9bQKINNsqKHZpWCBA9IPQPXrAM++iUq3gUm9S2F2/t6EL
         gmpQ+8RKfTJwQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Kees Cook <keescook@chromium.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joe Perches <joe@perches.com>,
        David Vernet <void@manifault.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 6/7] docs: put atomic*.txt and memory-barriers.txt into the core-api book
Date:   Tue, 27 Sep 2022 10:05:58 -0600
Message-Id: <20220927160559.97154-7-corbet@lwn.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220927160559.97154-1-corbet@lwn.net>
References: <20220927160559.97154-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These files describe part of the core API, but have never been converted to
RST due to ... let's say local oppposition.  So, create a set of
special-purpose wrappers to ..include these files into a separate page so
that they can be a part of the htmldocs build.  Then link them into the
core-api manual and remove them from the "staging" dumping ground.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/core-api/index.rst              |  3 ++
 .../core-api/wrappers/atomic_bitops.rst       | 18 ++++++++
 Documentation/core-api/wrappers/atomic_t.rst  | 19 +++++++++
 .../core-api/wrappers/memory-barriers.rst     | 18 ++++++++
 Documentation/staging/index.rst               | 42 -------------------
 5 files changed, 58 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/core-api/wrappers/atomic_bitops.rst
 create mode 100644 Documentation/core-api/wrappers/atomic_t.rst
 create mode 100644 Documentation/core-api/wrappers/memory-barriers.rst

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index f5d8e3779fe8..b0e7b4771fff 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -45,6 +45,8 @@ Library functionality that is used throughout the kernel.
    this_cpu_ops
    timekeeping
    errseq
+   wrappers/atomic_t
+   wrappers/atomic_bitops
 
 Low level entry and exit
 ========================
@@ -68,6 +70,7 @@ Documentation/locking/index.rst for more related documentation.
    local_ops
    padata
    ../RCU/index
+   wrappers/memory-barriers.rst
 
 Low-level hardware management
 =============================
diff --git a/Documentation/core-api/wrappers/atomic_bitops.rst b/Documentation/core-api/wrappers/atomic_bitops.rst
new file mode 100644
index 000000000000..bf24e4081a8f
--- /dev/null
+++ b/Documentation/core-api/wrappers/atomic_bitops.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+   This is a simple wrapper to bring atomic_bitops.txt into the RST world
+   until such a time as that file can be converted directly.
+
+=============
+Atomic bitops
+=============
+
+.. raw:: latex
+
+    \footnotesize
+
+.. include:: ../../atomic_bitops.txt
+   :literal:
+
+.. raw:: latex
+
+    \normalsize
diff --git a/Documentation/core-api/wrappers/atomic_t.rst b/Documentation/core-api/wrappers/atomic_t.rst
new file mode 100644
index 000000000000..ed109a964c77
--- /dev/null
+++ b/Documentation/core-api/wrappers/atomic_t.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+   This is a simple wrapper to bring atomic_t.txt into the RST world
+   until such a time as that file can be converted directly.
+
+============
+Atomic types
+============
+
+.. raw:: latex
+
+    \footnotesize
+
+.. include:: ../../atomic_t.txt
+   :literal:
+
+.. raw:: latex
+
+    \normalsize
+
diff --git a/Documentation/core-api/wrappers/memory-barriers.rst b/Documentation/core-api/wrappers/memory-barriers.rst
new file mode 100644
index 000000000000..532460b5e3eb
--- /dev/null
+++ b/Documentation/core-api/wrappers/memory-barriers.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+   This is a simple wrapper to bring memory-barriers.txt into the RST world
+   until such a time as that file can be converted directly.
+
+============================
+Linux kernel memory barriers
+============================
+
+.. raw:: latex
+
+    \footnotesize
+
+.. include:: ../../memory-barriers.txt
+   :literal:
+
+.. raw:: latex
+
+    \normalsize
diff --git a/Documentation/staging/index.rst b/Documentation/staging/index.rst
index abd0d18254d2..ded8254bc0d7 100644
--- a/Documentation/staging/index.rst
+++ b/Documentation/staging/index.rst
@@ -14,45 +14,3 @@ Unsorted Documentation
    static-keys
    tee
    xz
-
-Atomic Types
-============
-
-.. raw:: latex
-
-    \footnotesize
-
-.. include:: ../atomic_t.txt
-   :literal:
-
-.. raw:: latex
-
-    \normalsize
-
-Atomic bitops
-=============
-
-.. raw:: latex
-
-    \footnotesize
-
-.. include:: ../atomic_bitops.txt
-   :literal:
-
-.. raw:: latex
-
-    \normalsize
-
-Memory Barriers
-===============
-
-.. raw:: latex
-
-    \footnotesize
-
-.. include:: ../memory-barriers.txt
-   :literal:
-
-.. raw:: latex
-
-    \normalsize
-- 
2.37.2

