Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041434;
	b=1hsUNBO1uyXZiRQmD9kZrjJPLjcafwFy1TcCjOLU+4WFuLfq9A68fkEuTLzSSSH5mHig
	 pMH1usiAxuJotyPu56CiBndbmVTpOcj2/BteApB6U04iqn7YPHzbZRZFhRLlgVm2PiLdH
	 J7nbqrwbqGaoF5HWztBzRgYWSSl5lejoxNanTUSb79Uf6Fo7VkGjUw5+l7/Ds6ll4XZWI
	 4EkZSD/LGX767gleUFMF3wJxsw/gnLWqYlHiyyDUIXw4gM9pxh+0QgMj2zfSZ+/yCDdpk
	 vqC0gGaiH5Z4uqvIsSK696LvRnvNSWuZYtXE4TjqSNGxiT16+7HQ7I0ssv05Qc6d/oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ad5b7cD20gHMOhZMyF8+WzruE7aQOBAM0dk/O+UacAU=;
	b=p7NUCbYutQf/SBBtb1KVXjEcfxeO1doHdY4xvHG6QY5BO1cgDKmG+1jZHTGo6T3pTW7M
	 oPOJzV4flEZyVkEx1pUAIGYWzJnB6sQ1RsLBoobBendIzwD0yXUOM2k9jVAwGQZsBMfok
	 dWFspJzeZnB2JGDL7FEeo6RPyDB/2Co+A5i+lZ7J/+cFO59kQv9WfbsjmQO7pbLMm0NAn
	 bVZr1UwWAiqQtWKmhDvXO5HoYKK1I+av6eP/ELkBF0TZXPC9DM8WeQN5X6gIKUUQXcr1K
	 n23+nhvCihFSVp0pMPggUueM6oa4kbtk25tn5a502WOWF+CnR96+E2MAaxJT/yxJqFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZVdLX5iF;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB43160A2634
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 22:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB43160A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZVdLX5iF
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4566537e644so1643892fac.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 14:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041433; x=1795646233; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ad5b7cD20gHMOhZMyF8+WzruE7aQOBAM0dk/O+UacAU=;
        b=ZVdLX5iFZxiOTNbesS5XvU8FbxWW/+SpGIWvqS+vfS7wUDiRPz92iX0HpK7IWkR8Ue
         n6U+xpiHXVXRn+UGqikJqqYzkJvbdBK5zeVX371T/q0z/S0pJbFKiOY9PE676KJna16E
         tWFzYv3YGXb3wcWm7uWovjS6Lm242jpkjCFFKwDDqmrlmfpHVTSqd7Y6Rg+R90/NtbPJ
         56voJWJF7hm430vpT2KkrQ6k90qyG06tlgG0MXuM+T9j53MQ3iU3OXbA+sl4ld7TNQQ/
         Lno3B3tUu0izZrZDS10yssHrHmNWPIM5RX4g/P4yBQimMqn+F5C4RPt/cK6qwAb3nYGt
         A/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041433; x=1795646233;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad5b7cD20gHMOhZMyF8+WzruE7aQOBAM0dk/O+UacAU=;
        b=BuUtBYmabVa3JwwBpKHtFingRBxhqg5nD5MNAzu4+SUOOVmkiekbJipXhed4yy1+Ya
         WSLfL7NCB7IamgDtGWA8Th4svrhK1OWgFExi3WoSPnUlbsjlaxqVRYNhH8RkvlQQyQlG
         PCYOPRdlW9f4DQ1bZLMBGpv5p+XoBWbAAmnTT2X1IOj6IAHUbrks7eYIg3Ifpzdk/Qn2
         BkLZKHsItSg1wSK2IZFOiIwOrXtn5gLG0aJofR3INzIbEPVT6n4afRqtXlwagpJShskg
         ZRfyX9o5m1+55w7atDCDrkE+EojFPhf9Eni/uL0w131g/CmxrF0eXtHvLgnWv+Hjpoge
         FtKg==
X-Forwarded-Encrypted: i=1; AL+hErFK7m+7G8doYvqzPfoVngLaXZAsLERFQa4nZYZwiTUTjHSWxd9b6GLL+iyIRfLSQPjq9+WTbf/aUAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/68NRBZm5i0IGHdpPf2gOqsPytLkpVsp6esLZEWCqQ9dxRgefF
	Hfu09N2xOeTkKDnKTTc+nfkV0XpX1xiehRgFp7Bheaxq56axPB/tl8RhGD/ReIvE1WtUXwO6dLY
	0Ku2YG+cURdh6VA==
X-Received: from ilqe2.prod.google.com ([2002:a92:d742:0:b0:53c:2d10:3af1])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6401:b0:572:8a:59e8 with SMTP id 5614622812f47-5773d72c450mr4859784b6e.55.1795041432243;
 Wed, 18 Nov 2026 14:37:12 -0800 (PST)
Date: Wed, 18 Nov 2026 22:36:55 +0000
In-Reply-To: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118223704.3286085-5-dmatlack@google.com>
Subject: [PATCH v11 04/13] PCI: liveupdate: Document driver binding responsibilities
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Alex Williamson <alex.williamson@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Document how driver binding works during a Live Update and what the PCI
core expects of drivers and users.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/liveupdate.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index b569093bea75..d1b4000c3e78 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -123,6 +123,20 @@
  *
  *  * The device cannot be a Virtual Function (VF).
  *  * The device cannot be behind a PCI-to-PCI bridge.
+ *
+ * Driver Binding
+ * ==============
+ *
+ * In the outgoing kernel, the driver must ensure that it does not unbind from a
+ * device between pci_liveupdate_preserve() and pci_liveupdate_unpreserve().
+ *
+ * In the incoming kernel, the driver must ensure that it does not unbind from a
+ * preserved device between probe() and pci_liveupdate_finish().
+ *
+ * It is the user's responsibility to ensure that incoming preserved devices are
+ * bound to the correct driver. The PCI core does not protect against a device
+ * getting preserved by driver A in the outgoing kernel and then getting bound
+ * to driver B in the incoming kernel.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
-- 
2.56.1.703.gf848ed807c-goog

