Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A110156C63
	for <linux-doc@vger.kernel.org>; Fri,  2 May 2025 01:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148388; cv=none; b=ui2PUs1jj66QMEfWu1Tm4LPgQ8lyRH0hGu+sRiSX/jIzC5698cS7Vi61hTDgYqqBvhJ6e68LF7uGLiKFzAgeY+Z6wqqYe47/ktLgZjaTgAnWU9uH6uQDbGZct6WHytD4eKLNsMy3soezVEcgLzJIHtgt8De3VwZikEo3w4AziK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148388; c=relaxed/simple;
	bh=ea9mZ0fMYc8H3dNJtS8bA7Qklp+AW/Cq46IXI50ntpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n6vyzYjX1XpmR9m6c73Z+0uYcOlGGsHIicoQbOhE8Jfc2YW6mq0RiTPEuBl2TqRJttNPpWD+0LbSxevNR2x5mIIrsWLtb8zIMjBtE+UZHYPfTw5nzNzGJPMdo8nOEJEmoea9M88Y1BdSZ4Y0l2MxmDrprUrTgYqmwQqqOA7ml3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W3LYI0fT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W3LYI0fT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746148385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vw3CvT79Q3cOVUn1o5X1aSl+i2HC2zO/yQ3kCtIdex0=;
	b=W3LYI0fTMQehrwKsrKo4RDZzXQpHusQ4Qu2Mi28HYEY3WrNjgb9AeSryZ49dvBcgUzzSY6
	B2e169S+WfJY2Vmw23h9+6j8uBAS+bjhDY+IXXB+xHFzNiuSTcc/cH3b6JZH5+h/O4eYK6
	iCaMa+r2B6tSPZYz0Nd8Sp5AqtPG4FE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-QtW6Ch4HNNijXfr2V-qCDw-1; Thu, 01 May 2025 21:13:04 -0400
X-MC-Unique: QtW6Ch4HNNijXfr2V-qCDw-1
X-Mimecast-MFC-AGG-ID: QtW6Ch4HNNijXfr2V-qCDw_1746148383
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73e0094706bso2250051b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 18:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148383; x=1746753183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vw3CvT79Q3cOVUn1o5X1aSl+i2HC2zO/yQ3kCtIdex0=;
        b=NVBp0urmg565ZJUdf9lOwKyNzAnoPLfPlPE8/NENCLxZpDSFJSVAlhpdOrWH6/UGt3
         JpSXByEIGgryZvsXLNXRgJx9R0DKGDiyE2AisVCU0fMXaHW1DpT1d4ced4H+s4wZCaEN
         whn+O0pcIZJ+i0JlE3wQdvDtfu4UNKC+m6uAXPgHdZoZKfUFPQZzxT2SGcw2I9OV9pC1
         BYnB+Fokkq+DmSkFgFqTZqshy450m6D8OtHKbkWCZuiwpiQUjVYcIdJ56RAKMO0xVMQO
         47/LcdXjaswyl3iWAjNqo3S+Favvd/lxSw20WBzDHB6CpDa7XToythNTb85ZW3LSmEwx
         OWgA==
X-Forwarded-Encrypted: i=1; AJvYcCWObC6CRSRQAJ0XAOzekmVFwf/K36vwlzBWI3hjs/6ZPB1mZTcZ8geGNC+PAmV9Rdhe0+7o39KXgys=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyKudiizgiOXRbKe0vAXq+re5ogwxfGHNh1rmQRUNaa4jcyDk2
	+/6ShsuDKKAS8dqlnP01r2lfeWYorlDszoQ4+fR3g7o5s5OVvq37rAsyHHFmlozOX9s0Z/Lmn6R
	LEQ0tpKuzcwBmR0Uw9nN4fCreBoqeWQf1OdbZKQCXxjoP3UaP33/mt4lPdg==
X-Gm-Gg: ASbGncv+BGU14JOZnkLpfr/hf6XZzzhtWGVOmxjc2aB8c3NK7NXr85LyLncKgf3st8S
	As2WXcmfbtiNn68wk96TS/9Q6nG5gLufJYGG/1Z44LAsVBc5B9alkReVZR2nkqbCx7g+noYXgoq
	PdbfON7VZ4J9A6akULLKrakIV3O6ASPbSjM0i7SZUMCvssYNYAriEmU7TzSY7wPBDXuau7MRJvn
	4u2Wf3ao73hO6yl4jJ3PyqjK1t1Hlec6DFGRmu8b2ygQTmazWsMeT+T//uQE14VlsE4zjOHKrE7
	sw0=
X-Received: by 2002:a05:6a00:4098:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-74058b1fd7dmr1448472b3a.21.1746148383160;
        Thu, 01 May 2025 18:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuA9DqPILPKQxZdcEH9QQNdT7mY4hktCyGDXZmoD7ZwVzoWJjEAELCZGpGm7+EPHwHStwhEA==
X-Received: by 2002:a05:6a00:4098:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-74058b1fd7dmr1448445b3a.21.1746148382793;
        Thu, 01 May 2025 18:13:02 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058deb363sm342932b3a.73.2025.05.01.18.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:13:02 -0700 (PDT)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org
Cc: Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Dave Hansen <dave.hansen@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vivek Goyal <vgoyal@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v9 2/8] crash_dump: make dm crypt keys persist for the kdump kernel
Date: Fri,  2 May 2025 09:12:36 +0800
Message-ID: <20250502011246.99238-3-coxu@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502011246.99238-1-coxu@redhat.com>
References: <20250502011246.99238-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A configfs /sys/kernel/config/crash_dm_crypt_keys is provided for user
space to make the dm crypt keys persist for the kdump kernel. Take the
case of dumping to a LUKS-encrypted target as an example, here is the
life cycle of the kdump copies of LUKS volume keys,

 1. After the 1st kernel loads the initramfs during boot, systemd uses
    an user-input passphrase to de-crypt the LUKS volume keys or simply
    TPM-sealed volume keys and then save the volume keys to specified
    keyring (using the --link-vk-to-keyring API) and the keys will expire
    within specified time.

 2. A user space tool (kdump initramfs loader like kdump-utils) create
    key items inside /sys/kernel/config/crash_dm_crypt_keys to inform
    the 1st kernel which keys are needed.

 3. When the kdump initramfs is loaded by the kexec_file_load
    syscall, the 1st kernel will iterate created key items, save the
    keys to kdump reserved memory.

 4. When the 1st kernel crashes and the kdump initramfs is booted, the
    kdump initramfs asks the kdump kernel to create a user key using the
    key stored in kdump reserved memory by writing yes to
    /sys/kernel/crash_dm_crypt_keys/restore. Then the LUKS encrypted
    device is unlocked with libcryptsetup's --volume-key-keyring API.

 5. The system gets rebooted to the 1st kernel after dumping vmcore to
    the LUKS encrypted device is finished

Eventually the keys have to stay in the kdump reserved memory for the
kdump kernel to unlock encrypted volumes. During this process, some
measures like letting the keys expire within specified time are
desirable to reduce security risk.

This patch assumes,
1) there are 128 LUKS devices at maximum to be unlocked thus
   MAX_KEY_NUM=128.

2) a key description won't exceed 128 bytes thus KEY_DESC_MAX_LEN=128.

And here is a demo on how to interact with
/sys/kernel/config/crash_dm_crypt_keys,

    # Add key #1
    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
    # Add key #1's description
    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description

    # how many keys do we have now?
    cat /sys/kernel/config/crash_dm_crypt_keys/count
    1

    # Add key# 2 in the same way

    # how many keys do we have now?
    cat /sys/kernel/config/crash_dm_crypt_keys/count
    2

    # the tree structure of /crash_dm_crypt_keys configfs
    tree /sys/kernel/config/crash_dm_crypt_keys/
    /sys/kernel/config/crash_dm_crypt_keys/
    ├── 7d26b7b4-e342-4d2d-b660-7426b0996720
    │   └── description
    ├── count
    ├── fce2cd38-4d59-4317-8ce2-1fd24d52c46a
    │   └── description

Signed-off-by: Coiby Xu <coxu@redhat.com>
Acked-by: Baoquan He <bhe@redhat.com>
---
 Documentation/admin-guide/kdump/kdump.rst |  28 ++++
 kernel/Kconfig.kexec                      |  11 ++
 kernel/Makefile                           |   1 +
 kernel/crash_dump_dm_crypt.c              | 154 ++++++++++++++++++++++
 4 files changed, 194 insertions(+)
 create mode 100644 kernel/crash_dump_dm_crypt.c

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 1f7f14c6e184..b74d3bed8fff 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -547,6 +547,34 @@ from within add_taint() whenever the value set in this bitmask matches with the
 bit flag being set by add_taint().
 This will cause a kdump to occur at the add_taint()->panic() call.
 
+Write the dump file to encrypted disk volume
+============================================
+
+CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
+encrypted disk volume. User space can interact with
+/sys/kernel/config/crash_dm_crypt_keys for setup,
+
+1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
+    # Add key #1
+    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
+    # Add key #1's description
+    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
+
+    # how many keys do we have now?
+    cat /sys/kernel/config/crash_dm_crypt_keys/count
+    1
+
+    # Add key #2 in the same way
+
+    # how many keys do we have now?
+    cat /sys/kernel/config/crash_dm_crypt_keys/count
+    2
+
+2. Load the dump-capture kernel
+
+3. After the dump-capture kerne get booted, restore the keys to user keyring
+   echo yes > /sys/kernel/crash_dm_crypt_keys/restore
+
 Contact
 =======
 
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 4d111f871951..0a8fafd247d1 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -116,6 +116,17 @@ config CRASH_DUMP
 	  For s390, this option also enables zfcpdump.
 	  See also <file:Documentation/arch/s390/zfcpdump.rst>
 
+config CRASH_DM_CRYPT
+	bool "Support saving crash dump to dm-crypt encrypted volume"
+	depends on KEXEC_FILE
+	depends on CRASH_DUMP
+	depends on DM_CRYPT
+	depends on CONFIGFS_FS
+	help
+	  With this option enabled, user space can intereact with
+	  /sys/kernel/config/crash_dm_crypt_keys to make the dm crypt keys
+	  persistent for the dump-capture kernel.
+
 config CRASH_HOTPLUG
 	bool "Update the crash elfcorehdr on system configuration changes"
 	default y
diff --git a/kernel/Makefile b/kernel/Makefile
index 434929de17ef..c7d3793107e5 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_VMCORE_INFO) += vmcore_info.o elfcorehdr.o
 obj-$(CONFIG_CRASH_RESERVE) += crash_reserve.o
 obj-$(CONFIG_KEXEC_CORE) += kexec_core.o
 obj-$(CONFIG_CRASH_DUMP) += crash_core.o
+obj-$(CONFIG_CRASH_DM_CRYPT) += crash_dump_dm_crypt.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
 obj-$(CONFIG_KEXEC_ELF) += kexec_elf.o
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
new file mode 100644
index 000000000000..62a3c47d8b3b
--- /dev/null
+++ b/kernel/crash_dump_dm_crypt.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <keys/user-type.h>
+#include <linux/crash_dump.h>
+#include <linux/configfs.h>
+#include <linux/module.h>
+
+#define KEY_NUM_MAX 128	/* maximum dm crypt keys */
+#define KEY_DESC_MAX_LEN 128	/* maximum dm crypt key description size */
+
+static unsigned int key_count;
+
+struct config_key {
+	struct config_item item;
+	const char *description;
+};
+
+static inline struct config_key *to_config_key(struct config_item *item)
+{
+	return container_of(item, struct config_key, item);
+}
+
+static ssize_t config_key_description_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%s\n", to_config_key(item)->description);
+}
+
+static ssize_t config_key_description_store(struct config_item *item,
+					    const char *page, size_t count)
+{
+	struct config_key *config_key = to_config_key(item);
+	size_t len;
+	int ret;
+
+	ret = -EINVAL;
+	len = strcspn(page, "\n");
+
+	if (len > KEY_DESC_MAX_LEN) {
+		pr_err("The key description shouldn't exceed %u characters", KEY_DESC_MAX_LEN);
+		return ret;
+	}
+
+	if (!len)
+		return ret;
+
+	kfree(config_key->description);
+	ret = -ENOMEM;
+	config_key->description = kmemdup_nul(page, len, GFP_KERNEL);
+	if (!config_key->description)
+		return ret;
+
+	return count;
+}
+
+CONFIGFS_ATTR(config_key_, description);
+
+static struct configfs_attribute *config_key_attrs[] = {
+	&config_key_attr_description,
+	NULL,
+};
+
+static void config_key_release(struct config_item *item)
+{
+	kfree(to_config_key(item));
+	key_count--;
+}
+
+static struct configfs_item_operations config_key_item_ops = {
+	.release = config_key_release,
+};
+
+static const struct config_item_type config_key_type = {
+	.ct_item_ops = &config_key_item_ops,
+	.ct_attrs = config_key_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+static struct config_item *config_keys_make_item(struct config_group *group,
+						 const char *name)
+{
+	struct config_key *config_key;
+
+	if (key_count > KEY_NUM_MAX) {
+		pr_err("Only %u keys at maximum to be created\n", KEY_NUM_MAX);
+		return ERR_PTR(-EINVAL);
+	}
+
+	config_key = kzalloc(sizeof(struct config_key), GFP_KERNEL);
+	if (!config_key)
+		return ERR_PTR(-ENOMEM);
+
+	config_item_init_type_name(&config_key->item, name, &config_key_type);
+
+	key_count++;
+
+	return &config_key->item;
+}
+
+static ssize_t config_keys_count_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%d\n", key_count);
+}
+
+CONFIGFS_ATTR_RO(config_keys_, count);
+
+static struct configfs_attribute *config_keys_attrs[] = {
+	&config_keys_attr_count,
+	NULL,
+};
+
+/*
+ * Note that, since no extra work is required on ->drop_item(),
+ * no ->drop_item() is provided.
+ */
+static struct configfs_group_operations config_keys_group_ops = {
+	.make_item = config_keys_make_item,
+};
+
+static const struct config_item_type config_keys_type = {
+	.ct_group_ops = &config_keys_group_ops,
+	.ct_attrs = config_keys_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+static struct configfs_subsystem config_keys_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf = "crash_dm_crypt_keys",
+			.ci_type = &config_keys_type,
+		},
+	},
+};
+
+static int __init configfs_dmcrypt_keys_init(void)
+{
+	int ret;
+
+	config_group_init(&config_keys_subsys.su_group);
+	mutex_init(&config_keys_subsys.su_mutex);
+	ret = configfs_register_subsystem(&config_keys_subsys);
+	if (ret) {
+		pr_err("Error %d while registering subsystem %s\n", ret,
+		       config_keys_subsys.su_group.cg_item.ci_namebuf);
+		goto out_unregister;
+	}
+
+	return 0;
+
+out_unregister:
+	configfs_unregister_subsystem(&config_keys_subsys);
+
+	return ret;
+}
+
+module_init(configfs_dmcrypt_keys_init);
-- 
2.49.0

