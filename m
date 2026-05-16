Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879393E4C76
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778949641; cv=none; b=kFsak50WH5gEh7BhBOfUCqKwBT3+spDYaiWNzH9SC+OAKFgyC+t713q7DYsw16QA0FUnq4EDCy9+PIIdF5gUjCpdAJwIHjBH3p3/zcdjtZbEdmBnVh3JJRyBG1ASTGrfuSYnwe2RhSzVlM55SBpbT1l7uFon/fv4wNqiugXGIwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778949641; c=relaxed/simple;
	bh=NK7YqHRs4nyjGwzGqAJDFJyW08ZuhszEYyz6iuH4Xfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6iKjbB30ESUCRG1SnR0Q4nIUyWGsbhxrO72MGH51K73szN401pvj61tEfmkFyNQcooFui9duqcNtcueiPcfYq4CfunBx2979Ruf+pG5gFl0tZ0LogPEab7ph2ZwsSRJEA60T5PAWOrpBLx1uanrLMNCZoMOkT8uK8IwZowLGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnAsEdoN; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnAsEdoN"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-83d31ac4017so367832b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 09:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778949640; x=1779554440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBIdaWnYuc/Npeb6Oh6KMBYaEw3GCxevwGqd6QfClhg=;
        b=hnAsEdoN79VrRJdy8CIrqSiqiGe9eSk/kqUK7711HdP48nEE0pRUqWUlhQ7Zy2x/N/
         cavsCThiwnqQ578QunZxHrPyoOeiqKighjIMtU7aFq3JaH6ENBvk6dWfXUEgnT/jRkcJ
         dLUUBuqH2p6gKLj5INuI116rLawJPwgeOdN/lOPoY97ykcRHZzK2e/751sYaxJe73BiD
         yQx2J1BpfS+yJ4XPQRKK54Q0Js8XRig6RSpX/FXkDHLUcoM4uzCxK5WFs46xtCGV5JGN
         ijWTj8NVSqCt6Vw5ybgKCjcB+ByxEKZPSZ3813FJPolndS7j+mFfQ2bgXRq1HQSRA1EN
         kHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778949640; x=1779554440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eBIdaWnYuc/Npeb6Oh6KMBYaEw3GCxevwGqd6QfClhg=;
        b=iZqDv37lTngBB/0cJurU9EeJ9O085KTdszeyoieQZykxRIfuti6OWplh52sdy5Y+jb
         ueDMX+VpXZrr5KfZxz6b+u2b6RjlAeCvPfa7qGDJvsmiToU+nzAY+mlgWnrQFqChsNDk
         UIgT5kLDGthITRTtLTpQIWiU2rQtSckJvRd/UHVlGeWx1Zbar8mcej0jJNhNStmFQX4T
         h+BaM/Vj/V1CYMZM8v1amUmZEOF1cRVBqhI1BQAouVTfvPhWi/CmWd1fGyijV0BtkSHv
         5gpkrk/j0FLJfC3ZnydElJaUkubql5vmwmQj/SUjYN3E1CV5M2GhbyGiQX1vCVzaIVoc
         88Wg==
X-Forwarded-Encrypted: i=1; AFNElJ9hcQVniVO6IHVychvuv+3vocgJqQR4GX+lx/ow6ct62e1YnAPjbNCaIOqfbfqAu+4SB6t5BTExf9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUl7pU0ZBAzGjH9nhNAzrMEeIVYeg1Kk0Mgjr18buCIItgYft
	NrLB4qj1/G8WYKrlHhb8dex4Xf9HFywgF+R7+N1iU4wcLirBLJSoQEU0
X-Gm-Gg: Acq92OEu2us+fPkd/dGOERcV/BWJC/+DGXd0HqBBks+J85CuaZ4WZvQfvfUUjuPMqMj
	Jr6/wEQfzT//ZGeuwS8grZc7kaFMs6oSfd3JiFjA8BPUyeaElf2Mslezx9XLOrG683DjJ9njfoE
	rZcRGTiGrEwDcJm7f1Bfl90NwKIib05f0eROutb01jqby1bA/G94VIEtzxWko6hkZcO4xvhmvQw
	r6fDgex274/nw/+LjbVb4dJokG+sbCcxxqALDbXqcXST8HJX7GIJXtg0xQMbyI7qaRqhaszDZ/S
	Y+LjNL1ZZketH4tpmdiY2slKpRuQUzG9hcWj0CRuDbNpw6PJJBKaEHm7p4JkYvcyu8yQU13JugR
	xSk3P5IWEvOVI+XxG1ycCbX9IUnfz56z/PqqSP540NxTm1f3w3jtBnIaJ53XrXYfN2iy1LeQFk3
	X/jQnFqa8QweEHVfO50f0WBKAOj/fwhd13csP/kIBd5pFwyCVMBrB/QAGQjE6p1W7GRA7phUpWA
	bD/t8/22i4Vnzyb/aiGJM9ApD0VbNghDUTwGBHSF9R5S2alQr4PTDnhQB2euug=
X-Received: by 2002:a05:6a00:18a9:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-83f33d227c0mr8861050b3a.21.1778949639761;
        Sat, 16 May 2026 09:40:39 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-184-71.dynamic-ip.hinet.net. [1.170.184.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm9105162b3a.43.2026.05.16.09.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:40:38 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH v2] Documentation: hwmon: lm75: document sysfs interface
Date: Sun, 17 May 2026 00:40:19 +0800
Message-ID: <20260516164022.1792-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516160823.1461-1-eric039eric@gmail.com>
References: <20260516160823.1461-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the sysfs attributes supported by the lm75 driver.

The driver exposes temp1_input, temp1_max, temp1_max_hyst, and the
standard update_interval attribute. Some chips also expose temp1_alarm,
and temp1_label is available if a label is provided for the device.

Add a sysfs-Interface section to Documentation/hwmon/lm75.rst to
describe the supported attributes and clarify that temp1_alarm,
temp1_label, and the write permissions of update_interval depend on the
chip.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/lm75.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 4269da04508e..fa8ddcaa0c2b 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -181,3 +181,28 @@ is supported by this driver, other specific enhancements are not.
 
 The LM77 is not supported, contrary to what we pretended for a long time.
 Both chips are simply not compatible, value encoding differs.
+
+sysfs-Interface
+---------------
+
+================ ============================================
+temp1_input      temperature input
+temp1_max        maximum temperature
+temp1_max_hyst   maximum temperature hysteresis
+================ ============================================
+
+If a label is provided for the device, the following attribute is also
+available:
+
+================ ============================================
+temp1_label      temperature channel label
+================ ============================================
+
+If supported by the chip, the following attribute is also available:
+
+================ ============================================
+temp1_alarm      temperature alarm
+================ ============================================
+
+The standard update_interval attribute is also supported. Its write
+permissions depend on the chip.
-- 
2.53.0

