Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A879015534B
	for <linux-doc@vger.kernel.org>; Fri,  9 Aug 2024 21:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723239893; cv=none; b=cwWOKmz20QIxtcWDOfImaRXR1dc41mXKa7pYet16pbwQHlSJsivHx+INpyFGPwR/2Os7fbQ+dYTcpDp+L9oxETYg88RfnIpD7RX3fGL7KaASNFKGQAWMvJ111BF0csoBf+K3YEK54aT7jY3mrlGSmJvEtBhYRRnd+FOogvJBDe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723239893; c=relaxed/simple;
	bh=L6QdXwkyWnmKBfm5uPl8ML/MCAP3PXl6h9dUOrmEWF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QfdwOtLTT2VM8CtE3xZ4076dBHqQhiJAaLUR7Hojr0SAZVrqbasZF4MBfi8Va4HOeRoY7U/Y3NjkgKLRMRQntkQjjWCSllYtA9qi8GOcnxIrHOdEcw0HxP4IJbUogjZ6gcV3AdVF5LMfvS7gopTTAiV//Puq7nkMQC5FcuXrPw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zl3O1Mp8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zl3O1Mp8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ff3d5c6e9eso21102115ad.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Aug 2024 14:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723239891; x=1723844691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFVEa+6FYfEUaLF0deMiv8D8IxrvrJD54aZshK+oobU=;
        b=zl3O1Mp8QEhIWodzM/cFHn5j90IJJK8UYneCg9SLBdZuBWPTD5zOnHneeLqBAdD1IC
         OeGvgNxhzA94r0RM8XSDbzG3fT+fPd7dSNJi3XpWTMgbOG3VmCYfK8Y7+9yjuYlnhGMD
         60oNouINndueINPDA7i9c3WjLOlwoLp+KL8Dr1SZ42VANma/HqnkEZGQnQbef6wbMzP9
         hn0xXIwLTdToYRQnZgaoeosKC1Z5Dr4YcpkQleZa3ZCcdvapq4YfxJoINyoJbZxe+fZy
         frUgCFAlWjE5n8tv6jmTnOP3gEfFpFz3iu5N25mVp7/kjIMcKHXXgrQAmOx2ZKHgPwty
         Eo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723239891; x=1723844691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFVEa+6FYfEUaLF0deMiv8D8IxrvrJD54aZshK+oobU=;
        b=Z+PKNs6EBve15Th+nFG/lQNLJONwVtlOCgR3q7eeQOrALUsUUfKDwnzpFie2xiSROQ
         lcaOBC/wpmb4Xptm19ODRJhqJHIEJpGFHhGK3yNtMZLo7PZpziOvnLoc4lNACuYz76YK
         IxeCdq6SEP/FZNxBAE+s52gO2KHdcVd/VTIaFhc52vMK0E0+6ARfBY84jJz9cCbNghX9
         ge2hYygKx5q+S103+az9j1d394AtVjFUvfU56gMu6YP4UTWjJd0FOIrbd4P7vVzEyORn
         YSZIL5fgt+0LTaRFRGDV/CE0aUqXgd8+SYTY5LpP5/bimgtv4GIP5sERK0BY3Z7v/0YA
         8j5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnGTbEofe19BKNzIh6p6QIROAg1ObwpO9BF7UoYPeqZMaynJpKlrNvFhj11EOnbdVb8pJXISaz6HMDx0IgCu+jUe0DDIHA8jFq
X-Gm-Message-State: AOJu0Yw9Zgy+CE62rv9ChNfnfD+D8c5/LloC0udkTptTZthFKS7GZmwR
	MEKtP4iNRSFEuA7JGFeVn/64ggU3mzjiXRSz+9Btwu2IBLZtmtdgKi1LoanULNQ=
X-Google-Smtp-Source: AGHT+IEIQGIlcJkuXdHdnqgIFBd988zwGWuS+RZnMCFZ5blJtXDE4KnUgqtwnNd4P70lZgiR4fLR7A==
X-Received: by 2002:a17:902:fc4b:b0:1fb:9471:84b5 with SMTP id d9443c01a7336-200ae5a9fe3mr30084305ad.37.1723239890802;
        Fri, 09 Aug 2024 14:44:50 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb7e93fesm2073905ad.43.2024.08.09.14.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 14:44:50 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/2] RISC-V: hwprobe: Misaligned scalar perf fix and rename
Date: Fri,  9 Aug 2024 14:44:42 -0700
Message-Id: <20240809214444.3257596-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The CPUPERF0 hwprobe key was documented and identified in code as
a bitmask value, but its contents were an enum. This produced
incorrect behavior in conjunction with the WHICH_CPUS hwprobe flag.
The first patch in this series fixes the bitmask/enum problem by
creating a new hwprobe key that returns the same data, but is
properly described as a value instead of a bitmask. The second patch
renames the value definitions in preparation for adding vector misaligned
access info. As of this version, the old defines are kept in place to
maintain source compatibility with older userspace programs.


Changes in v4:
 - Rebased
 - Add the word scalar (Charlie)

Changes in v3:
 - Further documentation wordsmithing (Conor)
 - Leave the old defines in place (Conor, Palmer)

Changes in v2:
 - Clarified the distinction of slow and fast refers to misaligned word
   accesses. Previously it just said misaligned accesses, leaving it
   ambiguous as to which type of access was measured.
 - Removed shifts in values (Andrew)
 - Renamed key to RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF (Palmer)
 - Added patch to rename misaligned perf key values (Palmer)

Evan Green (2):
  RISC-V: hwprobe: Add MISALIGNED_PERF key
  RISC-V: hwprobe: Add SCALAR to misaligned perf defines

 Documentation/arch/riscv/hwprobe.rst       | 36 +++++++++++++---------
 arch/riscv/include/asm/hwprobe.h           |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h      |  6 ++++
 arch/riscv/kernel/sys_hwprobe.c            | 11 ++++---
 arch/riscv/kernel/traps_misaligned.c       |  6 ++--
 arch/riscv/kernel/unaligned_access_speed.c | 12 ++++----
 6 files changed, 44 insertions(+), 29 deletions(-)

-- 
2.34.1

