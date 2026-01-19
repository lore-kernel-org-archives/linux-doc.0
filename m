Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCA02FB093;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=VMPSrL/2VQxv8kKNrFTWBFujC9f/noBImtCn94Zrb9NF9JQ/gj725od3lBHXapSFscG14oeiNJqbGHAAi5h7jzz8BfNFKqtQhndona4QmH3JkNNLi7tSIj7Trf6hmDIAWzuN4seNRWkZkMV1TL8AGhPmr2VmYhHoUl0WmreTxfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=exx7FqZl941FZsZhtYfKeTVwWdKc6AHLhML71ImEVTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oNXJBk1G54pyiWFxEaKhY3ghT768kfKo294Iebrnv3gydxZSILPEDbMULaeX2cJCLJNDXq87pBzgoJDLuapeVVsxhCRETTkBMjWzrmlNJpX5GAjxb3DQrQV0klLlUZajzhVkJxZ5Lo/NV6BUbQ0MW/37026Zl8Hnjn5YhQ6Eqh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6ZJzBFx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6ZJzBFx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1AFC2BCC4;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=exx7FqZl941FZsZhtYfKeTVwWdKc6AHLhML71ImEVTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V6ZJzBFxN+RV5gpEo1KC0DrHBaeS3mKpanr3wyS2b6VLloW36+fqEpzRzk7kTqQ6d
	 AvQr80+9Ry85SmPRWe4HSdg3YkWpE/+qS0Z+ZMVOmDEvrRb7FtRgGj1U80o6dVjk/p
	 ZkvaWfwkny2qvHLnXEp3dnyTzdUkVEu3BvI96rrEJ12DBocJjnETnxN759nINlOGoZ
	 SyiTGWFVG+eOXDNiQXpOk3f0/LCUWo0lQdRLaJs6cas/ilD14XlOy3zUtkneJAV5yS
	 AfbNUb60b66nmJXA+gzGzcM0yfiv2zZcnfoEO1gzHjU4JTvBPaoMU/u/Aso+2BYqAg
	 Y6Ekf//U8ca/g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2O-286m;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 16/25] docs: add kabi modules documentation
Date: Mon, 19 Jan 2026 17:23:19 +0100
Message-ID: <ddc02f11d64fdfc0d8d3e3e0967e041b5172da6c.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Place kernel abi modules documentation at Linux Kernel docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/tools/kabi.rst         | 13 +++++++++++++
 Documentation/tools/kabi_helpers.rst | 11 +++++++++++
 Documentation/tools/kabi_parser.rst  | 10 ++++++++++
 Documentation/tools/kabi_regex.rst   | 10 ++++++++++
 Documentation/tools/kabi_symbols.rst | 10 ++++++++++
 Documentation/tools/python.rst       |  1 +
 6 files changed, 55 insertions(+)
 create mode 100644 Documentation/tools/kabi.rst
 create mode 100644 Documentation/tools/kabi_helpers.rst
 create mode 100644 Documentation/tools/kabi_parser.rst
 create mode 100644 Documentation/tools/kabi_regex.rst
 create mode 100644 Documentation/tools/kabi_symbols.rst

diff --git a/Documentation/tools/kabi.rst b/Documentation/tools/kabi.rst
new file mode 100644
index 000000000000..92812a20fcf7
--- /dev/null
+++ b/Documentation/tools/kabi.rst
@@ -0,0 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+Kernel ABI documentation tool modules
+=====================================
+
+.. toctree::
+   :maxdepth: 2
+
+   kabi_parser
+   kabi_regex
+   kabi_symbols
+   kabi_helpers
diff --git a/Documentation/tools/kabi_helpers.rst b/Documentation/tools/kabi_helpers.rst
new file mode 100644
index 000000000000..5c6ec6081500
--- /dev/null
+++ b/Documentation/tools/kabi_helpers.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Ancillary classes
+=================
+
+.. automodule:: lib.python.abi.helpers
+   :members:
+   :member-order: bysource
+   :show-inheritance:
+   :undoc-members:
diff --git a/Documentation/tools/kabi_parser.rst b/Documentation/tools/kabi_parser.rst
new file mode 100644
index 000000000000..95826da21b3d
--- /dev/null
+++ b/Documentation/tools/kabi_parser.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+Kernel ABI documentation parser class
+=====================================
+
+.. automodule:: lib.python.abi.abi_parser
+   :members:
+   :show-inheritance:
+   :undoc-members:
diff --git a/Documentation/tools/kabi_regex.rst b/Documentation/tools/kabi_regex.rst
new file mode 100644
index 000000000000..bfc3a0d91c47
--- /dev/null
+++ b/Documentation/tools/kabi_regex.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================
+ABI regex search symbol class
+=============================
+
+.. automodule:: lib.python.abi.abi_regex
+   :members:
+   :show-inheritance:
+   :undoc-members:
diff --git a/Documentation/tools/kabi_symbols.rst b/Documentation/tools/kabi_symbols.rst
new file mode 100644
index 000000000000..c75a9380f89f
--- /dev/null
+++ b/Documentation/tools/kabi_symbols.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+System ABI documentation validation class
+=========================================
+
+.. automodule:: lib.python.abi.system_symbols
+   :members:
+   :show-inheritance:
+   :undoc-members:
diff --git a/Documentation/tools/python.rst b/Documentation/tools/python.rst
index e826787ce9dd..978298fba6d3 100644
--- a/Documentation/tools/python.rst
+++ b/Documentation/tools/python.rst
@@ -8,3 +8,4 @@ Python libraries
    :maxdepth: 4
 
    kdoc
+   kabi
-- 
2.52.0

