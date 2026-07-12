Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF3A370AED;
	Sun, 12 Jul 2026 19:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783884815; cv=none; b=amogIQ3N8JSf7qePwL61+AvOdfuesHqSzIfx4IZJNTB2kmMVOmOrLLqnCtfteNUjsYfMGupcp0pRbRO7JmguZDCgWy4cNd7Ir7lP91X5vDXrBM+yx38LfJCVXQmjxbqZ6l+N/w+SP1Ehx6W3fQ4i3Gn70Le9KpvTiNv8YgJkBDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783884815; c=relaxed/simple;
	bh=5KXWAQqK17dq/jWd/N/fl4RI5OFIhB0+UwnpLFbnuK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=evWiUPQSGZpM64hrSdAWViBcGiwryUfY3qElahEUG4Do/Bw9V8ncdNv5UD6jjZkqlB+C+KHsVS7S7GehtJLWE2mjuwH1QxxM2x8fTufxxm2rTonpkkUOnLK/LW7vhO42Bf7J6Zzmteql8aMwAch/o/GFN0VWWFwB0D/A6poWpL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6iLAj0c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6iLAj0c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FDD1F00A3A;
	Sun, 12 Jul 2026 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783884813;
	bh=r4Q9OkijEy2uoNPzt7esnEY0J5vDxhyANOqioM5jcu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j6iLAj0cd6udPk4WoIUPwv+KQ7a8Y1ZjAJmSx921LZ0P3XnL4fpELnxOo7Ms5J9Fq
	 QSxsdG+tbpgK62a6cNxPQErS0xP4EWpHZerOgTurFRcFAnDk2PjlfH0Z/oEAfMPc9f
	 ebg4zq1kDfAytHJmI+u6yOltkYy9oDH+apeUMN0mKL21GgakUGjBIeyIcy+kIvVuk0
	 eA49IXDT2SvS2dIh44lVF4WP/FGewcGPyWRK9gZ4fxnRtQXdQf9RVqUNK3LrGAV3fZ
	 VXKLRlP0GRcz4g5/2v8hnrva5s9oaz2EPxNYGGILllunGaeZUjF8K+eEgHammOBNBs
	 /9K9CEgVkOosg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wizvg-00000004KW3-0uLZ;
	Sun, 12 Jul 2026 21:33:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 1/1] docs: maintainers_include: fix entry names
Date: Sun, 12 Jul 2026 21:33:29 +0200
Message-ID: <bb00e9ba66f2d95306e7ca88fdf0f39fcc570cff.1783884625.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783884625.git.mchehab+huawei@kernel.org>
References: <cover.1783884625.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Right now, it is printing duplicated values as profile entries, as
it is not properly handling subsystem name.

Fix it.

Reported-by: Manuel Ebner <manuelebner@mailbox.org>
Closes: https://lore.kernel.org/linux-doc/98a558a87a07ab641f47c66c372ee7ed0735f4f5.camel@mailbox.org/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index dc9f9e188ffa..7ffe19b5ed58 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -161,7 +161,7 @@ class MaintainersParser:
                     html = KERNELDOC_URL + ename + ".html"
                     entries[entry] = f'`{ename} <{html}>`_'
                 else:
-                    entries[entry] = f':doc:`{ename} </{entry}>`'
+                    entries[entry] = f'/{entry}'
 
         return entries
 
@@ -345,7 +345,10 @@ class MaintainersProfile(Include):
                 output += f"- {name}: {entry}\n"
                 self.warning(f"{profile}: Invalid 'P' tag: {entry}\n")
             else:
-                output += f"- {entry}\n"
+                if not name:
+                    name = entry
+
+                output += f"- :doc:`{name} <{entry}>`\n"
 
         #
         # Create a hidden TOC table with all profiles. That allows adding
-- 
2.55.0

