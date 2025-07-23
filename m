Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19672FCE39
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282057; cv=none; b=qc4qRr0z0gRcpQ1bYf3vprAPMCZtutNbL0m7M5XOK8L+WWtg15n/jhtboO5QXfPSTTUQg1YiPhFbmkFEg1t3B0gg67ci5RwbL0QZ1Jb/hpLE/0/boaYnYWpUCVhRxQXxaRPClGZcDwOwdJ6YNJJnzTpMA97ivS4FlIWHCUKB58s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282057; c=relaxed/simple;
	bh=MeL5rpabCOQ9W64WCDzEoX0aCqKWSq3A09PvP5YRATc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltZypk+K+ECFZM4sGgaUaKeB3Py6X3QhICSi7e+XKp39tnF5viiD8TdLeBEZwzCM/j0rCBC4smrJ/RU+xfhAEOwYrtCPVZjFSCreFTzVbeDa6niwWbOXVrfQAU4+f963ZjRbPloYa3Z9fUw+NmasaVxf/jKdvdKd6KBDmNj/8Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=Yyy7zBhk; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="Yyy7zBhk"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-711d4689084so62410717b3.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753282051; x=1753886851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FWnE5Bow2uoaZcwISvBgq/4l5cKqkAoia4t69mDLc0=;
        b=Yyy7zBhkzE9t6E8ma3qmVy6Xxm+sC68V/EvMLhqxTwRVXtMOh14j3t1ZR3jFnbZhVL
         gCkDWN9JRIpqI0pgC4qc/1p1lbggJ45t6IGJjc4xPt4zCxPSiAf+WEr71IZGBO3tpMt9
         eEX17hJV+76mpL8wSoMwgWYa/2ogjO5ld5LF5aJ1V+YRv3HP68kBDUx4NY237tGtBCOR
         PTOYqBRUi/RVpW0msVaUOV57yLYuQc/88nP1HQY0dao5tosixpnQXVvdFwRIwv8AiwE+
         DGy6dn5kCoPB5xFMr4f1quxO+OyymmeG7L1abtzK0tX74IoFqMDmbW7ibeukt4TASkub
         2HMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282051; x=1753886851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FWnE5Bow2uoaZcwISvBgq/4l5cKqkAoia4t69mDLc0=;
        b=xQqqVAl1XncAU54AlHBC7wr2t9alTyBqeabTSEg6Ygfai7WcIM+wPFyiDtlXcVOmkO
         7RVjH0dYBaRAKP93IuZ9LlgZUF16BSw0F9u/U73eyhJ9d88mRmdvDV8kc36pjufQxGuM
         zlQ66/4g0lPsA001+h9Vrml/BoXscSKYhSARUzhsmh6wjbyaBezB0NosZIFT3pAf35kn
         krB7VgLelE8o0jRtra3/Y4g7eeD4qB32K72NbiH5E4OrZ2vr5sC+xb0CGZB82iwNyvDl
         kqmej0ahw4VjqJGCorP45lxmjfQTckmxTJPnpbISSRymW3ioqm9wQGnQ3pefoi+ms0eP
         eS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNp1oFVZFUsBAybJKEvmJl90dr6qMe51a/qW8xbn7/sBB/kkixi/f/ZIQRJL2vOsiP7GUL6OZc4CA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+y8BX0UD2fXtNY6/9Lip27QJmeJcfpYZg7U8MGyUt+ZcxAc7d
	HfJgmVpl+583sBXnmPCRcD2Msg04iD/79ONgaiGJYtzAuCwqPIrO4DxCwq39RPRpHts=
X-Gm-Gg: ASbGnctGNvBEv9MyJjBoz+sVHUFlnlL8ZZzZ0B3x9FCdB/sAx0MVx3OMyRadNlI9bzE
	OxFNL4gQqd9I0Zz9vSv61bBEcLLxPq44N/O5LkLV2htFolVKJXY01SuLtPcrdq3AH1FgxJRn5/h
	LkPFER6XnfaitHxvoJXYFm3QyEC8PrOEiVWlrkrw9XIqjVmwypv7bCvyHT3OoVRd8bRIAmuD5I8
	sVvuEFeExt0u/XwkaZXZCpq55K79ZtKVrUjOt5CT3RZtqIYm2bK+dZNH162ErfOjfGnOVSccS2H
	FsGz3410i+Kwj6lbawyrr8ztru8njUIyTXsJQ5b4GRQTq3Obiht/oEgaiqHviqM9e8X1MkQz/wu
	yMbr5c91L2EJHMgXJ9jvKoDTpTM1nelzw4a+NYPiyVuD7oLCdXcv03YX3yyIaOGGZ3EpGglYkyJ
	8aymfkYwSlHu7THA==
X-Google-Smtp-Source: AGHT+IHLyQqcsnOqnRO6HNMaeplbRrfZNdB8+kP2xWX2qbNG9/moHQNfSe1QScqIpYGuy7dJX/Q6FQ==
X-Received: by 2002:a05:690c:d1b:b0:719:61b8:ffd7 with SMTP id 00721157ae682-719b422f811mr42827367b3.16.1753282051271;
        Wed, 23 Jul 2025 07:47:31 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e4fsm30482117b3.72.2025.07.23.07.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:47:30 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com
Subject: [PATCH v2 18/32] reboot: call liveupdate_reboot() before kexec
Date: Wed, 23 Jul 2025 14:46:31 +0000
Message-ID: <20250723144649.1696299-19-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the reboot() syscall handler in kernel/reboot.c to call
liveupdate_reboot() when processing the LINUX_REBOOT_CMD_KEXEC
command.

This ensures that the Live Update Orchestrator is notified just
before the kernel executes the kexec jump. The liveupdate_reboot()
function triggers the final LIVEUPDATE_FREEZE event, allowing
participating subsystems to perform last-minute state saving within
the blackout window, and transitions the LUO state machine to FROZEN.

The call is placed immediately before kernel_kexec() to ensure LUO
finalization happens at the latest possible moment before the kernel
transition.

If liveupdate_reboot() returns an error (indicating a failure during
LUO finalization), the kexec operation is aborted to prevent proceeding
with an inconsistent state.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/reboot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index ec087827c85c..bdeb04a773db 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -13,6 +13,7 @@
 #include <linux/kexec.h>
 #include <linux/kmod.h>
 #include <linux/kmsg_dump.h>
+#include <linux/liveupdate.h>
 #include <linux/reboot.h>
 #include <linux/suspend.h>
 #include <linux/syscalls.h>
@@ -797,6 +798,9 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 
 #ifdef CONFIG_KEXEC_CORE
 	case LINUX_REBOOT_CMD_KEXEC:
+		ret = liveupdate_reboot();
+		if (ret)
+			break;
 		ret = kernel_kexec();
 		break;
 #endif
-- 
2.50.0.727.gbf7dc18ff4-goog

