Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29C33ACF00;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=ATYyUXtyG9/TR3Syt00un0967TG+FSCbN37usHptiUPKlNYhB1l2lzVrsdZw4n4L7y46Ni28TxiUJzF7R+67Lr/q0b9kdrdQI8IGJXVW+ehg+fc2LAIQQS3db7eIoCu6U9bVfldAzaPwkqPmUa4w3G7p+6XBtMJ7l3ndHKRIzBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=PaOLRDk0iXEcEwnWCzqzsJpfgjdAgDVAImrhDci59t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Db9t8wO7dKwuxxgx2owYTHkxHZV1cGiiNFI9ZcZvjXPyz5qZpS6k3K0ugtiID/wOmWEClGvGmEmOfUjoDjXlYcAtroBxQr9rhQIPgHHKC0oG2UEALwnVeSX6lNbnzqm4UO+zF1yCpIrw+zefXolwZwSn9mY5GpxihsG9z1vTyjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1hn9eZu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1hn9eZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D149FC19421;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130554;
	bh=PaOLRDk0iXEcEwnWCzqzsJpfgjdAgDVAImrhDci59t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I1hn9eZuOhs+VkCXrq2GGv2yAIF1R19EMOw09r7vylNK5xcOun/eGN5cJ0Yieslpd
	 aNWM8UUSJqXjZRG5ODUfTLOrq3hKxsMHSUPY8hFKe4tb1IA54ZhkJGI1BGvRaxYc0U
	 gpda/OI0ekDOR7VKjlFVSCvN9G8RvOEizWZqVd1j+1FH3De/Us2ffpl4EwqMHpPMYy
	 +r92h3ogzzzHF1nEoHxuIrc6c+Appnq+v6nv9Vxlwysaqrs79AhPCVg2XU85LiXwJZ
	 b9l9Q2RMZLrqoA7eNZTRwduPmKjo/Y9TVneGLT1jzmjMRPgh4om4qMcWvgG4PSpGtz
	 7KlzFy/Y562hQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHom-000000027UG-3clW;
	Tue, 03 Feb 2026 15:55:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 03/15] unittests: add a runner to execute all unittests
Date: Tue,  3 Feb 2026 15:55:31 +0100
Message-ID: <fbc29b02eeb3dfb644dad54b1bb8d36f88bc67e2.1770128540.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770128540.git.mchehab+huawei@kernel.org>
References: <cover.1770128540.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

We'll soon have multiple unit tests, add a runner that will
discover all of them and execute all tests.

It was opted to discover only files that starts with "test",
as this way unittest discover won't try adding libraries or
other stuff that might not contain unittest classes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/unittests/run.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100755 tools/unittests/run.py

diff --git a/tools/unittests/run.py b/tools/unittests/run.py
new file mode 100755
index 000000000000..8c19036d43a1
--- /dev/null
+++ b/tools/unittests/run.py
@@ -0,0 +1,17 @@
+#!/bin/env python3
+import os
+import unittest
+import sys
+
+TOOLS_DIR=os.path.join(os.path.dirname(os.path.realpath(__file__)), "..")
+sys.path.insert(0, TOOLS_DIR)
+
+from lib.python.unittest_helper import TestUnits
+
+if __name__ == "__main__":
+    loader = unittest.TestLoader()
+
+    suite = loader.discover(start_dir=os.path.join(TOOLS_DIR, "unittests"),
+                            pattern="test*.py")
+
+    TestUnits().run("", suite=suite)
-- 
2.52.0

