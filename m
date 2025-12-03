Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AB2221DB3
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764724173; cv=none; b=l7L2ZglbhymnTitaUKJWuBbuP2nnDr/U1qctJ7DvUPP1afQsdhudd+y/CkogfP2tU3lPT9GdorcNvRcZOnz7Zjt/0yEmzG/5GnRtbGDEqdV5ze+HokUfWhQCgPhHn5X6yC4VwVHxHprBcwVykzYZVYz32+9LjpJAFoHB6WtQhok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764724173; c=relaxed/simple;
	bh=OnkMzhtWftClORfQtq4pVFAPUxLwrZMkgpnvY4knDco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNNcTDtwxAi3wm7QJgQvPIjR5QxSmxA+yFPxbXhZVYgRIZm4WgUOy58paC9yw5WEJ5UHs5zitWSEWcvmwMwgOtn7xL+KDVKTQGLCDkNfNKNL93GPvDNd3nlBXCUJwnNosbiPrh4l00mSb+V6hFQN3WXN1LwdvbbWuBrtc5Cog4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4GkNpkQ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4GkNpkQ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so6741693b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 17:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764724171; x=1765328971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMQ8vHmUy2M1e+AWep/BaUFVNkwfbE6reMg+lneA/lE=;
        b=M4GkNpkQ8hyBzf2xcSmAz9Th6YPOVugxO9SOs69B0L7zOmHGsIIWcvZsPtTgfBj71/
         DsHjVsAad1kzNtXha5C9W8TuSRllfZf8gSVYqKy0rl8lBEQdGKijaVOEVqDJtG1Qx7Sk
         YlMmMAHQ/D9aq3p0FIJjddz3Ucy4y885k3OulLwYjHaKaO6BwZwqr9rTbDiPPNUgRrCl
         ufWa03r5pAKnjks6gwJhnjLeHs5BzUA5TphR6/4HrYFiRaBxCBh6qBXmH5wpab2v5cdR
         JDpYA1tRBP/6WIrGk3OHXDvzF9wwwXT0Ydf3b7ZoOx0lX4njkqfjPe8G5ZBW5fvL5RBL
         sXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764724171; x=1765328971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMQ8vHmUy2M1e+AWep/BaUFVNkwfbE6reMg+lneA/lE=;
        b=qd1dJ9GQu+7wbd0bp/3BXeYwpjaL6/20mkilTKn4MACmtmrZtWuoRTfpil49R5q+J5
         dKwWMjCYwI67yBguWnlsTKdfrSYKNVXAAZ+igcRv6cR1iAJ6oNBlmFu5i5align2Np+1
         UJdcCm8M8ZCFhiZpmUkrUmYow5iT6XLzeIPXchYULuJTZfJfNzj4+q9lOnaIS9tZYMHN
         JDtA0ABnLI5tD/G8gbwv3N+6o/vEvjNWMZMaQTxpwiUXCkvBJd2PLDS7s04HePjYb/WW
         pL4f16A+Ot/jX5dY0Rn5cFJWreId38ie/smIJ0PwehSA/xb8QodVFsn15i5ORwWWA5UH
         CBdw==
X-Forwarded-Encrypted: i=1; AJvYcCVdludKqzqgTGKdKOIXFyjlWFRdmSF0hzOeT6cy+J3hiLPXFTmgJG1EuhOwTGXejsY5DeYmv7BN7wM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6b9zGcb3NlRo4RwrF272vFC4GripHipIUmVJfgwqXCb1OA+E3
	8ciazXSmFX6HjOy+wAkhpAVbHxRKljrZrsPAejBf7KUJ+AdtW0LWuj2s
X-Gm-Gg: ASbGnct6eMVhw+wHgpm4aERWBHcZwqyTaH9snM1rotHN3fUe04soCuvM8Tl5x9M3Zo1
	cnpkP2P8cT4HCgHxWD6R3xAkHDPS8obBC8uofdcfZQ71cEs1n+itTmaPwfKcQBen8OzNdsggo9w
	MfBdWrCLXeUqXaVONubigo6ePnuuPHGOCtNVsWGs1W/KYPop5sIn3RbNBC4sXkX15z+wbg9YgxE
	cdE6LM07Ep3F6jZFBqwK3G2j3gJVi9NhA0ehkLwxIffVxLCIDoTpJrTaQjpLBdkhs24y4bt2XFw
	uOqqgB+ectpxC06zmCFrDivEMR19V378SRNkxs2BmWC/Dct/ntoK9xQBnRwrr8qAuYLdqBtzs11
	JU7YqLKf4rR89w47D4lh1HlQ/3c/K/Tb39ndRXW4IJQ/WTvkj1o5f+ejNFO5S5P/JeP6+mlDr7h
	33AqpGZTSGrsA=
X-Google-Smtp-Source: AGHT+IF5UeBvVePda2KFWkC3k94/grAajsZo74APZmau4X7uYv0fD/GG5eh2o/bcLlRLAJhvCuZwoQ==
X-Received: by 2002:a05:6a20:431e:b0:361:4ca3:e17d with SMTP id adf61e73a8af0-363f5d61e52mr820140637.13.1764724171524;
        Tue, 02 Dec 2025 17:09:31 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be5e7485b1esm15317306a12.20.2025.12.02.17.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 17:09:26 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 9A0B74353263; Wed, 03 Dec 2025 08:09:21 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux NFS <linux-nfs@vger.kernel.org>
Cc: Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Snitzer <snitzer@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 2/3] NFSD: nfsd-io-modes: Wrap shell snippets in literal code blocks
Date: Wed,  3 Dec 2025 08:09:10 +0700
Message-ID: <20251203010911.14234-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203010911.14234-1-bagasdotme@gmail.com>
References: <20251203010911.14234-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3455; i=bagasdotme@gmail.com; h=from:subject; bh=OnkMzhtWftClORfQtq4pVFAPUxLwrZMkgpnvY4knDco=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn6Pe+Trd/L7dn9ftEi90Mr7M9wBZaILSl4auJntCl3U dGj6JSEjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEykdiXD/+xvP9W2P7s9v++n ge85xzQPzq++x7//s/diFg9t+TLNJIHhnwYHs1Y780yu1SvLODRyn73q6Kr4cjmp5GTY95WNPwQ WcAAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports htmldocs indentation warnings:

Documentation/filesystems/nfs/nfsd-io-modes.rst:29: ERROR: Unexpected indentation. [docutils]
Documentation/filesystems/nfs/nfsd-io-modes.rst:34: ERROR: Unexpected indentation. [docutils]

Fix these by wrapping shell snippets in literal code blocks.

Fixes: fa8d4e6784d1b6 ("NFSD: add Documentation/filesystems/nfs/nfsd-io-modes.rst")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20251202152506.7a2d2d41@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../filesystems/nfs/nfsd-io-modes.rst         | 28 +++++++++++--------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/filesystems/nfs/nfsd-io-modes.rst b/Documentation/filesystems/nfs/nfsd-io-modes.rst
index e3a522d097666b..fa47c4d3dfb95d 100644
--- a/Documentation/filesystems/nfs/nfsd-io-modes.rst
+++ b/Documentation/filesystems/nfs/nfsd-io-modes.rst
@@ -25,12 +25,14 @@ Based on the configured settings, NFSD's IO will either be:
 - not cached stable_how=NFS_UNSTABLE (NFSD_IO_DIRECT=2)
 
 To set an NFSD IO mode, write a supported value (0 - 2) to the
-corresponding IO operation's debugfs interface, e.g.:
+corresponding IO operation's debugfs interface, e.g.::
+
   echo 2 > /sys/kernel/debug/nfsd/io_cache_read
   echo 2 > /sys/kernel/debug/nfsd/io_cache_write
 
 To check which IO mode NFSD is using for READ or WRITE, simply read the
-corresponding IO operation's debugfs interface, e.g.:
+corresponding IO operation's debugfs interface, e.g.::
+
   cat /sys/kernel/debug/nfsd/io_cache_read
   cat /sys/kernel/debug/nfsd/io_cache_write
 
@@ -128,17 +130,19 @@ Tracing:
     misaligned READ to the next DIO-aligned block (on either end of the
     original READ, as needed).
 
-    This combination of trace events is useful for READs:
-    echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_read_vector/enable
-    echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_read_direct/enable
-    echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_read_io_done/enable
-    echo 1 > /sys/kernel/tracing/events/xfs/xfs_file_direct_read/enable
+    This combination of trace events is useful for READs::
+
+      echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_read_vector/enable
+      echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_read_direct/enable
+      echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_read_io_done/enable
+      echo 1 > /sys/kernel/tracing/events/xfs/xfs_file_direct_read/enable
 
     The nfsd_write_direct trace event shows how NFSD splits a given
     misaligned WRITE into a DIO-aligned middle segment.
 
-    This combination of trace events is useful for WRITEs:
-    echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_write_opened/enable
-    echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_write_direct/enable
-    echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_write_io_done/enable
-    echo 1 > /sys/kernel/tracing/events/xfs/xfs_file_direct_write/enable
+    This combination of trace events is useful for WRITEs::
+
+      echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_write_opened/enable
+      echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_write_direct/enable
+      echo 1 > /sys/kernel/tracing/events/nfsd/nfsd_write_io_done/enable
+      echo 1 > /sys/kernel/tracing/events/xfs/xfs_file_direct_write/enable
-- 
An old man doll... just what I always wanted! - Clara

