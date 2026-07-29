Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0202221FD4;
	Wed, 29 Jul 2026 05:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785302870; cv=none; b=RIOK+/zhWBFM5B4pP5Ini6sBjQOu+dtXPjkgj+1gf5DR1tLx4/zRSRh7RspD6U+j5CoAy44YpTi/ne/WuJhvmox368xucXm6zfnbFC0v5FE3lex0FxP0CcuE5DND2n215aN8S+XRhqs3GVYXtm4zhxNfqFRW4zV7Lzo9FHxK/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785302870; c=relaxed/simple;
	bh=4txlCo9wDXWTMQwDRq3At1slhTidjtU17m5Ay3Jisyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PxgsVL4rk1N+t5ZeXL4i+MnZAzqda+9xzYy6YBh/psQSy7eaiFHJ+Um4yCtQ78aV166XqkCn+6jTgLuA4rLVI1YP3IaBred4PBH8dAQ9yekbopPQGcsM1/DJIfr/ESmCadbhCsmBWVzPenlkLtTxrIYh740EdGhXKg1hwIWS3IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IpFOjhud; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IpFOjhud"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=LleUzqse+A3Fw7Dtjp5ai/LTcFEAid6XKuwqqtnGUPs=; b=IpFOjhudt0OGNAGL3shCSgmNcv
	k0fhDlOV5QPktd9aZjh5I3bOvpoyyZNsZWUzrNt2Wedyi1YWy/hYA4m/opO/JDkmuAUAoZ78CWEVT
	PQfBOO/LvJqM9QABmwh08W08XAGeJs2NZRNpR7JwGJTc1PNlH7MCrXzXwNoqob7CXiUs/WLXWGsVk
	j4UnewPegnFJNrtpcu84Sf3poS0ls2G+C56SdG1Z02n0nA+R6RoqpqQvoI99QWs27lUW3zx/A3hwo
	jw7ApeDdiLkjv7/hnTDoMsIqnPCrUE6hPTwflP2r7emck1hiaMmY5th/yVykmUXFPAK4tRPtTjpTT
	hj5W36JA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowpO-00000006wQC-2cyk;
	Wed, 29 Jul 2026 05:27:38 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: kdoc_parser: drop extraneous blank line in warning message
Date: Tue, 28 Jul 2026 22:27:36 -0700
Message-ID: <20260729052736.1423688-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop an extra newline (blank line) on warning messages for (2 places):
  expecting prototype for typedef. Prototype was for typedef {symbol}
    instead
and
  expecting prototype for {struct|union}. Prototype was for struct|union
    {symbol} instead

This makes these messages consistent with the similar enum warning,
which has no extra blank line.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org

 tools/lib/python/kdoc/kdoc_parser.py |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20260727.orig/tools/lib/python/kdoc/kdoc_parser.py
+++ linux-next-20260727/tools/lib/python/kdoc/kdoc_parser.py
@@ -838,7 +838,7 @@ class KernelDoc:
 
         if self.entry.identifier != declaration_name:
             self.emit_msg(ln, f"expecting prototype for {decl_type} {self.entry.identifier}. "
-                          f"Prototype was for {decl_type} {declaration_name} instead\n")
+                          f"Prototype was for {decl_type} {declaration_name} instead")
             return
         #
         # Go through the list of members applying all of our transformations.
@@ -1155,7 +1155,7 @@ class KernelDoc:
 
             if self.entry.identifier != declaration_name:
                 self.emit_msg(ln,
-                              f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead\n")
+                              f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead")
                 return
 
             self.create_parameter_list(ln, 'function', args, ',', declaration_name)
@@ -1175,7 +1175,7 @@ class KernelDoc:
 
             if self.entry.identifier != declaration_name:
                 self.emit_msg(ln,
-                              f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead\n")
+                              f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead")
                 return
 
             self.output_declaration('typedef', declaration_name,
