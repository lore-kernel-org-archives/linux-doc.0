Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C2266C4
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="HPZbp6wV"
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61859118
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 09:20:34 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so7285599a12.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 09:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1698164433; x=1698769233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRO+xCDaQbDKnIXJCwBi3Y2yF65udPG/2rEKc0aYwBQ=;
        b=HPZbp6wV4cnVc9Z93xaS5+8Nvr3Fr52HYuvzwmmozvKm81NPDNF5a2is9H/tmS/F3A
         J91pxK26nNjWyUgCHvrHOINISafexowDu/Gex1AvyOp0hsJJLfuO1Ooma4XPP8ki9MC3
         ALCj3tvW6Y9uoGfuNGwrRvBEwMbsXmNHXdyeS5J4dUFgB1vsU5CGp4ks8gC0izwsbhWz
         h5Xsbv2M4WTKAcCEEYvCmSj76WGY1N6YeylKRMhyHFYioTU41B3HdlFQXhVE5NNzLUBF
         ZSJvzsz1lFt9jTFDrTDqTf+PSR3tH8Ln5M3vR/oFqUrok+zR93EDN3YZ03yQz+otJLZv
         cZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698164433; x=1698769233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRO+xCDaQbDKnIXJCwBi3Y2yF65udPG/2rEKc0aYwBQ=;
        b=IHeixEubmsNFLL0Js4pq7nfelEfelUiYTMP0HTUMNrY2IeGCmR0UQ3dWA/hFTwPgto
         p2Pjr22XlzsC0aTzbHuUC44f9p6GQwX4973V0KsRmx2LcOglpyRJm6Bft3syDka/EFkr
         /PBILe7zuYDSY8ns+tCUFg37mwu5O9F6cJVLl7kOXe8LNFg8FXrUSLEu6G5p4o8QECYq
         9h4O3YjXr4ajDtgL82bZFK09s8rEGmvsOKm8ceMun+8zB7ceujGdus/eLz/fPzScZhwL
         fpqEoeDoEsVf9tEeX7UjiEHoBO6uVpsLjm9fV3m7s/bndRPyl3uggCOkBrxFaexZ2WJ+
         xUMQ==
X-Gm-Message-State: AOJu0YzigT5g19qlSQtPuqMDFwkfCUTCYEH6JVrbOaf2aFJr8ls/XIAL
	MRMT+Flk6YGAuq3TRGJ2ZI9HRw==
X-Google-Smtp-Source: AGHT+IEIk3iJ6GCsHRYMeMdo8uw1QNTL6gntpg/5SaGUAZHqkqQekLyT81Tgpt8fo9diZdiabupYpQ==
X-Received: by 2002:a17:907:c0d:b0:9be:8693:66bb with SMTP id ga13-20020a1709070c0d00b009be869366bbmr9625930ejc.59.1698164431055;
        Tue, 24 Oct 2023 09:20:31 -0700 (PDT)
Received: from localhost (clnet-p106-198.ikbnet.co.at. [83.175.106.198])
        by smtp.gmail.com with UTF8SMTPSA id cw11-20020a170906c78b00b009add084a00csm8489556ejb.36.2023.10.24.09.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 09:20:30 -0700 (PDT)
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
Subject: [PATCH v4 0/5] DCP as trusted keys backend
Date: Tue, 24 Oct 2023 18:20:14 +0200
Message-ID: <20231024162024.51260-1-david@sigma-star.at>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a revival of the previous patch set submitted by Richard Weinberger:
https://lore.kernel.org/linux-integrity/20210614201620.30451-1-richard@nod.at/

v3 is here:
https://lore.kernel.org/keyrings/20230918141826.8139-1-david@sigma-star.at/

v3 -> v4:
- Split changes on MAINTAINERS and documentation into dedicated patches
- Use more concise wording in commit messages as suggested by Jarkko Sakkinen
v2 -> v3:
- Addressed review comments from Jarkko Sakkinen
v1 -> v2:
- Revive and rebase to latest version
- Include review comments from Ahmad Fatoum

The Data CoProcessor (DCP) is an IP core built into many NXP SoCs such
as i.mx6ull.

Similar to the CAAM engine used in more powerful SoCs, DCP can AES-
encrypt/decrypt user data using a unique, never-disclosed,
device-specific key. Unlike CAAM though, it cannot directly wrap and
unwrap blobs in hardware. As DCP offers only the bare minimum feature
set and a blob mechanism needs aid from software. A blob in this case
is a piece of sensitive data (e.g. a key) that is encrypted and
authenticated using the device-specific key so that unwrapping can only
be done on the hardware where the blob was wrapped.

This patch series adds a DCP based, trusted-key backend and is similar
in spirit to the one by Ahmad Fatoum [0] that does the same for CAAM.
It is of interest for similar use cases as the CAAM patch set, but for
lower end devices, where CAAM is not available.

Because constructing and parsing the blob has to happen in software,
we needed to decide on a blob format and chose the following:

struct dcp_blob_fmt {
	__u8 fmt_version;
	__u8 blob_key[AES_KEYSIZE_128];
	__u8 nonce[AES_KEYSIZE_128];
	__le32 payload_len;
	__u8 payload[];
} __packed;

The `fmt_version` is currently 1.

The encrypted key is stored in the payload area. It is AES-128-GCM
encrypted using `blob_key` and `nonce`, GCM auth tag is attached at
the end of the payload (`payload_len` does not include the size of
the auth tag).

The `blob_key` itself is encrypted in AES-128-ECB mode by DCP using
the OTP or UNIQUE device key. A new `blob_key` and `nonce` are generated
randomly, when sealing/exporting the DCP blob.

This patchset was tested with dm-crypt on an i.MX6ULL board.

[0] https://lore.kernel.org/keyrings/20220513145705.2080323-1-a.fatoum@pengutronix.de/

David Gstir (5):
  crypto: mxs-dcp: Add support for hardware-bound keys
  KEYS: trusted: Introduce NXP DCP-backed trusted keys
  MAINTAINERS: add entry for DCP-based trusted keys
  docs: document DCP-backed trusted keys kernel params
  docs: trusted-encrypted: add DCP as new trust source

 .../admin-guide/kernel-parameters.txt         |  13 +
 .../security/keys/trusted-encrypted.rst       |  85 +++++
 MAINTAINERS                                   |   9 +
 drivers/crypto/mxs-dcp.c                      | 104 +++++-
 include/keys/trusted_dcp.h                    |  11 +
 include/soc/fsl/dcp.h                         |  17 +
 security/keys/trusted-keys/Kconfig            |   9 +-
 security/keys/trusted-keys/Makefile           |   2 +
 security/keys/trusted-keys/trusted_core.c     |   6 +-
 security/keys/trusted-keys/trusted_dcp.c      | 311 ++++++++++++++++++
 10 files changed, 554 insertions(+), 13 deletions(-)
 create mode 100644 include/keys/trusted_dcp.h
 create mode 100644 include/soc/fsl/dcp.h
 create mode 100644 security/keys/trusted-keys/trusted_dcp.c

-- 
2.35.3

