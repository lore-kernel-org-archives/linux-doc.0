Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB679139588
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 18:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717007217; cv=none; b=Er42iTeHRVLaAX99v+dW2lHhSkNvQ18k7K04DmQqtd/KC4p2d3IexSi6e7U3ZueYWYz/szVY6Ia3G982BRD4bBUmJOHUZBp/dtT2w2v6z+4fRnPJxWGWqUrJPSKY0hrieAfzSHmWzvMDW/IKH4IAfXFab8tvC/ahoS6sY50vX80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717007217; c=relaxed/simple;
	bh=6LVVYXNh21KrADprqmRbX7nwjBAz7XxQbzBF1i9gRd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MVclhhg+tlPqu8zPLWM2PIOifmtM6Wifmcsa5XuOXOWyt30jsLuf3LemBn4hLvZXRAfQienZXiq/tDBvg3uDTL2kv5lxfsBhrge5GPtOrECv57uTs9AOxHccvjvHRfhk8V+dGbKEds5BTo9LshBkWS6TTte69ergUzMa3IsAw8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wJMqtpn2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wJMqtpn2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f480624d0fso497955ad.1
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 11:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717007215; x=1717612015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wV+9Ayl5aIwRvmUk+4xjSCYb53pq5UWCKjYVecZ6q8o=;
        b=wJMqtpn2EsmcCuwQlsta+SxjUkeINsfzZKhkV+E5dJy5A8j8Af8HI93mcUYQnajnB3
         c3lbmiCrh8hs3yy5p1wOJZiMtPTipkXZErolsdOQyN87RpJPCvwEKmCqGVmfEUuOYPl3
         xdV4S3vcWvokHo5ZCgGNQ4w7Ga2yf50N4o17ZLQQmelfmLAAyanIaGDdCmDVpGISf0sC
         8aj6yG9ywWRjwxuU48NebSRvgU4U08fSPo2i8MiKGhwfv3V2hFVr+AVmUyHN+prua3DU
         uqG7LeJeTmUlah8Ve7mLii6WAwo5ZtmMy0mzztnqrkP4CwpDPqa7cVo4s9SaOz6VKKig
         PUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717007215; x=1717612015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wV+9Ayl5aIwRvmUk+4xjSCYb53pq5UWCKjYVecZ6q8o=;
        b=KFOGOG3ETeqVrQ4MvinPHxsR0tfljGozO7b1TxVCRc/JQgdw/NuLNL3BrZ4vU7SVWH
         BLESuR97eLBBUa+a5s8RDlZFKJ/1Gppenb7dqvmIN9qD0OWCaYiRTpULu/90MFYybbEy
         6RIm00IBUYHgj97xkSguIzzzWhRW83t5zoLR6oL3RFFPhBWmuWwegvbVTuBssfMMu07d
         VIfxRWb17CgnTMLaHpw6ANlbl1RUbR7f1FhKmZfpXHYx0KLwD7CXLaWY5WSpBqNYzALc
         xblaqcgP1sVstr8wnp/1Yf6XBUSjq9bRxWwMDZ4euXF7bID1LM9wZLIf++qYpudZjCb0
         xghw==
X-Forwarded-Encrypted: i=1; AJvYcCXN88mhr/ZTwhsoGw9a4nG/0u3hHXGN1v9SVEervrETxkSjF9CiZPWdeNJg43yjUHbmuWXNeRAiht1Q5bfVT+isGy1KgAKezOde
X-Gm-Message-State: AOJu0Yz65qCInKYbsDpD8S+8XeDdNGYGCgUnaX4YBzZ1pgFcpKKE2H0F
	O2UMVYdSw48lJKm9SwBOAfOhQGlOm4RZgJeCU5ljo5JgyPbvHSYEALTEH4NX0tQ=
X-Google-Smtp-Source: AGHT+IHRDxLd9IHo/dFmgMfsngSBbOAxErYqY9dIxF6DeOkxqEZJH9H0vaoSPZZqTHcOxtdRx28xqg==
X-Received: by 2002:a17:902:f645:b0:1f4:5278:5c19 with SMTP id d9443c01a7336-1f4527863e0mr151718295ad.49.1717007215144;
        Wed, 29 May 2024 11:26:55 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c96f67fsm102981055ad.154.2024.05.29.11.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:26:54 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: hwprobe: Add MISALIGNED_PERF key
Date: Wed, 29 May 2024 11:26:48 -0700
Message-Id: <20240529182649.2635123-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
hwprobe_key_is_bitmask(), when in reality it was an enum value. This
causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
since SLOW, FAST, and EMULATED have values whose bits overlap with
each other. If the caller asked for the set of CPUs that was SLOW or
EMULATED, the returned set would also include CPUs that were FAST.

Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
returns the same values in response to a direct query (with no flags),
but is properly handled as an enumerated value. As a result, SLOW,
FAST, and EMULATED are all correctly treated as distinct values under
the new key when queried with the WHICH_CPUS flag.

Leave the old key in place to avoid disturbing applications which may
have already come to rely on the broken behavior.

Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
Signed-off-by: Evan Green <evan@rivosinc.com>

---


Note: Yangyu also has a fix out for this issue at [1]. That fix is much
tidier, but comes with the slight risk that some very broken userspace
application may break now that FAST cpus are not included for the query
of which cpus are SLOW or EMULATED. I wanted to get this fix out so that
we have both as options, and can discuss. These fixes are mutually
exclusive, don't take both.

[1] https://lore.kernel.org/linux-riscv/tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com/

---
 Documentation/arch/riscv/hwprobe.rst  | 8 ++++++--
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 204cd4433af5..616ee372adaf 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -192,8 +192,12 @@ The following keys are defined:
        supported as defined in the RISC-V ISA manual starting from commit
        d8ab5c78c207 ("Zihintpause is ratified").
 
-* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
-  information about the selected set of processors.
+* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
+     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
+     classified as a bitmask rather than a value.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An enum value describing the
+  performance of misaligned scalar accesses on the selected set of processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
     accesses is unknown.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index dda76a05420b..bc34e33fef23 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -68,6 +68,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 969ef3d59dbe..c8b7d57eb55e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
+	case RISCV_HWPROBE_KEY_MISALIGNED_PERF:
 		pair->value = hwprobe_misaligned(cpus);
 		break;
 
-- 
2.34.1

