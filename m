Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD81D2D2496;
	Fri,  2 Jan 2026 20:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767384240; cv=none; b=b+aYxlpkes1U+zehtqKqofTYRTEUDevDlN2oO4FMIRv+s9jdCCqwueKBxTrw9aJKP2CxxqC5E19O5k8KieNkm1Fh4HcEsbYAHYLro8UMsugr2pBaBZCUsX0RgI5HfegjeqCnBLBba8HsveLnxAEDDctI1A87kEBCnlaB7qeu3u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767384240; c=relaxed/simple;
	bh=3X93jyqLowIPmp1q/xC3uijIj/EEa5FgGTepHKkXJfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aPFtvNngfoer5uQZydFWeyqoCmfJMYn4dLCV0aqW9g8ZTxbzz6uHgCc8iIj6H81U47cuBMmGfyAlthWeAKWwbYiOenwQq8KOPehAnjMKLLTC1JJhK0PxZH9aqXFpfni0wNojpTDp4izpVYw2EbuMkC0hzwkeH/axkRxMb4GR2ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=trvwfE3P; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="trvwfE3P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=a4dvmPz6xUUHxKL8F/yIbFaRziGW+axedxpZ8Kw04uQ=; b=trvwfE3POjzpKL4c4Afsm9K7/L
	p/Pa0QW+zq0EIvvGBup+nrQbkNrvqdB58+MjlEkm9m4WNEHX5QwYzhV9s4mRfNOqX8XS7fXY0hTFZ
	0pWnJw41V3fsJGlsuzqJ+QIlvRfAaGSuxQE8hgzvYCl8AmsGD2n/oD7DrmZEYfOhrQNEATK5g69ms
	P8iMOqqqFBuG+X3ci4eiu9F5mqK6iB/Ta/wzqhGfefGwZCSOaTi4Asjv4XiMzk5pW03F/xm9wnlGt
	2jXYMLsuIDhj6/dfOw8vQk/OKxbQaE2cAxKbCGext75Gfv/zo7oFsnjTf00iOS8szLyc4VOUZpfsK
	bWwRbUjQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblNF-00000008goo-0DP4;
	Fri, 02 Jan 2026 20:03:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: find-used-docs.sh: up directory usage
Date: Fri,  2 Jan 2026 12:03:46 -0800
Message-ID: <20260102200346.1038820-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent move of this script from scripts/ to tools/docs/
did not account for the 'cd' directory usage.
Update "cd .." to "cd ../.." to make the script self-correcting.

This also eliminates a shell warning:
./tools/docs/find-unused-docs.sh: line 33: cd: Documentation/: No such file or directory

Fixes: 184414c6a6ca ("docs: move find-unused-docs.sh to tools/docs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org

 tools/docs/find-unused-docs.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20251219.orig/tools/docs/find-unused-docs.sh
+++ linux-next-20251219/tools/docs/find-unused-docs.sh
@@ -28,7 +28,7 @@ if ! [ -d "$1" ]; then
 fi
 
 cd "$( dirname "${BASH_SOURCE[0]}" )"
-cd ..
+cd ../..
 
 cd Documentation/
 
