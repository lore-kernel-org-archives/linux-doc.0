Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A83DC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 24 Dec 2021 23:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhLXXOW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Dec 2021 18:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhLXXOV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Dec 2021 18:14:21 -0500
Received: from mail-lf1-x14a.google.com (mail-lf1-x14a.google.com [IPv6:2a00:1450:4864:20::14a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBB4C061401
        for <linux-doc@vger.kernel.org>; Fri, 24 Dec 2021 15:14:21 -0800 (PST)
Received: by mail-lf1-x14a.google.com with SMTP id k25-20020a056512331900b004259a8d8090so3014790lfe.12
        for <linux-doc@vger.kernel.org>; Fri, 24 Dec 2021 15:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=oNyqkv0x9nce+5U2QaNiiB/WWILTNow/SIKSzxsUag8=;
        b=LE0ewZB9BFzFW1AdJLU423u4P00OudDfJqKb9Bfi5ilT0gZuE3ssIpb56pMZypTSfC
         K/dWKNTmXfE2Kbac5O84YbcsEip+NRI9xBktbobXgNoULu82Gmk26z4tv8ES0uir8nQE
         fXXNkObrGp4/YjReykhTJqLYA+eojsoLyqg98vJ/4SEFMai1hSte55UMZQ0J0FRUSBQ8
         sKA0UrOEGiyBaxMLIOax5TYI7aR0O8oTgK+F4f8+zD55ymcAVcOelTDZonnEeRvNoyBx
         /jM//L/dul70lzqvx3kmEBJGhI5DBdMBur3nhbjUqWZlE7XRtPI8v51ju94JszjxtUMm
         vPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=oNyqkv0x9nce+5U2QaNiiB/WWILTNow/SIKSzxsUag8=;
        b=x/MbnvSzkYuegK6MNbbAhLgAbJTTRIMZDBDafO61g+vqqF2t2Z3IjxtfMIbdxmfh9C
         xGW9Leat9Fq+loyRgWBXNLmI0EY29KtCMSVP9tebxODKQccBP1B7+GhRGBA6WFUidckG
         95dY990xAu/iy70aC3S5ilUEcLFLjOpxJYS1/ZzIDfDJJMTgat+NexWHeBhrtctzC3wH
         wkWq3e7W+J9J+JP3fzZPtvpIu/Nf+UZG1yS3B14P7xYWDbfqIXhUEqnKTq/dWXbniq2x
         U102ZeTHnxmVnlOI4fll3YzahW8whV5/jZI9NJoqy6uaafh1V6tDwU90NwGz5Ak1/Rdh
         3TOg==
X-Gm-Message-State: AOAM531TCUdCuRIt1uvzL6JOQGlEI6JUXwu3+0PvHm7fqVoAB6LHqRor
        3IMBG/OyZI2RcyyKYHoCQuJ6t1ribzBE
X-Google-Smtp-Source: ABdhPJw7qoaQUoPWj1s8Uz6+nP1r07VMyxvpKv1DMI+2epqdm11pkKqrN3V7/bhUBdOxvsTlNafIDH1A8UY+TQ==
X-Received: from wedsonaf2.lon.corp.google.com ([2a00:79e0:d:209:bb02:2c42:5a8e:a552])
 (user=wedsonaf job=sendgmr) by 2002:a05:6512:2626:: with SMTP id
 bt38mr6835386lfb.255.1640387659071; Fri, 24 Dec 2021 15:14:19 -0800 (PST)
Date:   Fri, 24 Dec 2021 23:13:45 +0000
Message-Id: <20211224231345.777370-1-wedsonaf@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH] driver core: make kobj_type constant.
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This way instances of kobj_type (which contain function pointers) can be
stored in .rodata, which means that they cannot be [easily/accidentally]
modified at runtime.

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
---
 Documentation/core-api/kobject.rst | 4 ++--
 drivers/base/bus.c                 | 2 +-
 drivers/base/core.c                | 2 +-
 include/linux/kobject.h            | 8 ++++----
 kernel/params.c                    | 2 +-
 lib/kobject.c                      | 8 ++++----
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/core-api/kobject.rst b/Documentation/core-api/kobject.rst
index 2739f8b72575..d3b5bf9f643a 100644
--- a/Documentation/core-api/kobject.rst
+++ b/Documentation/core-api/kobject.rst
@@ -118,7 +118,7 @@ Initialization of kobjects
 Code which creates a kobject must, of course, initialize that object. Some
 of the internal fields are setup with a (mandatory) call to kobject_init()::
 
-    void kobject_init(struct kobject *kobj, struct kobj_type *ktype);
+    void kobject_init(struct kobject *kobj, const struct kobj_type *ktype);
 
 The ktype is required for a kobject to be created properly, as every kobject
 must have an associated kobj_type.  After calling kobject_init(), to
@@ -156,7 +156,7 @@ kobject_name()::
 There is a helper function to both initialize and add the kobject to the
 kernel at the same time, called surprisingly enough kobject_init_and_add()::
 
-    int kobject_init_and_add(struct kobject *kobj, struct kobj_type *ktype,
+    int kobject_init_and_add(struct kobject *kobj, const struct kobj_type *ktype,
                              struct kobject *parent, const char *fmt, ...);
 
 The arguments are the same as the individual kobject_init() and
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index bdc98c5713d5..a64454f5f8c0 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -165,7 +165,7 @@ static struct kobj_type bus_ktype = {
 
 static int bus_uevent_filter(struct kset *kset, struct kobject *kobj)
 {
-	struct kobj_type *ktype = get_ktype(kobj);
+	const struct kobj_type *ktype = get_ktype(kobj);
 
 	if (ktype == &bus_ktype)
 		return 1;
diff --git a/drivers/base/core.c b/drivers/base/core.c
index fd034d742447..d712ea11066b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2263,7 +2263,7 @@ static struct kobj_type device_ktype = {
 
 static int dev_uevent_filter(struct kset *kset, struct kobject *kobj)
 {
-	struct kobj_type *ktype = get_ktype(kobj);
+	const struct kobj_type *ktype = get_ktype(kobj);
 
 	if (ktype == &device_ktype) {
 		struct device *dev = kobj_to_dev(kobj);
diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index c740062b4b1a..683172b2e094 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -66,7 +66,7 @@ struct kobject {
 	struct list_head	entry;
 	struct kobject		*parent;
 	struct kset		*kset;
-	struct kobj_type	*ktype;
+	const struct kobj_type	*ktype;
 	struct kernfs_node	*sd; /* sysfs directory entry */
 	struct kref		kref;
 #ifdef CONFIG_DEBUG_KOBJECT_RELEASE
@@ -90,13 +90,13 @@ static inline const char *kobject_name(const struct kobject *kobj)
 	return kobj->name;
 }
 
-extern void kobject_init(struct kobject *kobj, struct kobj_type *ktype);
+extern void kobject_init(struct kobject *kobj, const struct kobj_type *ktype);
 extern __printf(3, 4) __must_check
 int kobject_add(struct kobject *kobj, struct kobject *parent,
 		const char *fmt, ...);
 extern __printf(4, 5) __must_check
 int kobject_init_and_add(struct kobject *kobj,
-			 struct kobj_type *ktype, struct kobject *parent,
+			 const struct kobj_type *ktype, struct kobject *parent,
 			 const char *fmt, ...);
 
 extern void kobject_del(struct kobject *kobj);
@@ -217,7 +217,7 @@ static inline void kset_put(struct kset *k)
 	kobject_put(&k->kobj);
 }
 
-static inline struct kobj_type *get_ktype(struct kobject *kobj)
+static inline const struct kobj_type *get_ktype(struct kobject *kobj)
 {
 	return kobj->ktype;
 }
diff --git a/kernel/params.c b/kernel/params.c
index 8299bd764e42..9b90e3c4d3c0 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -928,7 +928,7 @@ static const struct sysfs_ops module_sysfs_ops = {
 
 static int uevent_filter(struct kset *kset, struct kobject *kobj)
 {
-	struct kobj_type *ktype = get_ktype(kobj);
+	const struct kobj_type *ktype = get_ktype(kobj);
 
 	if (ktype == &module_ktype)
 		return 1;
diff --git a/lib/kobject.c b/lib/kobject.c
index 4a56f519139d..56fa037501b5 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -65,7 +65,7 @@ void kobject_get_ownership(struct kobject *kobj, kuid_t *uid, kgid_t *gid)
  */
 static int populate_dir(struct kobject *kobj)
 {
-	struct kobj_type *t = get_ktype(kobj);
+	const struct kobj_type *t = get_ktype(kobj);
 	struct attribute *attr;
 	int error = 0;
 	int i;
@@ -346,7 +346,7 @@ EXPORT_SYMBOL(kobject_set_name);
  * to kobject_put(), not by a call to kfree directly to ensure that all of
  * the memory is cleaned up properly.
  */
-void kobject_init(struct kobject *kobj, struct kobj_type *ktype)
+void kobject_init(struct kobject *kobj, const struct kobj_type *ktype)
 {
 	char *err_str;
 
@@ -461,7 +461,7 @@ EXPORT_SYMBOL(kobject_add);
  * same type of error handling after a call to kobject_add() and kobject
  * lifetime rules are the same here.
  */
-int kobject_init_and_add(struct kobject *kobj, struct kobj_type *ktype,
+int kobject_init_and_add(struct kobject *kobj, const struct kobj_type *ktype,
 			 struct kobject *parent, const char *fmt, ...)
 {
 	va_list args;
@@ -679,7 +679,7 @@ EXPORT_SYMBOL(kobject_get_unless_zero);
 static void kobject_cleanup(struct kobject *kobj)
 {
 	struct kobject *parent = kobj->parent;
-	struct kobj_type *t = get_ktype(kobj);
+	const struct kobj_type *t = get_ktype(kobj);
 	const char *name = kobj->name;
 
 	pr_debug("kobject: '%s' (%p): %s, parent %p\n",
-- 
2.34.1.448.ga2b2bfdf31-goog

