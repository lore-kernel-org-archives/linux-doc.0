Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA841A275
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261690; cv=none; b=hHjhKy2FagL2nn7kvOfeJ247mizj4eekDi0EnZv9FAQaz9BFtrbL9Bkm2hyMeB6WxRLKepQ+QkhWKzpQPHaskuCG6TnylWhrhxpTURevjJQl5FmbUA7hIWBw04nfWgc39/QZmhondpnFw2UO9BFcVlhywYS8R6S3L68YYzFDWnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261690; c=relaxed/simple;
	bh=8+5gxCh668F3mF0KyhBhYmNThSSlsRvOAW4fyOGH/Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTX1VX1E16XFytsiW9hFaV5k6Qa1qlfcu0VGOFaTu8dN/Y0zxAanXmQWxQ/9P8nnXcR9ag/1HZCrkNdGHQ9SFWLdX7s8qXHOiqXPU9ka/Acznn1DJrT0GtQAwD7tmUVhVzL/Xvc4v52NmlLEyT+F6S5Dw+qOpceSGmPPCPiSbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgcPEZrE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgcPEZrE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27c369f8986so56077715ad.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 05:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762261688; x=1762866488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wa5CJj00Z6mNBnBUafBSEAE70PDhD8H7mdKui4WwIlQ=;
        b=BgcPEZrE+abRoWkcX4q9K29g7ILbKC6qVVxuQZU8j55PDpkhKfFu7blWwVFzA/fDuz
         McK+f+ZyM0jubBJuAG2NhdRQl/i4SYbfjMzkplqroxv3zRmHzGZUWsL+6uyWZSYcpJg2
         S5cjvJYVUIs0d+f08XmVi5y4ECXshOxCODtjZBn7Kokazpqbw0pyvBaK/M13mA7bcXI9
         fWvLH43KKx7EdG1rOKH6NcMpmERNGA49cd8stE7QX1+1U7vtaJZGNOqwEVEnJBOX6FZ2
         hhtfgKiVBJrEm14gr51pl3lrO0sxL2x1MiimqAvKGIbkCV7tLhzmMW8XuB80vA+FtxSC
         vtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261688; x=1762866488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wa5CJj00Z6mNBnBUafBSEAE70PDhD8H7mdKui4WwIlQ=;
        b=OfIAFTQmixDfipgLpdn72BRcmdr6S1QugvNqu2uAnOn+Nx8WTQDTupuN+xaHNbNnIp
         xKZudV6SApCX4adFqm9xbYPaTUCIBzIyENH6/XI4Yu+s3ks9E4s0UzPfplCSLMDIVq8K
         JpB8slHM9vdEwhzg+iAUVuxHhBhEeTwlb/Xl7OEAHDU/qgdSr7ilzC0Bgp6kwMlOQk+U
         j5IxZbpAErFjUZi5N9b4FaL1dkLoUoftG1obdKC3KMH8FLVr8KJdM4zgqWM1dWgQ5WHt
         N2EuWJPalwZgs5cWHN2SUta5/09geGE2TX0FznoPsbFd+/KiEEE5hyLppxGyb7+IvwGI
         bmkg==
X-Forwarded-Encrypted: i=1; AJvYcCVkYyvXUBVwJ0mq5hyKi6EloGOBVhVQTr7pAhMsOL5wNcKcIcO05zoWKALIifIj0hwDHmnI+lGVHNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN7MrJ7h+XlDj7JyEipWCRRCW9D1FuFZRgaIfzKFk9dGmfnR9t
	LSuKTiSqmkT8TbolojNc9YRXGIrNCikLbpNZZ25VV7D4mmVq0dobhBE5
X-Gm-Gg: ASbGncsUMLWbtHcpzya+x1IFLg2RkAt2bd79NsvTi/B+Hh82uqPymEYn4WLMjdfUeP+
	MmZZu1i1CteNpDDdce0Y+b383eA9vEUR+U2jZGlYpWy87q3VhwXrHu1kxWJywDzxaCkreGNmG1i
	JqPt2DgVObJLznumMytz3g1xo5KyPB0bvHzqhAPwdl4Mx1TevJUDFG9p2Bygqi6auBBwR9Wvy83
	JqnqeP8llVwdMUG0+DU/3+ZWlI4ngDg2lXBmmZq0upbhfj6fCBd7Dvl2/yq+lipDKsiWs6ytlQt
	7h3FqfT2mKRKOdQ/1ID6JauJoD6THrMwQR4xmE0RVfJTO7dujt3nQVmHpIG5T+Aa5Uj8zDESQh5
	nUgN3vOzyQufUYFHQvjdyn6bSBEFIPJpGvaiIaRYR2Cn0WvjFPZwOlx5hzgHlm9CNCjA47rVlIS
	y3
X-Google-Smtp-Source: AGHT+IGz6V0F1bsEXB8aPRmEqMqtcqMbmrPgPF7sIkH71vU9791usOLQxoir1Yyrp2/7BuMeNg88QA==
X-Received: by 2002:a17:902:ea10:b0:295:6122:5c42 with SMTP id d9443c01a7336-29561225ee2mr139342945ad.24.1762261687638;
        Tue, 04 Nov 2025 05:08:07 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd586fc86sm3013202b3a.44.2025.11.04.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:08:06 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5ACD1420A6A8; Tue, 04 Nov 2025 20:07:59 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Balbir Singh <bsingharora@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: taskstats: Reindent payload kinds list
Date: Tue,  4 Nov 2025 20:07:50 +0700
Message-ID: <20251104130751.22755-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4652; i=bagasdotme@gmail.com; h=from:subject; bh=8+5gxCh668F3mF0KyhBhYmNThSSlsRvOAW4fyOGH/Tg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmcvxzlTBl07Ga5Mk5OnTlr2Tnppbzb+fRkbRmbLnHV/ fj/f799RykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZSnsfwV+ptxYGmor2/xeaG 9e8KFy4qVZn0ZneklFJzMWdPJlcrE8M/q4dhCyr7JV3ORWT9WJr2etXqln8m3z5G8OtxqvkwMU/ lAwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Payload kinds list text is indented at the first text column, rather
than aligned to the list number. As an effect, the third item becomes
sublist of second item's third sublist item (TASKTYPE_TYPE_STATS).

Reindent the list text.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/accounting/taskstats.rst | 52 +++++++++++++-------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/Documentation/accounting/taskstats.rst b/Documentation/accounting/taskstats.rst
index 2a28b7f55c103e..173c1e7bf5efa4 100644
--- a/Documentation/accounting/taskstats.rst
+++ b/Documentation/accounting/taskstats.rst
@@ -76,41 +76,43 @@ The messages are in the format::
 The taskstats payload is one of the following three kinds:
 
 1. Commands: Sent from user to kernel. Commands to get data on
-a pid/tgid consist of one attribute, of type TASKSTATS_CMD_ATTR_PID/TGID,
-containing a u32 pid or tgid in the attribute payload. The pid/tgid denotes
-the task/process for which userspace wants statistics.
+   a pid/tgid consist of one attribute, of type TASKSTATS_CMD_ATTR_PID/TGID,
+   containing a u32 pid or tgid in the attribute payload. The pid/tgid denotes
+   the task/process for which userspace wants statistics.
 
-Commands to register/deregister interest in exit data from a set of cpus
-consist of one attribute, of type
-TASKSTATS_CMD_ATTR_REGISTER/DEREGISTER_CPUMASK and contain a cpumask in the
-attribute payload. The cpumask is specified as an ascii string of
-comma-separated cpu ranges e.g. to listen to exit data from cpus 1,2,3,5,7,8
-the cpumask would be "1-3,5,7-8". If userspace forgets to deregister interest
-in cpus before closing the listening socket, the kernel cleans up its interest
-set over time. However, for the sake of efficiency, an explicit deregistration
-is advisable.
+   Commands to register/deregister interest in exit data from a set of cpus
+   consist of one attribute, of type
+   TASKSTATS_CMD_ATTR_REGISTER/DEREGISTER_CPUMASK and contain a cpumask in the
+   attribute payload. The cpumask is specified as an ascii string of
+   comma-separated cpu ranges e.g. to listen to exit data from cpus 1,2,3,5,7,8
+   the cpumask would be "1-3,5,7-8". If userspace forgets to deregister
+   interest in cpus before closing the listening socket, the kernel cleans up
+   its interest set over time. However, for the sake of efficiency, an explicit
+   deregistration is advisable.
 
 2. Response for a command: sent from the kernel in response to a userspace
-command. The payload is a series of three attributes of type:
+   command. The payload is a series of three attributes of type:
 
-a) TASKSTATS_TYPE_AGGR_PID/TGID : attribute containing no payload but indicates
-a pid/tgid will be followed by some stats.
+   a) TASKSTATS_TYPE_AGGR_PID/TGID: attribute containing no payload but
+      indicates a pid/tgid will be followed by some stats.
 
-b) TASKSTATS_TYPE_PID/TGID: attribute whose payload is the pid/tgid whose stats
-are being returned.
+   b) TASKSTATS_TYPE_PID/TGID: attribute whose payload is the pid/tgid whose
+      stats are being returned.
 
-c) TASKSTATS_TYPE_STATS: attribute with a struct taskstats as payload. The
-same structure is used for both per-pid and per-tgid stats.
+   c) TASKSTATS_TYPE_STATS: attribute with a struct taskstats as payload. The
+      same structure is used for both per-pid and per-tgid stats.
 
 3. New message sent by kernel whenever a task exits. The payload consists of a
    series of attributes of the following type:
 
-a) TASKSTATS_TYPE_AGGR_PID: indicates next two attributes will be pid+stats
-b) TASKSTATS_TYPE_PID: contains exiting task's pid
-c) TASKSTATS_TYPE_STATS: contains the exiting task's per-pid stats
-d) TASKSTATS_TYPE_AGGR_TGID: indicates next two attributes will be tgid+stats
-e) TASKSTATS_TYPE_TGID: contains tgid of process to which task belongs
-f) TASKSTATS_TYPE_STATS: contains the per-tgid stats for exiting task's process
+   a) TASKSTATS_TYPE_AGGR_PID: indicates next two attributes will be pid+stats
+   b) TASKSTATS_TYPE_PID: contains exiting task's pid
+   c) TASKSTATS_TYPE_STATS: contains the exiting task's per-pid stats
+   d) TASKSTATS_TYPE_AGGR_TGID: indicates next two attributes will be
+      tgid+stats
+   e) TASKSTATS_TYPE_TGID: contains tgid of process to which task belongs
+   f) TASKSTATS_TYPE_STATS: contains the per-tgid stats for exiting task's
+      process
 
 
 per-tgid stats

base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
-- 
An old man doll... just what I always wanted! - Clara

