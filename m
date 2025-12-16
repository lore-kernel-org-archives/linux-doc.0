Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E922D2BEFF1;
	Tue, 16 Dec 2025 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894779; cv=none; b=XE7pRF3pFgBcUyg9xf0vWTwIzgQbNmGQ4+0A52mWJouaWortGkSDHVdWEZWPwbh0BywcrK5VUn99PWIUKfTJKm/H/DJKIkfopgvwYpz5zwa4jYR2VF1EeX3kgB7yn4DAWu5ACK/6UtQ0KgFM48cOgDPRntvhrN/CjRn8jnChbg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894779; c=relaxed/simple;
	bh=XO2MgUNOWP2c8g9SA0VTCHevHSrpMg6Q77YxeAD7VrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/g5YV8zmFbYr2HgsmkxmgxpUixLSXLa5CFfo7J5cKBRSCACD3J+t63Xc0l7ooce5/AQy8zp/ZfR4jtbv1ahxAJDEKfy5/Evv5nphQoeITHTo2MH1cRT22f201iG2ncBaRsyQgtXmSJqJeVKwjkkEVUwidkVbtcjiVWEg/EvXNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/nuatkx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/nuatkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6944AC4CEF1;
	Tue, 16 Dec 2025 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765894778;
	bh=XO2MgUNOWP2c8g9SA0VTCHevHSrpMg6Q77YxeAD7VrU=;
	h=From:To:Cc:Subject:Date:From;
	b=J/nuatkxa/P/p77Ei7wnpJPOiidvYQ53KMCKlB71/zlRcYWDpSgZ/jYVCLdMbKyOD
	 1cCi2J3hz2nia7Tx3hruO99b7LKA9jMAm2JKxqmkO/fO23fHWRHlusi34a+LZqFst1
	 DlfHRIgDH8TY5aqvt/qyTaGsXr8UUJde9EPloGx8mtphVFhdNNry2J/Zaoa1EIwyT8
	 GfyDFzHh3DXJbn8CYTuaQSrrIsFgCqlcvl098WfnCdnQU3eBTbTOhOjXCHzpe3UR3g
	 W4bqbK4g+m1fLbvCxcwQLO6ZwEoR0Gb37E45OW6ZXqeBOajAvV4rYsSFBtBrQH7W0Z
	 rDbzEPN8oq30Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVVto-00000000sPJ-25xB;
	Tue, 16 Dec 2025 15:19:36 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v6 0/6] kernel-doc: add support for documenting vars
Date: Tue, 16 Dec 2025 15:19:22 +0100
Message-ID: <cover.1765894670.git.mchehab+huawei@kernel.org>
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

As suggested and discussed with Randy, this small series add support
for documenting variables using kernel-doc.

- patch 1: add support for the new feature;
- patch 2: extends to support DEFINE_*;
- patch 3: document two media vars;
- patch 4: fix an issue on kernel-doc.rst markups and automarkup;
- patch 5: document it;
- patch 6: better handle DEFINE_ macros when they don't have static/type;

On this version, I'm using "c:macro" to describe variables, as it
avoids Sphinx C domain to try parse the variable. This makes it more
flexible and easier to maintain in long term.

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


