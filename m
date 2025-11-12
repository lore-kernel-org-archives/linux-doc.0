Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F5D3148B7
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960956; cv=none; b=keOswrsEPi4OK/3I35wYAtZ5pzKGj6nlixogrmwT1C+AdSSbBIQN41DxCeaDBgWCu+7dxciiz8NgbS1PmFNejwgZXEqArB3QheLCP6nAc2HuJRJJlCtcrTVgZ9IuGdqsPHpqQif23RC4CvHkL4318xGd/S47FqaFSRLlXRgyGvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960956; c=relaxed/simple;
	bh=210QQ0X8fq0FsJsy+nHQRHwEoHeTT7356Y9zDU0LrD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOUZ5CLu9L4tuWGmv7AglHM3J0comUA0P1RzKInpAYbGxfIDNhnGn+nlERdktpPBKGKia/U3NHafRf53aJEnQtDNk3/+ZEApnkAQFgzvNqwLS+qjkW1PQNSntHhkEtzuMeJU41bwLi30U8yPqZh3Dws6ftGLH8ywyNPRRBbo7UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZ+xoPmq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZ+xoPmq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47755a7652eso6946145e9.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960953; x=1763565753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0f7cHeyj48y6Jvj7oQh+IhrQ2eaIAgk3d7czkbJdpbg=;
        b=nZ+xoPmqxjpzgnBm5PEj4FpVTUpDKQ/fXNiPB5bC8Do1/F76fU9QWX9Sk8mYPJtt/w
         yXvmzBEak/F4gbws7ZA5bnzr83HOri3KuTnuYQO5t67aAOJ4btkPt0Q0LLIsO/ZdAUfZ
         7ftRfFSvmGKWYO/5qa8E/OESgYSUb5YJPBk/8f1LuePnb4RS1gJE2P9BNbj46KIq85NJ
         c+KmXDUogXKOizWFCMLibTX1SOp2vcJXXFlvytaQPbFtIeqK4mGGJzfFQFIb78LarP9h
         RXuTpOteudWDWoVsCt7mF5tmCQpuJxJsjS3IfXXSUKvy+PWlNcrXS7/h/W2tVoMyZpfv
         Me/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960953; x=1763565753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0f7cHeyj48y6Jvj7oQh+IhrQ2eaIAgk3d7czkbJdpbg=;
        b=WdPUB4Rx1jCOMVXs3V0wj1z4O6U6F2u09uQJfsG9sJiL+Zr+59PfS4bBu/+y3pDS3+
         O0iJ4DuQfIG1d5vj7OFrQyL93OkG80D9O1qxW6ocBA++Lce2r1MNKvcLuITUYV40utDI
         N3gdpvovk5xjtYxuQITjdP2vX8102SECwM7J7dAnp0syCf2yhrDYGWYND3oLT90rQ9XV
         iopQ94wH3fWKHZ1oQX3OShxyaYCctzsr+NiupQR4rcjh6GnHdMrMVru70MVPurQsCgLB
         gpyXHeCbMrbqbQsgWZSnMgWHXoptS0V6glosncRgId2VQ1aLibeBXXSxETOj0+d/M4Cy
         Q8yg==
X-Forwarded-Encrypted: i=1; AJvYcCUIXIo9cFO/P8tgPaTUHdxl5QRH/4D5xL/8Hxo2RAE11TvA4Lamo/TKdcWEjMg+6ek87xF9XyNkRGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnlRv7qBanRIA2MOnSwIcvMHQ/lGh305sA4GgfBfMzeKoW+93
	itvLYrlWnJjfkVWcmPKrVHu6kHXJsIuBS5QiZPxDi61Rysw1BQI5NMmej1uG3tmovpw=
X-Gm-Gg: ASbGnctkY+p6vxtGvRwn2SDxf3EBQ4lhKxKaklZ6tzYFjWwQDb9qfHSlzjcGROndOYb
	3N8zr/hrtJaTAPotLre7dRDo7Bj4fhcjFpr4plBR9if1+djUSOZZmJiltkb2HiBaF/lG9JuXqhb
	CyUhxh7f25MA85YQfWv80eAKkRea5rVv79DpZAYuWcU8w4kYC7EI3gWpJafKdl3GGQ6zZ8s3zRB
	E+8Gc00mV6PbKiuRPtrgt65IKWTLgIst9py8OhusnbDCh71uFTIlhUmkiXgWG0n5ryt50ER6VzI
	X0Ft2eDw/T8YQK5MfsnCAVglySXVqvdILHIBu5ljJ563MOHMTeQ/psBqugxFWBt6/lrrNzBPhf4
	L9baiycO1HiRM7NYgrqPSeaDvr4dYzgbC/wRPoeNvKSzp/qURBBdH+wRbkSUkCToqNjGRoD7Hga
	0iGpfZ5EeJ9Q==
X-Google-Smtp-Source: AGHT+IGTWs97Njo9/LOi7JghZmPdDO+lqDr8Zjnw1ns9XWNM4GTecb2CrtmosaObhr2irKbWuwRS0g==
X-Received: by 2002:a05:600c:1f8c:b0:471:16b1:b824 with SMTP id 5b1f17b1804b1-477871c47b6mr35226945e9.28.1762960952689;
        Wed, 12 Nov 2025 07:22:32 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:32 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:10 +0000
Subject: [PATCH v4 04/13] coresight: Hide unused ETMv3 format attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-4-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

ETMv3 only has a few attributes, and setting unused ones results in an
error, so hide them to begin with.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17afa0f4cdee..91132abca244 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -106,8 +106,27 @@ static struct attribute *etm_config_formats_attr[] = {
 	NULL,
 };
 
+static umode_t etm_format_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int unused)
+{
+	/* ETM4 has all attributes */
+	if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
+		return attr->mode;
+
+	/* ETM3 only has these attributes */
+	if (attr == &format_attr_cycacc.attr ||
+	    attr == &format_attr_timestamp.attr ||
+	    attr == &format_attr_retstack.attr ||
+	    attr == &format_attr_sinkid.attr ||
+	    attr == &format_attr_configid.attr)
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

