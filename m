Return-Path: <SRS0=7zml=4H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B933C34047
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 15:01:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46AC8207FD
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 15:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgBSPB5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Feb 2020 10:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55663 "EHLO eggs.gnu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgBSPB4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 Feb 2020 10:01:56 -0500
Received: from fencepost.gnu.org ([2001:470:142:3::e]:39019)
        by eggs.gnu.org with esmtp (Exim 4.71)
        (envelope-from <lxsameer@gnu.org>)
        id 1j4QrK-0000Xt-1y; Wed, 19 Feb 2020 10:01:54 -0500
Received: from [159.253.226.146] (port=47876 helo=localhost.localdomain)
        by fencepost.gnu.org with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.82)
        (envelope-from <lxsameer@gnu.org>)
        id 1j4Qr4-0000Fc-K8; Wed, 19 Feb 2020 10:01:41 -0500
From:   lxsameer@gnu.org
To:     corbet@lwn.net
Cc:     rdunlap@infradead.org, linux-doc@vger.kernel.org,
        Sameer Rahmani <lxsameer@gnu.org>
Subject: [PATCH v2 1/2] Documentation: Converted the `kobject.txt` to rst format
Date:   Wed, 19 Feb 2020 15:02:06 +0000
Message-Id: <20200219150207.2811054-1-lxsameer@gnu.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sameer Rahmani <lxsameer@gnu.org>

Reviewed and converted the `kobject.txt` format to rst in place.

Signed-off-by: Sameer Rahmani <lxsameer@gnu.org>
---
 Documentation/kobject.txt | 80 +++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/Documentation/kobject.txt b/Documentation/kobject.txt
index ff4c25098119..e12c2a309fd3 100644
--- a/Documentation/kobject.txt
+++ b/Documentation/kobject.txt
@@ -3,7 +3,7 @@ Everything you never wanted to know about kobjects, ksets, and ktypes
 =====================================================================
 
 :Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-:Last updated: December 19, 2007
+:Last updated: Feb 18, 2020
 
 Based on an original article by Jon Corbet for lwn.net written October 1,
 2003 and located at http://lwn.net/Articles/51437/
@@ -25,7 +25,7 @@ some terms we will be working with.
    usually embedded within some other structure which contains the stuff
    the code is really interested in.
 
-   No structure should EVER have more than one kobject embedded within it.
+   No structure should **EVER** have more than one kobject embedded within it.
    If it does, the reference counting for the object is sure to be messed
    up and incorrect, and your code will be buggy.  So do not do this.
 
@@ -55,7 +55,7 @@ a larger, domain-specific object.  To this end, kobjects will be found
 embedded in other structures.  If you are used to thinking of things in
 object-oriented terms, kobjects can be seen as a top-level, abstract class
 from which other classes are derived.  A kobject implements a set of
-capabilities which are not particularly useful by themselves, but which are
+capabilities which are not particularly useful by themselves, but are
 nice to have in other objects.  The C language does not allow for the
 direct expression of inheritance, so other techniques - such as structure
 embedding - must be used.
@@ -65,12 +65,12 @@ this is analogous as to how "list_head" structs are rarely useful on
 their own, but are invariably found embedded in the larger objects of
 interest.)
 
-So, for example, the UIO code in drivers/uio/uio.c has a structure that
+So, for example, the UIO code in ``drivers/uio/uio.c`` has a structure that
 defines the memory region associated with a uio device::
 
     struct uio_map {
-	struct kobject kobj;
-	struct uio_mem *mem;
+            struct kobject kobj;
+            struct uio_mem *mem;
     };
 
 If you have a struct uio_map structure, finding its embedded kobject is
@@ -78,30 +78,30 @@ just a matter of using the kobj member.  Code that works with kobjects will
 often have the opposite problem, however: given a struct kobject pointer,
 what is the pointer to the containing structure?  You must avoid tricks
 (such as assuming that the kobject is at the beginning of the structure)
-and, instead, use the container_of() macro, found in <linux/kernel.h>::
+and, instead, use the container_of() macro, found in ``<linux/kernel.h>``::
 
     container_of(pointer, type, member)
 
 where:
 
-  * "pointer" is the pointer to the embedded kobject,
-  * "type" is the type of the containing structure, and
-  * "member" is the name of the structure field to which "pointer" points.
+  * ``pointer`` is the pointer to the embedded kobject,
+  * ``type`` is the type of the containing structure, and
+  * ``member`` is the name of the structure field to which ``pointer`` points.
 
 The return value from container_of() is a pointer to the corresponding
-container type. So, for example, a pointer "kp" to a struct kobject
-embedded *within* a struct uio_map could be converted to a pointer to the
+container type. So, for example, a pointer ``kp`` to a struct kobject
+embedded **within** a struct uio_map could be converted to a pointer to the
 *containing* uio_map structure with::
 
     struct uio_map *u_map = container_of(kp, struct uio_map, kobj);
 
-For convenience, programmers often define a simple macro for "back-casting"
+For convenience, programmers often define a simple macro for **back-casting**
 kobject pointers to the containing type.  Exactly this happens in the
-earlier drivers/uio/uio.c, as you can see here::
+earlier ``drivers/uio/uio.c``, as you can see here::
 
     struct uio_map {
-        struct kobject kobj;
-        struct uio_mem *mem;
+            struct kobject kobj;
+            struct uio_mem *mem;
     };
 
     #define to_map(map) container_of(map, struct uio_map, kobj)
@@ -125,7 +125,7 @@ must have an associated kobj_type.  After calling kobject_init(), to
 register the kobject with sysfs, the function kobject_add() must be called::
 
     int kobject_add(struct kobject *kobj, struct kobject *parent,
-		    const char *fmt, ...);
+                    const char *fmt, ...);
 
 This sets up the parent of the kobject and the name for the kobject
 properly.  If the kobject is to be associated with a specific kset,
@@ -172,13 +172,13 @@ call to kobject_uevent()::
 
     int kobject_uevent(struct kobject *kobj, enum kobject_action action);
 
-Use the KOBJ_ADD action for when the kobject is first added to the kernel.
+Use the **KOBJ_ADD** action for when the kobject is first added to the kernel.
 This should be done only after any attributes or children of the kobject
 have been initialized properly, as userspace will instantly start to look
 for them when this call happens.
 
 When the kobject is removed from the kernel (details on how to do that are
-below), the uevent for KOBJ_REMOVE will be automatically created by the
+below), the uevent for **KOBJ_REMOVE** will be automatically created by the
 kobject core, so the caller does not have to worry about doing that by
 hand.
 
@@ -228,7 +228,7 @@ This function will create a kobject and place it in sysfs in the location
 underneath the specified parent kobject.  To create simple attributes
 associated with this kobject, use::
 
-    int sysfs_create_file(struct kobject *kobj, struct attribute *attr);
+    static inline int sysfs_create_files(struct kobject *kobj, const struct attribute * const *attr);
 
 or::
 
@@ -238,7 +238,7 @@ Both types of attributes used here, with a kobject that has been created
 with the kobject_create_and_add(), can be of type kobj_attribute, so no
 special custom attribute is needed to be created.
 
-See the example module, samples/kobject/kobject-example.c for an
+See the example module, ``samples/kobject/kobject-example.c`` for an
 implementation of a simple kobject and attributes.
 
 
@@ -270,10 +270,10 @@ such a method has a form like::
 
     void my_object_release(struct kobject *kobj)
     {
-    	    struct my_object *mine = container_of(kobj, struct my_object, kobj);
+            struct my_object *mine = container_of(kobj, struct my_object, kobj);
 
-	    /* Perform any additional cleanup on this object, then... */
-	    kfree(mine);
+            /* Perform any additional cleanup on this object, then... */
+            kfree(mine);
     }
 
 One important point cannot be overstated: every kobject must have a
@@ -297,11 +297,11 @@ instead, it is associated with the ktype. So let us introduce struct
 kobj_type::
 
     struct kobj_type {
-	    void (*release)(struct kobject *kobj);
-	    const struct sysfs_ops *sysfs_ops;
-	    struct attribute **default_attrs;
-	    const struct kobj_ns_type_operations *(*child_ns_type)(struct kobject *kobj);
-	    const void *(*namespace)(struct kobject *kobj);
+            void (*release)(struct kobject *kobj);
+            const struct sysfs_ops *sysfs_ops;
+            struct attribute **default_attrs;
+            const struct kobj_ns_type_operations *(*child_ns_type)(struct kobject *kobj);
+            const void *(*namespace)(struct kobject *kobj);
     };
 
 This structure is used to describe a particular type of kobject (or, more
@@ -352,8 +352,8 @@ created and never declared statically or on the stack.  To create a new
 kset use::
 
   struct kset *kset_create_and_add(const char *name,
-				   struct kset_uevent_ops *u,
-				   struct kobject *parent);
+                                   struct kset_uevent_ops *u,
+                                   struct kobject *parent);
 
 When you are finished with the kset, call::
 
@@ -365,16 +365,16 @@ Because other references to the kset may still exist, the release may happen
 after kset_unregister() returns.
 
 An example of using a kset can be seen in the
-samples/kobject/kset-example.c file in the kernel tree.
+``samples/kobject/kset-example.c`` file in the kernel tree.
 
 If a kset wishes to control the uevent operations of the kobjects
 associated with it, it can use the struct kset_uevent_ops to handle it::
 
   struct kset_uevent_ops {
-        int (*filter)(struct kset *kset, struct kobject *kobj);
-        const char *(*name)(struct kset *kset, struct kobject *kobj);
-        int (*uevent)(struct kset *kset, struct kobject *kobj,
-                      struct kobj_uevent_env *env);
+          int (*filter)(struct kset *kset, struct kobject *kobj);
+          const char *(*name)(struct kset *kset, struct kobject *kobj);
+          int (*uevent)(struct kset *kset, struct kobject *kobj,
+                        struct kobj_uevent_env *env);
   };
 
 
@@ -408,8 +408,8 @@ Kobject removal
 After a kobject has been registered with the kobject core successfully, it
 must be cleaned up when the code is finished with it.  To do that, call
 kobject_put().  By doing this, the kobject core will automatically clean up
-all of the memory allocated by this kobject.  If a KOBJ_ADD uevent has been
-sent for the object, a corresponding KOBJ_REMOVE uevent will be sent, and
+all of the memory allocated by this kobject.  If a ``KOBJ_ADD`` uevent has been
+sent for the object, a corresponding ``KOBJ_REMOVE`` uevent will be sent, and
 any other sysfs housekeeping will be handled for the caller properly.
 
 If you need to do a two-stage delete of the kobject (say you are not
@@ -430,5 +430,5 @@ Example code to copy from
 =========================
 
 For a more complete example of using ksets and kobjects properly, see the
-example programs samples/kobject/{kobject-example.c,kset-example.c},
-which will be built as loadable modules if you select CONFIG_SAMPLE_KOBJECT.
+example programs ``samples/kobject/{kobject-example.c,kset-example.c}``,
+which will be built as loadable modules if you select ``CONFIG_SAMPLE_KOBJECT``.
-- 
2.25.0

