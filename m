Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324543FE647
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338046; cv=none; b=J7ITIhAbFGPQrOV+l4+2w9YNJK2+zLqGuv6xOC8ndIRFHHBT7J5FYYi1wlk7kl4LxNayy5mW6e1oWIl84QO0nnUa41c57xeWHnfbgAHJJ7z2CbO7ACRwo8uF0dwVVT4tXoZVEPqMnMnk7zW2H+xB8YNC4W/gPDpzX0eu4oWF6WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338046; c=relaxed/simple;
	bh=0mqHB9yCWgRA+Ai3Bj2tlZRNssxUZO57dPTv+g71rYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNXWMRMdoScG/6nmvxdR1NmDMnYjoCQBEpJGDFl6kerVCWRh6JbE4LxZZdp8Uk6HALptHtagf2rjwV2Oo28COES5IHrmlzcXla0iv/f7TT21fD4i/7MH9YGoUN2dgGsote2M5np0OKJf3+O9Ztgq3ShDby8pxAmcOPdFXNqhBj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtAdK+Ae; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtAdK+Ae"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae4988e039so16490055ad.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773338044; x=1773942844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AHYXlCzw3aqCugUumSoYXfA+lp584l7NZmh/mNebwA=;
        b=QtAdK+AerAI634FbrngbY5Q9mmbUrgeoBov06sQTMuQvnN7iqd5y/swZKG6le+eVvU
         /72rcraGffnlsPgKASkTH0czuQQhIj6jlIP8U5WlOrh4wGf07xxGxurrdtCkwU1YMO7h
         2rvq9BbAUhEhSybd1rVi9XeSLXXBXNHgbs+eEhqU8ihWpG2qhmpQhFIpDIucvl9Ld6de
         /50fzw8ezaoxeWk2BkOcd6GVRMHM5L/0XHuC6oBb0v2J4CQyjvbsm+a5EuwKjOoHLR6m
         5bsFPhAjL+GEQO9Taxc/HhQYvilnQ4274GUnD8aYYbYHinwZ0dtM6GkJpEHPeP5OnMbN
         /7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773338044; x=1773942844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1AHYXlCzw3aqCugUumSoYXfA+lp584l7NZmh/mNebwA=;
        b=A9zrBD7FU6HojIAWauxjNYPI8YxtULZbH6P1x+wsgPYUBkQ6PwzEW7yvhwlOYr0tmy
         oGxXh/E2JzPbmI+CnGmHiSwm2NXAOpbxmDMbOZMpAtT1B9TnR/hQLb7s7GCDoQCgE+O3
         jrTTCPB7+Yb/XiYHw86djxjc04x3ZiHbt/RrgkUq21ojODmiLJPYe1ngfV5KrnHGLF/D
         FQN4bfQzW8DIa1yk8eMzfQHI+DRHINkZZVp+91FMCbMF5YvdPavX2cOZik31FRPhy71/
         0kd7JYyRlq8AkvYDyhaJmpfNrcqz7XDn3FHWtaO+tSYXoaUlI25OznR3X9nRZ2VRPfLq
         Exhw==
X-Forwarded-Encrypted: i=1; AJvYcCU+uXhHHMTyXpRlgNZgrT2Ee6PLIXG537/lriIA5u1GPs9Wgr1EqqnwGi3RxXN8ACvZe5N8l/QcHZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZt15daT+obUTR4LgX7V340t869a3ImPQVKyCNT77SD7wO9cXl
	6x45fBMyzlBJ5mhtonSJXT3u4wOl/8JzXDeJSVK0uTXSILZgFc0Povqt
X-Gm-Gg: ATEYQzxszmAsNp4HNxtjxNZVGyOQc7p5Fyh+PV/S6gDGeGulOvtawbJBOE+jiKHjrAu
	e8lf7Q3f62dj+UEhy7DkU6CGcciNCuHhPGG7fnNU+vBlWdYt+rOjD1MGuyMApDft/nZTAwI+Njz
	qtiWDarvoSOQpBPcIX8O5I+4yzdD17vbAtYSaJW8JiDJT+V3ydYoCXNNrzXn0cqT7xyqkzdpcFV
	07wfyLHm9dMx98+wbP171lg3YussZcnem829xmugL6J2ovsxCVNaSVagmEVlSZFkXiTooGA0UBK
	yZ79ED6DCKCyg44mJhPUo+4JHSqxduebxy0lyv1r73xzfcqs90fkDNJZMe5y0cd2VTPg4kdz6lJ
	dnb7Q9d7punRNgRpD2aQSBGm6kaz4hPPLWyn2Ka3hUg9bAy1lE8fOr9Pk6+FZsexVRPKuKRyuXE
	YT8zd8+MDrYqUU0JsOQBprUU35KMmOBAKPhJig038lvmZQJTh3oy6CJ+bXjYxQvxgbwLWI4800O
	X/xYT+Gw7T6S+KxsdP39/qjpAoBTc5N03dS
X-Received: by 2002:a17:903:2f8c:b0:2ae:42c1:6f49 with SMTP id d9443c01a7336-2aeba4eac08mr40989635ad.15.1773338044416;
        Thu, 12 Mar 2026 10:54:04 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (7.162.199.104.bc.googleusercontent.com. [104.199.162.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae378ca7sm60453345ad.91.2026.03.12.10.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:54:03 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: djakov@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: marscheng@google.com,
	wllee@google.com,
	aarontian@google.com,
	jserv@ccns.ncku.edu.tw,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/2] docs: interconnect: Add provider APIs to documentation
Date: Thu, 12 Mar 2026 17:53:40 +0000
Message-ID: <20260312175341.2944154-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260312175341.2944154-1-visitorckw@gmail.com>
References: <20260312175341.2944154-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "Interconnect providers" section currently only includes data
structures from include/linux/interconnect-provider.h.

Include drivers/interconnect/core.c to extract provider-specific
API documentation. The :functions: directive is used to prevent
mixing with consumer APIs.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 Documentation/driver-api/interconnect.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/driver-api/interconnect.rst b/Documentation/driver-api/interconnect.rst
index a92d0f277a1f..cf7a83f8c953 100644
--- a/Documentation/driver-api/interconnect.rst
+++ b/Documentation/driver-api/interconnect.rst
@@ -84,6 +84,12 @@ be registered with the interconnect provider core.
 
 .. kernel-doc:: include/linux/interconnect-provider.h
 
+.. kernel-doc:: drivers/interconnect/core.c
+   :functions: icc_provider_init icc_provider_register icc_provider_deregister
+               icc_node_create icc_node_create_dyn icc_node_destroy
+               icc_node_add icc_node_del icc_nodes_remove icc_node_set_name
+               icc_link_create icc_link_nodes
+
 Interconnect consumers
 ----------------------
 
-- 
2.53.0.851.ga537e3e6e9-goog

