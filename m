Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFBC3C279F;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723788; cv=none; b=EzFYtnv7YUSqb29tPrHy9vgJCg2cxrj/H5cwqltcEN7JV/BDM/Hz7fQ7FwCmmRqAWFKwxiHwLEtSAcH2lCyGX8qNPJObrMceys8i/XIKx9ElVqdNb+7lnUaurGlXwUoxD+UwuLzliRKdHz83CdUxL5tJlQXvaLwtaUGWfCmvOgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723788; c=relaxed/simple;
	bh=GGvISdxmwoIbUjL//ZMtEtb0uZ7eg3KSR627MLJtNjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLO7AQDwa12VCNFP6EaLMg2Fft0SVFcrOWqvM+h9Tt5GIfmhZ0lvKTLtC7ljN1atmU7hIWaNPyBW/sHlKccjZpGN2ZuYs1AWGbn9OgWMuiWgw9KptmXOZQcrOffAZ9vm202aPN7IIzJRKYJ2tTZBNz6ncEEfys53EW2UWGkFEAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flL+4RRu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flL+4RRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA97AC4AF10;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723788;
	bh=GGvISdxmwoIbUjL//ZMtEtb0uZ7eg3KSR627MLJtNjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=flL+4RRuifBoMsCisegVGgimHW1fRtjBQvfPZGcdvE0xqppmCzXUyFbx2JOdoipDW
	 kZuComfLagMUWpqTFuHf6Ubz5XwAFFjLXvOIhcw7m+gCBikw++xusGGZyzgN4YUkjM
	 uiApZaEcgbgJKaWADnbdLFEzL59IiENfFFG7hvJTO2QcgG+1W9mhXy8cOSpsqTmLk4
	 v6GFSESz6xJkt7CaNH7g+u+wNWX3XFPFvjXx/OoJIr4/z08OeLGjyo2KQX+2Xr80c+
	 8WakuQ9CGMx+9RBNs6w2IMxNzRIy916NldnFesiYgj1usf8KVwqiGWt96E428O80ZD
	 jAFoSTbK/Lgbg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR8-0000000HK9K-0r8V;
	Thu, 05 Mar 2026 16:16:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] docs: kdoc_output: remove extra attribute on man .TH headers
Date: Thu,  5 Mar 2026 16:16:13 +0100
Message-ID: <d668b1db4878d5fd4763c16a606b0098a3cacde9.1772722474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772722474.git.mchehab+huawei@kernel.org>
References: <cover.1772722474.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

According with modern documents, groff .TH supports up to 5
arguments, but the logic passes 6. Drop the lastest one
("LINUX").

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index fb6b90c54c8a..d0b237c09391 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -618,7 +618,7 @@ class ManFormat(OutputFormat):
             modulename = self.modulename
 
         self.data += f'.TH "{modulename}" {self.section} "{name}" '
-        self.data += f'"{self.date}" "{manual}" LINUX\n'
+        self.data += f'"{self.date}" "{manual}"\n'
 
     def __init__(self, modulename, section="9", manual="API Manual"):
         """
-- 
2.52.0

