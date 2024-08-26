Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA2F4F215
	for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 06:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724655167; cv=none; b=a18YtsRIFqWkRoJSGYJXo3vENp/90dBetA2EbPh3ayVjU9+ZrsTfL5fH1vC04lCL6Vgga5xYxocGdt/gDwYkWvbWLyJgmUfe3VbV/VrAnaZ9J4GTebeeqpAbdr7Rtcns/XVREmrBvhFlzA/Z4i/9iGAyLRwStRIYaelLNgVlI5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724655167; c=relaxed/simple;
	bh=/eA4i7PR6yMnPoZKmrEEgJ9lcAJFeu/J1g3NfzxBqkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q2I3pfxhVXjQBr6BAHEtN71UsQyNr/DiSUtDnWVrYia2MuIH50gOxK9rM3h79YGcgxxIKcOld0FyAmzO0I5fmyEnLtX2T9esVru2BJmQqwzzcbymTG8i5JwI3sBIvNpWs6r+8ck7y4PQQ1riY1/uh/S6fuLqRD6WDcZ4+XJEbmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=p9EeorMJ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="p9EeorMJ"
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 900223F285
	for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 06:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1724655158;
	bh=asTw9btpC4r8oJmQ5fgUFJi1d1/GY3upIlP0o+wvCJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=p9EeorMJanp5b8MhTaSguZLNrKbr5CH5lGMpe3DJRNGuqAMmoPLvpHS/SIyuxA/Pj
	 0kyilzLJ9cY6ICqMYwrhJGVupVZsDFFlk2U+tZrWItxSDI7atNeXI+kEesf7rHOzP8
	 Qyb8P3fgtGzOuEznckBM0AqswySJOncVNFrZFBHuvzLWg58FbnAgQxn8blplLjSGmw
	 yXsGBNOiMJYjz4rPeXtvCc0BUcI0fzpiOZA3RvFFLKVgHcQ8TQ9Wsl4WF9wDZvMfEQ
	 XqFyYCs36gI1NduN+2ASTLwU1mxS2BzeDuHvMBC4UzVJjvEOJ3N+hLMbBCMVNaf6yJ
	 A9Zz1UnLdXiGA==
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-7cd96715e6aso4266155a12.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Aug 2024 23:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724655157; x=1725259957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asTw9btpC4r8oJmQ5fgUFJi1d1/GY3upIlP0o+wvCJA=;
        b=phnVA3uFZb17V8meimhS3Ol5UZudFfG0n5H7iZWRQ2QDkxFolPQu6YAPiL3Px896G2
         MgEYNJEi8oxnYt/8Nr1aLh5CvMn7GcUXYYQdQ/emskgcHi2BIsUvMxrnRweCed/wtl1Y
         XkSUeN37ej3WkV3OU2MXC0Zg7ZtY02wNguOlTkUP2uDADja/BXhGJE07EA4JdQ58Nt/v
         YfrIMvII5dtRtgmctFfpJpKiRKhvXlzc4RZKV9HW78ShIPSA/O+ooRgo+6YcwXySPy6d
         hdd/jA104+KsxX/r8kpiCgmdKnzjJNqrnmKZ+0fQoTmgni3v+6a15a1n9YSQ/IDlIMIp
         MgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTNNBNx4WZU4Gc/fuZG6V28vNvMRztSDEut8EwQIZ1Nj+PDABgX8Gx+LNgR51AQ20ScCfZr8Z0SGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPuDWSBa4+mV0uohNyp7jjvGPw8Bl3BMKin/RVGGQPF7BRF/aq
	a+Lw4uXQrwjQ9PFJeOIx2bon+g9G+u/f+ieMIvG6yWo4LPGMriw2ejH2Fpv5Nv6lmd6ochkv5eV
	0rUCSk5Q0D036K+p80eR21byzSDH+y7jLs1ncceEVhDbwBZzyI3saEcxA61RM8NiFdYZxoZrrrw
	==
X-Received: by 2002:a05:6a20:2d13:b0:1c6:ed5e:24f with SMTP id adf61e73a8af0-1cc89d7dde9mr10964926637.23.1724655156909;
        Sun, 25 Aug 2024 23:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFshnr0yWWoq+ZC7FQTS4oA6OR3ojKB+L5NDCHocR3E+oUvuPt3+dFTL8nGph077xQHw8MRMQ==
X-Received: by 2002:a05:6a20:2d13:b0:1c6:ed5e:24f with SMTP id adf61e73a8af0-1cc89d7dde9mr10964901637.23.1724655156256;
        Sun, 25 Aug 2024 23:52:36 -0700 (PDT)
Received: from kylee-ThinkPad-E16-Gen-1.. ([122.147.171.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e09c3sm6472207b3a.122.2024.08.25.23.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 23:52:36 -0700 (PDT)
From: Kuan-Ying Lee <kuan-ying.lee@canonical.com>
To: kuan-ying.lee@canonical.com,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64/vmcore: Add pgtable_l5_enabled information in vmcoreinfo
Date: Mon, 26 Aug 2024 14:52:02 +0800
Message-ID: <20240826065219.305963-1-kuan-ying.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since arm64 supports 5-level page tables, we need to add this
information to vmcoreinfo to make debug tools know if 5-level
page table is enabled or not.

Missing this information will break the debug tool like crash [1].

[1] https://github.com/crash-utility/crash

Signed-off-by: Kuan-Ying Lee <kuan-ying.lee@canonical.com>
---
 Documentation/admin-guide/kdump/vmcoreinfo.rst | 6 ++++++
 arch/arm64/kernel/vmcore_info.c                | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
index 0f714fc945ac..557a1cbe5098 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -466,6 +466,12 @@ Used to get the correct ranges:
 	VMALLOC_START ~ VMALLOC_END-1 : vmalloc() / ioremap() space.
 	VMEMMAP_START ~ VMEMMAP_END-1 : vmemmap region, used for struct page array.
 
+pgtable_l5_enabled
+------------------
+
+User-space tools need to know whether the crash kernel was in 5-level
+paging mode.
+
 arm
 ===
 
diff --git a/arch/arm64/kernel/vmcore_info.c b/arch/arm64/kernel/vmcore_info.c
index b19d5d6cb8b3..be65d664bdb7 100644
--- a/arch/arm64/kernel/vmcore_info.c
+++ b/arch/arm64/kernel/vmcore_info.c
@@ -7,6 +7,7 @@
 #include <linux/vmcore_info.h>
 #include <asm/cpufeature.h>
 #include <asm/memory.h>
+#include <asm/pgtable.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/pointer_auth.h>
 
@@ -36,4 +37,6 @@ void arch_crash_save_vmcoreinfo(void)
 	vmcoreinfo_append_str("NUMBER(KERNELPACMASK)=0x%llx\n",
 						system_supports_address_auth() ?
 						ptrauth_kernel_pac_mask() : 0);
+	vmcoreinfo_append_str("NUMBER(pgtable_l5_enabled)=%d\n",
+						pgtable_l5_enabled());
 }
-- 
2.43.0

