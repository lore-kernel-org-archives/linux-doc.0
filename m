Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D223F44D3
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879695; cv=none; b=kfyQdATUrSPt2ZpE5plAWus2FJ/+OUMFPJJY5vq0Sad1wxihEyTl28646i+cshgpgrZI4BjNmE1t/ricV0r5/hLiXERvrY2RpGznrmJZMY7WXvWgkG8jidDl2ebyoK7VRqyYA7LkiqTb3qhvQkVLnHi0mxAEXlxyViBeYJ2OA90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879695; c=relaxed/simple;
	bh=1PNKH8ntc5kC54kp2fuFbfDzJKv8jvUIR3tksHCBOAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXAca/5ewln0nKi/7ReYRYCRMiuN7IZ3Ea8oFimgiN+veXpB+i55NoQaiJfaxzPl5y3i6qoi3GsAZy8XP5GEG9Qy2ARdNG7uSTmnspkNDKWfrigDdZCraRrg4XGECUlCM930gq8yG8Mjx2hY0qR50ChNZ231X0bh3BAu4aJoNfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4B9AeC9; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4B9AeC9"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-130c9dcbd25so971226c88.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879693; x=1779484493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Web2s5uVg47aYyCtELeKAMQeYbkPbYPk/ttB5U3wMg=;
        b=n4B9AeC9zDx0FEy61vxCAx34bh29XmU3Z5BLbMHLAWE6O/wVfLEQ7FP3ZxbJ1AoO+3
         Q4IHV3iLrro6B9OWZyJ0ySCAfr2ANN3nJAxGRaz1CK03Eoyc8cXXyFDi1p4zrIbByLoF
         G/cWmmNLtCXFwLtotFmS8RwPOGBQ8Im+/5o1GAj6F/uWiCeG+pViN8+NaZVMMiMIq38q
         cMdvzU+l67iNywwvtRHAUcUPuYfZ6kAu9H14D7UOnAwYg1752Zphkw9oNYZwOz3VTv+A
         VXOCI69Ejr5PPmdrz6GB/RqJEsB8H1kWK3SuoRQfFy01STwODufsTeKZq0c9so5S+Zxy
         guMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879693; x=1779484493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Web2s5uVg47aYyCtELeKAMQeYbkPbYPk/ttB5U3wMg=;
        b=lZ9DiB/JASBGGxG3HDw9I8bLS0DPWYUurXqo0R+JDYkJGzdYxFyNQwZgphkF3lfdoN
         rVGNp2RiFDZX2dEpi0c+kJs2a2FNshSaP23P//X1VPR8j3N515xz5XdpRu6Nl8DtWUGE
         fH9pDL6TdZnlVt5Vs5WN+jZmiTPpOZ3c5n8v4Kjf7yFbBhrfzZY2p8oaClIukxl9vbH4
         AVztKr8qMu+J3E9DeQqcMI7zglBXUW1D93fr6j9JVTx1XcMkBxFC2j5MXLIScVvEphYH
         UaUee3idqNejI9IAKlQWtgDsZ77t1EpxO9RrEz8LYumKhgENTaxg2M06MfUVWwjXc+Ti
         pQcA==
X-Forwarded-Encrypted: i=1; AFNElJ/hLqJbDRvJE/vWH8jIKJintMiZGIC7AhFvZhfbVcQE/y4D4s/1CfPiUptTDFHAcgKw72UsaFm+llY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJpcQmx+P4XXbzBXjGjJipjE5/lFazlvEKL/UJnZEM7qJn1f8J
	hP+BgHazCykDMxnRVjgP46R7wx87ZDNty7N7p/slEVai3Fi9vabsbAp7
X-Gm-Gg: Acq92OGndqbkSwATh13+lmegI8x/hJQ3zrpzm3jBG2KhUimHvAznPi++17M3UW8gOkO
	aE5AhcGIjduihxjfd1RXCufjAYG5P8S1kOTUQfaF5ntefspk3jZilNKTyblQqwEbCqJv/fg/B6/
	kVPdcPzMYEV1aYbk8dcaShfjRzFCpacBsd0tma4fTVhbX6SmHyqxKyjHi0lZKxRPdfSqJs+LInF
	eVBsi+TIWDuq71/k1m4jfICh7YRXw8LTK0n4swoJvTBGHGWfOOzm2wMbaOh02D7sussHsBjOPXl
	MhsmQa84HtzmoMaxdbtFWEsGlL2RU+e+GeQRA5xexT4qCU1/0QzCGpnbJKVEFpV/9KsPXnHfArX
	YQ6fGWmlQxzXqEpw2LaCuKa4mrnK7Dp4FwlDR7HDyOALDE8F2Rrmv1TU4lKZ6T6EpvWIMM7DSrc
	xgZZ8iEXFDJaxkHMZ+Hiy0Gjc6o6lL41Y=
X-Received: by 2002:a05:7022:79d:b0:12a:6abf:ab1c with SMTP id a92af1059eb24-134ffe943c0mr2448441c88.11.1778879692592;
        Fri, 15 May 2026 14:14:52 -0700 (PDT)
Received: from mimas.lan ([2603:8000:df01:38f7:a6bb:6dff:fecf:e71a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc3490bcsm9740184c88.15.2026.05.15.14.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 14:14:52 -0700 (PDT)
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
Subject: [PATCH v16 14/38] tpm/sysfs: Show locality used by kernel
Date: Fri, 15 May 2026 14:13:46 -0700
Message-ID: <20260515211410.31440-15-ross.philipson@gmail.com>
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

Expose the current locality used by the kernel TPM driver via
the sysfs interface.

Co-developed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@gmail.com>
---
 drivers/char/tpm/tpm-sysfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/char/tpm/tpm-sysfs.c b/drivers/char/tpm/tpm-sysfs.c
index f5dcadb1ab3c..772c4ae67957 100644
--- a/drivers/char/tpm/tpm-sysfs.c
+++ b/drivers/char/tpm/tpm-sysfs.c
@@ -308,6 +308,14 @@ static ssize_t tpm_version_major_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(tpm_version_major);
 
+static ssize_t locality_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct tpm_chip *chip = to_tpm_chip(dev);
+
+	return sprintf(buf, "%u\n", chip->kernel_locality);
+}
+static DEVICE_ATTR_RO(locality);
+
 #ifdef CONFIG_TCG_TPM2_HMAC
 static ssize_t null_name_show(struct device *dev, struct device_attribute *attr,
 			      char *buf)
@@ -335,6 +343,7 @@ static struct attribute *tpm1_dev_attrs[] = {
 	&dev_attr_durations.attr,
 	&dev_attr_timeouts.attr,
 	&dev_attr_tpm_version_major.attr,
+	&dev_attr_locality.attr,
 	NULL,
 };
 
@@ -343,6 +352,7 @@ static struct attribute *tpm2_dev_attrs[] = {
 #ifdef CONFIG_TCG_TPM2_HMAC
 	&dev_attr_null_name.attr,
 #endif
+	&dev_attr_locality.attr,
 	NULL
 };
 
-- 
2.47.3

