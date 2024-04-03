Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA65B68F
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712128908; cv=none; b=IEsx6CUGRCPN52nJg/rZlPvmtcVsMlEnrOHjZqTGoL5riSDw3foa9Ggk4PV7dIiPQX3lfB0lJmMv4ELvFdHrc9XXLJWGAHo7jBsnmfrN6jPMN4QzH6zfEW+YJNKDhUi3iFerJ7Yv9vlILsTf0D1emiNBC6e8hslhrJumBZR06Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712128908; c=relaxed/simple;
	bh=bRYywF4wQq0rFQo//c05z8eFKnTGTyCsCUjV2hS/RGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWA1eb+t1pxmrpRYjM8/xw7D1eBFIo/jJL7qjt9/7VzjSCkLzevCaHGp8GGN3VTBWC2F0EBBSEIJZi5/W1kIrYJKxB930rbJXS0ItCZN4naeJVvnfluEFtdwzHMCd9/3nGle/Z7OrbAIdRlBzxXoUIymFxhGq1qRqApVH2eKK0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=YmjfYHw6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="YmjfYHw6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41624e8e16aso359675e9.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 00:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1712128904; x=1712733704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLnAdyE+lMa8L2TlOW7Lr0VmL77gsDlT8pRhecvobmg=;
        b=YmjfYHw6wdH+Ia71EBsjmblp3fB9DQJS4MqpgkrhBFsSWOOyArokHipxtK3S8jajEz
         Nh3zL6k/yr9AFhNHyQVBNQGIdy8VkEZOw/mMbH7rpB10xLj7FEeX+R9YpsD7Ci1IQpwf
         iteoLU15TGr0ig7Dzzfk8TA1SRvcupSQaHyk9A2t33y0U1ZtDzS95+Ih2DAl8yMzSJF8
         8ekcehc+Wlef+ndp1OR31RlJ39nhLJj0NqINWjNdQXaMebWwilw+2+WurzPcTeKs9ain
         XdFXN+k8htuQWUoJhx2Q2DgeX9pFmpuBkSR2r/raO05ducFsJIKuuSAv5GUCCZAdctig
         Cs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128904; x=1712733704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLnAdyE+lMa8L2TlOW7Lr0VmL77gsDlT8pRhecvobmg=;
        b=bLQ8ta/w3bHM3UMEHkRVQAho1V2uUi3ZODD93qWAPbO6YH3879WVMwgp80UgRBPMiK
         GeLYxRy30vfHR/6nAJqUs6qDD2z9Qe11tVcrdGgGlZ6d4H4vDrwpC9Sq2MoHOPmXElN4
         Ilux/pfsfFzPfEeJshLbbxX5S9X8LH7TFXA4EjXFhL3JutQaNksWsnbbK5Fzb9Km8yuW
         Yd/gNeioNB3tAUxiTS4yGI1S+H8Tyqq2nhQDP7O2OKnmPX+gDZPuxbnpY8MCCxPS3LDI
         vU7KFMzfObBOwyv+eEDKXWDhn2hcZWB6OYs1tKCl/fuAivcCmCqetzroEjaV2kHpid9j
         sYqA==
X-Forwarded-Encrypted: i=1; AJvYcCW+WTOW8N5c1V+dYKYApW5H0BS3w80Qtx9yOInK+6Dwp4xcUj8XImOdcPj2ONEUucf13NuDyV/j23h86lUfQdPwRjPBJanrX04v
X-Gm-Message-State: AOJu0YxHbPMiza5E11G5MS5hbq/H1I9yDQ7aoTf048DiawMugUzOgtsq
	qcH4fSMhiKyQH3nv3RiijhkA/a2Ope5RVKNwycmOsDfQGh5QQ4qydq+OqwzVXnE=
X-Google-Smtp-Source: AGHT+IGBKQFCUXIuGuB/3ITVSTmpwBRNnzhoeJUE1hf5xtsCdWq2cIwS9vpwQ4hO/jWGP/x1CquarA==
X-Received: by 2002:a05:600c:3c99:b0:414:8e3:d8e0 with SMTP id bg25-20020a05600c3c9900b0041408e3d8e0mr11942948wmb.17.1712128903715;
        Wed, 03 Apr 2024 00:21:43 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id v13-20020a5d4b0d000000b0034356c434d0sm1436269wrq.117.2024.04.03.00.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:21:43 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: David Gstir <david@sigma-star.at>,
	Shawn Guo <shawnguo@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	sigma star Kernel Team <upstream+dcp@sigma-star.at>,
	David Howells <dhowells@redhat.com>,
	Li Yang <leoyang.li@nxp.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Tejun Heo <tj@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v8 2/6] KEYS: trusted: improve scalability of trust source config
Date: Wed,  3 Apr 2024 09:21:18 +0200
Message-ID: <20240403072131.54935-3-david@sigma-star.at>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403072131.54935-1-david@sigma-star.at>
References: <20240403072131.54935-1-david@sigma-star.at>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling trusted keys requires at least one trust source implementation
(currently TPM, TEE or CAAM) to be enabled. Currently, this is
done by checking each trust source's config option individually.
This does not scale when more trust sources like the one for DCP
are added, because the condition will get long and hard to read.

Add config HAVE_TRUSTED_KEYS which is set to true by each trust source
once its enabled and adapt the check for having at least one active trust
source to use this option. Whenever a new trust source is added, it now
needs to select HAVE_TRUSTED_KEYS.

Signed-off-by: David Gstir <david@sigma-star.at>
Tested-by: Jarkko Sakkinen <jarkko@kernel.org> # for TRUSTED_KEYS_TPM
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 security/keys/trusted-keys/Kconfig | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-keys/Kconfig
index dbfdd8536468..553dc117f385 100644
--- a/security/keys/trusted-keys/Kconfig
+++ b/security/keys/trusted-keys/Kconfig
@@ -1,3 +1,6 @@
+config HAVE_TRUSTED_KEYS
+	bool
+
 config TRUSTED_KEYS_TPM
 	bool "TPM-based trusted keys"
 	depends on TCG_TPM >= TRUSTED_KEYS
@@ -9,6 +12,7 @@ config TRUSTED_KEYS_TPM
 	select ASN1_ENCODER
 	select OID_REGISTRY
 	select ASN1
+	select HAVE_TRUSTED_KEYS
 	help
 	  Enable use of the Trusted Platform Module (TPM) as trusted key
 	  backend. Trusted keys are random number symmetric keys,
@@ -20,6 +24,7 @@ config TRUSTED_KEYS_TEE
 	bool "TEE-based trusted keys"
 	depends on TEE >= TRUSTED_KEYS
 	default y
+	select HAVE_TRUSTED_KEYS
 	help
 	  Enable use of the Trusted Execution Environment (TEE) as trusted
 	  key backend.
@@ -29,10 +34,11 @@ config TRUSTED_KEYS_CAAM
 	depends on CRYPTO_DEV_FSL_CAAM_JR >= TRUSTED_KEYS
 	select CRYPTO_DEV_FSL_CAAM_BLOB_GEN
 	default y
+	select HAVE_TRUSTED_KEYS
 	help
 	  Enable use of NXP's Cryptographic Accelerator and Assurance Module
 	  (CAAM) as trusted key backend.
 
-if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE && !TRUSTED_KEYS_CAAM
-comment "No trust source selected!"
+if !HAVE_TRUSTED_KEYS
+	comment "No trust source selected!"
 endif
-- 
2.35.3

