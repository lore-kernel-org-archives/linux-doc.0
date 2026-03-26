Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347735DA4C;
	Thu, 26 Mar 2026 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552188; cv=none; b=sEBJBJAc6hWQE+rDthjpNRd1mEWbu6PKwlB+kGdffGmGYkFIzEnIK66mx4sKh4vOq6N416xrz2HPMEErnO/IrRDQ7ppy+9Jck4dBvAd9VIvslOdoJifKQU2gqx8knak50Ux/MJyu1dwzLkIKmTaswtG6LbSsLxSv7ttZguaw0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552188; c=relaxed/simple;
	bh=uJ5CEyXguvh9WvbvCmNGbsMdGebDllhPsLvEeHrzC0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rBmGpBd7NUU0FWPjsHltu2Cx8Riv7f3C0NFDRkQYFA73fHQ+pv8bBODrNjwDUiCv4vOop7WiMTbrCmFLQfcKeyq7wso9j/GBP5ROeJymZGmaynDLfnJ5ZgEpL4iW6rPRL0n1RSpTBRUC6MNyzn7DGhCxeGVK7xBnqHxYAbEoFqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4EUHgK3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4EUHgK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21EAC19423;
	Thu, 26 Mar 2026 19:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774552188;
	bh=uJ5CEyXguvh9WvbvCmNGbsMdGebDllhPsLvEeHrzC0Q=;
	h=From:To:Cc:Subject:Date:From;
	b=b4EUHgK3b25PdErAwYGxLiUrByR0HKKqjByqSC6X84vtCbkVOshCpthMfXjF6TfDJ
	 ADFCe9KKA9Rxsqbt3FyyDbT6CgQFnBby56uAc1JCtyTFfHpqW+zO1iU1M0BsiGWNOr
	 yiiQnaPA7QwK8N9mQJ5Xif0gB2h/UQAnwGL8mlMaQvZcAPr2cgpVN49ajNV4EDPyQO
	 O+rWkhNTga/QmjjRCk3eRHRXNKuGabdbQSTHrAbyJLIZ9ZxDT2UZmuycpX/rwmALXZ
	 jHzy30ebsSDaKBVWwjrPTTo3KvITIKzT3jdtoXM5w3epiKLf8RbEpV5c5bjmpdG8Ix
	 S8y9b2Ako5XIQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w5q5R-0000000BH8L-3n8z;
	Thu, 26 Mar 2026 20:09:45 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 0/2] Add a script to check for kernel-doc regressions
Date: Thu, 26 Mar 2026 20:09:41 +0100
Message-ID: <cover.1774551940.git.mchehab+huawei@kernel.org>
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

I've using this script internally to check for regressions and
changes with kernel-doc, specially those related to the new
CTokenizer code:

	$ tools/docs/kdoc_diff --help
	usage: kdoc_diff [-h] [--full] [--regression] [--work-dir WORK_DIR] [--clean] commits [files ...]

	Compare kernel documentation between commits

	positional arguments:
	  commits               commit range like old..new
	  files                 files to process – if supplied the --full flag is ignored

	options:
	  -h, --help            show this help message and exit
	  --full, -f            Force a full scan of Documentation/*
	  --regression, -r      Use YAML format to check for regressions
	  --work-dir, -w WORK_DIR
	                        work dir (default: /new_devel/docs)
	  --clean, -c           Clean caches

I did today a cleanup, to be able to submit it, as I think it could
be helpful to you and others as well, as it automates the diff check
between two commits.

It has two modes of work:

1. It generates 3 files: err.log, man.log, rst.log and does
   a diff between old/new commit.

   On this mode, it sorts err.log and remove duplicated messages,
   so it relaxes a little bit the diff comparision, if a minor
   change affects its error output.

2. It uses yaml to run regressions test.

   The regressions mode is nice when no regressions are expected. It
   uses the tools/unittest/test_kdoc_parser, which is somewhat relaxed
   with regards to trivial changes like whitespaces.

The tested files can either be:

a. Partial: only files explicitly included via  kernel-doc:: markups
   inside Documentation;

b. Full: includes files with broken kernel-doc markups that are all
   spread inside Kernel tree;

c. A list of files or directories.

To prevent losing anything, before running, it checks if the tree
is not dirty. While running, it does git checkout -f, and, at the
end, it returns to the current branch.

There's a logic there which catches signals to avoid troubles on
errors/exit/ctrl-c. At least on my tests, it worked fine even
on python errors inside the script. Yet, in case of troubles,
one could use git reflog.

On v2, the regression tests now show only the failed tests,
and provide the command line used to run it:

    $ tools/docs/kdoc_diff -r PR-more-kdoc-unit-tests drivers/media/v4l2-core/
    Range: PR-more-kdoc-unit-tests to HEAD
    Processing 0a4f3ef9880e...
    YAML regression test file will be stored at: .doc_diff_cache/__tmp__/out.yaml
    Processing 24b3116a7834...
    Ran 89 tests in 0.107s

    FAILED (failures=8, expected failures=4)
            test_man_jpeg_stream:                        FAIL
            test_man_v4l2_create_buffers32:              FAIL
            test_man_v4l2_m2m_dev:                       FAIL
            test_man_v4l2_subdev_stream_config:          FAIL
            test_rst_jpeg_stream:                        FAIL
            test_rst_v4l2_create_buffers32:              FAIL
            test_rst_v4l2_m2m_dev:                       FAIL
            test_rst_v4l2_subdev_stream_config:          FAIL

    Ran 89 tests

    FAILED (failures=8)
    To check for problems, try to run it again with -v

    Use -k <regex> to filter results

            $/new_devel/docs/tools/unittests/test_kdoc_parser.py -q --yaml .doc_diff_cache/__tmp__/out.yaml

    Restoring original branch: PR_CDataParser-v3
    Switched to branch 'PR_CDataParser-v3'

---

v2:
   - Added an extra patch to add quiet mode for unittest reports;
   - Use quiet mode for error report with --regression;
   - Fixed the error message when regression tests failed.

Mauro Carvalho Chehab (2):
  tools: unittest_helper: add a quiet mode
  docs: kdoc_diff: add a helper tool to help checking kdoc regressions

 tools/docs/kdoc_diff                | 508 ++++++++++++++++++++++++++++
 tools/lib/python/unittest_helper.py |  22 +-
 2 files changed, 524 insertions(+), 6 deletions(-)
 create mode 100755 tools/docs/kdoc_diff

-- 
2.53.0

