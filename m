Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DE12B6F
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481781; cv=none; b=RioZUmLKYi5wPgeCwC9jKsWVIk7v8YofDPyzpaRAqQFL7mDebLnepW7p4f4zLdbBV7ftQx93l4sMPaNHpfe9i60BdY/+e0FTAV2veA1h/4fvpAm6xfQtFfHrqoBj4DBuhXi1YI72XrBNhLoE144SpINzE6QopbGBTrJSlyT+I3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481781; c=relaxed/simple;
	bh=8gtmmJwg+/jsTtuZtqQy80cge8wyZUrlws98MiySy2o=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=ftC2IwyooOcc4VpG9wz4mF28zT6g7vGoOsJAAdxhTJc9eynCIPkgNftsCTbqpjbc1UbV6e76jguSg04gICQuopQ7TWF6dXQOv2GZr1VO6LO31XUHYQANZx+ltETh63BRMYlIAhJXu4rvMFad9E+l0NYplL890KG9lKpt8F4Nsj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PmMgV+NX; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PmMgV+NX"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ddee0aa208so5147254a34.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481779; x=1706086579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p92HaOoAM2zaHZmiFbyj7p/d4cfHWue2zO9NzywtZ/E=;
        b=PmMgV+NXyU2dKQE/AWkbhPxoPETNXm6mx2De6YHfnypP8IU9YIFc73kj2QE66CnRvu
         RnY+zdQNCgwbsO8GYsO0hXjUpYRjICjY8DrAAYeFCaIlCJmaAeyZwdfXc8b35Jtxi9G2
         DOrplKsjyBKeYQ2aN4uWz4RK3HO9W26uhDD+4S6wKPFd+kDUOH7Nh2kdFcm/oQKytN19
         +p72/6xQ7mBK31q7yep4gQvJC59KpY+GN7TaFLzO2PqqpCD0AZvbVuh+NVl0D1aQ/zin
         pKpKj3EJHnka8pURI5zwvyFsMHGyGaW4CQRZbPKj+Evk3o434w3dpFPEV3ijmAS8Qspy
         u48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481779; x=1706086579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p92HaOoAM2zaHZmiFbyj7p/d4cfHWue2zO9NzywtZ/E=;
        b=cLN0fFkyadh0M/xBNYzsB0prCcKiOVV82at9O6DAiEoaEYJkWT2b1la7g9A7ZR8E2w
         DBUzlLE1oPXgTLtbEJmrsZFK8Y4xV/wd+JhkQPFVMfCSt6RRVErLF+13vcZLxCaN0AKe
         dapN7bH/w/lg2l4mE50pL9uvbB3Ydn8lSHRcE7h5o5ShuSFm2N8wWhlqIdkaIpwLrZWf
         JSA+bxSF6qZf15hXxHuKNhY7yWRbUqFTZS2fjasEodre27riBjRRKoETKK5Fujh1kTFC
         ARRrDPCb4WwOcwsnBRykR9QJ8CiuDyudNy8XoPXfzP8eaUtDk0DiMv3oWR8eWqc3BEFt
         uZ8Q==
X-Gm-Message-State: AOJu0YylSye6eId6HGrVp1sG7ZctHHE/bIwCJ+f/n5EDOMc+1SUPvgTT
	EcjgEe+O8boVoqdOdx4JiRTqFSPciddajQ==
X-Google-Smtp-Source: AGHT+IFu+SeEJw9n2AbRiPBp4K++9he5wPts9eCmdnzeT17fAUQ3fZ3HG6qv9UaHx727Ck5dPdrcfQ==
X-Received: by 2002:a9d:66ce:0:b0:6e0:c98f:b170 with SMTP id t14-20020a9d66ce000000b006e0c98fb170mr1986605otm.50.1705481778825;
        Wed, 17 Jan 2024 00:56:18 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:56:18 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 15/19] arm64: text replication: early kernel option to enable replication
Date: Wed, 17 Jan 2024 16:53:53 +0800
Message-Id: <20240117085357.31693-16-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Provide an early kernel option "ktext=" which allows the kernel text
replication to be enabled. This takes a boolean argument.

The way this has been implemented means that we take all the same paths
through the kernel at runtime whether kernel text replication has been
enabled or not; this allows the performance effects of the code changes
to be evaluated separately from the act of running with replicating the
kernel text.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../admin-guide/kernel-parameters.txt          |  5 +++++
 arch/arm64/mm/ktext.c                          | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6ee0f9a5da70..bace7bd404d3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2544,6 +2544,11 @@
 			0: force disabled
 			1: force enabled
 
+	ktext=		[ARM64] Control kernel text replication on NUMA
+			machines. Default: disabled.
+			0: disable kernel text replication
+			1: enable kernel text replication
+
 	kunit.enable=	[KUNIT] Enable executing KUnit tests. Requires
 			CONFIG_KUNIT to be set to be fully enabled. The
 			default value can be overridden via
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 6265a2db449b..3dde6e1d99d7 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -98,6 +98,21 @@ void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
 	}
 }
 
+static bool ktext_enabled;
+
+static int __init parse_ktext(char *str)
+{
+	bool enabled;
+	int ret = kstrtobool(str, &enabled);
+
+	if (ret)
+		return ret;
+
+	ktext_enabled = enabled;
+	return 0;
+}
+early_param("ktext", parse_ktext);
+
 /* Allocate page tables and memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
@@ -119,6 +134,9 @@ void __init ktext_replication_init(void)
 		return;
 	}
 
+	if (!ktext_enabled)
+		return;
+
 	for_each_node(nid) {
 		/* Nothing to do for node 0 */
 		if (!nid)
-- 
2.20.1

