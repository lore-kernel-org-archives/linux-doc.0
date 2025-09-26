Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342EDDA9
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 00:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758847189; cv=none; b=RHNZ9NZOmM7TV9SuPmaM12NmubNQPSYD8gGZBTArADUnsAQhZeGPmA90eoSj/VqSlBsZwYwj6gixRwlhI+tAfF75JuoAd2KMBEoyNZb90uztIyD5zpQisi4n7sOA9ECtsvOUt2A/8EwylIcJ6Xf/D2l2md1fUpSKB1jrQ5tE090=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758847189; c=relaxed/simple;
	bh=nZu0dQTnI7c0vHRG4WuLt6WI+WkHJQUfIyCJZQwhANk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYt4Po+LGDs1efqi3UMwF1MU20C4ejd/w5egZ4OS7/iGmWDqDFARCHxuO3Za7jN1JgpixdalzBKByxdSWtieNbSw1XQZF5v/thQWDamUYKEGs42GiRaS5hg3JiGwzHcEdqNOPNeK0AaXbw2VGu5FORIQWg4gVq+gZ53CQ7zXzAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+6FDhzF; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+6FDhzF"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b523fb676efso1614750a12.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 17:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758847187; x=1759451987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKnaVIq0LZ3mDKDeIlNyOzrXDoMYEsJjeAh4xs7zfWQ=;
        b=X+6FDhzFkotNuQ0jj7zAu1wPlS1t4W/J1JL9Ird7/U7TP1PDl9+mvV8LTO1rqqSpbW
         ScxxCQpHESvjTYRRaf3/BaEcpZ17500shU+Kr917WnLaqO5VNII3h1Yk4FU6RPUylnEI
         4YihbRy02qE9Xz3sS1bcB5ZaH4DUa4IIzXQ2QbD4DyzelSAk/I1EsmplTRZUvlf8Oc1N
         xYnDQMf7Pgwe9C7b+DWKbI6K/wW/fCaHz5+ONdxdj9T3Ir9eG/ZNnNtYk64Bt6pSQpH8
         owm9yOuo8kfsCzUHzM93klnMPCjjt5rnHPcTssS19h9WkonUJYST3Z+B2WFeYMOiuf/Q
         dziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758847187; x=1759451987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKnaVIq0LZ3mDKDeIlNyOzrXDoMYEsJjeAh4xs7zfWQ=;
        b=kRsdYXC/BFvPXJBonepnAT3lYR/7LAT22Wh0NHgZ70sqnC+noWQF3w0BkMmtMDGaiX
         t23a+9Uyb1wjgZCrIvHP37p1v/8jF4GikvrzUW6qNHT1X0mpm/9GIdGdqKZGZCRNLnhC
         Yl6rE5B8fpvGZqy9naPL+GC9E0yQL8ewtjLCiTrsYfgofcqdKhfHcQbz5fnbzNBDhivS
         NAqUkg3emDWq40fBSLSxNdVCxAOpu1x/QPEU0TiLw0tShQ/9tiRSd8MSc4hvROp19V20
         IBL1nHijGCNM300d5WOZLhW0np/t1wBVghLFYfpnqnV5+e+sFzghmT9VGg6b859Z6JI6
         Zmng==
X-Forwarded-Encrypted: i=1; AJvYcCXmDkxCcQ/RRJvGvGcMP/BfB+EUBkskh6xdwzIOBwRw8n1DoTl/DDywvrl8F2iA5iIHIqPFXGlLq78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxed4s/PcJsmBZmhEgC5Tv3VmMRm3+dg5KWqsQPzmmv5jD3fYQk
	CsWjmcDPeU++FmGriW0ljrI054xh7xXQmtHfJdF3NLEcqzRakftNKtqS
X-Gm-Gg: ASbGncuQO8P/xKu8h5wUaBDqjIVzLheOdE12rlDpj+UgDET4Lyg6lfhdj01Ss/jpxPN
	N7vavz2KrP6zsQ4+v/OCLb3WUNNpWM2F7xf54dPA+7JkTw2lRw4WAcfBTiah7wXWCIvCNM5826k
	xfxuBzu6Syut3K48ShcWIhXfdWUlC697UgkwpybLYIWMoIZ5mzgEts/LYWec+8lnfUmgt1vkzcp
	iHK80UQWRymKYyw2uudZxg9NwzMIHWlshoQXtj3X8JdbJgjsNB9yeSGElKLiqvT0xpcuGkZy+cS
	xOF24CXS2w99jE1J7vO+HdYlXMtsNQzlPQsRJeOlr2hpDbPnC+D11AOBdp3C1LxDaqZFHgnPYQN
	Gab6Q5Qz3tu9ktLe9g/aLMtF/RLzZ9wpU2KKg4nTGnw==
X-Google-Smtp-Source: AGHT+IG326amNIrt95WaEQYYFFDyTfpagBUKaviDy8uBRk8XgT2ltykYjLmd/Lb9/RrzkGixWEyeVA==
X-Received: by 2002:a17:903:845:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-27ed4a5a7bcmr38027585ad.52.1758847186710;
        Thu, 25 Sep 2025 17:39:46 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882290sm35871545ad.76.2025.09.25.17.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 17:39:46 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] docs: perf: Fujitsu: Fix htmldocs build warnings and errors
Date: Fri, 26 Sep 2025 06:09:36 +0530
Message-ID: <20250926003938.5017-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add blank line before bullet lists and block quotes to fix build
errors and resolve warnings.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:

Changes since v1:
  - Remove formatting changes unrelated to the fix.
  
Suggested-by: Shuah Khan <skhan@linuxfoundation.org>

 Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
index 46595b788d3a..4edf26f8cfe6 100644
--- a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
+++ b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
@@ -15,15 +15,19 @@ The driver provides a description of its available events and configuration
 options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/
 and /sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/.
 This driver exports:
+
 - formats, used by perf user space and other tools to configure events
 - events, used by perf user space and other tools to create events
   symbolically, e.g.:
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

