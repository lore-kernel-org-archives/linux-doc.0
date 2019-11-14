Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BF6D07D917
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 22:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfKNWms (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 17:42:48 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:37565 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKNWmq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Nov 2019 17:42:46 -0500
Received: by mail-pg1-f202.google.com with SMTP id u20so5748212pga.4
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2019 14:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=//SxIFwu+xlyZ3KpN5ryMxJ8rZ5gTQh9998RBPDyljs=;
        b=AMVLKupT3zHwBW4ZWFmXDdkA6JXGWjf0opHk2wCQKAwS/Pbi4yMhHyuB+kQf3TtJc+
         Sr5MjazmlpJQW3hbtSsmlnovsDxJxUitOKUL5EgxO8rrjWZ7zytghWHAyrEy4+bEdScu
         c+cDEwZVZDHw4nGXQRdAgdqsjnIYfpURyalE5LZEx4445CTjusNn8VX1Eku552sRPuyo
         0H6a5OYznQ/W259RWo7jY/aRLwWThsV3r8C89RZX61L4Y7NyBI9BO/y1DSBiBXuyS9Hs
         YogeSAJRRrhEiw//W7lJQDdgETPc661qHyFCTJ3aubO7xW05TiumkLUZdRXZW38Yl+Kx
         LYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=//SxIFwu+xlyZ3KpN5ryMxJ8rZ5gTQh9998RBPDyljs=;
        b=sm3JDWkmStml5/NRsxGhEkGNpPDeHeMTHkTTb8Qhc1D12djn6CRoHEvHZ7BFEouvIA
         9MlNZN0D1zUUNNqa7ml8EqEP0FyaJrVxIG/RPY/+YHQ5ZljTLsTzI2QkXNcyWeiMy3Ze
         cIrwDI5N9A1YQFa6iTChQ6Qcpl3KVDGZl052UL0aJB/z/xm81ij/cvGGkM7hFjhsBCMY
         d6hPtuSSVSOoDzNjm2WSbE3zdSbsn5aSlLvttmgsmHk7RMer+FVNHTfiAntO+nSZ1vW+
         SSaVdoC0tv6EpfRHGGAC+v1XSf/BybA6erx4Fk1OpZqQ+zckjLpguW5FNYaSgdBd45JI
         9NXQ==
X-Gm-Message-State: APjAAAU2OVaKdCzsS9MlmmlCq5sX7fM89masn0NT9wwjL3zRdW71OZWg
        iDBY4SyXd4idIiF9NGPNacMMur0XCF4Cu1rogvqBFQ==
X-Google-Smtp-Source: APXvYqwSbawrArXZyzzhjKV9QauxgDW501V2Kcvv8bhjhOddYlxq9Fi9xMi+/r+OSAKviq/rsgaF6aoGbPEnQAIMjfp4GQ==
X-Received: by 2002:a63:34c8:: with SMTP id b191mr12450491pga.26.1573771364839;
 Thu, 14 Nov 2019 14:42:44 -0800 (PST)
Date:   Thu, 14 Nov 2019 14:42:40 -0800
Message-Id: <20191114224240.77861-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH linux-kselftest/test v2] Documentation: kunit: add
 documentation for kunit_tool
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com
Cc:     kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, tytso@mit.edu,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation for the Python script used to build, run, and collect
results from the kernel known as kunit_tool. kunit_tool
(tools/testing/kunit/kunit.py) was already added in previous commits.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 Documentation/dev-tools/kunit/index.rst      |  1 +
 Documentation/dev-tools/kunit/kunit-tool.rst | 57 ++++++++++++++++++++
 Documentation/dev-tools/kunit/start.rst      |  5 +-
 3 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/dev-tools/kunit/kunit-tool.rst

diff --git a/Documentation/dev-tools/kunit/index.rst b/Documentation/dev-tools/kunit/index.rst
index 26ffb46bdf99d..c60d760a0eed1 100644
--- a/Documentation/dev-tools/kunit/index.rst
+++ b/Documentation/dev-tools/kunit/index.rst
@@ -9,6 +9,7 @@ KUnit - Unit Testing for the Linux Kernel
 
 	start
 	usage
+	kunit-tool
 	api/index
 	faq
 
diff --git a/Documentation/dev-tools/kunit/kunit-tool.rst b/Documentation/dev-tools/kunit/kunit-tool.rst
new file mode 100644
index 0000000000000..37509527c04e1
--- /dev/null
+++ b/Documentation/dev-tools/kunit/kunit-tool.rst
@@ -0,0 +1,57 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+kunit_tool How-To
+=================
+
+What is kunit_tool?
+===================
+
+kunit_tool is a script (``tools/testing/kunit/kunit.py``) that aids in building
+the Linux kernel as UML (`User Mode Linux
+<http://user-mode-linux.sourceforge.net/>`_), running KUnit tests, parsing
+the test results and displaying them in a user friendly manner.
+
+What is a kunitconfig?
+======================
+
+It's just a defconfig that kunit_tool looks for in the base directory.
+kunit_tool uses it to generate a .config as you might expect. In addition, it
+verifies that the generated .config contains the CONFIG options in the
+kunitconfig; the reason it does this is so that it is easy to be sure that a
+CONFIG that enables a test actually ends up in the .config.
+
+How do I use kunit_tool?
+=================================
+
+If a kunitconfig is present at the root directory, all you have to do is:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run
+
+However, you most likely want to use it with the following options:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all`
+
+- ``--timeout`` sets a maximum amount of time to allow tests to run.
+- ``--jobs`` sets the number of threads to use to build the kernel.
+
+If you just want to use the defconfig that ships with the kernel, you can
+append the ``--defconfig`` flag as well:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all` --defconfig
+
+.. note::
+	This command is particularly helpful for getting started because it
+	just works. No kunitconfig needs to be present.
+
+For a list of all the flags supported by kunit_tool, you can run:
+
+.. code-block:: bash
+
+	./tools/testing/kunit/kunit.py run --help
diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
index aeeddfafeea20..4248a6f9038b8 100644
--- a/Documentation/dev-tools/kunit/start.rst
+++ b/Documentation/dev-tools/kunit/start.rst
@@ -19,7 +19,10 @@ The wrapper can be run with:
 
 .. code-block:: bash
 
-   ./tools/testing/kunit/kunit.py run
+	./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all` --defconfig
+
+For more information on this wrapper (also called kunit_tool) checkout the
+:doc:`kunit-tool` page.
 
 Creating a kunitconfig
 ======================
-- 
2.24.0.432.g9d3f5f5b63-goog

