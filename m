Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B060A4500D
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711527924; cv=none; b=pPqnxszpoDLMcfwzMauPgCGo5rh9tIN0lFXbiTkb2mnFUudujc1IL7eIvpXZ8wLlaV0CDtmQGAyflD/xOsBTfOdwDihRKRZRGmSAPOhlMlQUy4tCHiHGwqQ64ZUJaJ5fOOa+jSok25TgVmcFVQfViOYwOPhGDdo19LiJ3NPWB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711527924; c=relaxed/simple;
	bh=Khyeg1/xj46k+x5xR7s8vWgC8Y2GcoM7MOqDayZ6owQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkvkjzZTJap0w1TcO8soCEG1fMshAA4aihVEVk6pl3ObskITVNUaPciKvmdEbgaxSjIHFkle8iaUCOHKo6aYD41x+2Ww3Jjo2t8CKSeOTWFV6aEoBKX/tuAaqESBql7WZzZS1+EcfxuxFp+hNzJwNslAz+R/Zs7xtGa+LtIguAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=jilZifSA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="jilZifSA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33ed4dd8659so355910f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1711527921; x=1712132721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=jilZifSA0iN1SrolUjvpXuZdUSREt4vOG1vvZElJI66kWn1c0UvRC8J3xuMfE5j/EL
         r/UEc19EbP4sNVB6jQifBOeiBpJyFCDUrl42iWZqrzAUyIkUkuCv+UC5CFmFPUqzjEL4
         V8o81v7roOSpTlR+/hFd3Andy0ieNvp572SnFsmSq5FlJI8g7Ul7K+HZTz/BF41XnC8Y
         CVenx5jOnSZwTUTKVJXLLyE9LivIoqfaX3IpLc3HtNX9XViH0Y7Vbi1EtjDei1542onX
         fvqFPMsayTMNz3ZBVucyjzLbQrV1yTX/L5kozBLcceVf6rhhdvwMu49PpM5dmm981owA
         9auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527921; x=1712132721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=CWdKaT/pTrLAPGaciSRTeeC+KyZ77yp4bxVc64ea/Xle4nTWTlSX9RUydIOY+QSCSz
         sQCpniGQobd/mdn9t/tAk+0lrHKCag78uJpJnyujx0l3jCFUyMoSKJsoLv0NJbTFo/KW
         r71Py/d29SyddJmpQ0jH7/QTy5gu2QNNWGONDSzSscxWGAmM0/LvCh2viT1BeJCLP4U/
         KnIQOHtgc55+ZxAteL5NeMnVNZmC6YP7ghTjFxXqrRGuW42XXSXcsvb90Qo2GjFxCSwQ
         DgLp8ZysF/RzS+EZwZz0JFXL15BvUUu5YVlLsc4yuHOs0LdrooPXKLTv9s1Fa2V1rRlM
         cWfA==
X-Forwarded-Encrypted: i=1; AJvYcCV2JZG+ljTKo7NU0Rr7mcm9zq68rtletrN4kilafPeLx8vZ4wh2md/7GB8HG4HQckUsLY3N9xQl5sjkwLtAOn/F35Tj41vg5eFV
X-Gm-Message-State: AOJu0YzBioLVa8M1oCQHDVGs0TAIdLHyALk1KUZreFjHm5J0Vijnn2Fq
	6seWyEZhdT9O0ZlHK7rMxMH7j5BXe/tO3xUKMTFrd2xipY0MJwH1DkNiNjpKCSk=
X-Google-Smtp-Source: AGHT+IEi6DJCe+eRQesc9WaCfXzgJ1OMWtJfkq8NT9bPs2vNWQls9qa5Cc9KIdoWDe4T00OA6qEG8g==
X-Received: by 2002:a5d:67c6:0:b0:33e:764b:ab17 with SMTP id n6-20020a5d67c6000000b0033e764bab17mr3298532wrw.14.1711527921136;
        Wed, 27 Mar 2024 01:25:21 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id cl1-20020a5d5f01000000b0033e72e104c5sm13308800wrb.34.2024.03.27.01.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:25:20 -0700 (PDT)
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
Subject: [PATCH v7 4/6] MAINTAINERS: add entry for DCP-based trusted keys
Date: Wed, 27 Mar 2024 09:24:50 +0100
Message-ID: <20240327082454.13729-5-david@sigma-star.at>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327082454.13729-1-david@sigma-star.at>
References: <20240327082454.13729-1-david@sigma-star.at>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This covers trusted keys backed by NXP's DCP (Data Co-Processor) chip
found in smaller i.MX SoCs.

Signed-off-by: David Gstir <david@sigma-star.at>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 976a5cea1577..ca7f42ca9338 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12019,6 +12019,15 @@ S:	Maintained
 F:	include/keys/trusted_caam.h
 F:	security/keys/trusted-keys/trusted_caam.c
 
+KEYS-TRUSTED-DCP
+M:	David Gstir <david@sigma-star.at>
+R:	sigma star Kernel Team <upstream+dcp@sigma-star.at>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	include/keys/trusted_dcp.h
+F:	security/keys/trusted-keys/trusted_dcp.c
+
 KEYS-TRUSTED-TEE
 M:	Sumit Garg <sumit.garg@linaro.org>
 L:	linux-integrity@vger.kernel.org
-- 
2.35.3

