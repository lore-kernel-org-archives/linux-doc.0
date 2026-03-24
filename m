Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEB7318EDF
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355569; cv=none; b=MznuADkiC3j3phgS2RFZ+evfG/JW2a5CyjyYCXNefGeFr/vTnNYTB76EV+4pkHW+mP4yi8bW0W8Xq5xeV7Gz5gItd4waNK2D0h+xYAPbD4Pc4hDkYFJhMtdlJ+gzMZiF+0z+X3jd2DUVfrcbdzMIDn3IrJopYfcu0HFm+RqZl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355569; c=relaxed/simple;
	bh=E7kOur0RV/dhFN7cE2LnWJMTEYPaOS+zX9niT2qtiYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UMbLR+0w83iIvm8sAa0IC5U9SzH5c93GLzP0NOBOikgVB13Mmt7OoaFd0juNkRwQK1ZhMG2t90EEaHRIBuZPm6yQFdNw4BtZz4YdznNM4+Qhzh5ErEGTNThnDSQct158cxnswqOWUO3NtFRN39JoIE6BTtLKuSIs8fPdHt3og3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dskjSBpR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dskjSBpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774355565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OLQGuwrg9psSZEpw6O22A6PbrU8o35FXA/OaaI62Xsk=;
	b=dskjSBpRhzzZM7U4ffj/cqL0/9YiyubkhShqhWrr2SeBBMoSJYdO12p8ho9I3Mi145TQAm
	LT395aiI2HDtUjSXNn9TCeaHVax63lCDZfoolXHsMU9q4JY4iHXBf6BGRZNWbBpPWid/qO
	+SZLQqNMxR6DuT6Bk2Riv1oW0t6+Gjc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-jUMwuxcuNtOg8WBTYtjydw-1; Tue,
 24 Mar 2026 08:32:41 -0400
X-MC-Unique: jUMwuxcuNtOg8WBTYtjydw-1
X-Mimecast-MFC-AGG-ID: jUMwuxcuNtOg8WBTYtjydw_1774355560
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 418DA18005BA;
	Tue, 24 Mar 2026 12:32:40 +0000 (UTC)
Received: from fedora.brq.redhat.com (unknown [10.43.17.109])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8FED2300019F;
	Tue, 24 Mar 2026 12:32:36 +0000 (UTC)
From: Tomas Glozar <tglozar@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Tomas Glozar <tglozar@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: John Kacur <jkacur@redhat.com>,
	Luis Goncalves <lgoncalv@redhat.com>,
	Crystal Wood <crwood@redhat.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Wander Lairson Costa <wander@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>,
	linux-doc <linux-doc@vger.kernel.org>,
	Attila Fazekas <afazekas@redhat.com>
Subject: [PATCH] Documentation/rtla: Document SIGINT behavior
Date: Tue, 24 Mar 2026 13:32:29 +0100
Message-ID: <20260324123229.152424-1-tglozar@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The behavior of RTLA on receiving SIGINT is currently undocumented.

Describe it in RTLA's common appendix that appears in man pages for all
RTLA tools to avoid confusion.

Suggested-by: Attila Fazekas <afazekas@redhat.com>
Signed-off-by: Tomas Glozar <tglozar@redhat.com>
---

Note: There was a bug in SIGINT behavior, fixed in upcoming commit [1].

[1] https://lore.kernel.org/linux-trace-kernel/20260310160725.144443-1-tglozar@redhat.com/

 Documentation/tools/rtla/common_appendix.txt | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/tools/rtla/common_appendix.txt b/Documentation/tools/rtla/common_appendix.txt
index 53cae7537537..8c90a02588e7 100644
--- a/Documentation/tools/rtla/common_appendix.txt
+++ b/Documentation/tools/rtla/common_appendix.txt
@@ -1,5 +1,26 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+SIGINT BEHAVIOR
+===============
+
+On the first SIGINT, RTLA exits after collecting all outstanding samples up to
+the point of receiving the signal.
+
+When receiving more than one SIGINT, RTLA discards any outstanding samples, and
+exits while displaying only samples that have already been processed.
+
+If SIGINT is received during RTLA cleanup, RTLA exits immediately via
+the default signal handler.
+
+Note: For the purpose of SIGINT behavior, the expiry of duration specified via
+the -d/--duration option is treated as equivalent to receiving a SIGINT. For
+example, a SIGINT received after duration expired but samples have not been
+processed yet will drop any outstanding samples.
+
+Also note that when using the timerlat tool in BPF mode, samples are processed
+in-kernel; RTLA only copies them out to display them to the user. A second
+SIGINT does not affect in-kernel sample aggregation.
+
 EXIT STATUS
 ===========
 
-- 
2.53.0

