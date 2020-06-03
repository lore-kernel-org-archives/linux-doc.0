Return-Path: <SRS0=FLyy=7Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BE2C433E0
	for <linux-doc@archiver.kernel.org>; Wed,  3 Jun 2020 03:37:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 691A02072F
	for <linux-doc@archiver.kernel.org>; Wed,  3 Jun 2020 03:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c999EjRT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgFCDha (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Jun 2020 23:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgFCDh3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jun 2020 23:37:29 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87692C08C5C2
        for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2020 20:37:29 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id y7so1985855ybj.15
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2020 20:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=FsWqk4JcMUkanVuZpVmCgmQIB+DqTVnxIfhOfOsqCOo=;
        b=c999EjRT/7Z15PIXCNfzhP8YEo6EHnSk7cw1vtvkJ8G5sm28ldvUj1p33b2yvpelJt
         HpaHcO4AVGCgEx6+pQRXC8TdIXrZVfUGyLwn4bO20stfPkvxVzLvXY7N4DHK332AVxyA
         ZpPQKS1NfVE1pbRWEKxOIigceruxy94QDofqCuWy53fkLeBfEhx2shHQl54HO1wMXWw9
         8EbLTZQJg/cjVRTHLB1dXFs41FxDDB5dCNo5XKPYrjMqa3oZNYa/L2JHNhKUDiy+wIkO
         x9I2JQMBN4It0P8wukaoRLq9+dvFf/i3EJ5xX2VcIE6roAbGT77r3xQ53GGuQK1CAGqF
         tmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=FsWqk4JcMUkanVuZpVmCgmQIB+DqTVnxIfhOfOsqCOo=;
        b=kTFuisEtmKzQobpezPfiHCBw2fpqFJh+HOQrdRZ8M+TphGWDPrZLQKyGrIK98DHs/l
         SWeZslI+TlX0KvE0gtcspGRq9BmWQ8FjGiDZIX+Th0N4ebLhTbRmDyROF5yFzVVfbmTa
         fVQGJoCgiIwdMQwy4HU9RrkMWu+pZNAsbR2D26v5DdBtUr9tOCbLAMzFJ5HiB9XN6Uel
         DQ/oPXjL3CfJPFyiUnxSnnrhRT/wHbCWYUb5bK1ygxSDhd6BK4RkwFET3PbdQRjGUSJF
         Bq8xJIZO7KlpbQD8IVnV5zY9fNR3mxtvNEKw8hewPnKbGy1ArP3+HU0mrx8Q3RPGsGUL
         MLlg==
X-Gm-Message-State: AOAM5322ZbMGd/CUQxq02C5Tw9tYrUZWHyM3uoObDpj2bHdRvQ59pKV6
        OoiWs5LGF6c/8uj/AMY7vxHtz+7h3KU1Dg==
X-Google-Smtp-Source: ABdhPJw1G4qnz/p2gcQoZLNm+pBZHUKz67lhSOqRhS2g/W8ZuvsPK9fKJbB+YgtSezGeuUEgjafhMA1rAVSpdg==
X-Received: by 2002:a25:d28d:: with SMTP id j135mr43629717ybg.208.1591155448553;
 Tue, 02 Jun 2020 20:37:28 -0700 (PDT)
Date:   Tue,  2 Jun 2020 20:37:25 -0700
Message-Id: <20200603033725.25460-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
Subject: [PATCH v2] Documentation: kunit: Add some troubleshooting tips to the FAQ
From:   David Gow <davidgow@google.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        alan.maguire@oracle.com, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an FAQ entry to the KUnit documentation with some tips for
troubleshooting KUnit and kunit_tool.

These suggestions largely came from an email thread:
https://lore.kernel.org/linux-kselftest/41db8bbd-3ba0-8bde-7352-083bf4b947ff@intel.com/T/#m23213d4e156db6d59b0b460a9014950f5ff6eb03

Signed-off-by: David Gow <davidgow@google.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes since v1[1]
- Added a section about running KUnit outside UML (based heavily on
  Alan's suggestion in the thread).

[1]: https://lore.kernel.org/linux-kselftest/20200602054216.93122-1-davidgow@google.com/


 Documentation/dev-tools/kunit/faq.rst | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/dev-tools/kunit/faq.rst b/Documentation/dev-tools/kunit/faq.rst
index ea55b2467653..1628862e7024 100644
--- a/Documentation/dev-tools/kunit/faq.rst
+++ b/Documentation/dev-tools/kunit/faq.rst
@@ -61,3 +61,43 @@ test, or an end-to-end test.
   kernel by installing a production configuration of the kernel on production
   hardware with a production userspace and then trying to exercise some behavior
   that depends on interactions between the hardware, the kernel, and userspace.
+
+KUnit isn't working, what should I do?
+======================================
+
+Unfortunately, there are a number of things which can break, but here are some
+things to try.
+
+1. Try running ``./tools/testing/kunit/kunit.py run`` with the ``--raw_output``
+   parameter. This might show details or error messages hidden by the kunit_tool
+   parser.
+2. Instead of running ``kunit.py run``, try running ``kunit.py config``,
+   ``kunit.py build``, and ``kunit.py exec`` independently. This can help track
+   down where an issue is occurring. (If you think the parser is at fault, you
+   can run it manually against stdin or a file with ``kunit.py parse``.)
+3. Running the UML kernel directly can often reveal issues or error messages
+   kunit_tool ignores. This should be as simple as running ``./vmlinux`` after
+   building the UML kernel (e.g., by using ``kunit.py build``). Note that UML
+   has some unusual requirements (such as the host having a tmpfs filesystem
+   mounted), and has had issues in the past when built statically and the host
+   has KASLR enabled. (On older host kernels, you may need to run ``setarch
+   `uname -m` -R ./vmlinux`` to disable KASLR.)
+4. Make sure the kernel .config has ``CONFIG_KUNIT=y`` and at least one test
+   (e.g. ``CONFIG_KUNIT_EXAMPLE_TEST=y``). kunit_tool will keep its .config
+   around, so you can see what config was used after running ``kunit.py run``.
+   It also preserves any config changes you might make, so you can
+   enable/disable things with ``make ARCH=um menuconfig`` or similar, and then
+   re-run kunit_tool.
+5. Try to run ``make ARCH=um defconfig`` before running ``kunit.py run``. This
+   may help clean up any residual config items which could be causing problems.
+6. Finally, try running KUnit outside UML. KUnit and KUnit tests can run be
+   built into any kernel, or can be built as a module and loaded at runtime.
+   Doing so should allow you to determine if UML is causing the issue you're
+   seeing. When tests are built-in, they will execute when the kernel boots, and
+   modules will automatically execute associated tests when loaded. Test results
+   can be collected from ``/sys/kernel/debug/kunit/<test suite>/results``, and
+   can be parsed with ``kunit.py parse``. For more details, see "KUnit on
+   non-UML architectures" in :doc:`usage`.
+
+If none of the above tricks help, you are always welcome to email any issues to
+kunit-dev@googlegroups.com.
-- 
2.27.0.rc2.251.g90737beb825-goog

