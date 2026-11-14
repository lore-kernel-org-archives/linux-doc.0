Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622124;
	b=1WgWV+t5J+IlAWESdOQw7wmuw9Yt9X9AcDp8Es4KVYuJqPWATOFb7bfbv45D5RopYyHk
	 Jw302G+aqMAgrmIWZBosZ/fCKSi4RHmvoPU+uuqhZzxIGEruCQjSBUai+HUeKArvfa1nq
	 DUWtoNnUkFiSEXsAGPeAh0UhPvAEUuu1i1NMoEtd7kJ4LjQ/Tvx55U5OkLY8PisW5uhwC
	 uqNeg5gUm98vvoYijC6Db+Z+SnVHcjsH2zk9u5LN1wFbbvycLjNphgJt2g7Oqvt19YkXI
	 V2TnzKuCXJt7B89sp3j4cbtE/Dvux4VP5Y4ZkOSZx2yg0w+KRnYQuJE74hNEM0EplYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=74rj+CkpT4/nmA6wimXkS+S7a3KUfy1q4Lonw9aR0e4=;
	b=z3hle/4emxumvNq7wtNVHPaksq/5RPqxUmobMO/j3l7y6AU3jRlkBw7mCDQR/jY7Vu23
	 U9hqihHSy3vwJfyYXnkfHRiQs2LM6Z3X7tAZaMCQ6qGLiRXbYUvBmG78d8OCJlpQ07bUM
	 2ac/LECghYs74CFcq7uOAtb13eOismovHct0OrCEIdGTswq1X1VfmTIeRa7bJCMywBmuZ
	 PKvy6IBLwvn1QY4/mIFFV4lQMMF0FTAn0Lu9AcTk1eRjOqJr1dVbTgUODUUK+MZ28sMf1
	 dQWmxxyqpunAy7YW2R92oInABm1nUMFumGnfGr2fw4EcS4tO0iJSCPvkiDGkUdhFDoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+KakreS;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AB4606A8B1
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 02:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99AB4606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+KakreS
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2909633eec.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 18:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622118; x=1795226918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74rj+CkpT4/nmA6wimXkS+S7a3KUfy1q4Lonw9aR0e4=;
        b=z+KakreSlNQYeTArZd9S1LA8BDhD3iTMqplKcWisqxt1MYIIx5hY1i0GVboL/u2qoi
         kj92/Eq3OESr3Osb8hLcCwzlMesuYkPovsHXNjfRyXmXbpORcBuJK7vCbtjb5f5VIlS4
         uM3FXpGmwAArVN3Xb1y2LTa+fLdklyAwJG2TSxGx/l47GwNAVnpZarYxTVX/SeGrV9sa
         pB/WpNfozQo+ivYbtIoHoRbDJd24WCZIlBPDSR9CEiGWpr5eG82cR5LdRPPmP5QC3r9T
         4EXvoIl4qexACGx6zpqmKBiN1tYEYFUd55mC+Rr9M34Z1pJ9tEZMWlfzEAP/KY5Qe6RU
         wFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622118; x=1795226918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74rj+CkpT4/nmA6wimXkS+S7a3KUfy1q4Lonw9aR0e4=;
        b=Bj0EQVMD4enkSKLEyJh709V1XqDYBD6ujcL0XT3h5Dt5DPLuylmsqz5ODTTddVyJrS
         Edg3mxU/5ffXM4QTjHIc7L+aN5cGvKIqSOphE9GnYeqkiyklW6pvaNBIyJ2rZ04RKiFN
         WdpiCkxoQYri5vw0lGCozJJnOA7cxfpB7kC96awA0CKEXDeX4N09HaLChoil1n00A4M9
         tcC9+WtMldgT5bEazp9a4nPnfj0HTIvJxIp4gNOFiKytlzllVxrWP9lDi8cOZHiDkwWr
         P5bBpx7NqKQhNJVXOmOw7ceGY9HWEdJOLTT0++h2lNhSvraitteXry9Xr1lLWiCv95NT
         V3yw==
X-Forwarded-Encrypted: i=1; AL+hErFhow/kfTyKJ3mlgNTTkv2gS8kg7m0tVOaSJA8nBqMKvhg0HPuCTg2qiJLf1dNob75zNqBBYJdrYXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gmx16wMwDHH+FjP4Cw3/cdO1nBLuhp+8XcyzLnJspKwzpLkk2
	kn6lsiTHfENrnEYlJbDxiscXOaxUtUiOc4nRAThQwYP9TCFAVHevr8YU
X-Gm-Gg: AYBFou3H9Nk2KBZaRT64gXFG4ye049qUNYI0EP6KB5DLwWU9i1l/+b+NGWKlmOnrMTF
	u4YJN2kUBoCR9FCiOhRAaYd70/1GEvKOThtxrpm6Xj6NK+kwkKs025VMEdTDoxz0X/ecFe+sL/X
	8LBxLLJzGs4JNPkSrVBlZM/Mk6LVX7jEnNztD1jd+g+BA7zKG33ym6niJipzBvAoTzoYG/hGEjM
	3QsyGc48J8pj50JvMFSI4YUy0SN81eDEetNFq6huHXiXFeuBZ9nmANJjOuVVZU17tl0kgwrzS5d
	C1bSwcSEYjeQ87X5nDHMM6+3o2tgxEbMJXzhxTKN7y/HY29lj3QGNuB8Nqi2B2QLbmeq8bx+if1
	+livvXXswOMexasElCM6ufuywIHqiv8+seizz/KTsLzsZAbYmbyYz/5nW0iwK1/ccHfm+T2ojIb
	76PhWUZpvUGXd5XPJ4TSPlI1XhaEMQ29rYOolAyLQJyBz5DO85NBLAfTGUI+P5UeBZoonqh3LSA
	uDT/RkZE4OEwY4EVwrkoLOACzXxduLta3xG2hF39xoBcPMHoo7WBiWwlLvhR1aKXYjxlUcK+a72
	Ez6ZAQSmNR8moblud1lXPHg5vWJYNFf+NZbf1OHk5988ElTqcw784+d1qLm5KlZXpURQ3tLS4Ct
	d4h5+RwJ7pKkqC50gC/2L6k9oZYvS9bzJz7yM61bNxonQ3hRJpy5y5qs4XoKjoCsWD6Pt1ci78H
	8htPFigZmniH6nFasBeS3fTXcm
X-Received: by 2002:a05:7301:6f0e:b0:369:efd5:9cad with SMTP id 5a478bee46e88-379655d4486mr3619303eec.8.1794622117643;
        Fri, 13 Nov 2026 18:08:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm18875218eec.21.2026.11.13.18.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:08:36 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: dell_rbu: Allocate large monolithic images contiguously
Date: Fri, 13 Nov 2026 18:08:15 -0800
Message-ID: <20261114020815.75539-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114020815.75539-1-rosenp@gmail.com>
References: <20261114020815.75539-1-rosenp@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Monolithic RBU images must live in a single physically contiguous block
below 4GB. img_update_realloc() gets that block from __get_free_pages(),
which cannot return more than MAX_PAGE_ORDER (4MB on x86). Current Dell
BIOS packages are larger than that: the Precision M4800 A26 image
(the PFS container extracted from the update executable) is about 16MB,
and SMBIOS structure 0xDE on that system reports no packet-mode support,
so the image cannot be loaded at all.

When the required order exceeds MAX_PAGE_ORDER, fall back to
alloc_contig_pages() with __GFP_DMA32 so the range is still below 4GB,
and free it with free_contig_range(). Smaller images keep using the
buddy allocator as before.

Tested on a Precision M4800 by uploading the 16MB A26 image through
/sys/class/firmware/dell_rbu and reading it back byte-for-byte from
/sys/devices/platform/dell_rbu/data; a 300KB image still uses the
buddy allocator path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 54 +++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index a121f59a215d..d71fa9584831 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -41,6 +41,8 @@
 #include <linux/moduleparam.h>
 #include <linux/firmware.h>
 #include <linux/dma-mapping.h>
+#include <linux/gfp.h>
+#include <linux/mm.h>
 #include <asm/set_memory.h>
 
 MODULE_AUTHOR("Abhay Salunke <abhay_salunke@dell.com>");
@@ -55,6 +57,7 @@ static struct _rbu_data {
 	unsigned long image_update_buffer_size;
 	unsigned long bios_image_size;
 	int image_update_ordernum;
+	unsigned long image_update_contig_pages;
 	spinlock_t lock;
 	unsigned long packet_read_count;
 	unsigned long num_packets;
@@ -335,6 +338,37 @@ static void packet_empty_list(void)
 	rbu_data.imagesize = 0;
 }
 
+/*
+ * Monolithic images must sit in one physically contiguous block below 4GB.
+ * Current BIOS images (16MB on some systems) exceed what the buddy allocator
+ * can hand out (MAX_PAGE_ORDER), so fall back to the contiguous range
+ * allocator for those when it is available.
+ */
+#ifdef CONFIG_CONTIG_ALLOC
+static void *img_alloc_contig(unsigned long nr_pages)
+{
+	struct page *page;
+
+	page = alloc_contig_pages(nr_pages, GFP_KERNEL | __GFP_DMA32 | __GFP_NOWARN,
+				  first_online_node, NULL);
+	return page ? page_address(page) : NULL;
+}
+
+static void img_free_contig(void *buf, unsigned long nr_pages)
+{
+	free_contig_range(PHYS_PFN(virt_to_phys(buf)), nr_pages);
+}
+#else
+static void *img_alloc_contig(unsigned long nr_pages)
+{
+	return NULL;
+}
+
+static void img_free_contig(void *buf, unsigned long nr_pages)
+{
+}
+#endif
+
 /*
  * img_update_free: Frees the buffer allocated for storing BIOS image
  * Always called with lock held and returned with lock held
@@ -349,13 +383,18 @@ static void img_update_free(void)
 	 */
 	memset(rbu_data.image_update_buffer, 0,
 		rbu_data.image_update_buffer_size);
-	free_pages((unsigned long) rbu_data.image_update_buffer,
-		rbu_data.image_update_ordernum);
+	if (rbu_data.image_update_contig_pages)
+		img_free_contig(rbu_data.image_update_buffer,
+				rbu_data.image_update_contig_pages);
+	else
+		free_pages((unsigned long) rbu_data.image_update_buffer,
+			rbu_data.image_update_ordernum);
 
 	/*
 	 * Re-initialize the rbu_data variables after a free
 	 */
 	rbu_data.image_update_ordernum = -1;
+	rbu_data.image_update_contig_pages = 0;
 	rbu_data.image_update_buffer = NULL;
 	rbu_data.image_update_buffer_size = 0;
 	rbu_data.bios_image_size = 0;
@@ -375,6 +414,7 @@ static int img_update_realloc(unsigned long size)
 {
 	unsigned char *image_update_buffer = NULL;
 	unsigned long img_buf_phys_addr;
+	unsigned long contig_pages = 0;
 	int ordernum;
 
 	/*
@@ -404,8 +444,13 @@ static int img_update_realloc(unsigned long size)
 	spin_unlock(&rbu_data.lock);
 
 	ordernum = get_order(size);
-	image_update_buffer =
-		(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
+	if (ordernum <= MAX_PAGE_ORDER) {
+		image_update_buffer =
+			(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
+	} else {
+		contig_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
+		image_update_buffer = img_alloc_contig(contig_pages);
+	}
 	spin_lock(&rbu_data.lock);
 	if (!image_update_buffer) {
 		pr_debug("Not enough memory for image update: size = %ld\n", size);
@@ -420,6 +465,7 @@ static int img_update_realloc(unsigned long size)
 	rbu_data.image_update_buffer_size = size;
 	rbu_data.bios_image_size = rbu_data.image_update_buffer_size;
 	rbu_data.image_update_ordernum = ordernum;
+	rbu_data.image_update_contig_pages = contig_pages;
 	return 0;
 }
 
-- 
2.56.1

