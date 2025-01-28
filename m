Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08FCDDC3;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=E2uAVUSp2xmY3Mq8RLcgepHGSRIwYBSiuUSoVcel7X4D1x0WOtJ569O1jHBe2MaBvlltt5eBx5j/KBkrPS8/PAlKV9ZD5wwJ6jvNyqjvzVlWFoK215y+QacH4+DR0FDXWJ5A0xInqv4C7cXf+ZTdXxSkuXrEusyzXgBceRNLx+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=vHZ5PLWJNhBy8t8pbmqXOz9J8zS085ioE7uaQ7Z50XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdINI4uxc1F4oiki4WX8+/jqmtIZ/tKgVErecmQNkcNwXWJbiI70mLCI1OLi30ivDfVXx2TgdyHfRoIYgw1ElH+jW/NaxNIqpVULsbuzjb1TQqULB+3xO0S+30WKhkiPBjH2DdtJ7qvP408cdfwZUroc44PNPD6GzcYYT8ZlTKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LG8cTvV0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LG8cTvV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE245C4CEF5;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=vHZ5PLWJNhBy8t8pbmqXOz9J8zS085ioE7uaQ7Z50XE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LG8cTvV0oeGa9O3EXe+1aOV5F6FJ10NGWwauy9MJ3qrv9+cDImt+KE9fMJBjC81SB
	 PbIzDovkpMudreF1+RUusHdLkWQs8WIzi3tJ+AxrFv7mWalCG4uEIQjVOrVmVnTOtK
	 PUL1U8stVCZnsh5ZOZmsy9BSL1X9Ov8oRbcqCMJnvtxVci/SrX4KHZI82JOW8m2cAs
	 6PljwS9Z3kYOPuwELubYyndysPStUutgOsnsNrCY28qKPCdVyv3gJhyi6QPBL9AC8a
	 nrNnG4Lz+3xv4+3hdrqys3RAHOTzkSOGbgCXwYs2NB9h/oL1yPE5thQXAgS4ZtvqK9
	 hQu9CAwR3U5jg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRLf-0Rt9;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 20/38] docs: sphinx/kernel_abi: properly split lines
Date: Tue, 28 Jan 2025 01:06:09 +0100
Message-ID: <e8482fb62bf5c4c9972259d0e848de8c2a65741b.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sphinx doesn't like to have lines split with str.split("\n").

Instead, it uses its own splitter, with handles line breaks the way
Spinx expects. Not using it cause issues at the output files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 025a4f02e1a4..2408ba7a3981 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -36,7 +36,7 @@ import os
 import re
 import sys
 
-from docutils import nodes
+from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 from sphinx.util.docutils import switch_source_input
@@ -105,7 +105,8 @@ class KernelCmd(Directive):
             old_f = fname
             n = 0
             for msg, f, ln in self.parser.doc():
-                msg_list = msg.split("\n")
+                msg_list = statemachine.string2lines(msg, tab_width,
+                                                     convert_whitespace=True)
                 if "debug" in self.options:
                     lines = [
                         "", "",  ".. code-block:: rst",
-- 
2.48.1

