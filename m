Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A1E39903B;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825080; cv=none; b=FIZZBExH3xs9HGMI1Fi+hdiV416RpJOeUHcA9XG4sjrp2JZKO1lt3d2JZb1P3FX1VOiV21OLs+MlVd/RYbZbNNBTGjaxZgbhYSg5iVrO6P7spdsbkCYGOnVMm6FE70/fWuC+5wbpKMxACA4T8E2CWlpp3d1T2KdolUxZsHi6LcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825080; c=relaxed/simple;
	bh=iFj38UFIdiWCje9woaXgH1M7bm+id1nebIlPdkXQ5jM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RH64MmdNWKuiTtiyOjGEPsbgQLNgf+1J7cM7/kbQIpNN/7NzFW9P38gsyVOh6u7rrvP+ncytS4nWgGTYu85wy6qDwwhuD5mMSCwyLS60DF8sSk1kJniWTRkOVhy9wCDb8Qub7CNBLfeIh51fsQqKIitcTuHweReSAYS5CHaQxv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhSlynuV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhSlynuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE61C19424;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=iFj38UFIdiWCje9woaXgH1M7bm+id1nebIlPdkXQ5jM=;
	h=From:To:Cc:Subject:Date:From;
	b=fhSlynuVQtCSOFTkWCo3gKnu7/xKLFzWBVXAmEu6ib21SSnbAZsyj5ZZK/lxXw0Ak
	 o4Nuos+WiyEuQyMv/v2CivS7IKm8X4630SOVz+d3Kx96jOFwaRQvaxbqgwB87GkSt+
	 x1t+q+ISe2BDzreK7yoDqR13HXJTJYzDdJeRH8copWa67lg+3gBf7vojWquIOiQC9L
	 RQCZTVflpQxyRxJL4euOg4CXu4y1UvUikr4VMvkSmN0LKXFilfPCvqy7mD378YUKXt
	 EK3rjs2dUr8mss3NC0BrQW8Jtj+uelTYuY/69GH6g/IcoKpa4BOSQi5QTAvqw/mOgs
	 C0aKQwzSvTrsA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpD-1r3N;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 00/14] More kernel-doc patches
Date: Wed, 18 Mar 2026 10:11:00 +0100
Message-ID: <cover.1773823995.git.mchehab+huawei@kernel.org>
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

This series comes after:
    https://lore.kernel.org/linux-doc/cover.1773770483.git.mchehab+huawei@kernel.org/

It basically contains patches I submitted before on a 40+ patch series,
but were less relevant, plus a couple of other minor fixes:

- patch 1 improves one of the CTokenizer unit test, fixing some
  potential issues on it;
- patches 2 and 3 contain some improvement/fixes for Sphinx
  Python autodoc extension. They basically document c_lex.py;

- The remaining patches:
  - create a new class for kernel-doc config;
  - fix some internal representations of KdocItem;
  - add unit tests for KernelDoc() parser class;
  - add support to output KdocItem in YAML, which is a
    machine-readable output for all documented kAPI.

None of the patches should affect man or html output.

Before you complain about the diffstats, changes at kdoc
itself aren't big:

 tools/lib/python/kdoc/c_lex.py          |    9 +-
 tools/lib/python/kdoc/kdoc_files.py     |  104 ++++++++++++++++--------
 tools/lib/python/kdoc/kdoc_item.py      |   39 ++++++++-
 tools/lib/python/kdoc/kdoc_output.py    |   23 +++++
 tools/lib/python/kdoc/kdoc_parser.py    |   33 ++++++-
 tools/lib/python/kdoc/kdoc_re.py        |    9 +-
 tools/lib/python/kdoc/kdoc_yaml_file.py |  155 ++++++++++++++++++++++++++++++++++++
 7 files changed, 325 insertions(+), 47 deletions(-)

e.g. 155 new LoC for the new yaml file output and 123 new LoC for
the other cleanups/fixes.

The remaining ones are at the YAML files and at unittests.

Mauro Carvalho Chehab (14):
  unittests: test_tokenizer: better handle mismatch error
  docs: kdoc_re: better represent long regular expressions
  docs: kdoc: add c_lex to generated documentation
  docs: kdoc_files: use a class to group config parameters
  docs: kdoc_files: move output symbols logic to kdoc_output
  docs: kdoc_item: fix initial value for parameterdesc_start_lines
  docs: kdoc_item: add support to generate a KdocItem from a dict
  docs: kdoc_item: fix a typo on sections_start_lines
  docs: unittests: add a parser to test kernel-doc parser logic
  docs: add a schema to help creating unittests for kernel-doc
  docs: add a simple kdoc-test.yaml together with a validation tool
  docs: test_kdoc_parser: add support for dynamic test creation
  docs: add a new file to write kernel-doc output to a YAML file
  docs: kernel-doc: add support to store output on a YAML file

 Documentation/tools/kdoc_ancillary.rst   |   9 +
 tools/docs/kernel-doc                    |  48 +-
 tools/lib/python/kdoc/c_lex.py           |   9 +-
 tools/lib/python/kdoc/kdoc_files.py      | 104 +++--
 tools/lib/python/kdoc/kdoc_item.py       |  39 +-
 tools/lib/python/kdoc/kdoc_output.py     |  23 +-
 tools/lib/python/kdoc/kdoc_parser.py     |  33 +-
 tools/lib/python/kdoc/kdoc_re.py         |   9 +-
 tools/lib/python/kdoc/kdoc_yaml_file.py  | 155 +++++++
 tools/unittests/kdoc-test-schema.yaml    | 156 +++++++
 tools/unittests/kdoc-test.yaml           | 154 +++++++
 tools/unittests/test_kdoc_parser.py      | 534 +++++++++++++++++++++++
 tools/unittests/test_kdoc_test_schema.py |  94 ++++
 tools/unittests/test_tokenizer.py        |  13 +-
 14 files changed, 1322 insertions(+), 58 deletions(-)
 create mode 100644 tools/lib/python/kdoc/kdoc_yaml_file.py
 create mode 100644 tools/unittests/kdoc-test-schema.yaml
 create mode 100644 tools/unittests/kdoc-test.yaml
 create mode 100755 tools/unittests/test_kdoc_parser.py
 create mode 100755 tools/unittests/test_kdoc_test_schema.py

-- 
2.53.0

