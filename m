Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F3527E1A0
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321545; cv=none; b=pZrfKmUS23JZXAKKgtjpeW4Z/TnkQLqVvpPJuzjiVLPpfhxFU+Th5OrE9OkysJ40RCdABAbPvKIKn3FHT0WtPF/6+8Df985gGUqPZjKK9tyteOUMegkZNRJ0Nge/Gmgnnxp4KpJlRDWP3gQ1u4TMXyVshMb3toVWt8l216xUCiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321545; c=relaxed/simple;
	bh=wGYGREPgrxi6WuzAXr5LbOApUa1Ex4cOowBsxUMIXVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFUq8PfGRXnuzF2PBjqF6iIScpxpJmZUbFyVP2jP4ZGm9WC0UW1SpEbt4ugW3dpXsEtQ4FsZlFOQCme3Dvt33ZbwIdypYAwRczJt/uONrMzNO2/rO2kH2pVu5OOxzU2xo25sKGk2+tX7SfxMUrMNDD2Xnce1NkOaDbt8tzOLfTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IamtvFXD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IamtvFXD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edb40f357so37460625e9.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 04:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321542; x=1745926342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DfqYDfj9raOo/s9JE1ASnrO01HBkLknRT/HL1x4c2o=;
        b=IamtvFXD+wdFthUWDRSiliOjHGYC9PqLspv1fhcZRRAKqJK0k8LBjTQFzAphR+ACBz
         ghvZ/VMaWs860Quxp9rJ788LLoTyCZPufq1d8GnnTjt12rkB4IVKOTtxCZjObU3BBHM6
         XsuW013G09Tcmtd+nLAEgApcDnr9QyYV0DvQKZhL5eSjS+g5iEwbwI3d9mqOPVgED3aj
         o4BoGoilravyQDy4tE6TWWwXdOPgiks6LajKBypxz8kPxZAA+w7NMJd5lRwuYdsjShgS
         4Ue+cf+8Ye3nrnBzfICjvxz1gdJ5u5Z7yU6xb5+tP952NzBlgWDihigpbaeVUjizQuWu
         0KAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321542; x=1745926342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DfqYDfj9raOo/s9JE1ASnrO01HBkLknRT/HL1x4c2o=;
        b=j6CfybP4x2iZUY2maoOzLtEH6gjitpbwqMFJI8IPhn+J4yagz/2bWDhJYs5EXWFTRo
         v1R9PLSm3LuKrtc4wX/xWNLJ50Lv4y6+uLS63D1gCEan8t83kbkeHxGHYoJ8Ve9mRaSr
         FfKL3CQwM9lKWT+Cryn4UvORmdyRMJgLM4CMIgnxnqi7awXizbpjhRa5WnObcHr7uZ2V
         f6HV2ToELxN1TZ3iRkHG6mUirb+wJDQQRLr4Aw5ywEwuxrLEG5+jy1WeV8hl6o3JqVih
         5vPPUMkjV0SdZJfvkRFztCtH+nqyOCpiayIh0v8h3zS7zMiXPp8X0tKn1dAHg3F2OisX
         tR9A==
X-Gm-Message-State: AOJu0YxUyvEtoUAwoWEyNamXo5dE+YU4qyiSe40VmOFe+PX1zzDZtLy+
	icyMaqi4MmFQvC1/Ik4fa8PvnAT95f4fcyAZ9TjRzuCnzu2jZn+L5+3mxNL2cdA=
X-Gm-Gg: ASbGncsLvkvM/aM+Y16zFhArU2fvdi+Akon06yZbJ3fDukXLPQh1DhLhweOwM+plqN8
	P0Cthwunl7IJTojZj5Jei8r0i+ACyaoWuDEVuA+l3kaFrGuQWrUCOh0BD2fOv0f5NWQYdfxQBas
	NzckaKgbvSF71lJPHmy9sXwbRIh4o+yvbnNcsS4xGLm3quZ2DcCGakYj5hkJAJ409SiEqq1TAIV
	j9PMyhfdJsjdEeHXHwVIfw+ITyoDyOyKO8kKvQkaZ90S3pBh6rrUlK0G7wisu9LJzWjSTQoQLNR
	FklW5WU+9jDZ0DP1wiMOB6JlRDUbwNiTFnq7tM4kriTVmfWfBsBY
X-Google-Smtp-Source: AGHT+IHQ0JeqIGFr8hzfLBxr8juIP8XPWd5UgKDKwG2qIdIH6DudpvZkIFykrGXg9swWfTEAHGdAgw==
X-Received: by 2002:a05:600c:1c8f:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-4406ac21897mr105942885e9.33.1745321542268;
        Tue, 22 Apr 2025 04:32:22 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:21 -0700 (PDT)
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
Subject: [RFC][PATCH 08/14] kmemdump: coreimage: add kmsg registration
Date: Tue, 22 Apr 2025 14:31:50 +0300
Message-ID: <20250422113156.575971-9-eugen.hristev@linaro.org>
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

Register log buffer into kmemdump coreimage

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 59630adf5dd2..077b65cae4cb 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -3,6 +3,7 @@
 #include <linux/init.h>
 #include <linux/elfcore.h>
 #include <linux/kmemdump.h>
+#include <linux/kmsg_dump.h>
 #include <linux/utsname.h>
 #include <linux/sched/stat.h>
 #include <linux/vmcore_info.h>
@@ -71,6 +72,8 @@ void register_coreinfo(void)
 			  sizeof(cpumask_t));
 	kmemdump_register("jiffies", (void *)&jiffies_64,
 			  sizeof(jiffies_64));
+
+	kmsg_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0

