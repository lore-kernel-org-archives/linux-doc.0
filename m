Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B90F2C3252
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772964546; cv=none; b=LKbGVuXVMSJyYpnNDAgyFbmemsylN7ar/acTa6a2LJTHNSNtvF6Fy9IdnDwsFIP50+Bzifl0V8FVCUihLMnTxvA24PBdD0Ooh5earmC1N9Ho9LdBZvKme93p9W2YBTZ8Q9WxLcvHVu6QCLZH4iqb0lLfZn+LltdkOFi+VYQZOdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772964546; c=relaxed/simple;
	bh=0qt2ThSNTWiZmg2rDlobjJhGOvWAhqJsncOokbb+v2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liDLV0yEburTAKhL7rqy6LD1EahOO2Cr7PG9PceJCfSO9xUYUaVl2OFau0F3UEzUA+BsJDfJIH6xMlseG1I9V1uGqQCxCVOcVT8CdkmdcOFbDYseFObkmMfx+HgWiGb+JBapuQMZNHvNMo6X5+ufPDV+YUrJfztt6m+gtpICJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUN9LS5n; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUN9LS5n"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2addb31945aso77321685ad.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 03:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772964545; x=1773569345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgQbVckhgGW8jAzdnaHbqifi/n1uJ4U/1Ga2qYPhdCI=;
        b=cUN9LS5nd3eSdGEsYGpd3gTeSMi4qaAMDFBq5lPU9XxAWlfv+cwB1Et+1w1fUBOlRY
         I2gNwe818Icd3mqFOf0kl3Nme4hX3VAVV8ZBkgUspGt/OAl8ia2XEdIEVmhdgTIBUxns
         /k0XROuYhfaxibFxK4VfA2NvtoGPcHQL2TawphN4tWS5tuPe1mSrlouN7GNBMXhBS6ZQ
         IG6KPN9CRs8TYr6YLuIhS8DOgO+J9RpTlLHYT/WsY0a9OALbvbj8eEi+yAKnXNbvprdB
         QXncLf7hhDrjS7BhD5aeRF7dUnberlkH2cGuqCz+O4aQbUY5jQUCoKssD56A1bYv/mHc
         GYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772964545; x=1773569345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgQbVckhgGW8jAzdnaHbqifi/n1uJ4U/1Ga2qYPhdCI=;
        b=Xtq+NU4p/QsPpfflo0l9zV1F9qJdNBRGKwPh9ZyKDXN0W7GQdNAqpPefc+x4JkmqpV
         a9x85F5mQMTTaET0XvVEs1EozGCF8Kr3r52XR3WzvGfj9/71lB7npobSqWcLdHl3AphZ
         kfd+J3kgY1iL/S6q29UAQlCW3kq98lacBD+rfsxrv+gvJDRROkKjMpkvsXBX0M4FohaB
         Vhu9WZtCl7ZisHK1xUEZftgweGLukAaIK0nIvlVDooeNpX+vZ4iPWRbdjiykWlko/e35
         5Y9YdQQlXPDnZd5xvUAl+I4FSm4G9+AxgbI4pb1XjEixQe8xgi2isw+87w5/RUY4o32M
         m8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHZGs3e0GtFUV/fo1FXXw/UX4V2iQycgRM3lYUAfHLpdI5PzZI9XJ/f26W4ye9i6MPriPpuFQg0Hw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8u8y/rkK9eIjsf8d4IpdX3yh8u4sfojyPteeYMxf9DY8VB8n
	dVZOacbmcILp36nnAQQ8pXywCQadiLKkQeI8nH0ax/waBgUHBM45GXVk
X-Gm-Gg: ATEYQzxfys/oSBCv4Ri+sQqTegnM4NiXD1WFH+GTcuYhvVClUP0XB/Qz4/i5NXDTXWr
	TfykOjCF2jQCyDiIyT6MZeb+muDhuOf+B6Ul9DPabqurU4RKuahV2ARp0uYxF8GuH3l/89miCtM
	twRle7P77Hdwn0i2oB62utEjYCxKW+9YX97L69ePeIB+BtpftxgHrbmV6JeoSsQ470WAjzeZaU0
	bQjh/DyozMhJLog/9JB4ng1mDh82YcvS5RAngg06WWvxelYNjPmP2IKMALKIru9eSaPYHogIAzy
	sGW8of2vWnGv0P6dUjQDYP09XLJbJtOumzjHJIW47wFL8fWPTs0FtG0zguHbmismg1U+vF0pbA8
	WONHwFffkvL/I94vcz+pxOMA1Q2ht9KxifGBRtYR7sUdyMILE4O71vjIfXqQBsod0wBZ2VHUZhU
	ET3nv07dl1/IrG4lEZm/qssCLYArqK4rPaC4JCcvcC
X-Received: by 2002:a17:903:2c04:b0:2ae:4fc2:d951 with SMTP id d9443c01a7336-2ae8243b629mr81098495ad.27.1772964544798;
        Sun, 08 Mar 2026 03:09:04 -0700 (PDT)
Received: from russ.ust.hk (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e58592sm102980485ad.14.2026.03.08.03.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 03:09:04 -0700 (PDT)
From: LIU Haoyang <tttturtleruss@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: LIU Haoyang <tttturtleruss@gmail.com>,
	cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/dev-tools: fix a broken URL in dev-tools/coccinelle.rst
Date: Sun,  8 Mar 2026 18:08:50 +0800
Message-ID: <20260308100851.341-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original supplemental documentation for coccicheck is
https://bottest.wiki.kernel.org/coccicheck, which redirects to a not found page,
thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
which adds a suffix to original URL to make it direct to the right page.

Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
---
 Documentation/dev-tools/coccinelle.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 2b942e3c8049..f73ccf5397f3 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -61,7 +61,7 @@ Supplemental documentation
 
 For supplemental documentation refer to the wiki:
 
-https://bottest.wiki.kernel.org/coccicheck
+https://bottest.wiki.kernel.org/coccicheck.html
 
 The wiki documentation always refers to the linux-next version of the script.
 
-- 
2.53.0

