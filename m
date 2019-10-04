Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 08F3C7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Oct 2019 12:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbfJDMEv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Oct 2019 08:04:51 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33081 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJDMEv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Oct 2019 08:04:51 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so6899398wrs.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Oct 2019 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=suth/yl7C9uDuKnFfHGvtaLYw1nAU2JE6foMZrBU1qQ=;
        b=u7JSTFaB3+6rww5bw+3zAh8GYbUYNGvNJBk1J9hUrtPLM7vZElrKeGjaaUd1XJ8PDd
         euAnU9ckEGTlg7UuDgpIborMmJESaMf9DasD+8yHhFRglwvviGUjeXTpNSZaoXjIAXUU
         Im3yyNR3PSVhsLhSW3KBut6GiRLjRlEx8HBXG7tTyUYdj6+glb3/aShDgyR8hscPSZ7t
         s1lEPWbGZ0Vclg5qDq14T1u/BJbqXNN2WwxgVILo1ebNKtqAUauCdBqEKXRONWDpIFq/
         TcNXNspgq3oSHlbs/GcR1NeqUhZsD6YLQvRCz16zvaVNMHCPleM68EET/mVU8eGscQ50
         Q+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=suth/yl7C9uDuKnFfHGvtaLYw1nAU2JE6foMZrBU1qQ=;
        b=S20JqKQWM77mGM45pxTdJySKAe/crWHeriQy1ePoHFD7QpJP5ZSgo6EFfk4Ydkb41/
         Rbowo3o+YTFAPAuzXeE8+hJ4KeG58i4oHFt2wZLZ4C/aUREFE3PBoh2vVRCKc3v8rvJO
         o4ZMg3wqmJ72fsTCakKcVR7fqkqX3uLq5+ztAQwkgH0z0PHJXUDjHmKXb23eUzxM6ySY
         GoZHGxYotaQSVm40m6ifPstZ2zQ7gOPctWY/kpGLrjIVxdcVvc2bz4cUP8bTGqVcWQE2
         SqPj7S0BjQ34djOhHgfr/xRAKv9i2CA8MwqGxcepZlPHx+ImMqPexCfjaMZnUzuTvupc
         SMow==
X-Gm-Message-State: APjAAAWfQuv3hNoHJ9uAdY45wwd+vOVToTTg4tR+bTk+lTpPgGVUtl2E
        5REVBEbjugCY+1yffXnXTgzSfg==
X-Google-Smtp-Source: APXvYqyY9s67nKyPhoAmHbDhr4NeD9R/VMYYs5ICoX9odFWy6lJ8OkI9K04wXpCG7oQAaWEbrkuGtw==
X-Received: by 2002:adf:f58c:: with SMTP id f12mr8665663wro.38.1570190687975;
        Fri, 04 Oct 2019 05:04:47 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:b51e:3d9d:ec16:def5])
        by smtp.gmail.com with ESMTPSA id f8sm5019628wmb.37.2019.10.04.05.04.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 05:04:47 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Will Deacon <will.deacon@arm.com>
Subject: [RFC/RFT PATCH 09/16] arm64: Provide a command line to disable spectre_v2 mitigation
Date:   Fri,  4 Oct 2019 14:04:23 +0200
Message-Id: <20191004120430.11929-10-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191004120430.11929-1-ard.biesheuvel@linaro.org>
References: <20191004120430.11929-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jeremy Linton <jeremy.linton@arm.com>

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
(cherry picked from commit e5ce5e7267ddcbe13ab9ead2542524e1b7993e5a)
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++----
 arch/arm64/kernel/cpu_errata.c                  | 13 +++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e8ddf0ef232e..cc2f5c9a8161 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2866,10 +2866,10 @@
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
index 3758ba538a43..5a7fa90c668f 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -189,6 +189,14 @@ static void qcom_link_stack_sanitization(void)
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
@@ -200,6 +208,11 @@ enable_smccc_arch_workaround_1(const struct arm64_cpu_capabilities *entry)
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

