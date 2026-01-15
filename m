Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8C03A9DA3;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=dGaWvafYG2TGUC9hhKAm4uMsUL1pltDnLL+0MFWJlaXjnpkJnpnJNLjKsI97Qj/EjSLKhy+IpIHZCJG04T0Rjzju/V6D6MIogSmsYoiHoqLpdeDzFZEE5kX8pxP7TaSH/i7ny5MOZjZBl9ZKLgwv4h6ZUaH5NMqGbiSuBqNWdiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=kmk1GvA8qQBm6LrMB53lcAYigASy9DuUwFJjdBAuCYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXURSySrZK8smMWjs690xwpfMt6YMaqKyFTKt7fsAQm8ultOv8P1J59YunARlorWL4C31Mza1MdPOkRYGeTTWI6K1hfCazjzoZJMwqf3OaRcoicLvqGsJwZTR3O09u1boc3+zRXX79kj7MvxO4x92SLK/dV+ywuhsU4MssyRBU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOChNeqZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOChNeqZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19ACAC2BC9E;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=kmk1GvA8qQBm6LrMB53lcAYigASy9DuUwFJjdBAuCYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VOChNeqZjsMGc4p/t/QMppcsIXTzVj80ELNAdbuL0Zpkm2NAAaw7ZFf5qBz4bHxYv
	 YSsFyurw46vk0QQtyOOnVPMfvEVztOgyG/Fxzqi8+STYqAA493Wl4yGA9+E/0IW18C
	 g9nSCWYwOoiHxSM6wXwczSL79KRMJxUtT6uizJh611mIcBdku5nNwxLEM1sZ9mzdUa
	 HzQT2TCT1tRRcwwR30w+BHbvAB9+vLohgDm3e7I3XtO02/erG6RopCP/7UnXOPXcEe
	 9ZYhmORr0eghmh3MW7B1DA6bggrl+7+enRsCf/gh1hahj35MKOzYlyG1kurkVbv8Oa
	 BX5ER/4NRIzMg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043Id-1Hsl;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 08/15] docs: kdoc_item: Improve docstrings and comments
Date: Thu, 15 Jan 2026 16:40:29 +0100
Message-ID: <a68daefd2db512f220b615e0d2e3be30fbf49d1e.1768488832.git.mchehab+huawei@kernel.org>
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

In preparation to document kernel-doc module, improve its
documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_item.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index 19805301cb2c..2b8a93f79716 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -4,7 +4,16 @@
 # then pass into the output modules.
 #
 
+"""
+Data class to store a kernel-doc Item.
+"""
+
 class KdocItem:
+    """
+    A class that will, eventually, encapsulate all of the parsed data that we
+    then pass into the output modules.
+    """
+
     def __init__(self, name, fname, type, start_line, **other_stuff):
         self.name = name
         self.fname = fname
@@ -24,6 +33,9 @@ class KdocItem:
         self.other_stuff = other_stuff
 
     def get(self, key, default = None):
+        """
+        Get a value from optional keys.
+        """
         return self.other_stuff.get(key, default)
 
     def __getitem__(self, key):
@@ -33,10 +45,16 @@ class KdocItem:
     # Tracking of section and parameter information.
     #
     def set_sections(self, sections, start_lines):
+        """
+        Set sections and start lines.
+        """
         self.sections = sections
         self.section_start_lines = start_lines
 
     def set_params(self, names, descs, types, starts):
+        """
+        Set parameter list: names, descriptions, types and start lines.
+        """
         self.parameterlist = names
         self.parameterdescs = descs
         self.parametertypes = types
-- 
2.52.0

