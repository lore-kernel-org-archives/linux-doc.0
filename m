Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE8391E42
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550755; cv=none; b=hBMX5i/QxqMeBrq/bzyGWSEZIIXgkP43SHL9Tv5vjeuRoeqhvTdnOZ/WQL8bznPMCLYRsFS/mbKNaeLEVQMN49Cx0x0JxWmmkSs7pk1tqLDLCBdpz45ZPbkQY6X7QsikdgyD4CYZvYAHgtleYfPRRy4F4qu6JBUcTkhZx7iOAv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550755; c=relaxed/simple;
	bh=x/qL8DTDLXqEA3btg/dM3vYSxTka9rcwpOU+pgxXIMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSgCtUoFz/TuBmyiIhop+eod21OO9X/n+ERfx5dT2eKN+BgwIXYOCWoPXszAdUGNJ8ZoPZE2St5pwDQcr5QtEzUqglDhn1MLgYFY/u2HeFA/P/0lAamnZu3/rvMf5M0fhB8HB6qlLF7NqM6mA1LThDsM2wbznuN72T4k2mpHNQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvV6+QW6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvV6+QW6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b2ae8a0103so3915395ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550752; x=1776155552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad+Zq6P1UyPL+h6UcShC1eg2COuJW7KybBIrZUrFMOc=;
        b=nvV6+QW65nxFv9VGfn8T8E9F6JYKmeDUA4cZc/rg1e6NNpKoNoTiJ72YyQXfAOF/Km
         1zH1ASJNOBmUEVTirsInS/oD9g9G1y2zzLkiUvpKTxYCjIHpX7vWP6X5R/jSc14mMwo2
         CnlGJGUOXO2RsuGsZgXMIUKgb8iGy8Ik/JrTEB6AB3Ef7nXEvQyIs4nh9L/4b3rJ2qjU
         lrfSkxFDE7uzDNRxdNghuNtDbzArZ65TAEazWbUs/AzS3pClIYsr++FSIZbEBuS1ejBX
         1sJuRm50p1nrGc5a3psJLE4A1XjsSy/dy9MMXbpOXFGZ0ffu3HxAi7EjQsTVjAPLOmde
         ntNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550752; x=1776155552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad+Zq6P1UyPL+h6UcShC1eg2COuJW7KybBIrZUrFMOc=;
        b=aTQd4KzHRQeMheHQ9Z4lpPfqaUW30OdmjzNEVLHH+YmtA2pD9vMeogohkTUwl6YZIe
         SWpZh7W5LsP7bXsnAWOHmxS8B/3u76Uz/LyYg5xOyr2MomuHjxHorhElsdjXzd4WKC45
         3q0mSp21exFM8fC85MhRA8+Un+srVLTg4KfZ8YYNr4ZqiDKtRYGC5v4KbnIHZw5DE2W3
         oIjQsJUGG/mfdOBaSd4zBw+BTfJXT2Jj2wn/RZwapvGJ0z6sH1rFtw7a6LRSL+PIFt4r
         ksvRusgcJPNVEGQjWKprW2E0a6bDZbNNQ6S+wOY2GsqgHZ9Ujq19O1cZazos/mt60/Zr
         Y+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5kFMY7Mjtar3sLm9TUNI9D7PRok1pqVE+Hl5jpLWb72LXAQGL4Za3c0q8yKOEp6LOYjUUByRo2bE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8h0A3zxgwljwl5KxJL0aNkmaa/buZ2J5WcFcWEO76TJIQfZ+d
	6u9V4iQrkjw7rmJgnQlZMQ8HzoF+TfZ2e3tmLSp+XhoQuayKOZ+RYhZC
X-Gm-Gg: AeBDiet5xfg6zE7UEYM7CBQOAlYmOtsB4NfvRVqiPLwndfPH69hJjIYPi8I4tMzLHmc
	U7JnUT3p3X/734RgE/8ycrcGre4GOGdC+d9LmopzbovQeuGiBvPshI8i9ieJjpZZG/MiPBK1tsU
	U/dvOnr0ma/6Nj2jKn66vJpSqdxiU96XHp5b0oYRjvq8dwnoVjty79k4EymbHrQ/7Rr4hBkOwdv
	9vfECPV7GVkohOYYAUZy5sdIZocj7/95i6zD/3NWPRmfSt3CVK6sg8cENSn/zvUSM/z0BY6+nOk
	99hwNz1acFlsP3XN+VL3XdzWR/maAdfzlYRO0r7xfvS1TJxeex3BLl+idH8vvVfZMD1sla3ePRc
	1oHC0w1zpQOoYkqx0KHlloYu+zFCCCFq1C0zcafCBMa2t2LnmR1+ssR6sLHffb5Z+blwDtcPp4z
	8eSDJ5bukmiRuaYAh/pPn47IolVNjSNEjwSWU=
X-Received: by 2002:a17:903:183:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b28176974bmr166862135ad.26.1775550751972;
        Tue, 07 Apr 2026 01:32:31 -0700 (PDT)
Received: from fedora ([2409:40e5:1126:477b:379d:30fd:d3e2:3b3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbca2sm161392915ad.73.2026.04.07.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:32:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH] Documentation: sysctl: document net core sysctls
Date: Tue,  7 Apr 2026 14:02:13 +0530
Message-ID: <20260407083213.27045-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document missing net.core and net.unix sysctl entries in admin-guide/sysctl/net.rst, and correct wording for defaults that are derived from PAGE_SIZE, HZ, or CONFIG_MAX_SKB_FRAGS.

Also clarify that the RFS and flow-limit controls are only present when CONFIG_RPS or CONFIG_NET_FLOW_LIMIT is enabled, and describe rps_sock_flow_entries the way the handler implements it: non-zero values are rounded up to the nearest power of two.

Validation: git diff --check -- Documentation/admin-guide/sysctl/net.rst
Validation: make -j1 O=/tmp/linux-docs-check SPHINXDIRS=admin-guide/sysctl htmldocs
Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/admin-guide/sysctl/net.rst | 66 +++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index 3b2ad61995d4..05d301b8752c 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -210,7 +210,9 @@ Default: 0 (off)
 mem_pcpu_rsv
 ------------
 
-Per-cpu reserved forward alloc cache size in page units. Default 1MB per CPU.
+Per-cpu reserved forward alloc cache size in page units.
+
+Default: 1MB per CPU, expressed in page units
 
 bypass_prot_mem
 ---------------
@@ -238,6 +240,37 @@ rps_default_mask
 The default RPS CPU mask used on newly created network devices. An empty
 mask means RPS disabled by default.
 
+rps_sock_flow_entries
+---------------------
+
+The total number of entries in the RPS flow table. This is used by
+RFS (Receive Flow Steering) to track which CPU is currently processing
+a flow in userspace. Non-zero values are rounded up to the nearest
+power of two.
+Available only when ``CONFIG_RPS`` is enabled.
+
+Default: 0
+
+flow_limit_cpu_bitmap
+---------------------
+
+Bitmap of CPUs for which RPS flow limiting is enabled. Flow limiting
+prioritizes small flows during CPU contention by dropping packets
+from large flows slightly ahead of those from small flows.
+Available only when ``CONFIG_NET_FLOW_LIMIT`` is enabled.
+
+Default: 0 (disabled)
+
+flow_limit_table_len
+--------------------
+
+The number of buckets in the flow limit hashtable. This value is
+only consulted when a new table is allocated. Modifying it does
+not update active tables. This value should be a power of two.
+Available only when ``CONFIG_NET_FLOW_LIMIT`` is enabled.
+
+Default: 4096
+
 tstamp_allow_data
 -----------------
 Allow processes to receive tx timestamps looped together with the original
@@ -290,6 +323,8 @@ probed in a round-robin manner. Also, a polling cycle may not exceed
 netdev_budget_usecs microseconds, even if netdev_budget has not been
 exhausted.
 
+Default: 300
+
 netdev_budget_usecs
 ---------------------
 
@@ -297,12 +332,16 @@ Maximum number of microseconds in one NAPI polling cycle. Polling
 will exit when either netdev_budget_usecs have elapsed during the
 poll cycle or the number of packets processed reaches netdev_budget.
 
+Default: ``2 * USEC_PER_SEC / HZ`` (2000 when ``HZ`` is 1000)
+
 netdev_max_backlog
 ------------------
 
 Maximum number of packets, queued on the INPUT side, when the interface
 receives packets faster than kernel can process them.
 
+Default: 1000
+
 qdisc_max_burst
 ------------------
 
@@ -368,6 +407,15 @@ by the cpu which allocated them.
 
 Default: 128
 
+max_skb_frags
+-------------
+
+The maximum number of fragments allowed per skb (socket buffer).
+This is mostly used for performance tuning of GSO (Generic
+Segmentation Offload).
+
+Default: ``CONFIG_MAX_SKB_FRAGS`` (17 if not overridden)
+
 optmem_max
 ----------
 
@@ -377,6 +425,16 @@ optmem_max as a limit for its internal structures.
 
 Default : 128 KB
 
+somaxconn
+---------
+
+Limit of the socket listen() backlog, known in userspace as SOMAXCONN.
+The maximum number of established sockets waiting to be accepted by
+accept(). If the backlog is greater than this value, it will be
+silently truncated to this value.
+
+Default: 4096
+
 fb_tunnels_only_for_init_net
 ----------------------------
 
@@ -449,6 +507,8 @@ GRO has decided not to coalesce, it is placed on a per-NAPI list. This
 list is then passed to the stack when the number of segments reaches the
 gro_normal_batch limit.
 
+Default: 8
+
 high_order_alloc_disable
 ------------------------
 
@@ -465,9 +525,11 @@ Default: 0
 ----------------------------------------------------------
 
 There is only one file in this directory.
-unix_dgram_qlen limits the max number of datagrams queued in Unix domain
+max_dgram_qlen limits the max number of datagrams queued in Unix domain
 socket's buffer. It will not take effect unless PF_UNIX flag is specified.
 
+Default: 10
+
 
 3. /proc/sys/net/ipv4 - IPV4 settings
 -------------------------------------
-- 
2.53.0

