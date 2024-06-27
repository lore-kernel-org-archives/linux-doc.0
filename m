Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8252319AA79
	for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2024 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719508972; cv=none; b=sQjAkoVfUA2mm6TX1sDmM4oE9hyZ0bwy9CRDvC4JsioC+Kd9Tqp6TnrTfqhOKWwzNXcxcpOckj7HkQ7HT6ZL24E+wB44RDzNYdbIBquVJjQKAx/JY1qz37Tx1Gvsi0r8KPct19sVbI7y/RxNeqhZIpS6aNQvMK1TWU8vHSC+jok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719508972; c=relaxed/simple;
	bh=QzMqgOjIU+dFAf6Rwj4tmC2nJfFLA7zfPOnws87UYz0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sxa6ZyzM17Y+sTwkpg0STzgfuvq2uQvarvcizx8S6Di559Gd9cS0LnsnaBkAgR7oMFKvjJmUeDt49KFKUvZgmmblyTok9bi0PDPk1/QIoTjcBq5awRlVFl4boUyFBhAZrSYtTusbhbm6BnQ0mRq9C2bt/fRrhytLuUJeX0jd8MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=f+UDfJ8v; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="f+UDfJ8v"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c9d70d93dbso5433678b6e.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2024 10:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719508969; x=1720113769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/OwRRE/tmpPiqQGOJB6aU4vaGReQEfSJOGUq6AR27Vw=;
        b=f+UDfJ8vZxKlldae4coOnMMo7KaWUrAv1yp2vZlY+f/Dsk5CWrgeD8KMCIQEVENZc3
         GJoZ73rnK017u6qKxAfhDRPkbZlHkNd1UR1tufjrOpuaQZ+VDk8hzx/ZzuD7Nl7qQcZi
         cRqT8IbACbHyQCnWhbQr5x0qQgc4YIpDM/4+fzkuNoPoplWDOdchU+ccxtgBzyud+BW2
         t7gQgCf+nbl8HZapGekcHXTHlUJXR4uAWlltj2xM4Gg+cQB5lV0TzG5GQuVzzuWw/rip
         g3ZcajT+fHkX+OUWL0Lbun7q/Vwmk8arDqiDUcESz3jXAeaBksxZjqcX85Kso9cH7VwM
         W8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719508969; x=1720113769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OwRRE/tmpPiqQGOJB6aU4vaGReQEfSJOGUq6AR27Vw=;
        b=ID0o6FqANqkmJXn6KnKfPYFgbz77eo0j6OIy6j6Ph3i1YsQXSQ9x2H3dvCPJSujquB
         bDCrXUyQOv7lUKKz+zg6atRq+nBhPrGLNgDTmO0DOFY3SXPwB/tIf9gw4/vJOi1cWD0e
         P9wuOZyBULB3RGYtZqsIXWKv65N5V1anAsM5Mk6zyUf+oDR+xH9NRuNiKttk/gUKud+G
         pR4fli1xqxlFZrZDC0lTBvqm/AxJR1QWRi3hjy0u3BPZBJ1UN8f0r012NL2nek/5kD7j
         zSxKKJBy/2nQ2jdL4BrHeA9bc5J8YpayJvbovwra2IrNP8vFRQCI5F8jMY+BK9C7CGUr
         G1oA==
X-Forwarded-Encrypted: i=1; AJvYcCUNS85/EqmtniRRzXxHxUS4LZ9evhcvF2XB3GR1iRYdZWhY/LWh+QkO5Xnx7jkDVhl44uZLN0BdwxZ/Icf5YALOFkOtccTY+jdF
X-Gm-Message-State: AOJu0YxUSJLF2urjYksBoFi1M1lClHu7KdPbJV+xYHNYZ9mbbXe+WXnU
	+hZkFycW+B0EwNifBSkd0BKClFC31j0wgfcM/tJOjT5Qhw1Ps6KNQatgKQjyDH8=
X-Google-Smtp-Source: AGHT+IHErKH2/DsqhBfhbtuV3XHsomNbK5PqNqpsP3gyRzpHI74BA5YQhJ+56xWSAkof/fTCbUywSA==
X-Received: by 2002:a05:6808:1389:b0:3d2:17c2:8301 with SMTP id 5614622812f47-3d5459cf707mr17529553b6e.30.1719508969365;
        Thu, 27 Jun 2024 10:22:49 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706b4a58847sm1617843b3a.186.2024.06.27.10.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 10:22:48 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/2] RISC-V: hwprobe: Misaligned scalar perf fix and rename
Date: Thu, 27 Jun 2024 10:22:36 -0700
Message-Id: <20240627172238.2460840-1-evan@rivosinc.com>
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

 Documentation/arch/riscv/hwprobe.rst       | 30 +++++++++++++---------
 arch/riscv/include/asm/hwprobe.h           |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h      |  6 +++++
 arch/riscv/kernel/sys_hwprobe.c            | 11 ++++----
 arch/riscv/kernel/traps_misaligned.c       |  6 ++---
 arch/riscv/kernel/unaligned_access_speed.c | 12 ++++-----
 6 files changed, 40 insertions(+), 27 deletions(-)

-- 
2.34.1

