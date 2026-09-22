Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD5493644
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111709; cv=none; b=la2jl7vAQbkhgSwPrCmEd+E1AfiAUlmAMPXV6Zhn8Vupt9gelc/fIOilKGgUIbRxC7WkuwQkmUUDa63WJAqggPxJlxEPymBhedPMXPFzd82c8ibmVSZz6iLZxsSyT+0jOvfRyQOjF4vXL3rB8IQJR2Z3AM+35/dO+WI4OnkPOWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111709; c=relaxed/simple;
	bh=FawpcmzmmxnlHtD+GQiWKEP83HvtT9DOy1bIw2fjfys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eVey5R9q96SFMjr8vey+TApY5MKX/7kDuT351vFggAYuAV3F34f00qQbzMQpFt3gmCqdZXg+JLtq1D8u8vTo3xOiUSLlI7TJXB/GpleNZFfuo64lKrYFbALjW3TbLRvCL7LwJNDfNczg2l02lBwhqPoqPPzIgpSFfroC7vNmAYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMGTiOjc; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMGTiOjc"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so218188f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111700; x=1790716500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flTePN2NkB0ZSxOdRerLk62XoVAGJA6/fEuIjEkWcNw=;
        b=YMGTiOjcct/we335Q+eOhlsVlmPv828ezilxLXox4g2vVGhwZed1qMJaSTIgyPmWRm
         Hnru/qhYl7xxirDkVmRBCS9COy8r4nZVe0/QyvQ8oq/Tba4slwHUEqFmqgozKLZzsmdG
         DuZLXem5cglEzU6bhB9eu2UN6UBMb/nizdateQVDV/Z4uk/r4R9FIFYQ4qSXpdP8CZHQ
         l09RhrSDAH/eluzqve+Zh40HBAFOVif0crvOWA0a0tEg5ofiTbtzo4P0wUUtlxPUvJKf
         gZLr2CaPs+HjGO5pwoyNXZQK7IvRWUGKZF2nsk+1IUsP1b6a4o/9NfT5JnzGa+Mkv1Kg
         +yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111700; x=1790716500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flTePN2NkB0ZSxOdRerLk62XoVAGJA6/fEuIjEkWcNw=;
        b=QBe/Pky31X4FztKBxzSUKw+w9yG5noBGdXA3OKz4PMUwKmqoai0WHpi0ZQFPTaJm4o
         SfK3opdamarWzdBeSxsr1HofZhZ4xNIx4TVRkOfeAqlK/h0DKz7Uo8CEt3VoKTCfAHyN
         syxZcRdIDB/5Mg01TNDjRZpDrueRQlH8MTJ0+hjPdk8ldwSxtT+qHSSbwpsDGoKgzFcs
         TT36Sr+dYzbvyCN8cXh8E7U4+Cr3gAYJllxLPnLtYS3fkc8un/zIGVG2frovpDSuPoTR
         IZA90pzS798lWMp1mn/r0/u5Bfgypb9UZ5KIxRZoTBDJ/2S7+tr/JEVzZZqoKlsEB1TC
         jtWg==
X-Forwarded-Encrypted: i=1; AKwUvBw1rEXnUDwdTOLTls480TFOEaAKKnSp7ok6PqivrHbCb1TEdzWNBSw1YpbMe19qoFwTdUbuGrko+N0=@vger.kernel.org
X-Gm-Message-State: AFuF++kU3TgnpOXmjofSRR9AfgVUyXAo0/IQiM4G/vnrAGZewQv0fZ4d
	OjctcR7C9RqP+y+eGdwg5SVpboQxAIKPV2YDGKW70hJVDa6X/0uCvsn3
X-Gm-Gg: AYBFou1KVWWaWaadIhLw78Rgvmep0CvPDu5K8vDTZ6FGPHrpvAydaNm+a/76ygTrr1+
	jler+kLXREt1sngmgHLXPu4/SNdeCms/DRuZpCluALi0FYDCY6UvsC/Akq5mbCh9s/T7Pi+yoxz
	453ucTTydv3AI3Eah8NF41PgxlxqxL9UT8qAfapakM4vdwc2pAfmwb0AwnpoTGqtpG/RHq0klVR
	wWvPkgw8SUfhxkb7zUeW/geIxR8PHVhfoQV93t+5HpUqrAY2AfBQyDCms3K6LnvY9o7tj+lU9Uu
	iwKL0JoKyY+auMpKWtt/FgkKLMk2QjfLYCWptQU0sBQRBZCpwzHAJw7cW1XdWY+OyeN6UJBu3Sd
	UKBaa0hNToQ2rY7uO1CblHPsiEbkJsV7Hn1Ps1sAaAtNuGoiEAzKXQ3TwI3Knc7GO0Z/Vv10Hwk
	Hed1r9SG23m/hYxt6/dqHsqhIkzKtcvH7GEYKm/nOgvLvbrCITn3vih+bWBxmVqlwgGbhTrfgt5
	E3NkibCeWNuRWbPYit6nMcaBKAZ0w==
X-Received: by 2002:a5d:5846:0:b0:485:af9d:cd1f with SMTP id ffacd0b85a97d-488670b509fmr990235f8f.51.1790111699834;
        Tue, 22 Sep 2026 14:14:59 -0700 (PDT)
Received: from christian-ThinkPad-T470.. ([2a03:4460:170d:5700:7168:5af1:a975:cf85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm1221672f8f.2.2026.09.22.14.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:14:59 -0700 (PDT)
From: Christian Melendez <chrismelnu@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Melendez <chrismelnu@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: add missing entry for b53.rst
Date: Tue, 22 Sep 2026 23:14:39 +0200
Message-Id: <20260922211439.369917-2-chrismelnu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922211439.369917-1-chrismelnu@gmail.com>
References: <CAOiHx==_ixY-VNWX=XxqCFoJvE-80i+r2y6SNnxwQe9uZQJL6w@mail.gmail.com>
 <20260922211439.369917-1-chrismelnu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/networking/dsa/b53.rst is not covered by the BROADCOM
B53/SF2 ETHERNET SWITCH DRIVER entry.

Signed-off-by: Christian Melendez <chrismelnu@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..a1bf40c70a5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5143,6 +5143,7 @@ L:	netdev@vger.kernel.org
 L:	openwrt-devel@lists.openwrt.org (subscribers-only)
 S:	Supported
 F:	Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
+F:	Documentation/networking/dsa/b53.rst
 F:	drivers/net/dsa/b53/*
 F:	drivers/net/dsa/bcm_sf2*
 F:	include/linux/dsa/brcm.h
-- 
2.34.1

