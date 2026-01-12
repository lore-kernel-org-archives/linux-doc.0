Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D79356A20;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217036; cv=none; b=W/+1y7XkQg1D6cpCB9Oy2/S6iOb7BR1Z3Oa6Iq2YafG686bK3DUcOqFBoJVgTSkAb3f/UlefEy18tGoPD+31YcdYzSd6piwYsdbf9ST1zs1Mcjc/sq6wpViMSnQ8nxOPtxWf7lnh3OVzJlCK/O8di+S26EcGHROw5z6NeEdbQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217036; c=relaxed/simple;
	bh=HXCHkQZxUYOmiD4v7uVNwes9ofdaHBpPdZuAyIVbNnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s7q28KRkkA4JURLPKnfSaJoMWvqgLD6mfMyI2WulPhGiQktaPuF6MCVZMerTc7FNAQV/ULaR+HKYMOwMNlwxlWQ9fwUgXXYuyFha04rJk8aLXa70gL//Sv6af2LJdw0uHwlEhhX8Q3It9Yau/PR85n/h1jUcoSGQuVkGFmRiTlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P//jpypA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P//jpypA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130E6C2BC86;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768217036;
	bh=HXCHkQZxUYOmiD4v7uVNwes9ofdaHBpPdZuAyIVbNnY=;
	h=From:To:Cc:Subject:Date:From;
	b=P//jpypAf4Hz+LozKeBw0+k1P54xvl8xlob3fvXvS7brxQk+kGlCOmzNVKP6CE/Pl
	 XX3qfep03SSDsaaQiKGUj6LKFJ0wwH6ZFnlLiIcm1rC48i+Vp5ap+vaYQxM2Mptvzg
	 I7zYJPuGc/roSXZFP9eEJbtouvZ/L3mLl34IENljT15Da/FuhhTPbkRNvYe5ji7ssA
	 LJ3QGI2ptVvmeRs/mhYdJprmZ9YrwXRQQMZeFWLwHD52WAO6zMxoAkfRTcGtxPLomL
	 BQ/k+Q905PlLq+TrXoYnKYWcXfTZKHpb4/LEeQhuhEG0ZYUKHQ7MoEPkxkM2itt0S9
	 XQYE2g9Vw5a/w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfG1a-00000000DTf-0e63;
	Mon, 12 Jan 2026 12:23:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 0/4] kernel-doc: fix -Werror issues
Date: Mon, 12 Jan 2026 12:23:22 +0100
Message-ID: <cover.1768216455.git.mchehab+huawei@kernel.org>
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

As pointed by Jani, and previously by Randy, several warnings
are currently not considered as errors. The issue is related
to changeset 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently
discarded"), which was using directly a low-level interface.

Patch 1 fix that.
Patch 2 fixes a related issue: when there are more than 255
errors, the return code with -Werror can be 0 even on errors,
because of glibc behavior: programs can only use 8 bits for
error codes.

Patches 3 and 4 are not directly related, and touches only
on comments inside python-doc.py script itself:

- patch 3 is just a coding style change to match the comment
  style we agreed;

- patch 4 fixes some English issues on comments. The issues
  were pointed by LLM, which was used as any other spelling
  tool: I picked just the relevant changes, ignoring the ones
  that were false positives. I also didn't agree with one of
  the changes, replacing it by something else.

  I wrote it more as an experiment about how to properly use
  LLM. IMO, it could be useful to use LLM to review spelling
  on docs, provided that the one using the tool will filter
  out LLM-generated trash - just like one does when using any
  other spelling tool.

Mauro Carvalho Chehab (4):
  scripts/kernel-doc: fix logic to handle unissued warnings
  scripts/kernel-doc: avoid error_count overflows
  scripts/kernel-doc: ensure that comments are using our coding style
  scripts/kernel-doc: some fixes to kernel-doc comments

 scripts/kernel-doc.py                | 72 +++++++++++++++++++---------
 tools/lib/python/kdoc/kdoc_parser.py |  6 ++-
 2 files changed, 55 insertions(+), 23 deletions(-)

-- 
2.52.0

