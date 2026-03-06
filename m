Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D23E340280;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811958; cv=none; b=n43gjYcV5kc0M+00AhrDN33V6YfTJfpLpUIYigkbWvButsSbwJe3UJYWJKkhp2wBR05KrFH5T7HslfJb7cb6T9k74QnHbeMIxRsneNy7ResezslnIOEJFcn13ftidFcXb+gz4ZnAX8l2xWUSOUGkGi5ya8Z4Gxr6vDxBPiRbj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811958; c=relaxed/simple;
	bh=J9gpBcUhWSmksHEje7HfFrvd/UJKiZjrUhxoxqAfK3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hj1LNOmxE73oDY2Z3p4oyZy2BLSMYBBDc5ueju3+OgkjqXYDg2xzbJk/1gja9+p7iZ9Bclg8CIAO5mOaj8UphGknXk4cUni9691Ydup2l4QeGrYCKtU7lNHn0+WroQgDhCYIc8xL2K0tVAOw2aPEGxAlrY/KPD/OlFu7AaJf0gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3y5g81e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3y5g81e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3DAC2BC86;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811958;
	bh=J9gpBcUhWSmksHEje7HfFrvd/UJKiZjrUhxoxqAfK3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N3y5g81e1jsc3Uqa9XffGD09QB7MIV3zIenkNspouvd1ZBDzKzuYuT24EsLbsrfiB
	 hp1xSRv8Qnzo/8MS90zqN/GqDfkDufzYrcYjpVWtas/c+/wFJyvwER1+TWBqYGeira
	 IBHmMVX76sUfT5je/Z09o+mbgWOqWxJuCErQH8MiGrGpFTH/gegmcxzsLNasqtC0+H
	 ZZkC83wNDVSB7lNZ4UdJ9qPVb6b5QAg8caN3rw96HbMHkdIPeQ60dBa004yCSKcS5u
	 Yae82qXyRmF7pgxGaNajZ/8GcEeTDx+Xe+dcq6G+4mm7mbkyHstcSY6gJNx15jyvYZ
	 7l2qGs9taSKcw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNE-00000007EW8-0myE;
	Fri, 06 Mar 2026 16:45:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 01/13] docs: sphinx-build-wrapper: better handle troff .TH markups
Date: Fri,  6 Mar 2026 16:45:39 +0100
Message-ID: <9436806316d33aaf68625c00ce068463d3917660.1772810752.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Using a regular expression to match .TH is problematic, as it
doesn't handle well quotation marks.

Use shlex instead.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index b7c149dff06b..e6418e22e2ff 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -576,7 +576,6 @@ class SphinxBuilder:
         """
 
         re_kernel_doc = re.compile(r"^\.\.\s+kernel-doc::\s*(\S+)")
-        re_man = re.compile(r'^\.TH "[^"]*" (\d+) "([^"]*)"')
 
         if docs_dir == src_dir:
             #
@@ -616,8 +615,7 @@ class SphinxBuilder:
         fp = None
         try:
             for line in result.stdout.split("\n"):
-                match = re_man.match(line)
-                if not match:
+                if not line.startswith(".TH"):
                     if fp:
                         fp.write(line + '\n')
                     continue
@@ -625,7 +623,9 @@ class SphinxBuilder:
                 if fp:
                     fp.close()
 
-                fname = f"{output_dir}/{match.group(2)}.{match.group(1)}"
+                # Use shlex here, as it handles well parameters with commas
+                args = shlex.split(line)
+                fname = f"{output_dir}/{args[3]}.{args[2]}"
 
                 if self.verbose:
                     print(f"Creating {fname}")
-- 
2.52.0

