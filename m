Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32167286417
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762134672; cv=none; b=uCVarMvLekfUy0iqwc7Hg/DLKtPB3cfihQf7cLL+P7LotIGPPXpcb/nMqud+veo7H8R/czfC2fwbebScdlFbsZesryrTwJl4cr8h2YjTkJ1k2DKEWT8l5yhznnPNRF1DLyEeGeuJU//d8EmVdLu7ZS9pA+SrC/4ZYVaH1wHDP+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762134672; c=relaxed/simple;
	bh=Ah+90vlkgOlUyyughdO7zNDVG97YW6CBrkKD+MNo5DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9KFl9bf6htcgyE+8n+MYI569c6ltFh4zVtKk8W1GSimDcioENug1xnE9Pen3KvtsoKshBX3V+NPG9bWh0ERRvvH/GnblKMYzBKy1vpfyQwpTgZT3SJQdctP1DH72kPgErq495FgkEqYxOUS+mUXzzCzgwA3o9kxF8gcMdHKdWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gs5/sJeh; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gs5/sJeh"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-340299fe579so4065724a91.2
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 17:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762134670; x=1762739470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkKTspHYmfWOFM70ifYk5p3S0g4HpZnFTv7ED0DZ6vo=;
        b=gs5/sJehjPczAUnPl5UQKi8WXsYjITxRso2HCFjwADgMp6z8WLd/+AZ/MAGDhpJdDg
         x7fh1P1WchoR87r2ziDAuiGIj3emFPjeE6RldggqqyoyeMC8ZFC3BH/JNn9yNzbJTEjx
         x3J9ryWtnL9g3fHGCl5dvH/vmJyqU9QaHen4V20yprCPVBZqoy7Rz/06zcJitVwMeAkB
         DwLc4Oy950E9ZN/96RqtXEF2K2KJZQzqIpnJDHQ02aRQ13+qKFclNYI5J6evXvGR73Sv
         Cq40ayyJunuOxwPLpfTDs4pfSo2mX/DMWUMiUBYfABaOtDtm1hEd61n98OVmrQo0E+ua
         9XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762134670; x=1762739470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkKTspHYmfWOFM70ifYk5p3S0g4HpZnFTv7ED0DZ6vo=;
        b=UAL/NosZt4a32zgKLhw4rEHyWz5O5z8Q9tYiH7cfKSXRX9vvLWjaJUeUi12pgz1o11
         qHWoZNInxOJxt8rCBTnKQEKiuqYQ30jSMZKZyE5j7KxXh/n+Yp3Q4zkQkg2f7bknKK7L
         pQZ9q/cfvSqYZjvl6R1ysJyuLi+v70fJcBOSCU4yj70l1mJTNn+ncpW1NbF60rc1RWK0
         bV0nUoqHY8aWEEbsESeN7vZHQd7aqekzcqHLRMODXJZ0o6K63R+uqlRAv6/t2ezmiJ1W
         Jo5TFaoQ+QnmGl4RII92ibsGD5VvjCwiVRCLEbPOjgad8c9w+Z47RvSePaeQh9CR1kvn
         GgIw==
X-Forwarded-Encrypted: i=1; AJvYcCUqtcqMsKFpbnFfKoS69TEFEj4IzLYZWRFAt7AcYb7GT7ibUuW8oR2gdLtRk6LcV9r5/22sude9RT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Jr7xlci646UtHxCqYqpbVvKra7UUOeCI5rokjb3+3GrJHNAw
	fdyjvQi3sZHTyCYC7HaZQPwgG9lD/Jb4GEb2Vgb9hzYgGspkZZ6XupBsvWZ0iDMuixQ=
X-Gm-Gg: ASbGnctJEt3P29toOZpuQ2mNgi2kW5zJB0J0U9sUCr9iNuf2jSxGvlm8433qABmiX12
	JBufOrEV0N0RV23cdyL6InKm2+48BOQWEd+U7Fcle5WPZRAO7Gk1Yub7K8U5VLEE376H93srur3
	lSfoFtDMvVkWQIzoyaZq1r0VutM5SFppG+VDAyaZtMHV3iBGPgh2Py0Sx30Tn2x6S++7g4HXcUJ
	6AjD2S7R/17+8eAUFN6tAJadJlnQ3Sx4GF5zcPT9I3ec0VPo1kVYv/vVopgjkx8EUdrCGodDjCR
	kYnyjrgNM/kmUbT1cVgDUHjz12ghwqfFu0uwu11PdUGZF3TnNJgQvwszQOt2uH/rwpelHlh/8XK
	fmNobtfoHrUC9F3mTWjZTxjsa7ma6PaSQWhjscmWQnnYPyRxCfJ8Wo1yyx+xlYGaVLa6RPcW9xe
	03XVRFEqVYl9E=
X-Google-Smtp-Source: AGHT+IFYqMxHMvi7lUWfNqiIwVN9ffiabVUjelb6YerJOXj6/2jPKUMtAkHCDHXwBoUur/VvjPugFw==
X-Received: by 2002:a17:90b:4988:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-3408309d2c8mr13142947a91.36.1762134670266;
        Sun, 02 Nov 2025 17:51:10 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f096a44sm5613194a91.2.2025.11.02.17.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 17:51:05 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 307594264564; Mon, 03 Nov 2025 08:50:58 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next v3 5/9] Documentation: xfrm_sync: Trim excess section heading characters
Date: Mon,  3 Nov 2025 08:50:26 +0700
Message-ID: <20251103015029.17018-7-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103015029.17018-2-bagasdotme@gmail.com>
References: <20251103015029.17018-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=bagasdotme@gmail.com; h=from:subject; bh=Ah+90vlkgOlUyyughdO7zNDVG97YW6CBrkKD+MNo5DQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkcnJVHvmWefnGBd8VN1e3bu5JWGZapP8nNXGlrtbHL5 sv7d68UO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRk7cYGa5zpr1bm2BmGtXP VCEqIXdXuX3r9GWW/w3eeYvMWfXEfhvD/yhNplrRWYnf74VznTz9au3KA5O9dCetcV1rafOk8df GBnYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

The first section "Message Structure" has excess underline, while the
second and third one ("TLVS reflect the different parameters" and
"Default configurations for the parameters") have trailing colon. Trim
them.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/xfrm_sync.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/xfrm_sync.rst b/Documentation/networking/xfrm_sync.rst
index c811c3edfa571a..de4da4707037ea 100644
--- a/Documentation/networking/xfrm_sync.rst
+++ b/Documentation/networking/xfrm_sync.rst
@@ -36,7 +36,7 @@ is not driven by packet arrival.
 - the replay sequence for both inbound and outbound
 
 1) Message Structure
-----------------------
+--------------------
 
 nlmsghdr:aevent_id:optional-TLVs.
 
@@ -83,8 +83,8 @@ when going from kernel to user space)
 A program needs to subscribe to multicast group XFRMNLGRP_AEVENTS
 to get notified of these events.
 
-2) TLVS reflect the different parameters:
------------------------------------------
+2) TLVS reflect the different parameters
+----------------------------------------
 
 a) byte value (XFRMA_LTIME_VAL)
 
@@ -106,8 +106,8 @@ d) expiry timer (XFRMA_ETIMER_THRESH)
    This is a timer value in milliseconds which is used as the nagle
    value to rate limit the events.
 
-3) Default configurations for the parameters:
----------------------------------------------
+3) Default configurations for the parameters
+--------------------------------------------
 
 By default these events should be turned off unless there is
 at least one listener registered to listen to the multicast
-- 
An old man doll... just what I always wanted! - Clara

