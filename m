Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EDB1A6801
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773568343; cv=none; b=oWVEi6vOibcmXqB01tvPgHQRnP5F7qPUpWC+XVMkdt0rHHe1PYBa7K17euLejEszhbnqvrmJPJMLmL+LmehYXn2ZS9b+4YQa9UsfYGOHr7rxTDoeiLsXwcCw56frKyyWuG+tSjDVNYR3jLwPCiWYAOAvVrLAbwjjy98gaepUins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773568343; c=relaxed/simple;
	bh=SvjxCtk2sNkffztjuWxqJK8HTp2fxoNcz3jrSjLyvlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlgP4Ixv6osuVxMmD7Or0YPfze86xXPw4tbUF6QcSEOYuN/BCNEAOcufaLDCUM7AFzdXc62Wt6B06/jXufRpeAS/SS7hqJZreXpZJ1p5+IAqadqwRhDPHJo+qGcY50hhw5YuJ6q+SBOZH5dCgoHZEZRjJ6V5i/yJaggkCQDmPCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGsweh8u; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGsweh8u"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824c9da9928so2370359b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773568341; x=1774173141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CuiN5qUYsHdCDRty33DpZCZLy0K2whSknQ9r4O2yTOI=;
        b=RGsweh8uqCXvi7cf+T5WXSk1aie9LPlW584SY/iqxrhciI5zDL5LZKnxezm7NbrZ9S
         DNEIoAFZmP0zF3M6pf0rTq3sarw+I3Xzybx9ezd6IGtdMWvTGb0ZCqgReCPrZSoXhMWk
         wzJEpKNU4CBfKq0qc/cN7Ui1zxsPV7SFWhSJG4RCWK6Ft/NwSsPdX74bQll9ScRYztH7
         Ni6kHMCZaUv0Ua1dSxhlUuhD8yutCpHs4Goz/HI7fFDIdeiaeylV6hQ24aFlJjvygETx
         co1qHVNYYcrfvxlJ16RayiG/shQ9gawuTU7WRE5efTm09K6LGljJl7U3hgheI2yXnVCG
         c94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773568341; x=1774173141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuiN5qUYsHdCDRty33DpZCZLy0K2whSknQ9r4O2yTOI=;
        b=cqTd2uCRzTwrP1m8w6BoPJrpN28i0/4R0R2iWJlJEfVM1XEAOYAIyueTq+PKuL+s1b
         fND4EkA4od1E2UhhDeoV4I0QTv3ZJfIm2yfLVJGDZpl5Vxeb3IJIJhCJcgM4CT5S6bXg
         UAMTt586NZHy6NYu0dfQxLcxFkV84R5oOlR6CVYhAs38Whyq+m5cQjxeDW/9+AMMYMCf
         b0tQcElMUWko3/lTytGv5K6s4GZxK1vEMjk0zx8t7MBkA7LY6egC/R9gxfkQhO519F+R
         ozrNUeq2jOGUx+/eJAXNnAIMT3P41IYmcqKrlCKPexJ9iPiBERDK32SaxHx4SQotDlsa
         iu6g==
X-Gm-Message-State: AOJu0YzRr3dLrnrOU8UxSKP1cPlTeLbOc1o7uLgo0YIDYMFs8umCQpz2
	RplekbPKFD+3mSPfbKLtikuXotq7GjSxpgR9yTCXjA1BlylHr7wHUh062MuulGIK
X-Gm-Gg: ATEYQzwcPxHx5aCbAtnqDOc00Mp46rdqheHy+TG32doE/+SKaaRtFefZRPIViHI+R8o
	jjueswiKP48tctCMPsaqV4jfAXVfl3sVEzoSs4C6oPu5BvyoLGBZfRA6OWiyWzPsZFXIhcprvbL
	pQbiOaqWjOJ+D/qwOLV1nqcJbU1U9GdOzzbMxPjCFSLxchkxBa6P4JPrRtmEXxsaJQa+s+CL3vw
	uCAbrhdD/3SMZ9WsXRE2R3r8pfclsqt1Lq3NynbTK9c/kedXkzo2zyjCQb6+R/BavxXm5cKp4SR
	paEPvqxciMiKb1rdMVCl1yDIGbKF5KpYXjAMUxOOS2N51fH6GlZB62WN2ZrTesI7GTQBZzQYv8M
	C0vo1MTYpNNZ/nR4SR5gA5IKZVKZhoX5KYC2H9GmulJxO6vcl3+a2iQnhncH25TqpwE8KSagHxh
	dfSlh2DTwB44F3dAgWp7VKRG5SjF7DLaqWFe8=
X-Received: by 2002:a05:6a00:2d2a:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-82a19703b62mr7787865b3a.8.1773568341185;
        Sun, 15 Mar 2026 02:52:21 -0700 (PDT)
Received: from localhost ([220.247.131.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07341986sm10409589b3a.32.2026.03.15.02.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 02:52:20 -0700 (PDT)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] can_ucan_protocol.rst: grammar fix
Date: Sun, 15 Mar 2026 15:52:15 +0600
Message-ID: <20260315095215.47100-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/networking/can_ucan_protocol.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/can_ucan_protocol.rst b/Documentation/networking/can_ucan_protocol.rst
index 935d872ae87c..f366daf37535 100644
--- a/Documentation/networking/can_ucan_protocol.rst
+++ b/Documentation/networking/can_ucan_protocol.rst
@@ -244,7 +244,7 @@ Flow Control
 
 When receiving CAN messages there is no flow control on the USB
 buffer. The driver has to handle inbound message quickly enough to
-avoid drops. I case the device buffer overflow the condition is
+avoid drops. In case the device buffer overflow the condition is
 reported by sending corresponding error frames (see
 :ref:`can_ucan_error_handling`)
 
-- 
2.43.0

