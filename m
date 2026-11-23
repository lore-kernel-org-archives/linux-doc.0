Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460460;
	b=Wpj081nFygeflkNf1MFx/K7ZE+zInMHTAp0HcZ8JRRkjnfGxwV6HAnK5REeZ0K5a4Nfz
	 zKo3O9mpNJIhX7OR0CIh4E5j2h0YfxULQhRqqRiLlGBKD8zYWi0R+x4F0HQaVgtiuQo7B
	 6gGtjdU0Gj+rrA7usoK01edMOGmfklQiVUEZQbnya0GQUiN67sneoCYPAU++dVl8QXao7
	 G3OE1XZoYDZgNUNBQvyFkPA6xodRUr1q7/nOx9lCqQ5RkE2JR6N5Psyzx2afbJvrvFtZb
	 XyK/R3KN8He+JGRm4ZpfWWUiXblm2E4ZcIkXWnBgdPg+FfBQ8AyFxp2YEu3JPF9yEdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=l4CNQ2xoCIzIiOKM0YDrq2t5ezZfH9cmVn2diC4Zwwo=;
	b=A+4QHpp31N2aJcjN7cmr8FPzEMQPlMe9fhTojlPl+hD3DWbQ0gKyzLYN5HigU3qtSliU
	 I9w+PMquHyzv69MZItm7FfHgBSWsRR8btuYBcnqmE9rDTv921Tcq2q4XDnjbc4BcJMI3G
	 S2/bCZUI3pjdKuYXFuWPWaHvAQkfsfJ2xrQL7EK2jcpc5CeS3qULCOPST/71427CXANhz
	 RStc8NZiNro4sBQeqEub4lOFhRlPd9w5OAymxZ6Qp1upWPOwlCkMpkXRsWeRX3atBC6Bf
	 9sZV5qfMb3rie/n2dut3s+Lz5bOl/QWk8vFNDPoWXrnpGAPZv0/8dErYt6uir1VATNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="OiZ1Pm/r";
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D51606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OiZ1Pm/r
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862a543c4bcso3963904a34.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795460459; x=1796065259; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4CNQ2xoCIzIiOKM0YDrq2t5ezZfH9cmVn2diC4Zwwo=;
        b=OiZ1Pm/rf2W2kWZ413DRMWc1UPeAD60b75DE0ryDO0KxzIogWOP2M4Zm2vhHiW/C4m
         OI3CgmqI25P/8rHF14ccSKK9viiHAUiUvxhJQbu3gETvPxOwXB412Hg4TkT1ASuct+3p
         BW1oU3R31hAt3Fjcer85FY3FuYMTOPgFJqSDV1Ef1kz88uVINh3BxDSc1fPL9KomRZ8w
         H0Jm4UJduzGaWToOs9LJfuOZC/Txu8OfwekLqp6ylov0GmE9sx+JUAmrrjJ1iZTTieEp
         VAhKslxMosTiIgXUGUjgtAg9HyAEefmu/kt8+0jW1OSDm8TeP3aZPwOp+Kc1154eGQtF
         Brvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460459; x=1796065259;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4CNQ2xoCIzIiOKM0YDrq2t5ezZfH9cmVn2diC4Zwwo=;
        b=N9/PoOcMnreYBOp0tT3s0QPo8xdjUzT5xFruRam1OrxArJW31nhlj4zVNFOVwmMpTk
         dmfZK62OvqCGVaZsXorg+ZwmfIKqcYZ8Z2/CM30cFItEo+c+BLRmVJFvWE/ctc3RWSRH
         NxPg+bchOkVeyQg1k52VlvNQaUSEG+Go3OXmNpyd348n9IM7GNL1NWswaHe1OM6B+fuo
         XId5LPO4e/MYz12ygQgfyto9eYmBTU6WotTJKDMB1bEBQFXEwZ2N8tr9iXFYC6mp2zR9
         F0/dVd7G3c5IAzB7z/pC7iGB3LeLFHfD2mGiT89NlCxbNHr8ox4/ERUfK+zPNxd9Afwz
         7YYw==
X-Forwarded-Encrypted: i=1; AL+hErG+NuL3qjOdiNRgcV6J44v86o1gCOkolL/8tgWgtgHEOnGQbr+sTw/7DEJ6kJiV50AkU6N53Xtzdnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sMhjMoO3C5EpPLOAo2kbkBcYOtrHMUZ/daHVgIY0HcBWGrf1v
	qhDbM+XzWKe/iUHUHQ8mNNDJ7a/qtt17uK7gBxfwcCvCRWDp1WOoEDiDUcfcwhTkdJ9qb7jfr4G
	bXJR29+gnn6PlsQ==
X-Received: from ilbcb19.prod.google.com ([2002:a05:6e02:3193:b0:54f:8d15:4dbc])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3084:b0:55c:844:98ff with SMTP id 5614622812f47-57a0a93940fmr14754171b6e.34.1795460458168;
 Mon, 23 Nov 2026 11:00:58 -0800 (PST)
Date: Mon, 23 Nov 2026 19:00:42 +0000
In-Reply-To: <20261118223704.3286085-4-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-4-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123190045.2166865-1-dmatlack@google.com>
Subject: [PATCH] fixup! PCI: liveupdate: Track incoming preserved PCI devices
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

pci_flb_finish() logged args->data, but LUO does not pass args->data to
the FLB .finish() callback, so it always logged 0x0. Log the physical
address of the incoming struct pci_ser instead.

Reported by Sashiko.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 493576119a76..520c7530475c 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -409,7 +409,8 @@ static void pci_flb_finish(struct liveupdate_flb_op_args *args)
 {
 	struct pci_flb_incoming *incoming = args->obj;
 
-	pr_debug("Finished struct pci_ser (0x%llx)\n", args->data);
+	pr_debug("Finished struct pci_ser (0x%llx)\n",
+		 (u64)virt_to_phys(incoming->ser));
 	pci_check_all_devices_released(incoming->ser, &incoming->block_set);
 
 	xa_destroy(&incoming->xa);

base-commit: fd54e32f7903199e8acb2762dd2debfffe4501c4
-- 
2.56.1.809.ga0b61035b5-goog

