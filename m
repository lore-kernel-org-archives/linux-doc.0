Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3840D1946B1
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737010723; cv=none; b=U+IQwSxKszpCC6cnDVk5MpWQ3fLSOi8eROmt/8oMwmpiccbkWIQnjwJDQxzYBgGtLzkRywChru1c2g9dwk0KTV2BHFy00rvdfnVbF43Zw+ijJd6fUZAaY+f2sjnjsMZOZN7ZmVpoCWnV4mnNQK8BU5ecKALj36ENEZ9iTMR4zPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737010723; c=relaxed/simple;
	bh=D16J/WHAbaaOHTd/nUMP7WV1oMg7HXcfapvspWL7FWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bvdxempt8WRWnG9//cKk9Sh/PNHy4jtAzeKod/5+lkfTu9I/jwSiK0IYG/iwn+GwJGIUvuhA8HSdTiOugVJXic1VcVkM9kXBP6WYpjA32gyVIO40cBqHuzrngVVKU0LfvThfrqNZuwcb4ZTcBj6xEFVQbxn/0jwSucfGKIm9SbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IpGArR4A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IpGArR4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737010720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIRiDBJu9+QDyyb56ofJIWczEtwhblONzUKJ53stfmU=;
	b=IpGArR4AF3H9VhtB1BaRB/vapSDSY9iTFB75zkYqu9EQXjH19P6FjNqdSE6xeUp7/kFrZK
	BiA7Pg48EFqCVerpIhXQczXkQzYB4V+EgdQGyLgh/fHOmSYrl3UTtt8/hYGEffVEZq7vQc
	ilwWnYWswdskkc4tnXPzTT7GulQH3Eg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-3PxaEiOGPyaUu6-vq0pUug-1; Thu, 16 Jan 2025 01:58:38 -0500
X-MC-Unique: 3PxaEiOGPyaUu6-vq0pUug-1
X-Mimecast-MFC-AGG-ID: 3PxaEiOGPyaUu6-vq0pUug
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so1499138a91.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 22:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737010717; x=1737615517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIRiDBJu9+QDyyb56ofJIWczEtwhblONzUKJ53stfmU=;
        b=MPxjsKtlVryu5w50ZEbR2rtBrl+lsCaDDsZxi4zi72G7EfGDb6081KL4cK99H+3nKz
         9Xr1EZV95hlXFf6kirrg6JOFYpGhI+I9RAn6Oe7MkTOVec9dCNXv4NglPvKDopLe0G3+
         MgtAlhBciFezYWX24xkqbXR0XX7rCa89xztUVz1hMQoZz7O6WIPiykZ9RGexCqtxku6U
         a3aTpPgl5dMdOVOM4T7lyF9CLFlvO+fFNXG37k86MCm8LVH7b7OL5Hf77hGLH1K/F3Zz
         OWfMy5ieECX2a7CoLwHnYTWIcPHBvJvUzuzF/cqNcnBqIwkp5hnaYcUiSLTPbApsypfT
         6ksQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFZyg79TuwwgPHOMbyKpJaVwm6GbGZ77F+LL6zLfqXXMqJkhylW0g3Ze2V8iD8TvFRiWppFzU41aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmfzQPb2BY6CJ+D+L19MqZuJcA/ICdESrfULovzbnxVLAMw96A
	87dzQv3fnzetP+CboRyf/Fs8n5OMEb7vwm9XpkNxJxVPlduO1yT7AmD2FhbS1MWkwifWtLpi01h
	bKtmjxGO/YILn94kQNMBduXqVbuqPYxxK98mGH91j7+q6XiviwJZHXjOUJQ==
X-Gm-Gg: ASbGncu4CWOSS7EVE2kxm435QH+BwyZRRap5Db7d8geSvFDyU2da76oQsxvmkKVj2ar
	e7bU48CEaVtGgehbUzWSD9lUiqLSMR9daGKN7pjEepALuWXaEu4a2muUapnmrvxSvMgIi1ovQA/
	YNub/T4mnVAsblqDq0iw7oXPiucEE6137VWM6+hldfGD4HcRTWBdGH2dE8Qg7Jl8TDWojtqZhqU
	dSjaptc+p+v2OSIUAmvZBYaU7p1DvGS4l8NKjCKShyvls9p
X-Received: by 2002:a05:6a00:39a3:b0:727:3ccc:25b0 with SMTP id d2e1a72fcca58-72d21fde276mr44027989b3a.16.1737010716715;
        Wed, 15 Jan 2025 22:58:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlw/4FDu2VfUFgBy+S6RCRgqpdNLoWkdfX1siUiDXh3z0KKvPCgaeFfQdiUXl0ijbCzJ0zYw==
X-Received: by 2002:a05:6a00:39a3:b0:727:3ccc:25b0 with SMTP id d2e1a72fcca58-72d21fde276mr44027962b3a.16.1737010716208;
        Wed, 15 Jan 2025 22:58:36 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4065c475sm10319945b3a.117.2025.01.15.22.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 22:58:35 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org
Cc: Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Jan Pazdziora <jpazdziora@redhat.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Dave Hansen <dave.hansen@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v7 2/7] crash_dump: make dm crypt keys persist for the kdump kernel
Date: Thu, 16 Jan 2025 14:58:17 +0800
Message-ID: <20250116065825.1041558-3-coxu@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116065825.1041558-1-coxu@redhat.com>
References: <20250116065825.1041558-1-coxu@redhat.com>
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

    # Add key#2 in the same way

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
---
 Documentation/admin-guide/kdump/kdump.rst |  28 ++++
 kernel/Kconfig.kexec                      |  10 ++
 kernel/Makefile                           |   1 +
 kernel/crash_dump_dm_crypt.c              | 154 ++++++++++++++++++++++
 4 files changed, 193 insertions(+)
 create mode 100644 kernel/crash_dump_dm_crypt.c

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 5376890adbeb..192d6796ab94 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -551,6 +551,34 @@ from within add_taint() whenever the value set in this bitmask matches with the
 bit flag being set by add_taint().
 This will cause a kdump to occur at the add_taint()->panic() call.
 
+Write the dump file to encrypted disk volume
+============================================
+
+CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to
+encrypted disk volume. User space can interact with
+/sys/kernel/config/crash_dm_crypt_keys for setup,
+
+1. Tell the 1st kernel what keys are needed to unlock the disk volumes,
+    # Add key #1
+    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
+    # Add key #1's description
+    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
+
+    # how many keys do we have now?
+    cat /sys/kernel/config/crash_dm_crypt_keys/count
+    1
+
+    # Add key#2 in the same way
+
+    # how many keys do we have now?
+    cat /sys/kernel/config/crash_dm_crypt_keys/count
+    2
+
+2. Load the dump-capture kernel
+
+3. After dump-capture kerne get booted, restore the keys to user keyring
+   echo yes > /sys/kernel/crash_dm_crypt_keys/restore
+
 Contact
 =======
 
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 4d111f871951..5226775fd4c6 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -116,6 +116,16 @@ config CRASH_DUMP
 	  For s390, this option also enables zfcpdump.
 	  See also <file:Documentation/arch/s390/zfcpdump.rst>
 
+config CRASH_DM_CRYPT
+	bool "Support saving crash dump to dm-crypt encrypted volume"
+	depends on KEXEC_FILE
+	depends on CRASH_DUMP
+	depends on DM_CRYPT
+	help
+	  With this option enabled, user space can intereact with
+	  /sys/kernel/config/crash_dm_crypt_keys to make the dm crypt keys
+	  persistent for the dump-capture kernel.
+
 config CRASH_HOTPLUG
 	bool "Update the crash elfcorehdr on system configuration changes"
 	default y
diff --git a/kernel/Makefile b/kernel/Makefile
index 87866b037fbe..9d1cabf1ec46 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_VMCORE_INFO) += vmcore_info.o elfcorehdr.o
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
2.47.1

