Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA5640FD9A
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258291; cv=none; b=EJwNOCJRalcHNPqSZ9BhU7u3LJ8AQ9lKtDjfEmea31IphbvKuJM24veDjR3/eDNtQ9blWMVo5Bei4Pp6ktXFSkEfhLq2Tbf99YMPX1FGXylIjHIlxXnyv6zF5byHCnh73X+EtBEBn28I0fp9L21gpsv+aYkAIL9LN6Zt441zMqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258291; c=relaxed/simple;
	bh=miCZKZSIXfc6On14RY8eKkgbOftaXNQE9AEPWg/TRyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ux11/BC3rC7IwRVZCMfXg66jG3Qvgl0zymeyg6Zj6QWNLwIAd/rPqbH19BZADPiA5Q4i53W2opE1QBu/OGd3E97c79j8JFpluX1GrWDnUUXnCjy0+zpYOwnMC3IEYlQS58P7Cf2qC2l4pkoPs5mlqu/1ajLF/n7zW90/CcQG19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssvgksz1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssvgksz1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so25098005e9.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 09:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778258288; x=1778863088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9QeD8Xg4H3P/Vzek1gQkKxkZvHNGvXC5sVvuQGVo0o=;
        b=ssvgksz1zBUxuMSbRp9kBv2BeZ+X1fwku0qNDOvxMoqdezVV7UXYRT18l3EFbbP1PC
         yidl3V4BzRjW7WiUWqs9jRRN+9Vo9zQDBvhhJ2wb6NpJcnFl+AKWhNzLfXXRLM7D0MvH
         YHyyasrJMj7Zuoq2qFQIyuuOZjIQjV+1HvEmyxz/iVhcrrzmD8mEOLuek85B4uXHa2T/
         HfIZiUf+BRaYPl5e60G3Tz64Ur2JyWeDbBsAGC7J+Tz8t59XxZkbtDKb2efIymNMxYx4
         e2GB49O9iuL/cjjqiwsrjV2VqJ0bwlkYz1YWOUXscpUuU8CI/ST6kVJ05OeZTuhePx+b
         gPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778258288; x=1778863088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9QeD8Xg4H3P/Vzek1gQkKxkZvHNGvXC5sVvuQGVo0o=;
        b=QSMbHnGs8c8N2VO5pYBgZPJmp2HN95BOAihSl2FbrCIoRNY1jpjclqC9xAI/xv+som
         VmEZlp6H+7UrLWjZR5gqTdWwzOxj8OgMYDMJZ8iiIQnCvIVGg6G3bNdx/V1XO+HF7SSA
         GWr5na9R30PM8oxbbi6mKV71eWsBSz6fsvig++oPG+pAgZDdp3iVnqU0whbfl+rUny6+
         x5pVfZpwdMproKa66yOb03IiwRJqBqQjnWpGECH0fcN2z7FG33v39KskQn5Qd8Xk5lzC
         ADwvd8ERf5T9XV7NgNZ6SKKPGnqZROI4qvAMbNlIHXBwWZCbTQZRO7c0/t+7MZ3xayVs
         c5lA==
X-Forwarded-Encrypted: i=1; AFNElJ/Dq/XU+YV/0sL3C518vO0jDUhBx3YE0/5f7jLe9PFWxQzhAseWMZud/mFFplrKlR7F+pWEfmer8aY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd/5AfiEMa7fkTtE7FOg7lyqU8ySUXQrd+gx8WQsyOgZu1QHjk
	AAdWWgGWPGu6RUJI2q43YoxrHHfLzQaaF2/3x8YCr5yDS0XGWBYLYKYK
X-Gm-Gg: AeBDiesiAvy4dRT+mbl6TROutrkrOhUQxbPSqKDegywqfuj+KZOrU1Qj57UffXmTYWj
	WJtoNeFXKlpAj5/i+jmFy0B5Oh6pIXrUNhzKP+GTLf4j+i9v+w8jFBq1rUg5Olye1PbxsZnvhl+
	C7EYmkDT8jpapmf50fx3lgnQazidoZVSl9g9UdENjCXcHdpkPzoZR4s8kceZyI8CHNlPYk/SKF2
	PBD5I4Db0WC8stxzL4EDDc3sQKc8kFO3dkJr1k6+MLMDPk3JkodU62DFI9jSiAvlFhczyj4DWHR
	vzcQbNEfnbXi+SU8XHfeGNctjhZn6mVR6MGkfbBBkUt3xW9J3bGdaV7HI/Pa6A0f0BtDZQN2qb2
	xBHkSMutH56XfT9gcCX6Plydb9jMg/6PQfqbqU7H/T3btCCPMUQQcXrpIHIQtLDsFv1BX6htOJk
	/Oo9koScT6IgqMDCBkPKGwz4PbpjsdytGalJOGDykST+t1N5D03IQaVanOxAvubU9M/MSgX4kzO
	RAkNg==
X-Received: by 2002:a05:600c:3ba8:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48e52bd5035mr240431645e9.14.1778258288419;
        Fri, 08 May 2026 09:38:08 -0700 (PDT)
Received: from arey-arch ([2a02:1210:7298:ec00:73f0:d2e7:188c:1f61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6daf496bsm5648605e9.4.2026.05.08.09.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:38:08 -0700 (PDT)
From: Adrien Reynard <reynard.adrien.08@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Adrien Reynard <reynard.adrien.08@gmail.com>
Subject: [PATCH 5/5] docs: fix repeated word 'at' in journalling.rst
Date: Fri,  8 May 2026 18:38:06 +0200
Message-ID: <20260508163807.16284-1-reynard.adrien.08@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
---
 Documentation/filesystems/journalling.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
index 863e93e623f7..2825f6c030c2 100644
--- a/Documentation/filesystems/journalling.rst
+++ b/Documentation/filesystems/journalling.rst
@@ -93,7 +93,7 @@ easily as on jbd2_journal_start().
 
 Try to reserve the right number of blocks the first time. ;-). This will
 be the maximum number of blocks you are going to touch in this
-transaction. I advise having a look at at least ext4_jbd.h to see the
+transaction. I advise having a look at least ext4_jbd.h to see the
 basis on which ext4 uses to make these decisions.
 
 Another wriggle to watch out for is your on-disk block allocation
-- 
2.54.0

