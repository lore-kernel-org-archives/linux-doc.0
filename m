Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244F31EB5B
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742890766; cv=none; b=XdTLCy0YX4w9A7bdkvy7GtKDJSv5Mg94EI5HCCEd2ANMNfrT08OYr1jaGT+gZCGZE/oUbBrShbwLj/YQucz63C+TX/f9KJTkztXQ/fbGTzGKZCIZxT1FPF/9VN2zLbGZcH/LQEgE7B919DuM2NiiFrCy5unxfbC3XEUn3e3kVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742890766; c=relaxed/simple;
	bh=iQjYbWiuI+Rro/22AXVrd4N1B95T3uC+/PRfaOXO+uM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nKotCm+mo4bFNfA1RpnpWr9pFDMaxZRD4F1nfJsQmLOzbYdTewHIGxelH7EAiGHEVVsukgqdYRxG40YCKhm/xI/OCwqqksZ2AyKXtArcJ2CI4v5lHSnQZmoOMIn75E8l5lueedm/a7mwaTbnuSRwmYUbgyxKwasDpdvQ1yV/dyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o+Kj4RSB; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o+Kj4RSB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742890762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7P5a4e+jIJeu8qnaApGO6qK7zS0rs8XI+2TFRV6Pjlo=;
	b=o+Kj4RSBAhtpLE73g6ny5UJeVS86vYNnaTHl/t/VJf7p7s5rkUjhRGE3LAsVT+B+2lndOK
	BMhKttsCjKSh280/d0l+eLhMFh6LilEVSc/P6mOtwXngqGd2wgUYZ9dfc5dwSr0qd86jta
	AXZunNRJuaPUkZy7xQlC1z9uI8x7bfo=
From: Yanteng Si <si.yanteng@linux.dev>
To: alexs@kernel.org
Cc: Yanteng Si <si.yanteng@linux.dev>,
	corbet@lwn.net,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] docs/zh_CN: add Chinese trans guide and change Yanteng's email
Date: Tue, 25 Mar 2025 16:18:53 +0800
Message-ID: <cover.1742889962.git.si.yanteng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

v2:

* I adopted Dongliang's comment and revised the repo address.
* Change my email. I'm really sorry for the long delay.

Yanteng Si (2):
  docs/zh_CN: Add how-to of Chinese translation
  MAINTAINERS: Change Yanteng's email address

 Documentation/translations/zh_CN/how-to.rst | 445 ++++++++++++++++++++
 Documentation/translations/zh_CN/index.rst  |  24 +-
 MAINTAINERS                                 |   2 +-
 3 files changed, 458 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/how-to.rst

-- 
2.48.1

