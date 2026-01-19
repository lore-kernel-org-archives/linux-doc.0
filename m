Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB592FE593;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=Ohl177sDMwCsE57ZmX1E54LTHJEaUDsDth+QMuYyAPOy5vvGj48O3ERrBhKEo4z/rEMTSO96XVg+QQFFIGui/7UpME0OXObP7+aYEMMGX8YteOnDW8nbiAcZgi09eJUjRGWH08jaX/bYsW2FZUZ7kZjnNmEagV4KJOTCSCLSJqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=AVd8fmGIAF4zYlsPWk9dKYgZxAbzv6350/TY3F2WP6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jTRlKsmOI+Ea3VdJr3UC+NfLSty7lFGcZR29qYomx7VNdiHIp5JoqyHs7jTGeJ34xXR9YdyEn/xfLRhTm5HmHLepTLwCIrEazqGNP+3yjKwLPfX7/7/QYc4b6ZGXJ+WgGd3bu+2j87aEeH8x4qwa98qMcpHA0ErSKZsAwB5NMjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hle9N8Af; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hle9N8Af"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A836C32786;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=AVd8fmGIAF4zYlsPWk9dKYgZxAbzv6350/TY3F2WP6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hle9N8Afd4V6xcMwvLV+zZK3thQALTyt7JP1o9URfKXdPq6Mau9maQPTph7KlTq1f
	 BIRkGLcy2kmCxcFoha6OfN9yINqS5cX4c1pUNgRCKdxhdWUyew4tB+q7BTkKpEne0g
	 /I/yke6dyV3/BaRy463vISHGnBq6WMxNEN1LebBDqY95JJm/tVmzzADjwZ7OKqJj+m
	 3lDwfZ3yxZ1HPfsDalMbtN2QAWuW/OKKlf8a5QC6A8bCjKbwcysT7fP56D4v5BsY4i
	 Z5crzK3+pjkyQPrjXIljd7DDG1ZeASYcF7Yt4bRVzqp++6iV+9tjc5LCwjLgGR4khL
	 x7FE03VZRPN9A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2k-2g67;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 21/25] docs: kabi: helpers: add documentation for each "enum" value
Date: Mon, 19 Jan 2026 17:23:24 +0100
Message-ID: <3b118b157e52d757bf82fd74f03b0f4bd9e8b8f1.1768838938.git.mchehab+huawei@kernel.org>
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

Ensure that kABI module documentation will describe each
debug bit.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/abi/helpers.py | 40 ++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/tools/lib/python/abi/helpers.py b/tools/lib/python/abi/helpers.py
index b8c8dfb1272e..2a378d780d3c 100644
--- a/tools/lib/python/abi/helpers.py
+++ b/tools/lib/python/abi/helpers.py
@@ -13,28 +13,28 @@ ABI_DIR = "Documentation/ABI/"
 class AbiDebug:
     """Debug levels"""
 
-    WHAT_PARSING = 1
-    WHAT_OPEN = 2
-    DUMP_ABI_STRUCTS = 4
-    UNDEFINED = 8
-    REGEX = 16
-    SUBGROUP_MAP = 32
-    SUBGROUP_DICT = 64
-    SUBGROUP_SIZE = 128
-    GRAPH = 256
-
+    WHAT_PARSING = 1        #: Enable debug parsing logic.
+    WHAT_OPEN = 2           #: Enable debug messages on file open.
+    DUMP_ABI_STRUCTS = 4    #: Enable debug for ABI parse data.
+    UNDEFINED = 8           #: Enable extra undefined symbol data.
+    REGEX = 16              #: Enable debug for what to regex conversion.
+    SUBGROUP_MAP = 32       #: Enable debug for symbol regex subgroups
+    SUBGROUP_DICT = 64      #: Enable debug for sysfs graph tree variable.
+    SUBGROUP_SIZE = 128     #: Enable debug of search groups.
+    GRAPH = 256             #: Display ref tree graph for undefined symbols.
 
+#: Helper messages for each debug variable
 DEBUG_HELP = """
-1  - enable debug parsing logic
-2  - enable debug messages on file open
-4  - enable debug for ABI parse data
-8  - enable extra debug information to identify troubles
-     with ABI symbols found at the local machine that
-     weren't found on ABI documentation (used only for
-     undefined subcommand)
-16 - enable debug for what to regex conversion
-32 - enable debug for symbol regex subgroups
-64 - enable debug for sysfs graph tree variable
+1   - enable debug parsing logic
+2   - enable debug messages on file open
+4   - enable debug for ABI parse data
+8   - enable extra debug information to identify troubles
+      with ABI symbols found at the local machine that
+      weren't found on ABI documentation (used only for
+      undefined subcommand)
+16  - enable debug for what to regex conversion
+32  - enable debug for symbol regex subgroups
+64  - enable debug for sysfs graph tree variable
 128 - enable debug of search groups
 256 - enable displaying refrence tree graphs for undefined symbols.
 """
-- 
2.52.0

