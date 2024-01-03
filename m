Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272761B292
	for <linux-doc@vger.kernel.org>; Wed,  3 Jan 2024 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCqXulHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685AFC433C8;
	Wed,  3 Jan 2024 16:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704298187;
	bh=4S8EQvkuWbsMYHMZO0Ynzx5apCcr9we6I8npIg3bGjI=;
	h=From:To:Cc:Subject:Date:From;
	b=fCqXulHS2x1jwhDJgKOAZ+qnJY9i90HJ/gf0XEae2/O9QhKHO8ZSZU0Q/4pg+d11+
	 tzxAVGfu19FVDxeV0Ip78G6r7As29equap1wPDbNc25Lv7/Fw6kcTA0g3mRZMWz8mT
	 0SaEzSYT6XQgSJLrxKEYFddLAdNYHeX24bjzhHfle3+MVoU2/PO3bKw39jIQVhOB4A
	 c73gFHxog7OHq1sOthmt/FH8Q04aqZ02rPpXsntJ7Po6VAe2CVcAP85I2ulyVZ9uG6
	 8YKyVWiwmFJ6rtIzvBD0IT/ZBgn1//Za8t13jtp9XbEXhynIWnkqc1J3RPxjJGC04u
	 0vK5ZE6FbfZrA==
From: Jakub Kicinski <kuba@kernel.org>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	carlos.bilbao@amd.com,
	elena.reshetova@intel.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH docs] MAINTAINERS: use tabs for indent of CONFIDENTIAL COMPUTING THREAT MODEL
Date: Wed,  3 Jan 2024 08:09:38 -0800
Message-ID: <20240103160938.1006517-1-kuba@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two MAINTAINERS entries which snuck in during the previous
merge window which use spaces instead of tabs for indent. The rest
of the file uses tabs. Fix CONFIDENTIAL COMPUTING THREAT MODEL FOR
X86 VIRTUALIZATION (SNP/TDX).

Given the prevalence of using tabs some scripts (AKA my scripts)
assume tabs when parsing.

The faulty entry was added in commit 1f597b1a6ec2 ("docs: security:
Confidential computing intro and threat model for x86 virtualization")

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a9876df20f8..1ce437992a4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5313,10 +5313,10 @@ W:	http://accessrunner.sourceforge.net/
 F:	drivers/usb/atm/cxacru.c
 
 CONFIDENTIAL COMPUTING THREAT MODEL FOR X86 VIRTUALIZATION (SNP/TDX)
-M:    Elena Reshetova <elena.reshetova@intel.com>
-M:    Carlos Bilbao <carlos.bilbao@amd.com>
-S:    Maintained
-F:    Documentation/security/snp-tdx-threat-model.rst
+M:	Elena Reshetova <elena.reshetova@intel.com>
+M:	Carlos Bilbao <carlos.bilbao@amd.com>
+S:	Maintained
+F:	Documentation/security/snp-tdx-threat-model.rst
 
 CONFIGFS
 M:	Joel Becker <jlbec@evilplan.org>
-- 
2.43.0

