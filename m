Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7942F2F067B
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 20:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029852; cv=none; b=K/juBYEmW3SxIat63Mu2BrkBtEg7pIR12ogaYhljOFVCMeI5zIOH7HTfGclWjYft+7sZxfqx7XwOD8I6P0lQPLDyn23lCGE9X8DTnVZXzAugzRF8SM2zaF87CtexDv++jYBPqrjgEPd5UGqgbC6BJ+q7u5d/AYvYvDdWFFRPVMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029852; c=relaxed/simple;
	bh=abdUk1eVG2MWeMiVvg3GA6vdlUr2x3/LEGnaf65+VCI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fk4fKgQ4EIfpgHBVxnNkr5OAiVS0NSJDJSDyfK8VF2uJV80LqtOjZKNMmC74E33caQ/Z6lwI8je1g6+TeUuXR47XHA/NnDcsDDZ1iwm7vP9mjShX7ETrJjT/EtAqmRCjPcnCy1leNKPrWPOLhRaADBTYqCa8Cchlz6XrhCTqa30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMLnSLld; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMLnSLld"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76b6422756fso8255336b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 13:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029850; x=1755634650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lqgQFVPvnKB2es+1oANPG8DBWM8TFCT1pPF5iWRaFY=;
        b=PMLnSLldpgTAnwOu6ASsZQpLBF/rCFfjIWlnqY+g4DYi3iX26UpoRjyU7wd6MI62SK
         JJDpDSIzjrYRsWb19MPezEnkosYv3YHfVX3DiRbbXkK4jZeIKnvJvfC7Oi3iYe3CMSly
         3REwKi5Ivh+Kx7QqZTuIsEgOTZPCvpi7mCThjzenWb8JUCA/D/m+Ty/yETR3RGkJqhmZ
         eDLy4iWV/p0cdP7hgabwkDcXZ/B3BQy7JilFINF3Upq/xg0BEh49XBkPA2Crlrn8Tl+2
         fZwPtFQQXMKGQBvi5EKzh0XI0bAfZmDc7gqdyaQNKmpUWLDYrsVMx+ZlD/OBjHR7C2mw
         sHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029850; x=1755634650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lqgQFVPvnKB2es+1oANPG8DBWM8TFCT1pPF5iWRaFY=;
        b=FtNpip/hibJijBaunkXfyewLVcf4oWZ6ocnXehjJvBZIpUFV0OeSRkrU+7kNQ0DNqf
         cXAYeNdTgOutlY+I5BJS8Gek5vqJYDYTNShkIyC/RQVnlB6PON35C43KMRyPMRfeQC+L
         HvsnyvsFtxNCzmm9h/EwKdtf99dJzwsGtnfaL6s1DsENdRGqlo1p9xkKgR8XuGUrmVIX
         CgKFkUHwtXzKPuTEIyc3QzkX1UX1RhjQXNfMQeZY3UNHv1Qckuh8gjTTY/pnh3Ypposs
         814ej5AA0hUiregGjfn9NrX1R9maKBTNWABIyK7fzbLaSDECKd7HRYzR4Okx1XSeWv64
         q33w==
X-Gm-Message-State: AOJu0YzGdcPQDE2vqWbFd/hSJaoLpZldQjRFyuKIK7ySoI3YwQCCdkO/
	CTTRjnXgRSSZpo87RQXk5wvCoWhSCsG9uXzFdcVAZ9sZe0rJ2FTg2gPH+K+VtjaV/eU=
X-Gm-Gg: ASbGncuEC2UePEc8NzyxCIh+ksqPvFN0EeztohtyIV3pVTM6axd2vti66lg+9xCMZHh
	EqS48ZHBqGq11Eynq/p0FXSwmp3NiPIysr9t2sMVmsYZUnWs7zd4R0P5OjS9LCmkKnB2RpNLlID
	K1c3/di+YkgWnjgg6qsbOq5++yHfHv5bamGjsULnjOBBiqI/OcDab+zZy7cYjGP2RdvML8gqlht
	oOnJ8gxmocECDTlvIhtk/T5Jou58owDoSkpNhWkD1BQ5Qe0xeIbAlb9xSLr4y/WMHgLHEgt57j9
	M1DuatdZ5Y2uf4XcWXsg5BBHz/uFL+to6X3l7KE3qkEBZqhKcmHQSUEyT+B9Fi84eRRwfi658kO
	/6W74Uxix9AvFegoTxy8KhO8EBL/c96k=
X-Google-Smtp-Source: AGHT+IEUG2yfkfG8FO5ZYuepyy8+eJ/D0rBc0tUSXxLKM+VvLkRdz1nWe9WBE2EaHy7Gy1CWzkir0Q==
X-Received: by 2002:a05:6a00:1142:b0:76b:caa2:5bd8 with SMTP id d2e1a72fcca58-76e20f9de63mr630941b3a.13.1755029850208;
        Tue, 12 Aug 2025 13:17:30 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f48fsm30198046b3a.40.2025.08.12.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:17:29 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2 1/9] docs: f2fs: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 01:45:15 +0530
Message-Id: <20250812201523.69221-2-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812201523.69221-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- deivces -> devices
- substracting -> subtracting

in `Documentation/ABI/testing/sysfs-fs-f2fs`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..5f53938d07c3 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -822,8 +822,8 @@ What:		/sys/fs/f2fs/<disk>/gc_valid_thresh_ratio
 Date:		September 2024
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	It controls the valid block ratio threshold not to trigger excessive GC
-		for zoned deivces. The initial value of it is 95(%). F2FS will stop the
-		background GC thread from intiating GC for sections having valid blocks
+		for zoned devices. The initial value of it is 95(%). F2FS will stop the
+		background GC thread from initiating GC for sections having valid blocks
 		exceeding the ratio.
 
 What:		/sys/fs/f2fs/<disk>/max_read_extent_count
@@ -847,7 +847,7 @@ Description:	For several zoned storage devices, vendors will provide extra space
 		filesystem level GC. To do that, we can reserve the space using
 		reserved_blocks. However, it is not enough, since this extra space should
 		not be shown to users. So, with this new sysfs node, we can hide the space
-		by substracting reserved_blocks from total bytes.
+		by subtracting reserved_blocks from total bytes.
 
 What:		/sys/fs/f2fs/<disk>/encoding_flags
 Date:		April 2025
-- 
2.34.1

