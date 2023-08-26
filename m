Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44208C83F11
	for <linux-doc@archiver.kernel.org>; Sat, 26 Aug 2023 20:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjHZUTE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 26 Aug 2023 16:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjHZUSn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Aug 2023 16:18:43 -0400
Received: from belinda3.kreativmedia.ch (belinda3.kreativmedia.ch [80.74.158.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446EC1AD
        for <linux-doc@vger.kernel.org>; Sat, 26 Aug 2023 13:18:39 -0700 (PDT)
Received: from localhost.localdomain (localhost [127.0.0.1]) by belinda3.kreativmedia.ch (Postfix) with ESMTPSA id 7142952C0D09;
        Sat, 26 Aug 2023 22:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renenyffenegger.ch;
        s=default; t=1693081116;
        bh=Ec7533GMLLWF/m6rKV8DkBLMx+GJdf+tPKLpxxGR1WE=; h=From:To:Subject;
        b=IaJOrTKIoiKq/b2FbUx2HG1cbMAyX6VM6vlZcffMsZKWuxEok4FLkJkdLAr0N670p
         jo8dvnGqmv06SG4W/6ipEsvlpoRuRhlmcpLya1KnzpzILtuPuFivaWcNYZZ/SMNuZw
         zEvOjqu8RbY1vlgugp2H+UzuXmy4YF0mz6tVqx3k=
Authentication-Results: belinda.kreativmedia.ch;
        spf=pass (sender IP is 31.10.136.171) smtp.mailfrom=mail@renenyffenegger.ch smtp.helo=localhost.localdomain
Received-SPF: pass (belinda.kreativmedia.ch: connection is authenticated)
From:   mail@renenyffenegger.ch
To:     linux-doc@vger.kernel.org
Cc:     =?UTF-8?q?Ren=C3=A9=20Nyffenegger?= <mail@renenyffenegger.ch>
Subject: [PATCH] Reference kernel-doc for container_of
Date:   Sat, 26 Aug 2023 22:18:26 +0200
Message-Id: <20230826201826.8407-1-mail@renenyffenegger.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: René Nyffenegger <mail@renenyffenegger.ch>

The file include/linux/container_of.h contained kernel-doc but was not
referenced in any .rst file. In addition, the file
Documentation/core-api/kobject.rst wrongly located the definition
of the macro `container_of` in linux/kernel.h while in reality
it is defined in linux/container_of.h

This patch adds a new .rst file that includes the kernel-doc of
container_of.h and rectifies the wrong reference of the header
file.

Signed-off-by: René Nyffenegger <mail@renenyffenegger.ch>
---
 Documentation/core-api/container_of.rst | 64 +++++++++++++++++++++++++
 Documentation/core-api/index.rst        |  1 +
 Documentation/core-api/kobject.rst      | 58 +++++++++++-----------
 3 files changed, 93 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/core-api/container_of.rst

diff --git a/Documentation/core-api/container_of.rst b/Documentation/core-api/container_of.rst
new file mode 100644
index 000000000000..f063d3f9e536
--- /dev/null
+++ b/Documentation/core-api/container_of.rst
@@ -0,0 +1,64 @@
+=====================================================================================
+Given a pointer to a member of a struct, returning a pointer to the containing struct
+=====================================================================================
+
+.. _container_of:
+
+Overview
+========
+
+The two macros ``container_of`` and ``container_of_const``, defined in ``<include/linux/container_of.h>``, return a pointer to the ``struct`` (i. e. the *container*) from a pointer to a member of this ``struct``.
+
+These macros might be used when :ref:`embedding kobjects<embedding_kobjects>`, but see also :ref:`usage<container_of_usage>`.
+
+
+.. kernel-doc:: include/linux/container_of.h
+
+Usage
+=====
+
+.. _container_of_usage:
+
+The following simple code demonstrates the usage of ``container_of``
+
+.. code-block:: c
+
+ struct inner_struct
+ {
+ 	int abc;
+ 	int def;
+ }
+ 
+ struct container_struct
+ {
+ 	struct inner_struct inner;
+ 	char               *member_xyz;
+ 	int                 member_val;
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
+ static void g(char** member)
+ {
+ 	struct container_struct *cont;
+ 
+ 	cont = container_of(member, struct container_struct, member_xyz);
+        /* Use cont and its members */
+ }
+ 
+ void somewhere()
+ {
+ 	struct container_struct cont;
+ 
+ 	/* Initialize cont */
+ 
+ 	f(& cont.inner      );
+ 	g(& cont.member_xyz );
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
index 7310247310a0..058570694418 100644
--- a/Documentation/core-api/kobject.rst
+++ b/Documentation/core-api/kobject.rst
@@ -49,6 +49,8 @@ approach will be taken, so we'll go back to kobjects.
 Embedding kobjects
 ==================
 
+.. _embedding_kobjects:
+
 It is rare for kernel code to create a standalone kobject, with one major
 exception explained below.  Instead, kobjects are used to control access to
 a larger, domain-specific object.  To this end, kobjects will be found
@@ -66,50 +68,46 @@ their own, but are invariably found embedded in the larger objects of
 interest.)
 
 So, for example, the UIO code in ``drivers/uio/uio.c`` has a structure that
-defines the memory region associated with a uio device::
+defines the memory region associated with a uio device:
 
-    struct uio_map {
-            struct kobject kobj;
-            struct uio_mem *mem;
-    };
+.. code-block:: c
 
-If you have a struct uio_map structure, finding its embedded kobject is
-just a matter of using the kobj member.  Code that works with kobjects will
-often have the opposite problem, however: given a struct kobject pointer,
+ struct uio_map {
+ 	struct kobject kobj;
+ 	struct uio_mem *mem;
+ };
+
+If you have a ``struct uio_map`` structure, finding its embedded kobject is
+just a matter of using the ``kobj`` member.  Code that works with kobjects will
+often have the opposite problem, however: given a ``struct kobject *``,
 what is the pointer to the containing structure?  You must avoid tricks
 (such as assuming that the kobject is at the beginning of the structure)
-and, instead, use the container_of() macro, found in ``<linux/kernel.h>``::
-
-    container_of(ptr, type, member)
+and, instead, use the container_of() macro:
 
-where:
+.. code-block:: c
 
-  * ``ptr`` is the pointer to the embedded kobject,
-  * ``type`` is the type of the containing structure, and
-  * ``member`` is the name of the structure field to which ``pointer`` points.
-
-The return value from container_of() is a pointer to the corresponding
-container type. So, for example, a pointer ``kp`` to a struct kobject
-embedded **within** a struct uio_map could be converted to a pointer to the
-**containing** uio_map structure with::
-
-    struct uio_map *u_map = container_of(kp, struct uio_map, kobj);
+ struct kobject *kp =  ; /* Pointer to a kobj member of a uio_map */
+ struct uio_map *u_map = container_of(kp, struct uio_map, kobj);
 
 For convenience, programmers often define a simple macro for **back-casting**
 kobject pointers to the containing type.  Exactly this happens in the
-earlier ``drivers/uio/uio.c``, as you can see here::
+earlier ``drivers/uio/uio.c``, as you can see here:
 
-    struct uio_map {
-            struct kobject kobj;
-            struct uio_mem *mem;
-    };
+.. code-block:: c
 
-    #define to_map(map) container_of(map, struct uio_map, kobj)
+ struct uio_map {
+ 	struct kobject kobj;
+ 	struct uio_mem *mem;
+ };
+ 
+ #define to_map(map) container_of(map, struct uio_map, kobj)
 
 where the macro argument "map" is a pointer to the struct kobject in
-question.  That macro is subsequently invoked with::
+question.  That macro is subsequently invoked with:
+
+.. code-block:: c
 
-    struct uio_map *map = to_map(kobj);
+ struct uio_map *map = to_map(kobj);
 
 
 Initialization of kobjects
-- 
2.30.2

