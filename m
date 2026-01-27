Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0255F2F2607;
	Tue, 27 Jan 2026 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508821; cv=none; b=L8em5zn52F81+1CLnBkXMinFOKXCAjhx0PBLGeZbNfVJK5gFxt2uVNA/b+n6PZrA5rk8nKfzYUkhKlS7sDhrIxBtoI0GKHiEegtzkBaWu4SPpsdEUB3rR1yrjeI64+/bSTdCCcmY0A0OWYYFv6ZGeZkmPmcYm+Gj0s43x/BzdEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508821; c=relaxed/simple;
	bh=ma5TGxBeYuFsOQU1jtgfGBznnRvnOSh1e+V+HCaLiJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JWr3cR0deGT9JX2Tg3EAk3hyLBxLel8xGMAb8fQXxnvTCJI/AypYpycZpqmDdmFrz/98yjr2hICSoC5XKVKvqCXJ3QYMTG6THqTOWV5esmBsyTk94ZJxcE1DaG/SlZD+bf2+zUmJ8dgnr9LUWQD6qkD8B8b9tWLwhCMfXr4rc0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGPv10qw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGPv10qw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E018C16AAE;
	Tue, 27 Jan 2026 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508820;
	bh=ma5TGxBeYuFsOQU1jtgfGBznnRvnOSh1e+V+HCaLiJo=;
	h=From:To:Cc:Subject:Date:From;
	b=UGPv10qw2AoYfPo50gUVpGw4QNc1M6/LxMGvxgUwdbnRCrtoPvfwNic76JBSXFzgc
	 X/j3ucWOcTPKrVMFLNneKRTQ3TzKXjHBNOY6tGHy3ilteRdEo+mxfAjcYGLSB7ZkAy
	 vnSktCvv0KgSIDQe93D4Uzz37voV7G1d4m9lqAq+7lJxCW903lVXYidAS7YpqAkl/Z
	 WfFfA1oRIPQRfa/3fMKoFjJOoFR+RooeVPWYDKaMsF+F9fbuoRQenkSapHw9NXBoXU
	 cCLRlDX5weXLdfisEf9UGrh0jBIeHnAuem5jlf29/Y+LD3pFVZCsomdj+Gr4W6k+st
	 vR2tK9hQYF8mA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4o-0000000BVGE-1Gwu;
	Tue, 27 Jan 2026 11:13:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 00/14] kernel-doc: make it parse new functions and structs
Date: Tue, 27 Jan 2026 11:13:19 +0100
Message-ID: <cover.1769508371.git.mchehab+huawei@kernel.org>
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

There are some patches at linux-next improving support and documentation
for context analysis. Those adds a new set of macros that are not
supported by the pure C Sphinx parser.

Add support by them, extending the usage of NestedMatch to cover more
complex macros.

This series is more complex than originally planned, as we found
a couple of hidden bugs at kernel-doc.

The series were co-developed with Randy, with came up with the
original patch. I ended helping identifying kernel-doc issues and
doing some changes to make the parser more reliable.

At least on my machine, by applying this patch and asking
kernel-doc to parse the entire Kernel tree reduced the
time from 36 seconds to 35 seconds, so it actually made it
a little bit faster.

It should now be possible to document all sorts of function
macros, as one of the bugs is that we were replacing macros
with blank strings, due to the incorrect usage of function_xforms.

Mauro Carvalho Chehab (12):
  docs: kdoc_re: add support for groups()
  docs: kdoc_re: don't go past the end of a line
  docs: kdoc_parser: move var transformers to the beginning
  docs: kdoc_parser: don't mangle with function defines
  docs: kdoc_parser: add functions support for NestedMatch
  docs: kdoc_parser: use NestedMatch to handle __attribute__ on
    functions
  docs: kdoc_parser: fix variable regexes to work with size_t
  docs: kdoc_parser: fix the default_value logic for variables
  docs: kdoc_parser: add some debug for variable parsing
  docs: kdoc_parser: don't exclude defaults from prototype
  docs: kdoc_parser: fix parser to support multi-word types
  docs: kdoc_parser: add support for LIST_HEAD

Randy Dunlap (2):
  docs: kdoc_parser: ignore context analysis and lock attributes
  kdoc_parser: handle struct member macro VIRTIO_DECLARE_FEATURES(name)

 tools/lib/python/kdoc/kdoc_parser.py | 103 +++++++++++++++++++--------
 tools/lib/python/kdoc/kdoc_re.py     |   9 ++-
 2 files changed, 81 insertions(+), 31 deletions(-)

-- 
2.52.0

