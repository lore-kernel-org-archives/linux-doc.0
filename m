Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECDD25A645
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760111282; cv=none; b=IU4e41WpUxwWdOuEsjnQuddhgS6Cy8dgnEuq1qGeGnFWHtkWH6N4zEjBDFkrE0Mm7XFfyNBmlHIFNe5ybNzf8FOJms08VATBj38OiF8lBm7HQ7No5Bm4K96PgVv5GNU/eogQSeMUXdzl6UYbC1ZNoREqX3rLI9eTYSJO/R8Arbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760111282; c=relaxed/simple;
	bh=NdsUvpJDpi+f0utptiH48+P8qxTjCKD1BXdBqHb5OLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrA2IZHg6GKu2aAAALtiX1aS7ydu2XnqlDl8Wz147yP17xXSBCPWB6B4jeDmA+uGcPtcQ0baq+xRSDraymLeO7X33dhPJ0eWndK5sABfEKJ0gwt7O3ZxeahaEKmGIzMvbEVkI5hrlQPG8Wn+GjxPK9l5BjP550VskqNqRftwrOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bibn0VuR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bibn0VuR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-26a0a694ea8so16321995ad.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760111280; x=1760716080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVrsyEiFlMWkB/upPN4SEiDIc8/lApQ9S0UUM9Wa5uQ=;
        b=Bibn0VuRo1gZ1Ith6+kwbMQxRF6QJO82MZ61cWDTgQ0zR5kc82761192OgOYQVDdf5
         FSjvU8NTpGPcguygjMc8zxB32iZFmGePFDCc6rfhTuQ2nkDI/0ehO+M9GalPGJZB/nde
         zauySeYNGccs8gPBMzVnvYXdfuN2+98Aqx2sT7LXKfD7ZPQfqzmlwfBYeWLFnBUgFm8p
         29VRElBHTnqn8xnsuYJPi6A8xnIup6C/2pF0NImKCx2TFlGdsAYrwUKEHCZ9RRhk546U
         Q+5G1e9A4WCIewy5KW04z2U4+/QdHYlDtH3+uT1rsdu0sAyVxe4rIfnnql+NNPKaOLLj
         fHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760111280; x=1760716080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVrsyEiFlMWkB/upPN4SEiDIc8/lApQ9S0UUM9Wa5uQ=;
        b=QL4RbZR3SELGAWREBtBjBM4g3kGb7Op2zBUbmHbW42nnuTaQnVxvA9SjZCvuBqMFJJ
         aQ6GGEnnNqmLkh5WSVsFtYNX+EgcixNXCmiFTNtXBJMHBAFLfc4iEaMhhTPgH60mmMVE
         x2Al4p701IbxHa4dKZtCrqOu7qAggYSfwtSWYV9CxT61IkJ2P1S4T1rc94ICsY3lRiSQ
         0NlL6L08xRYJND1MDM02nCGA7EfPxJvn2RRQ+YvFwcg9WkO2bedQe+iyC7gUPZj9g65O
         8EEyeFtBVNWJjzq/ICRpp8E8cKhKN2l6sY9pB2qDKPAF7WKdXlCwK7JeDCNkigXlTtbU
         Q3/g==
X-Forwarded-Encrypted: i=1; AJvYcCVmZEsEv5HNy2GEofBSLS/eKOfgf0XhlGoPbMQEu578hRaSZ56E/4rAYKwEKnEKzwD4DQo6TjLOcXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJSTeBeDSJ1vpLFgml6kGjZS7fSnw6Xc6EgVKxVkesNe3bqN0F
	VzRy8bdwGehc8sBE6QMjv4NK6j4CN6cyTVpR4jtvxf57NbK/2XRNq1Z3
X-Gm-Gg: ASbGncuPvSQdo8E98kpiofBxeOYvVTVNbD6TFv2tTRX0uzgG/RX02F9u2BNf1Av5kdl
	wL/uFMUn0J5zCBU50qYB6qsvu3Ec/Nb/GXwm0XFanlTX6jTfE7IlOlAAvMzyEpwL7qdus5DGO1Z
	7/QnYPBRV74CHNNVUo3NkOTWA1I3PvFPK9rdV7MbN91jUEiC1bg9UXJnxUlYeW4od1mFFoUcbEM
	5nMQXcztwePJrxoY6FT5+h1U09nAKNmcfLMpn2lDCgT0Conetw5S69bJ5Ad9DAQpxj4gyfCYH1k
	vB+PjsND1BUqlyd3zzDkH+HTPvFStyxdFcWhcvG3Xotfw8QBkFScoMfKy3zgrqNqDz6iEdumz63
	V51P81NaDbIjDyscFQsn/tRRBJVnSfE9p29Q/
X-Google-Smtp-Source: AGHT+IECq+NaLToeqvLCJlAHobRhWtoU2tfGHlHLrRwiIikFaVG8MgZK2PzLWaGJXCNyUhyUAiHnRg==
X-Received: by 2002:a17:902:f608:b0:278:9051:8ea5 with SMTP id d9443c01a7336-290272b340fmr165277955ad.21.1760111280220;
        Fri, 10 Oct 2025 08:48:00 -0700 (PDT)
Received: from localhost ([122.171.19.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f06c82sm60691875ad.81.2025.10.10.08.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:47:59 -0700 (PDT)
From: Divya Bharathi <divya27392@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: ebiggers@kernel.org,
	tytso@mit.edu,
	aegeuk@kernel.org,
	orbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Divya Bharathi <divya27392@gmail.com>
Subject: [PATCH] docs: fscrypt: document EFAULT return for FS_IOC_SET_ENCRYPTION_POLICY
Date: Fri, 10 Oct 2025 21:17:53 +0530
Message-ID: <20251010154753.19216-1-divya27392@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Divya Bharathi <divya27392@gmail.com>
---
 Documentation/filesystems/fscrypt.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 4a3e844b7..26cb409e3 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -729,6 +729,8 @@ FS_IOC_SET_ENCRYPTION_POLICY can fail with the following errors:
   version, mode(s), or flags; or reserved bits were set); or a v1
   encryption policy was specified but the directory has the casefold
   flag enabled (casefolding is incompatible with v1 policies).
+- ``EFAULT``: an invalid pointer was passed for the encryption policy
+  structure
 - ``ENOKEY``: a v2 encryption policy was specified, but the key with
   the specified ``master_key_identifier`` has not been added, nor does
   the process have the CAP_FOWNER capability in the initial user
-- 
2.51.0

