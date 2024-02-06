Received: from caracal.birch.relay.mailchannels.net (caracal.birch.relay.mailchannels.net [23.83.209.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4802556B62
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 02:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707187251; cv=pass; b=iDSSlCMdsKcUaD8YrCcApml8IFwC9xapcnqLk8ToKPrgpjZtS6AMsqQxT2rpXWg4vb6Qx4/QkmckGPEqtWUi1Afb23eCezzdG/E3y2gP8fk5ZSQX0Yvlg+9asn6vJxrHi+gB7m2oYMUv2f2lbY0f1SR5r2JKFJtaOgg7syZsnrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707187251; c=relaxed/simple;
	bh=C10eD0yh0NVamtjjCn25+mSAZ8dGnX6YqruvH4kH884=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLx1nStKRKFAtBwQJcLHs1yMCKFG3O9/KALa7xS53uBoqM2VH8csUXKGDbRvSBb48kjcxpkkPfBZ95gWOC/01rEkKufp+OfpUsOdluzLTO5OIXWDL84eTDCDsz36Zr6RecitDWrZPjawMnmYq5jmvjU89Ek4JUTnjZtYZnWRKCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christoph.anton.mitterer.name; spf=pass smtp.mailfrom=scientia.org; arc=pass smtp.client-ip=23.83.209.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=christoph.anton.mitterer.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 193FA762707;
	Tue,  6 Feb 2024 02:22:47 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (unknown [127.0.0.6])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3875176220C;
	Tue,  6 Feb 2024 02:22:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1707186166; a=rsa-sha256;
	cv=none;
	b=vbskoDaXVt4kRraml3i7Iw6SD/WRFccRdOsxD/w7oN13z81Zd938oBELzeWePb0YsD1MEk
	a1nJtE1O0nmekNJb0CAMvMpH8Aco06veNO0jqCi9LjlQUQd6HyuuRM67d9UEKQNqwiwLVA
	mocRgo86Vu7qEFVOoxNUGtSXevwI6sjQFM9yZV6puvIbpBtgIzgHcB7kUSsBFJ62m9UZl5
	8t2nczUoP5pN9i5G6zmvQJ9KO13HrmUOuBdiBYGe5tEWi4IHW0OAOO5IPBterE0WGbZIHQ
	4ne7YLXYEH/DRzD/1SyBzGe8G9BG7pQe8ctBWhj/m0zSWvB6PcDkmPp7Z6ioTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1707186166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4x+niP4NYgRkjrwqXIyqyCqxUAwI1L9WNXm8ktAOyz4=;
	b=3fSKHBzJIg4LM2lJz7DN+dfc5JFvY9GRuAO3UJMdOlUqQwBt0cifdBinMOIQBy1bGkt04M
	36Yr+U/KmG/WxhSrbV61lVvnK1U/k6zHonJ2ATeaZj9MfHc2C/6TFlrMyfEHzNNL/Qyeud
	Q2Oe5lOF4GqeowQufOqP6jdFNkUKCi/zGLFrUfVD0R5BrU33lAte7TRb4gxVQBW7T6kvb9
	RaZ1tct+2PCBnhlxyYFyeFougKYRAxxU6qDK0Ce2fo9YS4WaE6QjtQK/slMA2IpjiUezfe
	IId9MCgEbOi1plMHh7Cnjs8siV/0d9tWEWQHN2VF7zR/JZdDuOFqJ9F7OB0YRQ==
ARC-Authentication-Results: i=1;
	rspamd-55b4bfd7cb-px7f8;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Reign-Unite: 659f30966f3560be_1707186166991_312998674
X-MC-Loop-Signature: 1707186166991:1967870744
X-MC-Ingress-Time: 1707186166991
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
	by 100.109.231.231 (trex/6.9.2);
	Tue, 06 Feb 2024 02:22:46 +0000
Received: from p5b0ed8de.dip0.t-ipconnect.de ([91.14.216.222]:41116 helo=heisenberg.scientia.org)
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <calestyo@scientia.org>)
	id 1rXB6f-0002XS-2Z;
	Tue, 06 Feb 2024 02:22:44 +0000
Received: by heisenberg.scientia.org (Postfix, from userid 1000)
	id 7A08A197B775; Tue,  6 Feb 2024 03:22:39 +0100 (CET)
From: Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH v2 1/1] docs: proc.rst: comm: mention the included NUL
Date: Tue,  6 Feb 2024 03:22:18 +0100
Message-ID: <20240206022237.794761-2-mail@christoph.anton.mitterer.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206022237.794761-1-mail@christoph.anton.mitterer.name>
References: <20240205154100.736499-1-mail@christoph.anton.mitterer.name>
 <20240206022237.794761-1-mail@christoph.anton.mitterer.name>
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
 Documentation/filesystems/proc.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 104c6d047d9b..c0e92a056079 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1899,8 +1899,9 @@ For more information on mount propagation see:
 These files provide a method to access a task's comm value. It also allows for
 a task to set its own or one of its thread siblings comm value. The comm value
 is limited in size compared to the cmdline value, so writing anything longer
-then the kernel's TASK_COMM_LEN (currently 16 chars) will result in a truncated
-comm value.
+then the kernel's TASK_COMM_LEN (currently 16 chars, including the null
+terminator, which is printed as the line feed character in the file) will result
+in a truncated comm value.
 
 
 3.7	/proc/<pid>/task/<tid>/children - Information about task children
-- 
2.43.0

