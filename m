Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917E330BBB7
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764125737; cv=none; b=IKIyMxOpvOnvELdADOsKiTC19uXMWpReSx0FAb5XKFNRlZXfpv9lNSvLf0CDDPadLWJtm1TEIQ/voPdvX8+cNsYgBTfefIlv8Iyxqu0onNZqatgSy7Uzcu7uWpAKlEwHqs06uOm6dqOlZwIkbsosbk/zhe6QZ4jjLrdELP49k1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764125737; c=relaxed/simple;
	bh=tnimAo44fiTVkBAxrxc3EfZ5uZmHR6v6i5p5yRM5eqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgClnOe9raSSPOgCADA+GqIkqFGyRnFP0Cgh0EZLCiZyAJakKkZbC/xRE+R65sCOJ/U/0jEtYXgqfBYcNuht9glElQqzyYgBjkTN8zMJOwdMycVovYaJAZHiSfyAI4/N4JSINH6JzK8MiweKfcSeTba4GAgJwtTn2Ihj2kYZCHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hF1E/efv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hF1E/efv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso5375430b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 18:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764125735; x=1764730535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1bXFtvnUO91cmJCzBD7ztE3U01PXxMPuKpzpUua2tk=;
        b=hF1E/efvIc8jCN4XD7qk8R/aM47plOPvQuFD+lV8m97Z0Q73nKdq5eU0Q1g2cYS0Y+
         qfdnT3j8J2DISWx8OUj1aGsgC+QPGje4rtvdGEGWrfKypSNYtp3arn09oB3VkdsL3UsG
         tro347g1D0pPLpFw70OTEboc1+fT5ed7JH6n8Yh2FGE6SRi31cHziFy+DS23G5gxcRw0
         N42dkt35kY465SCmSWNh/KTr5mYEbDD8kmKHO+uEUjDQU+CWplVPqfJx0xtGSGA5JzJE
         chBUNRaIn00j8mFbUuaTckalaVisS3vMVze9/TmB64OOZjsWWZY6GK9MG3j2r8kuP9BG
         zQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764125735; x=1764730535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1bXFtvnUO91cmJCzBD7ztE3U01PXxMPuKpzpUua2tk=;
        b=k/aIXuWXoVy61Om6vdIYbWoZvn0g+IVAGJ9iPq0CQ3KjeRADTw/5aipoJUrpegCogc
         YzrZvlfAhwR7ofUtsnujzxg4VKlbo8IMxbOj98XmMS/p27dETFhv7IF9FEbt0yHW7q05
         6RSr97r/JQpReWdZJwgBk7X/nrGIIu0yh3XfcM9LD1xSCKHmtTV6VwJdqvJW6kXY3xaX
         J0SUvCCne8jb3ru3qe0nfcaqaPF44tZ89mkdclvwn63XIyMrK34wnlYJgql41x59RR//
         yx5WP3/qyzlbPuwkbz/azKJ5L2GdPMIWLXqGvVBwd3I19XLulyhdYZ7ua/w4QKUH2Af2
         TRPA==
X-Forwarded-Encrypted: i=1; AJvYcCXUQLxzZwAPdnlGdMseZZcPryG9fid3QnqTO/1+vOGfpwymWvTd5BdmHoyHdrPo7Qb5cJDuSqJuQFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2t8Ffe2+T1iBxajb0XGMxPmItSAKHJmf/TO+/EUJkqtYVprot
	+iDlKu2KjzgusbDuOhz1ynLSSMrl0Z3eq/LcL3W+VkB0+R7LcuTMRdlv
X-Gm-Gg: ASbGncsgZ3I3L0b1vqvraRB47YimX7dVPSsM1xat8vDRSSLNzcL0vlwdhsuApamWtTz
	0VID7WZ9zg2NC/lz6SqG4/V7aCIx5+hWGie2TCx5FSK0ZhWRJ6Sqeoc7GbJkXRMr0Y6WbKKoPFW
	5+hxeQrVFFaVplFKOpK4K5VOa0FMP5YouF+gPAIA/BIhneXbJuSCMK1fzM6txfNrc/HxZernWlM
	WldSu1jlY67huDSHtEDnkjqfq7LZcDhtNPcy4pL826aaWwzJXucPSrA7B09bhukqcj9RYoVu71L
	H1ma3pWslN6jPajhkOysfaaPJ0+prqTtMIgpVZh7SHqxTuGQuZjoGnVn8wqHiBGwwIIAMPIV2og
	ORI96KDazz7fX/R5wrFjQFD3HLyJLRZ7lI33bCv/2QAbDqRzK242E0PJj8l0qQJ2qnR45PvVeVa
	L+EXA2dtXlbA0=
X-Google-Smtp-Source: AGHT+IGvzstnc/93j7ZBB0sdQeaLAIx6ZueJYSk+eMit4Kywv6zxm2Ac+UYyPZE8la68lESXl8XFmg==
X-Received: by 2002:a05:6a00:c83:b0:7b9:7f18:c716 with SMTP id d2e1a72fcca58-7ca8740ef7emr5806307b3a.1.1764125734799;
        Tue, 25 Nov 2025 18:55:34 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed470ff6sm19428018b3a.19.2025.11.25.18.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 18:55:34 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 7BB194754B79; Wed, 26 Nov 2025 09:55:24 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux AFS <linux-afs@lists.infradead.org>,
	Linux Filesystems Development <linux-fsdevel@vger.kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Daniel Palmer <daniel.palmer@sony.com>
Subject: [PATCH 1/5] Documentation: afs: Use proper bullet for bullet lists
Date: Wed, 26 Nov 2025 09:55:07 +0700
Message-ID: <20251126025511.25188-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126025511.25188-1-bagasdotme@gmail.com>
References: <20251126025511.25188-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2080; i=bagasdotme@gmail.com; h=from:subject; bh=tnimAo44fiTVkBAxrxc3EfZ5uZmHR6v6i5p5yRM5eqM=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlq2StviNYourDlNeosNrizdW8cj3kn0/vOxo/c5qd+n vg/4fW/jlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzk435GhrMVHexX0ur1ogVk jvcL+xmvvNrn/is86/2tCjuLY5LfQhgZVjFs5T8wZ4Jn7637AS+62YrVf6nfvsV1474106OOFZX TWAE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

The lists use an asterisk in parentheses (``(*)``) as the bullet marker,
which isn't recognized by Sphinx as the proper bullet. Replace with just
an asterisk.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/afs.rst | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/Documentation/filesystems/afs.rst b/Documentation/filesystems/afs.rst
index f15ba388bbde79..6135d64ada6372 100644
--- a/Documentation/filesystems/afs.rst
+++ b/Documentation/filesystems/afs.rst
@@ -23,17 +23,14 @@ This filesystem provides a fairly simple secure AFS filesystem driver. It is
 under development and does not yet provide the full feature set.  The features
 it does support include:
 
- (*) Security (currently only AFS kaserver and KerberosIV tickets).
-
- (*) File reading and writing.
-
- (*) Automounting.
-
- (*) Local caching (via fscache).
+ * Security (currently only AFS kaserver and KerberosIV tickets).
+ * File reading and writing.
+ * Automounting.
+ * Local caching (via fscache).
 
 It does not yet support the following AFS features:
 
- (*) pioctl() system call.
+ * pioctl() system call.
 
 
 Compilation
@@ -146,15 +143,15 @@ Proc Filesystem
 
 The AFS module creates a "/proc/fs/afs/" directory and populates it:
 
-  (*) A "cells" file that lists cells currently known to the afs module and
-      their usage counts::
+  * A "cells" file that lists cells currently known to the afs module and
+    their usage counts::
 
 	[root@andromeda ~]# cat /proc/fs/afs/cells
 	USE NAME
 	  3 cambridge.redhat.com
 
-  (*) A directory per cell that contains files that list volume location
-      servers, volumes, and active servers known within that cell::
+  * A directory per cell that contains files that list volume location
+    servers, volumes, and active servers known within that cell::
 
 	[root@andromeda ~]# cat /proc/fs/afs/cambridge.redhat.com/servers
 	USE ADDR            STATE
-- 
An old man doll... just what I always wanted! - Clara

