Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78736D9F1
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 23:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777679117; cv=none; b=LjbPLN7KeFKy6P3ipGg/tKR6Myrk9X9Qd9rTNfk2TqKC/VZ72LDgazz7mDMwdZhtmcS1OUq7ZldTCrG8NUDK8AOG7pzbQdsGj4knwnGV/+JTsCdKnYUAhFuWMiCAcukeKdXm8hri9VbFwlLGmYpiL3OvPd7U2RlyMbgLXSatUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777679117; c=relaxed/simple;
	bh=ktRZ3LrclclreamqeMfI9HWXewvwy/mAU3DZvFNlIvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnpxIvgt/gAnZE61avEg7I/0zUQG48QsaEvEIceeNRHcxIybbk2q85SMuHaJu/fJVZVYKIJeh0fObNHTwEXUVTijuF+VS4wsW7JbzoWPi9ZD1Yn7I/5Q2L0AplwQ0NTCj1DhHVIVsS0etNeggeXpLZKuK+aDeP16ujpTzC70dC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjZRn3L+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjZRn3L+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35fb7c1a455so861008a91.3
        for <linux-doc@vger.kernel.org>; Fri, 01 May 2026 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777679116; x=1778283916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiUX46+NTllWWWm/iG69SeYyuO0SCDfaLB55TfAIGA0=;
        b=LjZRn3L+lAjKxclvHQ/kjOaI60x2YNHDGvoilzK0n9HsBwYz0Ck1ltj7OX1ICzGL+A
         uAkBEmujqyErL5jqgx6At+qx9TeAvnBlnyOTmWqxjByZSxKDCZMAESkCV/cN/LsT7xN/
         tmA1xSEdoE9Zv1em/JFt8Ai6LCEroUjNekiZ2k9M3QHeUJspbkA9/yHDSSccv4TT9+m+
         PuuLiokuHB5krDo1A34BFu4Bg3ilEkveftkCzOp7/d0M2+SVPS63MRjdI9TsYAIXZJv5
         tR+UOQ3rh0+gu5jKzdkGYOTNz6xhjnDDO0BrVlfpxe7YfN4Vgp152lCpcV2dc+dyqQBT
         rd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777679116; x=1778283916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiUX46+NTllWWWm/iG69SeYyuO0SCDfaLB55TfAIGA0=;
        b=mNhCRR9jFH2Hi+86HNU754AiPqOdorPr99zlPooxJWe3SHccm/r3sn/JqjDnfW4y3u
         Ljpc2I/REBq05/xs2dSeN+Jn3MzQmWmnIfCaT0aFUlM5zZLewQQBlxVwMEoTP3uw6B1P
         raD7GdaEeacb3Wtxo55AOmhc/BxhMYHLahfLoe0uqEbv3R/KMOKqR5LJ5OP/VTNlPBGJ
         G+CV93n9bNNiR+ovqJVeq+WfR3LhnbgdPFsiSQvVvS6sdgbK60UEn9L04q3ImIzNgdq1
         RQqsv5TZthCpuPTGmL79lR82+birtsLbgWAo0EZPAGu/o1yXHEfcJcyTMWVfbQKZIWyf
         S38Q==
X-Forwarded-Encrypted: i=1; AFNElJ8nTMc3Hg4DOd1YdWIloUD74Uh9weq9268LMDegnVjSx9hJAAIlGXpfBCEs7/Xv20odNGQeYlm2Gfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaAgLRkOW+rQ5rRR64jEGQlQ4hMfyQTourZaskNe66A0QJBHOT
	YE935s/QXJjDj2VDFDOVeZjmYGiZwIINLt57dev8nF2g8hZE+DNEXd3l
X-Gm-Gg: AeBDievqIhtboUbVvw0AXAaryz491xMzeu12/j+cs1BOOi/kHLCRcEFkjkqQbGt8m/i
	uk9EWQGfoNgdwe2FoJ6KG+ei8dKnM/03wYgszfw7+zfpUB9tMZJ1Ah8WlX5ULmqnVfRZWqq9esK
	IXBu6cDJcL9K1ymfs2Shs5Z1QyCPnh66LTv5wNfDGRUWqwiIIowyZujDtXlrA+fA25l5l1UMIjY
	sA6vzvORutwPQNLC4ki3BfOFsaqr1S9wK1z9zS+SouacPtaqjnYKlDVOFlAde2CXBXUUvj/73FJ
	XPThLn7CR/orJpLIUPjkb5BwmBM1lb3GgUu9vkchflEp7ixIomfkbMb3tQixgG7jRDRBZd1e4ZX
	cJzce8lb5B4o2tIXUVRBJjp4Jpi0VdvSEWBYm12xLvIfGBwWrZ/eROroOQdyZXhA57q3FeXHSQv
	kdEfpkMj0LSfMzDmnPhSyrdhCD8N+pl+Rb5q1GTibE
X-Received: by 2002:a17:90a:d2c7:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-3650ccefbebmr1107684a91.5.1777679115612;
        Fri, 01 May 2026 16:45:15 -0700 (PDT)
Received: from localhost ([121.237.249.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f3c5b75bsm1386232a91.0.2026.05.01.16.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 16:45:14 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Coiby Xu <coxu@redhat.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 9/9] Documentation: kdump: Add arm64 and ppc64le to encrypted dump target support list
Date: Sat,  2 May 2026 07:43:38 +0800
Message-ID: <20260501234342.2518281-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501234342.2518281-1-coiby.xu@gmail.com>
References: <20260501234342.2518281-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The encrypted dump target support is now extended to arm64 and ppc64le.

Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 73f2e9500c60..8708ef394212 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -572,8 +572,8 @@ Write the dump file to encrypted disk volume
 ============================================
 
 CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
-encrypted disk volume (only x86_64 supported for now). User space can interact
-with /sys/kernel/config/crash_dm_crypt_keys for setup,
+encrypted disk volume (only x86_64, arm64, ppc64le supported for now). User
+space can interact with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
-- 
2.54.0

