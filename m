Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F913624C3;
	Wed, 22 Apr 2026 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776892243; cv=none; b=oJQRrOJ7mJq/kjXj8vGxitIocNzcdh1Rw5ix0FxSz8+0J/69qNxQhwgHG4syEUHlp0o0NCs464mN5GM75FlGMvbYLWYTv73QYMcRVSPrlEBdrdiyh4VojgVJZRXHMG3uURoqKyZh0WX7IlH6y5msjXh+9eLMqRirw8hsnNseJ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776892243; c=relaxed/simple;
	bh=2NmPECwWFYWoUzbdewDk4SQ57mJAY4zhaMldl9N8fuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ji9KHBamVDlBHA5Ldnr5aeNnTojDMhqnMRJZgBfvLKaEkkcuk67wZzD6YSK8GTmpUEd6MfnHcIOFqAoO4iESO/pDuB044WvPK7EdUEvQ/yefDq+lqjvE+NyAGojx64UOywAx7ZybDuIhgL8Px7ZrH18DFcLvKm9f/bOIXE0v+sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=SvaofXrr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ofzPdkSs; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="SvaofXrr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ofzPdkSs"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C5CCE7A0230;
	Wed, 22 Apr 2026 17:10:40 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-04.internal (MEProxy); Wed, 22 Apr 2026 17:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1776892240; x=
	1776978640; bh=9oWAEOPx2ZKtDZ9tis9o/GZt75q+AWTCpLN3XwFjJyw=; b=S
	vaofXrrgHEVnAMH1RwIXORr3yH8EQsClo5uJsMsb6ZLl3bmJh6WTBgqvL0wGjo63
	ejISB7l0l92o+cueCUzahTWy+LxBgOa/IYPO8f/QD5hqhCKTlNviOfJWiwhTH8tn
	MmFbIyCtjAcS0CuMqZ/dd8HAUrtZeN8WwawK6cJYYwH/BMXF6pZW3YYX8DCMqqdy
	Q8ATAhoagVVIfTwu+5BuFykwAvK16JNMZV6ZGVR66TSjhXrmvKn6XQUTrfDWSTRU
	DyrILJiA2sAkWwqV7CXDeBcWSS+d5dpVXGyjBejLWyPxtAi6DqXSvQ+N2pVd1CII
	gl8I5kN2GqAUVXkXehY0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1776892240; x=1776978640; bh=9
	oWAEOPx2ZKtDZ9tis9o/GZt75q+AWTCpLN3XwFjJyw=; b=ofzPdkSsnSwDS274R
	bfXj2HjbIeTvr+hemyDUvSLnQ1E5ZBhblTvr7dU7cKVsItFBWDA/Znu0jn1GGoQ3
	/jQmR+yeZQoW+imipY9d36Jo6Dk60nFK3gXTli1nVK1L8BbyYBFrEz0faLi1fFMI
	LG0QfnNCndx+ELstmEnrTci+JWx+9SWOEhAJbHByktDgaz3hcNq1M3N727lhehQY
	suKeFzipcnEieFB7V1NPKXPMOULNsnL45d5jnNj4HprrFcLaj/GZYt7pTIgb4UyP
	c1Gr5AiwuN7Kagm55QpOLIhA5pP3/QWt3RKJUVWBJssPL0LJZqpkC51uysGN7U/h
	ym6Cw==
X-ME-Sender: <xms:UDnpabhSTqj3H8jAAhCG-gqqUpWW1upiEwH00C0wPWr3Ks5DoXkMbg>
    <xme:UDnpafwLFcLxk4Y0lz5IZwKRXLuNEfmlQ_v_5C5G4iYsKpWldTVWO2EwKWVnTheWL
    xACGg7m4r7D4JS7lALxuwKvPxNybP4MnUkGoPNklsCwt36sqefV>
X-ME-Received: <xmr:UDnpaeL9a4oRA3T9ln4bwbY2QqlOOYiIL3yBltLhd4ZH_bssNDeBoCZJgfud9iLxVAtYotZpzLCMhRMEDZRhfdMDmxPg8xoOVyAzUgRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiheefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuh
    hsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffojghfggfgsedt
    keertdertddtnecuhfhrohhmpefpihgtohhlrghsucfrihhtrhgvuceonhhitghosehflh
    hugihnihgtrdhnvghtqeenucggtffrrghtthgvrhhnpeeuvdejtefhjeethfehiedvjefg
    vefgvddvleejffeitddujeelieeuueegkeevleenucffohhmrghinhepshhouhhrtggvfh
    horhhgvgdrnhgvthdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepnhhitghosehflhhugihnihgtrdhnvghtpdhnsg
    gprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtohhrsggv
    theslhifnhdrnhgvthdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UDnpaWSm_Qi_xpZUtyueZn4eIQzmnm5xaYZjPpww-gi1FFWadpo4aQ>
    <xmx:UDnpaWq6gEHKIyCkYDQ9kcCnwJJS7FMjZe_YvaXKizmHfa2cZYN7yw>
    <xmx:UDnpabpbMbRp_4iHc9pcOT2Ui35L4h47LhknMGd3-JCeVXGS6HI1Lg>
    <xmx:UDnpaQM4z1rW4yR78TmhyIuo34-D5iucyWscIRWgFPDn3mk4lyLT6A>
    <xmx:UDnpaZBitKXLbr0BJrDzCW134JbK06fSWns71Mi6pplIo5vjZwcmKyTX>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 17:10:40 -0400 (EDT)
Received: from xanadu.lan (_gateway [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 9F0EA15FA095;
	Wed, 22 Apr 2026 17:10:39 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] cramfs: drop obsolete Future Development notes and update tools URL
Date: Wed, 22 Apr 2026 17:10:39 -0400
Message-ID: <20260422211039.270552-2-nico@fluxnic.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422211039.270552-1-nico@fluxnic.net>
References: <20260422211039.270552-1-nico@fluxnic.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fs/cramfs/README still carries a "Future Development" section written
around the Linux 2.3.39 era discussing design decisions that have long
since been settled:

  - Block size is 4096 and matches PAGE_SIZE on the reader.
  - Endianness is host-endian; mkcramfs -B / -L handles cross-builds.
  - Block-pointer extensions (CRAMFS_FLAG_EXT_BLOCK_POINTERS) ended up
    being the answer to layout flexibility rather than inode growth.

Drop the stale forward-looking section -- the factual format
description above remains accurate and is kept as-is.

While here, replace the dead sourceforge URL in the "Tools" section
with the current location of the user-space tools on github.

Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
---
 fs/cramfs/README | 92 +-----------------------------------------------
 1 file changed, 1 insertion(+), 91 deletions(-)

diff --git a/fs/cramfs/README b/fs/cramfs/README
index 778df5c4d70b..c0052a11aa28 100644
--- a/fs/cramfs/README
+++ b/fs/cramfs/README
@@ -104,94 +104,4 @@ Tools
 -----
 
 The cramfs user-space tools, including mkcramfs and cramfsck, are
-located at <http://sourceforge.net/projects/cramfs/>.
-
-
-Future Development
-==================
-
-Block Size
-----------
-
-(Block size in cramfs refers to the size of input data that is
-compressed at a time.  It's intended to be somewhere around
-PAGE_SIZE for cramfs_read_folio's convenience.)
-
-The superblock ought to indicate the block size that the fs was
-written for, since comments in <linux/pagemap.h> indicate that
-PAGE_SIZE may grow in future (if I interpret the comment
-correctly).
-
-Currently, mkcramfs #define's PAGE_SIZE as 4096 and uses that
-for blksize, whereas Linux-2.3.39 uses its PAGE_SIZE, which in
-turn is defined as PAGE_SIZE (which can be as large as 32KB on arm).
-This discrepancy is a bug, though it's not clear which should be
-changed.
-
-One option is to change mkcramfs to take its PAGE_SIZE from
-<asm/page.h>.  Personally I don't like this option, but it does
-require the least amount of change: just change `#define
-PAGE_SIZE (4096)' to `#include <asm/page.h>'.  The disadvantage
-is that the generated cramfs cannot always be shared between different
-kernels, not even necessarily kernels of the same architecture if
-PAGE_SIZE is subject to change between kernel versions
-(currently possible with arm and ia64).
-
-The remaining options try to make cramfs more sharable.
-
-One part of that is addressing endianness.  The two options here are
-`always use little-endian' (like ext2fs) or `writer chooses
-endianness; kernel adapts at runtime'.  Little-endian wins because of
-code simplicity and little CPU overhead even on big-endian machines.
-
-The cost of swabbing is changing the code to use the le32_to_cpu
-etc. macros as used by ext2fs.  We don't need to swab the compressed
-data, only the superblock, inodes and block pointers.
-
-
-The other part of making cramfs more sharable is choosing a block
-size.  The options are:
-
-  1. Always 4096 bytes.
-
-  2. Writer chooses blocksize; kernel adapts but rejects blocksize >
-     PAGE_SIZE.
-
-  3. Writer chooses blocksize; kernel adapts even to blocksize >
-     PAGE_SIZE.
-
-It's easy enough to change the kernel to use a smaller value than
-PAGE_SIZE: just make cramfs_read_folio read multiple blocks.
-
-The cost of option 1 is that kernels with a larger PAGE_SIZE
-value don't get as good compression as they can.
-
-The cost of option 2 relative to option 1 is that the code uses
-variables instead of #define'd constants.  The gain is that people
-with kernels having larger PAGE_SIZE can make use of that if
-they don't mind their cramfs being inaccessible to kernels with
-smaller PAGE_SIZE values.
-
-Option 3 is easy to implement if we don't mind being CPU-inefficient:
-e.g. get read_folio to decompress to a buffer of size MAX_BLKSIZE (which
-must be no larger than 32KB) and discard what it doesn't need.
-Getting read_folio to read into all the covered pages is harder.
-
-The main advantage of option 3 over 1, 2, is better compression.  The
-cost is greater complexity.  Probably not worth it, but I hope someone
-will disagree.  (If it is implemented, then I'll re-use that code in
-e2compr.)
-
-
-Another cost of 2 and 3 over 1 is making mkcramfs use a different
-block size, but that just means adding and parsing a -b option.
-
-
-Inode Size
-----------
-
-Given that cramfs will probably be used for CDs etc. as well as just
-silicon ROMs, it might make sense to expand the inode a little from
-its current 12 bytes.  Inodes other than the root inode are followed
-by filename, so the expansion doesn't even have to be a multiple of 4
-bytes.
+located at <https://github.com/npitre/cramfs-tools>.
-- 
2.53.0

