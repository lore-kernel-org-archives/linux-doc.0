Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131BD347C6;
	Thu, 27 Nov 2025 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225089; cv=none; b=Yu4HoQ0MBi6ZdnPugHrbtzdqztFNs3TfOAhqGwDUydLpkD01JtaFOGXpGXUUdqiCTv45sUd7Fob9j8J1AMC2J5T2717N5Qrn5BkQh4Cg4hSEQkZ+fnSglSTNYsM+rVYQyWb3TiYrgtreWlNOc0YJg81CaEZ32o2DRvLN7tJAVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225089; c=relaxed/simple;
	bh=00qqhcVljCWdQ5LFRtBQVYmRmLx6s1tn+llUdVnW/C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/iTkr2LHTgjDg/kXsiVr4LyW+qB4elA6HP6ECZCG0dBr3qnUzdw96tshhsQ7H1wKS6omqIocMLy4NTNiBhYwp+6TSNSRyXJv4zwtYu+bEuAcvdEu09CgJHsmCvnCi0/fF5t4HYqWVkEEUvBXg34+5OYao3LU8Ggm4ilncLjQ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O6CSMpZI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O6CSMpZI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=J9Y2t4oo1XReM1F4yhR3+NuD3WCpVip6b+X9v5xZU8A=; b=O6CSMpZIr37NJnD/JEZfyRpUWB
	yGFbkPTFfo1UY0Jfl+fPZkg8pmKzyy3aM9PwYp7N74AfQnY432wsKrh7PupJ6PUl9s0wfVRXMVVsx
	ZLAK9xPcxYmBdE46mZvp4WVf+lZKXU5NjcR6tX7mcF6PAcW6aobuAteNA91q9EqpApvBgFfyA0OHc
	Etahk8uZ48DXhTnQznxSFGbtbaWRtR+ZZUb8sfw200d4TKr8QBPVU/0hVTW6pdrPs/+f3J+w4Skvz
	uchQIoCk97IcRj6/jjOXCpIlxigAqVEOc8WC1XKtMO+Y454jIWErIXjPqXPNGcc7f2yPiwfyhXTDj
	T4QqN3Gg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVXK-0000000G3L0-1igC;
	Thu, 27 Nov 2025 06:31:26 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: MAINTAINERS: update Mauro's files/paths
Date: Wed, 26 Nov 2025 22:31:25 -0800
Message-ID: <20251127063125.150441-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Mauro's F: (files/paths) entry for docs scripts so that
get_maintainer.pl will report these correctly.

This is copied from Jon's entries for these paths.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org
---
 MAINTAINERS |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20251127.orig/MAINTAINERS
+++ linux-next-20251127/MAINTAINERS
@@ -7559,6 +7559,8 @@ M:	Mauro Carvalho Chehab <mchehab@kernel
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 F:	Documentation/sphinx/
+F:	scripts/kernel-doc*
+F:	tools/lib/python/*
 F:	tools/docs/
 
 DOCUMENTATION/ITALIAN
