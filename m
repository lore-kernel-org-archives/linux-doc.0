Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA9639C621;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396653; cv=none; b=TnCya1M2v0AFbIoJ/oad+3KxCDEu6ZQpFIhwUBKRtfrzNiEsL5/gAp5otFPSrbPeRm+hxRg44pCi/InB75/0j8EVe530amWLYsaa2twxu2WDRHI7Ph6gcxb5KO5dzUqIwmTdxT/kgNh/A2DUr24SaDCzJ6BEvpYH+UZE+oOR0C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396653; c=relaxed/simple;
	bh=s1mjnTzuhsFarODXcVZv6x/pyTkp3qp8CK9/urSRqTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/R3yIy30EbG2tZ71M66wLzvSA24jY8HnFSWuXZcvXcoqGZwtYjPeLq/WDYPIgPr9rvbrIlBKEJlOAJnM9/+j8SkM3QahngYYifNIhO03FhT2u7M6jvSI3RQdm4vmcyCTEaSFIMqQtZp5MF/qJ5teiX/fRj8sGyGDV3ay0WFAFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K539fdIo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K539fdIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3776C2BCC4;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=s1mjnTzuhsFarODXcVZv6x/pyTkp3qp8CK9/urSRqTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K539fdIoltpS8MpyRvr1shx6RFNu3ILQcG0NcCi9SHSh9VzLqag+IHVlTDJHJb35J
	 yZ1A4Kvugydu+/z9rYwocogz7FwhSNZ6JLurD2nKjH+4rwTTPOMX0x5IqInRLiDujC
	 hR22cX26fl6LS0/aBawoFddzcMfIEh8vu6CAy7+sbpqBPoYznm7U0PE4tIAKaR8wIe
	 L7sIy1iPbZoJGfqSbJxHw9h0YZ/EPQ7/VCVj/M20Jxeavs31SKOAqqtJnJTNSQBl5q
	 00SxDkPTpqC5ygwCLjLmjZpZs6dSszSmDF3uAiGVn2FD+wi8snGBYlwe7rzNhIm+5s
	 /hHkllzB+3lAA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kd-00000002myK-01Ze;
	Wed, 14 Jan 2026 14:17:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 13/13] docs: add kernel-doc modules documentation
Date: Wed, 14 Jan 2026 14:17:26 +0100
Message-ID: <feae2c28b694f2136607d9d5dc65a4503cefd685.1768396023.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768396023.git.mchehab+huawei@kernel.org>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Place kernel-doc modules documentation at Linux Kernel docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/tools/index.rst          |  1 +
 Documentation/tools/kdoc.rst           | 12 +++++++
 Documentation/tools/kdoc_ancillary.rst | 46 ++++++++++++++++++++++++++
 Documentation/tools/kdoc_output.rst    | 14 ++++++++
 Documentation/tools/kdoc_parser.rst    | 29 ++++++++++++++++
 Documentation/tools/python.rst         | 10 ++++++
 6 files changed, 112 insertions(+)
 create mode 100644 Documentation/tools/kdoc.rst
 create mode 100644 Documentation/tools/kdoc_ancillary.rst
 create mode 100644 Documentation/tools/kdoc_output.rst
 create mode 100644 Documentation/tools/kdoc_parser.rst
 create mode 100644 Documentation/tools/python.rst

diff --git a/Documentation/tools/index.rst b/Documentation/tools/index.rst
index 80488e290e10..89b81a13c6a1 100644
--- a/Documentation/tools/index.rst
+++ b/Documentation/tools/index.rst
@@ -12,6 +12,7 @@ more additions are needed here:
 
    rtla/index
    rv/index
+   python
 
 .. only::  subproject and html
 
diff --git a/Documentation/tools/kdoc.rst b/Documentation/tools/kdoc.rst
new file mode 100644
index 000000000000..e51ba159d8c4
--- /dev/null
+++ b/Documentation/tools/kdoc.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================
+Kernel-doc modules
+==================
+
+.. toctree::
+   :maxdepth: 2
+
+   kdoc_parser
+   kdoc_output
+   kdoc_ancillary
diff --git a/Documentation/tools/kdoc_ancillary.rst b/Documentation/tools/kdoc_ancillary.rst
new file mode 100644
index 000000000000..3950d0a3f104
--- /dev/null
+++ b/Documentation/tools/kdoc_ancillary.rst
@@ -0,0 +1,46 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Ancillary classes
+=================
+
+Argparse formatter class
+========================
+
+.. automodule:: lib.python.kdoc.enrich_formatter
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Regular expression class handler
+================================
+
+.. automodule:: lib.python.kdoc.kdoc_re
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+
+Chinese, Japanese and Korean variable fonts handler
+===================================================
+
+.. automodule:: lib.python.kdoc.latex_fonts
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Kernel C file include logic
+===========================
+
+.. automodule:: lib.python.kdoc.parse_data_structs
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Python version ancillary methods
+================================
+
+.. automodule:: lib.python.kdoc.python_version
+   :members:
+   :show-inheritance:
+   :undoc-members:
diff --git a/Documentation/tools/kdoc_output.rst b/Documentation/tools/kdoc_output.rst
new file mode 100644
index 000000000000..08fd271ec556
--- /dev/null
+++ b/Documentation/tools/kdoc_output.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+Kernel-doc output stage
+=======================
+
+Output handler for man pages and ReST
+=====================================
+
+.. automodule:: lib.python.kdoc.kdoc_output
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
diff --git a/Documentation/tools/kdoc_parser.rst b/Documentation/tools/kdoc_parser.rst
new file mode 100644
index 000000000000..03ee54a1b1cc
--- /dev/null
+++ b/Documentation/tools/kdoc_parser.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+Kernel-doc parser stage
+=======================
+
+File handler classes
+====================
+
+.. automodule:: lib.python.kdoc.kdoc_files
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Parsed item data class
+======================
+
+.. automodule:: lib.python.kdoc.kdoc_item
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Parser classes and methods
+==========================
+
+.. automodule:: lib.python.kdoc.kdoc_parser
+   :members:
+   :show-inheritance:
+   :undoc-members:
diff --git a/Documentation/tools/python.rst b/Documentation/tools/python.rst
new file mode 100644
index 000000000000..e826787ce9dd
--- /dev/null
+++ b/Documentation/tools/python.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+Python libraries
+================
+
+.. toctree::
+   :maxdepth: 4
+
+   kdoc
-- 
2.52.0

