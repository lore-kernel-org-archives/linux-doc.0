Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4552DCBF2;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=dut3wseYOotH7hbMdNmewU52TeQfeY7H5+l+k+h6tecQXHDrG7SmpnN9pddb3t4nCIx28MlYsiXdtLyyjQkLCBR/I8Hvo9HWIzPhjdHLkvx4iuImbWw86hJNxHuDdpHCw1yukyIB6WVL03x+dT1Z3GH2aHOdNd06DWCIkmDtCpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=CbT9W7kjxqMTDt7gP2oqff7b5O437PLlcjqYfbAgISA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QxkGeDKYiqCba2kva6wMFtdMdgURtCJAJXfRC9hDVf+hhzjqlPgeBoyvp3DCJDt47zYHwb0EW7wA1uGsD6LoUjL1/bahmhLPRDI37Wf86ZaeqYLNUZ/Nxg7UmRNQLiBgkwv6U24kIvRUKwtc8W3eSecrYG0bglRtqmJ+tLBRV+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hH1COFGM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hH1COFGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E87C116C6;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=CbT9W7kjxqMTDt7gP2oqff7b5O437PLlcjqYfbAgISA=;
	h=From:To:Cc:Subject:Date:From;
	b=hH1COFGMylm5aFzvTlPr3moA9LAUjFt3X4uuj0brYTnJkq9yj2lavqfagTVWmPmIE
	 WUvUfgyunKSkInts+qvCbsQGqZBz4sF/WRPYr2Ft5p2NncWEUJ1p6cok0KpO4Kpyjo
	 AtHXvdB8PRvNaz/ldtbSsXXpPwVAkR2IW99otvYTc98IOA+1tq/94ltUDJCFEJJ2Fc
	 JjgZe+dK5uuQYUoz9OfdyQpLnDnltHPm+t1ZiuSVvgNJf7zARB+oPYxnIlY4g1Xo5z
	 9iExOgGzwak3WVSbwgnsRglKCD4iNFWeQfvJXFGIRHyolkVGGOO/CD3/mJcKNxIOHZ
	 Q3fD8BSeYmp6w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j1N-0Lz6;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Petr Vorel <pvorel@suse.cz>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 00/25] Add tools/lib/python modules to Documentation/tools
Date: Mon, 19 Jan 2026 17:23:03 +0100
Message-ID: <cover.1768838938.git.mchehab+huawei@kernel.org>
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

This is an extended version of:
    https://lore.kernel.org/linux-doc/cover.1768488832.git.mchehab+huawei@kernel.org/

It basically adds everything we currently have inside libs/tool/python
to "tools" book inside documentation.

This version should be independent of the other series yet to be merged,
(including the jobserver one).

The vast amount of changes here are docstring cleanups and additions.
They mainly consists on:

- ensuring that every phrase will end with a period, making it uniform
  along all files;
- cleaning ups to better uniform docstrings;
- variable descriptions now use "#:" markup, as it allows autodoc to
  add them inside the documentation;
- added some missing docstrings;
- some new blank lines at comments to make ReST syntax parser happy;
- add a couple of sphinx markups (mainly, code blocks).

Most of those are minor changes, affecting only comments.

It also has one patch per libarary type, adding them to docs.

For kernel-doc, I did the cleanups first, as there is one code block
inside tools/lib/python/kdoc/latex_fonts.py that would cause a Sphinx
crash without such markups.

The series actually starts with 3 fixes:

- avoid "*" markups on indexes with deep> 3 to override text
- a variable rename to stop abusing doctree name
- don't rely on cwd to get Documentation/ location

patch 4 adds support to document scripts either at:
    - tools/
    - scripts/

patch 5 contains a CSS to better display autodoc html output.

For those who want to play with documentation, documenting a python
file is very simple. All it takes is to use:

    .. automodule:: lib.python.<dir+name>

Usually, we add a couple of control members to it to adjust
the desired documentation scope (add/remove members, showing class
inheritance, showing members that currently don't have
docstrings, etc). That's why we're using:

    .. automodule:: lib.python.kdoc.enrich_formatter
       :members:
       :show-inheritance:
       :undoc-members:

(and similar) inside tools/kdoc*.rst.

autodoc allows filtering in/out members, file docstrings, etc.

It also allows documenting just some members or functions with
directives like:

    ..autofunction:
    ..automember:

Sphinx also has a helper script to generate .rst files with
documentation:

    $ sphinx-apidoc -o foobar tools/lib/python/

which can be helpful to discover what should be documented,
although changes are needed to use what it produces.

Mauro Carvalho Chehab (25):
  docs: custom.css: prevent li marker to override text
  docs: conf.py: don't use doctree with a different meaning
  docs: conf: don't rely on cwd to get documentation location
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
  docs: add kabi modules documentation
  docs: python: abi_parser: do some improvements at documentation
  docs: python: abi_regex: do some improvements at documentation
  docs: kabi: system_symbols: end docstring phrases with a dot
  docs: kabi: helpers: add helper for debug bits 7 and 8
  docs: kabi: helpers: add documentation for each "enum" value
  docs: add jobserver module documentation
  docs: jobserver: do some documentation improvements
  docs: add parse_features module documentation
  docs: parse_features: make documentation more consistent

 Documentation/conf.py                       |  23 +--
 Documentation/sphinx-static/custom.css      |  12 ++
 Documentation/tools/feat.rst                |  10 ++
 Documentation/tools/index.rst               |   1 +
 Documentation/tools/jobserver.rst           |  10 ++
 Documentation/tools/kabi.rst                |  13 ++
 Documentation/tools/kabi_helpers.rst        |  11 ++
 Documentation/tools/kabi_parser.rst         |  10 ++
 Documentation/tools/kabi_regex.rst          |  10 ++
 Documentation/tools/kabi_symbols.rst        |  10 ++
 Documentation/tools/kdoc.rst                |  12 ++
 Documentation/tools/kdoc_ancillary.rst      |  46 ++++++
 Documentation/tools/kdoc_output.rst         |  14 ++
 Documentation/tools/kdoc_parser.rst         |  29 ++++
 Documentation/tools/python.rst              |  13 ++
 tools/lib/python/abi/abi_parser.py          |  33 ++--
 tools/lib/python/abi/abi_regex.py           |  26 ++-
 tools/lib/python/abi/helpers.py             |  42 ++---
 tools/lib/python/abi/system_symbols.py      |  14 +-
 tools/lib/python/feat/parse_features.py     |  27 +++-
 tools/lib/python/jobserver.py               |  20 ++-
 tools/lib/python/kdoc/enrich_formatter.py   |  20 ++-
 tools/lib/python/kdoc/kdoc_files.py         |  23 +--
 tools/lib/python/kdoc/kdoc_item.py          |  18 +++
 tools/lib/python/kdoc/kdoc_output.py        |  60 ++++---
 tools/lib/python/kdoc/kdoc_parser.py        | 169 +++++++++++---------
 tools/lib/python/kdoc/kdoc_re.py            |  18 ++-
 tools/lib/python/kdoc/latex_fonts.py        |  95 ++++++-----
 tools/lib/python/kdoc/parse_data_structs.py |  62 ++++---
 tools/lib/python/kdoc/python_version.py     |  20 ++-
 30 files changed, 607 insertions(+), 264 deletions(-)
 create mode 100644 Documentation/tools/feat.rst
 create mode 100644 Documentation/tools/jobserver.rst
 create mode 100644 Documentation/tools/kabi.rst
 create mode 100644 Documentation/tools/kabi_helpers.rst
 create mode 100644 Documentation/tools/kabi_parser.rst
 create mode 100644 Documentation/tools/kabi_regex.rst
 create mode 100644 Documentation/tools/kabi_symbols.rst
 create mode 100644 Documentation/tools/kdoc.rst
 create mode 100644 Documentation/tools/kdoc_ancillary.rst
 create mode 100644 Documentation/tools/kdoc_output.rst
 create mode 100644 Documentation/tools/kdoc_parser.rst
 create mode 100644 Documentation/tools/python.rst

-- 
2.52.0

