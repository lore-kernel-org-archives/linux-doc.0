Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C801FBEA6
	for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 01:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759107878; cv=none; b=EL7OQIcLEGgrdOORtYebNbdJFri7MvIlteJ1C1WNbfVDqMHR7+PM0CylnHKe6dXFXvx1Na0aZ6TevpF+CQqHT8KyXCKgfBksMwnfX8ldHk1MMGj/VDnq6whuTGoej+XOCjYj0XyiA5dptLlxr1x7BFoB81KEpeN/x1UyzA8HpOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759107878; c=relaxed/simple;
	bh=hPTwkZ9Zs7OGfgoBOmsXzZchI4dTFATs/A5A5sAPQhI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIbdUTb8uLgPwLYmSlUJ4Q0HbWUkiXmYOZb3alqMh4XX924Kgz+KMEk0sMuVXXclUV4h1F4Wl5xmMdK1lt1xvgDkU8cUXnoeIZH8m+8EM16sHrPR335nmVs+9e6g4B0E9I7YpRPdWLyPyZbJInplC/PnzEtsesRnU0tLTKoTzJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Ue76cvBa; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Ue76cvBa"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4da37f6e64cso34636421cf.2
        for <linux-doc@vger.kernel.org>; Sun, 28 Sep 2025 18:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759107875; x=1759712675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4673JtxFCCWFxWem0KySHim/AVBmSFNvOtZj4TDhxZ0=;
        b=Ue76cvBagnFBBmoFEthA+UebVXS0ul8p2//sjtmZ8tFttzpGA+evB4A+Z/cY5sYf9p
         sJJzKP55lHXMdDXLl13ztZsxflDiYoR6WXm6ase7jabD2wP/o1TWCFTteH0Kv8X50cDk
         Lg6Q0R3NGLTO3f9ckZMcsBulv8HP46ZpWvqpPgdIF9OnZkG2fOzQiQ0ITU+r17tqhwp9
         1pMufNlR4jSjQZ+SpIkRTgeUeNGHksX8ZP5iSTuZwHQTENtaJ0gjvxPGh9JZu3RuFojf
         vgB8Nxpi2Qb3scndsQ0Wf27O8xvB8yeomNF7ZjSJLgr9e5anJIsUwejCiuta5kMfeLBs
         NViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759107875; x=1759712675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4673JtxFCCWFxWem0KySHim/AVBmSFNvOtZj4TDhxZ0=;
        b=Mj1QlM8wLmzLPw6+hCuqHrZYwMwSIUt06WtdSEMdrp2a4BuGTrkVNVRwHhSA1lm9gc
         rdK8wYd5Wg96ovG+FooCDzt0AqzbndA3sEMc4W5j4M85Ck/nz0spbPEp9O+BUJRGR548
         M19QlavoGApXvklnahEZgkmscLnB69qOixPpsdnkJH6wV09r5lJ5p/QQSiDCgOzPWYDt
         s/zEZ6eirln4sp6xMIEjqJf7NIpnN3dUzQu7Dng3ao4nvSe6kxH2An50rN5/8q5kw0Ky
         My2GQ3E224RzUdjB2nmpgd0l7XJ7rxBCgzIQiH+m5/vwbCF27yaXrgeRoa9hlp1IqK5p
         amgg==
X-Forwarded-Encrypted: i=1; AJvYcCUrHsE1IJkGtVvDNYxShdoR43ar5dKUp8ODR+bdLuJjmKqo/8kro0232R9981ErsQ3dBn6xAjZi72Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2QOYk7Uqj/mlJNkH+PVL04trYYuknw2p5FHfEHbaiah0kSh8m
	o4Xu6DhQywiS8wyesjlRrXI0WFxH0/fy5OylIuTz+gf55fIVLxHda+31QKM5KwJ9KzQ=
X-Gm-Gg: ASbGncuxDYj66+WDwqg3CZhTa7DyznzLEm6n+YEoFKXrYDWZQBbd00cNawKOzEgTx10
	YHBz/tdG7g/GY6RvPNBLHcoeyDpbp7ja03u3saLvKLDfmMjBKrRfON1zGHxFXeu8fYW35/d9fn/
	OM9BVbz2AQXfYwQvEb4Xim5z63IV13dXD2qK5lqQGaBp+wK0SgcrQhWoGwGG7wYc6n0N6tMoMCz
	i6ckeMcPM1zX9r9fJpCYcy5vPibEugQXTgUo8LauhWu7xeLsQk2gGm9S1ybXf8dJQGoxrrZ3/hw
	szlcwU01JEbmh53+peVnuDa36RBQkTwej+tTclg/ptopmyRZlfa8eyXdRpqDtWfCX7jnhQ4VoIt
	OltvmIMq2h8ja91+ahZ2Q4TuiMJq+i63hBqFo3lm7bobllEho1PQ8skRyl3sS8AwmzFpzzqiEJh
	QFUwi90rNGjpOf6KEH6g==
X-Google-Smtp-Source: AGHT+IGDD1FThqyz2U7zZsapceDkvp6OYAFPiCrTNFDU7CmxN/gojkNSulBOcc5jk5r12Vod1QdZCA==
X-Received: by 2002:a05:622a:5c8:b0:4e0:b5ef:2ba3 with SMTP id d75a77b69052e-4e0b5ef2f60mr33122951cf.37.1759107874548;
        Sun, 28 Sep 2025 18:04:34 -0700 (PDT)
Received: from soleen.c.googlers.com.com (53.47.86.34.bc.googleusercontent.com. [34.86.47.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0c0fbe63sm64561521cf.23.2025.09.28.18.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 18:04:33 -0700 (PDT)
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
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org,
	steven.sistare@oracle.com
Subject: [PATCH v4 15/30] reboot: call liveupdate_reboot() before kexec
Date: Mon, 29 Sep 2025 01:03:06 +0000
Message-ID: <20250929010321.3462457-16-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
In-Reply-To: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
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
2.51.0.536.g15c5d4f767-goog

