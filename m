Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E97477E42
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276632; cv=none; b=pTsEGlDN7JdPEHHymulM7u2Fl+6tcwUF573JQbX/PcPIytUfZBGgGWtvaltxytP3k4+HwqFmOC3evUScRicbLt3VI3nOcyU9yGHAmgZhOMXBqPU95oLMjhRAa9lqJFPmBzgkijZxxSayLTDAOfOTz3+hDFv/IfnRQrftqrBRy+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276632; c=relaxed/simple;
	bh=jhMRVynFzOT07BDLSScYUSTwhsEijALFp2yrQ21EQQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ctZbAx/otY3AWy8Q+T8U7YtIxM650o36p2XvfgAhc0slEkbHts+r3SBqiHJTNWFKOkfS66HjuS9DDDGt7xBjZOaOlPC0Bubp4XYmtt0aI/yGILDk49J8DKBlIBliaeG8wIG/4UwmzSI3DtlQnR0jRZhLDrenpQWSHSLCo1q+Jv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dX//TNCa; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dX//TNCa"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so4203635ad.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785276624; x=1785881424; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5wUi9z17xOtf3gvL/6/TpX7uS9U+gRCHP4vdmTrFsk=;
        b=dX//TNCahqsRYyYNp2KqgoJPvZC2mEIZvQ18IkJtSpjFJbJpwfkUk++W/ywYS5U+K/
         pNp8s+yABjxC6157gbP+UIlmmfo5gLjuA/zIAN04SCjRDugcJN7eDK8GocvfQJNOzZx5
         3P7CWf8NBxj01htqHn+kfIEdsOQAS2u91QTQs7PJ7a9CYPdnBJSqkInlRGfOViDu79l0
         H9Trid89yQo9UHYpb7+QRugbDWU9oiC4khZEQcZKNkueGJotpM8d1yrZdwRQqR+rv6jn
         q/MM70gUVFbyIKXTPDuo+bI4WNJLPBzntcMvgJclSRk9lxiyT1ZDdWMzpaTytRlfBKIN
         G12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276624; x=1785881424;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5wUi9z17xOtf3gvL/6/TpX7uS9U+gRCHP4vdmTrFsk=;
        b=b6f9xaiaqg+iTUkyQ13eDrp7nE8XQDP9qGodGkeraXg3xY6/G5GiFX4oScNqrOlpFU
         nNVhgQmPBS09AfSJFQOc3++pyGrr78RuJx2afzfIdudYVRh2P6LmhNMqfVphxbu2eJLT
         BWG7ZmtU/qSiRDanA1FeYCFpry6lyDso9w/ks3dHIPfi1XGFJWa4Aw2Idfb6UmQA6o6/
         2FKas+qPJmd49XcyzzRgP0/fz6p5/5EEN+XPJ53bXMjRItTOdqSDrN2JcEkeyiNgyHBp
         XQJwRmzvLPQbfhlF1xOw76nrj9zf4+txC+J0KjzDoS369H1K0yJn83pv+68dcPP2LnkG
         kcXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmKNUaPt8xq2M2rGH68+DkqkQ6+jZ9xA/R8Qne11/XsB5QP/zQF9r0ysALMMzeP6JFGtKti0p9n1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9hpujj52/9Q+OSag8WbvKxItnbejRzDEHhiVJlSQwqWJohiBJ
	JAOcT6DtbtbzSvbs3W2zSs3tEA6d4pga+7eVMGYdsF36Ve3Pso3do/P6W/HHSz1Q/yYcOm8SC+b
	kMMs5sbxh+KEuSA==
X-Received: from plsc18.prod.google.com ([2002:a17:902:b692:b0:2ca:f412:48ad])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2f0d:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2d015abe547mr50357375ad.10.1785276624113;
 Tue, 28 Jul 2026 15:10:24 -0700 (PDT)
Date: Tue, 28 Jul 2026 22:09:58 +0000
In-Reply-To: <20260728221007.2098560-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728221007.2098560-5-dmatlack@google.com>
Subject: [PATCH v8 04/12] PCI: liveupdate: Document driver binding responsibilities
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

Document how driver binding works during a Live Update and what the PCI
core expects of drivers and users. Note that this is only a description
of the current division of responsibilities. These can change in the
future if we decide.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 5ce5f8b36902..0f7a018ddc66 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -71,6 +71,22 @@
  *
  *  * The device cannot be a Virtual Function (VF).
  *  * The device cannot be behind a PCI-to-PCI bridge.
+ *
+ * Driver Binding
+ * ==============
+ *
+ * In the outgoing kernel, it is the driver's responsibility to ensure that it
+ * does not release a device between pci_liveupdate_preserve() and
+ * pci_liveupdate_unpreserve().
+ *
+ * In the incoming kernel, it is the driver's responsibility to ensure that it
+ * does not release a preserved device between probe() and
+ * pci_liveupdate_finish().
+ *
+ * It is the user's responsibility to ensure that incoming preserved devices are
+ * bound to the correct driver. i.e. The PCI core does not protect against a
+ * device getting preserved by driver A in the outgoing kernel and then getting
+ * bound to driver B in the incoming kernel. This may change in the future.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
-- 
2.55.0.487.gaf234c4eb3-goog

