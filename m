Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EBA1643D
	for <linux-doc@vger.kernel.org>; Fri,  5 Jul 2024 04:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720153184; cv=none; b=t1qwDj7R1o2oeIfXofPK4TdtxzpDL6XBzB80AIM2jX03bHF5a3ekEh2g6PjtHyPKmMts571vE7iSAqbBgnHxPavYhcSOX5vBHFT17w9ONdMV0wC5rHHP9/HQUNb9F8h6PKq2L7fKSJXY+39TcIVEF2SkDJfG0/+BbuyrQOihVOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720153184; c=relaxed/simple;
	bh=gNh0l1AFuu3YpgwHKDKlh6Df9CuXiju26t26NPlmGKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgUQOZBjNSEDhAh+B68kXIo1jzcitswZkOklTludfqgk7lhomvlS79+GLToz/NV4RBC+WzQVhFEhfRtkCW+clSBQ/1tg9hPqpIfRJLWT7NCZUMNzbY4erL2IngDxktApYeEBcbgk/d0A1eHlQPToUz7Y4Smnq+DYopEGt1N3PhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=qDrNsgoo; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="qDrNsgoo"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 38A7B2C0241;
	Fri,  5 Jul 2024 16:19:39 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720153179;
	bh=JNA15ySDVBqVrJEPESwywKcVnn+Zm/UvWWTM0j769ew=;
	h=From:To:Cc:Subject:Date:From;
	b=qDrNsgookMTzH+KW+uBOWP1EYYpzIzmRG2LK0g4jsK1yCA4uL7XxoAbPHuqLA5qXx
	 ktj/D+dcWCt0QZrFojson6jJL8lLLfZ9RZuT2zH/OXzontZezc6Z7d0S1DF1nP+Wbl
	 eRQpNVMxYaZzBFogPwFyWHp8idNHiP69Ey1Brsae/eq5JdiHe3xgnv+1XAsAxXhfsc
	 mfWXEToSJSq6oCu0lrKcfsysSH18DsSgjg7vX0rRWJSiZ4SyAVuzMfl5OswZ/oE5Bs
	 HxDR2hS+8olIFU7JhdCLT/fKsIXu8/95lOK7c97nHfrXK4OPbtpXG2mQu7/NmKfo3c
	 J48t3jpr3UhQg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6687745b0000>; Fri, 05 Jul 2024 16:19:39 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 009FB13ED5B;
	Fri,  5 Jul 2024 16:19:39 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id EEFBE280930; Fri,  5 Jul 2024 16:19:38 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH] docs: networking: devlink: capitalise length value
Date: Fri,  5 Jul 2024 16:19:35 +1200
Message-ID: <20240705041935.2874003-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6687745b a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=eJwZDefbqxDfYRb5NuEA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Correct the example to match the help text from the devlink utility.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/networking/devlink/devlink-region.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/devlink/devlink-region.rst b/Docume=
ntation/networking/devlink/devlink-region.rst
index 9232cd7da301..5d0b68f752c0 100644
--- a/Documentation/networking/devlink/devlink-region.rst
+++ b/Documentation/networking/devlink/devlink-region.rst
@@ -49,7 +49,7 @@ example usage
     $ devlink region show [ DEV/REGION ]
     $ devlink region del DEV/REGION snapshot SNAPSHOT_ID
     $ devlink region dump DEV/REGION [ snapshot SNAPSHOT_ID ]
-    $ devlink region read DEV/REGION [ snapshot SNAPSHOT_ID ] address AD=
DRESS length length
+    $ devlink region read DEV/REGION [ snapshot SNAPSHOT_ID ] address AD=
DRESS length LENGTH
=20
     # Show all of the exposed regions with region sizes:
     $ devlink region show
--=20
2.45.2

