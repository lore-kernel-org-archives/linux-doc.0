Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA11631BC9E
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758830096; cv=none; b=b6lZQ8WLdhikuFxrZhsZqRyaDetuYHdMgz+q1YwF62kM+DKUn9+wuoZYQ0Y6OaGDVNg+oRc1rCSlJyJZbcBG5A9/+LqtprhCW4jC/8c9QVS68PkktS2MU/4mzo2XXqsxvxpDob3VvhQWfo+gG7GWbo7x9j5FOSBwGdwIMHWVaqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758830096; c=relaxed/simple;
	bh=pm5XYw0aXaktnBJIF5cJcO159P8QCT4QOXDxOjBU1n4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AfPb/R8iP5G70gfhJ3kvGwQb4aWuRu98T5xCFlSs+zpylrb/YtMQI1QwmToyIclKrn0qmgOSBOIqU5ZGH5Iw1AQqWh6FN/Wkg7cSNZEROcGEOjAghsoT2PYmbYlUb5Bl4perx74vZ7BS00/Gf08qMG9wAoFasKlpaR1VT+2Kkrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMt3aSnp; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMt3aSnp"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b54a74f9150so1232822a12.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758830093; x=1759434893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUCRyPPxJwDgqGohVPvUhNuL/vkJ5zITczPe/mg3LcA=;
        b=hMt3aSnp85fXbHo+9nTAl8oloDRlewGAVikqGaAPvLCZW/xM2L1Ls2N+WmWrA4wWPl
         9OcUkLxsEUYJnrJDr3LqesMuk+AH8vhD2RQ7Fie87Q6B7RPNgEOrHobECI4AR2jOsWMI
         /uMY56k3BDu5eca/4fnHncetFNBz2ixr69RkQ6Bz7X+oT+02kyZXVwNeg4DJ3P9TVjeh
         bFea564oNSJFuZhBcWcHV+zsKO7ARpV2aqK2hec/Cpw9FkxgDxfgGKP0wa+eJ6x66rsC
         LszZ5OH3FklZDM50RYlaEG9h0JeX2RFgXVD3nP5Gggd7T2MHD5boT4716Sjbz0jQKr+y
         imlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830093; x=1759434893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUCRyPPxJwDgqGohVPvUhNuL/vkJ5zITczPe/mg3LcA=;
        b=VLddjYvIU4jWgHFpwmidkCZN2ghLDzaAlZTyAnnZ8/eFnkhna1P7PL4nDofuZHKCQm
         yMdjmvQ2IZbbl4vg77rsp5LrN6E3ZQXeCdQZHDyBrrACb+EWSB8Fk9W0lvo76wwhDRkP
         mqYLKx9DLkrBD8NhKmKyRTqBBIfDH1t3n2YvePkskWgcmsM7IlqkhgeAdev5md8DWJ45
         XGKHURVs+m6mxLw4D5OYGVbMbByGRhywi+k3bQTW6HUoDBqWSDpqcH0866OAfYgttszX
         QkISqZf8S1jvd5UQiUr2+zftKAmU0Wzle39w7n2W+eAyIaLJ/XGwdWEVYWLm+G2HN3Px
         p6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSexc2b8dWunXauvMJbSteuIeFr492cDg9ZkJ1Jyxk22Nl+fREKnkP8UHmQcpO+ektOFfMT/7+gpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCr2ADSz+jyc7X3eSemunD5c+hNL3y9p10oT5GIw0POlaCj3f
	3hjbGpKNMmZksTRiSZ732pQRzURpcmqjcdVu1QqJuu+UMdF1zekPDEDd5srYmJ3f3x4=
X-Gm-Gg: ASbGnctWjZst38Omryuvzt3bhXyzgKMTb5Ye7Nj7rWLxpAIq7SJx8sxaAjAetWSGsDg
	GOGQjaNcl0j0wfi6heeKJRpu/0SgE16gz3gjyvpquBmbIxJZkbowERCEIlpd6+PNvxHEUzUzkhE
	HU6ek8vi16bFIZ7/Oy57ARNHy5FKRsR9+zWe0+QOt99YauYl4Q4WfNVubvapQRgi0gVZpQp1b6j
	yoCPvUsiZl+kzG3TkjaeMk2mco5mbuVoBFS1UvfFzfn5G0Uj3mG6JOilaGqLtedrskUq4Yuswmx
	r9Eo1kLyCc7CgDHCX2GJa59y9ptMNZAhZYirXuThjOk2uxNwd3BBejVz6KYG+CbvAkg3AlrE9BQ
	dlZo5jnuhGye50p+UpZkEHRMEF4tB9vBGj9YWGkbPwQ==
X-Google-Smtp-Source: AGHT+IHY9FrxRWml+wxJ38dtv6SdmwreMU9YpDdbSEbRQSOjOlzJqzA14wRIb8zcdNBWdW0cQAgMcA==
X-Received: by 2002:a17:902:ced2:b0:24a:8e36:420a with SMTP id d9443c01a7336-27ed4aae440mr55087525ad.40.1758830093015;
        Thu, 25 Sep 2025 12:54:53 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ae5313sm33098765ad.149.2025.09.25.12.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:54:52 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: corbet@lwn.net,
	fj2767dz@fujitsu.com,
	will@kernel.org,
	yangyicong@hisilicon.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] docs: perf: cleanup fujitsu_uncore_pmu.rst and fix htmldocs warnings/errors
Date: Fri, 26 Sep 2025 01:24:40 +0530
Message-ID: <20250925195442.71997-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Adjust spacing around list and sections for better readability.
- Use definition lists for defining events.
- Replace block quotes with code blocks where appropriate.

Fixes the following htmldocs errors/warnings:
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:20: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:23: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:28: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:81: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:82: WARNING: Block quote ends without a blank line; unexpected unindent.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../admin-guide/perf/fujitsu_uncore_pmu.rst   | 130 ++++++++++++------
 1 file changed, 87 insertions(+), 43 deletions(-)

diff --git a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
index 46595b788d3a..577bad243876 100644
--- a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
+++ b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
@@ -6,105 +6,149 @@ Fujitsu Uncore Performance Monitoring Unit (PMU)
 
 This driver supports the Uncore MAC PMUs and the Uncore PCI PMUs found
 in Fujitsu chips.
+
 Each MAC PMU on these chips is exposed as a uncore perf PMU with device name
-mac_iod<iod>_mac<mac>_ch<ch>.
+``mac_iod<iod>_mac<mac>_ch<ch>``.
+
 And each PCI PMU on these chips is exposed as a uncore perf PMU with device name
-pci_iod<iod>_pci<pci>.
+``pci_iod<iod>_pci<pci>``.
 
 The driver provides a description of its available events and configuration
-options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/
-and /sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/.
+options in sysfs, see ``/sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/``
+and ``/sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/``.
+
 This driver exports:
-- formats, used by perf user space and other tools to configure events
+====================
+
+- formats, used by perf user space and other tools to configure events.
 - events, used by perf user space and other tools to create events
-  symbolically, e.g.:
-    perf stat -a -e mac_iod0_mac0_ch0/event=0x21/ ls
-    perf stat -a -e pci_iod0_pci0/event=0x24/ ls
+  symbolically, e.g:
+
+  .. code-block:: bash
+
+      perf stat -a -e mac_iod0_mac0_ch0/event=0x21/ ls
+      perf stat -a -e pci_iod0_pci0/event=0x24/ ls
+
 - cpumask, used by perf user space and other tools to know on which CPUs
   to open the events
 
 This driver supports the following events for MAC:
-- cycles
+--------------------------------------------------
+
+cycles:
   This event counts MAC cycles at MAC frequency.
-- read-count
+
+read-count:
   This event counts the number of read requests to MAC.
-- read-count-request
+
+read-count-request:
   This event counts the number of read requests including retry to MAC.
-- read-count-return
+
+read-count-return:
   This event counts the number of responses to read requests to MAC.
-- read-count-request-pftgt
+
+read-count-request-pftgt:
   This event counts the number of read requests including retry with PFTGT
   flag.
-- read-count-request-normal
+
+read-count-request-normal:
   This event counts the number of read requests including retry without PFTGT
   flag.
-- read-count-return-pftgt-hit
+
+read-count-return-pftgt-hit:
   This event counts the number of responses to read requests which hit the
   PFTGT buffer.
-- read-count-return-pftgt-miss
+
+read-count-return-pftgt-miss:
   This event counts the number of responses to read requests which miss the
   PFTGT buffer.
-- read-wait
+
+read-wait:
   This event counts outstanding read requests issued by DDR memory controller
   per cycle.
-- write-count
+
+write-count:
   This event counts the number of write requests to MAC (including zero write,
   full write, partial write, write cancel).
-- write-count-write
+
+write-count-write:
   This event counts the number of full write requests to MAC (not including
   zero write).
-- write-count-pwrite
+
+write-count-pwrite:
   This event counts the number of partial write requests to MAC.
-- memory-read-count
+
+memory-read-count:
   This event counts the number of read requests from MAC to memory.
-- memory-write-count
+
+memory-write-count:
   This event counts the number of full write requests from MAC to memory.
-- memory-pwrite-count
+
+memory-pwrite-count:
   This event counts the number of partial write requests from MAC to memory.
-- ea-mac
+
+ea-mac:
   This event counts energy consumption of MAC.
-- ea-memory
+
+ea-memory:
   This event counts energy consumption of memory.
-- ea-memory-mac-write
+
+ea-memory-mac-write:
   This event counts the number of write requests from MAC to memory.
-- ea-ha
+
+ea-ha:
   This event counts energy consumption of HA.
 
   'ea' is the abbreviation for 'Energy Analyzer'.
 
-Examples for use with perf::
+Examples for use with perf
+
+  .. code-block:: bash
 
-  perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
+      perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
 
 And, this driver supports the following events for PCI:
-- pci-port0-cycles
+
+pci-port0-cycles:
   This event counts PCI cycles at PCI frequency in port0.
-- pci-port0-read-count
+
+pci-port0-read-count:
   This event counts read transactions for data transfer in port0.
-- pci-port0-read-count-bus
+
+pci-port0-read-count-bus:
   This event counts read transactions for bus usage in port0.
-- pci-port0-write-count
+
+pci-port0-write-count:
   This event counts write transactions for data transfer in port0.
-- pci-port0-write-count-bus
+
+pci-port0-write-count-bus:
   This event counts write transactions for bus usage in port0.
-- pci-port1-cycles
+
+pci-port1-cycles:
   This event counts PCI cycles at PCI frequency in port1.
-- pci-port1-read-count
+
+pci-port1-read-count:
   This event counts read transactions for data transfer in port1.
-- pci-port1-read-count-bus
+
+pci-port1-read-count-bus:
   This event counts read transactions for bus usage in port1.
-- pci-port1-write-count
+
+pci-port1-write-count:
   This event counts write transactions for data transfer in port1.
-- pci-port1-write-count-bus
+
+pci-port1-write-count-bus:
   This event counts write transactions for bus usage in port1.
-- ea-pci
+
+ea-pci:
   This event counts energy consumption of PCI.
 
-  'ea' is the abbreviation for 'Energy Analyzer'.
+      'ea' is the abbreviation for 'Energy Analyzer'.
+
+Examples for use with perf:
 
-Examples for use with perf::
+  .. code-block:: bash
 
-  perf stat -e pci_iod0_pci0/ea-pci/ ls
+      perf stat -e pci_iod0_pci0/ea-pci/ ls
 
 Given that these are uncore PMUs the driver does not support sampling, therefore
 "perf record" will not work. Per-task perf sessions are not supported.
-- 
2.43.0

