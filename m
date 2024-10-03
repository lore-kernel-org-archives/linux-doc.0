Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C7616F8E9
	for <linux-doc@vger.kernel.org>; Thu,  3 Oct 2024 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727958275; cv=none; b=Avp9PKiYfki0fBn+uhC5pS4V7kZp0xlO5OVeyztlaTheoZwcaoNDg+GFhvomPYkGNuU6QSi/0P3WGO8/UnJqyX0DZmgO/+m24Sz+8HK47FajDA96DqSSkH/DLONTRYBFUk0Vqp3jjnCoA3Bm26Fd6ebx3NgKlVy2wnNEwQkb6ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727958275; c=relaxed/simple;
	bh=py0PPFc2Z3Eu/s4wBRnKGObvN7Xub9Bvs9CteQbFy8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8k0IxnFIYXxSRxZiA+3P/ptjqaf8KIB3Z8JK22M6kTwwqWKKx6ZJJPOSOT4GYYFdrqYq7Qax224zU+F2GCPRc8D/3y8mZHu7LFIKKJR+eA8ODyUUsuoH3Ak6TSSewPwkqcNDs03iW6JEHKZVLqVTgP3Tb5yllaRjajuxqdmUEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OEA6s/IA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OEA6s/IA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727958272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Hl2FfZzxn+kGV/DjBSSLFvJJIbxpboOA9i3mKhddGE=;
	b=OEA6s/IAo2zZTjV74w6RiR6UFsi50eQ7pkCWP3NlT02FbqTSK5AA1weyhFjohrBnUNqbcc
	WXe8IB2leO7KBOXyBmbDqjawzfaP+W1LLrDD4LRBBrLBhGjegQ2ryvjLKo+iF21zpazlSh
	+HV93+YhP2DhcR7rqXUhlpkdcxDX5pI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-AY_t0tYIP46NTZzSch3EGA-1; Thu,
 03 Oct 2024 08:24:27 -0400
X-MC-Unique: AY_t0tYIP46NTZzSch3EGA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E03531954B06;
	Thu,  3 Oct 2024 12:24:25 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.39.193.247])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6EAB31956046;
	Thu,  3 Oct 2024 12:24:19 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH] tracing: doc: Fix typo in ftrace histogram
Date: Thu,  3 Oct 2024 14:23:35 +0200
Message-ID: <20241003122334.44682-2-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The Tracing > Histogram page contains a typo in the field display
modifiers table.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 Documentation/trace/histogram.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 3c9b263de9c2..0aada18c38c6 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -81,7 +81,7 @@ Documentation written by Tom Zanussi
 	.usecs         display a common_timestamp in microseconds
         .percent       display a number of percentage value
         .graph         display a bar-graph of a value
-	.stacktrace    display as a stacktrace (must by a long[] type)
+	.stacktrace    display as a stacktrace (must be a long[] type)
 	=============  =================================================
 
   Note that in general the semantics of a given field aren't

base-commit: e32cde8d2bd7d251a8f9b434143977ddf13dcec6
-- 
2.46.1

