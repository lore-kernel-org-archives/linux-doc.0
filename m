Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717603BF68E
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776979412; cv=none; b=t32KkpJ3KC+ltq8tlq3tZJMRZPeWhdwDfwOrb9XIAfI1kSyKTtYb8AUK7HbjjLOGzeWnfyQt5mTyKFhFz4dNoq+SZ25yuw10Ozsflv38qDAvRzAM6OeJqpjIMlraUntUSZCKHafHtvb3FfufJ1EW7D8GFwbDNT5PHX1QaRKNPVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776979412; c=relaxed/simple;
	bh=dE5Wu3i/3oTCNIY4DxPIO1WQs74yLAprf78sku84Hgk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YRRv15oNTjlY4NXXxh3elWsfw92s0PH8TlWG+33Kaa4I0US9kUFeCzSvd0f5VaIdLXIlHSy5v0RhE14ebo/DwAfAqkOMbexrUlZtITCXnH3h/i2ZeGCbOP4iMgdeHe3dfAESgLVsNdTMirYHQ2cQtx4bA05P4csxhopBSsP++n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UpCaZjJy; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UpCaZjJy"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c798ace3e03so2427178a12.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 14:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776979407; x=1777584207; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cA/8iRDD7lhVYHGAuqnc3aBzPoZ7lUU2DgL4E3vJPEc=;
        b=UpCaZjJyglexDgqkb/6vhHNODNhfFff4wOY7JRTtVdk30fxK+tz5WI3aAmJfHms8lj
         qcx8taL6eEz2wgUHxlTKGm05dinaGUQ5hrTwWaXSfRpacdrCM6bBvbAUfsv/2T2IoJlA
         4/aUxDgEDaA2fDUeJdUmv2lRowKRUDwLirJN8II8XBEyI0Rxhc0poz6ktLDomsLLgcil
         GQfoKNfCBuj5J9R/XsgkUpP0+MM9XjoCB47zmY0iM8xAA/EDF1SyOyYM/0Vs2RwC6NIH
         cNsIZNjEUzmsx+Q4ZQRgvpNp+aiDwNCwqfXir3pdDjRuk01Hur6FPePl/vpQEzC+tBsU
         n2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776979407; x=1777584207;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cA/8iRDD7lhVYHGAuqnc3aBzPoZ7lUU2DgL4E3vJPEc=;
        b=BUd4VOnDlm19SC12ctHTTMeizl+q9xIu8DMEy8AOfZEPmYZ1y5hgHEbdxrdmt/Zw9L
         ZqaUS2dEUhQY8Z7pnqtKJFxOB7ZS9NGtZtiKnFqNr+yulHy1f0xFPpuUqCpY93wFiMRX
         jeTh9n/eMYCaEqi5PQsot/vG59yIHHddoVVTEryl5jX1BDwj5J7cTJwZJvl3MJx4ls8H
         8kBbtlYnnrBAE+dt9wgXFzijzV7cdQU+BsCNPlxJFnsh4B05Gb9PqkVW0P4bc5da6xEd
         gI4tKqM2C7De7dUjiPpGDKcllvflHMp1D36WeHYkoawDevRdamwUB3Xb6B3mqQVY8s6q
         7eKA==
X-Forwarded-Encrypted: i=1; AFNElJ8E2DkP97RNS2+cYEzGWR1m0YZpoJ5LdJVl1879JpqggkUdedXilgJK/qDKj6REZEsKj3S+1mw9j+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDHhDouxjucHKTsVylq4YVXM/I952nu1m0xa+caT2DS6bUGdVq
	8c3JGYnPPa+plBfTkrrM2hQOQCiZHhIhAVie5Bz3UCGdwfcgQeWuRvk83KTkDOqPrS0ayKAgqek
	OqR2NTDrmwar6+Q==
X-Received: from pgjm19.prod.google.com ([2002:a63:fd53:0:b0:c79:7f30:5d18])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3399:b0:398:7982:21df with SMTP id adf61e73a8af0-3a08d687673mr31625673637.9.1776979406884;
 Thu, 23 Apr 2026 14:23:26 -0700 (PDT)
Date: Thu, 23 Apr 2026 21:23:08 +0000
In-Reply-To: <20260423212316.3431746-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260423212316.3431746-1-dmatlack@google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260423212316.3431746-5-dmatlack@google.com>
Subject: [PATCH v4 04/11] PCI: liveupdate: Document driver binding responsibilities
From: David Matlack <dmatlack@google.com>
To: iommu@lists.linux.dev, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Document how driver binding works during a Live Update and what the PCI
core expects of drivers and users. Note that this is only a description
of the current division of responsibilities. These can change in the
future if we decide.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index e616cecc37c8..c0a30d16d9b8 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -77,6 +77,22 @@
  * preserved. These may be relaxed in the future:
  *
  *  * The device cannot be a Virtual Function (VF).
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
+ * bound to driver B in the incoming kernel.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog

