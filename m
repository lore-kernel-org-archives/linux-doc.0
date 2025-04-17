Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8C0A55
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 09:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883094; cv=none; b=fZgixhZY1d0Q1UFec9GW/8J7QjZsqha5AorVmYaT8MC4NQqOYUItcMVlsdYFsbrmkpcqzMTPxzQMCxCyBJ2c8StEWuHcbNvErMVPQkM2oQWbIY34b8u+8AgSa2ldHoOi2ehm/B1wuCH6ioXvnXVYSFYHDOKKhxiv5EDARw1pk6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883094; c=relaxed/simple;
	bh=DZ7q0YDfE7N1bPL/mA+UEDFwjr40WMySwkGTehTFR3o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hF8IergoYw3T8fjaKAoj4pmx31pU+Q2qF+RbCt/9QdrrX+MqwwMxs2R1vq4SzzIyA3AFK5X5HnHyLF7NKciGNbMDtdx16N70NsHaB/udO1KgCJkCeyLNKTMU5mHEP5hbJYixFvJMMTGDaLvEQjHM8zs7JB8iyDkAQiAckuXuZdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NbfquUS4; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NbfquUS4"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ac28f255a36so50790266b.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744883091; x=1745487891; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wD7Qk4RrTd9xfQxmaol+oD/P6dpfTs5U+U+3JhrL4nM=;
        b=NbfquUS4AEZ82PG/scRkg544v26Qxe9aMHqw5doSQmmFoQC8KhcfKaAR9MNzsE6dz9
         pkblckiCXvE9ssUOUTib6oouBQHuqFqNlJzXn1XBLIzSMnkqhrLAMrRAm5/3jaGAQ5PW
         Ad0x5VAcJ56hfZ/EK+tycYpgLgt46meAQIXJ7tS7Ve8BXbLJqUKxdZ2NyJLdUXp/vw5S
         5F0oiqWz1v0OgMwtQo0jrW+1LafWdNvBQg78/IH7UASptIbV6qn2SLshPeENIh7pYa3/
         lf2dp2TiTmZiWnlzk+0ZIjrBJu9z5wbR8mhPkyrz+FoP0EGqmej2lOhh2v7/kIe6b/av
         Q+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883091; x=1745487891;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wD7Qk4RrTd9xfQxmaol+oD/P6dpfTs5U+U+3JhrL4nM=;
        b=IdYQYJOryBYltPcMtqTpJHG/dDuAbB8lhjXW+NCLzRQ2lPU06UumOrHNSPR4BZbgof
         x15vOUkY6jvX7ikOpA+BBa/Yn5C3x9iln1Vg8OekM4yYwVSHp7CcDUTgMUOVX7gqiLMB
         /FnDJEkKi4AbQSlOSauF/oKnI7arhVSdxPkALX06wbMAGeswXQ3ICor/XnW7BdwLKKA2
         rb2IsOzKzP/r3Ex6wtLYwFATaG4f5aOMo5KkcUPKBgd7Yi6hBOJE1Be3TjBWPJVUxIdU
         oiHue9Fo1KX9HtA02nyCpGeIsWziN4hxv/3saECCVnUIAz6/zHd51mod6YHIlvbnHfVY
         VZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCWvtMXlOOvmZQSRmqhJgGdFcFYop9ZJEcQ/28/ELtFuL3wqjt7zvXkB8MDF8r4kmFzauzg/Z0aKg/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdOaG2dPGDtvMo3QazcamInyRo9DNHPUUXHlD0gB87KYQfq6eV
	tBj/g56gs7XL9k3nr0E8kIoYejqeuatMnRcB5zUhI1qiq7LymFYQ/4Q+4B0GboXwBKYqQdP1fUz
	EirRgp79SccE1C9Ld0A==
X-Google-Smtp-Source: AGHT+IF3ziPzRL1h03+T3uQPQ+OVjHXAwzHdaqiQIAuXSzMcxLZdGld+ARV/oDwmpyIVSm/HF3CzkYqt6bQHayeI
X-Received: from edra24.prod.google.com ([2002:aa7:d918:0:b0:5ec:d794:927f])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3549:b0:5e1:dac1:fa22 with SMTP id 4fb4d7f45d1cf-5f4b75dd0b8mr3938873a12.21.1744883091409;
 Thu, 17 Apr 2025 02:44:51 -0700 (PDT)
Date: Thu, 17 Apr 2025 11:44:32 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250417094432.3690181-1-mclapinski@google.com>
Subject: [PATCH 1/1] libnvdimm/e820: Add a new parameter to configure many
 regions per e820 entry
From: Michal Clapinski <mclapinski@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: nvdimm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, the user has to specify each memory region to be used with
nvdimm via the memmap parameter. Due to the character limit of the
command line, this makes it impossible to have a lot of pmem devices.
This new parameter solves this issue by allowing users to divide
one e820 entry into many nvdimm regions.

This change is needed for the hypervisor live update. VMs' memory will
be backed by those emulated pmem devices. To support various VM shapes
I want to create devdax devices at 1GB granularity similar to hugetlb.

It's also possible to expand this parameter in the future,
e.g. to specify the type of the device (fsdax/devdax).

Signed-off-by: Michal Clapinski <mclapinski@google.com>
---
 .../admin-guide/kernel-parameters.txt         |   7 +
 drivers/nvdimm/e820.c                         | 149 +++++++++++++++++-
 2 files changed, 153 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec85..63af03eb850ed 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3849,6 +3849,13 @@
 
 	n2=		[NET] SDL Inc. RISCom/N2 synchronous serial card
 
+	nd_e820.pmem=ss[KMG],nn[KMG]
+			Divide one e820 entry specified by memmap=x!ss
+			(that is starting at ss) into pmem devices of size nn.
+			There can be only one pmem parameter per one e820
+			entry. The size of the e820 entry has to be divisible
+			by the device size.
+
 	netdev=		[NET] Network devices parameters
 			Format: <irq>,<io>,<mem_start>,<mem_end>,<name>
 			Note that mem_start is often overloaded to mean
diff --git a/drivers/nvdimm/e820.c b/drivers/nvdimm/e820.c
index 41c67dfa80158..581fe01553a22 100644
--- a/drivers/nvdimm/e820.c
+++ b/drivers/nvdimm/e820.c
@@ -8,6 +8,87 @@
 #include <linux/libnvdimm.h>
 #include <linux/module.h>
 #include <linux/numa.h>
+#include <linux/moduleparam.h>
+#include <linux/xarray.h>
+
+#define MAX_PMEM_ARGUMENTS 32
+
+static char *pmem[MAX_PMEM_ARGUMENTS];
+static int pmem_count;
+
+static int pmem_param_set(const char *arg, const struct kernel_param *kp)
+{
+	int rc;
+	struct kernel_param kp_new;
+
+	kp_new.name = kp->name;
+	kp_new.arg = &pmem[pmem_count];
+	rc = param_set_charp(arg, &kp_new);
+	if (rc)
+		return rc;
+	++pmem_count;
+	return 0;
+}
+
+static void pmem_param_free(void *arg)
+{
+	int i;
+
+	for (i = 0; i < pmem_count; ++i)
+		param_free_charp(&pmem[i]);
+
+	pmem_count = 0;
+}
+
+static const struct kernel_param_ops pmem_param_ops = {
+	.set =		pmem_param_set,
+	.free =		pmem_param_free,
+};
+module_param_cb(pmem, &pmem_param_ops, NULL, 0);
+
+struct pmem_entry {
+	unsigned long region_size;
+};
+
+static int parse_one_pmem_arg(struct xarray *xarray, char *p)
+{
+	int rc = -EINVAL;
+	char *oldp;
+	unsigned long start;
+	struct pmem_entry *entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+
+	if (!entry)
+		return -ENOMEM;
+
+	oldp = p;
+	start = memparse(p, &p);
+	if (p == oldp || *p != ',') {
+		pr_err("Can't parse pmem start: %s\n", oldp);
+		goto err;
+	}
+	++p;
+
+	oldp = p;
+	entry->region_size = memparse(p, &p);
+	if (p == oldp || (*p != ',' && *p != '\0')) {
+		pr_err("Can't parse pmem region size: %s\n", oldp);
+		goto err;
+	}
+
+	if (*p != '\0')
+		pr_warn("Unexpected parameters in pmem arg: %s\n", p);
+
+	rc = xa_err(xa_store(xarray, start, entry, GFP_KERNEL));
+	if (rc) {
+		pr_err("Failed to store 0x%lx in xarray, error %d\n", start, rc);
+		goto err;
+	}
+	return 0;
+
+err:
+	kfree(entry);
+	return rc;
+}
 
 static void e820_pmem_remove(struct platform_device *pdev)
 {
@@ -16,10 +97,9 @@ static void e820_pmem_remove(struct platform_device *pdev)
 	nvdimm_bus_unregister(nvdimm_bus);
 }
 
-static int e820_register_one(struct resource *res, void *data)
+static int register_one_pmem(struct resource *res, struct nvdimm_bus *nvdimm_bus)
 {
 	struct nd_region_desc ndr_desc;
-	struct nvdimm_bus *nvdimm_bus = data;
 	int nid = phys_to_target_node(res->start);
 
 	memset(&ndr_desc, 0, sizeof(ndr_desc));
@@ -32,12 +112,64 @@ static int e820_register_one(struct resource *res, void *data)
 	return 0;
 }
 
+struct walk_data {
+	struct xarray *pmem_xarray;
+	struct nvdimm_bus *nvdimm_bus;
+};
+
+static int e820_handle_one_entry(struct resource *res, void *data)
+{
+	struct walk_data *walk_data = data;
+	struct resource res_local;
+	struct pmem_entry *entry;
+	unsigned long entry_size = resource_size(res);
+	int rc;
+
+	entry = xa_load(walk_data->pmem_xarray, res->start);
+
+	if (!entry)
+		return register_one_pmem(res, data);
+
+	if (entry_size % entry->region_size != 0) {
+		pr_err("Entry size %lu is not divisible by region size %lu\n",
+		       entry_size, entry->region_size);
+		return -EINVAL;
+	}
+
+	res_local.start = res->start;
+	res_local.end = res->start + entry->region_size - 1;
+	while (res_local.end <= res->end) {
+		rc = register_one_pmem(&res_local, walk_data->nvdimm_bus);
+		if (rc)
+			return rc;
+
+		res_local.start += entry->region_size;
+		res_local.end += entry->region_size;
+	}
+
+	return 0;
+}
+
+static void free_pmem_xarray(struct xarray *pmem_xarray)
+{
+	unsigned long start;
+	struct pmem_entry *entry;
+
+	xa_for_each(pmem_xarray, start, entry) {
+		kfree(entry);
+	}
+	xa_destroy(pmem_xarray);
+}
+
 static int e820_pmem_probe(struct platform_device *pdev)
 {
 	static struct nvdimm_bus_descriptor nd_desc;
 	struct device *dev = &pdev->dev;
 	struct nvdimm_bus *nvdimm_bus;
+	struct xarray pmem_xarray;
+	struct walk_data walk_data = {.pmem_xarray = &pmem_xarray};
 	int rc = -ENXIO;
+	int i;
 
 	nd_desc.provider_name = "e820";
 	nd_desc.module = THIS_MODULE;
@@ -46,8 +178,19 @@ static int e820_pmem_probe(struct platform_device *pdev)
 		goto err;
 	platform_set_drvdata(pdev, nvdimm_bus);
 
+	xa_init(&pmem_xarray);
+	for (i = 0; i < pmem_count; i++) {
+		rc = parse_one_pmem_arg(&pmem_xarray, pmem[i]);
+		if (rc != 0 && rc != -EINVAL) {
+			free_pmem_xarray(&pmem_xarray);
+			goto err;
+		}
+	}
+
+	walk_data.nvdimm_bus = nvdimm_bus;
 	rc = walk_iomem_res_desc(IORES_DESC_PERSISTENT_MEMORY_LEGACY,
-			IORESOURCE_MEM, 0, -1, nvdimm_bus, e820_register_one);
+		IORESOURCE_MEM, 0, -1, &walk_data, e820_handle_one_entry);
+	free_pmem_xarray(&pmem_xarray);
 	if (rc)
 		goto err;
 	return 0;
-- 
2.49.0.777.g153de2bbd5-goog

