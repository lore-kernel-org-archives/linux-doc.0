Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C03479871
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276637; cv=none; b=LlDXym9Z2hkYct0UVL55TmZe9obPa//NfuecqPBK3sdzGIY5iOYO7puNbE0i/ndgvgjYlPQP/u23FnDsp99zJEhx3535b2kDxZgLG7mdWcZ7Eca6mSvs0R907wjpSOuxGNrs12GgZysJYRYkF+6uXxpvyNuahRsYDjIy0W+Solc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276637; c=relaxed/simple;
	bh=VCB46nhFBZB79Q8ZNcMTRQ7UImsFfqC+gG7iDMJki10=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WntQO3D1Yv7oKt9soP1APK3UxF74h1n/hlHAvRyFW7aqBc+BkPHYYjZ9yyDgLkU3BlJjag7JL80LfnPBSUkMYU+km0ryoOO5y5cQwuR47PAG8f2iDxkPD49F1fx24ISsVBGHFjov4aMWGDXHn40ZdnZ5JF8vRS1+DApkMy52Fx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qSjn2Qw5; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qSjn2Qw5"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so7602675ad.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785276631; x=1785881431; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jcNE6apqn+AHojLUlXt2w6cBeAI0PrY+z/kXQXeICZk=;
        b=qSjn2Qw5MKdOyux4EbFXkwjxUDF9hH49sO3r2DgWqlesRq2uYbqSUHmx9eDWKI5c2r
         dlPoD3/JqwxmgBBYlbDmaK0uUGrV/FA3FW30VwdRcz9cKI8pv5KJg6iBd+dUUWOlR0ex
         Yc7SjIpFB/rH+Vd8bzdJrwlKTF4336KM2VTp5P0BetcBxud0s9PrnvFQLmIXIVtx+Iif
         dDOi4jlEop+3X92CMmwR8AXUOX8eqH73NovoDLYkbzLqetQt3GShFeRjIzIYiXz+3SCt
         KicWQgtJuAGRll8n6WCOw6jbxwMHhJJnY6NvCmAyk2YMfa9hSuQk5CGsrfqOeIyHeKIU
         zfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276631; x=1785881431;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcNE6apqn+AHojLUlXt2w6cBeAI0PrY+z/kXQXeICZk=;
        b=brO8Rg8QzMAVmk8y7SW/RDZVdi99ln0BXd2h/u7mSaN7haOlUCcc+kilP5ExszI654
         4i5t1vbmhZOZYBdLSUcyaRgRtJaOv1Nk73HEuyJb03VITi4z88OBTcyC/DKZGZ8rkTRW
         uDOkW7QOXJg1JEFoB33MhqMYmhY7jOq9Rl88PqoCJoqGlwA4qb79wDbH8zjx6W0EECXk
         bPmG7xW26RnN10sCswRgSgwMaqJtnWHhd3dbS7m5fVsPzjxop/iUD8eamk5LAH599TiO
         MNfIZr3CIH1GhwDBnZMt6mrE6yYM+aSQaNc/qII/VsjK25HFQSGLt0Pnw1qi2gWfkv9B
         Nr3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpO34l5fkQoqwI77cszH7tOytxe3YqgEveIP+igqpeE09Uv4yvQy7kO+qjyNtGvmrtU5oOLij6Hin0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzReIwUSeomEVHbzkVyPDQ2XkZ+/PrezIj6VVjXlA4ApWoB13r4
	66l+gBeeAyaGY9pawqeSzdXe3OvhSt8la9txEmANi7yWUNXttzmUV4ADccn0S+JfVjxG+aD+WL8
	v1vKfufz5whICeA==
X-Received: from plrp16.prod.google.com ([2002:a17:902:b090:b0:2cc:9345:c60a])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:b90:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d015b145a4mr51662475ad.4.1785276630984;
 Tue, 28 Jul 2026 15:10:30 -0700 (PDT)
Date: Tue, 28 Jul 2026 22:10:06 +0000
In-Reply-To: <20260728221007.2098560-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728221007.2098560-13-dmatlack@google.com>
Subject: [PATCH v8 12/12] Documentation: PCI: Add documentation for Live Update
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add documentation files for the PCI subsystem's participation in Live
Update.

These documentation files are generated from the kernel-doc comments
in the PCI Live Update source code. They describe the File-Lifecycle
Bound (FLB) API, the device tracking API, and the specific policies
applied to preserved devices (such as bus number inheritance and bus
mastering preservation).

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 Documentation/PCI/index.rst           |  1 +
 Documentation/PCI/liveupdate.rst      | 35 +++++++++++++++++++++++++++
 Documentation/core-api/liveupdate.rst |  1 +
 MAINTAINERS                           |  1 +
 4 files changed, 38 insertions(+)
 create mode 100644 Documentation/PCI/liveupdate.rst

diff --git a/Documentation/PCI/index.rst b/Documentation/PCI/index.rst
index 5d720d2a415e..23fb737ac969 100644
--- a/Documentation/PCI/index.rst
+++ b/Documentation/PCI/index.rst
@@ -20,3 +20,4 @@ PCI Bus Subsystem
    controller/index
    boot-interrupts
    tph
+   liveupdate
diff --git a/Documentation/PCI/liveupdate.rst b/Documentation/PCI/liveupdate.rst
new file mode 100644
index 000000000000..96b1d7f5df3a
--- /dev/null
+++ b/Documentation/PCI/liveupdate.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===========================
+PCI Support for Live Update
+===========================
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :doc: PCI Live Update
+
+Driver API
+==========
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :export:
+
+Internal API
+============
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :internal:
+
+Live Update ABI
+===============
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :doc: PCI File-Lifecycle Bound (FLB) Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :internal:
+
+See Also
+========
+
+ * :doc:`/core-api/liveupdate`
+ * :doc:`/core-api/kho/index`
diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index b3c689e633c1..2bce2644eba2 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -74,3 +74,4 @@ See Also
 
 - :doc:`Live Update uAPI </userspace-api/liveupdate>`
 - :doc:`/core-api/kho/index`
+- :doc:`PCI </PCI/liveupdate>`
diff --git a/MAINTAINERS b/MAINTAINERS
index 08a724b860dc..347c435ca404 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20833,6 +20833,7 @@ L:	kexec@lists.infradead.org
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
+F:	Documentation/PCI/liveupdate.rst
 F:	drivers/pci/liveupdate.c
 F:	drivers/pci/liveupdate.h
 F:	include/linux/kho/abi/pci.h
-- 
2.55.0.487.gaf234c4eb3-goog

