Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECED236435
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 04:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762229917; cv=none; b=Wkth0f8dUiaUD61MVVh4ZMBXzdd3zZnF+lLEHtxosOJNIJiGFcncNY7wuEHSpiSt0F5HheU92T07vOLIm2GQY/9ethzASvvSbKpNB5za7y7zI/B2HsdqNwKO+yurd7E1ajRVfQSrLAImKTgFdYYUkdlZdVp4t0k+/jPv/dmPV6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762229917; c=relaxed/simple;
	bh=dkq+RvL7b/Ae8SN7CGP0P7Yyg1vA6IJXameoflMj8SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXrH17nPPavJWrKeLvBlUkZJVw2zVXKrZ49/BMR/9M4mrtEweIhjOwKlRrL0JnzbEeMJxpSruI4uGtCHe4/Y9Gff41jiAKAvVGTIxjupiXdUej2OKV0/Vt8sytscBzeWSThhkJKiglNVE6t6qOeIHsNqwaPNgAkpoTEH0cZui4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKvBJ4ts; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKvBJ4ts"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-294fc62d7f4so47640825ad.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 20:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762229914; x=1762834714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JN2qq3QJz2NzjQKddskVJ2RK0BifliazhC0FNW2qn3M=;
        b=CKvBJ4tsN6/wC1ijRblgv0KZ5k8QnNQvqE2HiW7wnpqZTdwioDypMOVrm5+f6L4F3S
         wKg8ttrcShpbqmY681sbg9Bnh1nkkG5gPGggpI66kNEUbuV7J9+R2Vaq1wraAiujpiZg
         XzgdJTuYvJ4KPwdoRxLqBwb+sR/mSbLiZamYFmQ3BGjEVO+YfseP9ynQ0C6e/OpxuybX
         WRHF2VaI9d/8K/SPL38vFH86K/S8d/qMJ4PPo9thRGTCNx+d4G7/eHwIN6Pm3gxG93Sn
         FfvO6niANbB9qq1lMExvxpVZ3WT3k9boGXjcRo/cyCVTf7ltmT5D0ENb/psULRfvzf4J
         k3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762229914; x=1762834714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN2qq3QJz2NzjQKddskVJ2RK0BifliazhC0FNW2qn3M=;
        b=jjUDRRv0xU2gTf52kBGKSNeKhfTlWOAFdYzpVAonlJ8GXiIj5kdbV2vBX3W9YzKUyj
         9fnKDJ3Amcddpv9NZfQ1rF4VLPtNayZNZ2ilB5ifczcLcds6H0S2SmHhQ/PkxSp4/n02
         LmOQsfiFn+OjmmWSA2wLklPoqYe8vOktU1eQwTA6oLrjAQrdABYZ5pJbIy4G38Mv+UNJ
         GN6J5Dq/oD26kjKeOZuuDUde3WzA1gp4FGIYPKUQnF/UoMMMoc4JXm2W2nYO+v+oSmoh
         0MYO9zGUlP/kJqpYlDCw0gYw81hAkf37uRx/THlHrDTrhxhMp98HPE46jNYm/CJvGSwS
         Yb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMtD0M9WG0mibVKrXmDLoGU2jsaflRJwADaJilY/jjU6jWUewJrA2BwMGtomoUYtYkwC0dwAOeujI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj/dP0PwI0G9PsPHIvfLAlEp3aRIWdg42X7sk6CJ8yU4MoNo5M
	qlpy4C+rsZkmRhLH1roLE56UmQVjhD5l4xxNCYZol+uZ2SjNdMfO8UH2
X-Gm-Gg: ASbGncv83QbokZOk5dIjLGWRpzcscPiH3RocKR9q8ZhTk/SKTG6rTKfeC/hAhMThLjb
	jC/bb3hYZ2C1zQQPI6h7nbVATFrlkmoRiqZUNnhmvTMfnEMH2P7yjETpEQh4RBLBFcRg7yaqs0F
	BIwxREQXB7iaBrpvlL8jpeJawUg6102AmlXjrV7aBll9LXyAKroOKIiuxcF0SPss18EJl2O+RTt
	znEDlGVT4h1Z8v7fK4DIY5pXj4vCcQ5PZ5fHMR3eR4tgz2uL+UfMuLgFhook8nh7edq2DIHoM78
	Fg0eG+m2BgahQ4GiIrAD53lAlbMxsewcr7YANI/t0LTp1w42DtjLgcIEj0tDcdvzJ1pKAw2/1WW
	ErMbqbwFthF5X1nn0arvOi91cQdR0xd+iWC0i7bMzJm0jXsZo057xAEPQ1mkkAiZeoFLOKH5GZv
	/C
X-Google-Smtp-Source: AGHT+IH+EMKAausenQ8kAFp5x5r/CTC+PSNJXXfM/vATia4MiFczKfBPGKYMlWDXxWDamA2mfNcg6Q==
X-Received: by 2002:a17:902:e842:b0:295:5a06:308d with SMTP id d9443c01a7336-2955a063493mr122406785ad.14.1762229914413;
        Mon, 03 Nov 2025 20:18:34 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417bdc53d8sm564454a91.2.2025.11.03.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 20:18:33 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C8F0B420A6EF; Tue, 04 Nov 2025 11:18:21 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Akshay Gupta <akshay.gupta@amd.com>,
	Srujana Challa <schalla@marvell.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Julien Panis <jpanis@baylibre.com>
Subject: [PATCH 2/3] Documentation: mrvl-cn10k-dpi: Fix macro cross-reference syntax
Date: Tue,  4 Nov 2025 11:18:11 +0700
Message-ID: <20251104041812.31402-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104041812.31402-1-bagasdotme@gmail.com>
References: <20251104041812.31402-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215; i=bagasdotme@gmail.com; h=from:subject; bh=dkq+RvL7b/Ae8SN7CGP0P7Yyg1vA6IJXameoflMj8SI=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmctYzTHk278c88IoWJMeQal7HWmsdeM+PS1jm8mzDzl uPjo7M2d5SyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAi0bcZ/pknrsuofrz3rNLb ReaStys953Tcjuhyj77ZV1OUUtav78DIcONLvNRpu2ydJfe5OZ6d556/8fkhF6GXi2PmxHwqTo1 8zQ0A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

C macro references are erroneously written using :c:macro:: (note the
double colon). This causes the references to be outputted as combination
of verbatim roles and italicized names instead.

Correct the syntax.

Fixes: 5f67eef6dff394 ("misc: mrvl-cn10k-dpi: add Octeon CN10K DPI administrative driver")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/misc-devices/mrvl_cn10k_dpi.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/misc-devices/mrvl_cn10k_dpi.rst b/Documentation/misc-devices/mrvl_cn10k_dpi.rst
index a75e372723d860..fa9b8cd6806f14 100644
--- a/Documentation/misc-devices/mrvl_cn10k_dpi.rst
+++ b/Documentation/misc-devices/mrvl_cn10k_dpi.rst
@@ -33,12 +33,12 @@ drivers/misc/mrvl_cn10k_dpi.c
 Driver IOCTLs
 =============
 
-:c:macro::`DPI_MPS_MRRS_CFG`
+:c:macro:`DPI_MPS_MRRS_CFG`
 ioctl that sets max payload size & max read request size parameters of
 a pem port to which DMA engines are wired.
 
 
-:c:macro::`DPI_ENGINE_CFG`
+:c:macro:`DPI_ENGINE_CFG`
 ioctl that sets DMA engine's fifo sizes & max outstanding load request
 thresholds.
 
-- 
An old man doll... just what I always wanted! - Clara

