Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62582393DD1
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567159; cv=none; b=O+rn6Kqm2psYzegKw8Gz48YLBAtevA29rhVqPKLhxSLHQZMznMa8YhvRt9si2eRSIUI69e0S1Obt8XRcgADpTOSMH1ppP+KNaBGsqYMw2hRh7jxmvjYJDooZaZOw71ZSZOagLSs2VXO8ypnvRur0F8VtT9qYGWwxWh9cQj+JWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567159; c=relaxed/simple;
	bh=f3/jMwmnVv3mI87uodqbEJ5zmLRyilWaBRh2oB7xeIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6+vCFazVp18tjn4dlnSbMvNNeobWAnpHaESj4yNoJlfnLIchjxa5OvjxgPd3rmFU55KKV27Y4gsRYDUElrtIevHqv1tl1Wv53yROxARj1npltjwaLQhfPaxtW92Q40QEQfI9aQpmBhj6x0Nn0jlPV7oF5j/et8JHynbBag3oN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXrmnSHa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXrmnSHa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso38465685e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567150; x=1764171950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG3MkEScUQgKy+QWFE7rEK/ceT0KdBZscolLPvZ1jcY=;
        b=XXrmnSHaTf1vf6uqqllPUT0sMUElMq1GY66Her4KbnbRi5e+DUU+M+SWXGUt2CZ6yi
         Fcfg1D6NcZVjy26O1mHYrbiVIPaAlLBA2GBqvpgLMBXyymHP7sB69YUN84ZdMxEQx29S
         DToilDeS7YIqZBRpQLn/r+GmhRa5gNuXE+wcynhuswMQIYn0NsTWAoMVNaNDtskjuf6d
         eua2UlS0Q7BEVBAS9dnTmdA56yZpIwU8XFShysHoYhbEidZl0ofZ+gQZPlTrTx3l7IgY
         d2eNag3MWaOS0TVX4RMZONoYBqxONt/LCOMwvGtHCkIwtA0Jveoa88lEMBckYQCQjlIx
         QEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567150; x=1764171950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TG3MkEScUQgKy+QWFE7rEK/ceT0KdBZscolLPvZ1jcY=;
        b=EXSsswqRQ6leZXzHJDfU6tWHkeYKEM6bfzPWUv6FQp7cLqRXyIRgZxCirQ0JjMPmlo
         II6HUncl+s0o//3aPwGZqBUKOmuw0Mst6qodJX8298+8BNdMYamyoJQ/6ylHIeRMBwkk
         14PbtrVQqa7+5/TIxwqN4SHP4Moy4NshDfojasAAlQxaMJ4GCbCFqjvkM0ls+9AJbokG
         1gmwVM8fNTymkOYRmztQtZeu/e7O4LLyi0oEZqBlxSIAjGRJ3gYQqO42SHSf9XvNhAet
         1nfsKrhu3y4L9+uRwGUwvhtoJoArufDB2hyml0x4gdADgsIp9a0FkE2IwQIXiYri4oWF
         XXNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgISwICt++n+Yw2nIafvfvTVDEXTjJOVKIkxz81YPE94mgV+aich8Y1KRt4PCVi/GLdszqC2KkGog=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu3Q5tSt+ecl/UJie9fj6ZWMOHCwLrwQVKDswqy3P4HT6tOlR0
	tZ/LSQQxDrmWlSAq2GyqG69c0m/Qp/Q5mK7Pjoxz6UrWa1xmK3J75x3hVeLBaiDjeG8=
X-Gm-Gg: ASbGncuU09bgcRGL9WjQTbQ7eHGpeNrH8s1752cniQHtvVGO3pVH+W8+u0BxuirFMmj
	+OcvQHeLjidun9Cv8jXmkiEDIP8uMhodH6VeJlaHJQ2OWoFK4UyKiiWcD8XeYf+ja72SDR+ueHY
	sCC8v2jFdoZgrEFxiUC1kWrdApFXl64OJe74u5vs/28lpxpXwstdie4qGl/0YeGu6tlOZCpmkzL
	fjwtfNfrRPyw7MlCH170n7mR8TSMGeQMLp+/9+TKpPvCGB0EKJbNsyMwwQ4x3uskMaWCQSL3G6X
	r5E7fCYF/XpvbnrieciV5fbJelr3bnL5NqjXN0dAAnzxpRZhlizXQOWm+PWZ/W2BszhMFqo3/Fi
	87Lz5Igu0cHrRFB3/xLseMdjhzk/3nR5mlM67/HZeq102KzRT79vpv3BHGtiWCCAU1XLt//PYCW
	6fWBezi512ru7kubxQO6Kv3PWHC/OVqw==
X-Google-Smtp-Source: AGHT+IHArpVzpD3LO0mA1+dNKflLF3LKgYCdBzRW5r7OQjPk30YRri90746lAxdaW694nNfBsFGkIg==
X-Received: by 2002:a05:600c:a05:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-4778fea881fmr202472465e9.34.1763567149948;
        Wed, 19 Nov 2025 07:45:49 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:49 -0800 (PST)
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
Subject: [PATCH 19/26] mm/numa: Register information into meminspect
Date: Wed, 19 Nov 2025 17:44:20 +0200
Message-ID: <20251119154427.1033475-20-eugen.hristev@linaro.org>
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

Register dynamic information into meminspect:
 - dynamic node data for each node

This information is being allocated for each node, as physical address,
so call memblock_mark_inspect that will mark the block accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..379065dd633e 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,6 +4,7 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/meminspect.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
@@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
+	memblock_mark_inspect(nd_pa, nd_size);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
-- 
2.43.0

