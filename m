Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A22834BA40
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759207112; cv=none; b=oF8LdfxTn/cr4rnjI9NNuAUgFxtBeTTG1JTmp+MaeR0QvUYmS/iF3z1WcFULm2v/3pYTyypV83QMsdSQJKXDtjZ/QzvDolpAO/4qLVUgfZqZAi8ZPa1tqmjXPpJBZXPQtB0+pgcJZ+CIiMeZMcGi30EhoZnB/ulY0WBJkWVk0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759207112; c=relaxed/simple;
	bh=x/zo4DLS5xopKyfQ1IRecekvbLsQr10w5m43S83i164=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WaxIFSKFkfoePvLfG/1zZ3A0JfaNAmmXGIjXQufhgDKOeGukY9DdfeDZeTfrvICpJaBrexTlGzVt+H2EsnS6/yJW0IckdCgLeyZCd/9V2qhdXK5/KBgbqnh38DaDEIAyiFTwYZJcPCtfCYT8uQxEKbv9enp3Kv4IU6qNpLsclyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeZrEOk3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeZrEOk3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-279e2554c8fso56139335ad.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 21:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759207110; x=1759811910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZT8btfJLrca2sq9IheLfnEkVwITikkzFgpMmjw2//s=;
        b=JeZrEOk3yQpzXFajxl9z2vkUvG4b9atVOc9hHZA3971Y6mmqWQ8avQ0WEnCdIvm8wN
         F3dIhBVflpmxAPHR+bksHnwNcgM/9E6ulz5ZSkkQxW6vgAQJJ5yo7fJfpTqzw9hH9a9v
         TQpXrnNNIZlrUwPYrJb4UdZhcMc2Hq8pyQeJIV2g8YO1nk68p9ckPjsO5B5yQmcfaG6X
         tj3V9HySwHdyAuBfkEdHu6q+57D/PZ8LVVRNjQLqzwY0JXwrSCCNi+cT0NibyUpTdwwn
         kf3R0CK1+VGt6Ez5VR87dXhOXdq0qU6bxkcWakRKGIpS+IvrSQyVIDFFBkC5C3tQCxSa
         3Qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759207110; x=1759811910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZT8btfJLrca2sq9IheLfnEkVwITikkzFgpMmjw2//s=;
        b=JvE3HW8HrghLAvHJaJb4qxGJZlWLmQE1GNIsfvHCykr/Blcd6qrMyBOkn/bdFIi2uM
         /bIg0oMgM4sp/PaHKBUaudOHUwxM2S2ovg3U9UXI0A+TlmE6mLTYoAs5jkBZ3wwzigHf
         nNkWO/SPH7I0Km/CAO8Yl7cznXDJn7x/t3K16NE0CrMJqs89mQcoNRCPVE7GZTMWRA4A
         jWpi9J2Mv+bQI+C0Y0hghvMbTe+A8NnPqJvpr2pOLZHSWcfZa5cErukuSb8Cjaqnwuv6
         +F3xPvoqSUyr0r86Fqr2j5TO5lIbPqkH+pH+2AsFTDpJi9/C52NXh4FibivUy8YPSEAS
         EMtA==
X-Forwarded-Encrypted: i=1; AJvYcCUjx+sHfH/p9tgq4STQ2WNKNJ7c99ynldhB2BF8k9tEJ0XukQF7TYZ9wUVSEgoEPbfG6y78ccueNRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLFUhNQ3AYVAeZ1Glt2M4ZVR0uMXsuAbpe/mFCgrTCY80XBUw
	lquK34ECukB2QxUOsoOoSqsbcqo3oGYkGggfOIzkEAFJOswnMF6KgIYYCVcCehLV+HRviA==
X-Gm-Gg: ASbGncvaV/SMNrhnceoRT1Yd7peqEuWcTuSyfhy9Ue9c0ByccEBWoWAJ2zpQR9HFSPz
	SEvCO56Tx7BDotMYTrWtl5gFwnFihnv4oW4APxvW8DU5F8JVK81Y74fS27BcY8BxyHFPJrA57ba
	1sjOsX0OxaLyZ94cgUQKRVm0WlhZb2UNwlueoQ4B7Re1Y6cj9UbqvdgoIYB7hsdDqZjwzhE3tWS
	1b1901wp6X5T5Oow4b2RNjBGYbZGUra9nQnIGorcSZraSFKF3sg/zLnGnP0BnTTmBoIzO9t6MTY
	NXcAk0P3Ig/vry5nmBSJQ0jtahIGPNegGBTKLP9HtI815t2ChPFvrfupcqQ6N7rtbCaBZok4yes
	S+Pg8L3l8W/5Ngm28Ug6y2agnuGML5WvKWGo5HYayXt3lLBW8vqGM1+Eo7jw4WXObrw==
X-Google-Smtp-Source: AGHT+IHJrdVU3IoI7rVootqpTrOCX2Siw83i3/cFETYlxp+cOb+qBIWkeM1gUVV6aGYcyytIe2CDUQ==
X-Received: by 2002:a17:902:cf42:b0:267:95ad:8cb8 with SMTP id d9443c01a7336-27ed4a96047mr199662015ad.44.1759207110287;
        Mon, 29 Sep 2025 21:38:30 -0700 (PDT)
Received: from LilGuy ([2409:40c2:100e:619a:6959:b194:3c63:fa0a])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-338386f5a7bsm3000830a91.5.2025.09.29.21.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 21:38:29 -0700 (PDT)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Koichi Okuno <fj2767dz@fujitsu.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH v1] Documentation/admin-guide/perf: Fix indentation and formatting in fujitsu_uncore_pmu.rst
Date: Tue, 30 Sep 2025 10:07:36 +0000
Message-ID: <20250930100742.4741-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several reStructuredText (RST) formatting issues in
documentation/admin-guide/perf/fujitsu_uncore_pmu.rst that were causing
Sphinx build warnings and errors. Specifically:

- Unexpected indentation in bullet lists.
- Block-quote unindents that broke literal blocks.
- Missing blank lines between paragraphs and lists.

Reason for the patch:
Without these fixes, running `make docs` for the perf documentation
would produce warnings like "Unexpected indentation" and "Block quote
unindented", and could lead to incorrectly rendered documentation.
This patch ensures proper formatting and readability of the fujitsu_uncore_pmu
documentation, which is important for developers and users referencing
PMU events.

Changes made:
- Added blank lines between introductory text and bullet lists.
- Used double colon `::` for literal blocks.
- Adjusted indentation of list items and surrounding text.

Testing:
- Verified `make htmldocs` runs without emitting indentation or block-quote warnings after applying the patch.

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
index 46595b788d3a..31e6e535d11b 100644
--- a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
+++ b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
@@ -14,16 +14,21 @@ pci_iod<iod>_pci<pci>.
 The driver provides a description of its available events and configuration
 options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/
 and /sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/.
+
 This driver exports:
+
 - formats, used by perf user space and other tools to configure events
 - events, used by perf user space and other tools to create events
-  symbolically, e.g.:
+  symbolically, e.g.::
+
     perf stat -a -e mac_iod0_mac0_ch0/event=0x21/ ls
     perf stat -a -e pci_iod0_pci0/event=0x24/ ls
+
 - cpumask, used by perf user space and other tools to know on which CPUs
   to open the events

 This driver supports the following events for MAC:
+
 - cycles
   This event counts MAC cycles at MAC frequency.
 - read-count
@@ -69,7 +74,6 @@ This driver supports the following events for MAC:
   This event counts the number of write requests from MAC to memory.
 - ea-ha
   This event counts energy consumption of HA.
-
   'ea' is the abbreviation for 'Energy Analyzer'.

 Examples for use with perf::
@@ -77,6 +81,7 @@ Examples for use with perf::
   perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls

 And, this driver supports the following events for PCI:
+
 - pci-port0-cycles
   This event counts PCI cycles at PCI frequency in port0.
 - pci-port0-read-count
@@ -99,7 +104,6 @@ And, this driver supports the following events for PCI:
   This event counts write transactions for bus usage in port1.
 - ea-pci
   This event counts energy consumption of PCI.
-
   'ea' is the abbreviation for 'Energy Analyzer'.

 Examples for use with perf::
--
2.51.0

