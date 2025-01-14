Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969EEEAA
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736821213; cv=none; b=uv90qUn7aEFpSfUEU/Rcugyg5LLmCCwhgs8fCceFJ1/QPuRKgINDgWI6agAw05ZvGFRqvp8oMEQQ2wiahwTtL3IvbLme1piiQHeYy3Z7omej9FGBltv9sJh4p/rRRjOMzhxv10QAGYAo19iTT7dkqQ5a2iTP58ui89ILrNhhaVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736821213; c=relaxed/simple;
	bh=fPMZCMLP+pvuLWbFgCmRQhAUcqXegUv7Ue3whmjtY4I=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=nofQOQ6TYit6wFLXIE5tRPiyH1h6n83FXyX92H2u4AkPXikHpgxsmuYPpK6DcOuYztOR6mzptCYVqSaXFgXn6RlvnDcVSVJ/jClodLONlKJW19s0mPfZFR5BrV+WBmifk7Q3qE4mwPvmcP5cLxr3g8lVOiXmU45eJO3KScT+uDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JhaqVPZz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JhaqVPZz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216426b0865so86631955ad.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 18:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736821210; x=1737426010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q09J7qEcp3rrZoNB/+VeCmI2iCaPt+jfy+7tftGYhzw=;
        b=JhaqVPZzwsfMtZlP2fBuIxcdoQc4Lw1huXgg7TmrXvMbz20x8POBy1KW012rRWmkOP
         +1U176ejuu/DhjOWycxnDsA47DaPChb3o8SkqixQpK0+bV5Q+77UPyIsmaNUz8H1UhNv
         BTZS7MQh+spsOhflaOdYeRv9h6TZ+XyPm9VmywXwpfY0/VSB65pbvyrWMjRW4rYIuAhF
         Rr80FMG8ARIKhlx5k28s+Lah3R0MeUnZTNJ6j7gSv6KPbTmf/V0KijRn/7WBMTImFNAC
         xxHJYPnYQTRw63EouFypRt07of9SjdpFQ14H/ujbs2BoU/XbRFlfnkMUzOwkgRFdXbtI
         6WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736821210; x=1737426010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q09J7qEcp3rrZoNB/+VeCmI2iCaPt+jfy+7tftGYhzw=;
        b=jUWFPN5SyVKdApLQqlu8QXfAtjXZTTgPsnXDr14Exo6ywYqvod4+J/nmvw6l4ejXH6
         DiOjRSE9CF00jtp87JaMnvvuC//62PevrP7Hixam8hYZypgJ3+WPGabiko2gtdQXyOuk
         fDIDbw542+aqpVskhSimDmfPxfd6fw46rNJ4Y/onradGmlMhYhagJeDLmXKWELiWE6/O
         PnjIo22jWXyo+sT2pDRMMK1dkFGzIO7FIlv65i8ZuagoKSIrvyJt7IcGSDse9kmI1n5f
         uYfmusCenxP7NE4KvoC5BFC4G/SVrXGVSb7hvGFpsFPHjLCciyXpWjUHDU7TqfCLkZz3
         Atig==
X-Forwarded-Encrypted: i=1; AJvYcCUpEQUq/XM6ysOWQxeE0JQQC+YchkMu/scbAX3xpDyVK0xPevLY/fotxqaP6Ut0PV81x3H8y3ih8x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyENJdB01D/z0+j3t26/xbZk55muORTyNXJFezFIe/oIdttm7V5
	jxfb26EPyR6QuyDODFwz32XczHr4n3A7OuGalEvBmCBHI3VLriCV2EQIv+qZNNc=
X-Gm-Gg: ASbGncvZd2pV5ex4UzoIo/SJdzGjzHWfxuN7kd0nG22qCggaNCzVSZ1m/Z+Nuk01xLV
	5oUBjPM46WstD+9OON6xv5iRwWzWDvEJjNmdUqENgSIwS3jEOuLx4lqdmmLX2TEchDWVl4z0x7p
	ODm08Tn/PJQARQS8K450nYGGrQq5elxUGtRfYVxs7B29TTJbXT5FOWlQyUSH25xrIHeJe2n5IEv
	btV8B3MteYaA3+Lxwnj+AQFP6XrtXGiWLWUFOHkhrcNLaU+p+IXGhhwjEI5vIiakVY8UHMcDEFV
	YueF7u/DwjXCb1E=
X-Google-Smtp-Source: AGHT+IGVvtg7HHpVAFKIVBm03FD1c07xkEL1bUokr4zs3LVVlfXFzTjyIZLaAOZOhim/RI2TecAjXA==
X-Received: by 2002:a17:902:e545:b0:215:4a31:47d8 with SMTP id d9443c01a7336-21a83f36d79mr330978925ad.9.1736821210574;
        Mon, 13 Jan 2025 18:20:10 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217b38sm58948065ad.145.2025.01.13.18.20.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 18:20:10 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v4 0/3] Enable Zicbom in usermode
Date: Tue, 14 Jan 2025 10:19:33 +0800
Message-Id: <20250114021936.17234-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1/v2: 
There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode,
which mainly removes the enabling of cbo.inval in user mode.

v3:
Add the functionality of Expose Zicbom and selftests for Zicbom.

v4:
Modify the order of macros, The test_no_cbo_inval function is added
separately.

Yunhui Cui (3):
  RISC-V: Enable cbo.clean/flush in usermode
  RISC-V: hwprobe: Expose Zicbom extension and its block size
  RISC-V: selftests: Add TEST_ZICBOM into CBO tests

 Documentation/arch/riscv/hwprobe.rst        |  6 ++
 arch/riscv/include/asm/hwprobe.h            |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
 arch/riscv/kernel/cpufeature.c              |  8 +++
 arch/riscv/kernel/sys_hwprobe.c             |  6 ++
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 6 files changed, 78 insertions(+), 12 deletions(-)

-- 
2.39.2

