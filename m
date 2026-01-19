Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C982ECEA3;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=OGBcoLFtIx1ImRKgEyLW//aX3bCg7+yx0cCUKRNcZIocvMK3WouV59OVzgNb1zjfUpW4Ozym4u3PvXvxAikHzruwGCPS3xbDnJasigT14sNcxok594FCR2DQqM1oUgEMHcRvUm0PY0KUbJv4/IhnKqboHvLDa5zEoxHWwfiKwdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=kmk1GvA8qQBm6LrMB53lcAYigASy9DuUwFJjdBAuCYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=chJjPFMSERseWflJOIOtvCF2M4fQtg9H7E2lDA/yjOoWfi6h90d+sesAA6eD816qKWlthRwtp9efEhmpMl8YXDnPd3iirWXGYdPoSSO3dDoY8GrhcHABWFCSjMcXa3EzuaTAzR64irZo7tI9djYCER7EaltyK394iKJaWAYBkZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jb6G/OZX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jb6G/OZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B484C2BCB0;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=kmk1GvA8qQBm6LrMB53lcAYigASy9DuUwFJjdBAuCYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jb6G/OZXZze8yAiPxyYcIkskwEVQixCDEkPRC8v8/IVWyNejEHzu3LzqFBnNS+GIr
	 uubYwLjG6taquIKhrbQrEQ/+B+PssWOQaV+SjRSPUi8XOMSAALE0pgwSHJIXJH9UJI
	 xD3+CrUUwoOoMV/Sql6E8IDYKJjXL4HD/P1TW3EF+g6BpytaCyVh1NGDjJSfD6wac/
	 xWIksy8yRjMhzQ/8uNeqSBR1p4pSIRJ/W9d3CIsVBMxSwCRaxE+CmEduF34PocRp5x
	 S43gBxsef6WIptJLAB3PPE3GzBDKdmDzYfrCUZcWlSTYsbH7e5Kx56GyIybU+isFb4
	 Jw3kAH3KL2xgA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j1s-1FF9;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 08/25] docs: kdoc_item: Improve docstrings and comments
Date: Mon, 19 Jan 2026 17:23:11 +0100
Message-ID: <65a7c6bb318e7a8cbf5c115903d507568099151a.1768838938.git.mchehab+huawei@kernel.org>
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

