Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E19426EA1
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127799; cv=none; b=ZVhuLK9dFbwaNN8hQmxGP4cLZfWj4euY25PM/Fi2ihb3LqOwbmE7YNuSIb8OzL8Aj+xlZULWfs2sAv0jJXT4t3D2xbA46Wh1UxJrn7eenGu99af3Aa8Je5U7Ra1fd6bRlRBEsKUU1lF41QkUGznCWqc9IbarrJs1te3WW/Qno84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127799; c=relaxed/simple;
	bh=i32r1821H3Fvx8Z++mHgDSGJpr7CI9S6224rhikSwqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdDEP7hIaqOPsbGNzoWHAZEBIr+FEqwK9oKhfcRxY6oC8KfwJwttgg5Pna0EwXfxBspyaTIirycQbT20mb0usgs8Yjg7mHk4dyqe8rzutaGwu+H7KeVmdBvl7jPPS73DUDN6PGULfNPLS6xJnzG5c3UIJQ5QjgLALtpEKtGzjLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYB94V8K; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYB94V8K"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2be26d11b95so11566569eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773127797; x=1773732597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3KNqP6Bo2goeMR/7FCuY+JiazyuB86qszEXwjkzo4w=;
        b=SYB94V8KcxfzB1n8KDgPaIKYwJ/CTThSb9H30jUmkoOkhBu3dldDLy6Qu5NVs1kCoa
         jvAZdnREi6DBj2MSIMXoeu2gz2gN91Rpu6y5BMypHX+3/hZxT6EGKD2x0NqLrZOvfFs+
         6EHfCrHZvcu9jgTs5OeM4D17KRxrgNFVXOPqmfIIjD001t31d7xtYIK03jdoMQcWw4pV
         4seO43dFmTevjtD6SjaZ3Vp8B3oF+tmfXdWbP3KH8N5iU9oxTQ05fK1vpvNKfG5qViqD
         eRL9T3RK4xiZke43kfCpOb1GgH+KuDjIwUAf2NS4q3WKqPklF+mfznu423J1vkh+/fE/
         wydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127797; x=1773732597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3KNqP6Bo2goeMR/7FCuY+JiazyuB86qszEXwjkzo4w=;
        b=ochc1Wbl0+nGDp0kBysbc+k6lQurlv+t+BMUw2Gut4LE+UOeUmq92FRGFeF4aQsT/L
         cF/XrIS8jUgnQc5yvboR8lqxDRWCO7yDNKCS0wAwkrZzAz4HUFfRtbuCCfKx8ATKmefS
         TcMxcXgYtn/xmBqKG+PYkWUvhY3WHeDPiTUq450H2OIXTWZKjmCLC8Up5eUPU78W3/EL
         K4PhbOsEs5WjSmBf4eS2Kl2m/Ck4c5c+WDM1EmjxytwhRO5XbAkVM8uc8KbKmrIYNL58
         5OgGxcNEtm5Dd79eDGsBesbq1bz+nLqH8PGW3w62hBbzN/baH2Aak66UWYsEpVeWJyO7
         R5PA==
X-Forwarded-Encrypted: i=1; AJvYcCVKaz8y1VwIUlvF9JM4407fFV6B+B35JCfIN/umSajGasj515UQFmO9j5UjxynBqTfTPD/BxVDkWtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4mTQ/gpYjUuz4gYkeZHMS9ex6vkGUCIGn8N1A6JyslDfzPPW+
	OeQTe9zKAaQ+G+56yY3q9/InbX6taOmT+DQWbOvXeMffYmgCGpz5pRha
X-Gm-Gg: ATEYQzzbCd0/qESxePjZweHO8z1yOkxDzg5i0Yktfv466UFhiRJtTa6/Mnz7hmRrLlj
	cV85v3h/YPiAtL1Bhj3DGTMdOe9+CGIgOsnbON1cPjfUit6KfkTjkps/etXNKseuBTeioCAmP3k
	oz8wk2j28o+cNjAKpuQtxyKPUicSiCLlad2X6JephHlr+po7PLlloaIF8V1H7BmzrxZ+i1xpEGM
	9+URrcvAkVGtKzWJXI8t7KzSunvBPBYLNFvQuEBWmcq3ljE3H2GTD4gfpq5v5V6j14uH6D5MvKg
	YRqVxBPLlO8mMVBME+g+XkTvVSF4RHsAy8qSbWOnYhmp0W/7abUfgqm4Luvi5OO4e3aT3viLHWw
	zPerWpsupavoz63Ix1JJDNZCOm+QqPrzYl8bt+Oggm/TV6pEIehjoCrdAFgnbciT/1QFCwLTNcU
	Sol80IIqBaK7Z11rjN6yk9TNRj3b55Xb7xhlOo8nzF/8TBImBtGt2lizh6mScWSyXM+SW9lFHKk
	VR1
X-Received: by 2002:a05:7300:a44d:b0:2ba:96d8:530b with SMTP id 5a478bee46e88-2be4e06436bmr5559508eec.32.1773127797107;
        Tue, 10 Mar 2026 00:29:57 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be81209142sm721925eec.12.2026.03.10.00.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:29:56 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Richard Hughes <hughsient@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v6 17/19] HID: hid-lenovo-go-s: Remove unneeded semicolon
Date: Tue, 10 Mar 2026 07:29:35 +0000
Message-ID: <20260310072937.3295875-18-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
References: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Ni <nichen@iscas.ac.cn>

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 431fffde4695..8ffa25b20f9c 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1097,7 +1097,7 @@ static void hid_gos_brightness_set(struct led_classdev *led_cdev,
 	default:
 		dev_err(led_cdev->dev, "Failed to write RGB profile: %i\n",
 			ret);
-	};
+	}
 }
 
 #define LEGOS_DEVICE_ATTR_RW(_name, _attrname, _rtype, _group)                 \
-- 
2.53.0

