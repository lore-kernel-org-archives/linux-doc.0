Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2370523FE1F;
	Wed, 15 Jan 2025 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931277; cv=none; b=hibIJWnxsQPAxeCpV9qnbPdMiOFgkSsR96LBPeLBAr3Ph0y3L783FoqqqRPjQMEgxalGbZX353mi5tHZqg0AtiCgfrFMzAS27WEeKxVi9ogJdAAdiRUOrUMw1ph5+P1IwrX6CkKRyQDl4mFLkRRzLaBYbKM0yJAYdjPuvWJPjn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931277; c=relaxed/simple;
	bh=USYmo/CQ3Ul2dIOUWgMm1xQTjBoLGIKVBYccLjpw4Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeYIqoxE3tEDILsbSl6SzhcjUlbMDd42kCT9LYSccfthXlyxFFtDSODeq9BxJ6qlSKMlDeeXLSCpKuf5/0GblVN06eOm6J7MctYTsrKkaYm/5SYs8A2snPp+DqXWWNFtJulxDCfuXr8jUxzM1H94fVaXzfMI0nkqj2Zqx3wHkMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khU/tvqZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khU/tvqZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183F4C4CEE2;
	Wed, 15 Jan 2025 08:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736931276;
	bh=USYmo/CQ3Ul2dIOUWgMm1xQTjBoLGIKVBYccLjpw4Dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=khU/tvqZxgrXAgNWldqU0e3fGsgkz5X6FpTTJ5EySHx5EwMc/MVCAyn75QOSEvH93
	 dDaQ2T22Kod9BV/DPCDH8qbia+mOPjAef/Ux3qCuQzgFBNQp9J3FG+txOp4RxmiDIu
	 TBMx6hrWCx/VmFYhIKUpn4iJzGyhuEZftc8KkDHv1dpas085DDycRMHYVN57TSl5/W
	 LlTsU22UM5cSTWZJrIYeDAGF2LTKvrwSQaxj9jhvKqznDWiSElzS9GyNEwQBXoKhET
	 q+GgsbIJt1D0+730rprYN0SHi6aCMSJoo7fRjOKQ2c9KLQtP1vUvTTgiwEyXw06o8i
	 H8zNBjhIHvKqA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 14/18] docs: irq/concepts: Add commas and reflow
Date: Wed, 15 Jan 2025 09:54:03 +0100
Message-ID: <20250115085409.1629787-15-jirislaby@kernel.org>
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

For easier reading, it is always desired to add commas at some places in
text. Like before adverbs or after fronted sentences.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/core-api/irq/concepts.rst | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/irq/concepts.rst b/Documentation/core-api/irq/concepts.rst
index 4273806a606b..f166006a81f6 100644
--- a/Documentation/core-api/irq/concepts.rst
+++ b/Documentation/core-api/irq/concepts.rst
@@ -2,23 +2,22 @@
 What is an IRQ?
 ===============
 
-An IRQ is an interrupt request from a device.
-Currently they can come in over a pin, or over a packet.
-Several devices may be connected to the same pin thus
-sharing an IRQ.
+An IRQ is an interrupt request from a device. Currently, they can come
+in over a pin, or over a packet. Several devices may be connected to
+the same pin thus sharing an IRQ.
 
 An IRQ number is a kernel identifier used to talk about a hardware
-interrupt source.  Typically this is an index into the global irq_desc
-array, but except for what linux/interrupt.h implements the details
+interrupt source. Typically, this is an index into the global irq_desc
+array, but except for what linux/interrupt.h implements, the details
 are architecture specific.
 
 An IRQ number is an enumeration of the possible interrupt sources on a
-machine.  Typically what is enumerated is the number of input pins on
-all of the interrupt controller in the system.  In the case of ISA
+machine. Typically, what is enumerated is the number of input pins on
+all of the interrupt controllers in the system. In the case of ISA,
 what is enumerated are the 16 input pins on the two i8259 interrupt
 controllers.
 
 Architectures can assign additional meaning to the IRQ numbers, and
-are encouraged to in the case  where there is any manual configuration
-of the hardware involved.  The ISA IRQs are a classic example of
+are encouraged to in the case where there is any manual configuration
+of the hardware involved. The ISA IRQs are a classic example of
 assigning this kind of additional meaning.
-- 
2.48.0

