Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976993A6B9A;
	Fri, 15 May 2026 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852144; cv=none; b=lOsqpJ2ZwYye40PYRxO3t7n1EH4Gu6Dx+ibEGgAK47Sxbkf+HQ4AZQRbHD7jD6CasFpwdyiB4WWcxdgwUgIVOwGzwWtxatOTU9pMEvFM8tIixgUddHcbBB9h0W2a3jEaGSr0eBGG5LNpV3+BQRoN9xndG6EIeonpM6t1++wWzFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852144; c=relaxed/simple;
	bh=8GD1gKVuwGQucPolXcCkhyRsiYMHuNffE2l6sapRGMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g6OZ+NUkivAFn+fnnl1UOs+j9tGjsSFar7+jepfAkRYIHKTNWce05rRCMafPm+GPPXzwpSydwgFC+cbiMtv5AAdtxx5Es3SFF+AYF2Ly5E0E6D0dYzFsOwra6X/268TRjTKz1eF0GS32GvlHvpLdMoclR5yQnLWXx0rmC1+tEOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Y1HSqQrk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Y1HSqQrk"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 330A9410BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778852139; bh=5lTX6o4dkW1Gxz38ZvpqhltY0VE3KOcPwyoqVkn6GWk=;
	h=From:To:Cc:Subject:Date:From;
	b=Y1HSqQrkrve8dMDQSZ5n+Bxe2kaM3H5xlzoEeVHDoZNhbQMrKqcLIAeFQC1aUWiUG
	 naFdh35HHnPv871eYAGnYu1Pa3gAj+/WYUG+TtT5CmnVJTMR3xPaP+Marlka2bk3p1
	 lryfLXu1Y0kYOohdw8U1uUuWp0c80D4hwLzfWeSW+4U5Ib4tKH8S4K73PXqcOM5/oT
	 j4QKq2A8uAw7+QKgMFoa0lJip4cE8Qccn06FOoXszQJyV8CqIygLDSxr2dvD1FmWW8
	 5zjdVB9m7w9Dgu7BkMdeBagz3r5r+Hc9RXx85uJeOLCDbP4bHlW7OON10ALpOjC/7W
	 IJhegnLF1+HRA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 330A9410BD;
	Fri, 15 May 2026 13:35:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Willy Tarreau
 <w@1wt.eu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [GIT PULL] Updating the security-bugs document
Date: Fri, 15 May 2026 07:35:38 -0600
Message-ID: <87lddksslx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.1-fixes

for you to fetch changes up to f2e65e4e5b4b4b9ecf43f03c3fdbe8c9a8a43a9e:

  docs: threat-model: don't limit root capabilities to CAP_SYS_ADMIN (2026-05-14 06:23:44 -0600)

----------------------------------------------------------------
This is Willy Tarreau's new document clarifying the definition and handling
of security-related bugs, which we're trying to get out there quickly on
the theory that some of the bug reporters might actually read and pay
attention to it.

----------------------------------------------------------------
Jonathan Corbet (2):
      docs: security-bugs: add a link to the threat-model documentation
      docs: threat-model: don't limit root capabilities to CAP_SYS_ADMIN

Willy Tarreau (3):
      Documentation: security-bugs: do not systematically Cc the security team
      Documentation: security-bugs: explain what is and is not a security bug
      Documentation: security-bugs: clarify requirements for AI-assisted reports

 Documentation/process/index.rst         |   1 +
 Documentation/process/security-bugs.rst | 106 +++++++++++++-
 Documentation/process/threat-model.rst  | 235 ++++++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/process/threat-model.rst
