Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59CB38945A
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 03:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785296257; cv=none; b=Khw7bvj/a37EQeVgDIeopowwJHJbM2qO8PL9nee32b8r8t++9VI4IpaJE9NL26uAqYjojm3T/aH3O++XeP4Asqju9xjhh204DK3/F726o853GdKytrZJwQ1RGdrC3UyfA0p7fBT4js1nw8GOMeJo9J9MvRtSNYF2+e5Nv7m2cgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785296257; c=relaxed/simple;
	bh=zuhK/+mI0tQrIZ5lPQnTZ5kH/VI8ndeA6+UktakiwnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zho1xrVGnmBKIrj/UTLLA7eeWiqwA7Ob1fTmfnWJta+5LeydH/x0RGiDhQudL1IMAb1DGZ7blk5447Db7DBNmFA62tYq6R8Ldj5eye15BbEsSvU3+c9eTODVbJHriUyJZ006n3efpzfIQG3eLE4Ycxo7G0QVQnZxN/wCzZTg7Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mM+dNNGd; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mM+dNNGd"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848d21bbaffso523348b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 20:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785296255; x=1785901055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAvbwMsP6u3CRel/M6F31lU9QmM+5c0AKpJB0BJsLjQ=;
        b=mM+dNNGdgl5ZP5o1gln4gUN5mAvG+4aXEDcce6yK2uLPI7NPdyIO7ZF2qXbmShVG6+
         cM59ZW0S3ePMTO7+mL6CaffMdusJqS7dcqJKgEsSqDGqlkhnA7oOGV0LtVk6SMrXpQ1j
         KLCexbdWHVpFa+O8NpQ0voxvdePtJKavdfXBrqobuHDik+OImFVMEzbbEQuiLl6IzG0V
         NujRJueeEMcizYH7V5jp7H76nFmLEzLRkuhWTvXWraFl645y9LL/Rb4xOVLlHAQmkgk7
         DQ2lEz97C5ThChBC0/Q7d7dXhwWOfHHFowLtKVPfZCJffzThFkkpw3lcHG+73C8tpyX6
         /VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785296255; x=1785901055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAvbwMsP6u3CRel/M6F31lU9QmM+5c0AKpJB0BJsLjQ=;
        b=fXs5IVE4qLrGUCvA1g1RDF66u/pqkEpnj4Qzv2G1L71G/jw8yXK+awrfp1b2E2CXOI
         pcJUUWUNt7EWiuZaMPceSTqIlL1DbunqSeK+jj0RZ/VNIFxQmXrllZa5RLeY4PzZk9bW
         0TZtHiImAViFzap1WdVCcNq92Joqmy9c5hoGBZJHWXrtcodrZxl/6XonKHfN8qkJreBc
         6ipLNr0T/kurgw+3Bv2YzyU0SBfS9z+J7mPsnM8zFVVC3jbTutkR0EJxYx5Q8Ie3o0QJ
         2YVeZmjRV1lNsHMItZV3oV2uK93Zi4G8he7rxVe3FLPiPN92OueZtOQ/EE3D8SpZ+Ipm
         cgNw==
X-Forwarded-Encrypted: i=1; AHgh+RpSUA1AuJhEFRQzA+GAJaJfeBp9kQEprfwALH/aqf3+Z+9jYEwySt5oUzPDo+jUOkCQPdIppLrrA48=@vger.kernel.org
X-Gm-Message-State: AOJu0YysYLUB+/2UMHBneQ4ispEzrbiV+2vvQfMR2NvfTNLENtbF7d5x
	DrURtbwBNDS3t9zYiHKbE9OpywgqTY76dnJ7TgAuL/C4Isgu0C+Jxbuf
X-Gm-Gg: AR+sD13DMQlxT74n+9Ii2dj1PbcsEP11plyl8EDyxMxMol9XEOuzhLgvRi1ztddpuZ8
	WrzGz67HSlAa6R1Xi4v91h8uCNSwUwfg8kzCcj8yeDMQgO95GFmpm+14U8XO9aVtDUEAbvA3fkw
	Nv+HwMZpDhD3Lyq+BxJCKRiT0ej7m+Bzofx8RZNsWkC56r77nS5Za0+DBN4iF/rXpi33DDm/+4e
	JLtow/wtacWkP2Tc8UaVaFsQlbXVp7aqH3DLUEJxJe91JzqT6TlQCNqjvEMIS+iM6E8BdbbStjY
	4c6gOX829KpCF/E6vlSd+5w20f2+vPl2N4FkfUZr83966JZvSTgsZnNGfP2WZkbhv6JEAExbXCD
	sCCqkuEGPSJqlUN8F1KCw7jHbXE/+rQqv/uYfnVJrwUL+UdpIW3TwoDcGMBUag6wUb+L81fxGJT
	Di335Nw8B9LECO/UUOKdXjCIDu4bzxj3lekfVGXGXFS0Q=
X-Received: by 2002:a05:6a00:400b:b0:847:9386:3ee2 with SMTP id d2e1a72fcca58-84e93264387mr5083267b3a.42.1785296255122;
        Tue, 28 Jul 2026 20:37:35 -0700 (PDT)
Received: from localhost ([2a09:bac5:42f2:1e1e::300:30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb7a99a7dsm282177a12.5.2026.07.28.20.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 20:37:34 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Coiby Xu <coxu@redhat.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 09/10] crash_dump: Disallow configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Date: Wed, 29 Jul 2026 11:36:49 +0800
Message-ID: <20260729033654.311541-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729033654.311541-1-coiby.xu@gmail.com>
References: <20260729033654.311541-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If crash hotplug is supported, dm-crypt keys saved to reserved memory
will be taken care of automatically. Thus it doesn't make sense to use
configfs/crash_dm_crypt_key/reuse. Reserving image->dm_crypt_keys_addr
is also unnecessary. Currently x86_64 and ppc64le have implemented
crash hotplug feature.

Also update the doc accordingly. Note two doc issues are fixed as well.

Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
 kernel/crash_dump_dm_crypt.c              | 23 ++++++++++++++++++++---
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1..0bf2eb100a05 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
-    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
+    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
+    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
     # Add key #1's description
-    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
+    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
 
     # how many keys do we have now?
     cat /sys/kernel/config/crash_dm_crypt_keys/count
@@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
     cat /sys/kernel/config/crash_dm_crypt_keys/count
     2
 
-    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
-    # memory
-    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
-
 2. Load the dump-capture kernel
 
 3. After the dump-capture kerne get booted, restore the keys to user keyring
    echo yes > /sys/kernel/crash_dm_crypt_keys/restore
 
+For CPU/memory hot-plugging, you can reuse keys already saved to reserved
+memory before reloading the kdump image,
+    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
+
+Note if crash hotplug is supported, this API is totally unnecessary thus will
+be disabled automatically.
+
 Contact
 =======
 
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index b5b78656cf06..46d6b31c3ca4 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -310,6 +310,15 @@ static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
 	return sysfs_emit(page, "%d\n", is_dm_key_reused);
 }
 
+static bool crash_hotplug_support(struct kimage *image)
+{
+#ifdef CONFIG_CRASH_HOTPLUG
+	return image->hotplug_support;
+#else
+	return false;
+#endif
+}
+
 static ssize_t config_keys_reuse_store(struct config_item *item,
 					   const char *page, size_t count)
 {
@@ -317,6 +326,11 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 	bool val;
 	int r;
 
+	if (kexec_crash_image && crash_hotplug_support(kexec_crash_image)) {
+		pr_debug("Crash hotplug supported\n");
+		return -EINVAL;
+	}
+
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
 		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory\n");
 		return -EINVAL;
@@ -513,9 +527,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
 {
 	/*
-	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
-	 * keys_header from being cleaned up during unloading when
-	 * is_dm_key_reused=true
+	 * For CPU/memory hot-plugging without CONFIG_CRASH_HOTPLUG, the whole kdump
+	 * image will be reloaded. Prevent keys_header from being cleaned up during
+	 * unloading when is_dm_key_reused=true
 	 */
 	if (!is_dm_key_reused) {
 		kfree_sensitive(keys_header);
@@ -526,6 +540,9 @@ void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
 		mutex_unlock(&config_keys_subsys.su_mutex);
 		mutex_acquired = false;
 	}
+
+	if (crash_hotplug_support(image))
+		image->dm_crypt_keys_addr = 0;
 }
 
 static int __init configfs_dmcrypt_keys_init(void)
-- 
2.55.0

