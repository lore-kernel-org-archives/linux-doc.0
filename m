Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5093AB29E;
	Wed,  8 Jul 2026 21:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546554; cv=none; b=fRlyIbDg6SwmXHZm7BVsMB9KIT9GKzGQkgIRCS9QrR68aBMgQFImP/KfWzzq3SIkpY7YJeqEZ6w5jaEymqW2MjBo5BbkFFEmR9qm/Zg993xOvn9PE3ZHo+9axYxR7VfwZkzLrnrR1XjT5iTgiWuC67pKw6YAQdcYKo4cZfU1eCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546554; c=relaxed/simple;
	bh=v/alvAQP+jlzA+aPsb7wsJALL8BWeqnB0RmIUKanbEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t909ToSFc+9Nn6PUgeACUnsa1c90E5fOypchNkNLTEJsG5U4rk8dcX0siBN35Fb0mJ57jPcotXIDgB2fNlXbqHEPEOicu1iEO9NS03EpS5CLq+WfCdKapz9Uh+h862RlSWPt60DF9PTdJC7i5t4W3IGPuZQ4gcCIDEkRdWla0dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1YurD4Bp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1YurD4Bp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=v5GQi58UpKN/xjPR77HNmT/9H9qJkRbf6vrytCHrfhY=; b=1YurD4BphaNx7EJvKravGeZ5f3
	STQE+OxHlj4n5qi4TV9obhX9YI2u++s8edlTugW83CTAFB0W/FMf6D9likbdfWwxEReUSj1vN5aaK
	if3Xn/kz7QVu/cxxRPEddlRzdjt2ya1Jh00ONYsz3qZjyaietR18jRY/i8xx8KuO/OMbnpnurk+GG
	MXnLGnZk7z3b+C+wz9r+mW1/npZeWajHTUfPu4tanNSILdY1Uzb2ZFU29noQCXmzoFWjzLQoKFYhV
	P3ol4yQaZbxCzmfB29c5vD3kj+yYSBBYKYgzfnbo1gBtIChepwgwXLv5gtx6Qa4F9kplY+eRIb38S
	HwmKTjEw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZvp-00000000SCc-0q1x;
	Wed, 08 Jul 2026 21:35:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Zhen Ni <zhen.ni@easystack.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] mm/page_owner: avoid docs build warning
Date: Wed,  8 Jul 2026 14:35:48 -0700
Message-ID: <20260708213548.469155-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix literal block and indentation to prevent a docs build warning:

Documentation/mm/page_owner.rst:70: WARNING: Literal block expected; none found. [docutils]

Fixes: c34eea8cecca ("mm/page_owner: document page_owner filter")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
OK, there may be a better way but I didn't find it.

Cc: Zhen Ni <zhen.ni@easystack.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-mm@kvack.org

 Documentation/mm/page_owner.rst |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20260706.orig/Documentation/mm/page_owner.rst
+++ linux-next-20260706/Documentation/mm/page_owner.rst
@@ -65,14 +65,15 @@ un-tracking state.
 Usage
 =====
 
-1) Build user-space helpers::
+1) Build user-space helpers:
+::
 
-To filter page_owner output:
+   To filter page_owner output:
 
 	cd tools/mm
 	make page_owner_filter
 
-To sort and analyze page_owner output:
+   To sort and analyze page_owner output:
 
 	cd tools/mm
 	make page_owner_sort
