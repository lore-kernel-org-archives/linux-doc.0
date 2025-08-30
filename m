Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B03C2FB
	for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 19:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756581181; cv=none; b=f9IvsvyYunkL6+qsQwp6yJT1oKwnj9WCc8QbfaxtqqrtuqoR7QAp8UG3gedxVgqaOpHmp7JMiUouhJQQdN13hisyj3P5XePOrFkTAH+p8qChIh6xU1SmIlPgCSQ61651TJaKXXhFv99hR1at96wpjfX7cWmQdgzvyAA6UDsizgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756581181; c=relaxed/simple;
	bh=0XHRddn3HT76N3DTC4+rvDyGom8yHZzVo3GdjI7WgWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDoLAkjsriQO3N/hrfcJn6QAAOW3MzdXj2xHySqmJpFVj/a24pfygd9G50aXL8G55gKEkOuk3plq4T7QQSaEcHCLRjVOVzVBU0vXn9eKK64xY6uRk+cM38qfSLCdMRqT+MfAk+H+qL0ODqden0exMn2Msdv+xlfxLvsBaRX61WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFmSBQpb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFmSBQpb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32326789e06so2561601a91.1
        for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 12:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756581179; x=1757185979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4bkvNATbJgYuh29bsY5NmOhql4LwzWTDtVtdt9LKWQ=;
        b=UFmSBQpbFsUxziA+wJQR87cUB0nomoiZvewXxtkuYLqDcqTZug8Q/2yw6R4lddShrY
         sDmr0H1w8LZvNyt8BNm7IdEsNJ2pb7c5sQngoTQfKIm7Nab6neNIm9d67ALayfQw3Pfq
         JcJonM1ECkgsDjvjmvlxeZC4Wx5N7AepiW246R4L+ajBEDhqVpmC8vDI3gwmFVvAOd2J
         ewITke2iDMKYV70dfZ/BUBT+WXHT9psRY8400T792f6wsgG/CUjecEpQMYxmf5iUnnhI
         Y1W17zSOlS3nECb9nUJ7yRkSEtbK7fyY6Fzy7O5ZPwQPcpME+8YbrYQPKDMdnAOZvC2f
         ONQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756581179; x=1757185979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4bkvNATbJgYuh29bsY5NmOhql4LwzWTDtVtdt9LKWQ=;
        b=pE/2cQNnZUFkjc4eh7gGm8dOikeQZQlNhk/Bc/c+GcOl+xZ3tNckwUvnay2SwJh5aR
         OqoTssAWw/TmpHyYtsg6MxkortLFqEUinXjROZtcGKEKGELii1EPocVojj9PvnrdO1D3
         vm74eFjci5ZPHRpfvLoq6ZNnGIi9L9XNEHwVbReGx38RxHiaj5VxIwRrhKp8KBl9+qRr
         8s3kK4vL3wqGbP1TrrnsX7eZp6zfaRjS+e8is1BiueUm+O5Jq89GWyCo9T2WKcISlT1z
         C1KJjaqq7FTx2R1occ5hPjLIw4j37uPKW8xU2xAlcwR4sSWDOJi2lFZNgAvSD0zN90FI
         XvOw==
X-Gm-Message-State: AOJu0YyVzrmXWMZyHHfo7pD6iV3FRD7XoD/5lGCbF1OqjgJRRXPdER3T
	WS8BR8qJ1z9ajmfGXXKBStv1seOqQvutiTLe9M+zq5EXLLdlHDkn49PL+exET4JvYF95ZQ==
X-Gm-Gg: ASbGnctQsd+XjXgRXTbVY2LUXPZWL78o0SM8k72avLsu1IZENOETa2A91t0J9zjDtFe
	c9wqBdAw5zsFh31a5N+ACk7gJ0ya47txNhLGUkgozn4X44cBtbA2jYSGuf6LeQjzNgAkw5gcUnN
	lnzFysVR5hs5GVsbcIjfjZ3gPpUSLPXURonLsZYIT/vXRO7w44/uDsUPlBDGrZ7UKr67STvi137
	p2AXc0A6TpPhWYApLJ+QABFtUxDIgMU6/Epv8IEQIrLs/VQaLXqL0Xr2DgBHwb+1lJDM9/Vgd++
	tPiDKkSlr7f8RJM7qLsW0TyLf8AUHXzy9ZyMlAe/8JmmujT2AtNTIYAf99ocWcr6umgaewipTJZ
	oiu7P2LkacVmQcXiuetlleFaimtQztQo+8m3S7TVb3WylqRw=
X-Google-Smtp-Source: AGHT+IHEpHFhVSof2oULj1qyP82OxURldp+ENpWt/iwEfF3Cp0IXRTxZTl3xRggRbIoUi02ybVfTBg==
X-Received: by 2002:a17:90b:4f4a:b0:327:ceb0:6f6a with SMTP id 98e67ed59e1d1-328154128b3mr3904749a91.4.1756581178893;
        Sat, 30 Aug 2025 12:12:58 -0700 (PDT)
Received: from fedora.iitbhu.local ([103.151.209.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327c5fc5055sm7801694a91.14.2025.08.30.12.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 12:12:58 -0700 (PDT)
From: Methari Hari Krishna <harikrishnamethari@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Methari Hari Krishna <harikrishnamethari@gmail.com>
Subject: [PATCH] Documentation: Fix typos in filesystems
Date: Sun, 31 Aug 2025 00:42:49 +0530
Message-ID: <20250830191249.25459-1-harikrishnamethari@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed minor spelling and grammar mistakes in:
- bcachefs/future/idle_work.rst
- hpfs.rst
- smb/cifsroot.rst
- vfat.rst

Signed-off-by: Methari Hari Krishna <harikrishnamethari@gmail.com>
---
 Documentation/filesystems/bcachefs/future/idle_work.rst | 6 +++---
 Documentation/filesystems/hpfs.rst                      | 2 +-
 Documentation/filesystems/smb/cifsroot.rst              | 2 +-
 Documentation/filesystems/vfat.rst                      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/bcachefs/future/idle_work.rst b/Documentation/filesystems/bcachefs/future/idle_work.rst
index 59a332509dcd..f1202113dde0 100644
--- a/Documentation/filesystems/bcachefs/future/idle_work.rst
+++ b/Documentation/filesystems/bcachefs/future/idle_work.rst
@@ -11,10 +11,10 @@ idle" so the system can go to sleep. We don't want to be dribbling out
 background work while the system should be idle.
 
 The complicating factor is that there are a number of background tasks, which
-form a heirarchy (or a digraph, depending on how you divide it up) - one
+form a hierarchy (or a digraph, depending on how you divide it up) - one
 background task may generate work for another.
 
-Thus proper idle detection needs to model this heirarchy.
+Thus proper idle detection needs to model this hierarchy.
 
 - Foreground writes
 - Page cache writeback
@@ -51,7 +51,7 @@ IDLE REGIME
 When the system becomes idle, we should start flushing our pending work
 quicker so the system can go to sleep.
 
-Note that the definition of "idle" depends on where in the heirarchy a task
+Note that the definition of "idle" depends on where in the hierarchy a task
 is - a task should start flushing work more quickly when the task above it has
 stopped generating new work.
 
diff --git a/Documentation/filesystems/hpfs.rst b/Documentation/filesystems/hpfs.rst
index 7e0dd2f4373e..e2a0872a577d 100644
--- a/Documentation/filesystems/hpfs.rst
+++ b/Documentation/filesystems/hpfs.rst
@@ -65,7 +65,7 @@ are case sensitive, so for example when you create a file FOO, you can use
 'cat FOO', 'cat Foo', 'cat foo' or 'cat F*' but not 'cat f*'. Note, that you
 also won't be able to compile linux kernel (and maybe other things) on HPFS
 because kernel creates different files with names like bootsect.S and
-bootsect.s. When searching for file thats name has characters >= 128, codepages
+bootsect.s. When searching for file that's name has characters >= 128, codepages
 are used - see below.
 OS/2 ignores dots and spaces at the end of file name, so this driver does as
 well. If you create 'a. ...', the file 'a' will be created, but you can still
diff --git a/Documentation/filesystems/smb/cifsroot.rst b/Documentation/filesystems/smb/cifsroot.rst
index bf2d9db3acb9..8e8c3fb8739a 100644
--- a/Documentation/filesystems/smb/cifsroot.rst
+++ b/Documentation/filesystems/smb/cifsroot.rst
@@ -82,7 +82,7 @@ Export root file system as a Samba share in smb.conf file::
 	    guest ok = yes
 	    force user = root
 	    force group = root
-	    browseable = yes
+	    browsable = yes
 	    writeable = yes
 	    admin users = root
 	    public = yes
diff --git a/Documentation/filesystems/vfat.rst b/Documentation/filesystems/vfat.rst
index b289c4449cd0..f408699ce50f 100644
--- a/Documentation/filesystems/vfat.rst
+++ b/Documentation/filesystems/vfat.rst
@@ -361,7 +361,7 @@ the following:
 
                 <proceeding files...>
                 <slot #3, id = 0x43, characters = "h is long">
-                <slot #2, id = 0x02, characters = "xtension whic">
+                <slot #2, id = 0x02, characters = "xtension which">
                 <slot #1, id = 0x01, characters = "My Big File.E">
                 <directory entry, name = "MYBIGFIL.EXT">
 
-- 
2.51.0

