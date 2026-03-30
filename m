Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F64D3DCDB7;
	Mon, 30 Mar 2026 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774909522; cv=none; b=GiGhyCzWQ8h8l2KHyYHUOa+wyTDwiHrlbcFlNx9QxPwXzH6dTYnArMVYiXF0kVCmaWlGEsV55hHF3UL/eanli9ihRYBZJ/8kMP0BI746UNkz6aU3qJt1FiRADC+hKU8Uc5Sp3BDYthSYh9dsQGwy5wMjpdNGLw3Mowvj+2Qqiz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774909522; c=relaxed/simple;
	bh=sY0GzAPz8yfoMj/tPmempQZtsnUPu5PhuDGMbN3++7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DgGYRssJprT0CImeyAjMMQD16TqQ4WMwW5oVQolUig1CJ4c4PM8EQGmV2JL8o9CGDDHifvHuGTHIE0ubVZ1hY3fQ7wlh4Ysz3vK3DoH+wwY0wbumqsBnNRAMeTeHOIEFPH/mHjn+tfjVWe4BWy/nTIfoE4VbXySgJ2B4u480igs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EBAA8MhV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EBAA8MhV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DBFDB40C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774909513; bh=4ZARZtsrrLUcEIaQpCWrYUcz3219IMAQyiUB+GsmbjM=;
	h=From:To:Cc:Subject:Date:From;
	b=EBAA8MhV9igZ6YH4rjgqJ8Lyvurb9zSY7MkC5uCYlUKHR0K94w8w4Ki+nwWgSd/q3
	 F5YJrl/8CB9WH4oVxsJJfB0LV+WjF+8MX3blTEFZMOl93c54v+mg6oyT86j1o/TrMs
	 d9TimPggaIoDOThvbriyFRedssl7hwwpp1epYMP7pVfL0JWHK1XQiGpe3rPfSiyPXB
	 dRnConx4KQmbjHPnxo3tvSeVku14fflJ96IpLx9I5ytSvlC2U3FF3Wwp9yu2DdSGW4
	 ubU8UCkawgNw5W9vcxdKmX8mlwrmnwpnwRjxAcidMcp06ACFhNRJELd1Ur2ER1eTpY
	 qPT/tYWEkMk/g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::824])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DBFDB40C6F;
	Mon, 30 Mar 2026 22:25:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH] docs: add an Assisted-by mention to submitting-patches.rst 
Date: Mon, 30 Mar 2026 16:25:11 -0600
Message-ID: <877bqtlzug.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

We now require disclosure of the use of coding assistants, but our core
submitting-patches document does not mention that.  Add a brief mention
with a pointer to Documentation/process/coding-assistants.rst

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
This is just a minimal change in the hope that a few more contributors
will see it.  I realize that this document needs a rather more serious
thrash, but that's for later.

 Documentation/process/submitting-patches.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index c88e75bf0534..d7290e208e72 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -634,6 +634,16 @@ bugzilla.kernel.org is a public place in this sense, but email addresses
 used there are private; so do not expose them in tags, unless the person
 used them in earlier contributions.
 
+Using Assisted-by:
+------------------
+
+If you used any sort of advanced coding tool in the creation of your patch,
+you need to acknowledge that use by adding an Assisted-by tag.  Failure to
+do so may impede the acceptance of your work.  Please see
+Documentation/process/coding-assistants.rst for details regarding the
+acknowledgment of coding assistants.
+
+
 .. _the_canonical_patch_format:
 
 The canonical patch format
-- 
2.53.0

