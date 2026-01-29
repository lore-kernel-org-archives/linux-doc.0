Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E742032D;
	Thu, 29 Jan 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769701787; cv=none; b=rqCvTWYZqDTkwHeh+/6vZHK9Lz84uvOwuNphySla+Z03fm4boECHczZa7ndmGDJaMmwUjQyHyjbU7TTMrb+j+pnBZ1yiNbwg3+icoVfLXEdWXvDATg3quPpQ3NVd2L+CXhoD+KCBzc9tc9DJj+/ki9gqeOweUNmRd2oYhDPeofM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769701787; c=relaxed/simple;
	bh=RAM6+4iBxLl4gAleeTqb7ivnTYVSUK24jCnRkiFgT2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q0kJ53TIR+uYCby2Cf1qI1tIlAue3mH2qZdYTh/+Olqx4TzMbfvl+qfzQGoShTEbzyyxf+yWxDmPEcAxe9R7RHBOIWAyPMJBfu27BCJKlZUMmnVniRd3g6Vitv+ClwbltxSHuo/E3IMmAh40Bz4MSyIJr6a0rjBTEMgxgOA6Pl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnuUZCAZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnuUZCAZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1FBC4CEF7;
	Thu, 29 Jan 2026 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769701786;
	bh=RAM6+4iBxLl4gAleeTqb7ivnTYVSUK24jCnRkiFgT2U=;
	h=From:To:Cc:Subject:Date:From;
	b=pnuUZCAZfS/SdbN9FfqCkPmvjILqwTyiglQDwCJAokRhe2aw4GzR/VPO5FsehXQEX
	 ZG5Z5JhErdbeers6lIuswjMQWxmipwQa3DksCqweRvsUXhnlxQ8iA0d6TDILVKJauw
	 tUllcUsJiKLfMUvAhQWr2ScEXJ4hgohYH5bXnbR8o1PGKS7pqzVSm0qbhIIORccsfT
	 WP5psADgCI6WERtn3QDFmIGAlEPchunKkN9m7xz324ytcTDZpvs4irBtNFougxy6og
	 fgr1GUgMJ38Hh0ziIQ/+xgrU8+vv9C725L41tamuksrDZdwkRvM1s7LbGiHERw/Wxt
	 2gAzj7PnqvgkA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vlUHA-0000000FNCI-3Yj8;
	Thu, 29 Jan 2026 16:49:44 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 0/1] Make easier to use kernel-doc outside Kernel tree
Date: Thu, 29 Jan 2026 16:49:36 +0100
Message-ID: <cover.1769701598.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This small patch comes after this series:
	https://lore.kernel.org/linux-doc/cover.1769673038.git.mchehab+huawei@kernel.org/T/#t

It is goal is to help syncing kernel-doc with QEMU, as we're using
it there as well for documentations. Yet, QEMU needs to have their
own set of function macros. This change makes easy to override it
at the caller script.

Mauro Carvalho Chehab (1):
  docs: kdoc_files: allows the caller to use a different xforms class

 tools/lib/python/kdoc/kdoc_files.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.52.0

