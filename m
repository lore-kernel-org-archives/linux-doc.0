Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9633F31077A
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460115; cv=none; b=MIcr863bmqD6TGYCz8TzMS2iksUs4GFUIuwQJ++B5OrFy2v8AmDkaXcO5n3uBxX2aKMGxPl/9gjze3otA8M/m9zRy+Qp3+0avEZfQzVk3fbdQUC5YF6Lx7B/g0Ijb1PjmPP8PSL413bXqz5VH+u9Yh2UIl8anfvD0ssWohs3wwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460115; c=relaxed/simple;
	bh=H5VgXcdho2qcAOsPrfVCuDEjpJb90F/5kyr+WZhmQSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lw6vVjVrhddVu+5ocF7lmrvLPZsSGmMYrsGPeXzR4BWjGzHhA8fuz8yxcP24bLPpk3b6jmV3eLvyofuJsZOJsjE3inUmNhZV/3vmqynQeiUY1WBLw7MXYYD4yY/0RVlQAhk9xjyWZVS749tDdMeU492RvoNlbUNjuEhLg0+huO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bWrJkfgV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bWrJkfgV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a91215c158so21073955ad.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 02:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460115; x=1771064915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMXFepmq25l+gK8lb038XPHqcjpXbopjnxKMmYnopIY=;
        b=bWrJkfgVHTwKgChHYPb8e9uSnp/HZCuuVEXEnJIG0noJjqCV6qvnYOmzU2LjI3h9MH
         Iok0Nz2B48pkWY3MWYVlXK7StbsG15BaV9lfNtBy+qFqjwKnP6vvhmFbJyAPdj6CIo5l
         QyGUGH6jTHXVDEcM9PvjA24+3exzsmxmrxemSzVkDWPi6H+lr6ieLTFxU6XweHWLdJP8
         +wBqBuNuCVEpFwQx0vu3u/Xxa6Y4fuC+br1P+b91WJ7hHYdBek5kdlgnBu5DmcXC/XL2
         LE5sbMJHYLuK29VfNPaV/F+8KH6xeo+4xMG+nifWcNOl/0noofcST7p72HP21QYUTW6p
         011w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460115; x=1771064915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UMXFepmq25l+gK8lb038XPHqcjpXbopjnxKMmYnopIY=;
        b=LAb28UKChaxveDiDsJrQ/G5yQlhNZJ6tG5QolWPwhhW+8MZIR8A29UfH0PZNQZ4kVU
         GkHugxjTGeZJJuUQ2xUC+4ftzNFAxRcgAC026Djk3PvOK4k/JGw+jkK8ONoMam02H/Qp
         Yq/vGoGFWpduX+3zHLT+aZooWGuF5U81epU41jJLRP6yVtDDaqvX4b8oEtIpo67DcwTF
         vG0BVk5tgD1mGa6+iBb+PSLKMMQ62SXG5p/mv3HDLjGjvIMHBKu0WmZ5a9uBN2eXj6KG
         aEMSDKDRYAC+h12XySRNHoxRO0hK2IfHFh7+s1Ho9H0QhGGpxEYBRcim+0oOnAmAFOcZ
         ScOA==
X-Forwarded-Encrypted: i=1; AJvYcCXvmyPOI3WdLCsfNywEaRfny9nsqdZW5S+XG3R3sBRMqifLeJQjVg+JNZDd1+BsNx/f9v1ESDMHaoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqEzsGV7ah7RtTOzl+CdWyIyimZ66TheGRozzDLAr5Bjtw2Dji
	OhJAxMZuCKyzPOpEJEHD8Ga/Z/pNt8zxV2L4IdlzM98cXRPBy+nJGTGgd+2/O1HVvaM=
X-Gm-Gg: AZuq6aJaEWi8HK48ELRUkZssK7cQ1RCcjosYBqYUP3inL0bHBL93Nezc8ghaJtFkY4U
	9R9Zk6BU4MyUnE3CMTDHALiW1olr6U42c3/B1JkUBZW0xfv3S258c6dknR1wJLNnrT9wjGnuwrX
	2bRC35okzdUHqDbyNzsWqE1YxInfMbnil2HOdMIy2RhYu4hm6SjQIYxP+o+lCIGmTkRBBQSBb06
	rg9CV62lMvWve8nKn+LbnsrS7t1Wt3YbX4OGyb9WF65Cu+ZS73UdivemViXeHWWsOHMnEmwxQa4
	0iYks536pbAVNHpqBlRLICrJmwsPFqocy1SCX4vcdtIuOQVSgDG2AQdEr9ZllywVHXdayOX40Hq
	kSrbR+NygJx6mBjwPZURzVz+KEunV0FIpoYyNHO28mrCVuQEVeTjC5Mdw1E2mEPIQaDw/6w2YG8
	6wNWKw/ZP7qco0Mq/UIM3HirHqADQTbgN7BWchpqv1HaRit1bmIfi1UA==
X-Received: by 2002:a17:902:f68c:b0:2aa:d60c:d48a with SMTP id d9443c01a7336-2aad60cdb4amr1025915ad.7.1770460114944;
        Sat, 07 Feb 2026 02:28:34 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:34 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:28:00 +0800
Subject: [PATCH 6/8] riscv: hwprobe: Add support for probing Ziccif
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-isa-ext-parse-export-v1-6-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Ziccif guarantees that instruction fetches from main memory regions with
cacheability and coherence PMAs are atomic for naturally aligned
power-of-2 sizes up to min(ILEN,XLEN). This is a mandatory extension
in the RVA23U64 user-mode profile (and has been since RVA20U64).

Exposing Ziccif through hwprobe allows userspace performing concurrent
code modification (CMODX) to confirm the underlying hardware guarantees
atomic instruction fetches for naturally aligned instructions.

Previous communitiy discussion exists [1].

Link: https://lore.kernel.org/all/20250407180838.42877-12-andybnac@gmail.com/ [1]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 5 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 198b31bc9a20c2739988849cf7d2948a4fe1bdc4..89ff3d4e9f299de2b7d14b7ed77a04409f821621 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -399,3 +399,6 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension for main
     memory that must support misaligned loads and stores, as ratified in
     RISC-V Profiles Version 1.0.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension for main memory
+    instruction fetch atomicity, as ratified in RISC-V Profiles Version 1.0.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 323c488de5548883ddceac256bf312ec854ee899..ebf1434f54e6dc640b3414e8a23ab8e29ab243e4 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -118,6 +118,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
 #define		RISCV_HWPROBE_IMA_B		(1ULL << 1)
 #define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 2)
+#define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 6997c6007a8e86dff85b5b83d14924e7c2466eb2..8d774a0be9110c997a200c4eeeb434e8afd5c7f9 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -209,6 +209,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

