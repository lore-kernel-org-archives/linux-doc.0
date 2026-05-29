Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEC331A6E
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062662; cv=none; b=SEvhnvEY03MbRlieW+FhTTmvo8ITcGQf5ZvfxrJMd3ayn2B49RurMcJuTWLOlOV5cSs+HjI1sCkuKfn+LVCqck82IE1Rh8eN/928GXb786eeKO7L4KgCw+c9J0nhKDWIJLUjL8DYORAvlBdc8O4073pdj3B6fgoVCah9hNhCdlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062662; c=relaxed/simple;
	bh=SKo9UEjv6apDtJEFWdQnQKpdtrajl5hRvu7kTJWOptk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qezInM2rhDNgCFaHcTENaFbyO9KdBrvWFpLBSqm5YwHPt3Dpb4QcqrbHDEs7g3+iv5hsIT1AdomCzIFCC0/cOLdLVkHNXO1KeCLqgoykRbXgZUBYJ/zLLgDwCzIEKRrNO38JXmior55RRQWOwCY7MmwLcPp12fsaaTcV3BaAk4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO9nigkz; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO9nigkz"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1363e78746eso10341924c88.1
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780062660; x=1780667460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqOHPyyH5EfN3wruBEgkXAHRsiGcQZOI00mYuQNCffs=;
        b=iO9nigkzOKX/sk1ZrABY+DagAwkMKC9le2v4fX2Re/+lMpw1JvI5AbofRnNkL6i+4E
         9d4UsdwcmDJjmmU0NizqH4GxWa4IqPm0D0Sk3zbbYUcZu0bsx/1L0Ntc0xJkykEDPXFe
         aXscY8Vjz1kABjSatUqc+txlFScdBKeYg3G+To5q8eMaRUGz12Iry15+WBi7zTkCj+xK
         ulEuPj/qclA8EKbAMLhphRUunoUWhxDe+SYnV/3lNSJgD/U4CGSH/tF8QhZ+8sUVoIWi
         K31bWeAqhMUzRfq7wJRZkCN0xA6HVqCITfhV3L20ZsbbMDTY07uTApn1l4YMZC9/4LLS
         HuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062660; x=1780667460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqOHPyyH5EfN3wruBEgkXAHRsiGcQZOI00mYuQNCffs=;
        b=EY8lODwvgwn/c9ebeirfWzrLa/+B9NJrAs8WTR4lHT4kfdc2ZXojwACzqMNnhsgpqP
         C9UkrNGqc7zmukFfvcGVYF0RL+Byl6IIAH5DUNdbEWuN3BMfQ/fKPyWtQlL8OBEJoDpW
         QBBcOdVbtqg5cOQIpZp4J8oMOCc1MV9wr3KqpjnmjFstD7wsNV5CJ53lSa3P3QfGmgaM
         DJH0S62bPDNuV6fnY0HJ3ndWVDl/h+3x7VvJh2HzBuOmWQ6Hax5aRyJvFfTt52kVy6pq
         4wRcv2C9u9xqkFQW6lQhKEz5EcGtP+pUAPh5rGMHRZYM1Pb6EvpoWakT5VxNZJoudO5T
         1MBg==
X-Forwarded-Encrypted: i=1; AFNElJ9U11GgMLlOB+vct3mgaBYI3pa+AZpnJDI5M2S84J1K/BjyEHjFMwpMFSfMCGOyxV7TZ0Crn55fV8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxum3pP3JRviuGl/fpi236qrkQD5oJcaXsmwX8U6ujLmn7x44e0
	JnLYb94zHryDcPT25FPWP7Qd/LLJr4uM2E4teGBLV/xYWh6ViFP0XRAk
X-Gm-Gg: Acq92OEtBB7FCERHoVddYUYbA6Cz8/n3arMH/DSQ+lOnbwhDXNIeaKVZDSIz+YKIEsU
	VnUa+IQmJ68pnzgmE3TutMiPVRRPG33Hjjo1ThlmISsaOZ0hhu2+QlWN4mPq/MhSNv5aq/c57mh
	ySljNtzBOaAmwo4aIrzt5vgLgW3g3DzzV7G9dovvfvM2mxobpBxdSCIMa6Va71axQBCkcWjNvOh
	TlEtcm7zqLIQRma0ZpBI34VtofEPtrmJF/80QSQpuBJvLptMvNenDzcCB/9t74r/3DdN0aCxY/y
	We9L+ASggHf2aL35Kh0I7VioOc2wAb9xc/dpItn5tv0l/9i+rW0JGpE+KaH9NHqJND2ggvgkWbk
	57y8DO4OR3MfZwJ1AjSqzeuvzqnx2z+N3F5V9ttmVQhh4kK6EioYckMlJ6A9Hkf0UTjOml9WfCf
	wcQuwxMzyzDcBTOybNHGv80xhyrotckAyY
X-Received: by 2002:a05:7022:2522:b0:136:60e7:53b with SMTP id a92af1059eb24-137ae975179mr1065625c88.1.1780062659647;
        Fri, 29 May 2026 06:50:59 -0700 (PDT)
Received: from zhanwei.. ([192.227.223.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69c0asm1169747c88.11.2026.05.29.06.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:50:59 -0700 (PDT)
From: Zhan Wei <zhanwei919@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Wei <zhanwei919@gmail.com>
Subject: [PATCH v2] drm/xe/hwmon: document DG2 fan speed reporting quirk
Date: Fri, 29 May 2026 21:50:28 +0800
Message-ID: <20260529135028.20763-1-zhanwei919@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527115311.13398-1-zhanwei919@gmail.com>
References: <20260527115311.13398-1-zhanwei919@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of fanN_input attributes on DG2 is hardcoded to two because
FSC_READ_NUM_FANS returns an incorrect value on some boards. How the
physical fans map onto the tach channels is left to the board vendor:
some OEMs route multiple physical fans through a single shared tach
line, in which case the unwired channel's pulse counter never
accumulates and fanN_input reads a constant 0 RPM.

This is expected behaviour for such boards rather than a driver fault,
and the driver has no reliable way to distinguish a shared-tach layout
from a genuinely silent fan. Document this so the flat DG2 fan count is
not mistaken for a bug and "fixed" by lowering it, which would hide a
working fan2 on boards that do wire two tach lines.

Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
---
v1 -> v2: Drop the code change. As pointed out in review, the same PCI
  device ID ships with both shared-tach (multiple physical fans on one
  channel) and 1:1 fan wiring, and FSC_READ_NUM_FANS is unreliable on
  some boards, so the DG2 fan count cannot be lowered without hiding a
  working fan2 on boards that do wire two tach lines. Document the
  behaviour instead of changing the reported fan count.

v1: https://lore.kernel.org/intel-xe/20260527115311.13398-1-zhanwei919@gmail.com/

 Documentation/gpu/xe/index.rst    |  1 +
 Documentation/gpu/xe/xe_hwmon.rst | 48 +++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_hwmon.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 874ffcb6da3a..3c14cdcaa8a6 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -30,3 +30,4 @@ DG2, etc is provided to prototype the driver.
    xe-drm-usage-stats.rst
    xe_configfs
    xe_gt_stats
+   xe_hwmon
diff --git a/Documentation/gpu/xe/xe_hwmon.rst b/Documentation/gpu/xe/xe_hwmon.rst
new file mode 100644
index 000000000000..8cd48df59386
--- /dev/null
+++ b/Documentation/gpu/xe/xe_hwmon.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=================
+Xe HWMON support
+=================
+
+The xe driver exposes hardware monitoring sensors (power, energy,
+temperature, voltage and fan speed) through the kernel hwmon subsystem,
+typically consumed via ``/sys/class/hwmon/hwmonX/`` or tools such as
+``sensors``.
+
+Fan speed reporting
+===================
+
+Fan speed (``fanN_input``) is reported in RPM and computed from a tach
+pulse counter: the driver reads an accumulating pulse register, divides
+the delta between two subsequent readings by two pulses per rotation,
+and time-averages the result.
+
+Number of fan channels
+-----------------------
+
+The number of ``fanN_input`` attributes exposed in sysfs is the fan
+count returned by the ``FSC_READ_NUM_FANS`` pcode command. On DG2 this
+command has been found to return an incorrect value on some boards, so
+the driver hardcodes a fan count of two there. As a result up to
+``fan1_input`` and ``fan2_input`` are always exposed on DG2 regardless
+of how many tach lines are actually wired.
+
+Zero RPM on DG2 is not necessarily a bug
+----------------------------------------
+
+How physical fans map onto the tach channels is left to the board
+vendor. Some OEMs route several physical fans through a single shared
+tach line, while others wire each fan to its own channel 1:1. The
+driver has no reliable way to tell these layouts apart, and the same PCI
+device ID can ship in either configuration.
+
+When a channel has no tach line driving it, its pulse counter never
+accumulates, so the corresponding ``fanN_input`` reads a constant 0 RPM.
+On DG2 this is most often seen on ``fan2_input`` for boards that drive
+both physical fans from a single tach line. This is expected behaviour
+for such boards, not a driver fault, and reflects the board wiring
+rather than a missing or stalled fan.
+
+For this reason the fan count on DG2 is intentionally left at a flat
+value rather than tracked per board: there is no driver-visible signal
+that distinguishes a shared-tach layout from a genuinely silent fan.
-- 
2.43.0

