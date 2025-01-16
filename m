Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC8192B95
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012665; cv=none; b=nkabBMW4TEN0nhaHIbjsYPQ+6msx/e7iHUw6P/QtMfkEEBd6S9fV82tG2nP3K0TQBApy+siep/OTH6ngSEihw4Np4LOdXLUDfuw7maboK88l0YPki+M9z3Hl1TgRb7AZM2x/BsSSy/13ithD1w+Yu3NetxAxouZ0w5dOLoue/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012665; c=relaxed/simple;
	bh=RP9HogcZw/sWNsSOpTqj7w6ztdG6MlxQKFyARtdx4Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY3nr6LQIz+ZxutpK6C+1qCDaAH5ZGjgTLepJW4YbX2aHXJFmiwkpY7HvRRn5Bg1Rit0Iwb3qMapjky+lCy6WP+0m12Sfh5N/xAaQPGoPLBeGGDCvhAMZAjEw11PJsMIk5zD11m0ZxNvtYFyKrHWF4KSWTs4hUZbN3ONTlDvVgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FhGmEh3V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FhGmEh3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737012662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aHQUprvYUxpGchCCyLRuJWs5QUXLD5ilgW79Ys2jOQY=;
	b=FhGmEh3VkWXsl5qf5OxxkvHtNpy28x8WCTA0Llfnt6eE/V7CztmfNCJ8ZrYSEUZtFcpOh3
	7WeR2To87RtEdHm8zYAQUliF+ihA4+cXrSm60/jTxFeRZhkwOhUezZs75h+c28FU2FZVZo
	V6BSPuDhUD96xU63EtfviXo/Qr0q9MM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-Y7wBdpQdPkiYVeEoGRH4mQ-1; Thu, 16 Jan 2025 02:30:58 -0500
X-MC-Unique: Y7wBdpQdPkiYVeEoGRH4mQ-1
X-Mimecast-MFC-AGG-ID: Y7wBdpQdPkiYVeEoGRH4mQ
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so1442574a91.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 23:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012657; x=1737617457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHQUprvYUxpGchCCyLRuJWs5QUXLD5ilgW79Ys2jOQY=;
        b=S2lpuJkP3MhPs0v76glFLdeazFZuHZmfndCqPp1ofcG8WKkF95mPAJ1ENZkwF3341M
         /MhSjdBPhqP2W/lKYpKUjx4A6EJnrP8i233lm2Tj0qldScW1zbx+bFPgmQFCLWg6rg5u
         8xuh/HABTdAxiG9iQXHKmyU0c46k2v/48dzH8Uck7LZHl/HpvckT8Wc/Q6Ez1cvAnmKI
         iJIzdbeXYZGSGLDQy6CXXDPUSNGUhQxRtBauSQxTOVWUZmRtODZSwvyFa1l1LxnM+YAx
         QdmtR/xx8U6hBwLPyAG2Vo+zqrKV2EoISJ7e0JHwsb0Jf9RkUM7Y6zNV9SckcCp2SufT
         TSew==
X-Forwarded-Encrypted: i=1; AJvYcCVhIh9uMst+wFW6Ue+whh50me0HMcgxEgKnR17uKAOTA06ftEkdi4irEPzLSP0j1SWz1muzOJYOk5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQozTdORhuw4e/ikbIiJS17BLLgZvp9WYuNhvh+qTVmyr6fKl
	Xl49jd8vqi2oOcrw6ABiyzgxp9ky67Yl+kLWA4SI4lETexgoZemT3ow8MYBMdLlR0E/jA6fa9it
	Ffgl9QgFkgOzbWPRL+vxwoqu8Hqhf6MSLsxyNvMKQlYpxY2+dbw9dysnhHA==
X-Gm-Gg: ASbGncsFEs3gbkHDQocEqv9Jr1OTeVvyhlyziMVIDTUw5GIzDyKGjtxSl+GLjOiyENR
	mYU5GPMlHAuH9jeHyA0ksDg57LIlspYB+M9kvR/yNwQUjXZ6Lf2f+WKN5dYKD1zJnj4syItFbkE
	ZqQGoIYtuWQr9ooR9FaQnCZ/dU39SXqIu7cJt14iIwlOAngTGZYwHTIHTKw/ZPfaQsr4Q3x/ZyT
	uAmVo/VuYP6SHychR26dTHFjcTFo7LoB8M7T3AAD/czmi6e
X-Received: by 2002:a05:6a00:230a:b0:725:90f9:daf9 with SMTP id d2e1a72fcca58-72d21f650a1mr43969895b3a.15.1737012657075;
        Wed, 15 Jan 2025 23:30:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWDRrztzuIkg9Q5tBVV6pQohQ2pViv+9rbr1S07QCHNZTPnu4LF6hxA89i8/UG0IYrbzHiVg==
X-Received: by 2002:a05:6a00:230a:b0:725:90f9:daf9 with SMTP id d2e1a72fcca58-72d21f650a1mr43969860b3a.15.1737012656652;
        Wed, 15 Jan 2025 23:30:56 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405493basm10334829b3a.27.2025.01.15.23.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:30:56 -0800 (PST)
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
	Vivek Goyal <vgoyal@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v7 6/7] x86/crash: pass dm crypt keys to kdump kernel
Date: Thu, 16 Jan 2025 15:30:52 +0800
Message-ID: <20250116073053.1043873-1-coxu@redhat.com>
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

1st kernel will build up the kernel command parameter dmcryptkeys as
similar to elfcorehdr to pass the memory address of the stored info of
dm crypt key to kdump kernel.

Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 Documentation/admin-guide/kdump/kdump.rst |  4 ++--
 arch/x86/kernel/crash.c                   | 26 +++++++++++++++++++++--
 arch/x86/kernel/kexec-bzimage64.c         | 11 ++++++++++
 3 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index cecfa5d34f01..c4bd6ecb6ab7 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -555,8 +555,8 @@ Write the dump file to encrypted disk volume
 ============================================
 
 CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to
-encrypted disk volume. User space can interact with
-/sys/kernel/config/crash_dm_crypt_keys for setup,
+encrypted disk volume (only x86_64 supported for now). User space can interact
+with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the 1st kernel what keys are needed to unlock the disk volumes,
     # Add key #1
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 340af8155658..a525ee639b63 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -278,6 +278,7 @@ static int memmap_exclude_ranges(struct kimage *image, struct crash_mem *cmem,
 				 unsigned long long mend)
 {
 	unsigned long start, end;
+	int ret;
 
 	cmem->ranges[0].start = mstart;
 	cmem->ranges[0].end = mend;
@@ -286,22 +287,43 @@ static int memmap_exclude_ranges(struct kimage *image, struct crash_mem *cmem,
 	/* Exclude elf header region */
 	start = image->elf_load_addr;
 	end = start + image->elf_headers_sz - 1;
-	return crash_exclude_mem_range(cmem, start, end);
+	ret = crash_exclude_mem_range(cmem, start, end);
+
+	if (ret)
+		return ret;
+
+	/* Exclude dm crypt keys region */
+	if (image->dm_crypt_keys_addr) {
+		start = image->dm_crypt_keys_addr;
+		end = start + image->dm_crypt_keys_sz - 1;
+		return crash_exclude_mem_range(cmem, start, end);
+	}
+
+	return ret;
 }
 
 /* Prepare memory map for crash dump kernel */
 int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
 {
+	unsigned int nr_ranges = 0;
 	int i, ret = 0;
 	unsigned long flags;
 	struct e820_entry ei;
 	struct crash_memmap_data cmd;
 	struct crash_mem *cmem;
 
-	cmem = vzalloc(struct_size(cmem, ranges, 1));
+	/*
+	 * Using random kexec_buf for passing dm crypt keys may cause a range
+	 * split. So use two slots here.
+	 */
+	nr_ranges = 2;
+	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
 	if (!cmem)
 		return -ENOMEM;
 
+	cmem->max_nr_ranges = nr_ranges;
+	cmem->nr_ranges = 0;
+
 	memset(&cmd, 0, sizeof(struct crash_memmap_data));
 	cmd.params = params;
 
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 68530fad05f7..5604a5109858 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -76,6 +76,10 @@ static int setup_cmdline(struct kimage *image, struct boot_params *params,
 	if (image->type == KEXEC_TYPE_CRASH) {
 		len = sprintf(cmdline_ptr,
 			"elfcorehdr=0x%lx ", image->elf_load_addr);
+
+		if (image->dm_crypt_keys_addr != 0)
+			len += sprintf(cmdline_ptr + len,
+					"dmcryptkeys=0x%lx ", image->dm_crypt_keys_addr);
 	}
 	memcpy(cmdline_ptr + len, cmdline, cmdline_len);
 	cmdline_len += len;
@@ -441,6 +445,13 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		ret = crash_load_segments(image);
 		if (ret)
 			return ERR_PTR(ret);
+		ret = crash_load_dm_crypt_keys(image);
+		if (ret == -ENOENT) {
+			kexec_dprintk("No dm crypt key to load\n");
+		} else if (ret) {
+			pr_err("Failed to load dm crypt keys\n");
+			return ERR_PTR(ret);
+		}
 	}
 #endif
 
-- 
2.47.1

