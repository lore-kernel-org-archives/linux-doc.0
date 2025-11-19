Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7602E88A1
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567129; cv=none; b=cDClFialztCaL1B0Cmc6rZbXxUmxcwsTTl3r2BLF1r5VnktEbhNSoUFUYpTMxJXbPIWyZPoSPodJ+lxO66b1g1HpRvLYHZJjl8iUrKaCERm623bWSbPAAC3Yske/yMAXxbotnuczZ8utMHCqe8K1UiK4zA/KIO32U/brNaVtXoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567129; c=relaxed/simple;
	bh=T6SjDhmcY0qxcuyqrC2MrBGCJa3hOQc9OYm2K6gInfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nwe5G8OmVZJ5f5gUSFC0vGA0+6VjMlFdgZwuZq1vuMVGkNj2zv+8vmkyYZnXfNJSsgN0ZBtMKAJmRWi53zfpWdlcGB1h9yDpOlSfwJ5VLnCiK3fxsctgMkQQbedAXp2tFgv3SeF0/UReyLrSIn1uaQKI782g38M0G5ft9KQzavk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FslOMpT0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FslOMpT0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b31507ed8so5576683f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567124; x=1764171924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCvJkYlF4keL+Fd6f7hwRGbLb7cgm1v1S6Qn3Ctc9SY=;
        b=FslOMpT0D6lQ2kcCfXCiK0uWzCKjdNJ+AScQFNAM8TZvG3xEM7hVRVsKm91uZMaTvz
         4ob7Vilx6or0EGs2w+NmOwSkxBsRgfBYuD4SXQ1WbbhJKL95YIWP18GQZJrCJn4gXokf
         tudwNkwtKWBIJqQsMpTYbscsCy2OJigihpRNBGv+IyyKzjhSkKhfzVARu4Qyx6Hkq0mm
         1I86zQNM4dXOBcXvNdoMUynBcD7yv7L6gKD5o1nmiPzDy6GzgNzrtWtBJYAKSrgDIaK6
         pRjDKWJeLrjp7UAQu+Ih0+8lSAKK0ipcr5Lla6ZRc+MOkqYY/bqS7qUUjRISp7uAjz90
         dUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567124; x=1764171924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NCvJkYlF4keL+Fd6f7hwRGbLb7cgm1v1S6Qn3Ctc9SY=;
        b=pRYEywYQl/UCvuKGXr3b05ddN8pluvzOCkmkB6p3l3oT6MIj+oSJNIbt0CAE/4MjBW
         51R+KBoXEeL41XcleIzkEmiqZOKe/9izL8brufdG/RENWXwtEIogb8gCF7WCTE0NxwRL
         0748cmUn+t0ctpSR9HgCSE7JWaqLtPdhndL+yWNcZRAkJd/2swS8WZwah5UmoL6e5CdH
         kVCaWw42Ex6RvYbcfG56UbGVhfsEwaKnXLbC0dIK+b5lXk0K4txPkTAcoPFWg8+G2tO5
         V0SohbwIVKTHNwwf5KVdn3PeUh0I4sZPXQPpaKrwEpYbvHsbe35E48xs2av0107ZQdAV
         v7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDufPT0a8IBfFm7eIRdEr3V770dN3DSGXQLk2XtOm7nybYAnEpDZrMUEvE1zBQvNgvd5Z3polbedk=@vger.kernel.org
X-Gm-Message-State: AOJu0YygDXae+f7RgD689peAh3H1/lrt2smJbFdakUbRQgNqZ7wv/vFI
	voZ3Im4ELi1yB9cTt3hnD52d0iew/elA9gb3im5k7PMlvyOdp2wdQgmZF2QVEnSQa+Q=
X-Gm-Gg: ASbGncstNMVnSFD5vbfPf98ax04ywIa+NSMjFiGMoo2GomzT+W4Zzwn33RtIBQvPlEO
	i+arX+ePmn3ajJgnPpX7nhXa+04nHDCaLUeLYeOV06oJZok9GI3tlxA6q5vXNutF9VDjR2V8xQF
	6ukHbE+VzD6/AmShDMEDupdqESGFdGDXqEm5cqAQYIvUERIhKhQ9CO7iI/Wv6Okrj96W2KHwYf/
	WW29Wn9inMDprpEsR5UVl2rekb2Bt22NUg4D3PhsT2Kx2qAn4OEg5qSfoPs/Qw4b/gKeTVS+wko
	jE2CVkJHStyC71K2tuo/aL5ZufH9/VSGq0faA64K4BHU1Bcwssnu6WXftQA1JCWK9q1ednsrClD
	ZcPBw9vdsmcJp2r8EuKeS/mElw42aqGauXJIJOMeAHPlzkV1yI3Q4UgwxgGHMtjDldF3eJqKdWb
	fZZ9D7mHMUeZC64J5BiSlZLDz2ah68Ow==
X-Google-Smtp-Source: AGHT+IFVCfX9pNo5qLPfR5wjMBWTLaRukJCHurtJsWmWrjGoOxpQq2PCC7itN5NhSfJZMSf9UOyBtQ==
X-Received: by 2002:a05:6000:1ace:b0:42b:3366:632a with SMTP id ffacd0b85a97d-42b59386ademr21562007f8f.39.1763567123749;
        Wed, 19 Nov 2025 07:45:23 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:23 -0800 (PST)
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
Subject: [PATCH 04/26] cpu: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:05 +0200
Message-ID: <20251119154427.1033475-5-eugen.hristev@linaro.org>
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

Annotate vital static information into inspection table:
 - __cpu_present_mask
 - __cpu_online_mask
 - __cpu_possible_mask
 - __cpu_active_mask

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index db9f6c539b28..1f2df5a5b9ab 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -38,6 +38,7 @@
 #include <linux/random.h>
 #include <linux/cc_platform.h>
 #include <linux/parser.h>
+#include <linux/meminspect.h>
 
 #include <trace/events/power.h>
 #define CREATE_TRACE_POINTS
@@ -3089,18 +3090,22 @@ struct cpumask __cpu_possible_mask __ro_after_init
 struct cpumask __cpu_possible_mask __ro_after_init;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_possible_mask);
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_online_mask);
 
 struct cpumask __cpu_enabled_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_enabled_mask);
 
 struct cpumask __cpu_present_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_present_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_present_mask);
 
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_active_mask);
 
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);
-- 
2.43.0

