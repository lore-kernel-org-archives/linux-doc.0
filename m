Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F6537D910
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Nov 2019 00:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfKSAb1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Nov 2019 19:31:27 -0500
Received: from mail-yw1-f74.google.com ([209.85.161.74]:37767 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfKSAb1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Nov 2019 19:31:27 -0500
Received: by mail-yw1-f74.google.com with SMTP id 12so14059155ywr.4
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2019 16:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=yfNbjHWRrhw+zGG52DgoyWTdFL5K2v0r34yKMDdXSXY=;
        b=Ek9lX3ItetweN4Al7CAwZTvqBlkDz7uUhPGhK+SqvevdHENDKje4Kr/PXsbe/wh87C
         qLohQBcmJybIs8U26KkOncLl06u7KZv/yIlBv3bAXBCyctrb7pwhtC26PReLL/4dXqVp
         aLABqGS5kENwPQKT/s1Pc8Z+ki/PrPCMQ8rqjToaLGB7UhnAvD+IYYH0Wr0raSz7TA/h
         yXYSKB1PLZlJuHY5a9PcZcsYEUMIGbnu76pf1zeoWPa7oCjSFzzDkpwkOp4T3CIRpVjB
         nlHkM5L0i4KWvP3IGkVWxLhGLgvjHqeSP9n5pgJCnaUAADSBAMnpQLuUmJOXmiaAdWHM
         DdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=yfNbjHWRrhw+zGG52DgoyWTdFL5K2v0r34yKMDdXSXY=;
        b=bR93TE0Lg5E3hxxO7f/7VCggvbed53hvx/30fXQSszkfsIbrat9qhXqxTRXFWzhbT2
         ohgwdZ7R40H6i0BddFU6CQu2hDL2SpYtxLyHTXUJV1DV31TkReX11NDQZbZgdhMSNiWE
         6tAcG1tSfTAD6K9C8YnH1lk8rJKUALZcmMa18S1faP1h6UDXTAAluXbdzAgUIYSZlAfs
         YwfhpxBTDT4O9Jqx1IKBvFmY8zQZmX5Yd/WEMhAvkSAiSZrBHcJeHRPrXFK8ynarmJlK
         cbSsPvqgFlh+BVwPH8WBScDl7/lamlJa+MC5uKIF2A0gN4HQ+WyW4TVa8/eCAoJ7zFdS
         +laQ==
X-Gm-Message-State: APjAAAVkqoQyUiG8wHakxvzlvsGEbSYxKE3PkaRM3JP1G0ltDFj3sCj+
        VR9ygyRe/S9T+QID4yQm/MAZtlb+chwk6AvyW1a9BQ==
X-Google-Smtp-Source: APXvYqwx5m+WJzbp3t3si7z4O88IjG8BwYnfW2Aune1Kn7tPbs9EomOhLsqq1a1+HAxcGU3zJaKa3Q3khCmh1U2ahyjjLA==
X-Received: by 2002:a81:9296:: with SMTP id j144mr20996984ywg.291.1574123484577;
 Mon, 18 Nov 2019 16:31:24 -0800 (PST)
Date:   Mon, 18 Nov 2019 16:31:20 -0800
Message-Id: <20191119003120.154041-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH linux-kselftest/test v3] Documentation: kunit: add
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
Reviewed-by: David Gow <davidgow@google.com>
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
index aeeddfafeea20..f4d9a4fa914f8 100644
--- a/Documentation/dev-tools/kunit/start.rst
+++ b/Documentation/dev-tools/kunit/start.rst
@@ -19,7 +19,10 @@ The wrapper can be run with:
 
 .. code-block:: bash
 
-   ./tools/testing/kunit/kunit.py run
+	./tools/testing/kunit/kunit.py run --defconfig
+
+For more information on this wrapper (also called kunit_tool) checkout the
+:doc:`kunit-tool` page.
 
 Creating a kunitconfig
 ======================
-- 
2.24.0.432.g9d3f5f5b63-goog

