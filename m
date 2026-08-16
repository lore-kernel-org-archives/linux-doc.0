Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD48E3CBE89;
	Sun, 16 Aug 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786860756; cv=none; b=svE4OTiDFliFa236DeDudx9xKl/29vyOURhr1/fd/fEjzYgtWBLFB98IIAyHJmtkcVQh/LjwgmZQqybcihRV6C1SuVY8GpwOZvsB6jj3PwcOVUDrv+mhrph8mRC0QFBTV0IUdASxnrAwhpjuFCbpdQNsn5co25glgpKKmVwyRw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786860756; c=relaxed/simple;
	bh=mUAx1Z/qFOqpEgl+3sGOsKvdyIqEQoDIT1R68xss65M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Srld75QmmZuIqBipo2L3xhJjuTbagv+a8KsvgLJVSzlEHLiXdX79UoUzbmr1JrdLuSvkaObJkLUJMLcACwbH+vMW4G1Lysrq/CI2p1X95ZH2PLqLIcK1SYD4g1lSA9gQX19M52tDqv8vWli2MVQV/bTm27RdcwhX++IBbi6Q//g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CzOS5K4o; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CzOS5K4o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1e86M65k6JK/aXynRPMKMtBujRQPZpkavaSGI6IWON4=; b=CzOS5K4oe6S0MzujhGX8wEADLR
	Njz2CVdJPzkxrzcQ5zNUjm9PcFHWLjd0F+sznPXQ2FOGg6HJ97nOiazPUCQIwXuDLx5LND8sYgXW4
	POIucc5pt4bhNrPXHuLoHhUdVE5lcBcbgbhg3CymJAcaqV4mgrTSjgpe9u2aHKez04TjTaYoOdv/M
	HQOSyTXju5mz52HkJ12o8CKr0MMN+wd9Rmp4NMjBSykGvt43OQvmPYvKtZSQ7OZyJmhyfHsIFlLUZ
	94tGjaPROgvXcjmgctRZ/+yEoS44SNaBn1IhZpaHa5FZl3YnU8Rq8U1p6rHlXuUSORK8Bo/mknf1A
	IFWv4Qmw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvTjT-00000004URm-3RoG;
	Sun, 16 Aug 2026 05:48:31 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: kdoc_output: only use out_tail when the identfier is shown
Date: Sat, 15 Aug 2026 22:48:26 -0700
Message-ID: <20260816054826.3988516-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In -man mode, scripts/kernel-doc prints the "out_tail" information for
all symbols that are found (without the symbol info), whether the
symbols match the output selection criteria or not.

This can cause quite a lot of extraneous output in -man mode for the
symbols that are not in the selection criteria.

Modify kdoc_output.py so that it only calls out_tail() for symbols that
are being shown according to the selection criteria.

Closes: https://lore.kernel.org/all/fc7978bb-a71f-456d-84bb-670c8f0426ed@infradead.org/
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org

 tools/lib/python/kdoc/kdoc_output.py |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- linux-next-20260814.orig/tools/lib/python/kdoc/kdoc_output.py
+++ linux-next-20260814/tools/lib/python/kdoc/kdoc_output.py
@@ -198,22 +198,27 @@ class OutputFormat:
 
         if dtype == "function":
             self.out_function(fname, name, args)
+            self.out_tail(fname, name, args)
             return self.data
 
         if dtype == "enum":
             self.out_enum(fname, name, args)
+            self.out_tail(fname, name, args)
             return self.data
 
         if dtype == "var":
             self.out_var(fname, name, args)
+            self.out_tail(fname, name, args)
             return self.data
 
         if dtype == "typedef":
             self.out_typedef(fname, name, args)
+            self.out_tail(fname, name, args)
             return self.data
 
         if dtype in ["struct", "union"]:
             self.out_struct(fname, name, args)
+            self.out_tail(fname, name, args)
             return self.data
 
         # Warn if some type requires an output logic
@@ -763,7 +768,6 @@ class ManFormat(OutputFormat):
         Add a tail at the end of man pages output.
         """
         super().msg(fname, name, args)
-        self.out_tail(fname, name, args)
 
         return self.data
 
