Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA17C48CC6
	for <linux-doc@vger.kernel.org>; Mon,  8 Apr 2024 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568254; cv=none; b=jQzx9JSxgaS1564SOfdR8mMxJObiMeSBPFgWKE64QM1D31tFMH/loZmVQwo8V9bsLtTWkAzlR1OIJcV7sWRkMIWmZ8n49+Ftms4dOZlwPnJWuv/Mqk6bRujEypmQYk/o3ozigl9hrWGaJZvyjdJ0LNFdaB1pOAh5w/tlFHVhJ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568254; c=relaxed/simple;
	bh=xqXzKlHJXALYg0kADBCkggttzbCltmioKyL9ENzrKZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bHSk+8/U9e1f/r4Xc9ZjB/puu8ivDmpzG4M60SYV3fZzHY4yWYkSQRxDMJ/WRDwcecOuedudOisZYGpSJe4FVzQ5rOtTgc3spfUSRUNYdlPgmNUuJiPfDDpW7yg/fOTgcVO6bH5H3nFMB7GCmBIuW8o/4W7V488CwOUjj7pPGnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=ZoGjQJ+p; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="ZoGjQJ+p"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e244c7cbf8so35278665ad.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2024 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1712568252; x=1713173052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXhrPWZCbFiNlkejBQmPpVwioI9IicUWQgOG1Qy4BAU=;
        b=ZoGjQJ+phgUqdRcskWj/SUg1LpOLfPlnFJNVYaTgDTaFYT5BLITYPueC7BSK+iB3kQ
         +bQKXWK6++c5Hmd8S/ujFW9re0CSwoihIR/JbsdarDvuCcWmc9HDIWNcKiiw5PFWmFnx
         42bcliOgDeXiR/FJL4sCKwqRdgjJIQJAZtjUamW1V37z2pDi+GsNZmw0IKwQTF1pgMDt
         /7FqbVI3gkk92NqTpxa/sRdCXSk0lrrchaxNDnTuPs7ElvUS/JyU5yOuQiAVEoApmKRY
         OJrxAc/Dpn5bXv6fsMh/5ClnUsg95BAR2RSK9ZIq4v3bJ+yk+NUQ5J2VHus62XCYhRD4
         TtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568252; x=1713173052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXhrPWZCbFiNlkejBQmPpVwioI9IicUWQgOG1Qy4BAU=;
        b=V5IbjXPoVod9Kr1RUw6IXWU+kTYKtu+Ff2Z6obT2bmJKoRX2R9+jEWwPaiBjFfvEKJ
         2xf8fag04l68OeW/FTl7e5p+xbQidGuCG2WJPWOTAXetCepjaXcj4W+PzdKCq5dSUwLs
         kT21Sckgh+/HLAt049XMrBhLk56oDOpwyQJlZdaHhFMnEQjocfCgGdFLHXxK1Tu3Z37c
         m+7FZJ44NtgQNZhFPgtu1RmUm2c6YVyQ7jItR8LfExr71f/tkHm3vulSAjrvImVNnbrf
         PP2t5OTTxgnWkhqdreOr8AsUpW/EF69TUNriA/jaQQHoNEs8ut7qPGxvw5HxBerQGuY6
         Bo3w==
X-Forwarded-Encrypted: i=1; AJvYcCWkOEnrtKwKHSVGmfdHrD/cOlfGori47+N+2GllUsQHJrzXFup2moeIT/wRQHwX1VzKREENUEPRZgzix1ps7BXehJaOzTtkWBPy
X-Gm-Message-State: AOJu0Yw9u/itiACzDPKliOzFcYwTN4v++n0aBYEILmzAox0U5arIzvfJ
	zz2vViEgJGmkaQE8EGObftsYW9UJEHFDikE7eTrTVjVtv2mzfcNlfMxGDUO7dWk=
X-Google-Smtp-Source: AGHT+IG2aHB10Xdeck+DR44E30QeG48AyS3ygivhIohZ9/D2Bps33gSbdBdn/hJdPGhD5KuQs6+fJg==
X-Received: by 2002:a17:902:f813:b0:1dd:c288:899f with SMTP id ix19-20020a170902f81300b001ddc288899fmr6191606plb.18.1712568252016;
        Mon, 08 Apr 2024 02:24:12 -0700 (PDT)
Received: from seacloud.vm ([143.92.64.17])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090341c100b001e293b16d8dsm3258731ple.1.2024.04.08.02.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:24:11 -0700 (PDT)
From: Haifeng Xu <haifeng.xu@shopee.com>
To: reinette.chatre@intel.com,
	james.morse@arm.com
Cc: fenghua.yu@intel.com,
	babu.moger@amd.com,
	bp@alien8.de,
	tglx@linutronix.de,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	peternewman@google.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Haifeng Xu <haifeng.xu@shopee.com>
Subject: [PATCH v7 2/2] x86/resctrl: Add tracepoint for llc_occupancy tracking
Date: Mon,  8 Apr 2024 17:23:03 +0800
Message-Id: <20240408092303.26413-3-haifeng.xu@shopee.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408092303.26413-1-haifeng.xu@shopee.com>
References: <20240408092303.26413-1-haifeng.xu@shopee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In our production environment, after removing monitor groups, those unused
RMIDs get stuck in the limbo list forever because their llc_occupancy are
always larger than the threshold. But the unused RMIDs can be successfully
freed by turning up the threshold.

In order to know how much the threshold should be, perf can be used to
acquire the llc_occupancy of RMIDs in each rdt domain.

Instead of using perf tool to track llc_occupancy and filter the log
manually, it is more convenient for users to use tracepoint to do this
work. So add a new tracepoint that shows the llc_occupancy of busy RMIDs
when scanning the limbo list.

Signed-off-by: Haifeng Xu <haifeng.xu@shopee.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Suggested-by: James Morse <james.morse@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
 Documentation/arch/x86/resctrl.rst    |  6 ++++++
 arch/x86/kernel/cpu/resctrl/monitor.c | 11 +++++++++++
 arch/x86/kernel/cpu/resctrl/trace.h   | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index a6279df64a9d..bcdbd23cd8a7 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -446,6 +446,12 @@ during mkdir.
 max_threshold_occupancy is a user configurable value to determine the
 occupancy at which an RMID can be freed.
 
+The mon_llc_occupancy_limbo tracepoint gives the precise occupancy in bytes
+for a subset of RMID that are not immediately available for allocation.
+This can't be relied on to produce output every second, it may be necessary
+to attempt to create an empty monitor group to force an update. Output may
+only be produced if creation of a control or monitor group fails.
+
 Schemata files - general concepts
 ---------------------------------
 Each line in the file describes one resource. The line starts with
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index c34a35ec0f03..2345e6836593 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -24,6 +24,7 @@
 #include <asm/resctrl.h>
 
 #include "internal.h"
+#include "trace.h"
 
 /**
  * struct rmid_entry - dirty tracking for all RMID.
@@ -354,6 +355,16 @@ void __check_limbo(struct rdt_domain *d, bool force_free)
 			rmid_dirty = true;
 		} else {
 			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
+
+			/*
+			 * x86's CLOSID and RMID are independent numbers, so the entry's
+			 * CLOSID is an empty CLOSID (X86_RESCTRL_EMPTY_CLOSID). On Arm the
+			 * RMID (PMG) extends the CLOSID (PARTID) space with bits that aren't
+			 * used to select the configuration. It is thus necessary to track both
+			 * CLOSID and RMID because there may be dependencies between them
+			 * on some architectures.
+			 */
+			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid, d->id, val);
 		}
 
 		if (force_free || !rmid_dirty) {
diff --git a/arch/x86/kernel/cpu/resctrl/trace.h b/arch/x86/kernel/cpu/resctrl/trace.h
index 495fb90c8572..2a506316b303 100644
--- a/arch/x86/kernel/cpu/resctrl/trace.h
+++ b/arch/x86/kernel/cpu/resctrl/trace.h
@@ -35,6 +35,22 @@ TRACE_EVENT(pseudo_lock_l3,
 	    TP_printk("hits=%llu miss=%llu",
 		      __entry->l3_hits, __entry->l3_miss));
 
+TRACE_EVENT(mon_llc_occupancy_limbo,
+	    TP_PROTO(u32 ctrl_hw_id, u32 mon_hw_id, int domain_id, u64 llc_occupancy_bytes),
+	    TP_ARGS(ctrl_hw_id, mon_hw_id, domain_id, llc_occupancy_bytes),
+	    TP_STRUCT__entry(__field(u32, ctrl_hw_id)
+			     __field(u32, mon_hw_id)
+			     __field(int, domain_id)
+			     __field(u64, llc_occupancy_bytes)),
+	    TP_fast_assign(__entry->ctrl_hw_id = ctrl_hw_id;
+			   __entry->mon_hw_id = mon_hw_id;
+			   __entry->domain_id = domain_id;
+			   __entry->llc_occupancy_bytes = llc_occupancy_bytes;),
+	    TP_printk("ctrl_hw_id=%u mon_hw_id=%u domain_id=%d llc_occupancy_bytes=%llu",
+		      __entry->ctrl_hw_id, __entry->mon_hw_id, __entry->domain_id,
+		      __entry->llc_occupancy_bytes)
+	   );
+
 #endif /* _TRACE_RESCTRL_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.25.1

