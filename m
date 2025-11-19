Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95CB3730DC
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567153; cv=none; b=YY9EW+mizpi+arxBYIH1hIv9lyxrxaJtq5S66yDa8V+oMAAWFTG07V++EZ6O27xPqMW0KVAnmZGDv2/wfJAPVHO4GajeBqGnWPcv4rA8/Ved7T8xxiwgXVahrKYCuhatIwMRoS6slLnI65cM/eE5k/P9q+ZYG2d7Q/bN4NH1hp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567153; c=relaxed/simple;
	bh=puCNsUx1cqEsVIIsTQXC2Zu04afcvVugn2nqwtYBNCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El0eCGIJpKqZL0Zj+peu3Kh6SkQl6GJs7J9SBwEeYWUk35eAIRED3xykKt2lX7myJh5VkDvOw8P1njFhfCWuXMoLkuLWdVf6aUtbx0M3iEJHdNbBY0PshOczCZ3S+trxDT+Blcwtnt2UAOemv8+cFE2rDAXEYm82UYrrHDe/Wm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2cvfbXn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2cvfbXn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3b29153fso3747823f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567146; x=1764171946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDp3sMBoTlmxBrCfHcN3bT849KzRdDNMVpiuychnTdo=;
        b=u2cvfbXnHZX8S86mhbmVlDKoHQ2qZIBOHUToZr3q51jGLlJFmHxxQcU/fm1uw3dr/L
         ryR8SU3D5iO0H6+339AdAvKpGNAn1CK6/oOlstGHI4cd4xG6+/w44Ge5Or0ybjFmHaS3
         TmyiHTUji9gaHk7uex4IBqSQYtfvzqDF4k1l4LfR1824PbZuKmIt9zwUJc4RzpmuIicf
         FnV8EwOu8LdVRf/aAcAWgL+Gv4kc4rnhvuoRDiBZpPwDdKCtUw0xPkaSpKH5yXwWXj/t
         JHK8eUL5sBMFkiK5dz64vZJDZsK1hF9kybnlSUvlmbITELWgyWL8yGyyhYzSYh/yxDZ1
         XWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567146; x=1764171946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDp3sMBoTlmxBrCfHcN3bT849KzRdDNMVpiuychnTdo=;
        b=a91pst3VHb1bhpcxmpp0kD0pubd2BHrsnJnzZy1JWPiJTO5NMyUCVBZRe6LTEHIC1x
         1joBl6+cwhU4RCOHBJiIBkVII//WmYqTPEre2LwzQm/Q+WCZgX60A1HHTTRNzhy1AgdD
         yrwPdAD9mDcxTc4rwfYewIhEQ20RNQTX1z0oMfnAqe1UyiFatuOWExLrCYh2MB2ithR2
         r1VmNThFbiVBlol14vnaNvFU1pfNCfLkYlzxVlZ+hPbEWCzFzgktVv4/BivZNOlbBAoo
         t2EqyYyEvBfG7Y/tVnXcYGVjXjB1tpYF+XXYVBxJ7slECyHRAZY15P5FyN8GYtXkTpUG
         nuqA==
X-Forwarded-Encrypted: i=1; AJvYcCUskQWX/Fagqio4gx+1KY6jcz8wJcQ1h0dF1yLl3LxbJo7wKvjSxnDLpYompzcEFt+m70AoEQudbJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/wxT6Om/pjpkEOK/pRTZmirwVxJ8qHL474E4iSX465STNXsr
	fVZWeksgskoQn1VaYzO3x39ztzw9+uu1IK0m2tqdU1B8v3b18Jt7IuCYsupwwar54CA=
X-Gm-Gg: ASbGncs8HRPZarOaw0Lpp2+6XbrqJD+zH/yFMe97vx5fceJ2ZCVXaLsfq6hNMkC0KfE
	E160c3OsObIW41UiyBH/Lva2XEH58KSEDc2cPw14eFQpwoDvuirfkdTIZFhCKAcdhVagoblOeDm
	9meIlHBq3cy5EsqL0OWgFLxd54Pr+zIUiYTRhvEaELnx38IU/LyKYBM7bPQcVRCc/tRAbIJcKH5
	2UnxOOli2uLXoEuOlHH3wQmNfqD+cAg0/dxLh228rHCmQattYeTRZNYilZ5ebr1gPxjljphqICJ
	Xj7v6Jq7hrpHrhHNXkbWkf6qREeT6RBMzbJlfRqFd7cIeZ8yISJqdzAw6n/hbHtJvy6cjwU8ecI
	KFssEeyEgTmfGBDhVZr/g1hkktpMYNCpEIAQs+AkmZSqyNEBNzJOlaHNncokneTmdAQgShnkUM/
	zDZkX97z+jDAqsjPsLfM0=
X-Google-Smtp-Source: AGHT+IHSn97ivXqqEi+3+TEBhok4L0zKY5jBJq8AwBEmyjMgjDaigOLXet9t8Pqm4XTXHvlHGh5HZw==
X-Received: by 2002:a05:6000:2891:b0:42b:39d0:638d with SMTP id ffacd0b85a97d-42cb1f9e35bmr3506384f8f.28.1763567146421;
        Wed, 19 Nov 2025 07:45:46 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:46 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 17/26] sched/core: Annotate runqueues into meminspect
Date: Wed, 19 Nov 2025 17:44:18 +0200
Message-ID: <20251119154427.1033475-18-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate runqueues into meminspect. Even if these are static, they
are defined percpu, and a later init call will instantiate them for each
cpu. Hence, we cannot annotate them in the usual way, but rather have
to call meminspect API at init time.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f1ebf67b48e2..a68367daddb4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -69,6 +69,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -8792,6 +8793,7 @@ void __init sched_init(void)
 		rq->core_cookie = 0UL;
 #endif
 		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
+		meminspect_lock_register_va(rq, sizeof(*rq));
 	}
 
 	set_load_weight(&init_task, false);
-- 
2.43.0

