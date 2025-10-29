Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC7332ED4A
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726394; cv=none; b=SXGXUm7WqtuchjvEx0El7TKmkP3myWVuHaU/Keoeb7a9fYbXpmdLFP0FtZOTh83K8229zcoHrRdVG3slUmLqydi9BodHVw4lIX+ckUFCctrNwXNSjrBdcVTTMCPHQ6glOOjqd/cAuMDJ8R5sFJDg5xBh3yM29Q9nbBcY3qqbIBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726394; c=relaxed/simple;
	bh=sF2dC0yEoZfqsMqlw23WcrsBb8sQVqBQWtlJoeU/pAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzktLAUd4xfFx+OIg04Geoxzsa50y5idUXMcxQOTOsUFqsFkh89rAgWoNZyjG2s02Ze+8m1PI2IO4kuuFdV/wo84R/DqIkk7dvNm//6jsa0/P2QoYdAQuzcplmqOEwb2uA2JCGTdoqIcJTMYM4VRfDiy1QwMFQRSCRN3t9wPFQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhOUqMRB; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhOUqMRB"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso1005124b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761726392; x=1762331192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn0tHntcIm9TXsQwef8sNUxYfqf9R0uILDPExZJh0QE=;
        b=AhOUqMRBS0xyASLrnCRYf2ZPSq2eR/Raby/ourfh6kYxEsV7ujJHtGrmXM+ULGpxqt
         rT3kuYxau9VH8bVDKI2NqtsgnebKxoRrMdVBgGd2DCPBHlLeIXWRg64u3Jehw28MOyOn
         KfhTzGlXHSGMwcaHkaIUhJ7j/v766QFjOdjBRAqcelELGsVsfRb1KCf/jCGwokFoHMSM
         FwlBEvAuqYdBjkKVgmIYPwYArQmPKeoC9drjm9nLGR3LFBmTw+1d1f7UKtlnO+0EDCWi
         Yyz58rdzOHR5blTztCaZpw4otDtfDWzegKjf8tnMlmb3hJXHh0RARiXpkKZpt7rCjSW5
         5nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726392; x=1762331192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yn0tHntcIm9TXsQwef8sNUxYfqf9R0uILDPExZJh0QE=;
        b=bjLuqsj01F7U77pKevi/RXi2GPYl+6Ed2RGhNMs3VHdj2pg3J59egSD0ioJAnINjHY
         nBgwMwSxheOHgFwdZPHYV2DZm3rN/ynaF24j2dT3eEjLWdOFqwLchZJIfxZIQd/rtlLt
         sNlS6iugBl1OfhPY+/x1uX79YW/ymSfwxChR49MQQ9XlPAzZOSRkTQJq27MvLWJOkpY/
         l/HX5GsfpbQBtqkGbDRTequsoZGNUhxoeMyLe4HWNxpOIIdYeLscHV+9JAtv4WYi0RWy
         qG4ujoKi7/zpN9W2/onAJfRXO1AembHpod05gxRp7gUcSsaRKJJWhLqA3B/b6SNbkvEJ
         NhLw==
X-Forwarded-Encrypted: i=1; AJvYcCVFB6CR6dp+CTSJw7k8GpFDxBTTZ0obSsSeDkDWx30P9iIqcotlvwXfA8ZW2m9tjyqTyl/hABQkmpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3p8nKCZcZUfXLZbMhq1rt70xo8vcVHprycNYIiasMBRLhEQO
	gWV+fPVV3CtT7oo0JYCFBCWcjpTiOSdgQhNWwOSkD7Roc9hcBndGHn6Y
X-Gm-Gg: ASbGncswMe76iE5c6lwEgB2zlR1wTYjZfoQDKhejPGXx+8jO5Ifk6cpCXuqVQCSzcoN
	KiTXyaRHKJ1bR8z2K5jDlczHnNIw1SanKp69SDlFLbwdlL+8rC04hnu79baOC84MIPplQenWodn
	oreqzEZ2iXa47t/XAZyxNbkMBMJXXvkH5/83DzcuhA13k5mBizJEybDMXX1ZNms2f2iufVu+qsD
	sZ8bWkZWpzEtU9ndC7pepKcHQLpKxGChJqui1Cf8WjR+fzAQzR6sgNvXmbAggr5fBm29PYZ3XnI
	IqAo1jIZvjZ6X/3bVVvmVkh9Uxs1F1hE4bYzsOV9TuidAPTKMHXvWVnXSthXZ3Ee4hy5GNBUj4d
	kac0pad6atZtSN4Ptxj6Coomu4e7QqDMlq3KuRlJO3Tqhzeq4beTLnQ/ABzn8zrpkNnai5UqFrK
	Yoi2LXbaMH6DM=
X-Google-Smtp-Source: AGHT+IGaPtjJNURBFreVhHociDTVO8Qt3Z5yfA7jdZER+9HScrmDJ5QCPbGQTLP2IHCC1IeBVmLIIA==
X-Received: by 2002:a05:6a20:4328:b0:263:4717:53d with SMTP id adf61e73a8af0-3465381698fmr2495369637.48.1761726391775;
        Wed, 29 Oct 2025 01:26:31 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7127bf6accsm13075614a12.14.2025.10.29.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:26:29 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 4EE824201B81; Wed, 29 Oct 2025 15:26:19 +0700 (WIB)
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
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next 2/6] Documentation: xfrm_device: Use numbered list for offloading steps
Date: Wed, 29 Oct 2025 15:26:10 +0700
Message-ID: <20251029082615.39518-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029082615.39518-1-bagasdotme@gmail.com>
References: <20251029082615.39518-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=bagasdotme@gmail.com; h=from:subject; bh=sF2dC0yEoZfqsMqlw23WcrsBb8sQVqBQWtlJoeU/pAs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmM5zUM9v13EGe3tvn6LGGFpkSJcNtu3neHdaPPH9v+T /f7rjD5jlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExkazYjw4Ir2UHbpfU4bh8I +d3Xec7o4ZqlBavYLjF6bl0TOSsmKpaRYWKL+KoWH+3XKvIPVz+7vPilZoDbHRmPd2W/N7U5emW u5AUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Format xfrm offloading steps as numbered list.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/xfrm_device.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/xfrm_device.rst b/Documentation/networking/xfrm_device.rst
index 7a13075b5bf06a..86db3f42552dd0 100644
--- a/Documentation/networking/xfrm_device.rst
+++ b/Documentation/networking/xfrm_device.rst
@@ -153,26 +153,26 @@ the packet's skb.  At this point the data should be decrypted but the
 IPsec headers are still in the packet data; they are removed later up
 the stack in xfrm_input().
 
-	find and hold the SA that was used to the Rx skb::
+1. Find and hold the SA that was used to the Rx skb::
 
-		get spi, protocol, and destination IP from packet headers
+		/* get spi, protocol, and destination IP from packet headers */
 		xs = find xs from (spi, protocol, dest_IP)
 		xfrm_state_hold(xs);
 
-	store the state information into the skb::
+2. Store the state information into the skb::
 
 		sp = secpath_set(skb);
 		if (!sp) return;
 		sp->xvec[sp->len++] = xs;
 		sp->olen++;
 
-	indicate the success and/or error status of the offload::
+3. Indicate the success and/or error status of the offload::
 
 		xo = xfrm_offload(skb);
 		xo->flags = CRYPTO_DONE;
 		xo->status = crypto_status;
 
-	hand the packet to napi_gro_receive() as usual
+4. Hand the packet to napi_gro_receive() as usual.
 
 In ESN mode, xdo_dev_state_advance_esn() is called from
 xfrm_replay_advance_esn() for RX, and xfrm_replay_overflow_offload_esn for TX.
-- 
An old man doll... just what I always wanted! - Clara

