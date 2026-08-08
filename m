Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2C433F8BE;
	Sat,  8 Aug 2026 04:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786164824; cv=none; b=TxpwzPsIeGLLiPIKEwQ2QTurtOmLxrEzfjhiqeIaoLakT46o8NidB/0ZhGks3MImi34lJK2Ut7qc2EFdnTMRFxm7YRX+0qH9jjlWQCgBypV+yLdoFbTaVaLd1rDYOUxfJ2MXbNXWAN+PFEjtgKnITR4qT47BztGw4dSfFBAZCYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786164824; c=relaxed/simple;
	bh=m29zoP7aIx4xk9LQyQgN83dGjASx9fmkEBs8vXf+M8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OMHZ0IIdgAK8HMDLlQUnd+HHQVrlhpZgRdGB5oWhsaDeiCQUZJEYfBDiQaKNFxPuWtpb9zC3fsr2geuCGehtmZ9N72bkZJP+oxPKyU/TcmT1ktlmn9EziChNbdPEvqiI5X6caD77fjW43NjOA7M4AAezC5C3nQorK/5pQinWCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aJj8BNhG; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aJj8BNhG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6UOMvRdj96t8q8BvMSIQhe58ODGT3muQi/HQJSJVVkk=; b=aJj8BNhGHFZIa1JGmi8/zz8tuq
	3sJjwsXflzGx5VjdnBAC0ZwoRl/ohT07JK7NuuM56uB81vyJ6ka0s0B4uggR7JkhC4ij13GlZPZ1T
	9zkbvDaZopNwUxgs5FsP1UPiyvS8o9jd2KbuF9Iew+Xu8v+r/D/Q8syVkkLN4TzEksUd0nfNvaqXM
	uHZoPByI6a0FBDtCREYMo6lkZI6A+KC7ZK6qhk8AS+5FH80pAo424n8JiqCUPbswIgjST4y2S6f0K
	lfooW9fQFJgxTAl/XmCddcLQCAnE/hwTzhGahkSot700GFlNGqIuQqiVLcy2/q5s4eiwKRqvWM2JN
	5OV0iaTg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsZ3t-000000093Tw-2M9N;
	Sat, 08 Aug 2026 04:53:33 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: sphinx-build-wrapper: include localversion in kernel version string
Date: Fri,  7 Aug 2026 21:53:31 -0700
Message-ID: <20260808045331.326769-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add any localversion* text to the kernel version string
so that the docs index (home) page accurately indicates what
the docs build version is.

E.g.:
  7.2.0-rc6-next-20260807

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org

 tools/docs/sphinx-build-wrapper |    9 +++++++++
 1 file changed, 9 insertions(+)

--- linux-next-20260807.orig/tools/docs/sphinx-build-wrapper
+++ linux-next-20260807/tools/docs/sphinx-build-wrapper
@@ -220,6 +220,15 @@ class SphinxBuilder:
         self.pdflatex = os.environ.get("PDFLATEX", "xelatex")
 
         #
+        # Add localversion* to kernelversion if present
+        #
+        for file in glob(os.environ["srctree"] + "/localversion*"):
+            if not file.endswith(".orig"):
+                with open(file, 'r', encoding='utf-8') as f:
+                    text = f.read()
+                    self.kernelversion += text
+
+        #
         # Kernel main Makefile defines a PYTHON3 variable whose default is
         # "python3". When set to a different value, it allows running a
         # diferent version than the default official python3 package.
