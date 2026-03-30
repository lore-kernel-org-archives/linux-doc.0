Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07A19C546;
	Mon, 30 Mar 2026 05:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848133; cv=pass; b=WzxRIhQ3bXOlmk2RdyHB7mE3HBnO4BYf1BI66bfjVx3KEh7xlr4pHjnuQt/8aB2RWJZ1aj3gU9qAJT+K5s0s5olIJGqz+nCmTCgRZbogqXCXDhaG+iidB05EFraU5HjYseK6K1fRbznBA0oaSWx93W/VFBO38aT6lx4J/tbY/bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848133; c=relaxed/simple;
	bh=C4ED+8ihkbPV6XNWJI5NTWtmJhUjvEB9Jzk3a/xDEbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gbM14ZRYpuDhmRHwK9GUxY+58JI7t0mkxXOBcyd5a6mH0Mkv+9hBO1JKETqDNOJeZZ1TA6uBiqg+kuMhCOrzcTOv6IaWhIk7y1cbR9J3kiDe3X3fRSFVxmjzNNn7Gr6UzKkQEy+1lU8JLJR/NrCQdX97Wz4+j+061d8CS8LNBCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=NYtYUvLm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="NYtYUvLm"
ARC-Seal: i=1; a=rsa-sha256; t=1774848127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C+Q1cXNZL/wHpYlV3BGmrVHQG7txQUdTjqVJzvghjEeeqnpjof0H1dsUtYG6v98IHSk9rG229xVnLRZ4tUwSiIEby6HdlamQyk6EzVR3AVQnAx/bKgWoRHRW0kDf02FpL0LRhtoeD25bzqackEjE/UD3mFNoJ+03b8u0phIobP8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774848127; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HgJFb64dBQng2OMjo1wOE9+uzb4GnkFK2OToYwvSP6o=; 
	b=WpQvkuJmmYfPNP7uL1c8IXUcisIIerizkMfO3BhyBWxntJqVY2D2yPo3GeDNZms0rUA4auL9nrn3lrtrGD+/Aw17NvyXJ5e8oncpr0WCgPdwJ+J/vWbjHpNh42Dwo+kKnQmwADMHqpdvJCwSKF225ZhMthKPwcwDc9xqHBHYhCM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774848127;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HgJFb64dBQng2OMjo1wOE9+uzb4GnkFK2OToYwvSP6o=;
	b=NYtYUvLmzZ/D2DtnTXV3vk34rDItncONrfvjNF8pPgFu9X146/vQb42XNMUSYgih
	qNOHA0rRLn2PnHrCTZtVISlEaA0xzQnjnHQjZ3D416sgamkWMq5ZajqtnLPwr6vysh7
	2x9LsCoqIoJ47LFfxlBbcRtj22fJrN+IANhdrOZo=
Received: by mx.zohomail.com with SMTPS id 1774848124057620.6636170017458;
	Sun, 29 Mar 2026 22:22:04 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 0/3] docs: improve readability with left padding adjustments
Date: Mon, 30 Mar 2026 01:21:56 -0400
Message-ID: <20260330052159.11284-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

These changes address a few different places where the first
character of rendered text sits too close to the left edge of a
contrasting container, which affects readability.

Add a small amount of left padding to those areas to create
clearer visual separation from the contrasting edge and improve
readability.

Demo site example (all changes visible here):
https://kernel-docs-pl.ritovision.com/userspace-api/liveupdate.html

Screenshots for this series are here:
https://github.com/ritovision/linux-kernel-docs/issues/5

For convenience, anyone is welcome to post additional screenshots
in that GitHub issue for hosting and reference them in discussion
of this series.

TOC lists - before:
https://github.com/user-attachments/assets/994ec5b6-c044-4f5a-bb58-fbf561481ffe

TOC lists - after:
https://github.com/user-attachments/assets/2bced41d-d0b6-44e8-ae28-3e4f721f47d5

Pre and signature - before:
https://github.com/user-attachments/assets/ec063580-9f5c-460d-afc6-3498917c863c

Pre and signature - after:
https://github.com/user-attachments/assets/b5f87275-e4cc-4687-8ca2-42fabb767c2d


Rito Rhymes (3):
  docs: add left padding to TOC lists
  docs: restore left padding in preformatted blocks
  docs: add left padding to C API signature rows

 Documentation/sphinx-static/custom.css | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.51.0

