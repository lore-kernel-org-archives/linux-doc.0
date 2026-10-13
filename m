Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9942C51C337
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908744; cv=none; b=XG94De4uArZeaLq5LUQ79zPl+iP+hQ3DRK7jzeO7FjEFJ+dBAPPqKsaSuP7OAYpL6MUsJdiA+fKyrXCnN/EdmOOH6hGWEWNQ0mTvhO0u3SNPwjOtJGqcFojeCcg8aA4Vcnp9H4MYZPF8WudoSQX646eEmoae1z9rs7tz8bFSMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908744; c=relaxed/simple;
	bh=9BYqyMukNW5qh1gE+jywmCAYqkldwxrBBrcV50XUz84=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FLhwdpdXbS9w1jRURoaTTR4qTBYdU074XNA7mo+atU2hfIlS42yHtD0W/6k4kzeuZrc3WHAllf9Yo8QxwFAdP1yXspe69dvY7AxcTFNx99pO26qEbBnVGnFPZrU3S68hP2/JVHpN2DeQ2PYdBCqpaFmu8KWpbz5A2EA2wWuvGEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=anoxwI3K; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="anoxwI3K"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e897d06ac2so24493255ad.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791908740; x=1792513540; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNT+jGdaf2aCsQv4VtyLG1DbArni/172oULb9VD6dek=;
        b=anoxwI3KVibenMl3hsny+zuITABip8T+KSQD3g48Otvcg+VxFamqK56/wTMftezNpO
         pCckbOnnON41bVEQNy/tiEfNAELUhWkFc15QQgrEGO310sJhDfVTo5nmT7qlAktWKSfa
         A806vdQoSpMI2AlcGqnZ3720pt8OaMym3geI0qa8ev4VyGIq+Q6tu80mBIpwRLSvE3dh
         r3qO62vbwbFh8LUneykO0KTKGWr7yVhoYlIrJwtJ30pMwpliO1xv+QMyqd0wpPch/otm
         lAC0zz5wN9EPUcc4sFi4DleQt/w6Fkl7gW//eBln1yV5SBCdovkPrkTy6CrgyU7AEinV
         LMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908740; x=1792513540;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNT+jGdaf2aCsQv4VtyLG1DbArni/172oULb9VD6dek=;
        b=pF+IU6Z/w7AWCiNbxXGfq5bcyC0ZnHDuL77Or2RnHmdKEbVdu2Lbl91Jjg8E8GHWkj
         1ze2j4ybsv4zLU+/nWOOzV4VyYD3TlsjYtTE1DptBrUDOddQiI/0mfgX9zuwc3td8XiO
         uqfiGSyIXY5drEBmNSlMFfRFWNFaVgYVFECbZW9qkksQxvVYltZTod391aVfOKuFarvK
         OQuo2Xcfe48uhNcOeg7sFK5GTdKZCZuyaYCcyehpQ+moXnm035T+/vY96C/KdzMud6XL
         tyyn74ncDlZ0M+7HSYCnCtkN7nS2mUuQBHMEn3HqVPJOW9e909Ps62ddsho1WwnEbZpi
         oUow==
X-Forwarded-Encrypted: i=1; AKwUvBwCzu8ylALzpA0itOTK9I/futnkZoU+birt/Ozkik2FRx47Nujizf+9eU4r4KFaIhhRbjUB3psKELE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMqmCHArsB0WP2J1burXinzTHNzJ6IXaTIFjFt4CZ3ffxpMf+P
	rlJaCSQGMAboEZBFV0sQ9I78J8HKFveZOP+59PZz1nxyecRgT3Q0WluwNkT3k2f8E2rU8YmF584
	Xwq7NqmI6FKG23g==
X-Received: from plmm17.prod.google.com ([2002:a17:902:c451:b0:2e8:d79d:4a41])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecc3:b0:2dd:ad73:5b6b with SMTP id d9443c01a7336-2e8429ab7acmr112088205ad.27.1791908739540;
 Tue, 13 Oct 2026 09:25:39 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:25:20 +0000
In-Reply-To: <20261013162529.1928093-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013162529.1928093-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013162529.1928093-5-dmatlack@google.com>
Subject: [PATCH v10 04/13] PCI: liveupdate: Document driver binding responsibilities
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
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
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
 drivers/pci/liveupdate.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index a1d9b2b1f9e3..d6b659b346bb 100644
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
+ * In the outgoing kernel, the driver must ensure that it does not release a
+ * device between pci_liveupdate_preserve() and pci_liveupdate_unpreserve().
+ *
+ * In the incoming kernel, the driver must ensure that it does not release a
+ * preserved device between probe() and pci_liveupdate_finish().
+ *
+ * It is the user's responsibility to ensure that incoming preserved devices are
+ * bound to the correct driver. The PCI core does not protect against a device
+ * getting preserved by driver A in the outgoing kernel and then getting bound
+ * to driver B in the incoming kernel.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
-- 
2.56.0.385.gd3acb90ef8-goog

