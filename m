Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06B12FBE15
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567135; cv=none; b=c/18Kjs1D5G2bWtmA+cWmxYm4wkcbEjXN3cC+aLytiDi75VeQm62uT8JuVEKVyBytNHNnzCjuj/I/uhu0V940hOJYWWWp1uryoe9RwRLt03YL1uqF8EncPyybmP/SaGfrheHqgW1EuY//gIxo8NbJW3BwOZqj2QqhXS4SrysH1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567135; c=relaxed/simple;
	bh=o6BmMGmoTbTaL/NtdpUUmzGGU5vJ7cVEMCY9+Mbhsuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiFAGZNqcpvyGYIWrHaQSUsdZY2ksQjGWCtrdihd0grX7QvCtGdl0tcXU6tTEzWq9zVnBgJb4RsT/Gdhw0g2R7Z8l8Bc6GwtFFV8qQxdPRYA1+8TnPAeXbVvZAi5b6UAZGiMKMKMoDGP6GHopWfAG3uCgBd396I+MOjn8sdMYGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N97gHFJI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N97gHFJI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so50230085e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567129; x=1764171929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgfZoRmCPzcZDOEfTe8kWXd16fGbdAbRWXioprv0N44=;
        b=N97gHFJInsFrGAqWXSOC/t/ip/ZFunAGSLYV+sKzWA5YLMvcNzF4HcIjkZQ30w+/8l
         b2NEkLl+5wQZEeu2dyGiiYvoGvRCs9uxQGYtRFf2HU7fxvjIk4olW8WnAVRi8eVxFZx1
         UlSE+dC4+lWgzhgCrkKaUvADoNcSRGotpAoValiwpGmbEaFUryttt3FwhmktPXVdic/A
         vsUycPOVgkU2YZZgl4vqzYcWvwH/bfSrTDwhlAI/HbZ3WDsvUwLkf+NrIuto02BJ/h0d
         eIzrHPrz8EVcC6kjiBrbDOdboOa8zfoPHPFQMvNaobGZfCEACLBLqBnUpMX2REFiOVt4
         D1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567129; x=1764171929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QgfZoRmCPzcZDOEfTe8kWXd16fGbdAbRWXioprv0N44=;
        b=hpUMHImssB7aNXaS4rzGREDbnGf5Tqj8T/hLL2u8yO3pXbXtjy59Dm/qVw/Awh1bvD
         QkQz3G7sTnslzaui9TdD9rXvh2yhxVrcvhcr2dA3gMDWwo2YrevOQL0LdwiNy9e0oJdv
         eceQMerxGBeBDfsBmXZ21JVjEH4u+i7v7YwZL9O6pDK35heipCZzvql4HKNo0w+thguO
         dSRn6vg9yVlkszVhLmIIoOt/onVOIIYxe6kSsH1nJSRE/qaHiWqocrdkLEz8dmLXZnyN
         qoguLNUNKkJkA/skQZwuCcINm97GSokNhbd3uu7iCXzeqIUc6oOGbinxo8N5TamBRItT
         EO+A==
X-Forwarded-Encrypted: i=1; AJvYcCUvjSFhORFcCbfDXA80UnwEWuuMj46Dl+8Va566xA1XNzsCtbvSmqZxoZGTHC5pUvh1wdUczFZYDOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8HOT3Nou0HCtumjq+B9xqFEJvRSL0NyXcuOsMwvDgKJrqo5qV
	zIil3EO3u7yv39ehfrNs39Rj5nB1IaYcdXzGY/wTF3FTNN5uRhwa8ZHs8kFQVWpdKjYQhQSzB18
	8SbfQ7c0vEw==
X-Gm-Gg: ASbGnctU+82HBc989VUIjgvawzx91litcZYE8uB4aKJVfqEgf4MsSQs7gUWYlonLQXm
	9SckS30a2sQmbfK70tcb07e27iuU25GMFjySeG4gZ8Jw4YPtU5sMCs+NxmFNL40zb4/wRF4HfVK
	MIA2Id9SIDIiJvUbg3yGgw0nZOaXEVyGFhMPGZMy1EFb31Crp0v3q+BaUGBPyyN5At3YRcaDuTR
	LvbOLK1JkiWfURleVQmlUYB+L6ubGrUA3QOPHnkrAcJWVBV5zhnE+hf5GVzx0AiiPv32RwyT4Lq
	sQBsbsLD/1WI9ih2IDnbaryc6+eXMNYUlV+j2i0oCw7eTGTdJzMyfKYbk1Gw08vgtnVyPyNslyU
	FcLw/qcUUXuK53EwR6v94XV8uCGo7vVFL+6vWa0kAW9630imCusexiyMFtH4xduRWo/O4zMMNeh
	Lw6kwilV4Giu7ZXVyoZciaVlQ96VajfA==
X-Google-Smtp-Source: AGHT+IEsAcddfcsUUvEjJGVD9iD03mMaqDkbeYnd/gOudjAAgUoPc2H5D0xayvELD1uec3MJtxxFcg==
X-Received: by 2002:a05:600c:4585:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-4778fe59a0bmr205474775e9.2.1763567128896;
        Wed, 19 Nov 2025 07:45:28 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:28 -0800 (PST)
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
Subject: [PATCH 07/26] kernel/fork: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:08 +0200
Message-ID: <20251119154427.1033475-8-eugen.hristev@linaro.org>
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
 - nr_threads

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/fork.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 3da0f08615a9..c85948804aa7 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -106,6 +106,7 @@
 #include <linux/pidfs.h>
 #include <linux/tick.h>
 #include <linux/unwind_deferred.h>
+#include <linux/meminspect.h>
 
 #include <asm/pgalloc.h>
 #include <linux/uaccess.h>
@@ -138,6 +139,7 @@
  */
 unsigned long total_forks;	/* Handle normal Linux uptimes. */
 int nr_threads;			/* The idle threads do not count.. */
+MEMINSPECT_SIMPLE_ENTRY(nr_threads);
 
 static int max_threads;		/* tunable limit on nr_threads */
 
-- 
2.43.0

