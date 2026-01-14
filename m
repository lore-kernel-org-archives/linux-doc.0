Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46E9396B7C;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396652; cv=none; b=VR0MLZ0dj4ukrA69R5vKzGOWifA6w1HneAuRDQpQak3MLj9pHE+f2PBk4hu6CBDdbUj5mYEctKF/k/6nYndHYAAC58WA7qGmvi8z8jl1N24cXn3xzn47q/EJsWJNWf4wnZrJLetkHtmj+PoBD1VNgrYyGpWu2jaKibVXeyMz2Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396652; c=relaxed/simple;
	bh=8EV2kMyHFBYOwDJy/B32qhN86aNNNl5vCgBCa/qBL8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pSv7NvS+Kg1jqKZVQXDVKCYjW3zXu8wb/2cboGrPjBuVmHkqWtVoo4jt+gjMuJ04W3x2ZtvRtWA/lAhkwBSLgynY0cNpUM4tmfjxgDM71juEhtBCu35916Bt1AsRJbYFyubz95jjGPB342791TUY2FCRqQB8q9I5IxUL2MDoHwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/Kz0T9T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/Kz0T9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70459C16AAE;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=8EV2kMyHFBYOwDJy/B32qhN86aNNNl5vCgBCa/qBL8Y=;
	h=From:To:Cc:Subject:Date:From;
	b=o/Kz0T9TiY45qPOcyKHTBQpZ6dstSC4u18o6n7dc/LCsNPdSq2lnZQutLceolEMPH
	 EUeySdJzaUPxa2MrM1ZVXM9FahV3O/XmcF/gQDY7tbiVyMp8iFBLviP7/P3arUrFK3
	 ZpMwFZFmEdNPbmIXCaON7gU+1oc3qpvr9kbXCOGyegjvAuK6ZuQmZmBjXhgMn8ZLb6
	 nHgnL7+YVDYTnDoLPZU4ymxDpEoZmeFzzgFip59vjIzJyXKBVGA3Gz97JSzQ9GXUb6
	 W7T+wjwGamWB2s5UiWj2hNtVKFXFXq9eMZsasZj8Uw24YhSk1LHrrDjYLyX292Stg6
	 hZl0x73sizcGg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002mxV-2p6K;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 00/13] Add kernel-doc modules to Documentation/tools
Date: Wed, 14 Jan 2026 14:17:13 +0100
Message-ID: <cover.1768396023.git.mchehab+huawei@kernel.org>
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

This is the splitted version of my RFC to use sphinx.ext.autodoc
to document kernel-doc modules. It documents only kernel-doc
modules, but, once we merge it, we can document other things.

This series comes after:
    https://lore.kernel.org/linux-doc/cover.1768395332.git.mchehab+huawei@kernel.org/T/#t

patch 1 is actually not directly related: if fixes a bug I noticed
on Sphinx indexes with a large maxdepth;

patch 2 adds sphinx.ext.autodoc and place the directories where
python modules can be found. It doesn't use the extension, though.
This will happen only at the final patch;

patches 3 to 12 are basically documentation cleanups and fixes that
ensure that the documentation will be complete.

patch 13 creates new *.rst files that points to python.lib.kdoc
files.

With this version, python files inside tools/ or scripts/
can be documented, but there is a catch (probably due to PEP8):

    - files must end with ".py"
    - file names can't have "-".

So, unfortunately, we can't document kernel-doc.py, except if
we rename it to kernel_doc.py.

As I mentioned at RFC, we could use:

    $ sphinx-apidoc scripts tools -o foobar
    $ sphinx-apidoc tools/docs -o foobar
    ...

to generate .rst skeletons with the modules to be added, but
manual work is needed afterwards.

Mauro Carvalho Chehab (13):
  docs: custom.css: prevent li marker to override text
  docs: enable Sphinx autodoc extension to allow documenting python
  docs: custom.css: add CSS for python
  docs: kdoc: latex_fonts: Improve docstrings and comments
  docs: kdoc_files: Improve docstrings and comments
  docs: kdoc_item: Improve docstrings and comments
  docs: kdoc_parser: Improve docstrings and comments
  docs: kdoc_output: Improve docstrings and comments
  docs: kdoc_re: Improve docstrings and comments
  docs: kdoc: parse_data_structs: Improve docstrings and comments
  docs: kdoc: enrich_formatter: Improve docstrings and comments
  docs: kdoc: python_version: Improve docstrings and comments
  docs: add kernel-doc modules documentation

 Documentation/conf.py                       |  11 +-
 Documentation/sphinx-static/custom.css      |  12 ++
 Documentation/tools/index.rst               |   1 +
 Documentation/tools/kdoc.rst                |  12 ++
 Documentation/tools/kdoc_ancillary.rst      |  46 +++++
 Documentation/tools/kdoc_output.rst         |  14 ++
 Documentation/tools/kdoc_parser.rst         |  29 ++++
 Documentation/tools/python.rst              |  10 ++
 tools/lib/python/kdoc/enrich_formatter.py   |  20 ++-
 tools/lib/python/kdoc/kdoc_files.py         |  23 +--
 tools/lib/python/kdoc/kdoc_item.py          |  18 ++
 tools/lib/python/kdoc/kdoc_output.py        |  60 ++++---
 tools/lib/python/kdoc/kdoc_parser.py        | 175 +++++++++++---------
 tools/lib/python/kdoc/kdoc_re.py            |  18 +-
 tools/lib/python/kdoc/latex_fonts.py        |  95 ++++++-----
 tools/lib/python/kdoc/parse_data_structs.py |  62 ++++---
 tools/lib/python/kdoc/python_version.py     |  20 ++-
 17 files changed, 430 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/tools/kdoc.rst
 create mode 100644 Documentation/tools/kdoc_ancillary.rst
 create mode 100644 Documentation/tools/kdoc_output.rst
 create mode 100644 Documentation/tools/kdoc_parser.rst
 create mode 100644 Documentation/tools/python.rst

-- 
2.52.0

