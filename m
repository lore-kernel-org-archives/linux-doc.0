Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1E22E40B;
	Sun, 15 Feb 2026 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771175970; cv=none; b=UcPFMjf4zV5oqQsx22rR0lIvAikT0Zkn8c+une4zZtG+dCLw3haoQlaqfZoD59MiOPRNSMY8FutCD1yfW1BODE53A8ccZMlFuKnaqbWn0wzBY02WNvx/DAeO6niI9jzYC4Da5BBtxe78nqKxs8LZ3/CQUwElpMpZ/gF49nSEcr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771175970; c=relaxed/simple;
	bh=UD7EjHwgToBu4e1/EyL2ZjM+ykC9wBzNC/lQ9ndldvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hc5KO5dPzINhqHECWxOewppWQnM7F3iodCC6bLzaUvetawCLePSSWEBu1eE05SGDKqD/MyaOgO3gdh/ilFsSfZkJjMhxj2hPS+uZDRZGvbUFmtJarw9if/jeYDbkluVJla/iYJKYCDaDUxP7uvG18ZN1+E64ksb4W87g2kflxrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=U780CeNX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="U780CeNX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7A14B40C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771175968; bh=ejTkC9IlaWmy3OQvC2bJ6uYnHOcq+02v2MmzJ/f+x+0=;
	h=From:To:Cc:Subject:Date:From;
	b=U780CeNX78IgjCSl45N1wzpF+Wm0ib9v8OKTnclmAxE39G5mpKmvKcPX+9lSj5ZP5
	 Fi8nw7kJftps84qiQIlMbXLhvpe1Lf8lk560nWqBfReAcL+3x12jpY9HYlUWLRtWjj
	 A7m8/2xFXWfyA+DBqSL/2yU+Smy/nQ2VmEG81VdUGUlcWE69Cghn0bnOH5scruAMfz
	 RfQlNz/bzjeciymJnDTKovUESBokm5LBNKZgG0DYA6++gvi36CWuKOh8RM3C9y+UVO
	 ifxIGjQJc953/EZzXkTReXnz96lSyqH2GH8hAlwXlij9RvwtiXWrjrjNuSoYTxHnJ/
	 c0m90Ud6PT/vw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7A14B40C8B;
	Sun, 15 Feb 2026 17:19:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>
Subject: [GIT PULL] Documentation fixes for 7.0
Date: Sun, 15 Feb 2026 10:19:27 -0700
Message-ID: <87wm0dq600.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 0a83293322fde69f1fb4722bd3c79c2d52eef436:

  doc: development-process: add notice on testing (2026-02-02 10:02:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.0-2

for you to fetch changes up to e1e828a1e9a79af76a7cdc271e0a506e496c2eaa:

  docs: toshiba_haps: fix grammar error in SSD warning (2026-02-14 10:17:20 -0700)

----------------------------------------------------------------
A handful of small, late-arriving documentation fixes.

----------------------------------------------------------------
Amitabh Srivastava (1):
      docs: process: maintainer-pgp-guide: update kernel.org docs link

Ariful Islam Shoikot (1):
      docs: clarify wording in programming-language.rst

Berke Antar (1):
      docs: toshiba_haps: fix grammar error in SSD warning

Min-Hsun Chang (2):
      Docs/core-api: fix typos in rbtree.rst
      Docs/mm: fix typos and grammar in page_tables.rst

Randy Dunlap (1):
      docs: kdoc_parser: allow __exit in function prototypes

 Documentation/admin-guide/laptops/toshiba_haps.rst |  2 +-
 Documentation/core-api/rbtree.rst                  |  6 +++---
 Documentation/mm/page_tables.rst                   | 12 ++++++------
 Documentation/process/maintainer-pgp-guide.rst     |  4 +++-
 Documentation/process/programming-language.rst     |  6 +++---
 tools/lib/python/kdoc/kdoc_parser.py               |  1 +
 6 files changed, 17 insertions(+), 14 deletions(-)
