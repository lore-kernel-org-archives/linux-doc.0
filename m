Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585822;
	b=g3FE/xEliWVcHb/LXHbCEfD/WvMm3jebe0kaELbgmI1KGZy4bmqZCCNi7vB+rQw0Z4QK
	 EOHKxJbZ321wicmtvbJuXG9zBWY+LiiYZRvlz+1Xx0dz1QoaLnsGFrI/764XMLHzOWNrm
	 YhXGAwpo6hmPiAaJyW9Kx2zD+Hk+9r6MnYmDUaoLWdx5pQUGSkoz4tS+TaXlYVEJS/M6m
	 fyU03vMzB0xb+5MUWwmHPuYvSLJW16nc+rrMyEXiGLWApLH/nuGkrZwtVtDCxYOw2c54L
	 nog6RWF4bsVlqmI0jc3XhqMtx2Kuz3bGoyEzluhP2RZF1FadI316JID612z9q/hXOrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lwMWYldW2xiMuu7J2YEbh/F+RKn5zxewQscmpZkZiL8=;
	b=pRLd9lXvSlNe4KirpHTxgueMlic1Q2la2EG+4r1p9IUAYM9Vgnq/pzFvo8/o5oSxkNuq
	 lMEfi61b0027hZp4OIQCOGZOqCi0rQJwphPD1Tlw8FyYhHNAIcC7Ier4teA3zONgoS+3c
	 z5GcTzEWKIi2L3I8Cdgwu2AfKIMXb59LRAnTaEesipCYBE1ESMAlLaO00x+UI5tzmvuQ8
	 ikhlsVjOLIMZLFEzb+EASfODeswfQkx/alPrYUcYM7qUaO/TG6MBv2ot87oNBAyJhURAU
	 xaEukEBrO2PSuAULHVzQQlfoSFvnFYsb/bRjXpF8XXmAXeV2nJbUG13nnVMIJvbbpNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LgJcHJPf;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C22606A692
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 05:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C22606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LgJcHJPf
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f03a137f6aso46782065ad.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 21:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795585822; x=1796190622; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwMWYldW2xiMuu7J2YEbh/F+RKn5zxewQscmpZkZiL8=;
        b=LgJcHJPf8kPihW3NLuY7ldBrz09nRKVB+VuXffwFw1AFP7vRl23aymQjZAvD9R3JJx
         2bb3H7e/cxFARp6Epj2CRRF7R5kY92WMvq3XOjHkAqWNc7SjIksfR8Iu7ROMQTjcmJ/g
         NooOKKI+u2PBHuAfvDNd+4AXOiFiA5xb+eygl8CIYcvBSVt/dGcb1muGrhkT+in8rKBH
         oZJfEom0vuklUlvHXpVctU+qHBWtWg4xNsAqPIzCHy1Ulms7jVLLIp9UJRA7fdhDMDPj
         T7xRAzCFvGd2GcuZ0VSbDptVuXEOhQdPvrzlgGXMDp4hST0SldHadlyrFOxXyeW4x1Vi
         gB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585822; x=1796190622;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwMWYldW2xiMuu7J2YEbh/F+RKn5zxewQscmpZkZiL8=;
        b=qJu4S5772WRc3rp8OLiGb9qn+lqU4MUma32Y4ElfzDMpGpLtjVpUNrupGem384qi5A
         5tzFCVSitx3pOVk+XB4i5Y26QMcNycOqFPPN16uq3iaheV1dbfuPARj6nbwaN2L7o+rX
         gK954wviAmXYTJlx7sp44tSfSYHZV7tt0FvKsdf/hVi9wnX7xXVn6Y0VXifuP1dN4Iju
         MSP08Fj+EskGp9ZZmJAFW0JuRSg7iRMusQDmhbQ2qDyOKoT7LUxtTbwNoYqXSwHlkYN6
         2jhqyGwW71GYgPl1loE7WjhEEagqHWD2jT8iuh9cf1S7Vk8hiAVJHlya1TeoaTR8UA0m
         FEkg==
X-Forwarded-Encrypted: i=1; AL+hErH3PmrdOpxsCk2tOiTFf7DsFqB7iNKTncs7OS9fUNX5QELpUp+Lwdm8gnHqbqaoZ+CPLvJj5Qh6fVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v0XuGV8tOW7udnNd0rIpwMb7owbdy3rqcY67zv0YTbeKt0N/7
	67QlR3ony7LPNxwK/Kc3A3m47c4I4teXIErTnqJcjaN11/mEM3aYMcCVXOf9MiLuzmRw5r23sij
	RY3NJ5153jvbeOmm/ykO72756cU3q5F+ukQ==
X-Received: from plrc4.prod.google.com ([2002:a17:902:aa44:b0:2f0:43fa:d088])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d54e:b0:2ef:ec63:320c with SMTP id d9443c01a7336-2f03f156128mr164458005ad.16.1795585821668;
 Tue, 24 Nov 2026 21:50:21 -0800 (PST)
Date: Wed, 25 Nov 2026 05:50:20 +0000
In-Reply-To: <20261125-fix-aer-mask-override-v2-0-fb5931dc9462@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-fix-aer-mask-override-v2-0-fb5931dc9462@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261125-fix-aer-mask-override-v2-2-fb5931dc9462@google.com>
Subject: [PATCH v2 2/2] Documentation: PCI: Document aer_inject's
 aer_mask_override parameter
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"=?utf-8?q?Ilpo_J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Prarit Bhargava <prarit@redhat.com>, Huang Ying <ying.huang@linux.alibaba.com>, 
	Terry Bowman <terry.bowman@amd.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Priyank Rathod <rathodpriyank@google.com>, Daniel Pereira <danielmaraboo@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="utf-8"

aer_inject has had the aer_mask_override module parameter since commit
457d9d088b02 ("PCI: aer-inject: Override PCIe AER Mask Registers"), but
the AER HOWTO never mentioned it.  Describe what it is for (injecting
errors that the device masks, in particular those masked by default)
and how it behaves now that it works: the device's Mask registers are
left alone, the injected bits are only reported as unmasked while they
are pending, and the hidden Mask bits stay set in writes until the
module is unloaded.

Signed-off-by: Priyank Rathod <rathodpriyank@google.com>
---
 Documentation/PCI/pcieaer-howto.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
index 90fdfddd3ae5..8994cbf9611a 100644
--- a/Documentation/PCI/pcieaer-howto.rst
+++ b/Documentation/PCI/pcieaer-howto.rst
@@ -265,3 +265,26 @@ from:
 
 More information about aer-inject can be found in the document in
 its source code.
+
+Injecting masked errors
+-----------------------
+
+By default aer_inject refuses, with -EINVAL, to inject an error that the
+device masks in its Correctable or Uncorrectable Error Mask register,
+because the AER driver would ignore it just like a real masked error.
+To exercise the handling of such errors anyway, e.g., of those that are
+masked by default like Header Log Overflow or Internal Errors, load the
+module with::
+
+    modprobe aer_inject aer_mask_override=1
+
+or boot with aer_inject.aer_mask_override=1 if it is built in.
+
+The device's Mask registers are not modified.  Instead, as long as the
+injected error bits are pending in the emulated Status registers, reads
+of the Mask registers through the PCI core report them as unmasked, so
+the AER driver handles the injected error as if the device had it
+unmasked.  The Mask register bits hidden this way are kept set in
+writes to the Mask registers until aer_inject is unloaded, so that a
+value saved through the emulation (e.g., by pci_save_state()) cannot
+unmask them in the device.

-- 
2.56.1.831.g720f3f5937-goog

