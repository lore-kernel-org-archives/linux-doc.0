Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF2C243D58;
	Wed, 15 Jan 2025 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931279; cv=none; b=XBKxGxpghUQ1jcVT/uT63FkNRxyjbNnXl63u6XyLx9fLynqavWQocbJa6WCSYHTU3YwJ7EKeEAU/Hi3SbaRsM70JDeHUOvu1uUPDBGSvEbBVtfE40Nc4RhCPXjcZEc//ogtfDILf2SFbeOImPl60yMh1LyfnbAvmemf/YOD8MGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931279; c=relaxed/simple;
	bh=CnqsjWdCloHmdynRqHqaHP5dcik2kWncMZ7jpkxGTCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8/JODV4Qh1dUDm/eglALV5MqDLjjXhKoLJsqgJNPfP6E3t4W+EVgCoLB5kZin5XAgp5ml1kXS+/uHVttNm8VoPFlSRJ9rQPVCYnjWVVAMssHP2FBsB0HuBmGBN/ya0eLCnfasVzUN3EE2/4ilNUwWvTnw58Qqr9/WTEdya4b1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXtrB7Dt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXtrB7Dt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C05C4CEE3;
	Wed, 15 Jan 2025 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736931278;
	bh=CnqsjWdCloHmdynRqHqaHP5dcik2kWncMZ7jpkxGTCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXtrB7DtTlq24WrsZcqZlaqpaJcs2SQxAj0LlilCIVTTBcR1KbItHfYuVDRV+FrZL
	 p6IBe+hzh0Ef34rbqhdQkO+h42T3EI8jsUgymEIzUL9EYj6ROGQ1al/7d2N99xe1wO
	 mlLpFiwTy8aCPpyTMbGApaHihbYvSlUe7NMU9waBIXiSQETq34A49QCnd27zfNRxPI
	 FrVVdQoMd0YTY6NbciMmiA/tj6gSuZv6JXKP9KU104CysS4vyGfGaHhSfQxKmFWnE6
	 NUJ1m8JKGVyO8ASu6vFdWS79AUb7Y+G5L9Z5P8QJPXX9erHfzIslMo3ejYgVfn7pdg
	 JEqv71pLephxg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 15/18] docs: irq/concepts: Minor improvements
Date: Wed, 15 Jan 2025 09:54:04 +0100
Message-ID: <20250115085409.1629787-16-jirislaby@kernel.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250115085409.1629787-1-jirislaby@kernel.org>
References: <20250115085409.1629787-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just note in the docs:
1) A PCI as an example for shared interrupts,
2) a sparse tree can be used for interrupts too, and
3) two i8259s have 8 pins.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/core-api/irq/concepts.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/irq/concepts.rst b/Documentation/core-api/irq/concepts.rst
index f166006a81f6..7c4564f3cbdf 100644
--- a/Documentation/core-api/irq/concepts.rst
+++ b/Documentation/core-api/irq/concepts.rst
@@ -4,18 +4,20 @@ What is an IRQ?
 
 An IRQ is an interrupt request from a device. Currently, they can come
 in over a pin, or over a packet. Several devices may be connected to
-the same pin thus sharing an IRQ.
+the same pin thus sharing an IRQ. Such as on legacy PCI bus: All devices
+typically share 4 lanes/pins. Note that each device can request an
+interrupt on each of the lanes.
 
 An IRQ number is a kernel identifier used to talk about a hardware
 interrupt source. Typically, this is an index into the global irq_desc
-array, but except for what linux/interrupt.h implements, the details
-are architecture specific.
+array or sparse_irqs tree. But except for what linux/interrupt.h
+implements, the details are architecture specific.
 
 An IRQ number is an enumeration of the possible interrupt sources on a
 machine. Typically, what is enumerated is the number of input pins on
 all of the interrupt controllers in the system. In the case of ISA,
-what is enumerated are the 16 input pins on the two i8259 interrupt
-controllers.
+what is enumerated are the 8 input pins on each of the two i8259
+interrupt controllers.
 
 Architectures can assign additional meaning to the IRQ numbers, and
 are encouraged to in the case where there is any manual configuration
-- 
2.48.0

