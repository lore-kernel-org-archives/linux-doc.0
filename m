Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFB013C67E
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736863389; cv=none; b=ubWkHQpMLtcG1vgbriSZoRgXU/fh0DuuXVFINbAcmvzawwquQSqQDRnjXHI88Xcb290EpP7sa4uNIUy84Y7bZTVH8Ud9H9dzhJ75Noophz7xmLG0W5pp+sFwoYGCfg0ZJXcqGDSZgg7W9fI6JYv2D4EHKBN3EQPv1jYtuXLIDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736863389; c=relaxed/simple;
	bh=Y0fCbLd3aJdYEHnZwT3s3l1Bu5mzWVa4xgHgqo1aJ1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=hHT7jyveCEWb4ocNl0LNv46zlwFJAwQgKvbXjPXDwpPX93YRhvbFFt6vMcyfknyznvNjJgON8OyrqTJGesVEbF6Cnpui5ebsIeNb8QTidgfkJVOnvxLiP0EUst6Gp0NidZpKrwdBAc7R49UQ1f6yoAl5sICcZi18IWWQF/PjSso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HJrwm6nA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HJrwm6nA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736863385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XNBGHNh0fauV4lsWoPr3aQjqDoJSVECR3URwoqsUADY=;
	b=HJrwm6nAV82UO+GDxBP/pn+Uh2+MAX57G1TXiVmv0PqVzBYTavINuxhhBCBoilDR+00Y0E
	hWL7zCnV9dxX03BePJkA/rS0mwT7VqzNopVKgBJ0UhIdoy3DQbEzuuB7kjfZwJwlVwQSxp
	iVLq4iKW91Sbj2OdWKrtw/btSUs7vdE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-ejPlmtCgM_alqtaw24oI2w-1; Tue,
 14 Jan 2025 09:03:04 -0500
X-MC-Unique: ejPlmtCgM_alqtaw24oI2w-1
X-Mimecast-MFC-AGG-ID: ejPlmtCgM_alqtaw24oI2w
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B3741953968;
	Tue, 14 Jan 2025 14:03:03 +0000 (UTC)
Received: from pauld.com (unknown [10.22.64.237])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9EDC419560AD;
	Tue, 14 Jan 2025 14:03:02 +0000 (UTC)
From: Phil Auld <pauld@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/sysctl: Add timer_migration to kernel.rst
Date: Tue, 14 Jan 2025 09:03:01 -0500
Message-ID: <20250114140301.141147-1-pauld@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

There is no mention of timer_migration in the docs. Add
a short description.

Signed-off-by: Phil Auld <pauld@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/sysctl/kernel.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b2b36d0c3094..e03691e2cf4a 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1544,6 +1544,13 @@ constant ``FUTEX_TID_MASK`` (0x3fffffff).
 If a value outside of this range is written to ``threads-max`` an
 ``EINVAL`` error occurs.
 
+timer_migration
+===============
+
+When set, attempt to migrate timers away from idle cpus to allow them to remain
+in low power states longer.
+
+Default is set.
 
 traceoff_on_warning
 ===================
-- 
2.47.1

