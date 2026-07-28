Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA7200110
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204762; cv=none; b=qQfqJ3yobTm8NUJn6rbvToU+gzARGcm3VimNiumbijMTp7mFYknFa7ObSmpbUth+f+ipM7eUCgHc1soAc3iSmzhBJKnWQfrJGwtPzr5aPKhUXvOaosNZlzP0u/tsq2tb2snkPlIxeGy2yI4/jaC3r9/FdrLq/McGpfnZf23SBaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204762; c=relaxed/simple;
	bh=5/8Ul0YuH8oP4JURt9WRr1MVGnlI2QvzLgg+waLMaFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCjkmXaYXuv00axGmicvp3NXmGOILjgA14h+Bu2TEqAkwAzPOdcQT8oM1WPP5UQkqmrXmiGr1MzGX+G1h+RL0+ZSZsfkeZKFkGUeRbb1JqY6ruBWj5UPv3AX+50kPyoFTWeDlp1FurjpuKV8ZKEBfvm0pQabVo+D0xM5FJPoAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jGFxahuF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jGFxahuF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848d21bbaffso3464435b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785204760; x=1785809560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJvcEZLikIBmA+aCoCI1tLU4wPuWEmg1S4eA2BlwINw=;
        b=jGFxahuFXv6MTPNDfm93uWXFJ/6Ag1zbaJ5iXEa344eLD2tKQab4aU/6IFMNXOkh6o
         dJAPUfxyib5n9tJQHAQaXVavaQhUwGly2bE0QUnHDiJMfT2AkMzHJGW3ulWlu7UestfB
         ASXJ+t3H5K5RguXBAOyX8x9eLOMv3Ol9paUkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785204760; x=1785809560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJvcEZLikIBmA+aCoCI1tLU4wPuWEmg1S4eA2BlwINw=;
        b=n5OPAXtVfo2dMrpRdxaUazUR4bQowEb6DgSx7GjlizKEk2g12/VGq2xgCrcGBmuldT
         ivLI2pUtH/HAEi5k4A7cOuHjBw6cPJpQwecaEFFxuATsqme7zMH3grCQZVBCX/Tes9yd
         lfOPDt9ZAUv0tIrfWDeJGY1PBPKSsqmBQEA3XALC/I1Rk/3BQfJhB1YuQMWzht/RJCnt
         d5qIG6BJsERazjdYiq1rZnaomijLIeDC/73cweAswC2Eygums39VHPq8cqu55OlDyLjM
         sCdO0PGoUFmf3k8cVXpCJ0rqzJbBpG06wOg5JMb1oC9AANLvv7MRHMG2XYH1qhNOOhFD
         ZHEw==
X-Forwarded-Encrypted: i=1; AHgh+RrlqRlYmuvRKdwjWn/fSSjs7XSjbbu+yNgn7eSgUA7JNl/KWRE8qWoU/vScE4rmw8kiECxdsXEN1Lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1sVLQA810fLxkzPawMTi83m8Gu9yBSpXS2KQQrMx4hAbfNFz
	q5PyhDVscQjgis4jaqhrQL/Len11mUw5+6Fu/FJuqO1RFX+lUZlDzhme5HRfCvc3Xg==
X-Gm-Gg: AR+sD13FI/+fSle3/Ezq5pK9Ur6EC75aFGvR3JgAfJUiJcwzjSA0ZTErDfeueqYu65J
	8moLUzqLCOoZMx73mEOM/VvcgjEZUa/gIYp9tV+NxJtOfyjEA/getEUwF2VCeemAA4cDHHKkdsy
	8P65n/w52h5ncHyg3nprPchiCYdyHFOIcLbzP5JMsCHPm808EVr882mxr4mF6KLluDWrPbVaq9J
	HmuXpKWXdMFGwhjDLmhYb2gb4hZUugkgMdFhDhCsDOLLW2YbrFP9OE5iNjwnN62xXKdUJ0tH4f4
	2TXgaQzlTSlNYKEvHe14I8U9XqjvSh+NguVl0mwDirNhXdjCuSIsN8OAAjhAms+MEIv0tLit8JY
	nBvygIMQZbViTUgdUV5pmwQZJi30lkRVPbSNSpGCzNt+R5ROyDSasPJFkTkbDZNKssqWJ8FW2gv
	GV99X8Nz/AuF8ZSCwmiaf0mJEkK8pSfylCeDB1IWx36gxDkmKXbT7Bi5nnBglnORy75JYyhZsag
	ih9vWncbfS92QZkEbENkOrYEHiMxV96oXzojMTf+66jaRwtqhc=
X-Received: by 2002:a05:6a00:9515:b0:84a:29a7:f3b3 with SMTP id d2e1a72fcca58-84e932e758emr383739b3a.68.1785204759933;
        Mon, 27 Jul 2026 19:12:39 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:f891:e0e8:e2c3:fb20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341e69esm3679461b3a.43.2026.07.27.19.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:12:39 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] Documentation: zram: remove sections numbering
Date: Tue, 28 Jul 2026 11:12:11 +0900
Message-ID: <20260728021229.181627-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those numbers are difficult to maintain and in fact
we can refer to sections by their names (in html).

Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/admin-guide/blockdev/zram.rst | 40 ++++++++++-----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 60b07a7e30cd..2f6bbfd991fe 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -61,8 +61,8 @@ and, in general case, something like::
 
 should suffice.
 
-1) Load Module
-==============
+Load Module
+===========
 
 ::
 
@@ -73,8 +73,8 @@ This creates 4 devices: /dev/zram{0,1,2,3}
 num_devices parameter is optional and tells zram how many devices should be
 pre-created. Default: 1.
 
-2) Select compression algorithm
-===============================
+Select compression algorithm
+============================
 
 Using comp_algorithm device attribute one can see available and
 currently selected (shown in square brackets) compression algorithms,
@@ -93,8 +93,8 @@ Examples::
 For the time being, the `comp_algorithm` content shows only compression
 algorithms that are supported by zram.
 
-3) Set compression algorithm parameters: Optional
-=================================================
+Set compression algorithm parameters: Optional
+==============================================
 
 Compression algorithms may support specific parameters which can be
 tweaked for particular dataset. ZRAM has an `algorithm_params` device
@@ -124,8 +124,8 @@ better the compression ratio, it even can take negatives values for some
 algorithms), for other algorithms `level` is acceleration level (the higher
 the value the lower the compression ratio).
 
-4) Set Disksize
-===============
+Set Disksize
+============
 
 Set disk size by writing the value to sysfs node 'disksize'.
 The value can be either in bytes or you can use mem suffixes.
@@ -144,8 +144,8 @@ There is little point creating a zram of greater than twice the size of memory
 since we expect a 2:1 compression ratio. Note that zram uses about 0.1% of the
 size of the disk when not in use so a huge zram is wasteful.
 
-5) Set memory limit: Optional
-=============================
+Set memory limit: Optional
+==========================
 
 Set memory limit by writing the value to sysfs node 'mem_limit'.
 The value can be either in bytes or you can use mem suffixes.
@@ -163,8 +163,8 @@ Examples::
 	# To disable memory limit
 	echo 0 > /sys/block/zram0/mem_limit
 
-6) Activate
-===========
+Activate
+========
 
 ::
 
@@ -174,8 +174,8 @@ Examples::
 	mkfs.ext4 /dev/zram1
 	mount /dev/zram1 /tmp
 
-7) Add/remove zram devices
-==========================
+Add/remove zram devices
+=======================
 
 zram provides a control interface, which enables dynamic (on-demand) device
 addition and removal.
@@ -194,8 +194,8 @@ execute::
 
 	echo X > /sys/class/zram-control/hot_remove
 
-8) Stats
-========
+Stats
+=====
 
 Per-device statistics are exported as various nodes under /sys/block/zram<id>/
 
@@ -296,16 +296,16 @@ a single line of text and contains the following stats separated by whitespace:
 		Unit: 4K bytes
  ============== =============================================================
 
-9) Deactivate
-==============
+Deactivate
+==========
 
 ::
 
 	swapoff /dev/zram0
 	umount /dev/zram1
 
-10) Reset
-=========
+Reset
+=====
 
 	Write any positive value to 'reset' sysfs node::
 
-- 
2.55.0.229.g6434b31f56-goog

