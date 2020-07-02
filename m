Return-Path: <SRS0=H354=AN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0137EC433DF
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jul 2020 07:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D412820899
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jul 2020 07:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bdlc7ZwZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgGBHOZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Jul 2020 03:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbgGBHOY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Jul 2020 03:14:24 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC44C08C5DD
        for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2020 00:14:24 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id c17so28750780ybf.7
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2020 00:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=0MPFvMqMThNlqIXSGXzk3uL7fUIp1+1hZOAZp0aIFwA=;
        b=bdlc7ZwZTDFsLsoFXz42E7eAeV+b9lPIs0tdRLSBoLa1uHbCsGZPxJ3hVSMJZLlNmz
         4nsaqDJ8Ls7FfE8uwy67W4Ybtv9I46noCqW8y4WdZhfXo9+VmSNjfip0MOvZYU4zDdtf
         lppv9sqgyLILvAKTXAkMrXIPSTx6JBnnzu1UA330MvTrma0ry+v5nRce2KG9D58btsog
         M7saHzBbJd6f8moXykXOSVlKNf43cP4Moov4ivaB56FmYRc3MGOCe63Dcffi5xk5s5Kb
         AJK5X4T6XGWa7ISrOI7immZ9UVsBrhxJqbcV/FalorvbVDtGP2cCNxU4y2bCxpBO2gia
         FBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=0MPFvMqMThNlqIXSGXzk3uL7fUIp1+1hZOAZp0aIFwA=;
        b=LV9UCKokgxj5aq6SrNngGb4TRDceBCDZjOTK94iqZ0jLdBbkSW0iNqtoQUL1dOxim1
         MRfqgFSRScM32bRpdya06vzJvIMyBdhbfRN8aoLWI8awlRwiGAmzZovuGLN/AR/cewFB
         29qCgagISeD4kbsKzJGk4+k7FaQ8lN/7tRrLJzAArS/T+y4dTzh6EhxPOqdusBCsA2WQ
         X8gnpLMJ8inSay0ZirE6KOj21wVDoBhCJi3YD9qZO5StsYj1IvhW60L8mITcViraLmNU
         9Ad/8oozqXqec9TYywu0LRYl8pv1PCy+R56GuRL1gZ5HBzmsQqD/Vg8iwHnNgUeSo7Ev
         lRhQ==
X-Gm-Message-State: AOAM532e1+xVv/5f5t/K8Gdid02EVlQrsdCWhGFm9nrlGjyGLm3g3OJk
        NDxyrYqCNzgh12XH63oI4YGFvR+Cf4Idpg==
X-Google-Smtp-Source: ABdhPJwiHir8TS/erd15crPhqF0xsId3SapDysSYHvv7OHwGS8fbayeX14AfWbGTj/L1XQvwl+B3SqkmGiotKg==
X-Received: by 2002:a25:d80b:: with SMTP id p11mr1614734ybg.506.1593674063431;
 Thu, 02 Jul 2020 00:14:23 -0700 (PDT)
Date:   Thu,  2 Jul 2020 00:14:16 -0700
Message-Id: <20200702071416.1780522-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH] Documentation: kunit: Add naming guidelines
From:   David Gow <davidgow@google.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Randy Dunlap <rd.dunlab@gmail.com>,
        "Theodore Ts'o" <tytso@mit.edu>, Tim Bird <Tim.Bird@sony.com>
Cc:     kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As discussed in [1], KUnit tests have hitherto not had a particularly
consistent naming scheme. This adds documentation outlining how tests
and test suites should be named, including how those names should be
used in Kconfig entries and filenames.

[1]:
https://lore.kernel.org/linux-kselftest/202006141005.BA19A9D3@keescook/t/#u

Signed-off-by: David Gow <davidgow@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
This is a follow-up v1 to the RFC patch here:
https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@go=
ogle.com/T/#u

There weren't any fundamental objections to the naming guidelines
themselves, so nothing's changed on that front.

Otherwise, changes since the RFC:
- Fixed a bit of space/tab confusion in the index (Thanks, Randy)
- Added some more examples (and some test case examples).
- Added some examples of what not to call subsystems and suites.
- No longer explicitly require "If unsure, put N" in Kconfig entries.
- Minor formatting changes.

Cheers,
-- David

 Documentation/dev-tools/kunit/index.rst |   1 +
 Documentation/dev-tools/kunit/style.rst | 181 ++++++++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 Documentation/dev-tools/kunit/style.rst

diff --git a/Documentation/dev-tools/kunit/index.rst b/Documentation/dev-to=
ols/kunit/index.rst
index e93606ecfb01..c234a3ab3c34 100644
--- a/Documentation/dev-tools/kunit/index.rst
+++ b/Documentation/dev-tools/kunit/index.rst
@@ -11,6 +11,7 @@ KUnit - Unit Testing for the Linux Kernel
 	usage
 	kunit-tool
 	api/index
+	style
 	faq
=20
 What is KUnit?
diff --git a/Documentation/dev-tools/kunit/style.rst b/Documentation/dev-to=
ols/kunit/style.rst
new file mode 100644
index 000000000000..8cad2627924c
--- /dev/null
+++ b/Documentation/dev-tools/kunit/style.rst
@@ -0,0 +1,181 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+Test Style and Nomenclature
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+Subsystems, Suites, and Tests
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+In order to make tests as easy to find as possible, they're grouped into s=
uites
+and subsystems. A test suite is a group of tests which test a related area=
 of
+the kernel, and a subsystem is a set of test suites which test different p=
arts
+of the same kernel subsystem or driver.
+
+Subsystems
+----------
+
+Every test suite must belong to a subsystem. A subsystem is a collection o=
f one
+or more KUnit test suites which test the same driver or part of the kernel=
. A
+rule of thumb is that a test subsystem should match a single kernel module=
. If
+the code being tested can't be compiled as a module, in many cases the sub=
system
+should correspond to a directory in the source tree or an entry in the
+MAINTAINERS file. If unsure, follow the conventions set by tests in simila=
r
+areas.
+
+Test subsystems should be named after the code being tested, either after =
the
+module (wherever possible), or after the directory or files being tested. =
Test
+subsystems should be named to avoid ambiguity where necessary.
+
+If a test subsystem name has multiple components, they should be separated=
 by
+underscores. *Do not* include "test" or "kunit" directly in the subsystem =
name
+unless you are actually testing other tests or the kunit framework itself.
+
+Example subsystems could be:
+
+``ext4``
+  Matches the module and filesystem name.
+``apparmor``
+  Matches the module name and LSM name.
+``kasan``
+  Common name for the tool, prominent part of the path ``mm/kasan``
+``snd_hda_codec_hdmi``
+  Has several components (``snd``, ``hda``, ``codec``, ``hdmi``) separated=
 by
+  underscores. Matches the module name.
+
+Avoid names like these:
+
+``linear-ranges``
+  Names should use underscores, not dashes, to separate words. Prefer
+  ``linear_ranges``.
+``qos-kunit-test``
+  As well as using underscores, this name should not have "kunit-test" as =
a
+  suffix, and ``qos`` is ambiguous as a subsystem name. ``power_qos`` woul=
d be a
+  better name.
+``pc_parallel_port``
+  The corresponding module name is ``parport_pc``, so this subsystem shoul=
d also
+  be named ``parport_pc``.
+
+.. note::
+        The KUnit API and tools do not explicitly know about subsystems. T=
hey're
+        simply a way of categorising test suites and naming modules which
+        provides a simple, consistent way for humans to find and run tests=
. This
+        may change in the future, though.
+
+Suites
+------
+
+KUnit tests are grouped into test suites, which cover a specific area of
+functionality being tested. Test suites can have shared initialisation and
+shutdown code which is run for all tests in the suite.
+Not all subsystems will need to be split into multiple test suites (e.g. s=
imple drivers).
+
+Test suites are named after the subsystem they are part of. If a subsystem
+contains several suites, the specific area under test should be appended t=
o the
+subsystem name, separated by an underscore.
+
+The full test suite name (including the subsystem name) should be specifie=
d as
+the ``.name`` member of the ``kunit_suite`` struct, and forms the base for=
 the
+module name (see below).
+
+Example test suites could include:
+
+``ext4_inode``
+  Part of the ``ext4`` subsystem, testing the ``inode`` area.
+``kunit_try_catch``
+  Part of the ``kunit`` implementation itself, testing the ``try_catch`` a=
rea.
+``apparmor_property_entry``
+  Part of the ``apparmor`` subsystem, testing the ``property_entry`` area.
+``kasan``
+  The ``kasan`` subsystem has only one suite, so the suite name is the sam=
e as
+  the subsystem name.
+
+Avoid names like:
+
+``ext4_ext4_inode``
+  There's no reason to state the subsystem twice.
+``property_entry``
+  The suite name is ambiguous without the subsystem name.
+``kasan_unit_test``
+  Because there is only one suite in the ``kasan`` subsystem, the suite sh=
ould
+  just be called ``kasan``. There's no need to redundantly add ``unit_test=
``.
+
+Test Cases
+----------
+
+Individual tests consist of a single function which tests a constrained
+codepath, property, or function. In the test output, individual tests' res=
ults
+will show up as subtests of the suite's results.
+
+Tests should be named after what they're testing. This is often the name o=
f the
+function being tested, with a description of the input or codepath being t=
ested.
+As tests are C functions, they should be named and written in accordance w=
ith
+the kernel coding style.
+
+.. note::
+        As tests are themselves functions, their names cannot conflict wit=
h
+        other C identifiers in the kernel. This may require some creative
+        naming. It's a good idea to make your test functions `static` to a=
void
+        polluting the global namespace.
+
+Example test names include:
+
+``unpack_u32_with_null_name``
+  Tests the ``unpack_u32`` function when a NULL name is passed in.
+``test_list_splice``
+  Tests the ``list_splice`` macro. It has the prefix ``test_`` to avoid a
+  name conflict with the macro itself.
+
+
+Should it be necessary to refer to a test outside the context of its test =
suite,
+the *fully-qualified* name of a test should be the suite name followed by =
the
+test name, separated by a colon (i.e. ``suite:test``).
+
+Test Kconfig Entries
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Every test suite should be tied to a Kconfig entry.
+
+This Kconfig entry must:
+
+* be named ``CONFIG_<name>_KUNIT_TEST``: where <name> is the name of the t=
est
+  suite.
+* be listed either alongside the config entries for the driver/subsystem b=
eing
+  tested, or be under [Kernel Hacking]=E2=86=92[Kernel Testing and Coverag=
e]
+* depend on ``CONFIG_KUNIT``
+* be visible only if ``CONFIG_KUNIT_ALL_TESTS`` is not enabled.
+* have a default value of ``CONFIG_KUNIT_ALL_TESTS``.
+* have a brief description of KUnit in the help text
+
+Unless there's a specific reason not to (e.g. the test is unable to be bui=
lt as
+a module), Kconfig entries for tests should be tristate.
+
+An example Kconfig entry:
+
+.. code-block:: none
+
+        config FOO_KUNIT_TEST
+                tristate "KUnit test for foo" if !KUNIT_ALL_TESTS
+                depends on KUNIT
+                default KUNIT_ALL_TESTS
+                help
+                    This builds unit tests for foo.
+
+                    For more information on KUnit and unit tests in genera=
l, please refer
+                    to the KUnit documentation in Documentation/dev-tools/=
kunit
+
+                    If unsure, say N
+
+
+Test Filenames
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Where possible, test suites should be placed in a separate source file in =
the
+same directory as the code being tested.
+
+This file should be named ``<suite>_kunit.c``. It may make sense to strip
+excessive namespacing from the source filename (e.g., ``firmware_kunit.c``=
 instead of
+``<drivername>_firmware.c``), but please ensure the module name does conta=
in the
+full suite name.
+
+
--=20
2.27.0.212.ge8ba1cc988-goog

