Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489E2184129
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604546; cv=none; b=g0nMOcGZgEtWTywk3GsQuClcJNzvL+8RRz6EIIPI+rnowQskBmlWESUe0dVjCtKgRG97KukaDGNRnVSZfpfzBCNekLUZuHGaKhaop82hDlq5rYTt67WWfqfr0xw26bA8v+jBbMEpxjpXse0nolPUKKqNZPejOXmojuKQcJ6G+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604546; c=relaxed/simple;
	bh=hDS17+qsNPNNXUV82rej7BO7Xc0Qy2N2DhSjAXLBNYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FqdaaXRMaW5q9jD83CtJI4VWviwghUaTU+qR9MaTSkDoBjgbYHzVLS7FhKhHB9QOOI96cxD06mGp4iJ9gRiy8GKvQ4q51+V5S5xxAoQuaoNvZ8CUNk7LMU8FZ4CjKwsvNS02mTsf8ZDzqxzZF7UyaoyPIHPUSXdI6KJAXL/QA2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YytoJ1Rg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YytoJ1Rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718604542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SJWLUmdGlAVRxpPGtNzAhFQ8b0B895zkZS1r5Cdi/us=;
	b=YytoJ1Rgd9QChZ28vRlsGZ01EuZ/+tn0eMHEqElb6koGnJokRgFbyLXqrJeWH3jwUfbHCI
	K5yYsdIYYmHTj+NuW29WMcLTBYeYTMykj2xCepXUohTiooJmVkYtcWlaAgXkkR5Z3ILE5N
	a7XOCjz+4MElsT5AYgEIeipdjqU4ys8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-j0aGtohiNXCPdVwPt9CADA-1; Mon,
 17 Jun 2024 02:08:58 -0400
X-MC-Unique: j0aGtohiNXCPdVwPt9CADA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2232419560AA;
	Mon, 17 Jun 2024 06:08:56 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.120])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7DA9919560B2;
	Mon, 17 Jun 2024 06:08:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-doc@vger.kernel.org,
	Nathan Lynch <nathanl@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linuxppc-dev@lists.ozlabs.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH] Documentation: Remove the unused "topology_updates" from kernel-parameters.txt
Date: Mon, 17 Jun 2024 08:08:48 +0200
Message-ID: <20240617060848.38937-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The "topology_updates" switch has been removed four years ago in commit
c30f931e891e ("powerpc/numa: remove ability to enable topology updates"),
so let's remove this from the documentation, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f58001338860..b75852f1a789 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6600,12 +6600,6 @@
 			e.g. base its process migration decisions on it.
 			Default is on.
 
-	topology_updates= [KNL, PPC, NUMA]
-			Format: {off}
-			Specify if the kernel should ignore (off)
-			topology updates sent by the hypervisor to this
-			LPAR.
-
 	torture.disable_onoff_at_boot= [KNL]
 			Prevent the CPU-hotplug component of torturing
 			until after init has spawned.
-- 
2.45.2

