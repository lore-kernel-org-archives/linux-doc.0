Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4337475801;
	Thu, 26 Mar 2026 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542127; cv=none; b=LeLawKEa8skn+fnIoYGiN7QCrQVA6ArZZQGMzOB+kmzDVLMNjZ2THDD7tig6w5TDf/5hGqkW229dk2r/Gtvv9NlcLT8pbmnrlLqNpmEfThUvwE60fUB6PF1/2rTIBV4ga5Ua4kWVMEDHpiucmQ7OClKJ/xH9TNmcrVn3tYmhIIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542127; c=relaxed/simple;
	bh=y5hcsMSoY+bSzNMgLViNIzlEHe2wVTmLHMJN/dSG1r8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zvgta0XiuKAg7Tok7hkCMDqTKZDFg6R98glXDpCefmz5xSjXFhHmLxLtcYeUvB7wo1JSQ2p8xQLhRZofg5Nv/c/IIvK2E3ftkOAMXut87lnXEiqbQilJrt7kKthwAUOAddltErZdVcnhS3o6cDKR/ztBWJ0BtdcDbcK3EIix8Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIB6v/rV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIB6v/rV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11158C116C6;
	Thu, 26 Mar 2026 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774542127;
	bh=y5hcsMSoY+bSzNMgLViNIzlEHe2wVTmLHMJN/dSG1r8=;
	h=From:To:Cc:Subject:Date:From;
	b=uIB6v/rVtO4XC4RYe+hxF9W/x1tB+WTewH8o9hlvlkmfq0gs1eacYKkfXQgj/MYcK
	 XKzsXxqUFDGRcmwadgU0ZFKNTecQWK27npv4lJOz8+c/HQH6ut48cKBNwizO4RUIhs
	 V0QJcCdaFqbLsvvnDEGUYV7p6/nCImj/U7d4dP166WRfd+TNdnSUsTjNUb9TjXopGp
	 kA4Sb9mysEog5j6/W8yKX1Jnpj4KReaZWpTa+LK0zC8s9PQdF1eqhWchwt7/k0c5pf
	 JJxhCZSabwUXx4bNXu7ckB9LsdlthkE0verjM1wAZgLMwMPQkaQVnv/y1POkWepgjE
	 JPMSoR7qegP+g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w5nTA-0000000AteC-3xnC;
	Thu, 26 Mar 2026 17:22:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 0/1] Add a script to check for kernel-doc regressions
Date: Thu, 26 Mar 2026 17:21:59 +0100
Message-ID: <cover.1774541999.git.mchehab+huawei@kernel.org>
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

---

With regards with tools usage:

The v0.1 skeleton was originally written via LLM (gpt-oss), but the
code was almost entirely rewritten by hand. It was also checked with
pylint and I re-checked it again with another LLM (nemotron2-cascade),
all executed on my local machine, without Internet access enabled
on ollama.

LLM prototyping was interesting to have a quick start code but, as
expected, LLM output it not anything better than any other traditional
auto-complete/auto-generated code method: the produced code was
complex, with lots of caveats and hidden issues. Yet, using LLM for
some specific tasks (like for instance to write a signal handler) is
usually faster than googling at the Internet. Also, it helps to review
the logic, as it can point to some problems, but its output requires
one with enough knowledge to discard bad code and ignore AI hallucinations.

Mauro Carvalho Chehab (1):
  docs: kdoc_diff: add a helper tool to help checking kdoc regressions

 tools/docs/kdoc_diff | 504 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 504 insertions(+)
 create mode 100755 tools/docs/kdoc_diff

-- 
2.52.0

