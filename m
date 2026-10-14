Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735EA414400
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 16:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.251.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995821; cv=none; b=SMRgvJ7rpcsEJm3yaxfmW4ThrqmM3hm+LVJrSylVIlv+qkbKAx/NoWsUd6wYbls4+uWkbvuiLu8KZfuNGAV/I8usrH1ps98wdJvxD9nEdFk0N5RzzhmH/Ec2Ks82Ppo4MXBwZBWf6rZVNfZPnfGZbwlW7boH+s2z/68DVFhuV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995821; c=relaxed/simple;
	bh=TYtYdXUsdW2Bgbj0of1rrpHBCaxBL/WJU5cUe8oRie0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4WCwAyVwRb6suuZXisqhVmBkk3rotFuXCr8VXeL89uSjUz8qm3eCAhwOWXPQlEKkY+ngcnMtAY2G1mJ5wSSwf/rFASSKuPftoZypRBCjvz7j7MP1JKJ4EI5qyaKjfw/QsyovcIp9gQc/RpJFbETBpVsPk4La6AONmNe88ZlFzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk2.org; spf=pass smtp.mailfrom=sk2.org; dkim=pass (2048-bit key) header.d=sk2.org header.i=@sk2.org header.b=JZGYR0wT; arc=none smtp.client-ip=178.33.251.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sk2.org header.i=@sk2.org header.b="JZGYR0wT"
Received: from director7.ghost.mail-out.ovh.net (unknown [10.110.54.193])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4j4cBc0Pptz5ybt
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 16:30:32 +0000 (UTC)
Received: from ghost-submission-5474cd94dc-54jct (unknown [10.108.54.179])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7331AC00EC;
	Wed, 14 Oct 2026 16:30:31 +0000 (UTC)
Received: from sk2.org ([37.59.142.96])
	by ghost-submission-5474cd94dc-54jct with ESMTPSA
	id 4JDAECeuz2o+bwAArWaaig
	(envelope-from <steve@sk2.org>); Wed, 14 Oct 2026 16:30:31 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R0019bfdabee-4663-4810-a2e9-75780c991234,
                    58F39AC3C6885B12E77626CC8F19CB2AA97F92B4) smtp.auth=steve@sk2.org
X-OVh-ClientIp:82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: "Theodore Ts'o" <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Stephen Kitt <steve@sk2.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-ext4@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: ext4 filesystems can be converted to 64-bit
Date: Wed, 14 Oct 2026 18:29:20 +0200
Message-ID: <20261014162921.450235-1-steve@sk2.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 12549280362310800188
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTE2ROnsvz6nYESn2a7zLbxr24oglCetlVnnSwmt8gG9OTrPLyD073GyTBAZ+3atAZgXrmc2O1v9yXD+aQMy1hAr+VWNKeu6ETP0OaaUG+XZ3UJUNRQcjKo8kT5xHebSskkbXXRgq4L1RXxs7DUWV5IoxU3ZD32mIDS/QeITQcwtn8/3U3Og1RVCytHCYe/xBNW8w+rpX7ETnOX2fBYgpReZPZfqgo27Oo2iw+NOQv7O1baWE6TAFBpfrLvSKyb5/Sxxb2T33U77Aks3UQq2fm+z2Ln/lAwUVAAJ92oYz2f9ZkYoiOXofO91WZdeS3y0C3I7UCzmb9ETqFLH2U7jKvRFK/AsjuPR8O41qK1YVTDoqYTJI8zlpa2c0J5b874PJPqzjLtyiD8/k5vYHAP8o6pcLPYQfezlLkwX/JoB3BoHwFewDCsSXTQI7j9CBEFMgys0pQmCC+/+UeRZqz7qKRK3kFtc1EYcPL9hYx3gllx2OSVaXTlZrzPbkXV8mAoKsEo2zOJX6uJOf1V3n9/pN3FkUsdQ9KaVr/uICb9qgtOaO6BEUCqj3pw/QtjYp+/BG+gc4PJ3vcWe6ivBW+b9ViAZmu0MTrQckoLyIAFJ35IMEKpH6SnCIqketREEAwHq9W5i48OTU6w0o1QRvhiKMQ3teHsf+L5eDLuVMhfBizk6SQ
DKIM-Signature: a=rsa-sha256; bh=bMGDprWDfvd4xUWzv9mBDwkTiIxwCEOXyHkVqN5mtQE=;
 c=relaxed/relaxed; d=sk2.org; h=From; s=ovhmo304764-selector1;
 t=1791995432; v=1;
 b=JZGYR0wTGI0ehWgWaMs9Cmhu/DWAOk+xrOa8tejBOPFjE00Ff4/wFo3z3+PMJfEx1eSbVvy4
 gD7Uzm+aRkRWIrpjRrvAxJQkJ6+o4YaZnvI0B0EfzZ0geSf7faQih69MyDyJqIqm3s6sGpgJQ7V
 IKfVID+lgg92rNKDxB+immNrFWZ0lRhBZWZvSYzLGgj98I1BJXWHht9AKzP7bok3NxHVqX5yKQo
 rYxSmFkUGtMO3Q/f7EiT6/zLcOJZJ3SjdP98WEpskvb/Z3liAey0tauMpioHp4WNKop/zAgIvEi
 T9ikpDwyGdOPrh+y+XbwXsSru8Qg+e6FwYGKRG58LcHBQ==

Since commit fe12931 ("resize2fs: convert fs to and from 64bit mode")
in e2fsprogs, which shipped in version 1.43, resize2fs can convert
filesystems from 32-bit to 64-bit and back, so the mention in the
checksum documentation that this is impossible is obsolete. This fixes
that.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/filesystems/ext4/checksums.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/ext4/checksums.rst b/Documentation/filesystems/ext4/checksums.rst
index e232749daf5f..51a2150a1bf8 100644
--- a/Documentation/filesystems/ext4/checksums.rst
+++ b/Documentation/filesystems/ext4/checksums.rst
@@ -10,9 +10,9 @@ of October 2012 the only supported algorithm is crc32c. Some data
 structures did not have space to fit a full 32-bit checksum, so only the
 lower 16 bits are stored. Enabling the 64bit feature increases the data
 structure size so that full 32-bit checksums can be stored for many data
-structures. However, existing 32-bit filesystems cannot be extended to
-enable 64bit mode, at least not without the experimental resize2fs
-patches to do so.
+structures. ``resize2fs`` in ``e2fsprogs`` 1.43 or later can be used to
+convert filesystems from 32-bit to 64-bit and back (using the ``-b``
+and ``-s`` options).
 
 Existing filesystems can have checksumming added by running
 ``tune2fs -O metadata_csum`` against the underlying device. If tune2fs
-- 
2.56.0

