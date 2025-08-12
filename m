Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B495A20C469
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 20:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755031910; cv=none; b=Q9s/eOs+eqi0svkVyvfeQenyhyC6X4c0p8MOZ4qbLNzEbUHquFtl+GRuJyWraO4Hz8sgEEl6bw3dZALLkwnOLEbYtkLoxmtwojyhy6voknIkP9wxxi7LJDlqRXXKZ0KTaLeE18QGKpVhgP7AS7x5MBulhmNd9v8K8sQEWUVOt5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755031910; c=relaxed/simple;
	bh=72/rW/U9hfSGKa/EluNbR0vaerLlksMsoG8Uz/YysFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TDl/gXsUgPyVozRXTK2KrOQcbBVXd+kh9J6PLqUdc33nYwOxsQRbQbDBeV/5+s6JnlPL0ovyhn03/ukfVHdYlwoGcbLaOwWp4vQzPfE+jYBI89K5xmLu8REMsFLNez069ZhMr04KW5m3LUZPVRY1XHdIO7+lrdrqj4IoZ3dOtuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d19TirzV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d19TirzV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-321c41cdab4so769777a91.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755031907; x=1755636707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAt0IjQcmWPsXVdAdFWYUtQj6oXeDL0Qo9K0VCGCNPg=;
        b=d19TirzVUdepekZUiOLSMHFiQ/KcaPE6JGhaLnw4sWt0x3skPTdyEpf58xpe0/gkHD
         jw+UJq0ZBVzbSHqmSr7ZVJbYxC9fHafnQx9B6f/4OEtWU3stWUeRLa9UuZ0xl9uszlXX
         WG4YlOHmAEBqJpK5bK2A1mDcch/Bifxnbd7D0VhOcJWqw6EWu7DVOkvitvYVF5Qs3WL6
         +BwjSY4v7ioCyV/EqudoFNhEfOOdx7FtoADxuMNyPz+/aLbitFC7grgfDqVPkS5vH8vF
         3H8SONzk5rFPirjMSsTK9ML0WKqwaul+FoKfu/+5et3gDSyy9fDzTZjBzKGGaQeBJZeT
         G++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755031907; x=1755636707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAt0IjQcmWPsXVdAdFWYUtQj6oXeDL0Qo9K0VCGCNPg=;
        b=hBZEK0B7RJtv4bXccJ2drW37kbGkP5QmC7wILITc2VyzMsd2yi38YEidok0+3JV/N4
         olyvzY+2MV+5cPrPfmn+fxFHYpos49gKfL7sqaZtfnWaKYK+QiiVCH5qgYHokjBdnl6H
         Q0IPZO0oR47z8plwnMhz9iODw12PZVgw+UF98PPBCOTB8E9gxObBdXetJ35YLhocagzc
         JAwwSfLE0JazNnlvINi4rxJUrbcJFo8X6q6GB3EkrEH+XacM92oHrCt1D9MAb7PGF6Zh
         zI9wzzGLr/Z2qNuwOt2KZU3aq0hrLWcRyCVxTk2vWviqQPN7WX9GRVtIYVzELvWqQeH4
         zR7w==
X-Gm-Message-State: AOJu0Yw9WQy3cHTK1n6Kcs4f7X8cQhXI1ha+8uu0ysLjUscfE4QMjIzf
	4xT9SVyTS/wfsnHkVTu2N0naMQDwQIO4DjHw0dd0UauI9HIaxkZsgWqjMRmHeSP0uGA=
X-Gm-Gg: ASbGncssDtJsrkPy8FK79ZJRY+tF3LSXzrxn4BTEiCdV+YiFoG3TiCH9brwwPJQg9Ng
	t7TJ1rpnkQhSXwOInWvnGQoA4+Yu3uGDE6UAFgYdYlfQcmmEEajHo0xW07qVn8b5FSRmu/7koyi
	jIOUwJQcU0i/CKogc3wzWTxC2IVkvOZ8By5ocuuxaW1mFVL2+0QPmy/LPccZjXbbBPiE49sbEdv
	o9Ub2Wywptlc7z9v/nlDKqT/CScVCArSiglP0huAv6bzb9a11Qns2yd/lV8S4f4G7DiQGZznOIq
	DRZr00XJdRhmEw6Be4hvCtqBMGK9PQGMe7xItoXbjmUrVZaiss/yU/Rcq4y32mrrbzalRi4RPG9
	rfonZ2sUtZ74QlyPnFEmPHd3LKyF5T+Y=
X-Google-Smtp-Source: AGHT+IGsXUIDB/PAF2iTQW2I+RaNPeuCiwYjXE6+sYMw9pUYocPZrUTfjUalk1qA+n2hBLrmTyn1bw==
X-Received: by 2002:a17:90a:dfcf:b0:31f:335d:3424 with SMTP id 98e67ed59e1d1-321d0e66003mr603651a91.27.1755031907429;
        Tue, 12 Aug 2025 13:51:47 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:51:46 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Sakai <msakai@redhat.com>
Subject: [PATCH v2 4/9] docs: device-mapper: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 02:19:47 +0530
Message-Id: <20250812204952.73136-2-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- flushs -> flushes
- explicitely -> explicitly

in `Documentation/admin-guide/device-mapper/delay.rst`, and

- approriate -> appropriate

in `Documentation/admin-guide/device-mapper/vdo-design.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/device-mapper/delay.rst      | 8 ++++----
 Documentation/admin-guide/device-mapper/vdo-design.rst | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/delay.rst b/Documentation/admin-guide/device-mapper/delay.rst
index 4d667228e744..a1e673c0e782 100644
--- a/Documentation/admin-guide/device-mapper/delay.rst
+++ b/Documentation/admin-guide/device-mapper/delay.rst
@@ -3,7 +3,7 @@ dm-delay
 ========
 
 Device-Mapper's "delay" target delays reads and/or writes
-and/or flushs and optionally maps them to different devices.
+and/or flushes and optionally maps them to different devices.
 
 Arguments::
 
@@ -18,7 +18,7 @@ Table line has to either have 3, 6 or 9 arguments:
    to write and flush operations on optionally different write_device with
    optionally different sector offset
 
-9: same as 6 arguments plus define flush_offset and flush_delay explicitely
+9: same as 6 arguments plus define flush_offset and flush_delay explicitly
    on/with optionally different flush_device/flush_offset.
 
 Offsets are specified in sectors.
@@ -40,7 +40,7 @@ Example scripts
 	#!/bin/sh
 	#
 	# Create mapped device delaying write and flush operations for 400ms and
-	# splitting reads to device $1 but writes and flushs to different device $2
+	# splitting reads to device $1 but writes and flushes to different device $2
 	# to different offsets of 2048 and 4096 sectors respectively.
 	#
 	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 2048 0 $2 4096 400"
@@ -48,7 +48,7 @@ Example scripts
 ::
 	#!/bin/sh
 	#
-	# Create mapped device delaying reads for 50ms, writes for 100ms and flushs for 333ms
+	# Create mapped device delaying reads for 50ms, writes for 100ms and flushes for 333ms
 	# onto the same backing device at offset 0 sectors.
 	#
 	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 0 50 $2 0 100 $1 0 333"
diff --git a/Documentation/admin-guide/device-mapper/vdo-design.rst b/Documentation/admin-guide/device-mapper/vdo-design.rst
index 3cd59decbec0..faa0ecd4a5ae 100644
--- a/Documentation/admin-guide/device-mapper/vdo-design.rst
+++ b/Documentation/admin-guide/device-mapper/vdo-design.rst
@@ -600,7 +600,7 @@ lock and return itself to the pool.
 All storage within vdo is managed as 4KB blocks, but it can accept writes
 as small as 512 bytes. Processing a write that is smaller than 4K requires
 a read-modify-write operation that reads the relevant 4K block, copies the
-new data over the approriate sectors of the block, and then launches a
+new data over the appropriate sectors of the block, and then launches a
 write operation for the modified data block. The read and write stages of
 this operation are nearly identical to the normal read and write
 operations, and a single data_vio is used throughout this operation.
-- 
2.34.1

