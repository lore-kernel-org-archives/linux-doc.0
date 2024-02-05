Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE892C85D
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707147677; cv=pass; b=qBlpPco+68LKZPvcZ5BF9YwRUWZcVvt7oVcPCi6VxhPeCv4wPiKBX9A/q1D1OYSNi+D31cr6BqdHPq3V85QstSjWgUj4rYb5kWfMu0Ko6r78ENj6sbcZ00k1MgDa4SH/eK6Q5hwu+YlIjIa0gKN+oi/xHo9EYcPufeiM4OG+6kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707147677; c=relaxed/simple;
	bh=J5iNGP3KS9seIB5x3HAu9hwsVIG3/Uq6tr+Nk0Cm4cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u9MyH44J/ciA/ivus4U/ULMS26jg4iJL06bFnP8o78xso2F9uLMSgFX8L+KfcLDIUda/1yUXyAANuuSapWzoK4L19i3gY4z+EyNl2CRIV7T/C7iHrbL0UZlHpDpo6A9hJRAOcMHi1/bciWH1tW6lsNnhX67FcekEUQFEI51NPyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christoph.anton.mitterer.name; spf=pass smtp.mailfrom=scientia.org; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christoph.anton.mitterer.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CCFD8C36AF;
	Mon,  5 Feb 2024 15:41:07 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id E6525C360E;
	Mon,  5 Feb 2024 15:41:06 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1707147667; a=rsa-sha256;
	cv=none;
	b=YgJQcaFdKbNr8UvbSbGD8w1FaeG0Eidg1QU3SV2G69ffSv00etIB8WUVs+2PDCzbUuMgIo
	PF3+oix2UPn5w6DbVJTRWR6J6En3r93hl+ZtMKh7ZYDEh5QPIrZnyETk4n12eEuF85V/hT
	kCubFyJl5UXq43LcfqQrQH1TR//5bhzCI+ikgssvM7ZfsILKP5Aok4d2y+4L9O4IRlSpFn
	2c/8UGXlSdr3Le8NMFN+Hd0t1wLBK7c48qBhmRPo/nXaXJaYRzYqEMPttdoZ1MAwH7CdX2
	/vTO84u7wGtUNVxQFzW7Q7/s2r4qkR/AnBt67XUMxRSMf2L00l9OjgfMwttE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1707147667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZOZnr7RbatMpEJ0rX6OCZvoZ62JMg0YQ58vkNCaLh9M=;
	b=Filjz1JLnN1JfM3qkpXcHMxlQZHeWeiie8il+lJH8hcinwgaCoSRzXRyVNTt0EUgK4+Hnq
	lvwRK+HFwfreLXdSr6exQTRU5GN+nXqoUvfnFHoed8GvDwLpYda5Tl7LWIH0yvIgUsIxlU
	sxlP2mmau0PE8epjfq4biCJfEaZF6KIRIPVnkZLQBaw4gsHconHsSrobn3yAJheMR5lANE
	3bvtHQ0a3nZR59PIlGLXMEMM6wTVKvWJukXC+Sfga+aGJTQ71hRR2WzB6584C7+8d8Qwp6
	qoIrwk+AkAeNYXTFQhezT1DEaN8Zi9N8V/uGItKSch6Oj5Rqkt3Bbdko7M72qA==
ARC-Authentication-Results: i=1;
	rspamd-55b4bfd7cb-lrbxf;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Duck-Gusty: 6b938fea46174ea3_1707147667658_1497600776
X-MC-Loop-Signature: 1707147667658:1441814696
X-MC-Ingress-Time: 1707147667657
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.127.213.229 (trex/6.9.2);
	Mon, 05 Feb 2024 15:41:07 +0000
Received: from p5b0ed8de.dip0.t-ipconnect.de ([91.14.216.222]:58668 helo=heisenberg.scientia.org)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <calestyo@scientia.org>)
	id 1rX15h-0002bI-1u;
	Mon, 05 Feb 2024 15:41:05 +0000
Received: by heisenberg.scientia.org (Postfix, from userid 1000)
	id 37AD31974DAE; Mon,  5 Feb 2024 16:41:00 +0100 (CET)
From: Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH] docs: proc.rst: comm: mention the included NUL
Date: Mon,  5 Feb 2024 16:41:00 +0100
Message-ID: <20240205154100.736499-1-mail@christoph.anton.mitterer.name>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: calestyo@scientia.org

Indicate that the actual value will be one character less.

Signed-off-by: Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
---
 Documentation/filesystems/proc.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 104c6d047d9b..41b9be923519 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1899,8 +1899,8 @@ For more information on mount propagation see:
 These files provide a method to access a task's comm value. It also allows for
 a task to set its own or one of its thread siblings comm value. The comm value
 is limited in size compared to the cmdline value, so writing anything longer
-then the kernel's TASK_COMM_LEN (currently 16 chars) will result in a truncated
-comm value.
+then the kernel's TASK_COMM_LEN (currently 16 chars, including the null
+terminator) will result in a truncated comm value.
 
 
 3.7	/proc/<pid>/task/<tid>/children - Information about task children
-- 
2.43.0

