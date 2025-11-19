Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C163451BB
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562739; cv=none; b=HmmwwTRHauTq5tkUAY7FhHxzRjtIAwRHH4CJ+rJ7o/6lluwUG0SkdSRylAgWvXl3ClLaAL5WHeFPWYdRhcwHYAFByWaxu7nNos3B8Pj/v1cWHcz45BXNtZQzDAZgYaIfaUbc0h2gaGfVYE0ZY+/84LjHkuiBsOjRRPFB1Yi+rAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562739; c=relaxed/simple;
	bh=rKto9SRu25FK3OZzqAfW5fo67ECEjbM1vEpx/2n+f18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hzg89GnXTHCZTzX/xzGCOqUF4WwQekH6UVkvtaJZlzoB8uVHfa6bUyHiGBFZhdjwWxCUh7Pa7G/DmjvBi/8UXOV9egiBzw+ywHGcO+i8HFNsyBA43pkFpJMCHxJLC2IDzyIbXb8hv8NxhzSEWbofU2Uy9HT2kbh4uzBXFgF5+yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDZ5Zp28; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDZ5Zp28"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b1e54aefc5so562433685a.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763562736; x=1764167536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8q+znNodto0M98KR2R7NvRlXozxhYBImnhJeUCTUfOM=;
        b=LDZ5Zp28D9pg6OITdqZINoD6vpc3cnXfo8FCVqi/NJex6lFMD0Pe8cMgLWwOlGDLJt
         BC1fJptCcwbzvsz3I8VjRcdDDi6KZlR4Dag3nc79yCbDbViqIX9RJ32gmUhd8AdyFaUY
         /tbBwqIPkCi68Fjua+z4UrHIZvyRYTXBCAnrjiULgaXH3wZqmev2tiOFeORZzQUIGffg
         AZvPbXGUnBIAapi4BNDXPt12wzN82NLhZu6+0IBf5iQy0/CBtjzqo0g/4r4dgR8MAWfH
         3xDxmuvdxju9zNq3hu3w/8lQRUSWOQHYqhQB8/pPwpOaOc1ef+zYHreqvmSzN4kWEFB5
         EDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562736; x=1764167536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q+znNodto0M98KR2R7NvRlXozxhYBImnhJeUCTUfOM=;
        b=h/fbJiqvJgLfzC9K6fefM1kg9z+76tlyC5Sn6bIesPsNpybioVkxuwGKUxXcBHa4sU
         UoJTUmuzfV8iVi++tKy5mqZhrdajuBuraJb6im2A058kVxY9mI5Lqgvq4xH6NSI/55d6
         aw/ZB7I80vKoXALkWksFqNSGshpsnCzBgz+uSgww8SBhVVU3ayyLip+df7k6zJyq/VO8
         WlZRHnhTu+mrF8bweK6HWoR1fT2/eEUEMdTfGsys+8YnwYfcFSHfw9MvG96OQp2W91w9
         VIxpooZElMDLOPODZl373mY6g1fwnzCNNi+00UvcviT5w3SEkMuRiWdop33/cBE64zWF
         sZCA==
X-Gm-Message-State: AOJu0YwcZVfbaqQB8rb4CfapO/mLciQ2YYgQgc4e6mSwrY4g3AFgdNgO
	UmsnMxZzCZC6WlRrkQiaMvAEaUB1Wr1WvZhDolrqIDOMszWU/ssXlY1ZPZ6IXzdX
X-Gm-Gg: ASbGncuEZ5PTCS8SGzWYUst95OLsHa4qEkPq2luLs4fouiaPcb93H/j6FjlFwgD28I5
	bu0ZYElQeZnHJFC++V+GXlyhy0YuEoOKXMG/4OJ7nqPYDkQtT2AFNjJeyzIaEHmw58l3jEq8i3v
	nS05opWGGIllUeoouXeDcV64ISPa5igTXyyH+WZ07Edq5JKvkXnLD8q9InWWzGrMOBjv1vxxBpX
	n8cybVVS+QUEvexQh2N1N1XBhjK8KS2aCCqdN/5nMF+KDUC7eNT92WnKg1KdbsuWaCVbcU2COfi
	1rdfj3KwmiPCqprcNAwaSSBKBxIqcOHhgZsW/7LQUQkC5vQaP9BDHFdl1v25RfGzC3nUEEC6t15
	H8Xx2jle9fhADf6xzRJvs6CtqfjOo+sM2CzphF2dF0L/6WdGZVnHGZVFDKFrz+BsKy/zfZnHB59
	wTZEJ4wnq42cF5R6qOb/8Vw2s0fgLk3z55zVh/nTyxsxcjV93dAx2N/g==
X-Google-Smtp-Source: AGHT+IGNwVHZG6eQtwltPkgeDUi2dIyGh2VvkiqNs3dYVp85iL+oe1f8oZwXdAoI/FJovvVWmP2TTQ==
X-Received: by 2002:a05:6214:d0f:b0:880:278d:d4aa with SMTP id 6a1803df08f44-8845fc3e0c3mr36773686d6.7.1763562736083;
        Wed, 19 Nov 2025 06:32:16 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.77.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882863923fcsm134305136d6.25.2025.11.19.06.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:32:15 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Eric Biggers <ebiggers@google.com>,
 Gabriel Krisman Bertazi <krisman@collabora.co.uk>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: [PATCH] Documentation: ext4: Document casefold and encrypt flags
Date: Wed, 19 Nov 2025 09:32:13 -0500
Message-ID: <4506189.9SDvczpPoe@daniel-desktop3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Based on ext4(5) and fs/ext4/ext4.h.

For INCOMPAT_ENCRYPT, it's possible to create a new filesystem with that
flag without creating any encrypted inodes. ext4(5) says it adds
"support" but doesn't say whether anything's actually present like
COMPAT_RESIZE_INODE does.

Signed-off-by: Daniel Tang <danielzgtg.opensource@gmail.com>
---
 Documentation/filesystems/ext4/inodes.rst | 2 ++
 Documentation/filesystems/ext4/super.rst  | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/ext4/inodes.rst b/Documentation/filesystems/ext4/inodes.rst
index cfc6c1659931..55cd5c380e92 100644
--- a/Documentation/filesystems/ext4/inodes.rst
+++ b/Documentation/filesystems/ext4/inodes.rst
@@ -297,6 +297,8 @@ The ``i_flags`` field is a combination of these values:
      - Inode has inline data (EXT4_INLINE_DATA_FL).
    * - 0x20000000
      - Create children with the same project ID (EXT4_PROJINHERIT_FL).
+   * - 0x40000000
+     - Use case-insensitive lookups for directory contents (EXT4_CASEFOLD_FL).
    * - 0x80000000
      - Reserved for ext4 library (EXT4_RESERVED_FL).
    * -
diff --git a/Documentation/filesystems/ext4/super.rst b/Documentation/filesystems/ext4/super.rst
index 1b240661bfa3..9a59cded9bd7 100644
--- a/Documentation/filesystems/ext4/super.rst
+++ b/Documentation/filesystems/ext4/super.rst
@@ -671,7 +671,9 @@ following:
    * - 0x8000
      - Data in inode (INCOMPAT_INLINE_DATA).
    * - 0x10000
-     - Encrypted inodes are present on the filesystem. (INCOMPAT_ENCRYPT).
+     - Encrypted inodes can be present. (INCOMPAT_ENCRYPT).
+   * - 0x20000
+     - Directories can be marked case-insensitive. (INCOMPAT_CASEFOLD).
 
 .. _super_rocompat:
 
-- 
2.51.0



