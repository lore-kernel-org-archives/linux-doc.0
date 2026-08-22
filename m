Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95383AFCEC
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386241; cv=none; b=vBuw/LkdbUgRASPm45LeZsRaNwofbj70+k6uF9WvLOr69VNVEx/Kn9O6nOQXgIeXurAHrh5FIlEAzlWr6Jzz4vLYqkftBH1dk/x4RPeHTCBGVwlROLjN08PHnhGN7uyFpB8ulxj2sUrjcJUrjsLvGByh0p+D5uw6zePNHfAEEaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386241; c=relaxed/simple;
	bh=8dpBHV5ZpKgmc3MhvnVoObSzPNUFx4cCMcQA9FwXJRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bV0azRpQd3QP5NTdZb5hwwQZ70X8NgjtvOHEqKTH1z6ByU9rsQflgf0gnSuQ5T9CmxJwL1+Rvt+IaSyJkl+kxBssExqkjvFsHjA/F/nJXnJXdyo9UWNx7Ry0j7F/q4f+mT4jf/h5nhFa21urlw3B8VdKcVcu97Psc6ccvuwesbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PckETiqB; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PckETiqB"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso4949545a12.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787386237; x=1787991037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBRw/luZ5nn4J7WrRRWBVfkjR8lUWIDEN9VTq8ggW/A=;
        b=PckETiqB+aFHOyxJ6UUf3Isiss3S5ufiCYWmsSNdi5kv8NETowGECfVZZwfNF20+6I
         9584dByRiRvYgK1nuBTStkVtcsGTQLXNsg0LuYb+wg4DGCzpUnP2/mPGk5XoALqsiAO/
         YUh0VgbRipSMM9lFi5+rMb61NrFScR703O6l1RWOw0WKhAaaQuVGcU0lfLC3jYRaZaR/
         RbsHGowDZPzu3Oz7qTIqhfMBaIV6N0vchf/YIodz2S15qE0sQYR6nVweWmwOuFoG5+kg
         pxN6DDz2jG982JiqRLhiik90QfY1jFOKf+bhy1r21fW0eqM/A9s2oxJLK2sNcwypy0LB
         fhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386237; x=1787991037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBRw/luZ5nn4J7WrRRWBVfkjR8lUWIDEN9VTq8ggW/A=;
        b=cE/EoxBTyIp6SYwYjF8EUXF6a4CpBGDJ1/NhG+clEuq7QMU/OhbFO2Yo4VUmHjys8J
         T0aAXUar0wXlpHJBLOQ/YLMlWmiVr48Z6WOOgdZJMsOjVu9ku0QCDlfy7fSx7g+jJcHi
         CfBklzRzff6ctvKpW4T3Px1DYv+MKIDmLdApfw/FF7xQTy8m9twbtOP+ekL5wMSmApNr
         NwdLRlJyQAceqQ0X8qymUk2g8fyOHQSIYkr/kF9/+UZt7EB+my9upLR0gySXyWvP21Oj
         7vPPvaSknFGwHJf1LhbaYHBDnLPHmdasj5EG0wa9DCvp8mTTBdn/fzQbAa4mqjM5fFet
         lJAA==
X-Forwarded-Encrypted: i=1; AHgh+RqDo3nYJWHaht4PgrxVgWQ/OM3lf2/fF4c1mmWACnDCinlFkCH+gs+Dm17b394yNeFggLeBH1Z6pVc=@vger.kernel.org
X-Gm-Message-State: AFuF++mXbfgQ0V2uhF5FLmNT4CeiemUYnWYpAODghBA91T6m845cjpeC
	WTi0BGVzyE75RCgGuTkASwyWC9byLvVlXeCotKBCVjvquf0NZrvnv+J5
X-Gm-Gg: AR+sD12ZpP1rl0dsgqO6sLncyXPmAN/c6FU+ANoLhi9QCIoQCyZjf6dxuS1nN8vr4Ge
	BDhJW+3362/2XV7jQVzMKJLvdy9Tu88NuMmXdNkOr5N7dsy0eVD+14ju4C6EHlJRwNIGga4tYbv
	jDTW0bFxmNoxAo+TYL+IzWhl+FoaN3U5BRQrYQJghn5kurUqQS67S+Y977N8xw9TiS9p2p/Tj/x
	C1vLmjMPKo5E68HDc+beNq0GIKjkT0PS3DwG+yEqDloNTuqkb2VLWNJADk5PGSOHrZfltiMKFdx
	KncyhFfznnMpegNlMXL5ZJNd+9o/XgcQA8t2Ddm5fRA0FNohCi68RrwV6Ga3gfkjGIW5g38WmxX
	++AOWD/wRWxLzixez8EGfysrgSVgYwRQ6sVQntDJt8Z8Qt4v8JdsHVOEcALQuv40bafSly7NVZS
	+mEIA6JUric+RCoLdgYXONG95KwuESyaaYqQgobij+z+qvofGSnYC/jOoCsP5fqH8x6n+gnFYhy
	sWaCYciBrrif+3K2iLcj7Y3ORK9htW4OZfbxZgqgdXkwiEbjihoPOw9e4zBHTIZF+80JqixRrdu
	f8EImAsFGZb4zV0fmD0hMLhe7RWNtIiN/Yb0M2vlz6sG1QQArbdYt3gst4jf1jl/6Bw+fobrUQ=
	=
X-Received: by 2002:a05:6402:321a:b0:69a:a4cb:2882 with SMTP id 4fb4d7f45d1cf-6a42f216beamr14699761a12.9.1787386236851;
        Sat, 22 Aug 2026 01:10:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177859sm10413456a12.27.2026.08.22.01.10.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 01:10:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Chuck Lever <cel@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Christoph Hellwig <hch@lst.de>,
	linux-nfs@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] NFSD: docs: Fix pNFS SCSI Kconfig symbol
Date: Sat, 22 Aug 2026 10:10:33 +0200
Message-Id: <20260822081033.82098-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pNFS SCSI layout server is controlled by NFSD_SCSILAYOUT.
NFSD_SCSI has never existed.

Fixes: f99d4fbdae67 ("nfsd: add SCSI layout support")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/nfs/pnfs-scsi-server.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/nfs/pnfs-scsi-server.rst b/Documentation/admin-guide/nfs/pnfs-scsi-server.rst
index b202508d281d5..a3074450ac158 100644
--- a/Documentation/admin-guide/nfs/pnfs-scsi-server.rst
+++ b/Documentation/admin-guide/nfs/pnfs-scsi-server.rst
@@ -16,7 +16,7 @@ addition to the MDS.  As of now the file system needs to sit directly on the
 exported LUN, striping or concatenation of LUNs on the MDS and clients
 is not supported yet.
 
-On a server built with CONFIG_NFSD_SCSI, the pNFS SCSI volume support is
+On a server built with CONFIG_NFSD_SCSILAYOUT, the pNFS SCSI volume support is
 automatically enabled if the file system is exported using the "pnfs"
 option and the underlying SCSI device support persistent reservations.
 On the client make sure the kernel has the CONFIG_PNFS_BLOCK option
-- 
2.53.0

