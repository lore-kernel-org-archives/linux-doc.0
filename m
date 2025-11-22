Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC780469D;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763815087; cv=none; b=NrVAJDOYdaHOYY7Rm3aJTP+WPt7GMYlQpIe+eXbgFkZmzBCcBpp+DorGAaGAnEOj/XKBbbCTrG3/g08mWfk+eBviDnHIQPh/HYxu7tYKR2u59QiRZU9ZqRZmqOznstFpusWPZOLIAQ7q3h27ljsxvRRWpJaL7ym5aGAqH5xM1fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763815087; c=relaxed/simple;
	bh=+0gqiYmRyGMvbc4ri5o4JeM7HQTze8xLtNWwu4zX+ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tEMMOgJ+/To34nyWm1le5loTGf5DFmTPw6FNMOYlNzkhDN0TFCbKEHnoyXxEDowgYLF6TCFkTy2RAKO8EuMuPjxuZd9U2XEjghYCOS1b896DwHCQUWOQaXsysdArhM6j6vUqbt/iTYT4d+q3X8R0eKAiUQ4ytktoApTRgLPl5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/VKDz4i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/VKDz4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9EEC16AAE;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763815087;
	bh=+0gqiYmRyGMvbc4ri5o4JeM7HQTze8xLtNWwu4zX+ZY=;
	h=From:To:Cc:Subject:Date:From;
	b=G/VKDz4itLwqeWW8GE2VS7VKb9ztgQyTPzyEJsHUerGZkLLAQTbfvBuMEcMjDouKh
	 YSu76IiWlVSgyDRjAA6LcM7VyXs6xn9Dlowq6Osq23MaU7NmvkdPHt2tVRBm1Z/wtV
	 gjlYgIvEDMa+KHZmfJ1dzd2fKFtvwi5nDVgEhfwFHbaHilDuZQX5XGA5MpNtkGOdk7
	 RK12rAVIPAn+5XFbsyNJVSGf/D3M7x3IQKXE240M/wYwKo+rP9YieyGaRaqYXP85hf
	 V+P0h21CE9VPYiSw6a2SOZ3tpnjGCQi2KGoqTjmW99NYaGUAQak6ykf9XD9W+E460d
	 YTcMnj3JO8DDg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vMmsP-00000004plz-1ti0;
	Sat, 22 Nov 2025 13:38:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Randy Dunlap" <rdunlap@infradead.org>
Subject: [PATCH v4 0/5] kernel-doc: add support for documenting vars
Date: Sat, 22 Nov 2025 13:37:54 +0100
Message-ID: <cover.1763814816.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

As suggested and discussed with Randy, this small series add support
for documenting variables using kernel-doc.

- patch 1: add support for the new feature;
- patch 2: extends to support DEFINE_*;
- patch 3: document two media vars;
- patch 4: fix an issue on kernel-doc.rst markups and automarkup;
- patch 5: document it.

On this version, I'm using "c:macro" to describe variables, as it
avoids Sphinx C domain to try parse the variable. This makes it more
flexible and easier to maintain in long term.

---

v4: 
- document the new markup;
- fix an issue on kernel-doc.rst due to automarkup;
- add support for DEFINE_* macros

Mauro Carvalho Chehab (5):
  kernel-doc: add support for handling global variables
  kernel-doc: add support to handle DEFINE_ variables
  docs: media: v4l2-ioctl.h: document two global variables
  docs: kernel-doc.rst: don't let automarkup mangle with consts
  docs: kernel-doc.rst: document the new "var" kernel-doc markup

 Documentation/doc-guide/kernel-doc.rst | 48 +++++++++++------
 include/media/v4l2-ioctl.h             | 15 ++++++
 tools/lib/python/kdoc/kdoc_output.py   | 46 ++++++++++++++++
 tools/lib/python/kdoc/kdoc_parser.py   | 73 +++++++++++++++++++++++++-
 4 files changed, 166 insertions(+), 16 deletions(-)

-- 
2.51.1


