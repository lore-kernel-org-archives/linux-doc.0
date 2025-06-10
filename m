Received: from g4coop.com (lmx.g4coop.com [45.56.102.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58B5299A94
	for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.56.102.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565736; cv=none; b=bzmwbnwT6ws96rZKu7ughTWKv55a88kqntSpNPFbzeJw1TJEfa8QOvLrsrz3bHa0KGs7gTrU9xu2tCJOIfj5iU9w1CHX9KLBbRYkMl8hg+AE72nglb4YN8BTk143sq0DpaZLzk5joXcM3nRdAdJIaorGmZmShXH80T6dDc2KQcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565736; c=relaxed/simple;
	bh=LpoHPWce1f/+7svGEcT0jPynC3ldIq6Vr1Mag/IpO5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JyiupQn4kdLT6X0UArqp9eTZBsyR4vFN6L+zk6NuqQIOyfAeinocS+iXoJekZ6/c17RjFRYCl6Tpjzx06ROv1TGuzjwJzgH/vQUmTUFvPeosln24iQ4EIjJLxDML11wO85PD+sXCg3M3okQ70rtA7lpvuvoaO+y9oBfmeV10mVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=killermarmot.com; spf=pass smtp.mailfrom=killermarmot.com; dkim=pass (2048-bit key) header.d=killermarmot.com header.i=@killermarmot.com header.b=oTthYiWM; arc=none smtp.client-ip=45.56.102.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=killermarmot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=killermarmot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=killermarmot.com header.i=@killermarmot.com header.b="oTthYiWM"
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by g4coop.com (Postfix) with ESMTPSA id 8F0114130C;
	Tue, 10 Jun 2025 08:19:42 -0600 (MDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 g4coop.com 8F0114130C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=killermarmot.com;
	s=20211216; t=1749565182;
	bh=4GbfA7ySqWEyQH/T3naoRwHCv4KGHF0SbRaTQsN/aqQ=;
	h=From:To:Cc:Subject:Date:From;
	b=oTthYiWM0nZJRC403mixfVo5WxkHejz8HlqfQw0juPO2yLdynYz4AZYU1c/a9xANq
	 3zfZtmkdHmsp8G4FGJ4+qTsrKPaRUew9snXCDrlmsAL58tL7pA7OnYfLwlXc3dPY0m
	 X66UiC8ywZPM5FQcgjLAqL/fLO2NmHOItC5hIT9X+hSFHaoWvLM/RadZYqwwtU157I
	 BOJ9O2g+yJiSFsLlPuysASeQ190Av71Ya7U1ZqyBwER77E+LjHj+FtwOqz8GAs/oAk
	 bnQCxTnzheACtiqar/QFlZhxfp8ispnyrDxjlF50v+vqtqILe0jVJl3o5LzPYYGEwq
	 JmlDFBT//oi7g==
From: Jonathan Corbet <corbet@killermarmot.com>
To: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] docs: kdoc: Make body_with_blank_line parsing more flexible
Date: Tue, 10 Jun 2025 08:19:41 -0600
Message-ID: <87wm9j65mq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The regex in the BODY_WITH_BLANK_LINE case was looking for lines starting
with " * ", where exactly one space was allowed before the following text.
There are many kerneldoc comments where the authors have put multiple
spaces instead, leading to mis-formatting of the documentation.
Specifically, in this case, the description portion is associated with the
last of the parameters.

Allow multiple spaces in this context.

See, for example, synchronize_hardirq() and how its documentation is
formatted before and after the change.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
Unlike my other kernel-doc changes, this one does result in changed
output, but the result is clearly (IMO) more correct.

 scripts/lib/kdoc/kdoc_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 9a1ce6ed8605..294f5d032b3d 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1301,7 +1301,7 @@ class KernelDoc:
         """
 
         if self.state == state.BODY_WITH_BLANK_LINE:
-            r = KernRe(r"\s*\*\s?\S")
+            r = KernRe(r"\s*\*\s*\S")
             if r.match(line):
                 self.dump_section()
                 self.entry.section = SECTION_DEFAULT
-- 
2.49.0

