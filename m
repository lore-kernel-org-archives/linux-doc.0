Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E34335962
	for <linux-doc@vger.kernel.org>; Wed,  9 Jul 2025 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064285; cv=none; b=h7l6ktUaq1SHm6swhnbNRb4HRYazgXPUIpMX9OtBHhC+1uQrqOXk193Smq0a0TpXhzEe4pKd6PopeNp/uEwNIp2t2EwYJSI95Ua8vJjOZNIxt7x6QnGELhYODn8+v1SrobyWbV3KE0ph4PQg6tRzup0WDfKxXxfOaI3Gvg4wWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064285; c=relaxed/simple;
	bh=Ed4Twb2CQqgQw/j9EYSd4UBoWLDImfPhC3bCjXHZGDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f+A/hpu3FBDieOUQyk7ZVPDruWXHwPq5KDE8Vu8gp2zYjEnmU9e95AZOCJlhA/s+G+Oa1410Zt6U0KpkW1KVRjqT/JcavP/64r/yzQJAcqiyuSe5sA6GicE2SP0Ev6ep9eLqTv0x9wuho+YOgrhEdoAT0tqwXHDRPnh/IzkgTcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NupUPD60; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NupUPD60"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-454ac069223so5110465e9.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Jul 2025 05:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752064280; x=1752669080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FxL9ut2GQHQVUIwYpiqJ1CEIQmWXGnBhZS0iGBFnzFw=;
        b=NupUPD60hKQflrmS/NCM+34QfpsoKJ/JkFsJOcvC+mKWOD/1cwYgNpYLspuQaiNKAD
         9ihwacqGTXZFypfuojiiENoB4vMC2syZlTOC9dVlMSiZPhtDHSC6tWe0tm3YdvNyzzkx
         DpkV2QKHhKVYQaLXMRh3ehPyiEUhEvWmt/bOa1FD5exlXBl6KV56Syb1e6k5uHfcpbrD
         MkE4nOlD8ji/k2YHxWoQhSatv5XOiBy3e5VtrFqGBaYa+lzkTG3EJXDAcRFxaWh4bMrg
         k6pefp8mT/319EC/3OudhLf/zTzxGFC4xew8pqW9MoovwNS7FR1SfuJu7PsExbUeY8Ma
         zaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752064280; x=1752669080;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxL9ut2GQHQVUIwYpiqJ1CEIQmWXGnBhZS0iGBFnzFw=;
        b=ZRfRgu6CIuQGtTA6TppW5a0H6rn1T7faSkTQ35gF6Uuz2QqMjTFnZXga+4NYN1DwQm
         CbX+7siyPGLwaFOm7P0qrQnyuU2AfRxEvgER2cl1mIF6U3RrqCgo77sWcOeOLLMPHEVw
         zOu0JpvyRs+ZNch1wDsSZa8AW3r9XIYIRwn4jBlqhiG4r0ElkaSZlxJUOetDhbJO8V1+
         FWQIPHxTo7Fc+2YLgNwXWJMq6PI6MCa1H+nEci/HmM1Eg85VLL36vEvO1KJuRYSJTlH0
         QwNkPOd7V1aoWnORVHEhvn1pX5nfQx5DdPSbl+Fp/Vy30LqqAMPlDExoTRMzchL2nI41
         4rog==
X-Gm-Message-State: AOJu0YwZI/UWx1PmCUiGBxPQDdfkZPwTMXh7gQv5Ji9tjoCqlz+Gv9Ka
	n9myMagWIAa6OUqj15X/uy/aroOIpz1gqJJkUXns17uIWZ/tiWbTsi+HberVzGOGvqM=
X-Gm-Gg: ASbGncu0XPr2A3CS91z0/Lky41+0U73AF4K0Y6W31tJ+0BHRE0dE02Rzn7HkHKMSpQg
	jK37O2MZC3PYm0Awa5ibF/7BywtKIizdIdqdrmu0fPrdeD/+iRtQN5SxeWyH5uZ0S0i3b4AQG9d
	S9OFxG0JuQTzd8WFr85pwnfGaWZ7D0vObQILyk6bdQw/MeJAgYJt4Dzxg6sQd5szjXuUptlvDB2
	j1qwhurGM3MFnCDdvr9EeXQdPEogFJgWN/ZWAxYYwedCy1BvfB8TY7RWfDd29MfcRDwwQXjHvrj
	8B9ggYlsf7lJvvPTZQPhslt/HJ9tvoBvZ337MXxRwchyqDChI9UktoIff4UcDALZ133K3fmy7xV
	1mNNdaK+x72FTvav3rIhaFOZ3Ncui0CwF2fMQPCDeCw==
X-Google-Smtp-Source: AGHT+IHWj61MUObzg8zjh1Gu+Q3+ULmgD+3Tet7Gf0YlEwHB9HCZZ9zrT7ksgxYACN6D+ljPvcYnRA==
X-Received: by 2002:a05:600c:450f:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-454d5601c97mr22911685e9.9.1752064280407;
        Wed, 09 Jul 2025 05:31:20 -0700 (PDT)
Received: from ta2.c.googlers.com (24.125.187.35.bc.googleusercontent.com. [35.187.125.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cdb549absm37887155e9.1.2025.07.09.05.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:31:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 09 Jul 2025 12:31:16 +0000
Subject: [PATCH v3] PM: add kernel parameter to disable asynchronous
 suspend/resume
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pm-async-off-v3-1-cb69a6fc8d04@linaro.org>
X-B4-Tracking: v=1; b=H4sIABRhbmgC/32MQQ6CMBBFr0K6tmYYJKgr7mFclDIDk2hLWtNIC
 He3sHOh+av3k/cWFSkIRXUtFhUoSRTvMlSHQtnRuIG09JkVAtbQwFlPT23i7Kz2zLpjNBWhwYZ
 YZWUKxPLec7d75lHiy4d5r6dye3+EUqnzOgSwFqr+YtuHOBP80YdBbaWE/2zMdsOmN/WJobTwZ
 a/r+gEwuYca5wAAAA==
X-Change-ID: 20250708-pm-async-off-bf2a3e2a27ef
To: Jonathan Corbet <corbet@lwn.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <len.brown@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 rdunlap@infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752064279; l=4059;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Ed4Twb2CQqgQw/j9EYSd4UBoWLDImfPhC3bCjXHZGDE=;
 b=uuL2Ulb+3/5msMT8ELf6EoI8f2iEqu5Jl2oVMDbZvKJlIX1YmEO0S4Z1QBX0sUTOet1t961Rj
 B1v9AS7MguyC/vXudwLkhLrbrauVbYUDHuQxaeJl6H80Q+tJ3mDaN2x
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

On some platforms, device dependencies are not properly represented by
device links, which can cause issues when asynchronous power management
is enabled. While it is possible to disable this via sysfs, doing so
at runtime can race with the first system suspend event.

This patch introduces a kernel command-line parameter, "pm_async", which
can be set to "off" to globally disable asynchronous suspend and resume
operations from early boot. It effectively provides a way to set the
initial value of the existing pm_async sysfs knob at boot time. This
offers a robust method to fall back to synchronous (sequential) operation,
which can stabilize platforms with problematic dependencies and also
serve as a useful debugging tool.

The default behavior remains unchanged (asynchronous enabled). To disable
it, boot the kernel with the "pm_async=off" parameter.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Dealing with the pixel6 downstream drivers to cope with the changes from
https://lore.kernel.org/linux-pm/10629535.nUPlyArG6x@rjwysocki.net/.

Similar to what people already reported it seems pixel6 lacks proper
device links dependencies downstream causing i2c and spi client drivers
to fail to suspend. Add kernel param to disable async suspend/resume.
---
Changes in v3:
- update documentation with "pm_async=" and "Format: off" (Randy)
- reword documentation to make it clear "on" isn't a selectable option
  for pm_async because it's the default behavior.
- Link to v2: https://lore.kernel.org/r/20250708-pm-async-off-v2-1-7fada54f01c0@linaro.org

Changes in v2:
- update the documentation and the commit message to describe that the
  "pm_async" kernel parameter provides a way to change the initial value
  of the existing /sys/power/pm_async sysfs knob.
- Link to v1: https://lore.kernel.org/r/20250708-pm-async-off-v1-1-1b200cc03d9c@linaro.org
---
 Documentation/admin-guide/kernel-parameters.txt | 12 ++++++++++++
 kernel/power/main.c                             |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1f2c0874da9ddfc95058c464fdf5dabaf0de713..06beacf208de3242a3b4bb2413ab6cd3e0083f15 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5000,6 +5000,18 @@
 			that number, otherwise (e.g., 'pmu_override=on'), MMCR1
 			remains 0.
 
+	pm_async=	[PM]
+			Format: off
+			This parameter sets the initial value of the
+			/sys/power/pm_async sysfs knob at boot time.
+			If set to "off", disables asynchronous suspend and
+			resume of devices during system-wide power transitions.
+			This can be useful on platforms where device
+			dependencies are not well-defined, or for debugging
+			power management issues. Asynchronous operations are
+			enabled by default.
+
+
 	pm_debug_messages	[SUSPEND,KNL]
 			Enable suspend/resume debug messages during boot up.
 
diff --git a/kernel/power/main.c b/kernel/power/main.c
index 3d484630505ae91fea29f7f9b3fbcf7e585955d8..3cf2d7e72567ecbea2cd80acd3c7f6da85f5bef4 100644
--- a/kernel/power/main.c
+++ b/kernel/power/main.c
@@ -8,6 +8,7 @@
 
 #include <linux/acpi.h>
 #include <linux/export.h>
+#include <linux/init.h>
 #include <linux/kobject.h>
 #include <linux/string.h>
 #include <linux/pm-trace.h>
@@ -112,6 +113,14 @@ int pm_notifier_call_chain(unsigned long val)
 /* If set, devices may be suspended and resumed asynchronously. */
 int pm_async_enabled = 1;
 
+static int __init pm_async_setup(char *str)
+{
+	if (!strcmp(str, "off"))
+		pm_async_enabled = 0;
+	return 1;
+}
+__setup("pm_async=", pm_async_setup);
+
 static ssize_t pm_async_show(struct kobject *kobj, struct kobj_attribute *attr,
 			     char *buf)
 {

---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250708-pm-async-off-bf2a3e2a27ef

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

