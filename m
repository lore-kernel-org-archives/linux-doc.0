Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC419271469
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 04:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758861489; cv=none; b=JtLt7JmsM8spamHZYhj1u+mBy93rfrUj4Tlrx7lLEz+Y0nCfAjAOCtiOQ6Rsv6CEpoIgZP6wq5FKSyLdS+i0r9mdtsy6AJ72wwZaRkpgAhuVlQi3Y7jvrvPnJ/AD4dlziW1ksFB40yQqLt4YtFVSw5n3dTDtTJUzAIL+DfjNaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758861489; c=relaxed/simple;
	bh=XxNUnF48ZRFqZW9hajoozJasry2cnE3h51zgRy2n1Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwJ4bktoPYsKTlp2jgJJAVBTSaCAn+5NDxagFrzbqVtxPZ1WTHtw5l3Hawxppvl3uKdn8jsBvTVKpN58cLlE8nUi6w1y14e/qash57stL5RKKXa0Tx7muUygUFwC8+eWyrCR0a+YnX85fOx/CiWh1VOS0ds9vlLp7BiwRhiep28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUB1CBWl; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUB1CBWl"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so1436519a91.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 21:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758861487; x=1759466287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZiOeCBkD9AashlSYKExPHxF3/Li1hvwvZEe5pWzXEI=;
        b=gUB1CBWlVHYPk99KZpckcvEFX/65ph0OxNnXObBnco1q+VQch+z1eYSXlbwzDvAbSa
         xI3jJClarbws/XfNKcoYMhYfgq4qv6gCQzY3P6ukP1eiShur7N+e8ASXlUbczLcG1G4w
         L5DIUx/T2VKSqU+6Yd7xmQ1D4JSC1fo/oGsehJvOXKmGNO9F7nMGq8iPzlaqDnDctc6t
         e/aUSbc1UJqidAvkrjghv+JSkolOShr3PPkBSR3ZS5ey8Q3yjLjyvf4Cv2exCtR7aWS7
         RbBld8NZGVkmRN5cOHUHeWoRCaZiHuAi9TczZ+kIQzMcujuVZvx/TDGeSsC39V8JQaha
         LWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758861487; x=1759466287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZiOeCBkD9AashlSYKExPHxF3/Li1hvwvZEe5pWzXEI=;
        b=W+bnhlxnwmb9jihhBCUP7RyPxHNXX4CGnBFZvcBURqQ6w56NG4x72+bVCewpK/gR8B
         pMiAP54+Up0pv9y10QtL+hRnb56/EFuQz1vc2qCrIcD2wERcuDsdDouiy4dxCut3xtJA
         biU+YX9TTsZMi0TF/t6JLgmI8L5/B3NcweQrTRlvfYaRHh6uNHZWXQF2l5AckpckxEdD
         4Uk9aoj5UGUoutsmABgoKzfI1rNsUXDFkoS30tmmYmpKDTx98o+5/lpt7mXW9lL1dea0
         bactXQltIsC33+pAIlEhQF3dRcT/BWBRCtvpQFawN/cYDyXnAfz7mSdAkqgfIY23uEGg
         rufg==
X-Forwarded-Encrypted: i=1; AJvYcCUY6Dlepoieh1o2cicoa3H7zBUqxEptUNsZ+mP5xI+Nbjbu5bD7QRtt5/lb+JIo2Eaa4aBdcaXVrzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4c8vvBrmNsA+Xgtzy1oe3ojXw+x5ErYhGQa6Wa4EzFi6w8ge
	oi5EvDNhqnLV05kLHk7oPeZfypEF72fH4xEzF+Kl7IgQnmKj1dia413d
X-Gm-Gg: ASbGncuFRuMBfjFzyPtdJXJF6fiWsCMDBalcqYemRRf+BV38EStLii8CEKK7PFEv9Vc
	qEl2O0pFCbtN6/d28demTR7aqOpXP7DA9Je/zgS8M7Pqof2Ueb5OOE80EldpCr1h0ZAqC9TfCdN
	X28w3LomknRWRDvqsuaXsTr5TckLR94xhPfFPAWoDLqz3rNogznaQrPO5wFGtlzWPq1j6NVgFzZ
	Wt8bh+FDKVsyhLCIWHTYjYeNS789Bh8qXOFk1aJba1BCl7ZI2Ozx/dIVfQxeV7bH5ziqaKVKwkA
	rCUQl7siCHVzTd+intkTXjz4PYhLZdjxohVZo+05qnubiSQEpeQYktMdVfC2+UorcRlyUFSaWx8
	U6ZvKaN2OfYE6ZYx/fVwCgmHVZQu7SDzSd0ysd6MiOVr97sOQKc6aDL3UdQ4lhbA=
X-Google-Smtp-Source: AGHT+IHnIagXLZzhg+mqFHzQFg/2tOmjiL9IaTl/AeYOkwIL583UfLqraCIikoD2UGjeFiTT9r6mHw==
X-Received: by 2002:a17:90b:3890:b0:32e:3c57:8a9d with SMTP id 98e67ed59e1d1-3342a30ed08mr6286890a91.30.1758861486907;
        Thu, 25 Sep 2025 21:38:06 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55be61bsm3512682a12.48.2025.09.25.21.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 21:38:06 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: corbet@lwn.net,
	will@kernel.org,
	yangyicong@hisilicon.com,
	fj2767dz@fujitsu.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] docs: perf: Fujitsu: Fix htmldocs build warnings and errors
Date: Fri, 26 Sep 2025 10:06:12 +0530
Message-ID: <20250926043748.3785-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <61aace07-890a-4b55-8e84-935ebc4a3be1@infradead.org>
References: <61aace07-890a-4b55-8e84-935ebc4a3be1@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generates the following build errors and
warnings for fujitsu_uncore_pmu.rst:

Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:20: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:23: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:28: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:81: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:82: WARNING: Block quote ends without a blank line; unexpected unindent.

Add blank line before bullet lists, block quotes to fix build
errors, resolve warnings and properly render perf commands as
code blocks.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:

Changes in v3:
  - Properly render perf commands as code blocks (use "e.g.::").

Changes in v2:
  - Remove formatting changes unrelated to the fix.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Shuah Khan <skhan@linuxfoundation.org>

 Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
index 46595b788d3a..2ec0249e37b6 100644
--- a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
+++ b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
@@ -15,15 +15,19 @@ The driver provides a description of its available events and configuration
 options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/
 and /sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/.
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
@@ -77,6 +81,7 @@ Examples for use with perf::
   perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
 
 And, this driver supports the following events for PCI:
+
 - pci-port0-cycles
   This event counts PCI cycles at PCI frequency in port0.
 - pci-port0-read-count
-- 
2.43.0

