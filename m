Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89263DA7CA
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779110632; cv=pass; b=fRcC6LWG55UKjLq7ZozhIZU4Qc0ykRnNXgAxCAYwNaSaFyYFYEcpv1B1BiVC2erB5PN+jHXdt46YeTNEHG3AbdJGiF4TwV54NaDrcaOvXcr583hmFOeBA1CJ9N6Kdu+P3PY8hQ4MGjsqmHzTRHt1AE8jtrF9DTz+66kK2bwMPoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779110632; c=relaxed/simple;
	bh=r8uqepWtcWCbo3g8XZJgo8dJTIh+Bn53roFrsh/VdHg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FPrw0+qHPOZIelIGi2x7/xfX0e/ixEBXKu9HYjQ9iI5jgdJAvSDxz0c4Auq1e7gOTsd3h0m1xkcNRYb6e7rsUtj8qkuLEC/ZM/stUnScGLIT9R/5ZYSWTB+V7VOSBPx4EiKtm9Zrs1jxHr9o7gqzlfKli1ZUFvXZqQY4fbWlJas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=IAgMEVnM; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="IAgMEVnM"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8fbe18b1dso3680611e87.2
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 06:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779110629; cv=none;
        d=google.com; s=arc-20240605;
        b=Xo4rKWjsBQi2vgDGZcSKDXMBU81GrjwOIWcL+Jm624e2Y/Lt/l8DUS/QRoCoD70Zbd
         N3ewg0PCthgRlFfWtd1wjr7gh/OR+RJNa7LfuJDUnPhJ/SCwabgSuJRbhdtQLC8O2BNV
         Zbq0zTiq9WfWqOPdBfux+TUd4F7SIEuNvOsBbaNgizI1KcBZkAvC8pAyj6Jna+wF4Qgt
         685LYFdDw5UmFksToq4GA/BAaBG5jgq8tDwYrw2Sl4G22PH3vnvc0QuYiddKEE4cI7po
         PYCnDpyoHGuKG8GmmSp/7tBlGOhT5fe6iCBwd1kiAMt44kMk/oHvUYUJGi29zbnnF0z8
         hiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=iqfmEHThWndcoL8uij8sV8NK0VPjWDK3IFq607zTzh4=;
        fh=IpbmdQ26CrDeUwHduon6vXWSGTyFMB5wZT9yQQYljMA=;
        b=deIrdXmZAb7iHxNVxMqyvqlq0HxIIvz1id0Wczcz1ydvhvbTide7NwZebbXgbwQLxl
         GlZJfLUIfU2qVtG2BCWu3iTJWbuCOAGqfOyHL1Nhu7FftSz9Y93Ul97+PdB+66ySgZfH
         R1y8iZM8W5fCE1FEimX9a+8dnU/VNkHlVrc7j8p4IkMucXlueplA1VK/hVLsjCDEfMeK
         m2MyCBK2a3whA9Lur8zdHyiHqNy3Zbbpd0IksxczcNG8IAm9wjhxuYWNUl9UIDMs2tog
         7bav3TQJw7uHUUuryTfDZlihU5GtDriaOvk3yVhijDeFznvG6/Ik2yGfmuGJFOK/y2zG
         G1Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1779110629; x=1779715429; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iqfmEHThWndcoL8uij8sV8NK0VPjWDK3IFq607zTzh4=;
        b=IAgMEVnMi1RJzReH/uLaU/G976gdfc3xFwpfpAmbKgbyWMG5nI02yfsLgVE/4ywLs+
         3KGu1Q5e2IEhaTWv4dTnDC2MefgpN5wjGvAtqe3Hu89gz2XfwT+Cz9KAKs01a/RO6YJ3
         jvVYguNthWc+c9ZajHgIA99LWNm4OaaONII6liMlgLx2DhgJR/9BbsnRbf4L/VPIGeWk
         7Mpo76+ZG7DMku1KY8zHrtwCYUW+EQMJ9HHE8DTW5yFlygCUDubK9nplOVOUY6XSQaXh
         Y45cKEtGT8NMemCYTxVBzNHkpTV7dpRKRpSRNvU03evGIX4BrLKUfhWHPZB0186od+vf
         Q7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779110629; x=1779715429;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqfmEHThWndcoL8uij8sV8NK0VPjWDK3IFq607zTzh4=;
        b=sfosd7vJlrFcP1WCYcA3uCtSnEcxLrc33Tm82ZsPIjXmPkl7GEkep1FAVd4rtnMkLm
         cexUHAvNYdLmbJLCC1LAEVsCYsZ2a3I7pehzMx7N/YaXjCFlJBjdz5T5ZtRbUmgN3t7q
         g7OvhGJJ4yKzNXPGlBpBIJFlw7FapgwxjARuxknqPWHyrLq8GxpivmOgpU2ZP1k3SYGl
         ReI5OZRmMls0ePiG3I8U/GeKng8dyAeD5WyxoUjRb13jAonItEMvGCdhfwY9kKhLq+fo
         Aqf1ExtQEZA4xrlrJt45gzB10icjidGImFcjJVknRmbMuOb5clpe9L92ozHsHWpN3Cd6
         ZGYw==
X-Forwarded-Encrypted: i=1; AFNElJ9I8C15pSZxCgh+2z0bu7Pn13HTM9zS+nefXCAxpmXQQO705Z2FgR/t0G3R3Lib+R2IuBxfcgV8wPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbH0dBwlJ4EXYV/iVGLkwdqKQKG0+PS4pa/aq0UChM/bqUNBsm
	WfX7oHEgXM8CIITGNbjoDmLnCQXT+gI8uHIDeoXqPfOQuSBoVNvcY+rM1uRgIpbhLkTCv1/gpLK
	zfnrBOn94ASfdtmV3Ia73sd8lNfz7tvTts0WIM0je
X-Gm-Gg: Acq92OGVF7CRnJ1eigUSl9CN9TObwFjEXaKtvSsYur8YLIX8RJvrdB1wcvMZEWYrgsX
	ghlVmEH7A1UFw9A6ni5vrO3NiNrk3+t8OqppNj81Pf0SqwS4zJVgJx6K/dg1ZcPj4Y/gRCdkFZD
	+XbsUxScVJmA0GehOR3BSQVw3nfCjazy198h5Z+8qC/vdAXQfMyBsjffWl0gBgRwbR2jWHnK/SV
	OenqcUKieA0XC9GEyctE8hE8BlYLhZyvgD2NlqReAu5Yk1oGJqZB1u3KS52nREdJ2K8YeNls03Z
	/LEOlRRilz2hTaXy0dM=
X-Received: by 2002:a05:6512:3d04:b0:5a2:b8cf:39ce with SMTP id
 2adb3069b0e04-5aa0e7428damr4225351e87.10.1779110628885; Mon, 18 May 2026
 06:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yury Murashka <yurypm@arista.com>
Date: Mon, 18 May 2026 14:23:36 +0100
X-Gm-Features: AVHnY4JOrJy53gmu77kAh1twBosgSM7U8IAMkHT73ISMbEifpQmD_iNo2Y-2TdY
Message-ID: <CAPzpGcRCTCZtaX1EVaJNZ103THZKsoszZduY7=gwfYdcrMo-SQ@mail.gmail.com>
Subject: [PATCH] PCI/AER: Clear non-fatal errors on AER recovery failure
To: bhelgaas@google.com, mahesh@linux.ibm.com
Cc: oohall@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Yury Murashka <yurypm@arista.com>
Content-Type: text/plain; charset="UTF-8"

pci_aer_clear_nonfatal_status() is not called when AER recovery fails.
If a new AER error is subsequently reported, the AER driver calls
find_source_device() to find the source of the error. It rescans the
whole bus and picks the first device reporting an AER error. Because the
previous error was never cleared, the error is attributed to the wrong
device and AER recovery is started for the wrong device.

Add a kernel boot parameter pci=aer_clear_on_recovery_failure to clear
AER error status even when recovery fails, preventing stale errors from
causing incorrect device identification on subsequent AER events.

Signed-off-by: Yury Murashka <yurypm@arista.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 drivers/pci/pci.c                               |  2 ++
 drivers/pci/pci.h                               |  2 ++
 drivers/pci/pcie/err.c                          | 13 +++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt
b/Documentation/admin-guide/kernel-parameters.txt
index 4d0f545fb..5a9e266f5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5301,6 +5301,11 @@ Kernel parameters
                nomio           [S390] Do not use MIO instructions.
                norid           [S390] ignore the RID field and force use of
                                one PCI domain per PCI function
+               aer_clear_on_recovery_failure
+                               [PCIE] If the PCIEAER kernel config parameter is
+                               enabled, this kernel boot option can be used to
+                               enable AER errors cleanup even if error recovery
+                               failed.
                notph           [PCIE] If the PCIE_TPH kernel config parameter
                                is enabled, this kernel boot option can be used
                                to disable PCIe TLP Processing Hints support
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d34266651..701459c62 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6769,6 +6769,8 @@ static int __init pci_setup(char *str)
                                disable_acs_redir_param = str + 18;
                        } else if (!strncmp(str, "config_acs=", 11)) {
                                config_acs_param = str + 11;
+                       } else if (!strncmp(str,
"aer_clear_on_recovery_failure", 29)) {
+                               pci_enable_aer_clear_on_recovery_failure();
                        } else {
                                pr_err("PCI: Unknown option `%s'\n", str);
                        }
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4a14f88e5..093a7c896 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1292,6 +1292,7 @@ int pci_aer_clear_status(struct pci_dev *dev);
 int pci_aer_raw_clear_status(struct pci_dev *dev);
 void pci_save_aer_state(struct pci_dev *dev);
 void pci_restore_aer_state(struct pci_dev *dev);
+void pci_enable_aer_clear_on_recovery_failure(void);
 #else
 static inline void pci_no_aer(void) { }
 static inline void pci_aer_init(struct pci_dev *d) { }
@@ -1301,6 +1302,7 @@ static inline int pci_aer_clear_status(struct
pci_dev *dev) { return -EINVAL; }
 static inline int pci_aer_raw_clear_status(struct pci_dev *dev) {
return -EINVAL; }
 static inline void pci_save_aer_state(struct pci_dev *dev) { }
 static inline void pci_restore_aer_state(struct pci_dev *dev) { }
+static inline void pci_enable_aer_clear_on_recovery_failure(void) { }
 #endif

 #ifdef CONFIG_ACPI
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index bebe4bc11..29d655a34 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -21,6 +21,13 @@
 #include "portdrv.h"
 #include "../pci.h"

+static int enable_aer_clear_on_recovery_failure;
+
+void pci_enable_aer_clear_on_recovery_failure(void)
+{
+       enable_aer_clear_on_recovery_failure = 1;
+}
+
 static pci_ers_result_t merge_result(enum pci_ers_result orig,
                                  enum pci_ers_result new)
 {
@@ -289,6 +296,12 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
        return status;

 failed:
+       if (enable_aer_clear_on_recovery_failure &&
+           (host->native_aer || pcie_ports_native)) {
+               pcie_clear_device_status(dev);
+               pci_aer_clear_nonfatal_status(dev);
+       }
+
        pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);

        pci_walk_bridge(bridge, report_perm_failure_detected, NULL);
--
2.51.0
