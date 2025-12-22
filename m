Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019930BB96
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390772; cv=none; b=qMrSPSgRaoku8iaLc9P2q9yLzgAxN/VoIL7v07nT8NImAW8b8pL0NcLSp7+xA0BeREHpp+2CHS9/E/2+BASjCMgyA/hk67L9Jho14zhWp6Dd8f61yyyNGwvKhDEFLwyZU6G7vQPhNhPEDiPaengV60cBn7vv/kXm6kxcTiLqXXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390772; c=relaxed/simple;
	bh=7NnfB95d/qjSb47h2oPcevWqYAT/LhhPCnd3bmfXZg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1VdZI3aa6YMJBwfRP8iM6NyglIc8dgRe9J+2KH+RAdaZQPr0BiUjGYCbDno0pBN+C5Pj7ItelPuTNjwVtBO4X7I0L6ahybmdar9czb53QTP7/FNimzcBhm89O6vMuyaSnueDEL5Z+rLIkhDNAAfVqvyj8SPbmRrS8Q6ITDHjCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSrINbub; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSrINbub"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so1944514a91.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 00:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766390770; x=1766995570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2Fdnpcojf4DLWy5W3E6d4c2QXgA2ovsHAVLQ3QTW4Y=;
        b=mSrINbubZ4EP9+SL4tKlClUS93XULf2sXIM0WJ2zFUSIAzOGBS44oddw7CTbr2k4WP
         k9kvA16/hnyr9U1dD0xCS2/jGfJeNI8RKwFgu1hyKirOr5iY60ebR2erE3beb7yQwDmA
         xiek6xvilcAlNpw+9QnWeTiTUfoBsDNSvCmG1duIaz8IUh3sYA5e+gXfu7TWj5xR3qiu
         oHdXgLwpkjBqKxOaHZEQkkoZUxrCmCqme4hWEpDxiqayQCjumKR594bAISf3vOv3GI5F
         +xVGRlzTx+SmPfqShGEMlPNOTIOl1iD9ZZmoU9Dqgtmh7dY6rmkB4gE/HEBAfHNgbvIe
         Cj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766390770; x=1766995570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2Fdnpcojf4DLWy5W3E6d4c2QXgA2ovsHAVLQ3QTW4Y=;
        b=DwBFy5y5yor1NFFdOPIHGcJY0xbwsE8ReJqpP+V1B+Yi+9cCXXhOLb8eFZxn/f9iMA
         ahp0IP1j+Z8kzgPyT5uT0H1R0ixli1kaoMmvLrjLBq1xCOgOzDZX3LxOADYAuy0YBNLG
         oqiIMZYmbiwwY5qd0NE4a3IA5ChBhI1IfRw9u8U5n4MvFjEahfkKscZSalA/4xCpUTYJ
         xJtjwuQmAu4wu64FKUgELUhNy7FjwIXH7zU0i0yx8IVuilvwMaO0pzrgx40oMwH5Sc5S
         mKrZRYEuYuKiHqwhu8QVShkEmaC/CcrtwYV/zhb01AdUXjKWVNurJ/I/Xlq+ABHsOto2
         8Eww==
X-Gm-Message-State: AOJu0Yzi2rHSFJAeyOU2dIlSQGZwYIt8JzoRnQb7a7572M0/Lx4nTqHs
	+pU1sf+niUOM3z0MdK2Bu/YQjoJBike9op3wA0mjkFehslhOtauG/PsM
X-Gm-Gg: AY/fxX5GB5sg2mXunPzZh1FGwqnrrqvh8K8wWQtqQXv9oEZRXkHNLZemXb6/EvfltVh
	CBqJxTf/N3LcwcwJWQeojwAVkRIDMyg5pZJUOkTnIgL2QSKyu++BfRBv7gHcnRqSXbz0c4f7d5j
	Usjne0MXYkAmmzSlG+X9Ciej3fG089JCsm17+aNDbyvHwsXkQ+cYrUFuA6jCFoeNeBiw4yahWsq
	HYipjZ5ECnyIpw3az7fxheDFk+ToJcWRHFm3mQjbTg5cgeYmFBFEDR7+6r3t/Lr+aZUMUk1rHOL
	q6gxx8+YCa/uuX91MRCl/eP0LXUaOscspzuqwAs+D0rSIbxmV9gH/860EP1e/DmXV5bIJt8BdBG
	kjH9g6iaGGSqgIWiMP0yI/IOKYUOaskYOAfbEQcf3tODYK1Ku1iS4uLbsImJbN3i2NQRWV4Ff0z
	+IK+cxxptfO9ehUJXhFiX/c8lKbGOka58iqOFAi14KRDxvYYXYGmdFgb0kbWD9gCTi/T0et26bX
	VAjulKWVhE0mwJEr/4qbK1JMdU6hFHk
X-Google-Smtp-Source: AGHT+IHwhpn/fb7A9/k1WMZFSZ8+UUJV7UQ969ESY5Lf0jsCicVtzq+LBU7c0024woSREPqweY0jpA==
X-Received: by 2002:a17:90a:c106:b0:34c:2f40:c662 with SMTP id 98e67ed59e1d1-34e71e2955bmr11901858a91.14.1766390770383;
        Mon, 22 Dec 2025 00:06:10 -0800 (PST)
Received: from ubuntu-2504-ThinkPad-X9-14-Gen-1.lenovo.com (zz20234032476F6CA7C5.userreverse.dion.ne.jp. [111.108.167.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm5622557a91.6.2025.12.22.00.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:06:09 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	vsankar@lenovo.com
Cc: linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v3 2/2] Documentation: hid: intel-ish-hid: Document PRODUCT_FAMILY firmware matching
Date: Mon, 22 Dec 2025 17:05:12 +0900
Message-ID: <20251222080512.956519-2-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251222080512.956519-1-vishnuocv@gmail.com>
References: <20251222080512.956519-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ISH firmware filename matching rules, including the
new PRODUCT_FAMILY-based patterns and their search order.

This aligns the documentation with the driver behavior and provides
clear guidance for vendors supplying custom ISH firmware.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 Documentation/hid/intel-ish-hid.rst | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/hid/intel-ish-hid.rst b/Documentation/hid/intel-ish-hid.rst
index 2adc174fb576..068a5906b177 100644
--- a/Documentation/hid/intel-ish-hid.rst
+++ b/Documentation/hid/intel-ish-hid.rst
@@ -413,6 +413,10 @@ Vendors who wish to upstream their custom firmware should follow these guideline
 
 - The firmware filename should use one of the following patterns:
 
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_NAME_CRC32}.bin``
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}.bin``
   - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
   - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin``
   - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}.bin``
@@ -420,16 +424,21 @@ Vendors who wish to upstream their custom firmware should follow these guideline
 
 - ``${intel_plat_gen}`` indicates the Intel platform generation (e.g., ``lnlm`` for Lunar Lake) and must not exceed 8 characters in length.
 - ``${SYS_VENDOR_CRC32}`` is the CRC32 checksum of the ``sys_vendor`` value from the DMI field ``DMI_SYS_VENDOR``.
+- ``${PRODUCT_FAMILY_CRC32}`` is the CRC32 checksum of the ``product_family`` value from the DMI field ``DMI_PRODUCT_FAMILY``.
 - ``${PRODUCT_NAME_CRC32}`` is the CRC32 checksum of the ``product_name`` value from the DMI field ``DMI_PRODUCT_NAME``.
 - ``${PRODUCT_SKU_CRC32}`` is the CRC32 checksum of the ``product_sku`` value from the DMI field ``DMI_PRODUCT_SKU``.
 
 During system boot, the ISH Linux driver will attempt to load the firmware in the following order, prioritizing custom firmware with more precise matching patterns:
 
-1. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
-2. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin``
-3. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}.bin``
-4. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}.bin``
-5. ``intel/ish/ish_${intel_plat_gen}.bin``
+1. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+2. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+3. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_${PRODUCT_NAME_CRC32}.bin``
+4. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}.bin``
+5. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+6. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+7. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}.bin``
+8. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}.bin``
+9. ``intel/ish/ish_${intel_plat_gen}.bin``
 
 The driver will load the first matching firmware and skip the rest. If no matching firmware is found, it will proceed to the next pattern in the specified order. If all searches fail, the default Intel firmware, listed last in the order above, will be loaded.
 
-- 
2.51.0

