Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C63EE1C0
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879687; cv=none; b=C4mS/NR+lcFQ9Pao95S1Yr6ASw2d+YxuZSk+VRVaM4CL0CYFqE2eJMaK05/hv7lucx+58OGsaX2r+e+dVlDLl3UuXy6/R4oRMjfNdATsw40jyu9YppwH1FrceG/6bILijiSkcIwJOCz1kRwb4jeaJB+Zms5KVEUKjeuZxUlHH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879687; c=relaxed/simple;
	bh=Ty5sURnTFWVnfbnIBPkCCksC+Y0itcL3NCDAmhozFyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inLPefpyQDsIkIbgGsvbqa6GjxlQVoXNhdSXOOWKQQkksNb6gr/PwNzh8AhPeDI4MExrmdQG98S33v2t/wdMbpQVwkerDlDrE/VJhfFRosWz0Na5nMgSWmvKTlxwd8tPC5ZfaCvNfTGdFre6w8TjIDB5RV34bGboWDa+rrpPzkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLVei2OK; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLVei2OK"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1329fc4bf77so360453c88.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879684; x=1779484484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWgkYkzNwtEfRsNqnMWcy72BtOHvVyAwK+VJB1q1fiM=;
        b=KLVei2OKgLlVbyE5IdOmusvNTPkfJwn3fij9b7ObCFleGFkdpcXRFdMUq/VyKNaknc
         SycDyYTf5pW+1obDdaJCDNorLVWlM/gWhFNomolW60ut0gTEtjt7d88Ok7bK1KPJc2pk
         OcHWM9tF7izGnrarj96Bm0zFPjqszojR+nShHoiUw/R71rO1+tlz4EwBCz29nX+9g2Iy
         07TE0jykFzYdtS7a/8cjPTimcxOYYFoL1CoIKQTaVgz0ALK9BkAH5lpIRaHgkqCtj9Qj
         MDcy53FNoSF0UP1EEQKKbMel7vzhhXIG/sftDh9E2lIlvznng+81oqD1Xz719k5aZmQy
         CrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879684; x=1779484484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MWgkYkzNwtEfRsNqnMWcy72BtOHvVyAwK+VJB1q1fiM=;
        b=ek+s3A83pWP5mvY0RrC4Ts8p1upqtqX/NxHBBWRcivaoK1Ibj8rmihkr983rmR3dxO
         5j6PRs8MsK5/lGd2DEZ+haOcURieIKTYs1h2yv4+7NcHGFsNDoto0Yc3PUqrCSVaktgp
         grKFwmgmy66wFALQMqXMGezQYtZiop1o5bE4fUGOybGijsok1E6ZNml/Yiqwg/zSHT6Q
         WkeQG/ekBZRkPe/vn4Aj8Qwt7C/rH9vEWkiVSswod9+lgyTMF5BOS5130Z8lIwe83GMU
         eDKes8pz3UkflWmHuzIQ5I8bi8G16QWS21Unz+Ho+ymHdhNOZiDhcb3fCw9G7YUkrBn8
         eAuw==
X-Forwarded-Encrypted: i=1; AFNElJ9FPblaD8q/9Fj2Qtn5qyrVp6dVlzi0CY3DbhOr35nie1RLTkHvZbpxqAdqEEaQsnAohdOZMDygW8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGy0eQ9F4ST/cOKoT0dNthoi2prduyTuJSNauIXwR2qwgJ8Z4g
	mTPCUzjfxjHHK4qyV42vEqkNF775QOrTy/UpZg+KI258iGA6EkEdg314
X-Gm-Gg: Acq92OFT1rkOdXlaEamJVWBvRe8LSdrHlzXbyAVz4hRXFqdX42hl6E4LkyVaXkzOMyQ
	P2K4tsj7Sb0/SyGPGgEwzgxXAzB4mqG92gd90cfXIE8C+6XYsse7/GaIyzMsn4P2OKN+A68ISag
	kqAX1vHcX0vuSk/XPoXQEdmJ69tx5a16gtP/tEcRjDIEIIlpuInm8CGwXxJODYhrQwSd6QTht+E
	ptyEmT9gSu4vdJJUInbaY+U+X3mZCA04+ILGyedY7AuE+S/7MQOzdOM0z/1VlMLuQV1AmCjhpAJ
	d0WF/fe+Je3/Q/oFcm/JxlPciufWezJ1DMmrwNZiFJsam+AdyDPSH42QgTfsI6WOnZidclM/xWE
	Su74jxLIjeBX6lX/AoxIZK9Hp+xIt5QmCrnGphFpIy1JOK1WQxBe0glda5CpK2kukoz7M0EWjVj
	JLNuV2A86p7HcXDUXf2U/k4Gi4B2zBluc9LnubhJrMyw==
X-Received: by 2002:a05:7022:928:b0:130:ca3d:fa74 with SMTP id a92af1059eb24-13504a545d4mr2603120c88.42.1778879684210;
        Fri, 15 May 2026 14:14:44 -0700 (PDT)
Received: from mimas.lan ([2603:8000:df01:38f7:a6bb:6dff:fecf:e71a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm11364153c88.5.2026.05.15.14.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 14:14:43 -0700 (PDT)
From: Ross Philipson <ross.philipson@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-integrity@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-efi@vger.kernel.org,
	iommu@lists.linux.dev
Cc: ross.philipson@gmail.com,
	dpsmith@apertussolutions.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	ardb@kernel.org,
	mjg59@srcf.ucam.org,
	James.Bottomley@hansenpartnership.com,
	peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	luto@amacapital.net,
	nivedita@alum.mit.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	corbet@lwn.net,
	ebiederm@xmission.com,
	dwmw2@infradead.org,
	baolu.lu@linux.intel.com,
	kanth.ghatraju@oracle.com,
	daniel.kiper@oracle.com,
	andrew.cooper3@citrix.com,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v16 11/38] tpm/tpm_tis: Close all localities
Date: Fri, 15 May 2026 14:13:43 -0700
Message-ID: <20260515211410.31440-12-ross.philipson@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515211410.31440-1-ross.philipson@gmail.com>
References: <20260515211410.31440-1-ross.philipson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Close all the localities while initializing the TPM driver. The addition
of TCG DRTM support requires this.

Co-developed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@gmail.com>
---
 drivers/char/tpm/tpm_tis_core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index e2a1769081b1..1fbb74a565f4 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -1111,7 +1111,7 @@ int tpm_tis_core_init(struct device *dev, struct tpm_tis_data *priv, int irq,
 	u32 intmask;
 	u32 clkrun_val;
 	u8 rid;
-	int rc, probe;
+	int rc, probe, i;
 	struct tpm_chip *chip;
 
 	chip = tpmm_chip_alloc(dev, &tpm_tis);
@@ -1176,6 +1176,15 @@ int tpm_tis_core_init(struct device *dev, struct tpm_tis_data *priv, int irq,
 		goto out_err;
 	}
 
+	/*
+	 * In order to comply with the TCG DRTM specification, relinquish all
+	 * the localities.
+	 */
+	for (i = 0; i <= TPM_MAX_LOCALITY; i++) {
+		if (check_locality(chip, i))
+			tpm_tis_relinquish_locality(chip, i);
+	}
+
 	/* Take control of the TPM's interrupt hardware and shut it off */
 	rc = tpm_tis_read32(priv, TPM_INT_ENABLE(priv->locality), &intmask);
 	if (rc < 0)
-- 
2.47.3

