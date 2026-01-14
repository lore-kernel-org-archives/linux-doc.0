Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DE32FBDFF
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426367; cv=none; b=Cl4KpIzdHnG2SEfUxeKFUcMIlUbWLzAgq7Q2P3h/uL2pXsEk6OFNbh4/Op7EiJH2JAb/Dj/NEtQAQZCOYK5NnMVN60p6v5AnfIvnyuEf7IRVWw7vW+60xVKSmvoyoaTFqH55Hj4gfQ1RHW4g3vawPHwRhYeusKeFNQ4hgAM9Wyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426367; c=relaxed/simple;
	bh=rl+jQFmW9bJctWZaIMhOgi7nvti71S9dTb0lCysIN04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=macYF8bFQwUQSGzpr8MwdK038iYDcwkmEa479agNLkCScTTtd3x/f2xWqej5kyJDplP0XBUBsaZ9rUtaj6pqeNTltED2UC66rk1/1iKV88n1uPXngmdQfk07S1lLpIUV6jjwiPi3t+X2Y34RDZ0slTaX5mwjH44vXO+/8sqDTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtvkIwjv; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtvkIwjv"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7cfccba483eso97496a34.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 13:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768426365; x=1769031165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+ZFzB1bOq1z4EOZD4cYTHTPj9h8hzHs0/3N91Bb6XY=;
        b=DtvkIwjvXfYtf/To5+Fx2Hg9xeKVhr5+4S/kYC9GDIKtL1Ocb1tLNBm1JYvtrcSrDy
         KIpKbv7TyOBPgtuqtavqCobaLpGEIEH9ozpJXn3HaRPeBBIV9V+MerOT3Y977RIv4L5p
         J44aeEvWfaM9O30vqRibyH8titOwGRPtVx2RLuuie60hZhN643yxeuKBCmjynZ/k/rqp
         sK28s4ONTINstsrJT2s0aC+pDh8RXjfZc2EHg5wpTS0nwu8uroRL/u2fwsfznPnw5Hwr
         oDr7Cd8ses94H52hMhe/QlyKCrtx8kmOu3gw4uVTwDQ/G3YhxpOgytASSfTIxy3HDtJ5
         nsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768426365; x=1769031165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+ZFzB1bOq1z4EOZD4cYTHTPj9h8hzHs0/3N91Bb6XY=;
        b=tqz+K5p9Iq6t8a8E6SOdR9nDr/NzN9c8UREj5aUWJPuWhLonkWFFzyCGgefTIBwxle
         VAfAg+NmEft78HeGcyYdZPI68ZTjCR4+XGRSF6dvuM7XqUSFjH/2C5aRFPtmG89IjbzH
         uDD7qrU58vJvZBDpWi7ej2g+GtP9rO9EWd6Z4UBfXEowVPK0Fdl42oP+ttnCuyId8ogv
         Nm/1RVWurg9Or/7Ocb7xPiQxsbOJOOBuLGnNh4DwnWxfn+CnfUjoGvGmp0vUA4ftjzR3
         sfqNxPJvZ3aSKMPiLbO92li9x36dKvulV8OdAZlIKWXSb7sifpcXQlXWR/ReyfraEtpc
         zj2A==
X-Forwarded-Encrypted: i=1; AJvYcCV8NhHBN6I9I3vq8yMT56lQ6u4Ad4JqDz55DQe/BqHGFLtR8L2jaSN0J1yEgFLiUI7wlix3BobBY3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTStjw1N1+HDcWBbuK0IDoYx6HCBOoa5U9eis+itwZgeB8xfrx
	6sNbiYZ1CI9+NrbCsXOOvah/P9XytzpJffv+nX+cMsC32bRvq+nOy2HY
X-Gm-Gg: AY/fxX48bWkqXnNf5cP28+6UYUbv2Vj8hhdZt6VtxA4Lmhtyj1aawp+X41XvfypFA4Q
	qVikk+woeO5+60wqc3/ydNvOREKxK0jfdialt93rBixiJ9daMoBXH49rZhEY/jr54i1zo0BRMvS
	bf6Y/o2CLyzLER20/hb3clEHWPRDnXb2G9qtPK5spMwZAvnt9Njl+XfxEaHe6R2feo1P1JFowlC
	jIBHWROsbqioCLr9ycsdY7ChTOTNAJVjxN/k9NkDH5QyVz+u9u0SCG4KZ0aFYA1YN7rNj6lrJtW
	6WjS9L/XEeg7tds/qavbV33/seL6oP1D14fipQzSbQpaiuWf9rRn0hZRNU/cu1GBS3BGlRxjn4U
	ermVtTkHKA3/aUkIjslLRYYMEiJlSo0jpWDcNqRw75t7jwY4cs62BRy4f2R9nyiLG8IAEgzuDkT
	2T4Azm3/5H1i1Er8Drevi6iPQcnd4gDqxcoW+Hzzpdie7K
X-Received: by 2002:a05:6830:268c:b0:7c7:6e32:dc7f with SMTP id 46e09a7af769-7cfcb46d690mr2240341a34.0.1768426364916;
        Wed, 14 Jan 2026 13:32:44 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfcb084c89sm2440494a34.12.2026.01.14.13.32.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:32:44 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
From: John Groves <John@Groves.net>
X-Google-Original-From: John Groves <john@groves.net>
To: John Groves <John@Groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: John Groves <jgroves@micron.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	venkataravis@micron.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH V4 01/19] dax: move dax_pgoff_to_phys from [drivers/dax/] device.c to bus.c
Date: Wed, 14 Jan 2026 15:31:48 -0600
Message-ID: <20260114213209.29453-2-john@groves.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114213209.29453-1-john@groves.net>
References: <20260114153133.29420.compound@groves.net>
 <20260114213209.29453-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function will be used by both device.c and fsdev.c, but both are
loadable modules. Moving to bus.c puts it in core and makes it available
to both.

No code changes - just relocated.

Signed-off-by: John Groves <john@groves.net>
---
 drivers/dax/bus.c    | 24 ++++++++++++++++++++++++
 drivers/dax/device.c | 23 -----------------------
 2 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index fde29e0ad68b..a73f54eac567 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1417,6 +1417,30 @@ static const struct device_type dev_dax_type = {
 	.groups = dax_attribute_groups,
 };
 
+/* see "strong" declaration in tools/testing/nvdimm/dax-dev.c */
+__weak phys_addr_t dax_pgoff_to_phys(struct dev_dax *dev_dax, pgoff_t pgoff,
+			      unsigned long size)
+{
+	int i;
+
+	for (i = 0; i < dev_dax->nr_range; i++) {
+		struct dev_dax_range *dax_range = &dev_dax->ranges[i];
+		struct range *range = &dax_range->range;
+		unsigned long long pgoff_end;
+		phys_addr_t phys;
+
+		pgoff_end = dax_range->pgoff + PHYS_PFN(range_len(range)) - 1;
+		if (pgoff < dax_range->pgoff || pgoff > pgoff_end)
+			continue;
+		phys = PFN_PHYS(pgoff - dax_range->pgoff) + range->start;
+		if (phys + size - 1 <= range->end)
+			return phys;
+		break;
+	}
+	return -1;
+}
+EXPORT_SYMBOL_GPL(dax_pgoff_to_phys);
+
 static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 {
 	struct dax_region *dax_region = data->dax_region;
diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 22999a402e02..132c1d03fd07 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -57,29 +57,6 @@ static int check_vma(struct dev_dax *dev_dax, struct vm_area_struct *vma,
 			   vma->vm_file, func);
 }
 
-/* see "strong" declaration in tools/testing/nvdimm/dax-dev.c */
-__weak phys_addr_t dax_pgoff_to_phys(struct dev_dax *dev_dax, pgoff_t pgoff,
-		unsigned long size)
-{
-	int i;
-
-	for (i = 0; i < dev_dax->nr_range; i++) {
-		struct dev_dax_range *dax_range = &dev_dax->ranges[i];
-		struct range *range = &dax_range->range;
-		unsigned long long pgoff_end;
-		phys_addr_t phys;
-
-		pgoff_end = dax_range->pgoff + PHYS_PFN(range_len(range)) - 1;
-		if (pgoff < dax_range->pgoff || pgoff > pgoff_end)
-			continue;
-		phys = PFN_PHYS(pgoff - dax_range->pgoff) + range->start;
-		if (phys + size - 1 <= range->end)
-			return phys;
-		break;
-	}
-	return -1;
-}
-
 static void dax_set_mapping(struct vm_fault *vmf, unsigned long pfn,
 			      unsigned long fault_size)
 {
-- 
2.52.0

