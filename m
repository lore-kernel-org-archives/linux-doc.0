Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A3DCA0FE2
	for <linux-doc@archiver.kernel.org>; Tue,  5 Sep 2023 16:24:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350488AbjIEQYt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354390AbjIELRF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Sep 2023 07:17:05 -0400
Received: from belinda3.kreativmedia.ch (belinda3.kreativmedia.ch [80.74.158.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AEA1AB
        for <linux-doc@vger.kernel.org>; Tue,  5 Sep 2023 04:16:59 -0700 (PDT)
Received: from localhost.localdomain (localhost [127.0.0.1]) by belinda3.kreativmedia.ch (Postfix) with ESMTPSA id 78B6152C1C91;
        Tue,  5 Sep 2023 13:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renenyffenegger.ch;
        s=default; t=1693912616;
        bh=QOzMwHDTPiB5SuWrQSq0/Zf3HZAIGV+JSdjrJDUhRKs=; h=From:To:Subject;
        b=Ira2ed5tBXXutqyuLm5wBhqeclHc+FAzfiQtbbf3zKxb6OkNInasgVaskHMNq5O0S
         /RnIyUSx0pvNgAQYWZy8vpdSpZoQ5A25FTgvrFYRgeEGTNxp7rEqKYciwuUxPf6hZS
         I1+mK6aOZsGmr4bC3UpWTEwdPhre6uXmvad8iG+g=
Authentication-Results: belinda.kreativmedia.ch;
        spf=pass (sender IP is 31.10.136.170) smtp.mailfrom=mail@renenyffenegger.ch smtp.helo=localhost.localdomain
Received-SPF: pass (belinda.kreativmedia.ch: connection is authenticated)
From:   =?UTF-8?q?Ren=C3=A9=20Nyffenegger?= <mail@renenyffenegger.ch>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?Ren=C3=A9=20Nyffenegger?= <mail@renenyffenegger.ch>
Subject: [PATCH] Documentation: Reference kernel-doc for container_of
Date:   Tue,  5 Sep 2023 13:16:52 +0200
Message-Id: <20230905111652.32692-1-mail@renenyffenegger.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The file include/linux/container_of.h contained kernel-doc but was not
referenced in any .rst file. In addition, the file
Documentation/core-api/kobject.rst wrongly located the definition
of the macro `container_of` in linux/kernel.h while in reality
it is defined in linux/container_of.h

This patch
  1) tries to implement Jonathan Corbet's feedback and suggestions
     of v1, see
        https://lore.kernel.org/linux-doc/87ledqm0qs.fsf@meer.lwn.net/
  2) adds a container_of.rst file that includes the kernel-doc of
     container_of.h
  3) removes the reference of the wrong header file
  4) removes some explanatory notes on the usage of
     container_of in kobject.rst as this is now covered in
     container_of.rst

Signed-off-by: René Nyffenegger <mail@renenyffenegger.ch>
---
 Documentation/core-api/container_of.rst | 54 +++++++++++++++++++++++++
 Documentation/core-api/index.rst        |  1 +
 Documentation/core-api/kobject.rst      | 17 +++-----
 3 files changed, 60 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/core-api/container_of.rst

diff --git a/Documentation/core-api/container_of.rst b/Documentation/core-api/container_of.rst
new file mode 100644
index 000000000000..b7d273ccf6fa
--- /dev/null
+++ b/Documentation/core-api/container_of.rst
@@ -0,0 +1,54 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============================================================================
+Given a pointer to a member of a struct, get a pointer to the containing struct
+===============================================================================
+
+Overview
+========
+
+The two macros container_of and container_of_const, defined in
+``<include/linux/container_of.h>``, return a pointer to the ``struct``
+(i. e. the *container*) from a pointer to a member of this ``struct``. A
+contrived example is provided below.
+
+.. kernel-doc:: include/linux/container_of.h
+
+Usage
+=====
+
+The following simple code demonstrates the usage of ``container_of``
+
+.. code-block:: c
+
+ struct inner_struct {
+ 	int abc;
+ 	int def;
+ }
+ 
+ struct container_struct {
+ 	struct inner_struct inner;
+ 	char               *foo;
+ 	int                 bar;
+ };
+ 
+ static void f(struct inner_struct *inr)
+ {
+ 	struct container_struct *cont;
+ 
+ 	cont = container_of(inr, struct container_struct, inner);
+ 
+        /* Use cont and its members */
+ }
+ 
+ 
+ void somewhere()
+ {
+ 	struct container_struct cont;
+ 
+ 	cont.inner = ...
+        cont.foo   = ...
+        cont.bar   = ...
+ 
+ 	f(&cont.inner);
+ }
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 7a3a08d81f11..595af47d0d5f 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -37,6 +37,7 @@ Library functionality that is used throughout the kernel.
    kref
    assoc_array
    xarray
+   container_of
    maple_tree
    idr
    circular-buffers
diff --git a/Documentation/core-api/kobject.rst b/Documentation/core-api/kobject.rst
index 7310247310a0..fac4c359e2ce 100644
--- a/Documentation/core-api/kobject.rst
+++ b/Documentation/core-api/kobject.rst
@@ -78,22 +78,15 @@ just a matter of using the kobj member.  Code that works with kobjects will
 often have the opposite problem, however: given a struct kobject pointer,
 what is the pointer to the containing structure?  You must avoid tricks
 (such as assuming that the kobject is at the beginning of the structure)
-and, instead, use the container_of() macro, found in ``<linux/kernel.h>``::
+and, instead, use the container_of() macro which returns a pointer to the
+corresponding container type.
 
-    container_of(ptr, type, member)
-
-where:
-
-  * ``ptr`` is the pointer to the embedded kobject,
-  * ``type`` is the type of the containing structure, and
-  * ``member`` is the name of the structure field to which ``pointer`` points.
-
-The return value from container_of() is a pointer to the corresponding
-container type. So, for example, a pointer ``kp`` to a struct kobject
+So, for example, a pointer ``kp`` to a struct kobject
 embedded **within** a struct uio_map could be converted to a pointer to the
 **containing** uio_map structure with::
 
-    struct uio_map *u_map = container_of(kp, struct uio_map, kobj);
+ struct kobject *kp = ... ; /* Pointer to a kobj member of a uio_map */
+ struct uio_map *u_map = container_of(kp, struct uio_map, kobj);
 
 For convenience, programmers often define a simple macro for **back-casting**
 kobject pointers to the containing type.  Exactly this happens in the
-- 
2.30.2

