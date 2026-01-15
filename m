Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D8B35503E;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=EKpoL3JKDhv5I1bWhwDed1GTZIQ2xxvXvjU9xHOT65btaelD82WuDAZCSIFUucPwdOmaoDzexaQ3ViLaT6eSlY31op0Cv6BRtyEbMAlsxUCOV4RxBd/hg3Qiv006gwvKH7pyXNef1sb3UWMHfNseNl8KYrZCfNbjS3j5ShCIcgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=Ycafl/nefvzv+5S1NyWmgS3jSzFO77lQU9Z4yAw6LOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UKciIsNffcZ5yp6CUgC6ZFbYapdqHaAOejFuMbvpjHrv2YE0WWSDoolmn/jizlnY2DLck5GXU2ZKpj+0j41qzvQk/gqufuTTlWxSQqSf3j1SSSarPcZYzC7rUvU68OOYf45xydtc3TgmhXxpK3fpytMwzrG/vSIIBBq/gQh024g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFiyGv3Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFiyGv3Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C5AC19422;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=Ycafl/nefvzv+5S1NyWmgS3jSzFO77lQU9Z4yAw6LOM=;
	h=From:To:Cc:Subject:Date:From;
	b=kFiyGv3QH9w8QCHSSJAcanPtr4TGPYkweY/vHdNTajrEsZu7/4rjFTCc4rArPiwn+
	 H5FSb4tCIH9TjJkeAV58h2JuqKMDYIhluwdJ+Xe+wxCZM7Z/SCZ+15oNMi0L9Qa0wZ
	 ziU7bevva33/Zu8atCwoVUtH31xbetFv/9O2ledDvmlOs+fGaOecXWSubTCJopOhzV
	 BIQHct049Ms4i3uubulgzJ4N2tLo6MvUrASguUGQiuOpuRR+8gQWrchx8Y32dB3tKs
	 veg0uCtiYD4WAXqC5NqIn9ltQKpbY75aBT1wE+mI/YHkSoG2xjhQw1U5s1GMHMM7wj
	 fcxXIgFXOlssA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043I8-0Nq5;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 00/15] Add kernel-doc modules to Documentation/tools
Date: Thu, 15 Jan 2026 16:40:21 +0100
Message-ID: <cover.1768488832.git.mchehab+huawei@kernel.org>
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

On this version, I made it independent from the other series.
As it doesn't touch scripts/kernel-doc, you can apply it without
affecting your renaming series, either before or after your
series.

I added two extra patches on v2 to address Jani's comments. With
that, we now have 3 preparatory patches not directly related to
sphinx.ext.autodoc.

patch 1: a CSS fix to address problems on indexes
patch 2: a variable rename to stop abusing doctree name
patch 3: don't rely on cwd to get Documentation/ location

Starting from patch 4, there is a series of patches fixing,
cleaning up and improving comments inside tools/lib/python/kdoc/.

Except for one patch touching latex_fonts.py, they're optional.
Their focus is mainly to make the comments more uniform at the
docstrings, and ensure that all public vars and methods are
documented.

The final patch creates new *.rst files that points to
the python.lib.kdoc files that we're documenting.

As noticed before, sphinx.ext.autodoc can only document modules
that follows PEP8 and can be imported via "import" or "from"
directive, e.g. all files:

    - must end with ".py"
    - their names can't have "-".

Documenting a python file is very simple. All it takes is to
use:

    .. automodule:: lib.python.<dir+name>

Usually, we add a couple of variables to it, to control the
documentation scope (add/remove members, showing class
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

which is a variant of sphinx-quickstart. The tool seems to
allow generating everything to build it there in separate,
but this didn't work for me.

On this series, I used its output only as a starting example
to ensure that all files from kdoc were added there.

Mauro Carvalho Chehab (15):
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

 Documentation/conf.py                       |  23 +--
 Documentation/sphinx-static/custom.css      |  12 ++
 Documentation/tools/index.rst               |   1 +
 Documentation/tools/kdoc.rst                |  12 ++
 Documentation/tools/kdoc_ancillary.rst      |  46 ++++++
 Documentation/tools/kdoc_output.rst         |  14 ++
 Documentation/tools/kdoc_parser.rst         |  29 ++++
 Documentation/tools/python.rst              |  10 ++
 tools/lib/python/kdoc/enrich_formatter.py   |  20 ++-
 tools/lib/python/kdoc/kdoc_files.py         |  23 +--
 tools/lib/python/kdoc/kdoc_item.py          |  18 +++
 tools/lib/python/kdoc/kdoc_output.py        |  60 ++++---
 tools/lib/python/kdoc/kdoc_parser.py        | 169 +++++++++++---------
 tools/lib/python/kdoc/kdoc_re.py            |  18 ++-
 tools/lib/python/kdoc/latex_fonts.py        |  95 ++++++-----
 tools/lib/python/kdoc/parse_data_structs.py |  62 ++++---
 tools/lib/python/kdoc/python_version.py     |  20 ++-
 17 files changed, 431 insertions(+), 201 deletions(-)
 create mode 100644 Documentation/tools/kdoc.rst
 create mode 100644 Documentation/tools/kdoc_ancillary.rst
 create mode 100644 Documentation/tools/kdoc_output.rst
 create mode 100644 Documentation/tools/kdoc_parser.rst
 create mode 100644 Documentation/tools/python.rst

-- 
2.52.0

