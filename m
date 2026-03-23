Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB3386450;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=AZRgiql765evoYIsOKSHfFb7atdWo3gLNdWUAyjnQj7/ayjCvEBmpXuuZcvOjOz/bE9HloLCJAsti4ebD2Z7XeGMNrpG1kv/9oKSsTlPdHZlyskO9Kr2CEjNGc3OsDi6Cx0aPG7OgxWyBwOJS/Q2BWyS9/rOvIWiikFsvxamoiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=TdokLuCPi3Ct9yuqj0G7Fs0DxpFowZxp+/6gtcqOTCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gZCjI7201zkrG8b41JAmQvePjxc0MvYijSvViEVeq/A4pJQbzXVoHBM6MxQwGkgQBvsAKSGTaC4a03+e3Pkx3X5uOoZP9DhuYfzNo0Nx9Wh63jTuTeyJDZBo0oKQYHII3vncy8k55z5hWJX0jkzV7JU01VOCIINAJ9Ynr7ODl9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkBy3dWY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkBy3dWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34ECC4CEF7;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=TdokLuCPi3Ct9yuqj0G7Fs0DxpFowZxp+/6gtcqOTCY=;
	h=From:To:Cc:Subject:Date:From;
	b=YkBy3dWYiDJSL4ZDdenHZoxTAyZd47Gb0S1RwwJA96ICAYdUeI4dBQnapl3jrnOUW
	 ABlpZK/w7RI661xWQa+ZJkD3Xu7ZQ2wWVPA3qGotNRye+SUzs86BZx2ZcyGL5pmDBW
	 43CG6likptve1EHjQqcp6sCfDTfQWYOnS6wnboxMwSFO4IyRweNWYIMgbVa0pKENBC
	 I+//0kcWl9DCwzCWgqmXgKe8Kn4n5SGUoJ2+qtgUtPXMmHIJvN8LzxOtM+vXPpuXW8
	 lGYkKPZgk+GNECvjo83Dc4uNG15LAA1C4FTuto/JPYSslISssrGIn5StM2wiI5pLbj
	 UJ2clIEh6XbOA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWF-1UUp;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 00/10] minor changes at kernel-doc and a fix
Date: Mon, 23 Mar 2026 10:10:43 +0100
Message-ID: <cover.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Thanks for picking the other series. This one does minor changes
at kernel-doc, focused on YAML input and adding more regression tests:

- adds an entry at MAINTAINERS for unittests;
- adds more parser tests for some corner cases;
- the YAML output is now using literals on all multi-line
  keys, making it a lot easier to handle it;
- the YAML output now uses better names;
- the YAML output can now output all tests. Previously, 
  some bad-formatted kernel-doc tags caused it to give up
  adding some tests;
- added a check for a hidden problem at kdoc_output;
- improved logging when CTokenizer find issues.

After adding parser tests, I picked a bug on how simple tables
are handled on man pages, fixed on this patch:

      docs: kdoc_output: fix handling of simple tables                                                                                                                                 
That's the only visible change at kdoc output and affects
only man pages.

Mauro Carvalho Chehab (10):
  MAINTAINERS: update documentation scripts to add unittests
  unittests: test_kdoc_parser: add command line arg to read a YAML file
  docs: tools: include kdoc_yaml_file at documentation
  docs: kdoc_yaml_file: add a representer to make strings look nicer
  docs: kdoc-test.yaml: add more tests
  docs: kdoc_output: fix handling of simple tables
  docs: kdoc: better handle source when producing YAML output
  docs: kdoc_yaml_file: use a better name for the tests
  docs: kdoc_output: raise an error if full_proto not available for var
  docs: c_lex.py: store logger on its data

 Documentation/tools/kdoc_ancillary.rst  |    8 +
 MAINTAINERS                             |    3 +-
 tools/lib/python/kdoc/c_lex.py          |    8 +-
 tools/lib/python/kdoc/kdoc_files.py     |    8 +-
 tools/lib/python/kdoc/kdoc_item.py      |    6 +-
 tools/lib/python/kdoc/kdoc_output.py    |   10 +-
 tools/lib/python/kdoc/kdoc_parser.py    |  100 +-
 tools/lib/python/kdoc/kdoc_yaml_file.py |   67 +-
 tools/unittests/kdoc-test.yaml          | 1548 ++++++++++++++++++++++-
 tools/unittests/test_kdoc_parser.py     |   32 +-
 10 files changed, 1699 insertions(+), 91 deletions(-)

-- 
2.53.0

