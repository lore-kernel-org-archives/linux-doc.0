Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37231357CE6
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 18:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611737; cv=none; b=WYddNcQ2qzr6oIN5lDqqItI70JhbNnPbVjgLL2juxhC+SRn7dDbzSQ3W9Frx4oGlYf4O9r5NERtfXzmxLKGt5rjW90N2fFLuNpG8nXO1iqdI3HUj/ZtTOK2kCdJHUOuZeSAje1dHqj50VAiotM6GugOvfu/+kZvrz/fcHmYut9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611737; c=relaxed/simple;
	bh=kXFrFswYpEL709FjOymCy/isLgjgU2/Se8PexxdvCK0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Or+Qm+OPqAI+Q8ZFGffOeDFIbtiqtX/cFZq3GZKy3B63DmJgIRlmzZJnRi9MkX6z68q7FD4uQCFzTBe93EukBnVPCbwtHcxSuSRh+rdwpOb5Hms/v9UaZPmVCtTcVhG9cn4ABE9FHW0ncJSb9urkT+Czw4A3DFrHxRKI/4qKOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=leImKQ89; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="leImKQ89"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so6418240b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 11:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778611734; x=1779216534; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OwTVELbnzNRdH2phaBPDBaeaYhhwivLmx4DuUtuYrYk=;
        b=leImKQ89xI/NJC3L6+23r0qhf3e1kPMK7qX9zM6fUw8taOzNi4lEZ+MIztjrS6qSrV
         hn6M2NeYQr6QUV8yWA0xJK6HsknY7Ex85Rs6bIlaX3ZgrDA4BZx8Z17fY5a7yqGfbp1q
         EWQgYtbTmwX4vdL3ddgyX4BMAkq55eyCPk7Y6H3nFTrIF/+evgu/UufhrPJuBxLfTTEq
         xLf0ObKsrKXZo42B/XuMQ0A1u2IWosZDqrgrkoLOa2TgpK6fJ95ro+M/RkeLOBldBBLm
         j6yTrGdST+igwBPuzy/XTH5ZL0+fRO/etB75LEtOhOm5KQs6Vkh5CmPk+Pcx57XEoeEe
         hIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611734; x=1779216534;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwTVELbnzNRdH2phaBPDBaeaYhhwivLmx4DuUtuYrYk=;
        b=cFLZLssrSMeteqznb2sijex/AAU5uyeLaj99HupD0Wiho77urLF8sNmrchw8LJojXL
         fXRJ0+VfwoyyoD8v9lVCtflduQRY7DtTyRLXUZMaief/PVXFzRhQJVg/8WQ1d+uE34W1
         qIW07os6xFDT/LuP192MNkeUxFfxWrTeDOHirpnSJi3MZOMWmqqwx9+cvvfQVN/ERdt1
         Z+4Zq557156RS4l3LR0SXTE1HsbRvCdfPUnYDiBguVegnnJKry8DtBgl7uKUDXIhvhRf
         YYe2MS/BrKDy8ivqNY+FMZsvqaE9lwweojSm4b4HEWpb1klZznfWkGsF7o80eRqLLqO5
         VUCA==
X-Forwarded-Encrypted: i=1; AFNElJ/QnCb6rQ/ZHqPJ0NbSHVvkOxQQiFmcKfmmxwclvDoWaOcnme5DaIdSC1Hv08VEB6C6flGSBKSxooU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZoV1feiU7uiEoddE3+7ZU5IvUlbqS/BBqGNMtRtGHlA8U9A9
	tbsjjI7Av7TOlCQIl5dCFjM9b9Iub73Eb7ifUzk5XMXD9yCqX4FSFF29HYn672R4puii9qbHgfI
	X4/GRZCemZyBmVA==
X-Received: from pfbfw6.prod.google.com ([2002:a05:6a00:61c6:b0:83e:c864:caf2])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e83:b0:835:405a:7e62 with SMTP id d2e1a72fcca58-83eebe71c57mr4745750b3a.33.1778611734335;
 Tue, 12 May 2026 11:48:54 -0700 (PDT)
Date: Tue, 12 May 2026 18:48:39 +0000
In-Reply-To: <20260512184846.119396-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260512184846.119396-1-dmatlack@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512184846.119396-5-dmatlack@google.com>
Subject: [PATCH v5 04/11] PCI: liveupdate: Document driver binding responsibilities
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

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index f14396dd1477..d77e64906a25 100644
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
2.54.0.563.g4f69b47b94-goog

