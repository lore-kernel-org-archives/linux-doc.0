Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366EB1DED4E
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 06:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742279407; cv=none; b=DWdldcdj/HjDwIpITtiTQeCDubuoAjYdthvaOHwK12O8/hO3g1B6mFiuRjmfWZ3v95BbcUfkaLrPsyLEq5ZHWfDZWQat1osNSAhJ094fVKRgqmj/M7mBQnE0o6dKpofriqv1ZTzXr/hLUg0Oc0U/GR6aa3ucizuUTQTFlShS6sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742279407; c=relaxed/simple;
	bh=6Te6MXGKvkGnPPHgBjTftAZZGSg5emWGwjq/V3DuYIA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nIepuTYLFDkOUTqMf7jnAJllrn4GtSgCcEn7hpHOb9tvZacNeUcjn5u2+zag81jRy8sCawWYd170tSVpMcWxvlx4yFwSyuwcLvkVbmGUlcAFufJXp4X7ksrMmYkj0wzTWcGF/jI3ZGmXgEzTY5EuahySlEMIb/lMEWFXRiWP19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJp7fVo5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJp7fVo5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2916C4CEE9;
	Tue, 18 Mar 2025 06:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742279406;
	bh=6Te6MXGKvkGnPPHgBjTftAZZGSg5emWGwjq/V3DuYIA=;
	h=From:To:Subject:Date:From;
	b=hJp7fVo5HOqiboz15IvBHoGQDXhqtMAUfcZDz8v47cDPjgOOt1rmTds5ciMbSj7V+
	 iXqjKl7WGol2UAkylGI28bywuGYLPWjSUkYcbpnokwnLvowKbG6resviHAZMu+39mB
	 HDSI+Q6OS0752belmcN21A1PTj9aoKZRXK6HeIw23wz/9Z5NBODrtshGJ2SqVXTzkF
	 6UHBJzhCgOCsedceSiFlnwySlFwqne6uL7RRNbWD04Rjwqjw+sA6etTNn5lN81Ubic
	 AcueI+woqnHJ6t9t8RXstI2zfFi5/FwJvbd9ScVQ5Yf8PqmNWX/XlgzoK81E9S7AH9
	 BVmWp3W++R8nA==
From: alexs@kernel.org
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [GIT PULL] Chinese-docs changes for v6.15-rc1
Date: Tue, 18 Mar 2025 14:29:57 +0800
Message-ID: <20250318062957.2120-1-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jonathan, please merge the Chinese translation docs, thanks.

The following changes since commit 5b8f85d081da449ab35e4bd009d7c00afaab2fab:

  docs: driver-api: firmware: clarify userspace requirements (2025-03-17 17:04:32 -0600)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git docs-next

for you to fetch changes up to c6e686b992f4da3fb9e56f42eb5a1060facf9442:

  docs/zh_CN: fix spelling mistake (2025-03-18 13:36:57 +0800)

----------------------------------------------------------------
Alex Shi (1):
      docs/Chinese: change the disclaimer words

Peng Jiang (1):
      docs/zh_CN: fix spelling mistake

Yuxian Mao (1):
      docs/zh_CN: Add snp-tdx-threat-model index Chinese translation

 .../translations/zh_CN/disclaimer-zh_CN.rst        |   8 +-
 Documentation/translations/zh_CN/mm/balance.rst    |   2 +-
 .../translations/zh_CN/security/index.rst          |   2 +-
 .../zh_CN/security/snp-tdx-threat-model.rst        | 209 +++++++++++++++++++++
 4 files changed, 214 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst
