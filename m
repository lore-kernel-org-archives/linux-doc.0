Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C912407EF;
	Wed, 15 Jan 2025 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931283; cv=none; b=aN9UgLlDhTWFj9yELBXI59upH6ygxc7x1sArWzvjjfK17DaSJ9Pcxadsutcsu+knxhYR5kkpbKNaPU3gK8hyQ7PFd97cD5+fPZcfwEB5YZUKj6r/xMsmV6LjrtvGOKFvQkvh/ycxRRq/wdjW6wqvJ7q244wcB2rhi6nFUmpTK6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931283; c=relaxed/simple;
	bh=NmvCL16IoZr6Te5UOZugJyRe7Wfoc7qfOIVlZtyrAqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6DYcnEqnEhSJcvgpXuIjuYxiIN08o+zOZor4F3t4XCy8VAXrTtZ/dBJJpCu1EgBahLFltQcPKCML2IgXQIZGK+uD4kmrSADyVrY/Ia3+HJOMGzJMXFemxEvuO3uEQ/7s9/iYGZMvtjeDXIV7WPpaZA/miX2E2chZodzOpzkRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VScrS6wJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VScrS6wJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660E8C4CEE3;
	Wed, 15 Jan 2025 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736931283;
	bh=NmvCL16IoZr6Te5UOZugJyRe7Wfoc7qfOIVlZtyrAqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VScrS6wJSURSmM5WJotOR24t4/F98YwEgeaLx6KEbgOtFp7IPBmfuXgKo6su3h/jO
	 pyaL/ak1XDoZ3xw4D78Z89zuTzEOP42wu+A/KnHRBu5C0fQzkfRfTfdQcrKfumHKBd
	 G9Meze2XwNk0rBVPvsOreYwQEd3HAxrrN+yk7CqIJpEz13JJM2UtDc+23UuL6ezvOk
	 A1a6xxaAuXWex4Rs0O4GopRKTQNDyL9pNw+dYPymUcnLQHcAAysbA0jF1q8vPkEHNe
	 AQB28Lbf7cZYtJ4Ey0hs9y9TmyVKNG0iwq65egmDDdx+a3iAYSvgR4JQkjUSPomWzt
	 AQPbIfpaA3deg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 17/18] docs: irqdomain: Update
Date: Wed, 15 Jan 2025 09:54:06 +0100
Message-ID: <20250115085409.1629787-18-jirislaby@kernel.org>
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

The irqdomain documentaion became obsolete over time. Update and extend
it a bit with respect to the current code and HW.

Most notably the doubled documentation of irq_domain (from .rst and .h)
was unified and let only in .rst. A reference link was added to .h.

Furthermore:
* Some 'struct' keywords added, so that the respective structs are
  hyperlinked.
* :c:member: used where appropriate to mark a member of a struct.
* Some wording rephrased to improve readability/understanding.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/core-api/irq/irq-domain.rst | 123 +++++++++++++---------
 include/linux/irqdomain.h                 |  26 +----
 2 files changed, 76 insertions(+), 73 deletions(-)

diff --git a/Documentation/core-api/irq/irq-domain.rst b/Documentation/core-api/irq/irq-domain.rst
index 0ad0edecd4a5..e7c0360c257d 100644
--- a/Documentation/core-api/irq/irq-domain.rst
+++ b/Documentation/core-api/irq/irq-domain.rst
@@ -3,8 +3,8 @@ The irq_domain Interrupt Number Mapping Library
 ===============================================
 
 The current design of the Linux kernel uses a single large number
-space where each separate IRQ source is assigned a different number.
-This is simple when there is only one interrupt controller, but in
+space where each separate IRQ source is assigned a unique number.
+This is simple when there is only one interrupt controller. But in
 systems with multiple interrupt controllers, the kernel must ensure
 that each one gets assigned non-overlapping allocations of Linux
 IRQ numbers.
@@ -15,46 +15,64 @@ such as GPIO controllers avoid reimplementing identical callback
 mechanisms as the IRQ core system by modelling their interrupt
 handlers as irqchips. I.e. in effect cascading interrupt controllers.
 
-Here the interrupt number loose all kind of correspondence to
-hardware interrupt numbers: whereas in the past, IRQ numbers could
-be chosen so they matched the hardware IRQ line into the root
-interrupt controller (i.e. the component actually fireing the
-interrupt line to the CPU) nowadays this number is just a number.
+So in the past, IRQ numbers could be chosen so that they match the
+hardware IRQ line into the root interrupt controller (i.e. the
+component actually firing the interrupt line to the CPU). Nowadays,
+this number is just a number and the number loose all kind of
+correspondence to hardware interrupt numbers.
 
 For this reason, we need a mechanism to separate controller-local
 interrupt numbers, called hardware IRQs, from Linux IRQ numbers.
 
 The irq_alloc_desc*() and irq_free_desc*() APIs provide allocation of
-irq numbers, but they don't provide any support for reverse mapping of
+IRQ numbers, but they don't provide any support for reverse mapping of
 the controller-local IRQ (hwirq) number into the Linux IRQ number
 space.
 
 The irq_domain library adds a mapping between hwirq and IRQ numbers on
-top of the irq_alloc_desc*() API.  An irq_domain to manage mapping is
-preferred over interrupt controller drivers open coding their own
+top of the irq_alloc_desc*() API. An irq_domain to manage the mapping
+is preferred over interrupt controller drivers open coding their own
 reverse mapping scheme.
 
-irq_domain also implements translation from an abstract irq_fwspec
-structure to hwirq numbers (Device Tree and ACPI GSI so far), and can
-be easily extended to support other IRQ topology data sources.
+irq_domain also implements a translation from an abstract struct
+irq_fwspec to hwirq numbers (Device Tree, non-DT firmware node, ACPI
+GSI, and software node so far), and can be easily extended to support
+other IRQ topology data sources. The implementation is performed
+without any extra platform support code.
 
 irq_domain Usage
 ================
 
-An interrupt controller driver creates and registers an irq_domain by
-calling one of the irq_domain_add_*_of_node() or
-irq_domain_add_*_fwnode() functions (each mapping method has a
-different allocator function, more on that later).  The function will
-return a pointer to the irq_domain on success. The caller must provide
-the allocator function with an irq_domain_ops structure.
+struct irq_domain could be defined as an irq domain controller. That
+is, it handles the mapping between hardware and virtual interrupt
+numbers for a given interrupt domain. The domain structure is
+generally created by the PIC code for a given PIC instance (though a
+domain can cover more than one PIC if they have a flat number model).
+It is the domain callbacks that are responsible for setting the
+irq_chip on a given irq_desc after it has been mapped.
+
+The host code and data structures use a fwnode_handle pointer to
+identify the domain. In some cases, and in order to preserve source
+code compatibility, this fwnode pointer is "upgraded" to a DT
+device_node. For those firmware infrastructures that do not provide a
+unique identifier for an interrupt controller, the irq_domain code
+offers a fwnode allocator.
+
+An interrupt controller driver creates and registers a struct
+irq_domain by calling one of the irq_domain_add_*_of_node() or
+irq_domain_add_*_fwnode() functions (each mapping method has a different
+allocator function, more on that later). The function will return a
+pointer to the struct irq_domain on success. The caller must provide
+the allocator function with a struct irq_domain_ops pointer.
 
 In most cases, the irq_domain will begin empty without any mappings
 between hwirq and IRQ numbers.  Mappings are added to the irq_domain
 by calling irq_create_mapping() which accepts the irq_domain and a
-hwirq number as arguments.  If a mapping for the hwirq doesn't already
-exist then it will allocate a new Linux irq_desc, associate it with
-the hwirq, and call the .map() callback so the driver can perform any
-required hardware setup.
+hwirq number as arguments. If a mapping for the hwirq doesn't already
+exist, irq_create_mapping() allocates a new Linux irq_desc, associates
+it with the hwirq, and calls the :c:member:`irq_domain_ops.map()`
+callback. In there, the driver can perform any required hardware
+setup.
 
 Once a mapping has been established, it can be retrieved or used via a
 variety of methods:
@@ -76,7 +94,8 @@ be allocated.
 
 If the driver has the Linux IRQ number or the irq_data pointer, and
 needs to know the associated hwirq number (such as in the irq_chip
-callbacks) then it can be directly obtained from irq_data->hwirq.
+callbacks) then it can be directly obtained from
+:c:member:`irq_data.hwirq`.
 
 Types of irq_domain Mappings
 ============================
@@ -257,20 +276,40 @@ There are four major interfaces to use hierarchy irq_domain:
 4) irq_domain_deactivate_irq(): deactivate interrupt controller hardware
    to stop delivering the interrupt.
 
-Following changes are needed to support hierarchy irq_domain:
+The following is needed to support hierarchy irq_domain:
 
-1) a new field 'parent' is added to struct irq_domain; it's used to
+1) The :c:member:`parent` field in struct irq_domain is used to
    maintain irq_domain hierarchy information.
-2) a new field 'parent_data' is added to struct irq_data; it's used to
-   build hierarchy irq_data to match hierarchy irq_domains. The irq_data
-   is used to store irq_domain pointer and hardware irq number.
-3) new callbacks are added to struct irq_domain_ops to support hierarchy
-   irq_domain operations.
-
-With support of hierarchy irq_domain and hierarchy irq_data ready, an
-irq_domain structure is built for each interrupt controller, and an
+2) The :c:member:`parent_data` field in struct irq_data is used to
+   build hierarchy irq_data to match hierarchy irq_domains. The
+   irq_data is used to store irq_domain pointer and hardware irq
+   number.
+3) The :c:member:`alloc()`, :c:member:`free()`, and other callbacks in
+   struct irq_domain_ops to support hierarchy irq_domain operations.
+
+With the support of hierarchy irq_domain and hierarchy irq_data ready,
+an irq_domain structure is built for each interrupt controller, and an
 irq_data structure is allocated for each irq_domain associated with an
-IRQ. Now we could go one step further to support stacked(hierarchy)
+IRQ.
+
+For an interrupt controller driver to support hierarchy irq_domain, it
+needs to:
+
+1) Implement irq_domain_ops.alloc() and irq_domain_ops.free()
+2) Optionally, implement irq_domain_ops.activate() and
+   irq_domain_ops.deactivate().
+3) Optionally, implement an irq_chip to manage the interrupt controller
+   hardware.
+4) There is no need to implement irq_domain_ops.map() and
+   irq_domain_ops.unmap(). They are unused with hierarchy irq_domain.
+
+Note the hierarchy irq_domain is in no way x86-specific, and is
+heavily used to support other architectures, such as ARM, ARM64 etc.
+
+Stacked irq_chip
+~~~~~~~~~~~~~~~~
+
+Now, we could go one step further to support stacked (hierarchy)
 irq_chip. That is, an irq_chip is associated with each irq_data along
 the hierarchy. A child irq_chip may implement a required action by
 itself or by cooperating with its parent irq_chip.
@@ -280,20 +319,6 @@ with the hardware managed by itself and may ask for services from its
 parent irq_chip when needed. So we could achieve a much cleaner
 software architecture.
 
-For an interrupt controller driver to support hierarchy irq_domain, it
-needs to:
-
-1) Implement irq_domain_ops.alloc and irq_domain_ops.free
-2) Optionally implement irq_domain_ops.activate and
-   irq_domain_ops.deactivate.
-3) Optionally implement an irq_chip to manage the interrupt controller
-   hardware.
-4) No need to implement irq_domain_ops.map and irq_domain_ops.unmap,
-   they are unused with hierarchy irq_domain.
-
-Hierarchy irq_domain is in no way x86 specific, and is heavily used to
-support other architectures, such as ARM, ARM64 etc.
-
 Debugging
 =========
 
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 6de8a9f3fecf..f8c21d162da3 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -1,30 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * irq_domain - IRQ translation domains
+ * irq_domain - IRQ Translation Domains
  *
- * Translation infrastructure between hw and linux irq numbers.  This is
- * helpful for interrupt controllers to implement mapping between hardware
- * irq numbers and the Linux irq number space.
- *
- * irq_domains also have hooks for translating device tree or other
- * firmware interrupt representations into a hardware irq number that
- * can be mapped back to a Linux irq number without any extra platform
- * support code.
- *
- * Interrupt controller "domain" data structure. This could be defined as a
- * irq domain controller. That is, it handles the mapping between hardware
- * and virtual interrupt numbers for a given interrupt domain. The domain
- * structure is generally created by the PIC code for a given PIC instance
- * (though a domain can cover more than one PIC if they have a flat number
- * model). It's the domain callbacks that are responsible for setting the
- * irq_chip on a given irq_desc after it's been mapped.
- *
- * The host code and data structures use a fwnode_handle pointer to
- * identify the domain. In some cases, and in order to preserve source
- * code compatibility, this fwnode pointer is "upgraded" to a DT
- * device_node. For those firmware infrastructures that do not provide
- * a unique identifier for an interrupt controller, the irq_domain
- * code offers a fwnode allocator.
+ * See Documentation/core-api/irq/irq-domain.rst for the details.
  */
 
 #ifndef _LINUX_IRQDOMAIN_H
-- 
2.48.0

