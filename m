Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EB436C5BA
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483299; cv=none; b=orN0ovs2P2CGzJ6EXF/6IZt3NmQuJdeOxUCBLtomtDGHl9OAe3COfu2g68c+6WC3YbDJuX3jEmdiwhzg9UrYFPFBIryPUzEdrZN+mPWGBu5nHrxhjYq+3V+bR1entAAdD8G6ncVXo9Iqx57WrmvBqqoG/l0tyNO3N/icxd9iCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483299; c=relaxed/simple;
	bh=nwpDrPvo6wsFhTqkdc+mil82YNIIfV6pVmZlogEyGM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OH9W17ueL4MbGCxU4g/S1/jXM0yVrAqcMgBLXA8F2/LSS3F7mNothfZqLJsX58TpmYj2GtEuODL7ZO4PvbGkRVL2kyJ5iP1rztFmwcT0OdK8ExtD+VVU+wSHx+/7jiAn7jru40pu3Gj3dYpKLQiBb6pqI1PkxMqia0FPhwzVCY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rd4e9ea0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rd4e9ea0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477770019e4so61028795e9.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483296; x=1764088096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfMGtwRScvfZlh/XAQooGxUMOnQFy6aFM90lPPS4zWA=;
        b=Rd4e9ea0uV0XkSfI9YnF0RciW645RghMAs+rxUsrD4wiAroWlN/pz4EVb95uSkbWd2
         6FkOGc/LJbKbaW6PI2OhnZZqQzb7ekMVZcnxWRPtJlu3LDm3vHOxOzCFe7A1eSN6q8fg
         z2Ksr3il3/nJAZqeMBkM6iwcUS8hpnZuHABJpM4KdQa3zPBodNUlgSqSZBSCQ8s2T/vT
         EBaewQ9fzZMw/dQvYXHA8pbLME/l4vhUDx2J/CQ7A3716Iz6dgv6QlQKBZi0GFKxeFKx
         qNrHX0scjZbvLIej0ao6VYEjS3695mjH81bdNCPSIsma5vyr58xmxjUVe3UixVmxh83N
         YkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483296; x=1764088096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pfMGtwRScvfZlh/XAQooGxUMOnQFy6aFM90lPPS4zWA=;
        b=bQv15zCmHMqG7xJN1s5/6GYkPmigcXSueiyWluSs5SSy+nZ99vLepAKc6JDuoizRYv
         KKgu653M0O4MzJg3LxB1jR8D8ZKZFtx8647SHyUEtGf/TxgJThd3ucEiPa70LZO/LOf0
         LKKr7z2isMYWBQ9yXhvqkv2vD8iXjEJF8Mla9Um/eZ8jbJKmJ4Zk6VoniW6PowHBTgRn
         XqvKVqsj20CGfJFwTWmiPJkSuE6CTmg2SnAoW6YMKbLigPrE660mb3rI93bS/GMYCNSE
         VlHVVavAuxgaxFKE1r5ie5RCE/jg9oABSNA499fIxcRagU9OM8B0FeQWjQrPrUmA5NTK
         qxVg==
X-Forwarded-Encrypted: i=1; AJvYcCXYlYTaRCxWP8P7Qwa77cOLDqRCB8S1oaCWDEXZhniMQ4eQK09CjRMQC/Gg/PqNAWeoiFdANs8NxLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpfk6FoPhWCAp1BzQf6c//JwugmIM8l+1HR2klh56G1Xs/wgDK
	0UoDSdZS287nlfSGBeszyVz4H1NjoVIRWlCkE0nex/eo5EJKSaLGvZT4+XZmV/16XHs=
X-Gm-Gg: ASbGncvcnlZTM9d9VI3H6BF1ulQHzsrwlU7XHergxFAhgGZvJjyY4MOnJobB9IzBmPb
	ZTAog424r1cLICfdNkn6/k9fZ0YFDOuTs0LLrFELxfcr1aBUdNpAG9nifeMJYEPleRjfw2c7mlJ
	6c3VZZPumm0FpAYU0uk8ujwtnlqFZATzE8DEs9pjGfUElTVf8+r5F4StcQLTax0GRT3MHbcH/bb
	uwegpOkvdxfmVCo3JT4KFEkjHd9BA58OWiDXJXbzqvW8sjsr9Qe9qTORIrvhYGYgkCGhBFrQCCw
	Ti2FXfGq04325Ej+wH5+/4iSXXeTQe1kx7pP+63IYYZMFEgyNeusH/KcQ4Wssb9leAAfOvhG17i
	b5AZRuIr3e+zPpZIWu4O/4idWRiy2SgpwzMUhgPbFoQDR9VYtQWPc6r+N4NHno2+8v041QMFY6E
	z+k0G83GyvoZw5ojWwfdAx2mKgVi9huG8=
X-Google-Smtp-Source: AGHT+IEQ71MCFFHm9PfsuQns+Y6ohbXSLi6ir1YdpoytYc9NNxUeZy72YPAlDScgcglr1n/v1Qdp8g==
X-Received: by 2002:a05:600c:3593:b0:477:557b:6917 with SMTP id 5b1f17b1804b1-4778fe4fdecmr170984385e9.18.1763483295720;
        Tue, 18 Nov 2025 08:28:15 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:15 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:54 +0000
Subject: [PATCH v5 04/13] coresight: Hide unused ETMv3 format attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-4-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

ETMv3 only has a few attributes, and setting unused ones results in an
error, so hide them to begin with.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17afa0f4cdee..faebd7822a77 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -106,8 +106,30 @@ static struct attribute *etm_config_formats_attr[] = {
 	NULL,
 };
 
+static umode_t etm_format_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int unused)
+{
+	/* ETM4 has all attributes */
+	if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
+		return attr->mode;
+
+	/*
+	 * ETM3 only uses these attributes for programming itself (see
+	 * ETM3X_SUPPORTED_OPTIONS). Sink ID is also supported for selecting a
+	 * sink, but not used for configuring the ETM.
+	 */
+	if (attr == &format_attr_cycacc.attr ||
+	    attr == &format_attr_timestamp.attr ||
+	    attr == &format_attr_retstack.attr ||
+	    attr == &format_attr_sinkid.attr)
+		return attr->mode;
+
+	return 0;
+}
+
 static const struct attribute_group etm_pmu_format_group = {
 	.name   = "format",
+	.is_visible = etm_format_attr_is_visible,
 	.attrs  = etm_config_formats_attr,
 };
 

-- 
2.34.1

