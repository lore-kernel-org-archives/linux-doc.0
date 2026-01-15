Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10003B52ED;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=QWT+UWond5ZQd27dhzjK3QVPP5hpjkziwTz/CE83iQ1abDPgiK8pDZ672R7kEucLUxBtdtAInDYSIunn6lb+FnPD8ZjK2iXv7SrYm0Vpn7e9usxp3MEkeZyODIsPywEv3cyJKi/OP9r0fWJxtK46y7OUzVVmEwIZXFSDWtD+HK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=s1mjnTzuhsFarODXcVZv6x/pyTkp3qp8CK9/urSRqTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UCLMB0mENSNfgDpmwgN1v6JGifAc2hben79a/oqcA+uyUCN1tbCIYhxraLjVzQ8kBeGkEtpZlG2350iErnpp0iQ3/7HKs16RqgesVl4PoZtUE4K/Pzlh6voEFwxyO+prvL17ek8k1iY8fUpyb/qiBrrKIF6oLQoZ6C/U7Ef1D9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyGDhR6X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyGDhR6X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B1BC2BCF4;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=s1mjnTzuhsFarODXcVZv6x/pyTkp3qp8CK9/urSRqTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AyGDhR6Xc0NypbnxoAy9EeWvLcMs+49KdrlslDyGpkqgSmVkaZ+xRFuztBQk2ZQSW
	 9i9PL82IvRUC8j44AfiR77JpVhcK5+BA4A1abmWrQhvY3idtPeFJg7LuelT6tJk6Qt
	 Qsd6tGH/3/g5P9o6+hpxTnfV6MiV75UzWhmeOG2H+kWP4XD3cUQGqB21W3s1xMho77
	 yFs7/TIHSt2ARKoTCind5eD9vDza/44IbY8uSLv9KAq1T0rTEVNqxV4bo9le4u1HC4
	 vwy+UCWXQckLfZBE29VgKJjC79C+wgy+bCsb8haUG5Z+rRj3/EdIRqyEI5+kQj+g24
	 vkRFUEuD+z/BA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043J5-23g0;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 15/15] docs: add kernel-doc modules documentation
Date: Thu, 15 Jan 2026 16:40:36 +0100
Message-ID: <aff5634c95f388be7a7bef56b7bea7564ea4a501.1768488832.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768488832.git.mchehab+huawei@kernel.org>
References: <cover.1768488832.git.mchehab+huawei@kernel.org>
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

