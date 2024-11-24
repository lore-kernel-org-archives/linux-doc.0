Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED73FBB3
	for <linux-doc@vger.kernel.org>; Sun, 24 Nov 2024 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732444226; cv=none; b=pjD3/L5KfMvoQ/bbW21PJV5ZQUg0Tvc50JNv2qw+B7KOSjThW08vRq5irrA9JmIHpUNXny4xrgXBENNWYqS126tLlUiYLFavSImQ2zkVeLc7VyABZQLekXDvl3Z2piv4moMTKrjcHUJtejcuQgPCaRqMenTr9W9+0VN0APCCuCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732444226; c=relaxed/simple;
	bh=4SrUiyxlIelnYHG/hYDrd3ixYb6F8NuMXUpQ/Wn69/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUwM7Lt2D0+5V8DpNcQoXRb1Y4FhnMwBrpBaDDty6/xUbq5hJSLKVB4L/hdqPsObBapxFuWOVyRasNRwbqYN6/eTmRA6xGG1fwS7AA/WE+KklD5cw1Iwdk4fMzIUp7ENZ8qMv5Jm65wdIoIJfI/gqlnsGBGRoaW1gpRxvlGdeFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=SyIBlu/K; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="SyIBlu/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732444216;
	bh=sPRD00FdoMbZ/n35hTaA/kSHOm/Dnrk51VP0TcINavI=;
	h=From:To:Cc:Subject:Date:From;
	b=SyIBlu/K3E9e7MBmBl3Bc8hsEcZEQ0ecvwznME+fEsLhCt2AMkcldJqVd7S3d0S7f
	 twPiJY3/zvuAOepK0xtcrdCzC2EOy74kR2nCM6/Ksh6PbKcQ3LWEPBYu/JcIiVVa35
	 te7mZ521WFEXEGHt8DVPpThFNp17Az0c3GPfDzlrhPJ2U7+TNHT833GOOV10FAuMVZ
	 0zdK7Tf4T4o0wwxQPIdpNf8eWACz+oW6F+ziRrV+BBg83pV3taRfLaeEC3Vdd0YEKx
	 ik2qj/DRSudLY3XZ3JSilm3WmG1o9CkShxYWWcpLhvr7gH1Qq3hW7rm0W42pRR+taH
	 PZSueYG05pJIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xx4pw59YTz4w2L;
	Sun, 24 Nov 2024 21:30:16 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: kjain@linux.ibm.com,
	<linux-doc@vger.kernel.org>
Subject: [PATCH] docs: ABI: sysfs-bus-event_source-devices-vpa-pmu: Fix htmldocs errors
Date: Sun, 24 Nov 2024 21:30:06 +1100
Message-ID: <20241124103006.2236073-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix errors during `make htmldocs`, eg:

  Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu:2: ERROR: Unexpected indentation.

Fixes: 4ae0b32ecee7 ("docs: ABI: sysfs-bus-event_source-devices-vpa-pmu: Document sysfs event format entries for vpa_pmu")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20241120171302.2053439c@canb.auug.org.au/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../sysfs-bus-event_source-devices-vpa-pmu        | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu
index 8285263ff78d..a116aee9709a 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu
@@ -8,17 +8,18 @@ Description:    Read-only. Attribute group to describe the magic bits
                 Each attribute under this group defines a bit range of the
                 perf_event_attr.config. Supported attribute are listed
                 below::
-			event = "config:0-31" - event ID
 
-		For example::
+                  event = "config:0-31" - event ID
 
-		  l1_to_l2_lat = "event=0x1"
+                For example::
+
+                  l1_to_l2_lat = "event=0x1"
 
 What:           /sys/bus/event_source/devices/vpa_pmu/events
 Date:           November 2024
 Contact:        Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
-Description:	Read-only. Attribute group to describe performance monitoring
+Description:    Read-only. Attribute group to describe performance monitoring
                 events for the Virtual Processor Area events. Each attribute
-		in this group describes a single performance monitoring event
-		supported by vpa_pmu. The name of the file is the name of
-		the event (See ABI/testing/sysfs-bus-event_source-devices-events).
+                in this group describes a single performance monitoring event
+                supported by vpa_pmu. The name of the file is the name of
+                the event (See ABI/testing/sysfs-bus-event_source-devices-events).
-- 
2.47.0

