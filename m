Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638B83A1E9E
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800035; cv=none; b=U5U51Iqd8QaT/CMSXeHIoGSa9LJLxuATjUmlCIRAzyF2DRA15+xRUuuNmTwSH13kVmJ4zbsDGD4l25C8kSdcux9WWu50JndzYOrQ5jHKCW2GuvrxsLBoPm70CGe3jObLb6kplLXhVslnPxQ3o7rMGk9mV8/O+JBc1LKriZPq8XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800035; c=relaxed/simple;
	bh=hD5I6TrfIkqR6ZL+5ujqz6J1CgfKrd1fwnq5BYvWvKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jf4CEBv7Z/06Y+aI1pCIR20Pz39aBMp09gGtOWPMzkmPNgHFsmou88AN1Xp3tflJzTtA64rd7Vv5LAWI/A7j3Ci7eKlkjFILh04Eg5EEnMiW+KDsELREoGtjKEE3wA6rjNvnFwrIAQwPCoEJ7Qhbn2ZJdmPTOpdpA4s717MNtLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqPnRaEq; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqPnRaEq"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-455ddb90934so747633b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800031; x=1768404831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf1UcbhIiBjc/Uk94gbmf97qs8tTGqNT0DMGx4pvtTw=;
        b=FqPnRaEqzQkwy+NHMj5UExKUCB2RT6msJEJ7Rk5BXRxQkjQA0cwU2mNuZLBiZVFb/8
         xk4EhgaRDDC6ig/3lBl3i3gR1lT0kinz9NxCx0pccFHf9OTXlDtQ4cEgRnaMGtg+GO5x
         IGjSwKY3awbgnxXV1yif2KjallwZq8ihFgjLfVPjMlB7XR7opveNzFuSg7fD2RXN7K84
         L/CipeWyL39PwULdnoV+IlTwn/pCEGcoPjYdutALiI4r4oUuD6Mk02iDu3UVBYlM078+
         2gkjD/AUTEGMh5051dEng1qgEaSGm8jOjnU58EjaNueIs+PvBOHA0uZ0M3OLMscEhEZg
         CDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800031; x=1768404831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sf1UcbhIiBjc/Uk94gbmf97qs8tTGqNT0DMGx4pvtTw=;
        b=i7ThCzTlj0aluevIn33/PjF6XW4hBYZWbFQgygzDYG1GznXG6SuSpOcCt0yTrCz0ZO
         dRIN9rXlAO7srwNsSibk9fNsLNBdLKqpfGeFoiZtwhADkNiJOrr2FXh68Vm7VWcj9Xew
         gPhouqK99go/zjiKrXuxD1Q+yNVtu98nWOg4hs8swsLPrFxeRU4v+G8JG1AJnFkWfFya
         X5AfvMiOlA0SMQAgEK870w2QSBOxJoBwMX0Br8iCasI1uTsIFIfvcgYU0D5bL9poKxHI
         BAHm6dldx0VBBTW3RCHhCrhnyr+ts6h66Mg9kLdulj8a8fl7oPjsp9oEkJCVbGSky9SO
         OOjg==
X-Forwarded-Encrypted: i=1; AJvYcCWbyd0KEwE1ubhAIFC7fvXl9VOPLFeQIciqq8gNZ1pTqgg/1iRFTxqn8JZyDiBluC3Hfnb0nrrlUPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Ljt0BGk8u+zuzdRKT1C2PVoj0qQTUJ6PcuN5lwpVONRcvRuG
	vSr511XrMYhB2/L2s2wysH1/iBaREbz6EO+/hhyXrwG+ST5mgUkZONfK
X-Gm-Gg: AY/fxX6D+tZozT0LAlHHuMthqTN/dSdiCuIydkNg+oEe3iQo23+7vZoGtWOr65jJ2hG
	95hZ5ZIkGnDpqDAkO5iQQOwIeEAQ83cQ3fMrRfb5Url7zHjqx0Wj0aT5aOJV69s8LfkHfmdBljJ
	wNU7u5g0awkRw6XofE0j4u6PdZR5zGc93UZnatSWW+Fapg6SnQcw6rtakh4TIbkKlw0kKM5JNvO
	AzHLw9hvAbtW0BFXGZB2iowm16Q+ix7sZHezdzA/BxJlBF0ZSBj7f8jAVVe9C2gIYkOOL9R1duP
	3HqVWWOpR7wu2O2AYyegeX31FeqNvQQVACKUB/HVoPcHtoGOjEjaBQ4vIaNXfHruTgATtoC0qtQ
	ug2fCBdiPsqXteBwwiwe2sHFi58eZjopakWjRhQ0PJZOiqn5KyShJTcoAHwaKsxOREyzOelsBOH
	g6kgpG69K+xfFN4fbui0Z0ScBZKS4toW922CM6xcgwWiyd
X-Google-Smtp-Source: AGHT+IEqVwo0n9Yhx+3/EIppk2vTR8GrN00AjqQRNTP0en45Aku1OwSuAXlc5vd++JGo553Ggky0EQ==
X-Received: by 2002:a05:6808:1822:b0:450:3823:b607 with SMTP id 5614622812f47-45a6bf24bebmr1260765b6e.59.1767800031155;
        Wed, 07 Jan 2026 07:33:51 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e2f1de5sm2398106b6e.22.2026.01.07.07.33.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Jan 2026 07:33:50 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
From: John Groves <John@Groves.net>
X-Google-Original-From: John Groves <john@groves.net>
To: John Groves <John@Groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: John Groves <jgroves@micron.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	venkataravis@micron.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	John Groves <john@groves.net>
Subject: [PATCH V3 03/21] dax: Save the kva from memremap
Date: Wed,  7 Jan 2026 09:33:12 -0600
Message-ID: <20260107153332.64727-4-john@groves.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260107153332.64727-1-john@groves.net>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Save the kva from memremap because we need it for iomap rw support.

Prior to famfs, there were no iomap users of /dev/dax - so the virtual
address from memremap was not needed.

(also fill in missing kerneldoc comment fields for struct dev_dax)

Signed-off-by: John Groves <john@groves.net>
---
 drivers/dax/dax-private.h | 4 ++++
 drivers/dax/fsdev.c       | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
index 0867115aeef2..1bb1631af485 100644
--- a/drivers/dax/dax-private.h
+++ b/drivers/dax/dax-private.h
@@ -69,18 +69,22 @@ struct dev_dax_range {
  * data while the device is activated in the driver.
  * @region - parent region
  * @dax_dev - core dax functionality
+ * @virt_addr - kva from memremap; used by fsdev_dax
+ * @align - alignment of this instance
  * @target_node: effective numa node if dev_dax memory range is onlined
  * @dyn_id: is this a dynamic or statically created instance
  * @id: ida allocated id when the dax_region is not static
  * @ida: mapping id allocator
  * @dev - device core
  * @pgmap - pgmap for memmap setup / lifetime (driver owned)
+ * @memmap_on_memory - allow kmem to put the memmap in the memory
  * @nr_range: size of @ranges
  * @ranges: range tuples of memory used
  */
 struct dev_dax {
 	struct dax_region *region;
 	struct dax_device *dax_dev;
+	void *virt_addr;
 	unsigned int align;
 	int target_node;
 	bool dyn_id;
diff --git a/drivers/dax/fsdev.c b/drivers/dax/fsdev.c
index 2a3249d1529c..c5c660b193e5 100644
--- a/drivers/dax/fsdev.c
+++ b/drivers/dax/fsdev.c
@@ -235,6 +235,7 @@ static int fsdev_dax_probe(struct dev_dax *dev_dax)
 		pr_debug("%s: offset detected phys=%llx pgmap_phys=%llx offset=%llx\n",
 		       __func__, phys, pgmap_phys, data_offset);
 	}
+	dev_dax->virt_addr = addr + data_offset;
 
 	inode = dax_inode(dax_dev);
 	cdev = inode->i_cdev;
-- 
2.49.0

