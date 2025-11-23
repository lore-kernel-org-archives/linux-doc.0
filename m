Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896513B1AB;
	Sun, 23 Nov 2025 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763882065; cv=none; b=IV6SggHs6lzXS3r109bi/eBtcn09EVq16MylH3IfDghrEkETJjm48QCIep8DIedx85kITQnlD/KZ+tvNJ8pdph3I4Sf8jNFLDE6E/Wq0VgJA6XlPyr8B7yfWU8I7KMm5cnrhZCO28FBIxxrgxFeXdF62TcJMjakZVULJDVKsEaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763882065; c=relaxed/simple;
	bh=cx9QffTSYqlHb4TRmFm6Cl1WBWo6Gx4k+Jh647bvAwk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dVhlG5LDQanpVOdt6x2sLqUIj6LC/uJso50wt6Ujnw8FPtv3kfY79+ZI+qfeGBRvG24tmRRDhOshw22aLFSiB3c53kFqH7uHW6WLF4AkyjKIe/IOeaf9g2I/l808hZ4Es7M+HfEOKSYxYlog4tbPc42raWD1qmayo50BjBvjOi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=APIk+rU2; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="APIk+rU2"
Received: from nirs-laptop.local (unknown [85.130.135.138])
	by lichtman.org (Postfix) with ESMTPSA id 1779E176F17;
	Sun, 23 Nov 2025 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1763881734; bh=cx9QffTSYqlHb4TRmFm6Cl1WBWo6Gx4k+Jh647bvAwk=;
	h=Date:From:To:Subject:From;
	b=APIk+rU24CRy4ckoZD60oiCzram1cYooWeqqZg9MNiMxrqMG4QI2poNZ1UccVuzQ6
	 mIuM7VwNDdSprpnR22pnUD5g0BQUAt2f0mtdGBJlObHYDHHMBe1D4jcE5AHKtjaZrz
	 t0jyPHHontqhD+on6C6t1dm3dvoMis0EsDF1PVgNhCTqYP4SWgrpr0HnBnEKUQ7uLp
	 qTMrKvReM467xLPFjXCn6OfIr80/C9d5iAHGZQZ+qAcjE1pONw5rju0geJ5YVLSg37
	 WXI5FqwzMpmAbDLdBb/ZYyp8ii14AvjfA6xD/W1nSfUH4dgSYapaRrlhjYC+/j0E4B
	 G4sFhdDksOdbQ==
Date: Sun, 23 Nov 2025 09:08:38 +0200
From: Nir Lichtman <nir@lichtman.org>
To: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: Fix confusing descriptions of rdinit and init
Message-ID: <aSKyeGTFNoGVo95O@nirs-laptop.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Problem: Documentation of init does not emphasize that it is only used
when initramfs failed to load and the legacy logic of direct root
partition mounting is started.
Documentation of rdinit uses the legacy term ramdisk even though
nowadays it controls the init process of initramfs.

Solution: Fix and modernize both.

Ref: init/main.c and the kernel doc article "Ramfs, rootfs and initramfs"

Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca..63170346c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2305,8 +2305,9 @@
 
 	init=		[KNL]
 			Format: <full_path>
-			Run specified binary instead of /sbin/init as init
-			process.
+			Run specified binary instead of /sbin/init as init process
+			from root partition, used in case init was not found
+			in the initramfs.
 
 	initcall_debug	[KNL] Trace initcalls as they are executed.  Useful
 			for working out where the kernel is dying during
@@ -6194,7 +6195,7 @@
 
 	rdinit=		[KNL]
 			Format: <full_path>
-			Run specified binary instead of /init from the ramdisk,
+			Run specified binary instead of /init from the initramfs,
 			used for early userspace startup. See initrd.
 
 	rdrand=		[X86,EARLY]
-- 
2.49.1

