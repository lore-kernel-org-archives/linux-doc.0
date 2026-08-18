Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B53672BD
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089588; cv=none; b=RBqp6BshagALEdWOqQujrOPkI4SmS3A+xEk8VV/feSLncqjEsAAh7mKrd91pGy+8jEgrVLXt4vhGo+Rv5F91VSgHBgsB3+C4XeAQwlX1LDZuUwmW3WjPO4gMsIi06wY7aR5CNFoS3ohP/MimnS40CvCivjqiPXEZUSsIHoin4hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089588; c=relaxed/simple;
	bh=/q8hG1HOccz+AJjNFdVlUE/9f6w88KiWNmEioY8fPt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hn1DdFe2/+kHrjaOR20KhJ/OOR9q4APlYn19Hb5k+Tkbdmc1fc8iRahKrUeydBomqschDSzILBY5uwqR0/cFgF9uCqw5lN8wTITTSrGQ28MU9L4D7mMagxWH7uGquElb0uS4i3q79tDoNI5x9NfDDEdqz9yVTnJLXkBNDHvwTgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oza/OBXa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oza/OBXa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956869750eso1927115e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 14:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787089585; x=1787694385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZYRfp0/X2LvT2oXc8wVuBSIyEOJyJnzKAFqCXBxq8k=;
        b=Oza/OBXaJ3KM8iSvXUZKAV+C+WqpdQEwJ08CgDM3kFIKqt5V1/l3drKy6tuQYlLgYk
         PeQY65btr0njPo+tGLypQVN5v4Wz/uwpQLGI8hWSGaTxrsw4rxGXyi3h8gTSqLpT4TEl
         KCRZqG7tGd+D/ieg34GdJyq6RdH+SHxRk8ZdVtAdZJhaNSjUinAJ5Ta8jSPACFlIBPOq
         AWv9ws37Ss6TLVV/XkJ+3HxoeNE++1HmnX9OaCslHeu0wLE6kxp4XiCe4Uhe0Rv/KoOw
         qxDb3jfk/dftne2OV4LA/LqackwLTekyK5ucvC0z1M0m83aIoAe7hCLL4uLLd8rh+eaw
         bLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787089585; x=1787694385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZYRfp0/X2LvT2oXc8wVuBSIyEOJyJnzKAFqCXBxq8k=;
        b=L5CRij4pSx1DGB+oCtF75qFweuyQN+AFx/sgP9PljFG9fH5knAfb70N9u3wuhMgGoz
         101BKh/ViK6EhvKFSoJ7benXgl4Gpszgo6dRdvgjmgkOFSr+Z19ahQsdWuER+T1maJn5
         YVAm6b0sWDrHwgiDwtoTFHL0sekowypQg78YAsIiTNBCfRWdajILwq2971iVhOZ5Kz4l
         Z9QAZu0ZBaz/UzD4uf7q4lm4gfdx4RblHcdsr9kYyVnyZttbBhSQWqwmdV8YT4V+8IdK
         UkMnEXljEQUibzoR4hBaymBQ47ddlRjhbNiv8Y2g6JIZOx/t1W3vMO9Pesq2FkGXTWAz
         TYLg==
X-Forwarded-Encrypted: i=1; AHgh+RqJowr8+RCAd1y5Xp+WITAjVkw+bayAtvDFD1SlHWxT32VkNrMmlUVxs2l1mKVI9zfhJcDEKIOrE6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd5/+aZ/O2Zv94vMGtnYxBYtWlMW0gwyzIZr3OlVe1V7f/GR93
	52TzFJTMLopdiHaokHZ6Kx+i6vBo/0Y90tX0sqbPCgIsFDqRDIBRV8A6
X-Gm-Gg: AR+sD11QOlQHLsIoXB2EpPq3STKoKRHRZpasV2tCtEm6rt2E32+le4Bi1BSiv3VzLGI
	FdIZtmwpdR6aA3TO33ohNjzk1JwqxAAwDOjvLNdUM6k5QdIs9fcliRIm/Nxyp8E2Q5koLXTJ4eh
	r7GicfQ8tg/JYcyC6JXrNhGg868WO89USOZJrzFDTvRRcw1txz4Ux5jHoetYEXLIsbP5uKF+Y5j
	dWG1E/GB4cM049C1sTJzqtqHLid2gfyF28lYgJELW8bqoqFwdBJ5lpi7nZdmfBac1G/jJYMSd+t
	Hh7ATCt5ynF0ED9fOozlsTU28KGYo1DhQI082QuPVAejtD2+AbXqp6ujjaxRc9DyoB4W8X+zBR5
	Ak/yCHrGmtqjwin4eIMjwwVHecyI2eue0Az52qoTt0QR/HcdmAl5ixpgLi3C2ijSOEtEWMcpzyU
	iAC3LwtOrymkWujbrG314Rm1sxf0g8UxqKYsKcVurfUGa4ddwADwMA9fUr55pkc/plQze6dF5Z/
	UUevWRCNUADKDuVJlfXIMcGSFzSysDqDNQwxNlc
X-Received: by 2002:a05:600c:354b:b0:499:872b:abd4 with SMTP id 5b1f17b1804b1-499aa1a1f2bmr1882895e9.6.1787089585136;
        Tue, 18 Aug 2026 14:46:25 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.97.113.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e84d75sm3588685e9.5.2026.08.18.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 14:46:24 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] docs: filesystems: proc: fix typos
Date: Tue, 18 Aug 2026 22:46:03 +0100
Message-ID: <20260818214604.20349-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix five typographical errors in the /proc filesystem documentation.

Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 Documentation/filesystems/proc.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index c102b62023cd..78a632fea2bf 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -440,7 +440,7 @@ ioctl()-based API that gives ability to flexibly and efficiently query and
 filter individual VMAs. This interface is binary and is meant for more
 efficient and easy programmatic use. `struct procmap_query`, defined in
 linux/fs.h UAPI header, serves as an input/output argument to the
-`PROCMAP_QUERY` ioctl() command. See comments in linus/fs.h UAPI header for
+`PROCMAP_QUERY` ioctl() command. See comments in linux/fs.h UAPI header for
 details on query semantics, supported flags, data returned, and general API
 usage information.
 
@@ -576,14 +576,14 @@ encoded manner. The codes are the following:
 
     ==    =============================================================
     rd    readable
-    wr    writeable
+    wr    writable
     ex    executable
     sh    shared
     mr    may read
     mw    may write
     me    may execute
     ms    may share
-    gd    stack segment growns down
+    gd    stack segment grows down
     pf    pure PFN range
     lo    pages are locked in memory
     io    memory mapped I/O area
@@ -719,7 +719,7 @@ size, in KB, that is backing the mapping up.
 
 Note that some kernel configurations do not track the precise number of times
 a page part of a larger allocation (e.g., THP) is mapped. In these
-configurations, "mapmax" might corresponds to the average number of mappings
+configurations, "mapmax" might correspond to the average number of mappings
 per page in such a larger allocation instead.
 
 1.2 Kernel data
@@ -2008,7 +2008,7 @@ For more information on mount propagation see:
 These files provide a method to access a task's comm value. It also allows for
 a task to set its own or one of its thread siblings comm value. The comm value
 is limited in size compared to the cmdline value, so writing anything longer
-then the kernel's TASK_COMM_LEN (currently 16 chars, including the NUL
+than the kernel's TASK_COMM_LEN (currently 16 chars, including the NUL
 terminator) will result in a truncated comm value.
 
 
-- 
2.43.0

