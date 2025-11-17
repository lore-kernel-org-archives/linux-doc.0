Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999031B82B;
	Mon, 17 Nov 2025 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370792; cv=none; b=pij6/onm+s96SLCPoIatcl2V5HZsWmShjq/d2TI7ZtEkTkOvs93ZusnUn+96LlgS0Ew2XU9sFTDV1E7JZJ700t50P9QSzXyE2GO04D1J2zsKMzw56VqzP58T7J2XsUPLgVgVJHnfPkoXjkH62JBUQFz2NvmUk+jiZDgkIzgK4iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370792; c=relaxed/simple;
	bh=zFdnFdmkuRTH5ThgWN2ZSCg7lo6xDUPhUILj20tUuXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IitwgWac2ZJotS2yqOhlDN1/ASKCJlJLsXIAa/d+KR7WCPKFPlVT3/w3rw9dge5VXEfho5s3iBd85oVgvSO4n8beLrpSOSu1q+bTO9B1yLj+ryKoBr0PJ9KZj0qNERksgaw+Jpc9IAvdtkUVKkwrfuG6mCHYx2oKf84h6PpX8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjFTdFk4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjFTdFk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED02C4CEF1;
	Mon, 17 Nov 2025 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763370791;
	bh=zFdnFdmkuRTH5ThgWN2ZSCg7lo6xDUPhUILj20tUuXk=;
	h=From:To:Cc:Subject:Date:From;
	b=PjFTdFk4iQa8qn1NF2BIfk9ErGlGRoBWXxSbzgmP6uFBH2s6kaj1Mzqy/pMOnB0Rc
	 VZPJdXR4jJ7YJwoxKQyuWndmr2C7s9wr5P8jaOm3IWDPG67yu88pk9eg3AmiUvYneA
	 1DD4OxW6XHrEw1Pu6rXgr5V1KcoeO80wRjUWObdLOdNF8rqGxGpnQw5o9Fm93/pinN
	 ZKNJ3lOz4rQ6tQsDK6/0w+HDhoJQV8vgDZlnbG+cNbqVbVj+HELncLWA5yRxAKhVBi
	 PMHOvBujODsnffbEjjdBBi2/Wv5zJiglzUJaFiHOQ4B3ggOXN2ikXeaDaBeN55a2VH
	 wkp8ZiA4+fIUw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vKvIL-0000000Ggt6-2mSl;
	Mon, 17 Nov 2025 10:13:09 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 0/1] fix rustdoc build detection
Date: Mon, 17 Nov 2025 10:12:50 +0100
Message-ID: <cover.1763370163.git.mchehab+huawei@kernel.org>
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

For whatever weird reason, at least here sometimes rust config
detection is failing, causing the logic to try building the Kernel
as well, after building the docs.

After some tests, I'm opting to move the rust detection to be inside
the wrapper, at it sounds to me that the building system is not
evaluating well CONFIG_RUST here:

	ifeq ($(CONFIG_RUST),y)
	       RUSTDOC=--rustdoc
	endif

Another alternative would be to modify the rustdoc target inside
rust Makefile to make it dependent on htmldocs, but that would require
more work.

Mauro Carvalho Chehab (1):
  docs: makefile: move rustdoc check to the build wrapper

 Documentation/Makefile          |  6 -----
 tools/docs/sphinx-build-wrapper | 41 +++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 15 deletions(-)

-- 
2.51.1


