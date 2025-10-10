Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588C262FD0
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760085281; cv=none; b=gCp4rQwOwLWwmIuQP4chFER1I0P27srenl9nH0e2Ph0wurnUoa8PKZ/T5+IqBByBndL70m4x6NtHYOYo5w23l9cBU2ZYbTqX8F9YPPuoN04MnUPCmmtF27FZ9/KyTW3Cuz72dn0ZNjoGMBILqGAjKnWLX6NDo0dMlQ+Tz/9SIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760085281; c=relaxed/simple;
	bh=lAM1OCRdCkIbXWLfPoZpdYZ+SIeHc968B6VtBUf7nJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BousAHYiJvt6DEZ+fihwyqlja2TPDmbmcfjhBWDBiYIv5higfEXbQ7FEL9YOHhyAk6j7ZPZwvJzkVvK8b1JZN8ZLP7OT4AWcpC/hudYqJ/JCmrQoMj5lSkB2OjvonjvFbtjDwMJiVn1tgvDFoxt3XYyMAZlkg2/vsaAKGAeA6os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EO5nK4yk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EO5nK4yk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760085279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/V9PCnlmfXMNU9IVcL16oTLGCKpj8jIKEGtxCINH5U=;
	b=EO5nK4yk++yG73vMo8llUpjk+W3Niha/g/PFA+fSqbJ9yM/YQfEZrPNn1XHAZRXrLncGgX
	bDJUGiw3gRaTsvGxzebTg/wmzYOjFFCxqgxMos/xPiitUZl+xYuoQ+APIm/+jEifIOsq06
	Y8sFMnq4sFxN84ZJMzuy/Fqb7LPy/ZI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-jNBY_WpNPVWnwk9Wmrqs1Q-1; Fri,
 10 Oct 2025 04:34:38 -0400
X-MC-Unique: jNBY_WpNPVWnwk9Wmrqs1Q-1
X-Mimecast-MFC-AGG-ID: jNBY_WpNPVWnwk9Wmrqs1Q_1760085277
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF61019560AE;
	Fri, 10 Oct 2025 08:34:36 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.197])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C41919560BB;
	Fri, 10 Oct 2025 08:34:31 +0000 (UTC)
From: Tomas Glozar <tglozar@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	John Kacur <jkacur@redhat.com>,
	Luis Goncalves <lgoncalv@redhat.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Crystal Wood <crwood@redhat.com>,
	Attila Fazekas <afazekas@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>
Subject: [PATCH 5/9] Documentation/rtla: Correct tracer name for common options
Date: Fri, 10 Oct 2025 10:33:34 +0200
Message-ID: <20251010083338.478961-6-tglozar@redhat.com>
In-Reply-To: <20251010083338.478961-1-tglozar@redhat.com>
References: <20251010083338.478961-1-tglozar@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Several options in common_options.rst say "osnoise tracer" for both
osnoise and timerlat.

Use |tool| variable so that the correct tool name is used.

Fixes: b1be48307de4 ("rtla: Add rtla osnoise top documentation")
Signed-off-by: Tomas Glozar <tglozar@redhat.com>
---
 Documentation/tools/rtla/common_options.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/tools/rtla/common_options.txt b/Documentation/tools/rtla/common_options.txt
index 8ca424ab0faf..a2f9c03810b9 100644
--- a/Documentation/tools/rtla/common_options.txt
+++ b/Documentation/tools/rtla/common_options.txt
@@ -1,6 +1,6 @@
 **-c**, **--cpus** *cpu-list*
 
-        Set the osnoise tracer to run the sample threads in the cpu-list.
+        Set the |tool| tracer to run the sample threads in the cpu-list.
 
 **-H**, **--house-keeping** *cpu-list*
 
@@ -35,7 +35,7 @@
 
 **-P**, **--priority** *o:prio|r:prio|f:prio|d:runtime:period*
 
-        Set scheduling parameters to the osnoise tracer threads, the format to set the priority are:
+        Set scheduling parameters to the |tool| tracer threads, the format to set the priority are:
 
         - *o:prio* - use SCHED_OTHER with *prio*;
         - *r:prio* - use SCHED_RR with *prio*;
-- 
2.51.0

