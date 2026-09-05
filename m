Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B13C1978
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597420; cv=none; b=rFPpart6rtxrIsvmKnVapEg4Ugl+8YuYNY+/Fghs9FnSj/Iebdsk3fO6S2FDn5qpHILzFS8xIUKlVjI8Wh5qRb9dsvFXApZ4CrVORd3qSjL4WwPs0Hc6cTm80f/or0UbmPNhQ2jNWmwBzPr63tesF1w7oxWfkoARyq2mC62XGyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597420; c=relaxed/simple;
	bh=wgggDzjHY+Ah8vECxyGt8Xj8OVmFIHcQoKQNaP/el0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HajBMDx7GuMJVZZsPkAApT0T0uHJ3Qsv7izqq9bTwncAanQDJhLdo/OEzq39EzBjYpz6EV6sn7Il/PyS63TeduYcAvZwHiKa2HwnJPue6ui3MKJRu3MRl7RX7SmUsBWnM+yZYhk2Q0lWndvaXeKan2rtVwiYDRenj75VH7XbAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqQL3s4Q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqQL3s4Q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso15921375e9.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 01:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788597416; x=1789202216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ynaw8qDzMXNFxXhqOFzgHygfT9MJ5kBajiEceTkzYr8=;
        b=TqQL3s4QiteOfHmMHxZLjjyRG4GapJvfOYGHiHSO3Enuk8RdI7KMBObTUXWSnnD/Uk
         qc4aV5VIx7EgUnDw1fW5Ejr63JYchP3dn4955UOtBXX5+DbtWwzO0Ptefryy3vG/HKdw
         v7GYox9BiJkZnmmrYHQv+SqHrX8tUlPYhD6NLtitgdxhmfU1TlRYzyfAm0M7CMapUO1k
         DzaSlDG2HPzlhCAMYH8O3J/D8orB5NdAjihEfyFjJZT1SSaIz1iQ5kHkEyUHkxB+DGGr
         DwvI86rIF1I9pgc7RsykIsuanhkg7Nglz7TXXnO9xVrvJgTOUAPF3JLlka+OQsVRwp/L
         n0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788597416; x=1789202216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ynaw8qDzMXNFxXhqOFzgHygfT9MJ5kBajiEceTkzYr8=;
        b=HkvnBx4rS58WZFn+0teJUXBNygVirzWpIXmLJTxr83FFzueIbiS0RD8XnOf5mpdxoR
         Z1EhN7gnBcPMZCYXH0JLVdZig1sfVV45+Qf9TdhLutre281SxGUB+/06D6UiNesIQPOC
         UL7zMwg8P1jMP9gTK1fNkSSGlYxY8oMMJsHybqv1U+eHjX4f5W0Xmt0vfNDFSsYf8dwF
         /rXrR4JhjoHnPwSaIr6m76DOw0sQ+ogD3olUXQeg1ENxmA97RaYKksHpuZu2HBp43JU5
         yvTxOmZ4zWPE47plqz6odm1H+/c7eUDOIOndFIYTtWvBNSx90B3KUWnYQDNzvaCdl6ms
         iZyg==
X-Forwarded-Encrypted: i=1; AKwUvBw/q30SxDg4ibFjCKTAgkCsgZr9HhJrarn1vqBnDuNqXNoUgt8Bo2CyF2lVthhSiApYhI4o8af5wQk=@vger.kernel.org
X-Gm-Message-State: AFuF++k8F2S5bLiQQCWdf4Rb0VObCNcBmEiLAeMj9+vuNtFlDML84gi4
	LeErZqwO6dHnokc/Pe/digMU5k5tutyzpy/B7nMofIqIDyDq/YZaJNMT
X-Gm-Gg: AYBFou0EjiGhi9bTZ7tGUlOAEiG3zw54Ih7H4sPmGpMGg/ThKq/pU3pOZLFLEIYXJzW
	4o0iTTMAOtD0mhNWL4e/aLeXRt/QY83JAVir+/W2fb8dfi8d224laSuxdlmKNHzQcBYqlc1OcL/
	oqLyyrIR00LR7RTOKFKsiR2uWFqQ0tJCSGPMlO7i60BDyDG6ol5s+M12mssEeDtlHE1wDlU/B2m
	Zp1gxGc5XkFd0+tmXQ69olH8zFGedff9dhbeX8vi++YoGuToeH8TrMcYR1UiU4KsD5dmBnvHfsg
	lDxBgIViwRiMO1cpH51lSJrJxYTySbKoeSi02GO0Ts2ujDHqZ5nCZQ500EbV+cI2W9m/zh6i/gN
	uHr9qy9WKEUd+raxIAkdqkdy8V+jOF3+33s+1yp7iMzINABxGILOpIARGGmpVPOu/eAowoqUtYm
	nQQj6bjSVQdukoFJsCa1ws9RTwaU2+mh/LUoVjYreWV7etnZ/uzUlQaSRAKGaxWB2JPIf8Wodae
	+QMZLr6/eIvoE/vbmv7SpmRHDO+nQEXeVgsR+4eHUjr1rTYiRC5ti38ulG56ejzRmz5vNYYQr/Q
	utcrYi8bKqyh71NIMHGifFsA1MVNTSPwQWqtAvZQU8mzPUalltauCDs4dw/DG2o0gpg=
X-Received: by 2002:a05:600c:524b:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49cfa20cd2cmr88077965e9.31.1788597415955;
        Sat, 05 Sep 2026 01:36:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm517436035e9.0.2026.09.05.01.36.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:36:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-serial@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH] Documentation: rs485: Pull uart_get_rs485_mode() from serial_core.c
Date: Sat,  5 Sep 2026 10:36:48 +0200
Message-Id: <20260905083648.39026-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

serial-rs485.rst asks include/uapi/linux/serial.h for both struct
serial_rs485 and uart_get_rs485_mode(). The function and its kernel-doc
comment live in drivers/tty/serial/serial_core.c, so the directive has
never rendered it and the section shows only the structure.

Add a second directive for serial_core.c.

Fixes: 0f4648a1a6d3 ("Documentation: rs485: Mention uart_get_rs485_mode()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/driver-api/serial/serial-rs485.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/serial/serial-rs485.rst b/Documentation/driver-api/serial/serial-rs485.rst
index f53043d21071..98d8d83718c6 100644
--- a/Documentation/driver-api/serial/serial-rs485.rst
+++ b/Documentation/driver-api/serial/serial-rs485.rst
@@ -50,7 +50,10 @@ RS485 Serial Communications
    matching to the current configuration.
 
 .. kernel-doc:: include/uapi/linux/serial.h
-   :identifiers: serial_rs485 uart_get_rs485_mode
+   :identifiers: serial_rs485
+
+.. kernel-doc:: drivers/tty/serial/serial_core.c
+   :identifiers: uart_get_rs485_mode
 
 4. Usage from user-level
 ========================
-- 
2.53.0

