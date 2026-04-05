Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B51270EDF
	for <linux-doc@vger.kernel.org>; Sun,  5 Apr 2026 03:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775358290; cv=none; b=rvMWcKLiZl+gr8i1vbQPnLzm/Dw9gvivobwLbNIUikW480twIuCKmzlWuWW+KFadBsRRlJ8y20n2DX0vAtPZHzO6rxjg9qiu9J+2cq7OaKMgg5lHkv6+rbAU5JU4jZDkeOPUTO3Spt1XzsKM96C+lL4ijckzbW4euiCrWNwVeLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775358290; c=relaxed/simple;
	bh=4+OFX/o6ZcjxN7EkPfny+SHJIJwFFlif2ab29/wAKII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LXD7cwPKneqn3NZJ4bUy5r9WDp72Aiw80+nRVnppDc+Qe7iQSwZ7Y9Q1TCfT/ufwxoPpOeRDcgwNWFFQeXbG3YgNOwMqkcIw0xlZ0GuDd4EmArGKCWZajaqRwrwbnY2TqrCBmewD0pQZwuHuwMjAdGd8a0Q2dS8TJx3Q9lB91Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFgskLUO; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFgskLUO"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d7fdb922a5so2452415a34.3
        for <linux-doc@vger.kernel.org>; Sat, 04 Apr 2026 20:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775358288; x=1775963088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HmbEOqWBtUfgAwAxYtgklFWRRWFDUwB80b4X6U9IwZA=;
        b=jFgskLUOBUmyoiC1Qe8jpmlezUCWSnYrzqBB43IQ59Kt6uIMZ6dAVvWhEID+aZZGJw
         Kj2Zum95t9fxFBkMUUAVXMHwP8RDJqIol3cFApwWc6snn0eEXJrnq3l9ZR3nfcpSL98f
         pYiMFzTCLN9D5NCcKSELzlCGkn0aWwPBgKaSJeQQOsxIF9lhjMUSMcT3LvfBaLn3wGY7
         rp/QEGdJvi0ZwR0/1qhSa9x3JSGgNY8XBsc4OCkTGPnrxE876XWDln33OXind1zGZjjN
         UvCDcp10ZmQA5hL6xFTQGaymy01qFBFgDa0zhcmWZ/XG9s8MQpyXhp5rFA5EmGN9Qm2E
         QBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775358288; x=1775963088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmbEOqWBtUfgAwAxYtgklFWRRWFDUwB80b4X6U9IwZA=;
        b=Tdt3F7yeT492sfzo3dpvMq0HGFep25O0x4RLvdne1Ic8ufDxQGpDWhsSn+eFsbJhno
         y5SMOaXeYm6ufycEmytqOC6DaHz17qgvwIspQgLDt4pdh7R5g0HywsYeFtPwYYIY+ARn
         131E0eRY8+WIu1r1K62tdRyNraQzEiA0NW3QzYsvjdntBgTNUSNXetNIBtIZSy0jZHPq
         6id9wZde8euHyk5lapdz5siyA0kNQ35t4udep1DXRTAyTBaFEap4gxh8gye4TJ/Qj0ud
         PnH0OZVPPk5rbZk4bpFeJ0vYEcvRuB51oFTMbFJNWg2iwga4ZsK5kYPy+P/5hvCS3BqH
         1qeA==
X-Gm-Message-State: AOJu0Yw7h69YQ5AKfQNuJErWyCZ6H+7qsWhBuHKNxnfgkiKm0qvWmMVi
	2/Tu47WdIAvHoBxNNDYx/oJ7+J/RyB/5kICctMgDdO8oNcnkcxmbSSJ/2bJj
X-Gm-Gg: AeBDievnlf1n2bRy5tvZpU341c6mFw3wiMVhXNAWEZDvSVYPioGig9hNYQ8PrX08qjt
	/aUhMSxDhEHjHMKUabSD1jlwYB4YYO1Bg8+pzuPYQOuQnA20hjj8p2jaUD5Y9eL9S2MtWoD4alX
	I7t7mKBLFWROY3MmOE3lHcyD8QNe6GdabZ8hSxbUVfbyycCskQvGzqOvdVNXaKBerVy8Ud3fMn0
	AVKiiPZ3D9A8Pdj7O7qNXdVXag0BXJ5wcB/yzTWeMCKQyAvzdWt5zgZHTDHi3CaABZQmrkH1jIT
	erSiMkedSiOq0/E0rD4Jg6lIMTfN4+x/bvTIlEup8y69AXWNU5foT5NAj2v8GoUjt6JR7xvHY/n
	nhoaA8mmNERKENQWm25Q9Wu1OlXrpzF+Tk6FiYHpG/UI2ID3QGTmG+ZZNzGePfwAP4Y0CM/izjV
	3xa1lj7w9bhTW03hh5Bd1W0fc7ljuM6JhQ8JA/O23kWpzoKzFb2I7pH3svE0PbdI0iI3KDdY2p
X-Received: by 2002:a05:6820:160c:b0:67f:ad87:fd1f with SMTP id 006d021491bc7-6821f487d4bmr4339743eaf.32.1775358287846;
        Sat, 04 Apr 2026 20:04:47 -0700 (PDT)
Received: from Mark-1.localdomain ([189.195.72.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb3ce790sm8350516fac.16.2026.04.04.20.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 20:04:47 -0700 (PDT)
From: Manuel Cortez <mdjesuscv@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	Manuel Cortez <mdjesuscv@gmail.com>
Subject: [PATCH] docs: fix typos and duplicated words across documentation
Date: Sat,  4 Apr 2026 20:03:59 -0700
Message-ID: <20260405030359.7392-1-mdjesuscv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following typos and duplicated words:

- admin-guide/pm/intel-speed-select.rst: "weather" -> "whether"
- core-api/real-time/differences.rst: "the the" -> "the"
- admin-guide/bcache.rst: "to to" -> "to"
- networking/switchdev.rst: "is in in" -> "is in"

Signed-off-by: Manuel Cortez <mdjesuscv@gmail.com>
---
 Documentation/admin-guide/bcache.rst                | 2 +-
 Documentation/admin-guide/pm/intel-speed-select.rst | 2 +-
 Documentation/core-api/real-time/differences.rst    | 2 +-
 Documentation/networking/switchdev.rst              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/bcache.rst b/Documentation/admin-guide/bcache.rst
index f71f349553e4..325816edbdab 100644
--- a/Documentation/admin-guide/bcache.rst
+++ b/Documentation/admin-guide/bcache.rst
@@ -618,7 +618,7 @@ cache_replacement_policy
   One of either lru, fifo or random.
 
 freelist_percent
-  Size of the freelist as a percentage of nbuckets. Can be written to to
+  Size of the freelist as a percentage of nbuckets. Can be written to
   increase the number of buckets kept on the freelist, which lets you
   artificially reduce the size of the cache at runtime. Mostly for testing
   purposes (i.e. testing how different size caches affect your hit rate).
diff --git a/Documentation/admin-guide/pm/intel-speed-select.rst b/Documentation/admin-guide/pm/intel-speed-select.rst
index a2bfb971654f..dec2a25f10bc 100644
--- a/Documentation/admin-guide/pm/intel-speed-select.rst
+++ b/Documentation/admin-guide/pm/intel-speed-select.rst
@@ -287,7 +287,7 @@ level.
 Check presence of other Intel(R) SST features
 ---------------------------------------------
 
-Each of the performance profiles also specifies weather there is support of
+Each of the performance profiles also specifies whether there is support of
 other two Intel(R) SST features (Intel(R) Speed Select Technology - Base Frequency
 (Intel(R) SST-BF) and Intel(R) Speed Select Technology - Turbo Frequency (Intel
 SST-TF)).
diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
index 83ec9aa1c61a..a129570dab5a 100644
--- a/Documentation/core-api/real-time/differences.rst
+++ b/Documentation/core-api/real-time/differences.rst
@@ -213,7 +213,7 @@ to suspend until the callback completes, ensuring forward progress without
 risking livelock.
 
 In order to solve the problem at the API level, the sequence locks were extended
-to allow a proper handover between the the spinning reader and the maybe
+to allow a proper handover between the spinning reader and the maybe
 blocked writer.
 
 Sequence locks
diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
index 2966b7122f05..948bce44ca9b 100644
--- a/Documentation/networking/switchdev.rst
+++ b/Documentation/networking/switchdev.rst
@@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
 monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
 bond will see its upper master change.  If that bond is moved into a bridge,
 the bond's upper master will change.  And so on.  The driver will track such
-movements to know what position a port is in in the overall topology by
+movements to know what position a port is in the overall topology by
 registering for netdevice events and acting on NETDEV_CHANGEUPPER.
 
 L2 Forwarding Offload
-- 
2.51.0

