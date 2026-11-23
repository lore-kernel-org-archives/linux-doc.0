Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460464;
	b=05PhKSTUZ33iCNU//mobgsILxjqu0/mR+wJe6NXkpbJlTKOqGBa8sXwuqgTNZ1+XSmpi
	 voqdRO42bkA4LCKG02XWM5XrFEQmCk92Ha/yWORwJsDEhVgy/jY+L5YfunupvnGbwWVKS
	 Ah90RlJcJK5SWRTnR2fjcmZYEoJkKUb/He9h/WjdzPaBgby0YsyzrOzjIUO85lol7xzK+
	 jWOmOxaOfq08hK7nYzmTBnEGrnZ8o+cuglohsOpO+yeriw6hSAlZanj+EW03kTfXR2CL8
	 lvO2iNDErw2Iq8eS1T0OlxBQGEFF8okmw04wJL4qlmSgtWYJW+FXWkfMxLcRQ/VfRHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2BPu+oA30t3CvvayfJGBtOo4KEcsTgY7xbV9OZz0KkY=;
	b=frr4kVxTC9AvHZeWOaTOI/0wAftTX8OIjPbsoNSZ/7Wv9jYWepJ0OAhFrTTmfHjhluu1
	 Jvn2RTXSD0kJZufcBe5QgZ08+qlrHW0mcoHOLU5+vPH6f21pGnePRPeZ5DORVcjVl5cA7
	 DZMyHA/jQrCW9EpjjdSYtoPpi3t27oELd3mY73k2IvJx8mRqhP3uOdkK/hyP/cxpqw7DP
	 it9twUj1jJOKwmWY9YEM8NDZP9vTignyRCkc36AOp2FIeew6n45x3zDAUpQ/9J7LXOsyn
	 twk/2gdt47DGxUe/45unAhFoQ7TE9Wv4EC8dA+qqVqLzAWweOVm5wtNgIe9wk2I4LiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GKz8bKeN;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF321606A6A4
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF321606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GKz8bKeN
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-57e469f8312so60094b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795460463; x=1796065263; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BPu+oA30t3CvvayfJGBtOo4KEcsTgY7xbV9OZz0KkY=;
        b=GKz8bKeNC95smhCz33gtM4AV6oFuQ1jnSzasYoVrLewu/WKzkdfgmvC3n8idOAwVAK
         /n5BajlhSs/NKbHE5EoPM9a2P2M/DqaQ4MhI/lUAK5uJly/i7nC1abA9hVhNxGcMmLSA
         h6lIncKdJI/RP+6QbyYp3dh8OSRUxs2CNjwedTOg6Ke4+3JkugDjg+yN68agCJHMWdCi
         n3ZGpzzaxA6e4nZjMWl9y2i2F7RR8OWmYdyN8bUCvqPO3wGeXrv1JWkVtb2kMzEDDiZy
         YBY79D0o7NY7XPFPrmHXBDmO+pXERRj8e6rDl27fRdpClgr/VNro/lG1lEHkufwo9C3A
         PmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460463; x=1796065263;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BPu+oA30t3CvvayfJGBtOo4KEcsTgY7xbV9OZz0KkY=;
        b=h9eh/YZBGCp6u7TfwQDA0ka5/si0nIqJ7morx0yWzSBJijSctkoHMe+ZdV5PIJ9Kmi
         LJKi0Z/BRPJlBxMocY3kTZwtxbOVVBl+WbUP3hxPP+hZgf6wPd4qx2A4zS8UnUFi4Vd1
         Rygr9SAnECqtbRn4FbxGIsGY/WjIp4RlHP522LFBhyvWyZMetPEAhS8XkOF5MIr/59zV
         TTgWeiRI9AKyso21fCytuO6sz2wuXFWZEA5eTeoFn+Ke4vOSBHfS5DTMiFlo/oU+7bP/
         xYgmAC1+gJd2OXo0nKbVSIPYW5T1zKleCK3Qpt7YviXmrcHi7BIvewGq0Uttc82Ryt+i
         e8bQ==
X-Forwarded-Encrypted: i=1; AL+hErEaDEK5S+FjWKZkGmHVjVhessLLJWW3IAo+qa6xZhTKi1+MJoqDOhdSiwiLqqIN25XKXPlttpc7QqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cet5GnG4sS07Oj9wqWcM/z5qVVhtzi5zXC6Bh5gaTnaTu1P4c
	79Xy/Vz84Hlggsuv2dp9xgfKDHZ+BnEj4zRmGUCk+O8M3Kt2UAmM+afCdcI71Xu+OdsYq0ZoGOt
	ppijJOUcZl04gIQ==
X-Received: from iobhj14.prod.google.com ([2002:a05:6602:1d8e:b0:9c7:4d20:1320])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3514:b0:571:a186:d6b9 with SMTP id 5614622812f47-57a0a30a106mr14736384b6e.13.1795460462155;
 Mon, 23 Nov 2026 11:01:02 -0800 (PST)
Date: Mon, 23 Nov 2026 19:00:45 +0000
In-Reply-To: <20261118223704.3286085-12-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-12-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123190045.2166865-4-dmatlack@google.com>
Subject: [PATCH] amend! PCI: liveupdate: Freeze preservation status during shutdown
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alex Williamson <alex.williamson@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>, 
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

PCI: liveupdate: Freeze preservation status during shutdown

Freeze a device's outgoing preservation status (preserved or not
preserved) during shutdown for kexec. This enables the PCI core and
drivers to safely make decisions based on the device's preservation
status during shutdown.

The PCI core freezes every device in pci_device_shutdown(), not just
preserved ones, so that no device can be preserved or unpreserved after
its shutdown starts.

Only freeze devices during kexec. Other shutdowns do not depend on the
preservation status, and they do not serialize Live Update sessions
first, so a session can still be torn down after its devices are shut
down. Refusing to unpreserve those devices would make pci_flb_unpreserve()
panic because they were never released.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
Link: https://patch.msgid.link/20261118223704.3286085-12-dmatlack@google.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---

Notes:
    This amend! also replaces the commit message when squashed with
    git rebase --autosquash, to explain why devices are only frozen during
    kexec. The message already includes your Link: and Signed-off-by:
    trailers from lu-pci-preservation.

 drivers/pci/liveupdate.c | 2 +-
 drivers/pci/pci-driver.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 08451452fa54..76e939ea52eb 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -127,7 +127,7 @@
  *    Control Services (ACS).
  *
  * In addition, a device cannot be preserved or unpreserved once the PCI core
- * has started shutting it down (pci_device_shutdown()).
+ * has started shutting it down for kexec (pci_device_shutdown()).
  *
  * Driver Binding
  * ==============
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 08b768b9e905..2748ca22e9cf 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -560,7 +560,8 @@ static void pci_device_shutdown(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct pci_driver *drv = pci_dev->driver;
 
-	pci_liveupdate_freeze(pci_dev);
+	if (kexec_in_progress)
+		pci_liveupdate_freeze(pci_dev);
 	pm_runtime_resume(dev);
 
 	if (drv && drv->shutdown)

base-commit: fd54e32f7903199e8acb2762dd2debfffe4501c4
prerequisite-patch-id: ac616bdf67b652da754c7b00a368613d345ae384
prerequisite-patch-id: 9c324eb4a47b659efcf7c0c8bb14acfcbf5d615c
prerequisite-patch-id: a1ec7135c2c0c8f90b12743df9e4620ab2ee2f2a
-- 
2.56.1.809.ga0b61035b5-goog

