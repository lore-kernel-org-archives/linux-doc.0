Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C84B1E45
	for <linux-doc@vger.kernel.org>; Sat, 17 May 2025 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747470824; cv=none; b=Ga9zUVhfQrHB4SIBguKMxkNY6krz8dMGnw5J49PEN6tG/p2SnzsUGgxk5tC2y46nyFdgcubdfRqvSKhLczEy0DnSuzZvE2xRMk+caLXDpjh9bKAjMjYrDUlR7tee0Kznj8iWWmpetr3doku4F4cRjrnETUC1kxf3MMhyxddVglc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747470824; c=relaxed/simple;
	bh=qgtA86Yosv2NneSBCP+iV6OsZBRXdb4OvstnimqrWXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9+XpAtbTJ2OILbknvPc8gZ5Pc6V8Ttz7wsN0i+e6AyedDNNGQDTLNMN9KlBMUA9qeearWxqlUQiiHGUVoHIS5sxJlYwSZhR7iJN1Ao5fAP+0lM59F9GDO206LIyF7Jwj1PLoFjNn+pv2JIfaCZxBM9jxyWy7gZbksDpqL4Qmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6Ov4sdH; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6Ov4sdH"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7427a4def77so3326713b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 17 May 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747470822; x=1748075622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=46W3U69RgmnXuEh9Y5vUZYFbM1wVfN7RR1Zl3hEWpoU=;
        b=V6Ov4sdHGtu4p1A+qqEl30ZWk8o84wAQPJyVuySToZDa2iaB3TbRBNV9nl/Q2K4pPM
         5kWk/nE6eQTTruUZUX5VOTYgJouHCIN4McBzbrBXUegnSw9yeBHOFVJ9Q4DKOnjDbxbr
         k/OFO8RzYqW4o4uoFnompHsMdLe4BBwxFmyBNyTspHDvY6PWffVwjWM2NFLg6g89M4xo
         DwV3Q+9ZwH3uFq6yOwGeKHtRvp7Ubg+Ot2BobAkIVfIGS4eFBWvqNGzszWvMFoUquzaD
         +7KWDfci3MgApBQK20TL164acjL62iUout0UEYoTm3clg8A/MPthG0r/mOhwSoqmh21t
         BEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747470822; x=1748075622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46W3U69RgmnXuEh9Y5vUZYFbM1wVfN7RR1Zl3hEWpoU=;
        b=qQFfV0BdU3ixJROCRjySUqUWuQoZgvhXQtDW6MVIy9aqT/I5waLjfTWojJA7kIB5GY
         dF8zKq7voc0iIrNLJmdNVpnYx9TG4NTMTNC9DG/ICG4861YIb5PQhFYVeY+m1Jh0jxSh
         6sxP8n+XXG3BuhnHocdESMl+iPUY4YOO+SxGvLVRf2QWPJBAeiaU130kiGh/uDjt0ckR
         BQjYdB2UdmUgcmmHdG1Wj587jF0h6piE3iaJWJjnRVFIK8PId6yQUFG+2Cx8YHUk98/v
         hcRmZZjgnv1A+DvjqLUXMbQQlHn7hnXTCpfXDkwUuNOF4Ej09e7yeI51owx36Hccccl+
         04IA==
X-Gm-Message-State: AOJu0YwhkbHhy8SYEUDHApbXRgsYVioCFuDo7MTitH5VfVzq/O+zsBVz
	w1ZEq/4cxd1fX9Ne9y2Lwl4WL1U4jSVGYyIaFwbC52+RHXBuPuxS3Z+p
X-Gm-Gg: ASbGncvJKXPBtjcQtrSTsRyXqQZYaUn7GzBcuhFNWAsL0RbjcFyO6FII0GeNdfaeXPj
	bQo4hTX657m1aoH70SrSIyaIfoyN0U1rnugIM68QZFHRhl/LaPxCCZ9LIV+LeCU/66Wtc8BJm+f
	fsHgCkKNr6P/SjZVz9f0J3/eRO9+P/m5xLNvG0J64iGZA6t+8dBO1uEVOoM42/0zQ1Ehp3HuGan
	+aJDDoHLBeEyjw43FvXN3MJ2CYVpmJk47sQseiQ9F4RE3smTGGQRI28T71mOtq8M+MLd46s3Bvu
	OOuBgFr64YxtLznDwO0YahySZp2/nzaVVyZn8ql9x9yYf+/Fe2HbZicwXI4Jwrf2IJzMQxUORHl
	kOr52Bw==
X-Google-Smtp-Source: AGHT+IFTbZ9GzDjQsXxuZOL1wswGi5YMveAdD3xRQe0RmvR3Pc6UARz6iAXGf5wZ1VQWK7V/ciyUiA==
X-Received: by 2002:a05:6a00:9094:b0:736:53f2:87bc with SMTP id d2e1a72fcca58-742acce4f17mr7568603b3a.13.1747470822369;
        Sat, 17 May 2025 01:33:42 -0700 (PDT)
Received: from ak-workspace.tail730999.ts.net ([2406:7400:63:a412:9ce1:c852:2f5a:2714])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829b7csm2734652b3a.119.2025.05.17.01.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 01:33:42 -0700 (PDT)
From: Akshaykumar Gunari <akshaygunari@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	akshaygunari@gmail.com
Subject: [PATCH] docs: hid: Fix typo in intel-thc-hid.rst
Date: Sat, 17 May 2025 14:03:34 +0530
Message-ID: <20250517083334.6766-1-akshaygunari@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected a spelling mistake in Documentation/hid/intel-thc-hid.rst.
Replaced 'triggerred' with 'triggered' and 'flexiblity' with 'flexibility' to
improve documentation clarity.

Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
---
 Documentation/hid/intel-thc-hid.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/intel-thc-hid.rst
index 6c417205ac6a..dc9250787fc5 100644
--- a/Documentation/hid/intel-thc-hid.rst
+++ b/Documentation/hid/intel-thc-hid.rst
@@ -182,7 +182,7 @@ value and use PIO write (by setting SubIP write opcode) to do a write operation.
 
 THC also includes two GPIO pins, one for interrupt and the other for device reset control.
 
-Interrupt line can be configured to either level triggerred or edge triggerred by setting MMIO
+Interrupt line can be configured to either level triggered or edge triggered by setting MMIO
 Control register.
 
 Reset line is controlled by BIOS (or EFI) through ACPI _RST method, driver needs to call this
@@ -302,10 +302,10 @@ waiting for interrupt ready then read out the data from system memory.
 3.3.2 Software DMA channel
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-THC supports a software triggerred RxDMA mode to read the touch data from touch IC. This SW RxDMA
+THC supports a software triggered RxDMA mode to read the touch data from touch IC. This SW RxDMA
 is the 3rd THC RxDMA engine with the similar functionalities as the existing two RxDMAs, the only
-difference is this SW RxDMA is triggerred by software, and RxDMA2 is triggerred by external Touch IC
-interrupt. It gives a flexiblity to software driver to use RxDMA read Touch IC data in any time.
+difference is this SW RxDMA is triggered by software, and RxDMA2 is triggered by external Touch IC
+interrupt. It gives a flexibility to software driver to use RxDMA read Touch IC data in any time.
 
 Before software starts a SW RxDMA, it shall stop the 1st and 2nd RxDMA, clear PRD read/write pointer
 and quiesce the device interrupt (THC_DEVINT_QUIESCE_HW_STS = 1), other operations are the same with
-- 
2.43.0

