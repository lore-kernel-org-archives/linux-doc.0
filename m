Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E33C3C11;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723788; cv=none; b=mLRdJiW/ulvVIpVTDS83ri8AuAf4GjGqEK4Iwa63kMXL4SJs6Uz4arkL3ZzegC/NtFMaC5l1PQVkz3v/ccLDZK5gPiZrwl4saQy2d0YlT4Qaugm67HpfBBc7xfiuHie5VC3LcB5UyrgZynaS56b8p7Zgjm4yJviEZt8+p+iT/7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723788; c=relaxed/simple;
	bh=1bL9ZrKbJcLEeJVsYJFtpZiURmsITtjUamQCEe8R0Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OtLmV0Jy9WvNzeRcj9K5qiUHEN7gnGwnAkkmSrRHV2ZbXFrsnLEoUP4GtdMEMrE8YSq4eRf+w5LZQSlfFvsWFj46k6x8EqXdAn2LL7Y/tFfqeAPIlscYgRvnGQ75QbfenSC7Vl/7ki6xrf4aH6fGhvTiVNtlKPgp7WrsHjhT5tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs3xH7Iy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs3xH7Iy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1683C116C6;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723788;
	bh=1bL9ZrKbJcLEeJVsYJFtpZiURmsITtjUamQCEe8R0Hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gs3xH7IyVGIeOHCVlZUqHY4gy2Cs5HTweK5QO3kekarJG23n9QAYcbDCoh+yCdEGZ
	 Ez5DDzHeAyIQdNKgpSWwIDMWP8k0+87ZACH+8btJhBn3yLH77o5nTzb0FCUYjYm+JC
	 +4izAYpw4Xk2nrJ2ryP9Op4zHDMLzHjzO9hYJ8vzN1qV6spu4512q5yjK983yqZp4E
	 KUu16oBb25CNg42PsfcYk4DURzF/SivLzBhFvIsYzsdahIj2X3BFrJUu1y6lTFhjfS
	 0ZK0/k6fdUn8bD8ScR9kmK7kkLnlsFfecBK4/Yglip8Bff9Fk4JidNvoGczX7BgxKl
	 aeT4gE5rCvuAA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR8-0000000HKCy-3IVF;
	Thu, 05 Mar 2026 16:16:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 09/11] docs: kdoc_output: use a more standard order for .TH on man pages
Date: Thu,  5 Mar 2026 16:16:16 +0100
Message-ID: <fcf10d80e7a523b06b7a74099b2470fe60ea7f38.1772722474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772722474.git.mchehab+huawei@kernel.org>
References: <cover.1772722474.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The generated man pages are not following the current standards
for Linux documentation. Reorder .TH fields for them to look
like other Linux man pages.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper      | 2 +-
 tools/lib/python/kdoc/kdoc_output.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 4572328e379d..3b3b8dd074a8 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -626,7 +626,7 @@ class SphinxBuilder:
                 # Use shlex here, as it handles well parameters with commas
                 args = shlex.split(line)
                 name = args[1].replace("/", " ")
-                fname = f"{output_dir}/{args[3]}.{args[2]}"
+                fname = f"{output_dir}/{args[1]}.{args[2]}"
 
                 if self.verbose:
                     print(f"Creating {fname}")
diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 62e300e65405..968e1d43de47 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -611,8 +611,8 @@ class ManFormat(OutputFormat):
         """Emit a title header line."""
         name = name.strip()
 
-        self.data += f'.TH "{self.modulename}" {self.section} "{name}" '
-        self.data += f'"{self.date}" "{self.manual}"\n'
+        self.data += f'.TH "{name}" {self.section} "{self.date}" '
+        self.data += f'"{self.modulename}" "{self.manual}"\n'
 
     def __init__(self, modulename, section="9", manual="Kernel API Manual"):
         """
-- 
2.52.0

