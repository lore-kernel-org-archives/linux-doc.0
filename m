Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAA22BEFE0;
	Tue, 16 Dec 2025 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895184; cv=none; b=fOOFt4vghr3HbbKVrRSh0TQxkhth4U8dFh8owNZucreq6v6RupI6vzWATHm7AINF9pRjoI/TZrDCSrrnxG/INHBtFAWg+Fe4DSD2kvWhT3nU3CUOFI7r5pPo8TfrO5r30BvYsmDb+wqo57w7u5NmIHhxcUp/7Xm37YIF0vj6Pf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895184; c=relaxed/simple;
	bh=2+8djzziUT1HJxYS1cxp2nY8rSTd0qsSmIlSCq7Cu+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmpktAtkY8ANKJhg3kidhxSx1sw3p3LbY4aAA4T8B1sZDPPndyOsq4jJop/NKXXtoQFZYnrFFD4s2DOsis9ZW+/cPWeiEc7jDGe+a9uB1f4NsvdfbliqSYqKD/CUiaXUpAeDhS6dPVFpmrb8wtnwiU9h5IjqAIG2COzhE46ATDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G098wVE0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G098wVE0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F8BC4CEF1;
	Tue, 16 Dec 2025 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765895183;
	bh=2+8djzziUT1HJxYS1cxp2nY8rSTd0qsSmIlSCq7Cu+g=;
	h=From:To:Cc:Subject:Date:From;
	b=G098wVE0eJDX8qGj95M5KzNwpmS7QRa0JgvP5kE+MEVOkRfkcIAUfhwjk8BrOGRAC
	 kRCVk0p1xZ6NtwrsuGYWLffXmlF48ICUBiB+gLNhW9Mfij8QthO9lswndo2b66gmF3
	 lK1qjSJYhDDjBP/TRudh2MpyqHQR+98XjcMkOaKowfPZFcxPMUCIzbFRohk3Ne5mSl
	 Ut/saLYowbfNwJAyvHm2wbeVc+wrbXznOEH2c2Am9/Y5KRh/mdGCutQMhIallQlR4Q
	 FAOZrSEXchCAnWVKmRDMN2jZTFhyru0lyrtH6IDLnnEDGi4BxO1+A27e8DMg2EaUFa
	 vtMUo9dkE9fQA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVW0L-00000000sr4-3kOo;
	Tue, 16 Dec 2025 15:26:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v7 0/6] kernel-doc: add support for documenting vars
Date: Tue, 16 Dec 2025 15:26:11 +0100
Message-ID: <cover.1765894964.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

Please ignore v6. I ended adding a R-B at patch 6 instead of on patch 5.

As suggested and discussed with Randy, this small series add support
for documenting variables using kernel-doc.

- patch 1: add support for the new feature;
- patch 2: extends to support DEFINE_*;
- patch 3: document two media vars;
- patch 4: fix an issue on kernel-doc.rst markups and automarkup;
- patch 5: document it;
- patch 6: better handle DEFINE_ macros when they don't have static/type;

Since version 5, I'm using "c:macro" to describe variables, as it
avoids Sphinx C domain to try parse the variable. This makes it more
flexible and easier to maintain in long term.

---

v7:
- fixed a reviewed-by: it should be at patch 5, not 6.

v6:
- added patch 6

v5:
- use ``foo`` for prototype and on patch 3.

v4: 
- document the new markup;
- fix an issue on kernel-doc.rst due to automarkup;
- add support for DEFINE_* macros

Mauro Carvalho Chehab (6):
  kernel-doc: add support for handling global variables
  kernel-doc: add support to handle DEFINE_ variables
  docs: media: v4l2-ioctl.h: document two global variables
  docs: kernel-doc.rst: don't let automarkup mangle with consts
  docs: kernel-doc.rst: document the new "var" kernel-doc markup
  docs: kernel-doc.rst: Parse DEFINE_ macros without prefixes

 Documentation/doc-guide/kernel-doc.rst | 48 +++++++++++-----
 include/media/v4l2-ioctl.h             | 15 +++++
 tools/lib/python/kdoc/kdoc_output.py   | 46 +++++++++++++++
 tools/lib/python/kdoc/kdoc_parser.py   | 79 +++++++++++++++++++++++++-
 4 files changed, 172 insertions(+), 16 deletions(-)

-- 
2.52.0


