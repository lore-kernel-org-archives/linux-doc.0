Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D1D3C0600
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 21:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718798; cv=none; b=su3p8AoCZgbOtWLYAOvBcBjfxgFTYIDVMsb/nnVaJobUXE2RyIWRDPKtFzwLfkgKiHt7lN+GjTxGQSHkgrCg+H7bCpuK/AVgqTLMGYvSjACh+R2s2pyfMUwXD/9bisildMYicxs+/smJeBfXHKW1CFqPBegguP8vfBWr2LfwqkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718798; c=relaxed/simple;
	bh=O8Lb2kC0q9pWayCFgpEouBe9yAioEPmBnRCX4jxSNVA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ULwIHdIxgi+y+4DThjzZu5XyP2t252GBU6xJeEMKEPqBegY3M026ALmljMimZNyWmAt2h/sfRvj6FI0PHcRdiRZJXuuW5NYMsrmdHAX8xF5YgEkRV7b+UD4R0h6yTMxsGOBXpErOBs+leY7d2Gkl8i1iYa/fsP+OzKVpdUmYCkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fnwq6lS7; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fnwq6lS7"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so1753274a12.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783718793; x=1784323593; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INpd5qJ/nDERayrqFlF9TRfffxREvDfF4kxC1qPOhOg=;
        b=Fnwq6lS7hGezE5YWw6zSaWiof/5afukYRFBAKiTmN82y/BW+oIMgjmGg9Iq8C17Ke9
         2/CTRFGC8+5Dv8LiLfDLNqklICP96qktelLoda/+9s+tjBM09Da+74xVu3zMi4y6TCMb
         phamCJCbY4o0Rau2APSQB00RTif2EhXBQV46UMDTPdjhMIAgKQ6Fq+7yR2uAzQBSLovz
         0dm7BPSWlKNOttMBTjeRmuwYHgXdEh87IKVgz3xOGy8RTbPqErmFij7ZEHkn5TqNB2iY
         rYg9gPVdRBGneV/2Snc/zYNZ/4n4Z1iF9gZQYQDtBySviscXBFCJZlknXl/fjyOT25fh
         AAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718793; x=1784323593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=INpd5qJ/nDERayrqFlF9TRfffxREvDfF4kxC1qPOhOg=;
        b=KGBYWnPKPmhiQWJDTIbartA+Pid1J0jIAPU53EZotnJBzZj/3VweQ6vsLVRYtct2/r
         c+zrpWECCt2P8KyzNFv2gJflcXjLhsx1dCKjYUFjgW/+9jk4J7LMdbjBU8MbK6K6N3i+
         FgUpsvTara6LEe6vFsYUuqghFiNCE8KIJsADqccJPY/ZwIWYTgPJnUFtocNBBt7JGct2
         6WoXbtVsTKBocCBwYpOMiu7YugkU8XwRNVdwt4gFnzmAgDzXIkYJHd4l6E+jgMyemUE/
         aQ2oqbA9sIr57badeIjKVXxst5bcpHtEPf4YEZ+IiE4O6A7ybaGLdR4XJizqfWDNyEY5
         v5xg==
X-Forwarded-Encrypted: i=1; AHgh+RrF7HbjM1b8Ae6LJ3xQOGPCZH5vwKSOVfSgEDYmGkkFmPbsFgHh6Y42yUB3lnIG9lAGeDT2gq+DSzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwPmoL9DSY9ir5y+qn8UqAEls5A4Efixyxo2kf+2UkzI+bH6VQ
	2flpivc1FNUSrouhyCvRVsdvbMmdm6EA63D7qm89L7F+P+qR3/q4DAvIktalqfrFm2hwBRhCbOl
	8VI1Jk7EXlpwkzA==
X-Received: from pgnh4.prod.google.com ([2002:a63:3844:0:b0:c99:aff5:7085])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:e293:b0:3c0:9c18:d5a2 with SMTP id adf61e73a8af0-3c110f61b7emr693546637.63.1783718792786;
 Fri, 10 Jul 2026 14:26:32 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:26:15 +0000
In-Reply-To: <20260710212616.1351130-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710212616.1351130-13-dmatlack@google.com>
Subject: [PATCH v7 12/12] Documentation: PCI: Add documentation for Live Update
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
 Documentation/PCI/liveupdate.rst      | 29 +++++++++++++++++++++++++++
 Documentation/core-api/liveupdate.rst |  1 +
 MAINTAINERS                           |  1 +
 4 files changed, 32 insertions(+)
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
index 000000000000..eba55f8a92ae
--- /dev/null
+++ b/Documentation/PCI/liveupdate.rst
@@ -0,0 +1,29 @@
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
2.55.0.795.g602f6c329a-goog

