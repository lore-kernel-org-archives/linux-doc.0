Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A24222575;
	Tue, 27 Jan 2026 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501022; cv=none; b=noqHtEdI541H6yho+WvKaZqdvRrK3xBb3041pyHBJjLN1+G8AMjLiEH23YOynqinH6vfO9E6FT8YeVfebnUB9h1udIGcoMCHQiK0dPpqhSEQnBCT0XpD0dD64rxRAN3r+OjccQtoFobPOJTEtpY9eg+JWtema9C0j4e+gS5hBfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501022; c=relaxed/simple;
	bh=VIlaRMwPjIfEIQDuYa02KnJ1UgKS/LPF/904EgFNK3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tzNmVy83adaPE+YKWRa2dTtaVX52MBOCFMIrr2mmu4rZezzOBD0fK9DS86A4T7E5dwtrtKcfNV8rQzLZowaNdiDiXP0l5FbpjL8qhDiFHIpUeUtVxwFTyO14abKB+6m/B8YHS+R0OlhTOi1SoXyjc9j8iU5BTVAzqkibZY1ABk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOzTe4DK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOzTe4DK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3B4C19425;
	Tue, 27 Jan 2026 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769501022;
	bh=VIlaRMwPjIfEIQDuYa02KnJ1UgKS/LPF/904EgFNK3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IOzTe4DK7GJoZlIpdG2Vsjos6l5etoJMO29ZVqZStL8KjvH4aJ3xTXiLN+exD1Kvu
	 ogQ3JmFUwVChz7IP12B/KDA1c0up5dAqErfccmtpKrzYGl++LS9Ev/HW0+PEkGOV1z
	 1GfCgbpeOndtc7fxwQQTpA9LeadoKqxWl/Lab99bk1Jemwsp+AmjAqkjEieTx1lrC6
	 nWV46R+dzCycW6jUW4rZXIOI8RBKbq1aKFR7emSEAOFbfYtQQIbx67JQk3sOMnC97A
	 lJNttgMpaP9kbGpCw0oJIN3yi0LeCbBv/fyDPuB+3QruvOyUzvd/gE706buqoNBgSb
	 osIYWXl2O0D6A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vke32-0000000BNM8-2CYA;
	Tue, 27 Jan 2026 09:03:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 1/3] docs: kdoc: Fix pdfdocs build for tools
Date: Tue, 27 Jan 2026 09:03:32 +0100
Message-ID: <2fff8ef1d0d64e8b68f15f5c07613f302d773855.1769500383.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769500383.git.mchehab+huawei@kernel.org>
References: <cover.1769500383.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

the "\1" inside a docstring requires proper scaping to not be
considered a hex character and break the build.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Closes: https://lore.kernel.org/linux-doc/63e99049-cc72-4156-83af-414fdde34312@gmail.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_re.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 2816bd9f90f8..0bf9e01cdc57 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -228,14 +228,18 @@ class NestedMatch:
             yield line[t[0]:t[2]]
 
     def sub(self, regex, sub, line, count=0):
-        """
+        r"""
         This is similar to re.sub:
 
         It matches a regex that it is followed by a delimiter,
         replacing occurrences only if all delimiters are paired.
 
-        if r'\1' is used, it works just like re: it places there the
-        matched paired data with the delimiter stripped.
+        if the sub argument contains::
+
+            r'\1'
+
+        it will work just like re: it places there the matched paired data
+        with the delimiter stripped.
 
         If count is different than zero, it will replace at most count
         items.
-- 
2.52.0

