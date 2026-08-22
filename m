Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A8138E11C
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386977; cv=none; b=Y+Fqw8dYIXa7+y+rj1o68ulImA8jrQQmeRouDkOJgHyFHr5sbL7LKRALls0E0mw9KsAAA47Uru+6eOL2oFBRfOBVkEQ5NDyFukwceTSMblHJJUa4n9vHBMwoKlUtDssDoG+uBQ0gRBGczSs40zQ6GwkDMhrMyI8B917SbZ65gNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386977; c=relaxed/simple;
	bh=3rt/64aWXxfEakmLulSwfmtcq2CGlvpKxUpO6Kn4PYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZwQ/xnrGQ1Hhl4nJR6pz6ugrei8bR8Ih6r/DU1wKOinfj4Zt+6EySb6JUzk9Ofixxwo/Qhz4vuEfXDMVKHWOzohRPIafWSWvHH/GHtYsuFSAdfM3796Jjf2kiFYrzZgx8AVJzMJvT9vEIhXsqsqqLz/wc7GuxaYQQYphLE6E2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BW/DQHvp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BW/DQHvp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c207cb16cf5so288781066b.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 01:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787386972; x=1787991772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBSz4odaayjEagqR609M0EjA8NPT72QKpmN3i7TksVs=;
        b=BW/DQHvpwRdNYbzlUXOeQXQtAjIzkqRupjR/bPiUqzgS7qmGJmeHMjUbGiV4hfEwSR
         uvIBVeW/5xI4uo71wMaKQO9IAlOq195QZWjib901zrq86OFdnprx7qFLoDROaHFbzk01
         q3GpAaC71LOXMSpMWGuxN/Iy5mdrUJ9tJDuVo/Wtzbr1p7Wff/AfKqiP7UQGBB2SbJFo
         pOYcXNd8pYPOrW0dmuCoS1HyqOsZWl9K2lOF9dZYpMNNDzX6x+k2Li4ett9eiUHcNUWU
         PT+NDRLeAIlGAEjDBDqFu2til4BtI2SlfeKZ5eTthT/zTl5sink1mOQ9XUR/fHSlbKHF
         zRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386972; x=1787991772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBSz4odaayjEagqR609M0EjA8NPT72QKpmN3i7TksVs=;
        b=BxmRC0IBy1Lpy8gAJKa4KdYyKYD0NulwmEsyzl7obyshmqK+zk4LwhY9JgsHX9puCG
         DjK1yQzpgH9zdarSfBOBTdKltzl/MUNmGWsbwgzaWVO71lCZFRIKhqLET7vMWw4uHRtk
         kYMRUsWm0K2fHDPQVQCe3Bnsyb/HLb5plvgH3KZz0iHiJZZkwOXQn4AvwL4WFlPqEKEj
         f9g7IPuNHhAr3x028OBwmSrmNpDXJynM8oAPF8IIVPIujTtKGtHEfwzuC/nYzrB+oRFP
         ysE1enRcWybMdogsVZ7lL03Y4AYTLGUe6W0SbDud2sbgnm4NrdoA85jkUuPj11fE7kB0
         OMLg==
X-Forwarded-Encrypted: i=1; AHgh+RrcpDelzWaxXFNx74cLwB0CRq340LXy+7kZOnG0N9wNIfDEGfZSQCBAnTMKiLVJUDaEl7hApgNvq9U=@vger.kernel.org
X-Gm-Message-State: AFuF++nxbi+cqXa7i1ZvbPPkJhvi4/OtlUuUuA8eJmxAhJG9AwKS85yN
	SciUiqiSEISmSAaf8Q8yrhVlt0ynLx75Px3do8irlIhxGhYwOwXUVR7V
X-Gm-Gg: AR+sD112g2N5BUE3saH8kojaNSAHXu2cUYWQ5ERmayyI92916o1z7HECjc+0qmIbCaa
	ygr9+t4rYk3JTFiYzMTuwfqSYBnhcswQPcvswFtx1FN5cIUWnHRmfdTdOxlUkJNSFeSMtle7BXv
	H1Mt9q+6idMt8elJcf2gWO4vP8suNRPtyaazHB5IuBmrOKeqy4+0tbFc9/GfznY+lZ5bdNetgeX
	i+17c3dudjK/5vdUef+2IzdS/JA6UBk9Ppk5iWoMAFZgDHUj7Mm4D+SulxtCQq4VQA6WvDpvEwu
	3w7BHaN80Zxt6/ihHZYatjgWEY28W/IKG4E9604EsSqPYI//BW6HEf8B1hqikAt6M54IPDnqYsI
	fXaoPW++I+z4/NMrNsgpP4Uh+UYVZCM4AOVENLYjLY4mJD2sJyw0wLvlosFKDGY15EXAfC8fv/j
	XBQ+BJnzKLlycCHoRbMKNbkCZ4xgQdlAVCtpsPfxNyNPp9fMYrqOULwJogUGEPpj9KvP8F1vJT1
	0u0TFYvpCoP/gb/2bcAG4zkEqn/yJnGhQR9E7IU8XzUe1T7JhzqZ26j6nTNMf20FWydEityz00t
	aCCpVCxkmQiya0y5D+E6+Yfxm1jj5P1fK3qvHRBf7M2YuOsm5CAx+R7Z9Y94Q6/BSYlm7/D6lQ=
	=
X-Received: by 2002:a17:907:9307:b0:c12:1651:17b2 with SMTP id a640c23a62f3a-c246a387ba6mr1352476466b.9.1787386972087;
        Sat, 22 Aug 2026 01:22:52 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm241667766b.51.2026.08.22.01.22.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 01:22:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-parport@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: parport: Fix FIFO Kconfig symbol
Date: Sat, 22 Aug 2026 10:22:47 +0200
Message-Id: <20260822082248.89651-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ReST conversion shortened CONFIG_PARPORT_PC_FIFO to the nonexistent
CONFIG_FIFO symbol. Restore the full name.

Fixes: e095f0711b49 ("Documentation/parport.txt: convert to ReST markup")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/parport.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/parport.rst b/Documentation/admin-guide/parport.rst
index ad3f9b8a11e19..4aef45262bd49 100644
--- a/Documentation/admin-guide/parport.rst
+++ b/Documentation/admin-guide/parport.rst
@@ -273,7 +273,7 @@ If that works fine, try with ``io=0x378 irq=7`` (adjust for your
 hardware), to make it use interrupt-driven in-software protocol.
 
 If **that** works fine, then one of the hardware modes isn't working
-right.  Enable ``CONFIG_FIFO`` (no, it isn't a module option,
+right.  Enable ``CONFIG_PARPORT_PC_FIFO`` (no, it isn't a module option,
 and yes, it should be), set the port to ECP mode in the BIOS and note
 the DMA channel, and try with::
 
-- 
2.53.0

