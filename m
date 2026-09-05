Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A232D5408
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 02:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577113; cv=none; b=K+s6FZrBcyIzDvcxjDgW4lzSz6Z6OXM0Bn+gc6qZ36NK5kTvp816XZg0RxZMmgyA0DZ1/cGZNlH6BBB3FKh0KHmR4qZyG6+0KTSJECibGv8YgqQUdayk/SN3jcpci4e/PvaeY8O8vgBgv6wRt/3HrE9oVNooq7BsOFGnEbqe1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577113; c=relaxed/simple;
	bh=ssSVIdhU28wBo3bZAvVEYRVb0VBjTnH+Szu3oc2gf4k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BxXDbDdo7nFSf/ngpLGOMxyGyQ8BT5SXTYtu5Mcrj5Ru6beVwSyrA0vf150rFLWIuvOg8c/1QsmrOdZ/Q8Gg5vqxrK8s888uN/LObCTVmg/wv/6rqIIrDfrhab+QRAnf9iZHDCCTIi7KCiZPwYigDLBPfEnVLShFDOjuncMc9N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ram+X5t8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ram+X5t8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso15123445e9.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 19:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577109; x=1789181909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Pep5Nu0BxhAqF2yFjcnol3vjVLD0FPuyRmanesgGxk=;
        b=Ram+X5t88Rc52rdbBl5rGrcmD5N5GsjJalyvxYQVWeX1G1KhYdkxSyxmZ5kIpGH/fV
         BsH1tZzE8yz8irEFDbiMpyCfAHs8LkK6JHm4BaE0n7IeOuowNxkIOkA+iXzkLfpxzs8s
         08lAz+a6OjQXAgJ7X9CCEPGj4L/Giia1qW4bbgMoZoPhQSRZ9oRx81bCRD1Y+YCQU+JZ
         XgMwr/okGbVm1MYzKI99asLpcKrBqqT+n/qnLUCCGqd2iacJ7EqGrMUNunhqvImNMgvG
         udocngK3qgLJP91Dz59df9/iuhE5XJFAukF5sua/y4vD2kIKDPY+SN+j8/aLXLNmxB/K
         7qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577109; x=1789181909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pep5Nu0BxhAqF2yFjcnol3vjVLD0FPuyRmanesgGxk=;
        b=Mvn5w3ELVjevOXyWY+689A9Qomrbn7TVgPPV/ipuTUciTUQmsjztY+U2i4u0qgTQdB
         CXzTeNaSgncTfWJ1TYRKBpMi/3qAwZ0lWae/IWuDOSZJ9FTAhS2vFrYCo2uIIXPi7Q7+
         Gb+YF5YtBBVilpBzBHqaht94qSiMC9sy1N2rHjZizAa1OACVzuieO8Y1feDK/awpT2P3
         MaHAEv0KQT4bkr1Vd+/ujSjXsgx3LK2vqkK9ahORkOAKkimYDkbW+cg4ojS3CPalg9XC
         ooMW+TuuBa22MR4KF/bxA1f4riryruAF6OixRB3dNyGAb62ePDIFkXEEx87U9ko82bul
         bW6g==
X-Forwarded-Encrypted: i=1; AKwUvBymCi3oOUIXi8vDR6VPbOzdLeg61GvVR6RfCRtDV+0PMGZaw77Ah6uHJdZnLw6G30szGTVSqKm7Sh8=@vger.kernel.org
X-Gm-Message-State: AFuF++ljD4yrban02DE9E9KsJY2BSPRWmOsutWO8qG3aSV3DBrpEkIsZ
	bHqCOXoHaDHeUkKoH2h5SUNfq3lzEk3/eGFDIkoKvY72jXSeSSngrnf2
X-Gm-Gg: AYBFou3gEmUn2p4bqagMifP8gTkLyZDxPB7KtjbCjI48ZQUzaMuLVZvf9nBKdYLi1cW
	Z1omkyFuoVl4/v7Dgu92VNBnVnSLXF5J+sPB+tQhi3ceaVPZLKweQHtsqoSWKy7xnGFKaiy/WB/
	V6pansfhj/z2+7Sz266/NALJJwakDxAXArkrOWt+tKeMIHAjClpI+yaHZDACbL2lA/J0a31/B8h
	/upz0wHQY2yObg+BtT1wgye1mDPYrvXD6JaplElozSKroaMBcbmsp+MYcYLprwvzsib/Mu8VALc
	lF2WsfY0fCZxYTJ0wEbzGb7nbVojhr+Vebz9SamJG6BTunZPp2Q8l3odhxvwgeZiui1PHF/vQrB
	Bu/Ju8iwSmO/jrJfRiarQLVLbY9MSYJaRle/UBTHS5g9dijXNVvbqfCAW2OTnPWGuOYb4MDJqBh
	yPoIV7jHrAuDr30e4PAIKRrOT+TrbRGSJI9GA/boBiUZJSgVHX9zBCucP8AUFOCLjwRJgEnIv6N
	0xImxyasN8cshtr0erDENmd3Mq4m+iaQuisn0d6aC62Mt40GEoOSbxe69UE9Px0CDuG2HHPNmBu
	WrrRxsFKcTeA6QzK7tpOCbx4fSmGfGI7uPgEWqnEtvuzTdAfBYvxbcXxo1zSUYzHHTc=
X-Received: by 2002:a05:600c:871b:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49cf82cbac2mr87022315e9.5.1788577108604;
        Fri, 04 Sep 2026 19:58:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm111088995e9.6.2026.09.04.19.58.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:58:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: parse-headers: Fix script name and stale Makefile reference
Date: Sat,  5 Sep 2026 04:58:21 +0200
Message-Id: <20260905025821.83968-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script is tools/docs/parse-headers.py, not parse_headers.py, and its
FILE_RULES argument is optional. Commit 8a298579cdfc ("scripts:
sphinx-build-wrapper: get rid of uapi/media Makefile") removed the
Makefile the text points to as an example; the cross-references are now
generated by the kernel-include directive, so point to a file that uses
it.

Fixes: d69a03a97a2d ("docs: doc-guide: parse-headers.rst update its documentation")
Fixes: 8a298579cdfc ("scripts: sphinx-build-wrapper: get rid of uapi/media Makefile")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/doc-guide/parse-headers.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
index a7bb01ff04eb..eb36c92e9a06 100644
--- a/Documentation/doc-guide/parse-headers.rst
+++ b/Documentation/doc-guide/parse-headers.rst
@@ -8,26 +8,27 @@ between the code and the documentation. Adding cross-references for
 userspace API files has an additional advantage: Sphinx will generate warnings
 if a symbol is not found at the documentation. That helps to keep the
 uAPI documentation in sync with the Kernel changes.
-The :ref:`parse_headers.py <parse_headers>` provides a way to generate such
-cross-references. It has to be called via Makefile, while building the
-documentation. Please see ``Documentation/userspace-api/media/Makefile`` for an example
-about how to use it inside the Kernel tree.
+The :ref:`parse-headers.py <parse_headers>` provides a way to generate such
+cross-references. During the documentation build, the same parser is used by
+the ``kernel-include`` directive with the ``:generate-cross-refs:`` option.
+Please see ``Documentation/userspace-api/media/cec/cec-header.rst`` for an
+example about how to use it inside the Kernel tree.
 
 .. _parse_headers:
 
-tools/docs/parse_headers.py
+tools/docs/parse-headers.py
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 NAME
 ****
 
-parse_headers.py - parse a C file, in order to identify functions, structs,
+parse-headers.py - parse a C file, in order to identify functions, structs,
 enums and defines and create cross-references to a Sphinx book.
 
 USAGE
 *****
 
-parse-headers.py [-h] [-d] [-t] ``FILE_IN`` ``FILE_OUT`` ``FILE_RULES``
+parse-headers.py [-h] [-d] [-t] ``FILE_IN`` ``FILE_OUT`` [``FILE_RULES``]
 
 SYNOPSIS
 ********
-- 
2.53.0

