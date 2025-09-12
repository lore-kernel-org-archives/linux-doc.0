Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E38D314B96
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689856; cv=none; b=atQQKSegV0kVLZRZZW8L5X3/bGv71UIKaATZVeEPQqUdOdqvD/cLo0pd5ANpEhgyrvRUt16QsVieiYSru+gqPEHvMp3nghpvoqi4YutVvKuNrqYcUoEaeGnOTm8GwGkNEZhKLNWsXspMSbCojcF1a7Ig5qk59us9d1SMfpLbf38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689856; c=relaxed/simple;
	bh=mqm9C4r9CGB+Ni8ye2QxHYk0tRre6qbdyx5buxGNNkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLosvbpzI0wJKewo5GaiRID9Nxib+eVaraUlg9r+7CN2iaZxvWnsEpJBnP5NXgNxhftLci1l4LnOrsc1b7hDIUNLIkg61FD/eWtIxVw2kh2l7CyFGhWBp1LeCA8mWHuMUYSRhlmp34eSjwrOeBidOq0iEFEicMs8QceHTN0aTXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dj9E4H+n; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dj9E4H+n"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-629061bb7e3so230618d50.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689853; x=1758294653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRFg2hFdscTgaOHG8cpymzmUrui3DhwhCxVktuuhhLc=;
        b=dj9E4H+no8XAqg107yE5TNeSG+7gi0ZtZiDlPOcflDzIR1+cD5ThGatjldRUsxTtat
         qsTWvqAmnIlhuZw9RPmraQ/Cx7iBIxhdmSzYgJDAK5QVJahT98MGfzNykqnXeV/b31+9
         h++zS/gU6SKeXjg5brrSfGSsvl1PaX+WJOrgrn8EacU2DucpbwozB5FHqgr0oZaRg3YK
         AocMhhxbwq8kDTnqLAe9jjRnLeQOqyfCF78yohY6/ZFBNMsiuzkhc9T96c+JCUdo7AOy
         VeAReLqohOjy1pW/qm2jDi36GgHfKnCwMgknOhCynzopGAPvqRB2ptx64+g1t3TdET1E
         mwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689853; x=1758294653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRFg2hFdscTgaOHG8cpymzmUrui3DhwhCxVktuuhhLc=;
        b=MBpx0iUTiONA6SXNjXy8zhMClbeBfWkLKEAR+b+L+mEYUiZA69uVchz3pIyrypC/cG
         URVlksCGzxZl6HCwD2lYvGH7KtuiCi1GwbKsBp9vCqit/Td126Ixkt5+mhzxgKpGaDVE
         e+MKaTQ3bFq7iQU1uCbllbl+GJ2KtP2OmTaIL8LIGfWJFXnu+9zbMIdQtyOV0aBvUmvf
         aLSuRjUJd6jdQhP3lHdwuad9/cyMRx9vyblhG34SSaQLxFV05VLadcaMLWDjJnRsA9FU
         xdS77z0w2PY7DozEotkO6fT857LEBpYA7DccNKtJj65Obt4/3v3d4JG8DJf5LQgbP7gM
         noDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5bVVkiC/oGDgVkfN8RoqckDXB4z5oreVvb1ARfz0mWO4GDC5q7Hix17V3szsliUPg6mik56lb540=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5UEFdGrecHIN7T/jRrRp/elXfzIltnygWZOleQ07Hc3wPpEIx
	axXwxy3y8ubOfnIRXN1BMuRvUAHy8Z9zu4qI3q+fUPiSWO6p9Rhd0FFBh/06ZhQuyRk=
X-Gm-Gg: ASbGncuAE6yUpVHGpAJ/r5BB0XAQsbl5Gwt0Jl9JFUCK4T7ZUFqlpfSNcp2g7QOoryW
	r1mxeP1iia7jVVrAV3j2cCU5g5WWFerC1k/CbdFJTthCaPDdeMFN6VFTzEaewQniTe6JuALrZlA
	P1LCwvzPUyNSuACX6Z+vGNlfg8ToC0crrxtUeWYBTUf2LERyVmjPMs13I4DfM3ShMtVh0a+uAjP
	HnY1UUU0QReMmQxUcVwDtnhC5psFCkjwhz6we93fxeV06OCdQQ83QHWKsGHrweyLiQFq/Gbvnlv
	M8vxTXS4TYcXZXNC8IoCgETaXXIreVaNVtbLHs8u4+jXgYXj7dLk3cKM1281VfrWrChLu3nzlyr
	871WCB3SgP118/PpOcOsg5ayWipFgBgXywg==
X-Google-Smtp-Source: AGHT+IGA3TFT+vemEd/ubQxEEhLwHcx7hg7Tn+5tAGBp/Y4gBcPvEFcB1itw15g/ByzT4/+eDheVvA==
X-Received: by 2002:a53:84c7:0:b0:626:d26c:cca3 with SMTP id 956f58d0204a3-62714ee78ffmr2387133d50.0.1757689852988;
        Fri, 12 Sep 2025 08:10:52 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:52 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 12/16] printk: Register information into Kmemdump
Date: Fri, 12 Sep 2025 18:08:51 +0300
Message-ID: <20250912150855.2901211-13-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kmemdump requires the prb, data, descriptors and info.
Add it inside the log_buf_vmcoreinfo_setup()

In the case when the log buffer is dynamically replaced by a runtime
allocated version, call kmemdump to register the data but call unregister
to remove the old registered data first.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/printk/printk.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5aee9ffb16b9..f75489fd82df 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -49,6 +49,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/panic.h>
+#include <linux/kmemdump.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -964,6 +965,43 @@ const struct file_operations kmsg_fops = {
 };
 
 #ifdef CONFIG_VMCORE_INFO
+static void log_buf_vmcoreinfo_kmemdump_update(void *data, size_t data_size,
+					       void *descs, size_t descs_size,
+					       void *infos, size_t infos_size)
+{
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_data);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_data,
+			     (void *)data, data_size);
+
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_descs);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_descs,
+			     (void *)descs, descs_size);
+
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_infos);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_infos,
+			     (void *)infos, infos_size);
+}
+
+static void log_buf_vmcoreinfo_kmemdump(void)
+{
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb,
+			     (void *)&prb, sizeof(prb));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_descs,
+			     (void *)&_printk_rb_static_descs,
+			     sizeof(_printk_rb_static_descs));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_infos,
+			     (void *)&_printk_rb_static_infos,
+			     sizeof(_printk_rb_static_infos));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_data,
+			     (void *)&__log_buf, __LOG_BUF_LEN);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_printk_rb_static,
+			     (void *)&printk_rb_static,
+			     sizeof(printk_rb_static));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_printk_rb_dynamic,
+			     (void *)&printk_rb_dynamic,
+			     sizeof(printk_rb_dynamic));
+}
+
 /*
  * This appends the listed symbols to /proc/vmcore
  *
@@ -1029,6 +1067,8 @@ void log_buf_vmcoreinfo_setup(void)
 
 	VMCOREINFO_STRUCT_SIZE(latched_seq);
 	VMCOREINFO_OFFSET(latched_seq, val);
+
+	log_buf_vmcoreinfo_kmemdump();
 }
 #endif
 
@@ -1214,6 +1254,11 @@ void __init setup_log_buf(int early)
 		 new_descs, ilog2(new_descs_count),
 		 new_infos);
 
+#ifdef CONFIG_VMCORE_INFO
+	log_buf_vmcoreinfo_kmemdump_update(new_log_buf, new_log_buf_len,
+					   new_descs, new_descs_size,
+					   new_infos, new_infos_size);
+#endif
 	local_irq_save(flags);
 
 	log_buf_len = new_log_buf_len;
@@ -1257,8 +1302,10 @@ void __init setup_log_buf(int early)
 	return;
 
 err_free_descs:
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_descs);
 	memblock_free(new_descs, new_descs_size);
 err_free_log_buf:
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_data);
 	memblock_free(new_log_buf, new_log_buf_len);
 out:
 	print_log_buf_usage_stats();
-- 
2.43.0

