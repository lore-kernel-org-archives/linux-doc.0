Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE05C344DA8
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915498; cv=none; b=ae01JyyI4fpmAHhDjvxVjAOEADdFBDzJ1uIgTZaqJk1N+Sf3yRdxvBbnnHIS2BVYP4Bcf3i3iVysl6vZVbnBQJtktjXuX3h9gz0Stxo3559qinKqxF/PDAKlgPuN7AxAQdf3ZfCsvTXdjiHqZ7pKgWoaET42OJ8n0+MENwigJBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915498; c=relaxed/simple;
	bh=F2YhkKxijOykhMXxuYIQHg9yc5lvoiTeuSTAXbMCDKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDNi1F8V/imBfd/GxoZ5jZV/TS3STUowyoc/ux+v36Cz6klyQ2DR1Xixp9Q+UasMkU3DP1X74OY5sZnV7JXZIWMU5r9KA12xNSrhHUUljIW9JE3t6qqzeJpVEQO0pPovAFLYVAA4unicP+sUUG0Q7cdElL5HmZAAfhOi7YRV2Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=UMx7eUN3; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="UMx7eUN3"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ca70925c25so6143115ad.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1782915495; x=1783520295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d1+h+rP9Cy+2+urt39ChSGhrhtQb1acD3XumdB+25eg=;
        b=UMx7eUN3By4rRKYXRT01i8LLjaKheA+NlVMhQeTz9nFfMgpVyPYce6EwKVOpFRqi/r
         4jyWocu1MuMHn1iUYOHipxqm1p6RleLsLBKpLA7g6ZDIn5eZBNCuuNyjLMq+MBBBHr88
         3HJPdXGiG6nY1OzKB0CT5pRB4J1zuqReuWEA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915495; x=1783520295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1+h+rP9Cy+2+urt39ChSGhrhtQb1acD3XumdB+25eg=;
        b=Ffk3q+cUAnKHUX3dYTJjZ0ZitGI07AvBtQuOgrYAhB1c0a8cx6Sj/wwyx34sI10vpA
         m5EFir3hobLCiUUYd92cx/7L6XrmzwebxM7rBTo1hLhejbkJOeqXPRlqScaf2/VddwtD
         2UdYRnb6cxf9xVmxLWJ5fFA/rWGiJL4q63f4fNm3PFafcKqmS2Qx7i8pRKWBc3JGDzg6
         jEGcgugF3VlxWUjT5tOEJcvwhm8Jn5GkoDXQxUuH8Q6w87J1UT7ImvjGzrckjfUSoEQr
         XOc8HOFqaj2WQVMszYCrFwxkoF4GLGfj54ZyFbFdUHY3No12beGhP8Yroe53o42BVr2X
         QeKg==
X-Forwarded-Encrypted: i=1; AHgh+RreYl7Zn9ZFOfFRzeX3kLivLbjpEu7NMIIDEPea/foz8vpclbb3DEoPIdhWH0sBNaRdf/GUKWW8pqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIOcqEcSsmJIxzpfFeGKimYRUeHuwDSdVOyXW8dAJ5su7YjCFA
	CZSE1pYXjNDZG9vkw4DgJ9HgrTE7AQuYjsMiD4G6MfwWMCoolOHm60Tsq05XbAlLtr4=
X-Gm-Gg: AfdE7cl3z0RP+Rds8A5/rnRshIdpZpz+Dicb+MF7kdZOPArhJKmVs7QoaifWYbztmbo
	0JeDrMZNAj2SBtjfUYIpQIBxZQKde2C40/kh6gwXWzmSIOAz2/3HCDH+lio3U2vUYUvqxAV+DaF
	ITuC0P6PLBeRuLlenNCtDGz6NsToXjW9R1fHtwMZH/QZKsOhg6xBmKXvY0lDk4d2rrHy+ukVcUL
	qMSCXv83w2ymc6c+E0MmngB/sCS4YRwERp4LYaqTnAiljm8WZegLDaG4KWgpmpUB3Ox8+F3KgNs
	SR7oRkvFZ1pFZckb1chIfdfcQn72HSEDxqMbvYteJWX9d0tXvxwg2eMLlggSV57xK2SOZSK8nai
	Z8770H8KQsM5mpW95c6t28RUm0jRqgDI7ixOfdi32NawHuXbfWyhM8b8WUc8pzPwhv0eM8eJzmE
	1s/fPvkygaNh3J/ii7+zr0sUP76F6p9jISY+U=
X-Received: by 2002:a17:903:3848:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2ca912002fbmr8642185ad.34.1782915495058;
        Wed, 01 Jul 2026 07:18:15 -0700 (PDT)
Received: from localhost.localdomain ([59.29.41.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c8f3sm33109975ad.41.2026.07.01.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:18:13 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seongjun Hong <hsj0512@snu.ac.kr>
Subject: [PATCH] docs: ABI: sysfs-kernel-slab: mark cpu_partial attributes deprecated
Date: Wed,  1 Jul 2026 14:17:46 +0000
Message-ID: <20260701141755.85119-1-hsj0512@snu.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-cpu slab and per-cpu partial slab mechanisms were removed when
SLUB was converted to per-cpu sheaves in Linux 7.0. The cpu_slabs,
slabs_cpu_partial and cpu_partial sysfs attributes were kept as stubs
that always return 0 for backwards compatibility, but their
documentation still described them as if they were functional.

Update the three descriptions to state that the attributes are
deprecated and always read 0, and note that they are retained only for
compatibility. While here, fix a "partialli" typo in the
slabs_cpu_partial description.

Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 Documentation/ABI/testing/sysfs-kernel-slab | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-slab b/Documentation/ABI/testing/sysfs-kernel-slab
index b26e4299f822..9b0085b86309 100644
--- a/Documentation/ABI/testing/sysfs-kernel-slab
+++ b/Documentation/ABI/testing/sysfs-kernel-slab
@@ -113,8 +113,10 @@ KernelVersion:	2.6.22
 Contact:	Pekka Enberg <penberg@cs.helsinki.fi>,
 		Christoph Lameter <cl@gentwo.org>
 Description:
-		The cpu_slabs file is read-only and displays how many cpu slabs
-		are active and their NUMA locality.
+		The cpu_slabs file is read-only. It is deprecated and always
+		reads "0" since the removal of per-cpu slabs in Linux 7.0. It
+		previously displayed how many cpu slabs were active and their
+		NUMA locality. The file is kept for backwards compatibility.
 
 What:		/sys/kernel/slab/<cache>/cpuslab_flush
 Date:		April 2009
@@ -509,12 +511,16 @@ What:		/sys/kernel/slab/<cache>/slabs_cpu_partial
 Date:		Aug 2011
 Contact:	Christoph Lameter <cl@gentwo.org>
 Description:
-		This read-only file shows the number of partialli allocated
-		frozen slabs.
+		This read-only file is deprecated and always reads "0(0)" since
+		the removal of per-cpu partial slabs in Linux 7.0. It previously
+		showed the number of partially allocated frozen slabs. The file
+		is kept for backwards compatibility.
 
 What:		/sys/kernel/slab/<cache>/cpu_partial
 Date:		Aug 2011
 Contact:	Christoph Lameter <cl@gentwo.org>
 Description:
-		This read-only file shows the number of per cpu partial
-		pages to keep around.
+		This file is deprecated and always reads "0" since the removal of
+		per-cpu partial slabs in Linux 7.0. It previously showed the
+		number of per-cpu partial pages to keep around. The file is kept
+		for backwards compatibility.
-- 
2.43.0

