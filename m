Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF942FCE3F
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 23:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893558; cv=none; b=ixhejeEQsenY03Q6mfHTnGvqFFZCp4V9ZMhUmKMqb9jPy3yHNKETO468OR7Mqu9qnfbX0Pu/47Ihmdf4HXBVesWavR8F59FRtQb4HeFROB9oFchG5U9WtH0+3QlQjB5sw0LN7UOje9AeK+WPQUEjDg9rJNWa0vlIRuFIQRD4V0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893558; c=relaxed/simple;
	bh=MeL5rpabCOQ9W64WCDzEoX0aCqKWSq3A09PvP5YRATc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABb8O+TvzVq9zjAvYok9Abygl3hdvq67GBkB6tUTh9RTuE4xAL8+75XTTJ7i0IswRIq3WptxCWGwL4Ck93QTdrbx8/6oCOogRCJ1po0OUysj+06eSvnK9Ktdrw+zBBcDZB5JRqYltmQCfzHDOjnoXggyTYiAqKkQoZIHmqXPjMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=B1eRO5Hg; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="B1eRO5Hg"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e7db5c13088so439786276.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 16:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893554; x=1751498354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FWnE5Bow2uoaZcwISvBgq/4l5cKqkAoia4t69mDLc0=;
        b=B1eRO5HgatGq4rstuHwQb5lRLPCJUJPeYDwYtXoaXEQ6M2ydVeMdgP5sfHosPCqzX+
         826BuhtF/jpBSjO5u3Cd+iCrP6EZuAeF4wz4RAtfsPcJZDSHrbN0ug8kX514GEaI6IfH
         1HTxR5Xakww2tpQn/usIrCPwX1y8c0DJzwCGf5kSvD93mJ3XzDwh+LBjP0HOw48/JdUY
         xOnYtcV+oCc+PEIUc7ZjHB1O/cr6DZCTCT+v6avxVYgKQPF3P1fHAREVroltDj+JPWcR
         Rrz2ol7e7zdDcJGEEJe1LKpcg/jZUsxt8owjNaN31J2PanxwMS43usRsTmUcBQFkLv3h
         i3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893554; x=1751498354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FWnE5Bow2uoaZcwISvBgq/4l5cKqkAoia4t69mDLc0=;
        b=bGEMRzxKqOHuPdwmFfEoE9KwvdUk9N7A/Xp+r2MtH00IlSoNBdE4PEth8YWN7ZoTBL
         7lqvAACh9TILHKgLqlpYqfLm0YN3v4O+/ad/tthwdcwsmVEzR13dFdS4fsjv11Gn0IWZ
         33TU2wuPg5VhOtWCddON0uygnIh3CkusLKUrBAjbXXobnike0hZiJZsDbUFZhTyuCqwR
         aTfwqU99sipZ+wT3LOxGc4LUGB5UticO5NUsnkICKHaezr4BoLPUNO8swOa5/w4DE0lT
         rjCtWxoWeMeDvkjZb+y4OtKwNAowhuDhc+RkC5jiP/dMPZ1tASILq7lvsa236XbhoPyo
         M4Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUqMt2IZ8dkuWW9tpEGzZTVqvsJV6CovWuHX9OKH4y7dG3pJRuiQtc8Ax/yju0RZnos2EZ2IQ0AL0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhi2dNiOO2mEe6sLGSy8VdX+z+kixCu/aL1YjHE6FVPqUsXsR
	IX9P5s0pvogepqZZVCFxOdXF2rDqJ1viN8wFvcFHW6ClRU+Fi8ty8vYt1qXaFFdDi00=
X-Gm-Gg: ASbGncuRQRqUCoCHgS/bvtS9p7FC/AZNHDO8X9brkRYPGcuosRIJ4MRg2oRYGW+VANB
	vRSVy81JVX7bF6eTgKbn1MxcyhT43cXb1+SZ7hYmsAG1gBYUuWo4ORylKjKf3YGs/3DWF5jdiYy
	gX2uOxSVduXOo+K/y/+iWXHwsQbYbRAgTnSjcn/80n8FmGibjTFgpGFbZOWO4YBXQf+XSQ/Uxzb
	sY1C0Ca+dFjcJOzEQF47OqP22BZyDEzW+9aXcnfU6CQbtKumFnXoLFAVBLUvpXKVXxPbDvyLapz
	4FGVNGk5EaQaaKRIc/uuWa+fDTE3rmUzg98e2kRmjBhZv/23P8D48U3ZwB8Q5Zu2hkGYc3Owi5Q
	VZw+nQXsGFFF/vN42ELyybIb9igWwUciSm7OnCXO0yFUMGdJzaI6/
X-Google-Smtp-Source: AGHT+IEYYs2N6RASXojR+QxIpPej80Rm+js0xnYmL5jy1Q+a192E7kIXIViEBMDkie7fGIqIBRd0Pg==
X-Received: by 2002:a05:6902:138b:b0:e81:8305:b8d9 with SMTP id 3f1490d57ef6-e879c092ef1mr2020971276.1.1750893554316;
        Wed, 25 Jun 2025 16:19:14 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:19:13 -0700 (PDT)
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
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 18/32] reboot: call liveupdate_reboot() before kexec
Date: Wed, 25 Jun 2025 23:18:05 +0000
Message-ID: <20250625231838.1897085-19-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
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

