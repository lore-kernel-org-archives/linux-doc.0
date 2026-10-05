Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C913E4ACC7A
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 19:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229328; cv=none; b=fMaYdNzX5ga08G55XJ2PcQzpBikfUDanIComcknlz9xXP1TyulT9EQgMzR1lzm0cDBxd0OxEvmgMgbJl1e83CVFFpn5S7mJkZ2ol4c9wMLHW6KdDt2Ir4KfIRgOwIwc23IfDl3JfpCs70UD0NV3O2glGxDpR0PWe5snuUjOGvwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229328; c=relaxed/simple;
	bh=JjXTa/+cKg34EhRNO5mzTHP1vpg1WM+OUzkYtXltSHE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BeVzWNl66PZnWr7H1nsS5PQBEpN4oa3mZBM21I1tXUzvFcnfA2iYmeVY3NpcRbshBZ5ArcoKoYLAtp0QgaLsZb4DeTpzY81mM6/UKshCy9+EdESPCSxahizBgVEQvChXjXdjg5mmXLWXcFZg+raLjWAcZHGovHjX72Hgf4+hFZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+TwSyei; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+TwSyei"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so6805233eec.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 12:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791229326; x=1791834126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXet9GVXIs8XuM+O3dt7RNbOl39Pb0NUJxPHM/V2l6c=;
        b=S+TwSyeiRlm+OPjqJPe1+u7GdKKeEcfrF2xzoHl/ED1Almau3dG+wwtahWdbe1sg9T
         FykCEQiJV/w2dpN2T5FELETXCU87agyVTqtqTFEB20jWEgI2Jv9Oc6FsHq2cjOdsqTAu
         jmr5la46mqGiVPYfVUKu5W1PEYb3ptT+wjp7XiQ1DCEUccsCFwh6bYijYhcXHzpeFBhD
         Dz2StDpD1IlSMJVoQGVYNZH/2Ysk7+6UCEZMOT5AQHbqflWmEqBRRxfLUm8yNST0g0LW
         PWQWPoLhzYdn0x6S+wyuc5ngwCqJDB6ayQSrvAHizHZ9mRQr+jyZX/tdbmTYt3hN+tOK
         iBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791229326; x=1791834126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXet9GVXIs8XuM+O3dt7RNbOl39Pb0NUJxPHM/V2l6c=;
        b=rWrqjpNRG7Iub8OZK4MBflwjrlxeOP8RafbVZ/603+l94PrwNuv3TcHi0rI9sh8KFd
         4jg4wljDiqhwbDaQm5bDreh+YkniIGB6bk1ZAnwoJaXh9p69vtOgZ/D/GMzMy391+9HQ
         q3XgQa/mDpWZUHiBs5FxvXWhDNyMrS85v7WU4WrAGREP6FHN/4FnyOQapxrJLzBeRdsK
         f3dwEGMHDegPQyXooNuxYz7VeTQPW+y6frf5LW5IWJSxk4qHp7CHL20eaF8QZkbsV1fe
         eK+WWYoxgW77aqFipDiouvfYHqe5lsMensreAk5njmljGI9k3g0YeFwxduPuZ+WS78Q/
         MdyA==
X-Forwarded-Encrypted: i=1; AKwUvBzMcD783sk5IcTmiVgFBhkXXBtgoGTVXS6rxOpVTyRzztmkSLO4gd3Qtu8f6bcJtiBuhpeJcFIKfMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfC9xcabcH/aiTlOlMjmMfOs9303WZwYZ5WC5aK4EQeG2nl07e
	8usX5J2ZGsynwo+tZofggLc6QWcgOMJYxxzIQ4bPlQwsG34CrVGuJVTz
X-Gm-Gg: AYBFou1CQUOmpf0sQ42ic8n9IG5fp1TlCB1wNVxcsT8fKLs+l78I/eo0W+FjKyJbfyW
	UthK2N2bMGaBtitwEvtaZ0jpmLsApQy8REjt0vPXpXyGf0B5eUMrzoe497aGMS9H89Fq8NFwOjc
	w/gwY5lE8TaEFJRQPUiK6gSGhOuDjzJNGUxmay14lZXbg2FA3oDzP5Vv3Y5ZxfMJBYHXqrq84kH
	tGW9Gzmr9T7HasUdGQrnqJuFA3wokfvCsUCOKmN231mpzulGCc4k2J4TXnadChjDUXKlTVxQT7Z
	TJ4O+u2va/UcRyJVhiMYGT8Si5cVWHWtFM6QNUXu6YovYiIbvmKW6RaC4L/BZwHvw1lquUsO/Ze
	mSQWeaxX1VJT7ru02pyODeY1ZHzKhCcQK7xANZn3AIt+3MN/cT9YYQ5NyczyJyF/V/s88YUcufY
	JdH21JM5sYhIKAbVS5T7QngD0WDW8ixfAKYDTI4/L4u+UtkaeF31sTgO7POD5cMTDhXBJXgdz0h
	Uob+Ba5ng2+fcNTaXI=
X-Received: by 2002:a05:693c:69cd:b0:351:39db:42db with SMTP id 5a478bee46e88-35139db48d1mr3032371eec.20.1791229325700;
        Mon, 05 Oct 2026 12:42:05 -0700 (PDT)
Received: from hp-OMEN-Laptop-15-en0xxx.. ([122.172.84.229])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b73111sm444485eec.31.2026.10.05.12.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 12:42:05 -0700 (PDT)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH net-next] docs: oa-tc6-framework: Fix typo in SYNC bit description
Date: Tue,  6 Oct 2026 01:11:35 +0530
Message-Id: <20261005194135.64584-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a missing space in the SYNC bit
description: "bitin" should
be "bit in".

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
---
 Documentation/networking/oa-tc6-framework.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/oa-tc6-framework.rst b/Documentation/networking/oa-tc6-framework.rst
index 0feda2f9d..2545ef694 100644
--- a/Documentation/networking/oa-tc6-framework.rst
+++ b/Documentation/networking/oa-tc6-framework.rst
@@ -278,7 +278,7 @@ SYNC (Bit 29) - Configuration Synchronized flag. This bit reflects the
                 register (see Table 12). A zero indicates that the MAC-PHY
                 configuration may not be as expected by the SPI host.
                 Following configuration, the SPI host sets the
-                corresponding bitin the configuration register which is
+                corresponding bit in the configuration register which is
                 reflected in this field.
 
 RCA (Bit 28..24) - Receive Chunks Available. The RCA field indicates to
-- 
2.34.1

