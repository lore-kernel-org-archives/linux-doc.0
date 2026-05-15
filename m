Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A23EEACD
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879689; cv=none; b=qQWUGnE8YiJ/zNSRGKSJhZEaEVCVVpJPJqDb34rXNeCyoBAclGJTYDHzx17FV9vVb5S2kNQjwTCCWKBjdK/0RAwvnK6sVQT/apXJY9k2Gk8a63mA9vjfNZquaqraE3+7L+eMxxhNS7RF2xMbeZS6mSeC/vtO9BbBatFT7Xic+4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879689; c=relaxed/simple;
	bh=YM/w2wtPzdX3RmdPxAtDTeVwrQxqc/8DXfB4OKpz4wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqhAX5wKgJZMKB98MGSbKZYVw+nbLk7HpyQgLodr7kdCSZeazNagjVWZyQthe6cjt2RArHY6Nq0EXYb3+KfEsy/dIFVdvlqt9zXlgaUkOvQJDWrMBNhUScI5Yvr91/F1GGgX8ucn873/2vT82upmkkZlxYzwX+7ZKK0op/lMHT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=os1ZZCh1; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="os1ZZCh1"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ee990e8597so744858eec.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879687; x=1779484487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LfQsLm4zjgCBkokqW/LNO8kguAx5+WYTFTmZDrk46E=;
        b=os1ZZCh1Md5gOjiBCwlPZ8Xc0AtQRHNjZE2TTlYHhwXTWbiGH1LZ28DRDrwvDjkTCh
         RF2iReOYGP8hfSbbsgWHpDOgJMDFZrrqDRHbWAZVz6+qRHDE5VimMybaJqXfo7iwu/Vu
         bL2pEabGzP2Py4vEGE+SnI+eS7oK2Z6USfzb6tHMs7uFzrK/5kqdxByPrvaKakbqzah3
         utLW/Fz+u7uCZeaSZr9GkdYoovYiDGMfK3prCTQc0Vk9DwkaxIRZct14h5X+5fvWjZd9
         4rLtBS9EMiO8Y0RlqNuQ+ckh4OomzPGg1JQ99NjlNsWLLm/r9IqF/T7RCt3ZzIRU71QN
         Y0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879687; x=1779484487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LfQsLm4zjgCBkokqW/LNO8kguAx5+WYTFTmZDrk46E=;
        b=PvYGdN+Xb83+xN56Z8AFbOXkBBEJa8KVfAsE/aySrT2u52OKdPl7W0c+lmxvqH1xQV
         VGA8TJLcqmYU7GHbK9bgmD+GuNbSyOecakWNymirkSR1/hf1MftdrWt9c3jhcWrOfy9j
         khxP3NpriQT/VbgRVyw+vtpLtmlE6XhFK1Jd+vlF9hRCLKVj/qvI8lZ1WF1lhRINWFfv
         YtvLCI+EfRCX4buQ3+tLYG6HXolpWG6VXRxz5tL963Ad4spaZrBW41jPIft8jiT8Aw6G
         XAvbTMz4yBk4E0tzRckmnrxX1w7Phy1I4bTeo8VAk1Jli4MEWoKstfz5M3c9S6KOMoN+
         k5JA==
X-Forwarded-Encrypted: i=1; AFNElJ/XZ7PWBovKiNz7Sn9T0hN4zeORDL1q34BdfHaM7AD0ltFgTPBfMYK7cT6njNJCeWQWIl5k9M0Htl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvtL/OAt2hZ7VXkyGUki/RbtJ0jZ05JIggyxFl3YIi9FFM0kz
	6FFqe99WMvuKqn2O0IPVrM51hFUW1D/D2m2usaAs4J7LjYwzA891zQaT
X-Gm-Gg: Acq92OHoYGeF6xsFxui8KEeoPATe8vsROq/7Aca9zgDEZjsaP4F1TxLccCljHBHh+os
	IUycNq6hzMM4DdrTsrViWgBpYL1JCKcz/m/RGfS7rr7Rk8laFix3WQyJcjeafH2C5bW5Okp1muG
	Iowkncr9YpG2HoY1WQZtvubfSqaCwiHmwmtDv8rIQthVKn1AcZ82pZLjBs3C1nsLwV4jMtVSVne
	H/tALGo5hJaHo0cOT+R9Cu9+Ib+ixr6oCMx146n5RIYLlnhZTMz/OwS/UHdZ4bqX99SEaTXPMHh
	h1P2WiDgv67DTHmrxHoD/7jGUXIjpR16aKnTPYy8grTxdO3332pf7NzU0FBgVXYF2QiXHgdvDv9
	QXvhtF36jXzTMXwzaaYCUpEJsiejTGoS7GhVv6QcqnQq66XIuQH92X+cG/5it+tY62DKRagJyIC
	e2HRYSEKxZNiEFgzji0MhFOn0MXW2vmfc=
X-Received: by 2002:a05:7300:a907:b0:2f0:c8b5:3dc7 with SMTP id 5a478bee46e88-30398680c36mr2863934eec.22.1778879686973;
        Fri, 15 May 2026 14:14:46 -0700 (PDT)
Received: from mimas.lan ([2603:8000:df01:38f7:a6bb:6dff:fecf:e71a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6c3sm9740068eec.19.2026.05.15.14.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 14:14:46 -0700 (PDT)
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
Subject: [PATCH v16 12/38] tpm/tpm_tis: Address positive localities in tpm_tis_request_locality()
Date: Fri, 15 May 2026 14:13:44 -0700
Message-ID: <20260515211410.31440-13-ross.philipson@gmail.com>
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

Validate that the input locality is within the correct range, as specified
by TCG standards, and increase the locality count also for the positive
localities.

Co-developed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@gmail.com>
---
 drivers/char/tpm/tpm_tis_core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index 1fbb74a565f4..70aba05f4ee1 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -179,7 +179,8 @@ static int tpm_tis_relinquish_locality(struct tpm_chip *chip, int l)
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
 
 	mutex_lock(&priv->locality_count_mutex);
-	priv->locality_count--;
+	if (priv->locality_count > 0)
+		priv->locality_count--;
 	if (priv->locality_count == 0)
 		__tpm_tis_relinquish_locality(priv, l);
 	mutex_unlock(&priv->locality_count_mutex);
@@ -233,10 +234,16 @@ static int tpm_tis_request_locality(struct tpm_chip *chip, int l)
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
 	int ret = 0;
 
+	if (l < 0 || l > TPM_MAX_LOCALITY) {
+		dev_warn(&chip->dev, "%s: failed to request unknown locality: %d\n",
+			 __func__, l);
+		return -EINVAL;
+	}
+
 	mutex_lock(&priv->locality_count_mutex);
 	if (priv->locality_count == 0)
 		ret = __tpm_tis_request_locality(chip, l);
-	if (!ret)
+	if (ret >= 0)
 		priv->locality_count++;
 	mutex_unlock(&priv->locality_count_mutex);
 	return ret;
-- 
2.47.3

