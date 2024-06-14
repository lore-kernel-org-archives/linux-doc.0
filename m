Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9728E1A2FB9
	for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 19:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718392099; cv=none; b=kwjwgknXuNQ8ra2sKY075iWiuWUgn20mLlz/UVr/bKl+GgNa1ABvWZQQwWHjd7+G9ekRaUcTE+9MHOmoxzjcJwhJ45XAMmVewjnc70hapbfZs7U9rQ4x01u+TKnlvAXEVvhl/SLrIwMI1TBayTjsz+Da+WBj5IO9We0CdPigic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718392099; c=relaxed/simple;
	bh=SQ/YQJdOFpW9+EoBypMmkzS+5zxvUiRg5Z5oH8yhL00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eeLtZ7UYgkfMuXaFU+jrYkfAoRWVPpbobcrXJh9L7p68/LwZjmhKswGQc1gYmpBfPKICohlWZH8luZX9tA3OI/aRABcutXiOiLsf8HjyPn5L9cUIIR6P8IdCQCY15+pp7g8Ok8nLoAD21t2M6kd4s/1TdYLx1ZpUqmuKSrbxPNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aqTg9aRc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aqTg9aRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718392096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DwSn56t118gnsozrPMNHvwFUxMQgx5fcblRLcH107/8=;
	b=aqTg9aRciwZjYCqwrDShWsTDDsfZVDJc1xO5aPhC2L9C7jQNuAx5cGENSl4Z92hk+q6/c1
	cIpFm+8LdH09xtmjAY4+6xBJsdhn9w7+ciHzK4e0sRbbdEjsgK1NpJhkiZlWUCNz/rSWFa
	O3eW4VfED3DKpE5xcknsBHXnqy00rqU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-374-cYgAlWJEON-cBqK9V1LgOw-1; Fri,
 14 Jun 2024 15:08:12 -0400
X-MC-Unique: cYgAlWJEON-cBqK9V1LgOw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CFAC4195608C;
	Fri, 14 Jun 2024 19:08:09 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.73])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B3221955F2D;
	Fri, 14 Jun 2024 19:08:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-doc@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH] Documentation: Remove unused "nps_mtm_hs_ctr" from kernel-parameters.txt
Date: Fri, 14 Jun 2024 21:08:04 +0200
Message-ID: <20240614190804.602970-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The "nps_mtm_hs_ctr" parameter has been removed in commit dd7c7ab01a04
("ARC: [plat-eznps]: Drop support for EZChip NPS platform"). Remove it
from the documentation now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dd8436c98735..f58001338860 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4143,15 +4143,6 @@
 			parameter, xsave area per process might occupy more
 			memory on xsaves enabled systems.
 
-	nps_mtm_hs_ctr=	[KNL,ARC]
-			This parameter sets the maximum duration, in
-			cycles, each HW thread of the CTOP can run
-			without interruptions, before HW switches it.
-			The actual maximum duration is 16 times this
-			parameter's value.
-			Format: integer between 1 and 255
-			Default: 255
-
 	nptcg=		[IA-64] Override max number of concurrent global TLB
 			purges which is reported from either PAL_VM_SUMMARY or
 			SAL PALO.
-- 
2.45.2

