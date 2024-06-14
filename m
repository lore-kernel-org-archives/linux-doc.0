Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E41862AC
	for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718352897; cv=none; b=lWKCmEcu83c1yzLpyTFjws67tFxYCBYgLde+X8N6ffp3Q+p/tj3l/JZz87v3zVNkaQzkfYJOMsJDJ/J/oVZ38r65RGOySdsyT1SMFiKpaTRNYZoB0ztzmW9GWDCxwwNukoMw4awqfOfjfgcsMfzJ7ZzkZ9lDaABQ5zcQKThID9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718352897; c=relaxed/simple;
	bh=AJr56AIyxw1AV+8imWQzB4XZoQsJAgsK6sLrW1PzyvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDj2/XedZFCreeD2CbvnvSl7wkCvd8e4h3YtiForOyuXr6DmsLlolaDf2Wsv4KfBQsgyiSmmVfsoFo3cch8ATel2+CuDslOIj3zg35mBuhNxbYp0+TIgA147emCmYjiPWJnu2nMInEw1VEVD+FN04ZgZvxOtBp2Wx4L27o6KgwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bqpbfCPK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqpbfCPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718352895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kpIVMcrxNUuot3WrmRIeXJx5cyzexiU4T4G3Mxhn+Fo=;
	b=bqpbfCPKmMAIe3rMCu1jIO4mCSlf299PWKjs6moSAlE+mU627SEU/iQEOO9kpgIdK/V0up
	9cD83+7zSnhZcQ3lKlF+Y8h4XLdn1c/6cNA63wic7pfO6NbvWEXdUM0LcnDmSZRD0oVSli
	+XzbVTMxO9QRgQ6igLyes1oi0q+/xts=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-QPyfIbc7Np-25l__XOO7DQ-1; Fri,
 14 Jun 2024 04:14:47 -0400
X-MC-Unique: QPyfIbc7Np-25l__XOO7DQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0BBC19560AE;
	Fri, 14 Jun 2024 08:14:45 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.73])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F2DDA19560BF;
	Fri, 14 Jun 2024 08:14:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-doc@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH] Documentation: Add "S390" to the swiotlb kernel parameter
Date: Fri, 14 Jun 2024 10:14:38 +0200
Message-ID: <20240614081438.553160-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The "swiotlb" kernel parameter is used on s390 for protected virt since
commit 64e1f0c531d1 ("s390/mm: force swiotlb for protected virtualization")
and thus should be marked in kernel-parameters.txt accordingly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 PS: I wonder whether we could remove IA-64 nowadays...?

 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b600df82669d..423427bf6e49 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6548,7 +6548,7 @@
 			This parameter controls use of the Protected
 			Execution Facility on pSeries.
 
-	swiotlb=	[ARM,IA-64,PPC,MIPS,X86,EARLY]
+	swiotlb=	[ARM,IA-64,PPC,MIPS,X86,S390,EARLY]
 			Format: { <int> [,<int>] | force | noforce }
 			<int> -- Number of I/O TLB slabs
 			<int> -- Second integer after comma. Number of swiotlb
-- 
2.45.2

