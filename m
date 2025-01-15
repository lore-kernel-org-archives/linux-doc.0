Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A1E240806;
	Wed, 15 Jan 2025 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931285; cv=none; b=WNHV2ayPzfKzW+BlMHAf5IoLhg6a/LuUHeP/m8lHdF8vBQTpqTFu6fJKcvXw/GCJUVr8VV1O1RapZOBwFs0Giefoulj9WmptVDfhOdRj+Szqbr+48On6wH8/DZii3E8Fx62YciFxSfcgeZ3ska9eDIwT3NXO0LWM3d28drjG3TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931285; c=relaxed/simple;
	bh=9hRGq7q5mnsadgjtq534x6y3y50vCNPHRTENw2UaSfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pvtD7vTKkGQNNHNfJYq6KbQ/eHcp+H7eRAzGdHmtCDxNLQX1QgXUxJFjETliUJMZjvBx39fsng1Lg3PbfwEVn5N7qh6PlhNSKXI2eJNxwqOgEimJDLCh+syLReRKpxP9nP6W8RA+QrqcQqH51mq/wMnopVza5diNFTjcxzCYE1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3AZjPL6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3AZjPL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801ACC4CEE5;
	Wed, 15 Jan 2025 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736931285;
	bh=9hRGq7q5mnsadgjtq534x6y3y50vCNPHRTENw2UaSfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J3AZjPL6zCfIOFtVbTREoXp5PG9racxY1SPw8QgtLmWQjZF+yv2W2S6NF0nMFZdnQ
	 8lpPQjqZNUSB02W8nBmooEteChfCzBYSyfg+c6h8RNvx8ObCOyoDjdNP2lTahcYGjO
	 ZESAuxeW4gCPkxg/UgESG8O6DcK4FlQvNuBDSWLyoM33zH2mWn0KAnHGPTv4ziXLRK
	 efiflQrkPF980MLIUkqptBdnKquBFmPiiYiaEaDD4d7BjTs8xiAVNzFHi23iDiAJnw
	 V2/QdIIIeMB2Q3Wi4ukXzRY9Xq0j/44+Gte2XU3N0PtheUQRJUV8QFDRIdIvzdv8dn
	 vnKOd1pb0Dk6A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 18/18] irqdomain.c: Fix kernel-doc and add it to Documentation
Date: Wed, 15 Jan 2025 09:54:07 +0100
Message-ID: <20250115085409.1629787-19-jirislaby@kernel.org>
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

irqdomain.c's kernel-doc exists in that file, but is not plugged into
Documentation/ yet.

Before plugging it in, fix it first: irq_domain_get_irq_data() and
irq_domain_set_info() were documented twice. Identically, by both
definitions for CONFIG_IRQ_DOMAIN_HIERARCHY and
!CONFIG_IRQ_DOMAIN_HIERARCHY. Therefore, switch the second kernel-doc
into an ordinary comment -- change "/**" to simple "/*". This avoids
sphinx's:
  WARNING: Duplicate C declaration

Next, in commit b7b377332b96 ("irqdomain: Fix the kernel-doc and plug it
into Documentation"), I added irqdomain.h's (header) kernel-doc into
core-api/genericirq.rst. But given the amount of irqdomain functions and
structures, move all these to core-api/irq/irq-domain.rst now.

Finally, add these newly fixed irqdomain.c's (source) docs there as
well.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/core-api/genericirq.rst     |  2 --
 Documentation/core-api/irq/irq-domain.rst | 20 ++++++++++++++++++++
 kernel/irq/irqdomain.c                    |  4 ++--
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/core-api/genericirq.rst b/Documentation/core-api/genericirq.rst
index 25f94dfd66fa..582bde9bf5a9 100644
--- a/Documentation/core-api/genericirq.rst
+++ b/Documentation/core-api/genericirq.rst
@@ -410,8 +410,6 @@ which are used in the generic IRQ layer.
 .. kernel-doc:: include/linux/interrupt.h
    :internal:
 
-.. kernel-doc:: include/linux/irqdomain.h
-
 Public Functions Provided
 =========================
 
diff --git a/Documentation/core-api/irq/irq-domain.rst b/Documentation/core-api/irq/irq-domain.rst
index e7c0360c257d..82b8eb9442fc 100644
--- a/Documentation/core-api/irq/irq-domain.rst
+++ b/Documentation/core-api/irq/irq-domain.rst
@@ -324,3 +324,23 @@ Debugging
 
 Most of the internals of the IRQ subsystem are exposed in debugfs by
 turning CONFIG_GENERIC_IRQ_DEBUGFS on.
+
+Structures and Public Functions Provided
+========================================
+
+This chapter contains the autogenerated documentation of the structures
+and exported kernel API functions which are used for IRQ domains.
+
+.. kernel-doc:: include/linux/irqdomain.h
+
+.. kernel-doc:: kernel/irq/irqdomain.c
+   :export:
+
+Internal Functions Provided
+===========================
+
+This chapter contains the autogenerated documentation of the internal
+functions.
+
+.. kernel-doc:: kernel/irq/irqdomain.c
+   :internal:
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ddacf9487d08..869c25ac3170 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1941,7 +1941,7 @@ static void irq_domain_check_hierarchy(struct irq_domain *domain)
 		domain->flags |= IRQ_DOMAIN_FLAG_HIERARCHY;
 }
 #else	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
-/**
+/*
  * irq_domain_get_irq_data - Get irq_data associated with @virq and @domain
  * @domain:	domain to match
  * @virq:	IRQ number to get irq_data
@@ -1955,7 +1955,7 @@ struct irq_data *irq_domain_get_irq_data(struct irq_domain *domain,
 }
 EXPORT_SYMBOL_GPL(irq_domain_get_irq_data);
 
-/**
+/*
  * irq_domain_set_info - Set the complete data for a @virq in @domain
  * @domain:		Interrupt domain to match
  * @virq:		IRQ number
-- 
2.48.0

