Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3C423FDF1;
	Wed, 15 Jan 2025 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931274; cv=none; b=KzGoJ4o5hVW6QTDHwLLwKFoSZ1543t9Ehz/G+XnMj/D+lvNHs/P36exiQuD7RkyWtX6Id6MtpcyTf8F6O+yDXt7dKPGp6jYJDCKAz+XPnJTdbmvE3mSiN9EA1ii9kJhw+FP2Uy10ACJe5noBz29yb1yJLxMopRlxry6HP47bUC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931274; c=relaxed/simple;
	bh=7l4QMF5pjyh8ftXJob6+FTBNUBYXkdDlxcADH1FBcMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGSIr2emYf7K2smYMAyu4/igJsN4QX+AB2I3E/Bme0I1w5U9gBlTqpNBAEfud8oVoKVJS768PAIHab6JqBW99Rv5aonuI/kGiq7DwpkSr0PdzICqRB5TNy9ZeBINBSLkpHutsV5Xuz4Ll/sXRLhHIy8wJlMqvseIk+e8w/2IAcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5SpcX8s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5SpcX8s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FD8C4CEE4;
	Wed, 15 Jan 2025 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736931274;
	bh=7l4QMF5pjyh8ftXJob6+FTBNUBYXkdDlxcADH1FBcMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q5SpcX8sp29jBx05iFnAlpjv28l2SFTFaLonmTrlM6hFe2BigfkFlbCE+GKKQ/hIa
	 6oAfcX04p59SVF20UIV2PzgAcxJ/wrIFG7M9XSTnaxOVZfOJrUgxx5pypddDEp13kX
	 sCNrU0o2FIFRwzPmXzz0qDa88iZF8CqxUyjHE49XxJZWTIDbSN1tbT8cPORqSRj06m
	 LjgGTpcwrF9lfgjGyx4BtaRqGZqzI9NGvj3TwrTWVNoaLVUdNbxLHETOilONTZY/9m
	 42a6xkpbOhGuF8NqUJa2U/3e9U3i9rxp5pQKNPHVlWDMQo3gYf/S1KpH3PANVn9u8C
	 D+gdNpxGtACFw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 13/18] irqdomain.h: Improve kernel-docs of functions
Date: Wed, 15 Jan 2025 09:54:02 +0100
Message-ID: <20250115085409.1629787-14-jirislaby@kernel.org>
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

Many of irqdomain.h's functions are referenced in Documentation/ but are
not properly documented. Therefore, document these.

And use "Returns:" tag consistently, so that it is properly generated to
the resulting docs.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 include/linux/irqdomain.h | 62 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index ca4628fa269d..6de8a9f3fecf 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -417,6 +417,26 @@ static inline struct irq_domain *irq_find_host(struct device_node *node)
 	return d;
 }
 
+/**
+ * irq_domain_add_simple_of_node() - Register an irq_domain and optionally map a range of irqs
+ * @of_node: pointer to interrupt controller's device tree node.
+ * @size: total number of irqs in mapping
+ * @first_irq: first number of irq block assigned to the domain,
+ *	pass zero to assign irqs on-the-fly. If first_irq is non-zero, then
+ *	pre-map all of the irqs in the domain to virqs starting at first_irq.
+ * @ops: domain callbacks
+ * @host_data: Controller private data pointer
+ *
+ * Allocates an irq_domain, and optionally if @first_irq is positive then also
+ * allocate irq_descs and map all of the hwirqs to virqs starting at @first_irq.
+ *
+ * This is intended to implement the expected behaviour for most
+ * interrupt controllers. If device tree is used, then @first_irq will be 0 and
+ * irqs get mapped dynamically on the fly. However, if the controller requires
+ * static virq assignments (non-DT boot) then it will set that up correctly.
+ *
+ * Returns: Newly created irq_domain
+ */
 static inline struct irq_domain *irq_domain_add_simple_of_node(struct device_node *of_node,
 						       unsigned int size,
 						       unsigned int first_irq,
@@ -486,6 +506,15 @@ static inline struct irq_domain *irq_domain_add_tree_of_node(struct device_node
 	return IS_ERR(d) ? NULL : d;
 }
 
+/**
+ * irq_domain_add_linear_fwnode() - Allocate and register a linear revmap irq_domain.
+ * @fwnode: pointer to interrupt controller's FW node.
+ * @size: Number of interrupts in the domain.
+ * @ops: map/unmap domain callbacks
+ * @host_data: Controller private data pointer
+ *
+ * Returns: Newly created irq_domain
+ */
 static inline struct irq_domain *irq_domain_add_linear_fwnode(struct fwnode_handle *fwnode,
 					 unsigned int size,
 					 const struct irq_domain_ops *ops,
@@ -532,6 +561,18 @@ unsigned int irq_create_mapping_affinity(struct irq_domain *domain,
 unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec);
 void irq_dispose_mapping(unsigned int virq);
 
+/**
+ * irq_create_mapping() - Map a hardware interrupt into linux irq space
+ * @domain: domain owning this hardware interrupt or NULL for default domain
+ * @hwirq: hardware irq number in that domain space
+ *
+ * Only one mapping per hardware interrupt is permitted.
+ *
+ * If the sense/trigger is to be specified, set_irq_type() should be called
+ * on the number returned from that call.
+ *
+ * Returns: Linux irq number or 0 on error
+ */
 static inline unsigned int irq_create_mapping(struct irq_domain *domain,
 					      irq_hw_number_t hwirq)
 {
@@ -542,6 +583,13 @@ struct irq_desc *__irq_resolve_mapping(struct irq_domain *domain,
 				       irq_hw_number_t hwirq,
 				       unsigned int *irq);
 
+/**
+ * irq_resolve_mapping() - Find a linux irq from a hw irq number.
+ * @domain: domain owning this hardware interrupt
+ * @hwirq: hardware irq number in that domain space
+ *
+ * Returns: Interrupt descriptor
+ */
 static inline struct irq_desc *irq_resolve_mapping(struct irq_domain *domain,
 						   irq_hw_number_t hwirq)
 {
@@ -552,6 +600,8 @@ static inline struct irq_desc *irq_resolve_mapping(struct irq_domain *domain,
  * irq_find_mapping() - Find a linux irq from a hw irq number.
  * @domain: domain owning this hardware interrupt
  * @hwirq: hardware irq number in that domain space
+ *
+ * Returns: Linux irq number or 0 if not found
  */
 static inline unsigned int irq_find_mapping(struct irq_domain *domain,
 					    irq_hw_number_t hwirq)
@@ -614,7 +664,8 @@ void irq_domain_reset_irq_data(struct irq_data *irq_data);
  *
  * If successful the parent is associated to the new domain and the
  * domain flags are set.
- * Returns pointer to IRQ domain, or NULL on failure.
+ *
+ * Returns: A pointer to IRQ domain, or %NULL on failure.
  */
 static inline struct irq_domain *irq_domain_add_hierarchy_fwnode(struct irq_domain *parent,
 					    unsigned int flags,
@@ -657,6 +708,15 @@ void irq_domain_free_irqs(unsigned int virq, unsigned int nr_irqs);
 int irq_domain_activate_irq(struct irq_data *irq_data, bool early);
 void irq_domain_deactivate_irq(struct irq_data *irq_data);
 
+/**
+ * irq_domain_alloc_irqs - Allocate IRQs from domain
+ * @domain:	domain to allocate from
+ * @nr_irqs:	number of IRQs to allocate
+ * @node:	NUMA node id for memory allocation
+ * @arg:	domain specific argument
+ *
+ * See __irq_domain_alloc_irqs()' documentation.
+ */
 static inline int irq_domain_alloc_irqs(struct irq_domain *domain,
 			unsigned int nr_irqs, int node, void *arg)
 {
-- 
2.48.0

