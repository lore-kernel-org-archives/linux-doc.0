Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F9512B87
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481785; cv=none; b=XYXnGm4tvJJkzXTIZwZW5ZTN+YBJYRKk6/ViFcL7n566XRoTKuqwgEncCf6I8msQe/rT0polNnpmpZ3FX6NxsPUoEYJaKGKp5IQ/EjjIRZjZ556VvLq673csO1dkgdmN6yY9TyVgMjvbmQVymqlBj0W2K3juOQe2sWa1GUkJQeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481785; c=relaxed/simple;
	bh=J6Aw22munGkbl9KO8vMyFUNjJ3/2quptcKmO5CShMAo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=uazIav3mVNC/ur3eQ+s108YHXD1U7Zaj/G71cX1Fh2/Hi9BXgg9Dzu6rx0o905iN5g56/AtqUppKLkREcfpyjdihlpRrzILIJPqEdI8/hLdfTLfQMGLg3LNyggo/ugdgI6KUNeDtSvXcp07DX64BsHLyOB9SmpNk0ciDBDpkbg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lM8n3bWv; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lM8n3bWv"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5957ede4deaso6232678eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481783; x=1706086583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQdK6UN4Sbkg821n0RzgtdTqevsqeZ0NPVjMH2nTkPo=;
        b=lM8n3bWviz9xrf4z48i05KX6FfpmKJWHre2/8mOP2PmH8CdecYNwo9FBziLuBomRu0
         wfF10EpAsyvblBBf/wtEK6TjTMcr9eBmokvCcgjaYdnxV9VbXMgj1x83CxrShXIKGEa9
         2Svc82rnwvOQ1zRD0PACwDxbLCxwDzT2SWAT5I2dksNXwIPtU9ydNyrTnF3FyDnpEzDS
         1FMeZS4XTQOgb7ybrSJlVsokDKRJC8o+nnXFSHPxXEfw37VbnhUYGnIgJAxPu5QQeusv
         XD/JGuEeLBtCn12sfYy1prDWStl0ZFN9Mlr1EINbCNS8XFNDChYq6ngLckHfpho6o/Zi
         oq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481783; x=1706086583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQdK6UN4Sbkg821n0RzgtdTqevsqeZ0NPVjMH2nTkPo=;
        b=KeUMKazwQyDsO+xxO8JG0G41w8nRUQkKN213B52mDViVSlrdJrJ5krNuwrA/aiMv98
         NsEj54s1+LyxGZAQ7UbhIbhmSXLNhuT3EN9suqFFHoOA3uteUzWNVS/iFm9BnFdNnkAz
         N+x0kMQCj98rqDDrBQ8E4EejrL0B4VS67oWwppl3ugD5iC8YhcR5B2ye8XRBClB9rD0S
         w4Ed0Lm9zVo+Rq8eZwZakXiSHSfZUQLQKfED+x2EfTVBZsq8OGAFpDMbSLsUTPKWND25
         ZrL1onD/YTgRjc9f3KyzZwlRxnH+HBPxD3Ce35dStr4cyl/2p652kK8XDWfUeLZFbznC
         r74g==
X-Gm-Message-State: AOJu0YwJUMSdd0slUiannrjCKHgkcwOIEGa5gwIWB7S2lHC0qftEOfB7
	1gZv2oCxjTYCoyHH8J+Nhgm3Oqe3VAJ0Sw==
X-Google-Smtp-Source: AGHT+IF/HMTMNB8W0qcQb37SKY14Aembgv/YlibRIm+GjzwykgS8GBYt+tPLDr1xX+XPrtF34hq/yQ==
X-Received: by 2002:a05:6358:5e93:b0:175:c1be:dd0f with SMTP id z19-20020a0563585e9300b00175c1bedd0fmr9912740rwn.50.1705481783152;
        Wed, 17 Jan 2024 00:56:23 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:56:22 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 16/19] arm64: text replication: add Kconfig
Date: Wed, 17 Jan 2024 16:53:54 +0800
Message-Id: <20240117085357.31693-17-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Add the Kconfig symbol for kernel text replication. This unfortunately
requires KASAN and kernel text randomisation options to be disabled at
the moment.

Currently, we do not support CONFIG_ARM64_16K_PAGES and
CONFIG_PGTABLE_LEVLS=4, because PGDIR_SIZE is 128T,
which is too large to allow the kernel text to
exclusively occupy an L0 page table entry.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/Kconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 8f6cf1221b6a..a9dfe6e0006a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -163,7 +163,7 @@ config ARM64
 	select HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
-	select HAVE_ARCH_KASAN if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
+	select HAVE_ARCH_KASAN if !(ARM64_16K_PAGES && ARM64_VA_BITS_48 && !REPLICATE_KTEXT)
 	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
@@ -1443,6 +1443,13 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
+config REPLICATE_KTEXT
+	bool "Replicate kernel text across numa nodes"
+	depends on NUMA && !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
+	help
+	  Say Y here to enable replicating the kernel text across multiple
+	  nodes in a NUMA cluster.  This trades memory for speed.
+
 source "kernel/Kconfig.hz"
 
 config ARCH_SPARSEMEM_ENABLE
@@ -2161,6 +2168,7 @@ config RELOCATABLE
 
 config RANDOMIZE_BASE
 	bool "Randomize the address of the kernel image"
+	depends on !REPLICATE_KTEXT
 	select RELOCATABLE
 	help
 	  Randomizes the virtual address at which the kernel image is
-- 
2.20.1

