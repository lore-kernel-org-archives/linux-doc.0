Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598C63EBF0B;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811959; cv=none; b=Afxq/u0KyBZyYuKwQ2hssKryeUkartBvuzw+f2f2MQOKxWs6rbE58hWnHFM5hm6xxdWd1scx7W4zclyPAoysMbtfhaHLdGdL7QqsAM+sTbxLf22o80vp/UfI2lM3Hn9wcTixDsb4xDf7yI20Iq1QM3LYWRjhgLoIg0h+w8p7KeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811959; c=relaxed/simple;
	bh=KClTBbHYRg20aly7xZCzAagKb8bY1y4ys0T0TfWzZRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qt5IkPwGYxuGPXcuHpyxsfdeqFACprmd2EuNo6L1Ts6INH5TMzjxWxTQvBuQ9A44VhbthVcyis0mt9RjeTU+gZWRcI8VWuxwwu4HTnWUIXuKwQ2Wi4rqicB+eiZdIPc2I741EyvH6fhCvZo2kuKxNPYOhYsj43mkMO+2aQ5yIiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxwwWYeW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxwwWYeW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DF4C4CEF7;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811958;
	bh=KClTBbHYRg20aly7xZCzAagKb8bY1y4ys0T0TfWzZRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxwwWYeWSLdsBGvSisythSmKV4XXhG0fpeQJxiazqjv/I9JpKb9/0KqUPopv6uqYM
	 dnSGxzDsfAPY2t/AOobTf9XlC1jbHFqAXWkTgbONEu8IiD9rzo0n8tafvA8hcZRHMb
	 Sc22X2xzVnMdANf5/q1LHNOXW4ObOtMCuGSL0TUwqk+XlrrWv6dZOQHXYspNeEaaxT
	 U7/555AW/IAHFQIemY8/ImPzHBNpUkHTVpWE92ZOLMpjZKT98pR0QPI+PjQxKEgAzT
	 +T2hekj4wbNVQNO0dY1QKOUceW1Nhfo/XxGtg6GrDaXJDANNB1/r3icu6doHBxwGqw
	 NnptqV8WIZJug==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNE-00000007EbL-422w;
	Fri, 06 Mar 2026 16:45:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] docs: kdoc_output: use a single manual for everything
Date: Fri,  6 Mar 2026 16:45:43 +0100
Message-ID: <000e1174a551e97ad4710ad4f3750b22017bedd5.1772810752.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There's no reason why functions will be on a different manual.
Unify its name, calling it as "Kernel API Manual".

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index d0b237c09391..24ee1fad681e 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -607,20 +607,17 @@ class ManFormat(OutputFormat):
         "%m %d %Y",
     ]
 
-    def emit_th(self, name, modulename = None, manual=None):
+    def emit_th(self, name, modulename = None):
         """Emit a title header line."""
         name = name.strip()
 
-        if not manual:
-            manual = self.manual
-
         if not modulename:
             modulename = self.modulename
 
         self.data += f'.TH "{modulename}" {self.section} "{name}" '
-        self.data += f'"{self.date}" "{manual}"\n'
+        self.data += f'"{self.date}" "{self.manual}"\n'
 
-    def __init__(self, modulename, section="9", manual="API Manual"):
+    def __init__(self, modulename, section="9", manual="Kernel API Manual"):
         """
         Creates class variables.
 
@@ -751,8 +748,7 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name, modulename = name,
-                     manual="Kernel Hacker\'s Manual")
+        self.emit_th(out_name, modulename = name)
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
-- 
2.52.0

