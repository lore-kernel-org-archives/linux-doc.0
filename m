Received: from mailrelay-egress7.pub.mailoutpod2-cph3.one.com (mailrelay-egress7.pub.mailoutpod2-cph3.one.com [46.30.211.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD3248F64
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764688017; cv=none; b=tZkyAn8M+19MFxpCQoexrv5ps/UenLZRkTVCgAtzF5V7v6VxyMqSL0BHcbADiEkY86ysc36dtF/6Qw1kmL9QCuXnx8iYTBabC5k7P5mfg4WayqRyMhEJKEv87SWo5mJfpmW76eSlZa1XKVOsEM3cdPS/62RyJ50x4u15U3O3/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764688017; c=relaxed/simple;
	bh=rjMDMJFhEj+C2UdoJ0q5gnddVZkys0tMXP02H5+d2yU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J89qp8P0StZUSIYm1HnhxlVYqWTdXBVjccXuaDQmwnrev0wyaW78PCLFHQDJQ5rtTe1OOntNhhe4lleZP4j6ff77qlfBjDIb9HfYTKh778jw6zVbpawYsvxpdazCTT7Ww8EWY6O9s7eGaMeq4j3wCrZMJnjMbtOqwK06L95b4eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knutsson.it; spf=pass smtp.mailfrom=knutsson.it; dkim=pass (2048-bit key) header.d=knutsson.it header.i=@knutsson.it header.b=DG7Ee8pW; dkim=permerror (0-bit key) header.d=knutsson.it header.i=@knutsson.it header.b=HeT3T9+x; arc=none smtp.client-ip=46.30.211.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knutsson.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=knutsson.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=knutsson.it header.i=@knutsson.it header.b="DG7Ee8pW";
	dkim=permerror (0-bit key) header.d=knutsson.it header.i=@knutsson.it header.b="HeT3T9+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1764687943; x=1765292743;
	d=knutsson.it; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=RSmK+2vb/lcZwAyywl7Tgh0Ajjebs2LHhuHMtX0u3+c=;
	b=DG7Ee8pWmEBUM+aQAetVx9EJpkcUjikPWYny2UuTwpXIPVun3+KfjsNse4yv3bOpPxj4fuSM2EbW3
	 AJN388jh1EnvX2US3Ue+wjSYvOvr5WUARW4HXD2Nf3QYTPE56IaS62X5U1JHgdNjgfitq/y9zUGhOK
	 mf+lRNxS5C2hlUPARwxz0vaLOL67+Xwqewx/9+XXk5zIBvJRvg9TtoGx3/p8olBLzDEyHnoStvKIWd
	 gsbQRnr3cxtyac4KuabV7o+i2QSChGKP0XMMg6m9EyI3Yxah/j19ZGrV3akfr3QPI1qp4YX6uz60jQ
	 r143MA+UeMR3OXI+JbNtSWZ6INqkxhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1764687943; x=1765292743;
	d=knutsson.it; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=RSmK+2vb/lcZwAyywl7Tgh0Ajjebs2LHhuHMtX0u3+c=;
	b=HeT3T9+x6l9ZtDRk0fSd15VhEiFfPM9A0HgB5aBc/RJEsU3yNRCjkHJFP6rI056e9Png4gY07vDIM
	 bJSOT62Dw==
X-HalOne-ID: 5f53a412-cf90-11f0-beac-fb5fec76084d
Received: from critbfk-Desktop.int.essentialive.dk (0x573e6412.static.cust.fastspeed.dk [87.62.100.18])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 5f53a412-cf90-11f0-beac-fb5fec76084d;
	Tue, 02 Dec 2025 15:05:43 +0000 (UTC)
From: Brian Knutsson <development@knutsson.it>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Brian Knutsson <development@knutsson.it>
Subject: [PATCH] docs: tainted-kernels: fix typos in documentation
Date: Tue,  2 Dec 2025 16:05:34 +0100
Message-ID: <20251202150534.885750-1-development@knutsson.it>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two minor typos in the tainted-kernels documentation:
- 'a more details explanation' -> 'a more detailed explanation'
- 'userpace' -> 'userspace'

Signed-off-by: Brian Knutsson <development@knutsson.it>
---
 Documentation/admin-guide/tainted-kernels.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index a0cc017e4424..714186159536 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -63,7 +63,7 @@ this on the machine that had the statements in the logs that were quoted earlier
 	 * Externally-built ('out-of-tree') module was loaded  (#12)
 	See Documentation/admin-guide/tainted-kernels.rst in the Linux kernel or
 	 https://www.kernel.org/doc/html/latest/admin-guide/tainted-kernels.html for
-	 a more details explanation of the various taint flags.
+	 a more detailed explanation of the various taint flags.
 	Raw taint value as int/string: 4609/'P        W  O     '
 
 You can try to decode the number yourself. That's easy if there was only one
@@ -186,6 +186,6 @@ More detailed explanation for tainting
 
  18) ``N`` if an in-kernel test, such as a KUnit test, has been run.
 
- 19) ``J`` if userpace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
+ 19) ``J`` if userspace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
      to use the devices debugging features. Device debugging features could
      cause the device to malfunction in undefined ways.
-- 
2.48.1

