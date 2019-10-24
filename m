Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CDF267D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 Oct 2019 12:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502140AbfJXMtx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 Oct 2019 08:49:53 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38304 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502121AbfJXMtx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Oct 2019 08:49:53 -0400
Received: by mail-wr1-f65.google.com with SMTP id v9so14663356wrq.5
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2019 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/lIuF/ezia5URppvDTy2wPaSCGFyV345zyFYH80xshs=;
        b=wUmcKdCDLFOU3WI4mQyG72BQ/sCbZK0fVZYTbhauo9LIuuY7z1qZ4wRcJqnvpmPqvp
         CahvGBvDuixgdWvs4hV6qEBk1DfpK1FZWzClyFY4BjWEPUoeYfspA5cWOXBmiHNRIFmt
         3gmw0LiwM89BbWtmzMd/AnUGq7JcBEJi+fS31Y65r5BVbANtCa7xqYITgF46y0AzbOIy
         5G4gIY1haug3bkxoqV8wVCJE5P6PZzrzMbCxWSJS+68E+LtsoEQWmE7Kdo6nn0xIuFgy
         VsYdRfTtHUEATikf3sbk5DUQB0WFApe77UdbolKjNrgsiFtXWltmt1/Nh3BdndovV1xF
         NXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/lIuF/ezia5URppvDTy2wPaSCGFyV345zyFYH80xshs=;
        b=f0CIQSjMuwWxwEbq2NsyI0iObZk3IHW+54oLUCaJ4aGcqSCepsfHIea9afKPKX7Grl
         s4naw9Z4a0IxcC1xCqMMpcy4qrLgImicxn1gjdLcchudsia/c9KfOxTHOPnXRXTrc5bH
         NQNB/bYUFC5tzbN5SwpsDnAmOyus2+8ASAruwCPMp0EHRlxg4UyOW/gKgU20ZyJ2Vo6m
         YWKZiU2YWzq15uMAvozd5AX8+u7E90DKpC2VsrcVnLt9AloIMFPFlQ4cEZyR836q5qq4
         Px+H15w9dL+OR/Yc+5ubQVOD2ijTshvk7+0L/RAc6oz3F28hHUM0cHoPxWITRbMrwT4U
         y5tA==
X-Gm-Message-State: APjAAAWKozQldmbORBz/2zLFeGQEwS2kePoBnRNHOzsuLyHaRlOkhoFx
        FV76kwZfjiLDqzVsN97p2z4ZZQ==
X-Google-Smtp-Source: APXvYqxIH9WOmi7gPvFHrzo4aiX5NyGpmLrtucWDlagj2w4RyVC90DEjmmYMPoBXmSOzfsIqOTMxsw==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr3617307wrr.316.1571921391452;
        Thu, 24 Oct 2019 05:49:51 -0700 (PDT)
Received: from localhost.localdomain (aaubervilliers-681-1-126-126.w90-88.abo.wanadoo.fr. [90.88.7.126])
        by smtp.gmail.com with ESMTPSA id j22sm29111038wrd.41.2019.10.24.05.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 05:49:50 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     stable@vger.kernel.org
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Will Deacon <will.deacon@arm.com>
Subject: [PATCH for-stable-4.14 40/48] arm64: Provide a command line to disable spectre_v2 mitigation
Date:   Thu, 24 Oct 2019 14:48:25 +0200
Message-Id: <20191024124833.4158-41-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024124833.4158-1-ard.biesheuvel@linaro.org>
References: <20191024124833.4158-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jeremy Linton <jeremy.linton@arm.com>

[ Upstream commit e5ce5e7267ddcbe13ab9ead2542524e1b7993e5a ]

There are various reasons, such as benchmarking, to disable spectrev2
mitigation on a machine. Provide a command-line option to do so.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Will Deacon <will.deacon@arm.com>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++----
 arch/arm64/kernel/cpu_errata.c                  | 13 +++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 188a7db8501b..5205740ed39b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2745,10 +2745,10 @@
 			(bounds check bypass). With this option data leaks
 			are possible in the system.
 
-	nospectre_v2	[X86,PPC_FSL_BOOK3E] Disable all mitigations for the Spectre variant 2
-			(indirect branch prediction) vulnerability. System may
-			allow data leaks with this option, which is equivalent
-			to spectre_v2=off.
+	nospectre_v2	[X86,PPC_FSL_BOOK3E,ARM64] Disable all mitigations for
+			the Spectre variant 2 (indirect branch prediction)
+			vulnerability. System may allow data leaks with this
+			option.
 
 	nospec_store_bypass_disable
 			[HW] Disable all mitigations for the Speculative Store Bypass vulnerability
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 86c4f4e51427..5c3f8c712aae 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -181,6 +181,14 @@ static void qcom_link_stack_sanitization(void)
 		     : "=&r" (tmp));
 }
 
+static bool __nospectre_v2;
+static int __init parse_nospectre_v2(char *str)
+{
+	__nospectre_v2 = true;
+	return 0;
+}
+early_param("nospectre_v2", parse_nospectre_v2);
+
 static void
 enable_smccc_arch_workaround_1(const struct arm64_cpu_capabilities *entry)
 {
@@ -192,6 +200,11 @@ enable_smccc_arch_workaround_1(const struct arm64_cpu_capabilities *entry)
 	if (!entry->matches(entry, SCOPE_LOCAL_CPU))
 		return;
 
+	if (__nospectre_v2) {
+		pr_info_once("spectrev2 mitigation disabled by command line option\n");
+		return;
+	}
+
 	if (psci_ops.smccc_version == SMCCC_VERSION_1_0)
 		return;
 
-- 
2.20.1

