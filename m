Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B34243D75;
	Wed, 15 Jan 2025 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931281; cv=none; b=nFGYz3iZNMJqXOC8NHTCFUwG+49pf3xinw6vkk2yNxNPsMy3p3buUWXjx5Nqd6Gm+DR8ZSW/wtJmUR+Vbc5Wgdb70m5UgPAWYRIBNY4T5ZGgPR4oDdMKnBqjc9xQy9wAI4qJeuxiizKjngHyY+afzvAQhHIDkqiCs1ATmJSihAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931281; c=relaxed/simple;
	bh=o9n6U+QQBfXcdNMjUPSE+hEgc0RdrwU2e6dMP2zsPAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9L8bB5CIyzfEXO2pjkZ2e9g90SvTCFWumZVeyiTRUiihw/Cfbvi5T+90S5BplbcFZbEP55x1vCukGpwAiM7cK369qHD30nvaqV9y8RsDJ4DsST6HIbwEkGXRpHujAWjGqFYnZRkQuq9O7Qd7d5f3ZQR8dcgMB9ekVAkRkGLop8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcSGfqoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcSGfqoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1FDC4CEE2;
	Wed, 15 Jan 2025 08:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736931280;
	bh=o9n6U+QQBfXcdNMjUPSE+hEgc0RdrwU2e6dMP2zsPAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qcSGfqocLLAwMv9wTBGo9ezT54U6mYXVqSXPE3KZV3trodXazz0ynzTIwziqox11P
	 cHnKoW0Z/qeLr+lkuFctauAodgcZfY1oSZj1Cv8g/jEwQb9N+wxEAXLvmLpmQWIaat
	 M7E6Hz0HLtYni8dQ5Mem8x5C14FVJGIxtkuzSGmMEeHtjjCEMsauF9Q06s5u8Lm4lh
	 ztr9o95YcRHqU89RyJ/7FhTAfBpBjiM1lu1e4kojfCdNRv8BE2FNifwTjmtkii7Utx
	 v14YESif2umrgEzzEn0r5LS/fyLLkvr8YsdQj/zxe6izYksFFFa4ksue4u5N5e1q+7
	 yHvWLBpdtIK8Q==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 16/18] docs: irq-domain.rst: Simple improvements
Date: Wed, 15 Jan 2025 09:54:05 +0100
Message-ID: <20250115085409.1629787-17-jirislaby@kernel.org>
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

The improvements include:
* Capitals in headlines.
* Added commas: for easier reading, it is always desired to add commas
  at some places in text. Like before adverbs or after fronted
  sentences.
* 3rd person -> add 's' to verbs.
* End some sentences with period and start a new one. Avoid thus heavy
  sentences.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/core-api/irq/irq-domain.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/core-api/irq/irq-domain.rst b/Documentation/core-api/irq/irq-domain.rst
index 88805b9e78ad..0ad0edecd4a5 100644
--- a/Documentation/core-api/irq/irq-domain.rst
+++ b/Documentation/core-api/irq/irq-domain.rst
@@ -1,19 +1,19 @@
 ===============================================
-The irq_domain interrupt number mapping library
+The irq_domain Interrupt Number Mapping Library
 ===============================================
 
 The current design of the Linux kernel uses a single large number
 space where each separate IRQ source is assigned a different number.
 This is simple when there is only one interrupt controller, but in
-systems with multiple interrupt controllers the kernel must ensure
+systems with multiple interrupt controllers, the kernel must ensure
 that each one gets assigned non-overlapping allocations of Linux
 IRQ numbers.
 
 The number of interrupt controllers registered as unique irqchips
-show a rising tendency: for example subdrivers of different kinds
+shows a rising tendency. For example, subdrivers of different kinds
 such as GPIO controllers avoid reimplementing identical callback
 mechanisms as the IRQ core system by modelling their interrupt
-handlers as irqchips, i.e. in effect cascading interrupt controllers.
+handlers as irqchips. I.e. in effect cascading interrupt controllers.
 
 Here the interrupt number loose all kind of correspondence to
 hardware interrupt numbers: whereas in the past, IRQ numbers could
@@ -21,15 +21,15 @@ be chosen so they matched the hardware IRQ line into the root
 interrupt controller (i.e. the component actually fireing the
 interrupt line to the CPU) nowadays this number is just a number.
 
-For this reason we need a mechanism to separate controller-local
-interrupt numbers, called hardware irq's, from Linux IRQ numbers.
+For this reason, we need a mechanism to separate controller-local
+interrupt numbers, called hardware IRQs, from Linux IRQ numbers.
 
 The irq_alloc_desc*() and irq_free_desc*() APIs provide allocation of
 irq numbers, but they don't provide any support for reverse mapping of
 the controller-local IRQ (hwirq) number into the Linux IRQ number
 space.
 
-The irq_domain library adds mapping between hwirq and IRQ numbers on
+The irq_domain library adds a mapping between hwirq and IRQ numbers on
 top of the irq_alloc_desc*() API.  An irq_domain to manage mapping is
 preferred over interrupt controller drivers open coding their own
 reverse mapping scheme.
@@ -38,7 +38,7 @@ irq_domain also implements translation from an abstract irq_fwspec
 structure to hwirq numbers (Device Tree and ACPI GSI so far), and can
 be easily extended to support other IRQ topology data sources.
 
-irq_domain usage
+irq_domain Usage
 ================
 
 An interrupt controller driver creates and registers an irq_domain by
@@ -78,7 +78,7 @@ If the driver has the Linux IRQ number or the irq_data pointer, and
 needs to know the associated hwirq number (such as in the irq_chip
 callbacks) then it can be directly obtained from irq_data->hwirq.
 
-Types of irq_domain mappings
+Types of irq_domain Mappings
 ============================
 
 There are several mechanisms available for reverse mapping from hwirq
@@ -110,7 +110,7 @@ the former accepts an Open Firmware specific 'struct device_node',
 while the latter accepts a more general abstraction 'struct
 fwnode_handle'.
 
-The majority of drivers should use the linear map.
+The majority of drivers should use the Linear map.
 
 Tree
 ----
@@ -216,7 +216,7 @@ the first argument is different - the former accepts an Open Firmware
 specific 'struct device_node', while the latter accepts a more general
 abstraction 'struct fwnode_handle'.
 
-Hierarchy IRQ domain
+Hierarchy IRQ Domain
 --------------------
 
 On some architectures, there may be multiple interrupt controllers
-- 
2.48.0

