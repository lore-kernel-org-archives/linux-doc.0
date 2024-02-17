Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6FC7C083
	for <linux-doc@vger.kernel.org>; Sat, 17 Feb 2024 21:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708205379; cv=none; b=axXTCvXvBwrMFzPlaAd35c4q951MD0KKO954A669aFpczrsdsDK2uMgKMfx3lQc/0DbpOA3ksLp9Tpy+gRzluk8btx91xU5ZGRXgHFG2IRLnNU/uWfV69f+7J0s8tVAICq1LG5yujl9gjV/Ew5cTG7asb32WUdbVv9i5zJYcz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708205379; c=relaxed/simple;
	bh=I3Oflpcd+SP1rRHPx3ZAx8FONkH0lXQbgkoO9jFLdj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SpMxAWP8hRXnWrFtBsKLdsz13gfLJVbgtEjSz1Gi8L62mp/gjny5QgM0VzfXfrGwXL9k8LngVryL6o/z/5Jl5I9Ta1qulI6XGIwD7p8g6B2ah9IH3q/c5r26tQgX3fgS/Zhsc2dEXtq5ojhiNXAnk2m6uUJ7uHVZ/XwGo3Nqnjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Y57L9bC8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Y57L9bC8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8707C47AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708205365; bh=8c3v0Jxyd4UCcIR1kgpPTaYZ0SlTHkNJBSr5/vWlsuE=;
	h=From:To:Cc:Subject:Date:From;
	b=Y57L9bC8cxbMSTCVBQiJY3OdEflmYe6htqRCsPWbaROLcSbwDXiGh/C8b8fyNnsbp
	 UsYBwPY9NXesr6qrwwgY/7TRAbTVdfQMFHY7IDaqShUHUjCV5LWYJaV0B8Ndt26gt3
	 PdoLnZSSbngJ10kC2MBKUoLTeXROOPA8oqzU7klwYMOl1oEl8jQHZ+ivV1IA0ORblc
	 ISAMJUbKnIwLYKoQmQ5t5nixWLl82TCu2VqSEXsm5A03IfRFnMBFn1orZRwqsw87SU
	 Q6VjnsKs+UUAfjN6mnDf1EYC6KZxajQRanmOIDGhRXdDu35SV0WIrEPYJDDeXMUkg7
	 vI9smHmwClF3Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8707C47AAD;
	Sat, 17 Feb 2024 21:29:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: PDF misery
Date: Sat, 17 Feb 2024 14:29:24 -0700
Message-ID: <8734tqsrt7.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

So, FYI, I have Vegard's PDF-generation fix applied here, but I've not
pushed it yet (even though I think it's fine) because I wanted to be
sure that all was well with PDF generation.  Bear with me as I ramble
for a bit...

I'll confess to not paying as much attention to PDF output as I should.
Partly that's from a perception that not many people care about it
(though a few really do), and partly because PDF generation has always
been a bit of a house of cards that turns into a real pain whenever
anybody looks at it hard.

Somebody looked at it hard.

My fairly standard Fedora 39 system can't do a pdfdocs build at all.
There are a couple of untoward things that get in the way.

One is the dreaded Latex "too deeply nested" message that causes
everything to explode while generating filesystems.pdf.  The problem,
specifically, is .../filesystems/xfs/xfs-online-fsck-design.rst, which
blows the limits in two ways.  This patch "fixes" it - this clearly
isn't something to apply, it's just a demonstration of the problem:

-----
diff --git a/Documentation/filesystems/xfs/xfs-online-fsck-design.rst b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
index 352516feef6f..1762a9415ec1 100644
--- a/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
+++ b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
@@ -739,15 +739,6 @@ For a given fstests filesystem configuration:
         7. Subtract a small quantity
         8. Randomize the contents
 
-        * ...test the reactions of:
-
-          1. The kernel verifiers to stop obviously bad metadata
-          2. Offline checking (``xfs_repair -n``)
-          3. Offline repair (``xfs_repair``)
-          4. Online checking (``xfs_scrub -n``)
-          5. Online repair (``xfs_scrub``)
-          6. Both repair tools (``xfs_scrub`` and then ``xfs_repair`` if online repair doesn't succeed)
-
 This is quite the combinatoric explosion!
 
 Fortunately, having this much test coverage makes it easy for XFS developers to
@@ -2093,7 +2084,6 @@ of the records, so naturally the xfarray must also support sorting the record
 set prior to bulk loading.
 
 Case Study: Sorting xfarrays
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The sorting algorithm used in the xfarray is actually a combination of adaptive
 quicksort and a heapsort subalgorithm in the spirit of

-----
The first change removes the deepest level of nesting in an impressive
set of enumerated lists; the second removes the nth-level subsection
heading markup for "Sorting xfarrays".  Having either of those present
will cause Latex to blow a fuse.

I'm surprised that nobody else is reporting this problem.  I honestly
don't see a fix other than changing the organization of the document to
avoid both deeply nested itemized lists and section structure, which is
less than entirely desirable.  I think there are good reasons for
avoiding structures that deep, but limitations in the tooling aren't one
of them.

Incidentally, on F38, I also run into a similar Latex error in
.../userspace-api/media/v4l/pixfmt-rgb.html, which has a set of tables
from hell.  On F39, that somehow works.  Weird.

The *other* problem is that PDF generation of the Chinese, Korean, or
Japanese translations fails with:

  xdvipdfmx:fatal: Invalid TTC index number

This, I am thinking, is likely some sort of F39 bug.  xdvipdfmx is
finding the CJK fonts just fine, but then something clearly goes wrong.
I'll try to find the time to narrow that down and perhaps put in a
proper bug report.

Meanwhile, I wish I knew what to do to make the PDF build a bit more
robust.  I wish that rst2pdf or rinohtype would progress to the point
where they could be used, and Latex could be taken out of the picture,
but no such luck.

Oh well...sorry for rambling at you...I wish I had a good plan for
making this whole thing better.

jon
