Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC7221D584
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753371301; cv=none; b=jungGGXA5PuNEfE6oz8qNp46eriqW6cybXoqbSSWv+BlpFEcSMq6eW1APeTEE3BJg8fgVKfcs9cjTK2GRhaUokzMFkujn6I08AbjmyfWkYKQyt8bRVGKztLh0b8azO8gy6WR4r+WFbuHVWZAOIEAl2KRAiufUOKHG3W2nUjOHsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753371301; c=relaxed/simple;
	bh=BZM9OjI5u1ZH+XzmU8tGDwh5znKnIuFgMHoROBcEK7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hv7VanF+C6xmQQykbb4oFOGPPEDMqm2gnNGXcDXbBqzauLTfGEj60e51ROhZ8zhhHZfJywB66dypeMbAyu8ygdvHJn0eCgApwutPV+6aL1vnAhjEP01go7FA1xkg3z2BzX2Tyxg62q30ql9AuNdY0OQFCmw3jKtbVvYD/9DPv3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=VWdqeEnv; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="VWdqeEnv"
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bnw6p2Wthzm0ytb;
	Thu, 24 Jul 2025 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1753371296; x=1755963297; bh=IeoAd0T7Qfvu0LhiMjd/HpfvXfIXo1ePTpp
	m7iNakcM=; b=VWdqeEnvwF+2YoVPe4AQ1mq13K7DxihCST2aliP43i8Lh7/7TVu
	SzBwi6UAfdkRqeVPQF8+HcHb/XGs6TKXXV7zCiF6hNcxxq/8blEFue17g3zv59bm
	nN2CVdHpP0kp5JrWKvspZErWtDyX6KTp7W/vJq4OzxBVH2ldzMgNhju4ueXD00uG
	Mks1d2oEf0UAj/y5kB7D3wsX3mLZCwZtuyaoZJzOpAAo+krBRk+2j/iF8RTd4FRR
	rTSHPOYJ66B9q4cSvwFHaHe3MLZv9CnIb+FbD+sASg+hkkmq8IZRZnvTf+gGA4bq
	lYws/Ly7EjLhEKp1EP1qNIoEQtNezbw9skQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id BrGWJ8NZoJdU; Thu, 24 Jul 2025 15:34:56 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bnw6j2TWBzm174B;
	Thu, 24 Jul 2025 15:34:52 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH] docs: filesystems: sysfs: Recommend sysfs_emit() for new code only
Date: Thu, 24 Jul 2025 08:34:42 -0700
Message-ID: <20250724153449.2433395-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The advantages of converting existing sysfs show() methods to sysfs_emit(=
)
and sysfs_emit_at() do not outweigh the risk of introducing bugs. Hence
recommend sysfs_emit() and sysfs_emit_at() only for new implementations o=
f
show() methods.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 Documentation/filesystems/sysfs.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/sysfs.rst b/Documentation/filesyst=
ems/sysfs.rst
index c32993bc83c7..624e4f51212e 100644
--- a/Documentation/filesystems/sysfs.rst
+++ b/Documentation/filesystems/sysfs.rst
@@ -243,8 +243,8 @@ Other notes:
 - show() methods should return the number of bytes printed into the
   buffer.
=20
-- show() should only use sysfs_emit() or sysfs_emit_at() when formatting
-  the value to be returned to user space.
+- New implementations of show() methods should only use sysfs_emit() or
+  sysfs_emit_at() when formatting the value to be returned to user space=
.
=20
 - store() should return the number of bytes used from the buffer. If the
   entire buffer has been used, just return the count argument.
