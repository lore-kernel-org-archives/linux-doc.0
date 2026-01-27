Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C87B33B975;
	Tue, 27 Jan 2026 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508823; cv=none; b=bnNsJJD2woc3aNPNT6cKGJ66IFsHeMw4OdCNdcj3V/6kpBOtosgJW1dvIkUUFHYR04yt4+oklnUcp8w/InYSamWmro80gk8g/r9NwpIpzQY2xfiGfiwB9zS4gsq5YsW57gHSNpnB2TLRoYTf3O4L9ZFb4T5lOc/j/+6k4BDiiis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508823; c=relaxed/simple;
	bh=r7AQAavBSNUMsivwwiBxtssyZ9U5aFJ2qZKecZbMdAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/9tOKvUUb6CBz/E5IxLpjKgnUlDXQdEnqF615epplN79DnJsiUweVxEcI5LI/U3TG4eJA4wBVNAQ0nWp8DfskEwNpVexihJW+2rMRkvOenQpj+TaDqUbrDFMO4lg7Kitf0SFU0hs2Vh9+wWGdwZKL4NPVSNFxB/BaNwxptzQuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0RJzA1T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0RJzA1T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA80C2BC87;
	Tue, 27 Jan 2026 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508822;
	bh=r7AQAavBSNUMsivwwiBxtssyZ9U5aFJ2qZKecZbMdAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H0RJzA1TIbKUEYo53MVrgut3xHG0oHhimt2FBMoniEBEg2p8lrz1zCfLcynCK1MGf
	 Jajd4Cj+c+6TyQu7zOmS+QyiNMoTv1/3SiGxjJ2WBb7qVgzttrotqyXXg04fMW7cGn
	 Y9zob4gP5S9qa0yGn+4n2O3UT4Co2wjaXiudYoI6mT0pQzMJ9jY5Ogd1i2XFrLQ1S0
	 98JxSqmnJqNQyVyr5P6MVny9TnHri3l3+qgRaY4zjpdVY8FoIbDqFRoFadwQXiPuul
	 ga/sD0lsElTY+Me+3/tjsvbJ5QcwG7G3a3EcEj0SLK6A5x/s+5scsEGwTQ1LP+g9SX
	 07ZVwO3TBFtYQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4r-0000000BVQs-0jak;
	Tue, 27 Jan 2026 11:13:41 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 09/14] docs: kdoc_parser: add some debug for variable parsing
Date: Tue, 27 Jan 2026 11:13:28 +0100
Message-ID: <0fae69123a26955743ca1a8485fbea87135470a3.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This is a new parser that we're still fine-tuning. Add some
extra debug messages to help addressing issues over there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 85f4e90c49c8..38d415778a7c 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1016,11 +1016,19 @@ class KernelDoc:
                 declaration_name = r.group(1)
 
             default_val = r.group(2)
+
+            self.config.log.debug("Variable proto parser: %s from '%s'",
+                                  r.groups(), proto)
+
         else:
             r= KernRe(OPTIONAL_VAR_ATTR + r"(?:[\w_]*)?\s+(?:\*+)?(?:[\w_]+)\s*[\d\]\[]*\s*(=.*)?")
 
             if r.match(proto):
                 default_val = r.group(1)
+
+        if default_val:
+            self.config.log.debug("default: '%s'", default_val)
+
         if not declaration_name:
            self.emit_msg(ln,f"{proto}: can't parse variable")
            return
@@ -1028,6 +1036,9 @@ class KernelDoc:
         if default_val:
             default_val = default_val.lstrip("=").strip()
 
+        self.config.log.debug("'%s' variable prototype: '%s', default: %s",
+                              declaration_name, proto, default_val)
+
         self.output_declaration("var", declaration_name,
                                 full_proto=full_proto,
                                 default_val=default_val,
-- 
2.52.0

