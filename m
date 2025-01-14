Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8001FC7DC
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 19:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736881535; cv=none; b=E1Pa1o7w5Z8WCxAMN/hiTbXvwEA86WLxWAT9Jm9Zns7MKpL4M9DA8JEm6Jn31/n/XEsMUt1llLmObZJU74t0RlgEyoX0XVbxQXXpKRv8FbyQSpsRlyUbQ9IfTuKML0lZkXUTuaFx+Ezg/vEiGGA8Md2ANynxkph5G4JJru+2h9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736881535; c=relaxed/simple;
	bh=HUIDQX/C2Kaj8iAG1i1nltDWrwSe0E8OoW2HHZRHY3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=jB+VMsi6ElIILf1JjnWGVWYwLmVmk2vhQFtcJIrIAhopY07izU8ewVIJfZmfqX4BVU4gBtss0Tl5iMQDnjVkvbguTXAycecP0O/EbboZu0iRJ8OOAoy/11gndjBybfDVzZrO7cnBhZ6q/IfYG3oYAwSPhJ4HPSl5TBOMAWcc/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cMCw4Irn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cMCw4Irn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736881532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EVtYqozuCYNX5XJYrZPUoZYJYg8mOEwK0+OjPkXsGtA=;
	b=cMCw4IrnHojvXawxCcq2bYFKkF410OOzOLT7JqObZVJzq/Wv4lFBZQSj9Y1Iif+NKR51uC
	NB8wULJ6eKf1czteuLx2cIhcuQ+OtNVE0ahE8oOIA5IV3ygGtdHkHLmYOsdQjaICgaZ0dR
	XB2DDtEGLGEuuVsRzZktDx+7l2PD3gE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-F40VxP2EMOqLpgfMW3WltQ-1; Tue,
 14 Jan 2025 14:05:29 -0500
X-MC-Unique: F40VxP2EMOqLpgfMW3WltQ-1
X-Mimecast-MFC-AGG-ID: F40VxP2EMOqLpgfMW3WltQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 58A4A1955DBA;
	Tue, 14 Jan 2025 19:05:28 +0000 (UTC)
Received: from pauld.com (unknown [10.22.65.61])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4E2E3195608A;
	Tue, 14 Jan 2025 19:05:27 +0000 (UTC)
From: Phil Auld <pauld@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] Documentation/sysctl: Add timer_migration to kernel.rst
Date: Tue, 14 Jan 2025 14:05:25 -0500
Message-ID: <20250114190525.169022-1-pauld@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

There is no mention of timer_migration in the docs. Add
a short description.

Signed-off-by: Phil Auld <pauld@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/sysctl/kernel.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b2b36d0c3094..7c759797501d 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1544,6 +1544,13 @@ constant ``FUTEX_TID_MASK`` (0x3fffffff).
 If a value outside of this range is written to ``threads-max`` an
 ``EINVAL`` error occurs.
 
+timer_migration
+===============
+
+When set to a non-zero value, attempt to migrate timers away from idle cpus to
+allow them to remain in low power states longer.
+
+Default is set (1).
 
 traceoff_on_warning
 ===================
-- 
2.47.1

