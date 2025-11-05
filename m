Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659383043DA
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762347008; cv=none; b=aXAZHLBH+rfqzx1cDTetSzlBANSimCOLvlRKyFj4/sJTJWL97CLoXyNbrZw109GS0MLrQXEGjnKzFOhzNf9Q9DlTnvPASpPdRwDIXUL4QjIC/VbLQxClHIdmY8bZes9NkOeffptTVi2iXZ5OMfJ2LvzO7+f3sx71scrbuXejNP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762347008; c=relaxed/simple;
	bh=xjbGtqKysZbtqE74+mQMu9sHyix0L9a1Ew9b4i4fy/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMyPKclJAdAlYcXO02vIzHunc32tWZc8ueFO3KV9Hua5iYOlnXgAz6NVzViOO5aoqd3NJckZ8okAwpZ1RGIwq717vAnukAhUrA98m/zvD33LI/3G9wthe5GlnGHkRQfln2u4nASFgOJQlJPiz3UzRS1y86ZU09bwkddQibtYzps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1X+ZFtV; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1X+ZFtV"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-4330d78f935so47734875ab.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 04:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762347006; x=1762951806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhsqlGPMhr1QSeWTCatdCXsZNSn01c4d6RBeHfAS3ak=;
        b=A1X+ZFtVdrO38xvENkqFJ9ugMNdrCVsGRCKGB8jXIfoZ4a+YZz7JeLyTsKGPp397/w
         oUeX4luM+dwEkWnccyBvJzlRfd1fMawNBRgM/RUHeJGKDKQRZtC3m02m8p1AdwVvB4M3
         /uNUeaBIIUrpRl+tTiabBsGHie3d8zG3uSxx0Lr36NnatPcx1d75M+Ecaivx7zPNh7a/
         lMEyecbarLI0jtql/zu6mClgf53mUzIGVAUhztdai+PUspAp5HcERu4C6E0WGMPdUKai
         2if+Qe4tQ+O2hEC0ojJ0l/3owWfvDiR5w1cQzRzSyZlFfOoJWGS0EdLn1l47Xy8p1/s1
         /A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762347006; x=1762951806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhsqlGPMhr1QSeWTCatdCXsZNSn01c4d6RBeHfAS3ak=;
        b=IAkbHK7m3T5X/8ntcnuo2ny+zIfmUhSX0Qfd+8eU1887oZ1awaLdqfEngnIPjcSmfK
         /p+/NcA6u/ixOMKNHFIaxTRfquZC7gB57XzP2sjiJ56fesZKIf6Ckn4drhEOxuKQ+Z7b
         uxfOm1P/1UJqqqcLTdQZgr62D7LItAzKKEkjnjtz3S/LN3I2AuYBh2XGDCwD2gtqhDp9
         KaR5kvptHD3v7cayeguVqSivw5mIFyNlAP5TdaavsOAWXNlTUJS7dH2g8huac+DudTYv
         4t0SDtmxE6FskLvSWyzii6mmk3ksAzDT/HuvJgaukpMkdPTTnA93D/ObUWqrCDAeQmPC
         cgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL3E2SgGlK0+ASFd3NCeztZbwWfi/h99l8kBPGd0Zx3ef7hSIwWyY9R1u9PCg7G1UauSpkpVHPjL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQ+eifG+V7/nCoNXkzk/IFj2ax4+qEcZ3GIs16175HCsaS+3R
	3ZJLLvNhI8A89AagnNNtFX5j3/6de5rfKf3fnwrMdxLK5m9CeKdkX5Sf
X-Gm-Gg: ASbGnct4cBzSmEmO1dCPSh4fH3vLffwVMYbuQzEAW4SdhmkM5Sy7paYPvfJF4UEDezd
	IHdB78h9pWgIgX0vnmhIgEhUUMdk/PIjosNGKtoIPE4PRCM1HJwwOpjwINZWDgDYJ41kXjVmfD6
	uA3t3Iyxux/uUyp/xkPAbxL09xgZCJhBH6+qcAbM5BqGOA3qEkGZWJ6JnXBkP19P1kv1mqxKXBd
	9S0msSvySEmCb+2lvNOiqOWSRlmwbRQ9Hnk/7Uk5pb1OEOaKyZgj/WvuTJckqc/bSjuopmK5TaO
	Cx2MxAGGLAwTIR1Y1YfOa0kIM31EiWeJIonV4AvsUWQT0i5Vi0MD26sVYVHHTdN2yDeq8H6koce
	zobSTdRhkmGNgUfspkYBdsr6caoexvN6jn/FLzxOlKGnFMFQlmTlNWljNdga9mCyYool2A/Vbsp
	6qj2ewC4nfL20=
X-Google-Smtp-Source: AGHT+IFUVVrpnWZ1eRQdwOKppyTRc2PEKlhHTvEBTZobu+ZXFbukcXv6clqDiwJYPg1JA4j1lN+v+A==
X-Received: by 2002:a05:6e02:1a2a:b0:42f:8d40:6c4b with SMTP id e9e14a558f8ab-433407a4043mr46552705ab.11.1762347006403;
        Wed, 05 Nov 2025 04:50:06 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43335aafb84sm25233035ab.16.2025.11.05.04.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 04:50:04 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6D5EF420A6A0; Wed, 05 Nov 2025 19:50:02 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-actions@lists.infradead.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: parport-lowlevel: Separate function listing code blocks
Date: Wed,  5 Nov 2025 19:49:47 +0700
Message-ID: <20251105124947.45048-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826; i=bagasdotme@gmail.com; h=from:subject; bh=xjbGtqKysZbtqE74+mQMu9sHyix0L9a1Ew9b4i4fy/c=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJncbjM2XTjjc//cjh6DiqftrN/1X+ftExWde8FyQ+58w bIICQGbjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzk42RGhvsnbpWvFzNV3Xk+ +5jiKe2epHN1fL/19r3Z4D3j5u9PB3QZ/hcZsqtuYnWSOJZYuV5zNad2afDmie5Br99tZHr34sT SadwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Commit be9d0411f1608a ("parport-lowlevel.txt: standardize document
format") reSTify parport interface documentation but forgets to properly
mark function listing code blocks up. As such, these are rendered as
long-running normal paragraph instead.

Fix them by adding missing separator between the code block marker and
the listing.

Fixes: be9d0411f1608a ("parport-lowlevel.txt: standardize document format")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/driver-api/parport-lowlevel.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/driver-api/parport-lowlevel.rst b/Documentation/driver-api/parport-lowlevel.rst
index 0633d70ffda7fa..a907e279f509b4 100644
--- a/Documentation/driver-api/parport-lowlevel.rst
+++ b/Documentation/driver-api/parport-lowlevel.rst
@@ -7,6 +7,7 @@ PARPORT interface documentation
 Described here are the following functions:
 
 Global functions::
+
   parport_register_driver
   parport_unregister_driver
   parport_enumerate
@@ -34,6 +35,7 @@ Global functions::
 Port functions (can be overridden by low-level drivers):
 
   SPP::
+
     port->ops->read_data
     port->ops->write_data
     port->ops->read_status
@@ -46,17 +48,20 @@ Port functions (can be overridden by low-level drivers):
     port->ops->data_reverse
 
   EPP::
+
     port->ops->epp_write_data
     port->ops->epp_read_data
     port->ops->epp_write_addr
     port->ops->epp_read_addr
 
   ECP::
+
     port->ops->ecp_write_data
     port->ops->ecp_read_data
     port->ops->ecp_write_addr
 
   Other::
+
     port->ops->nibble_read_data
     port->ops->byte_read_data
     port->ops->compat_write_data

base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
-- 
An old man doll... just what I always wanted! - Clara

