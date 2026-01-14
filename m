Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C657B38FF16
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427039; cv=none; b=fgBuHBf3cqzWlxCUszixJDO1juW1eeRIwGahflZNbNzfb1DdancL4jJGdbxiJLyGe9KnDDpzfjq6oGd4YYhJNeuf8nhfZlE1fBk+iyCuFr4rgcRCRwDjPxbcmKrIP581lK5RNoQrOHmJiVHfzYMdU5DbjNCCfvB8FI/z8mdHTjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427039; c=relaxed/simple;
	bh=6IXyikUrXXga0w+XTOVh8PGo9rM6Mf6O+h0Sd4yHab4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CK/ZgE7OoRLoYuubd2DnLkdgcFQo5OatouDKQ8X5LcAu96cSY7ijB18L4XzSkONp3XvGvZAuIcHaSvqkiyF705ZXisu2rfYIJhf+pTXsgYLz9avB4H/1UAwzu8slLqcVwk6NbxkG8qbsqGWCQsNN3YG+xNG1WbMpstVnGdQ5+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwAksuye; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwAksuye"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7cfd04f1be8so118886a34.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 13:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768427023; x=1769031823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KokXwqCF3cjj7h8MwPrV07VxZRdfFYCa5Cm5tvCoTf0=;
        b=DwAksuyem4fEXByAYX/OKg/0P0/Ha1dtdmlvYZE+UKXX7YyZhN6fgvtGrdB1rdORUR
         JYGbLkRMbFZiHz2y/aRbCY+WLcRwNL7CXT0eUHAYgo6HV+q8lpX1KviYMFS/BE7mNHGk
         uyH986y0xx/kzFtWryKbAN9a5V1E+Jl3Mm7y5ym+XXz5kbjSeR2t3iwG40PFZZElLFHn
         26IlsFBc5TWc/7ZiOL422nsR/U8knSTp40kFKtyt2oAWo9N5sNTgSgPA/2ieckJvpcJD
         yQ70eaExuqB3Xs/c0UplQHbP9DgRJGwkfpx2CiMo0vveGX7b6miuFZlcKRl1iwukA1KD
         ZCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427023; x=1769031823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KokXwqCF3cjj7h8MwPrV07VxZRdfFYCa5Cm5tvCoTf0=;
        b=s6Wmram7Z+WrO3wNCrISAfWsW1oF2+GcanTlbAHviB3Rmga7GHiNVhx/ND03IjTDgh
         7799u/y1U7PH2Tma2PSbpKdIt0K7No3//FDfvTu0FNPdLDM1abIUcibTxH1lTaYKPgYK
         0oiLj/yaKrADS6a/tAmGtFAsUWbHXgpNl1rHIMawEQCpyV9HNUt/RI02dGJlTU4KHg/2
         HT2IbO/LQOPbMpA5rSnWgisAx+Dfjvvo7+Xmp1/AqyyXVTGkQVfP4eYvxPZLhi6L2b+a
         uGk+GMTGin3k4fZ+LJPfol1OISigp8L78BWB/ISks8/NaicjrqQVG1RK7AW911sUDzWP
         zISA==
X-Forwarded-Encrypted: i=1; AJvYcCUrF2/Ah8QeyGsI4LiX1ogFWGECvM4hsETOT2qH79GSfN+wK6soKFn8mLY9GCY1XiUwdOUkBDKX6mM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmjvn/5Q9mtO4Wda8pDTmYr5HB7lcgNo/vLXbNaMCNBkSyDqvb
	ZeD4PbXCZtDwlU0/OBHc6xLpvk/upGNr+vDvd0FEclwIhV79iTeBJgiA
X-Gm-Gg: AY/fxX7Th5pfpTa6E+ixJILgchz/4IuXV+uQQuZDvl/lsM+xk/P/S4vQDxr/P1zPH/j
	Db+SxWEjNNUkFmfeGRr/lzD9sU2nZnpEISsiLO0LL2LXKzWPeVP/8qxzyni9OYlb8/ER83gjLmt
	er24Y2XiYrIUSavDO7V7yPP5N7LN87fOEDgCPjNl0ERKWPsu3gfsSZBBOk4qz81MTaYtEXV2dw0
	sUHJD0Zez/YWLYpF00uvOgRHjn01khDC5NzU1vLa7VXbjr8dW1AXSoofhABchJ2cnkHwcTt7h8v
	uJHeg7fCjdh/FfoJ9qcrzJzYx8xEcIeMnHfM78X9G1MzSak1EWQ8EC/8YsN4JgwfQJeHR7Pnv8e
	zEqjKuZA5n5ot5FA2tsRKXd7NI1GMe2l5wquzeFxH/xZY8Vj/zGGCnA5d/P1taXl+W2WrGxAQOx
	iylDehsg1YuUF21Z3uNZv6S8gLbmVvnV7LsmuVfhUCv5Y3
X-Received: by 2002:a05:6808:229f:b0:450:ad22:f9ee with SMTP id 5614622812f47-45c712da165mr2717268b6e.10.1768427023109;
        Wed, 14 Jan 2026 13:43:43 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm17619569fac.21.2026.01.14.13.43.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:43:42 -0800 (PST)
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
Subject: [PATCH V4 1/3] fuse_kernel.h: bring up to baseline 6.19
Date: Wed, 14 Jan 2026 15:43:05 -0600
Message-ID: <20260114214307.29893-2-john@groves.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114214307.29893-1-john@groves.net>
References: <20260114153133.29420.compound@groves.net>
 <20260114214307.29893-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is copied from include/uapi/linux/fuse.h in 6.19 with no changes.

Signed-off-by: John Groves <john@groves.net>
---
 include/fuse_kernel.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/fuse_kernel.h b/include/fuse_kernel.h
index 94621f6..c13e1f9 100644
--- a/include/fuse_kernel.h
+++ b/include/fuse_kernel.h
@@ -239,6 +239,7 @@
  *  7.45
  *  - add FUSE_COPY_FILE_RANGE_64
  *  - add struct fuse_copy_file_range_out
+ *  - add FUSE_NOTIFY_PRUNE
  */
 
 #ifndef _LINUX_FUSE_H
@@ -680,7 +681,7 @@ enum fuse_notify_code {
 	FUSE_NOTIFY_DELETE = 6,
 	FUSE_NOTIFY_RESEND = 7,
 	FUSE_NOTIFY_INC_EPOCH = 8,
-	FUSE_NOTIFY_CODE_MAX,
+	FUSE_NOTIFY_PRUNE = 9,
 };
 
 /* The read buffer is required to be at least 8k, but may be much larger */
@@ -1119,6 +1120,12 @@ struct fuse_notify_retrieve_in {
 	uint64_t	dummy4;
 };
 
+struct fuse_notify_prune_out {
+	uint32_t	count;
+	uint32_t	padding;
+	uint64_t	spare;
+};
+
 struct fuse_backing_map {
 	int32_t		fd;
 	uint32_t	flags;
@@ -1131,6 +1138,7 @@ struct fuse_backing_map {
 #define FUSE_DEV_IOC_BACKING_OPEN	_IOW(FUSE_DEV_IOC_MAGIC, 1, \
 					     struct fuse_backing_map)
 #define FUSE_DEV_IOC_BACKING_CLOSE	_IOW(FUSE_DEV_IOC_MAGIC, 2, uint32_t)
+#define FUSE_DEV_IOC_SYNC_INIT		_IO(FUSE_DEV_IOC_MAGIC, 3)
 
 struct fuse_lseek_in {
 	uint64_t	fh;
-- 
2.52.0

