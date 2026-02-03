Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A072C3ACEFB;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=j7rs6Q2Y9TtH+olHxnbqWH9dkBMzx/j6owBy3LZdTwQrLQNvcFR83Xp0Ey0gbpMJpr7nBC5p4wSwDcOdxyQ9GCsm3QVv3Ah5z5hrYis1ws8WEavqDtTjqeMNcOranIIGjh1DtJfv01BayLqGaUNSMifxYQd/8hLTVnyelE32TOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=rjYPYvJZXqQuJOofuiN0Kf8CTYyF0WAZo3QvwumSH8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fvI/n1qj08Zsa8XYr3daE4aHeiwJqBs2k6JgU2a2j/z9t2FD70NiIuahCrcfE1aObg1S261j79F8kgwU91IsbP4cBIafTTSfXtzMAxHlQWApUfPuFJfgg4PwlvQQVZN1HWM9O9tGc/3NCBRDcSnksi8u6ym8W8Zl+Bf1j1YhBK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRDN8GE7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRDN8GE7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E218CC2BCB2;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130555;
	bh=rjYPYvJZXqQuJOofuiN0Kf8CTYyF0WAZo3QvwumSH8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sRDN8GE7yACx+mYYZqsJZJpUeBGrKHPcjsn29FdMuyQ10AkIcqIbd49R8kgMkLtZZ
	 MPvX62SV9bxBAANi0CB5XTy0gZCT8DlvEBjya6o4iGtL2wqxAJESwrJFIYu/5uynwC
	 nr/5UrnVGyHEO0AcWWuwH6fSCORBe3qyzXauSEYD0voVGzY/WWuefW0/hJ1KVTIlg7
	 TQ1TwVlh5bBXq0VlpU5kjEAX1tl6qcTRWlRvdM5h864RsxBg3Vcy6ghJBWCikNhyJp
	 7ua5G5dlLZx0DwGLqZSbQbNvdT3QkHfAPjnQqFl4F7pf4LnbGGFRDMMaFwYIbFO6e3
	 L5hy9/dH59QmQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHom-000000027US-3yRi;
	Tue, 03 Feb 2026 15:55:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 06/15] docs: kdoc_item: fix initial value for parameterdesc_start_lines
Date: Tue,  3 Feb 2026 15:55:34 +0100
Message-ID: <ff57dee2523ab906123657b43405059b1b249e8c.1770128540.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770128540.git.mchehab+huawei@kernel.org>
References: <cover.1770128540.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Ensure that parameterdesc_start_lines is a dict at init time,
as this is how it will be set later on at the parser.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_item.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index 2b8a93f79716..c0585cdbcbd1 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -22,7 +22,7 @@ class KdocItem:
         self.sections = {}
         self.sections_start_lines = {}
         self.parameterlist = []
-        self.parameterdesc_start_lines = []
+        self.parameterdesc_start_lines = {}
         self.parameterdescs = {}
         self.parametertypes = {}
         #
-- 
2.52.0

