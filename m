Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09E24E019
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741789880; cv=none; b=NiziOrFTcDqOwO8OpILpeTHBB9Y+r28XxqcOFuPghdgKwLxlbzGDtIw5m0JSyI2UdUrN8oeKmlbrwbCbadAc//yQbQYQNsoyQr0EKKd/1+IHjC5YBDxalqAYmi2E6Z2mej3i6jN6sWzan35DxtBPYQnP6aLzSo7eWGZuwD9gIbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741789880; c=relaxed/simple;
	bh=K1NuAEngcPclmCzbSgtaq+RrDGOZqTUJu3ZdtBcGZ2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BePiCuQReLzfHCCAhi1zWSt2Lg7BzCcw0eChPMkAybhJuXYEm+sMntjimpzeXYH0lk4LLNAbyi+KZe4tI0+ZeAM/fQoid6vJ6ud8KRXcq8AP4oOPUPQJ86iaYAsT5m/yExMXPmwjlTGGlF9RxiqSbUW6mF16w+Hn1ym0zJf7TV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jwx+kk77; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jwx+kk77"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22334203781so18062955ad.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741789878; x=1742394678; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wHVeTdcbD/lMPZ+7RVnSVzW4Yy+8n9avYr5uzJiRKg=;
        b=jwx+kk77FolmhrTxmZxn/WcsnAr+FgFEGtF4C6eZqAN1rfsUeSCRmOkxmBxEYF0p5C
         yMmAryUn5rYQNQ0Q/O6HyTbE8WEwIs80vB3Mei2QCnZQ/vSvw+B8/RyqjRDBwgj0jAij
         QgHPpGQdjEDVlo7xy81bdMv9cQ8nRD847+lC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789878; x=1742394678;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wHVeTdcbD/lMPZ+7RVnSVzW4Yy+8n9avYr5uzJiRKg=;
        b=l6wvfE1tDJ9SfFhoo382XEPNXrYlyRJxpPWfb461REL5p/CJpvgghFe/y23VqmUP+3
         u2KR5X3u394haD70mrgt9jMn8D4HFHBxwWOGfj6WrB69qoPlOkvMw0QAA53vq0e7NrcY
         cPmF3Qo7s5LVxda6OFB/qfRUys2+WrB4kuJDhXVwr7921GjrEjpTENx9z7S7n3tGThuq
         JjWEjkeBwRQfMmv3S118Cvy7cZ1kBHyQM+o36l/mN3qMiAUxKF7AykRf2FLdtGsFjwIi
         BqmIC/L7Xgs5nhVhFginUf7SgJvvmqnVx4sRWdx4dPQ4SEgNdEGIXugqmgcsTecs2xl/
         nc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAkg5FBYU5dY1XcS2eKWrTwOGYgwme/BSe6Sm9rrLwQrnEdZNxC0zXvUGAZT88Foty6DeICAy1+ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKcPHdejK64LVf+BBfQAmH2/sx4ewb1hkUOc9TkbWwLso23FWp
	UIWUsHO9C1ghRrYKpk7drEA9vTcC5/1BIvAm2peiG0r2ydX7nZo5jYaapJ9AMw==
X-Gm-Gg: ASbGncsYNIxpdC39LG2YVk4r7nnbeG63ciWeYuh4yYzlh8kkDl+kGwg7Ge6zh3xacZ2
	YPtBn2nQDYpy9MkNj0LM/7T3mRy05+Y+WHfDC14jVG1GOG/2+x1ES0BU63fBzZL0SxQIthGPVc4
	Tmxz10IdoPzkZlIVeDgdJtOdSBZMWJ448rb/68dhshUPsb0peCBAeaKukZoqIwHStuLcM2gMfcF
	UOpG3Dv594CDYgrSyBFL8KUZUZnfXNtGFsEDM0dKORw8//vTc2EeOwkVJf3nTlqCIBrq2eNRb9w
	nwd/z1P0aAaQdz+SFgc3TAoyxxC77rdAF6fKQWA8S+DiUoXvKnyjMIJxaXfITbKr9bIxM6SUQP0
	9WJS/kQyKk+UbgpNhixQUUYXh
X-Google-Smtp-Source: AGHT+IGso4VXNf4LaA6gyp5gDGaLztOCm9ys3zkim+c3BRQl8gd7egffGxKYj+WJgPgAHh1RMcUppg==
X-Received: by 2002:aa7:8449:0:b0:736:b400:b58f with SMTP id d2e1a72fcca58-736ec417889mr10251381b3a.0.1741789877798;
        Wed, 12 Mar 2025 07:31:17 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:ea1:ba82:2605:7d4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736af3a69b2sm10408708b3a.6.2025.03.12.07.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 07:31:17 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Wed, 12 Mar 2025 07:31:16 -0700
Subject: [PATCH v2] Documentation: ocxl.rst: Update consortium site
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-dead_site-v2-1-920a313743ee@chromium.org>
X-B4-Tracking: v=1; b=H4sIALOa0WcC/23MSw7CIBSF4a00dyyGR6XWkfswjUG4LXfQYqAST
 cPexY4d/icn3wYJI2GCS7NBxEyJwlJDHhqw3iwTMnK1QXJ54koI5tC4e6IVGfb6rNpecK0V1P8
 z4kjv3boNtT2lNcTPTmfxW/8pWTDBOvNQFo3q2lFerY9hptd8DHGCoZTyBbJ8ivOlAAAA
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811

Point to post-merger site.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
Changes in v2:
- Update link per feedback
- Update commit message to reflect sureness in corectness
- Link to v1: https://lore.kernel.org/r/20250311-dead_site-v1-1-7ab3cea374f2@chromium.org
---
 Documentation/userspace-api/accelerators/ocxl.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/accelerators/ocxl.rst b/Documentation/userspace-api/accelerators/ocxl.rst
index db7570d5e50d..4e213af70237 100644
--- a/Documentation/userspace-api/accelerators/ocxl.rst
+++ b/Documentation/userspace-api/accelerators/ocxl.rst
@@ -3,8 +3,11 @@ OpenCAPI (Open Coherent Accelerator Processor Interface)
 ========================================================
 
 OpenCAPI is an interface between processors and accelerators. It aims
-at being low-latency and high-bandwidth. The specification is
-developed by the `OpenCAPI Consortium <http://opencapi.org/>`_.
+at being low-latency and high-bandwidth.
+
+The specification was developed by the OpenCAPI Consortium, and is now
+available from the `Compute Express Link Consortium
+<https://computeexpresslink.org/resource/opencapi-specification-archive/>`_.
 
 It allows an accelerator (which could be an FPGA, ASICs, ...) to access
 the host memory coherently, using virtual addresses. An OpenCAPI

---
base-commit: 0b46b049d6eccd947c361018439fcb596e741d7a
change-id: 20250311-dead_site-e96834910663

Best regards,
-- 
Fritz Koenig <frkoenig@chromium.org>

