Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C459280CD0
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321552; cv=none; b=eoJthnG3s1FE9z1nliTV7b2aRkhMM7Reu3tL/hcvXmklDkj8ps9Ay2MU7Ya030clI4L1E98+va1tj5sKjQ1J1Y9XFMV20lmFbE8K8LL+5gp8Oa56o2ZDzWAAQZFXFE/TF0wIglx/BNfcRig2T5WKgII4EA1GkoF/jxihVSUIgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321552; c=relaxed/simple;
	bh=ZFDuP50cM3MaZ7k24hjB0hKAUp2z1/JdcCExNP+BxkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h68sK779L4/GvYm3VbtiN/3uAxdz0VOrqdKClPsFpgaWO9I/PFJSv5qBPMYuMjAc2Hsv/K/BdYsfFk5oP2BIVnyKtwG2VuFE2v838k/QN35ExJqvqSFNuoMyDodPnpbXENHAgbKkSe31lK+0OD2ctFVR7rqcFPFGVWCwXZ5roNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mlPpLfVC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mlPpLfVC"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4014676f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 04:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321548; x=1745926348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWRwjTKda8Cr+xTaLfEjNwhn6lD2r3hsck/mBkqRC78=;
        b=mlPpLfVCiSlJjJ57uNkNvxe1RSlCRtZ3r1wXGH8e8b5QSUtIWkZsm6cruZ9pY+ZenM
         dBDL6VLPhizQxaqxNMi5rkOVpuizigdsm9YyIKM8adB9tELEz9M2/E2oPZAaaWKTnuXO
         qmC+QLStMbC2JuCvk6nRiJcXalao3i47qxlH0YIkGj3NnhhVlJsq5tdQj6mH0KPnIJPj
         dtU7B0dvfYkCrvOVW85SKnFukUBDg4bSqtxN4cwTJp9CGvZp5gAzjK/hPU7dI7WyZnxU
         d2ry5zadgGRGbZTI+DVHEde/VzbnkvM/La/YDvktVsQszqR1+coYS06wlrSSyPe21htK
         IWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321548; x=1745926348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWRwjTKda8Cr+xTaLfEjNwhn6lD2r3hsck/mBkqRC78=;
        b=Su+SJdzDQUO7l59giDuzOZEFzguZsikAMk8ruvJm9TbBEtPy0QDKvL65m6ezhlnKCo
         6LAYDXj2HZbHthzjXFk2djZjNVljfaGbTKFqpyxRot+cwDVZKuSaVS9BfanriXdOXCYc
         wyudbspjQB6fwtqVd0ED4YM4STjPjhiE6RZWfepLcLgVKvkUQALChPqG1jESKKtCLDiu
         1/py3aoEVotLip5bShFKfGOi8TimBR7SB0aWTcShhYIkUmMxlb+pwwOz5yMKHCoMeViP
         0jX4w2wM30PCwcdJ8db7WHS0nED2yFHHi6/TR0P4GFSqbcrbvdsoTRR1gFrtIixOBvYU
         8iww==
X-Gm-Message-State: AOJu0YxsapNFuLgZU/cQGrlSGhOo0ALSbBn9jNbdobVuDGX3Q9puetmH
	qaQMaYzIRfEz0lsQtbv7QwdvKxzWNNkcWhY9W0KuLRySvdGxPRIf01zdm33jjf0=
X-Gm-Gg: ASbGncuE13t5V1b8MFiTm/gw+FkeabpIqeLM+zA5oeHstPR7tOt2rJPRL88pHGenJ2+
	69geD+Nd8WjxT/n++ej+hKl61YhUrgTfOvgbGe1IF9EYiCanOQRoQf/5kILn65UKfaYNTO9MBV9
	cNwNqItg9LFenKRJDiNR0HbXZaMiHfErub5rIPbBWhdSkiFL7VNv29cjWSeB00hQ2x+z8jf/RNT
	c73zmtH5naNUKcE55VHw0XMUXw93Mys3kxKFkRWWOjiBbPGQB57rss+CrYdXy2VdFB432BJWWpg
	4t5q7kDh/Iiy8OHSFvpkvgc2ExVatR6zhpd5fj7tSudt1rygNgHQ
X-Google-Smtp-Source: AGHT+IEEw44a5vK2IjFWiYA0X0j2siN1vTRb5HOMU7dDGydhv1gxPnFyAxYzd0KC7UUWKC3HvgVANQ==
X-Received: by 2002:a05:6000:4304:b0:39d:724f:a8c1 with SMTP id ffacd0b85a97d-39efbb020a9mr11656442f8f.47.1745321548490;
        Tue, 22 Apr 2025 04:32:28 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:28 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 12/14] kmemdump: coreimage: add panic registration
Date: Tue, 22 Apr 2025 14:31:54 +0300
Message-ID: <20250422113156.575971-13-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call panic registration for the core image.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 2144edcc6157..7f3b089b5739 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -5,6 +5,7 @@
 #include <linux/irqnr.h>
 #include <linux/kmemdump.h>
 #include <linux/kmsg_dump.h>
+#include <linux/panic.h>
 #include <linux/utsname.h>
 #include <linux/sched/stat.h>
 #include <linux/vmcore_info.h>
@@ -76,6 +77,7 @@ void register_coreinfo(void)
 
 	kmsg_kmemdump_register();
 	irq_kmemdump_register();
+	panic_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0

