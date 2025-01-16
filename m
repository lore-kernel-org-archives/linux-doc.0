Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5BF19E7D0
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 06:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737010733; cv=none; b=uqw4UBdwxQJM0N96DFn+x5N4dP86YsPi6E3JF7u7c1VqIbMRhmbzFZ3xiuFao4Y9mJw7pcA1UOimVJVBMDBUhQ8NA10N095lm7btD6vHkIyleVu0O5+aVYZ3Yol0mF3PPFs/57RPhcI0Sv3bvboOcl2pf0glY/TUbwafWROv8mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737010733; c=relaxed/simple;
	bh=0IzIgEB8lMBr0Rn/YmZNidG+wG0qR7sON2umg+tTrvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfOw2tv4bHZDr6RwcUPO6YvPOV95/9lfy+bIWpyMAeI1UDNMA5ep0ITRCmLnrJfphuQrCQsVqZogJAeFUxk6SdqgmYfcEopfE6bdzE80wLV4SAhcnbeDTDWrCctK1+PzhIgHUH+Aul+qfNnako/cDqhLwlt1wl3ld9UWngrLC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I7rkGUe2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I7rkGUe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737010729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F93kQVkCsCJNL9Y5XwGO7Li96Jeb80TvMhX68lBiTYM=;
	b=I7rkGUe2lvwAbE36hOeoy8IOvOvygMMJphLrpjKrCL/3PGLfLxPZgCsKR5pK/nv8MrZXbz
	eWbRnGNZyuCWZ+0iMG//focNm06fU474qxgJflK96PULi6AooV3ck6JLtibmCXAQaxPLBR
	BQj0lUubcBXi5oVtMX5gQaRITVqwpho=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-g44afwcDO2-V3e_ZMh19mw-1; Thu, 16 Jan 2025 01:58:46 -0500
X-MC-Unique: g44afwcDO2-V3e_ZMh19mw-1
X-Mimecast-MFC-AGG-ID: g44afwcDO2-V3e_ZMh19mw
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef114d8346so1405424a91.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 22:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737010725; x=1737615525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F93kQVkCsCJNL9Y5XwGO7Li96Jeb80TvMhX68lBiTYM=;
        b=tdVOvCaSLmqR/C2Va2aOaMgzKYiud4lUUI5Yg2yIK5mBIbKzRQUxBrhnjx2mY2B1nD
         EeG7CuBVvHNzJWeesVh2Vk31gqLQuWnVm9FzJ5/kuKlqxA3Y1N/Xi1/F6vRU+bgqawbb
         P75CugQDuh6qotZZWDLjN8xybCyzMQem8h/rny3b0lvy12ZDaaV8xEIr+B9C0meTYd+B
         fNDkpHf5zAKHh7r4++OXJLJK9i8YL1kEmrnTFtGlpYf5St1Rulu5n1KFaDymDYn4m3l3
         5NnaXsXXehi1QMhMnIVBfL28S0pAer4vfPTpE6aCXjZjoWqlYbERr/UE0NlR2BuY6PU0
         Wh/A==
X-Forwarded-Encrypted: i=1; AJvYcCXAyKwxtZ7ZTxPIRSL1NZPzamdZHNHQmOC8iKYdD4/nnhuqij498PcnJjlZf3zggIigGq/kD9ITFM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMlvihG+Swj1Ue91RzxuIDNxNxtd+MvLH/apzKgt3qlkIPjIeu
	4ys1IGmpSVCYCshtbb1eeEvkRlI08KL3rMZa3I0j1WDO67aLmmqQIPBwkEVvqVx64Cr+Hd4152c
	+P82HiZtq5S2eWYn2Py2HM8E9/Oqp7UYMrRoofUUzYaVQXEcGjK6HHs/3Mg==
X-Gm-Gg: ASbGnctdG4Ir/MsjZKuq3O34+6WGEc+cRYvBA1uTymyBq5HkC1hfhjA9qSoAmH1mNFu
	BUY5YewP810SqSIE2L/I9uGWPiwbPrGYoP4ZlfoRKE1qMQeDDNPzVQRce8XpoSBQro+uIjCNtMQ
	hkomYzOm+Q/KQ+ZFaX1R8SHxC/9jeWsgrAh10uD31j5aH24q6o8yFkNK4iapkDWdSmtd2c85CAO
	zDyo9ESEGiY6pZL3pds4SedJxG41CehrhBWJiUt4Kx3YRYx
X-Received: by 2002:a17:90b:2545:b0:2ee:693e:ed7c with SMTP id 98e67ed59e1d1-2f5490edb5fmr51202223a91.33.1737010725537;
        Wed, 15 Jan 2025 22:58:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwhoEAEGa8uJD6eJLSOncFzlqkhgLCFTLeey8Y1WHbpWJxLac0mMSmPS3qjC2CepgVd/2MxQ==
X-Received: by 2002:a17:90b:2545:b0:2ee:693e:ed7c with SMTP id 98e67ed59e1d1-2f5490edb5fmr51202183a91.33.1737010725215;
        Wed, 15 Jan 2025 22:58:45 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c156b9esm2552352a91.4.2025.01.15.22.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 22:58:44 -0800 (PST)
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
Subject: [PATCH v7 4/7] crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging
Date: Thu, 16 Jan 2025 14:58:19 +0800
Message-ID: <20250116065825.1041558-5-coxu@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116065825.1041558-1-coxu@redhat.com>
References: <20250116065825.1041558-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When there are CPU and memory hot un/plugs, the dm crypt keys may need
to be reloaded again depending on the solution for crash hotplug
support. Currently, there are two solutions. One is to utilizes udev to
instruct user space to reload the kdump kernel image and initrd,
elfcorehdr and etc again. The other is to only update the elfcorehdr
segment introduced in commit 247262756121 ("crash:
add generic infrastructure for crash hotplug support").

For the 1st solution, the dm crypt keys need to be reloaded again. The
user space can write true to
/sys/kernel/config/crash_dm_crypt_key/reuse so the stored keys can be
re-used.

For the 2nd solution, the dm crypt keys don't need to be reloaded.
Currently, only x86 supports the 2nd solution. If the 2nd solution
gets extended to all arches, this patch can be dropped.

Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 Documentation/admin-guide/kdump/kdump.rst |  4 ++
 kernel/crash_dump_dm_crypt.c              | 52 +++++++++++++++++++++--
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 192d6796ab94..cecfa5d34f01 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -574,6 +574,10 @@ encrypted disk volume. User space can interact with
     cat /sys/kernel/config/crash_dm_crypt_keys/count
     2
 
+    # To support CPU/memory hot-plugging, re-use keys already saved to reserved
+    # memory
+    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
+
 2. Load the dump-capture kernel
 
 3. After dump-capture kerne get booted, restore the keys to user keyring
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 8c093c743d58..328d3dd0d8f6 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -28,6 +28,20 @@ static size_t get_keys_header_size(size_t total_keys)
 	return struct_size(keys_header, keys, total_keys);
 }
 
+static void get_keys_from_kdump_reserved_memory(void)
+{
+	struct keys_header *keys_header_loaded;
+
+	arch_kexec_unprotect_crashkres();
+
+	keys_header_loaded = kmap_local_page(pfn_to_page(
+		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
+
+	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
+	kunmap_local(keys_header_loaded);
+	arch_kexec_protect_crashkres();
+}
+
 static int read_key_from_user_keying(struct dm_crypt_key *dm_key)
 {
 	const struct user_key_payload *ukp;
@@ -150,8 +164,36 @@ static ssize_t config_keys_count_show(struct config_item *item, char *page)
 
 CONFIGFS_ATTR_RO(config_keys_, count);
 
+static bool is_dm_key_reused;
+
+static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%d\n", is_dm_key_reused);
+}
+
+static ssize_t config_keys_reuse_store(struct config_item *item,
+					   const char *page, size_t count)
+{
+	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
+		kexec_dprintk(
+			"dm-crypt keys haven't be saved to crash-reserved memory\n");
+		return -EINVAL;
+	}
+
+	if (kstrtobool(page, &is_dm_key_reused))
+		return -EINVAL;
+
+	if (is_dm_key_reused)
+		get_keys_from_kdump_reserved_memory();
+
+	return count;
+}
+
+CONFIGFS_ATTR(config_keys_, reuse);
+
 static struct configfs_attribute *config_keys_attrs[] = {
 	&config_keys_attr_count,
+	&config_keys_attr_reuse,
 	NULL,
 };
 
@@ -233,10 +275,12 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 		return -ENOENT;
 	}
 
-	image->dm_crypt_keys_addr = 0;
-	r = build_keys_header();
-	if (r)
-		return r;
+	if (!is_dm_key_reused) {
+		image->dm_crypt_keys_addr = 0;
+		r = build_keys_header();
+		if (r)
+			return r;
+	}
 
 	kbuf.buffer = keys_header;
 	kbuf.bufsz = get_keys_header_size(key_count);
-- 
2.47.1

