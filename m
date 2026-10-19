Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AFE45562C
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 04:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383514; cv=none; b=QUt/GoUZHrPwO6UibZRsivFwKRjpdCH32EwuZcI5/sem/3uuROIHkFhBnaNSJiqqPHkbE56SCKP26XyRG+l1ICSyZzONrtam1ULAVKwLGdeuPYzHipVmz44jp45eB1kF+9r+Cv/AVESMeix29GUrSmOG6LCgRZ94yJ/qWg2WpiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383514; c=relaxed/simple;
	bh=7n2GUVavWCaznIULC4koTaKML5uMo1SBp+OgkDs0sgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glA/jDZnf/y/vugrLClwSCbI5mJaAdAwdMI7bDCcmtVLEc1OP7AUoH/B2BX2jsCLxZLsnvC7L6pKlEqGFCg03PrJ9BkTq7iSflog7e/XPlFO0WttbDSGyGl8uQMQLMxEOlL9hyRMl/pbtBaCkZ9GN5FAlxxldN8AXL05CPe3oao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018485638so1026485e9.1
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 21:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792383505; x=1792988305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8yTvohyfHN+LGgMhB7OAI4MKDO7ZPXP+V+3d2M470U=;
        b=MdBR5YDFGIKBUj5Baz0OaxDuktViwsijvmONdiq8wmhrqzYuUq2FaWhEOHtF4nGtm7
         2uw7j6VefoilQCbGTJQnhmw6eGJ3RrcpFQgXu6qzL2CbufoSQYgaqGmHuwL1Vvhs0Wg7
         kcCaLCjVlm4DpR0M7Sxge6NW5bGfkTVfEGURp+ZZdZ3wLaM04mG7pHi6pgXAYGfRJJ9O
         5IenauAOW5Cn89Cgg7MbvWLIKmbsqB5r2PdENRofs9oUQRYoNy8rnXm14ti7LDn8kt+I
         q7OSUMPCi9ALMAyS9zUTt90Ra6JwessU+NfCxjoJe6Cp7gcn609FRBSBJL6B8+aHAEQ4
         HZ1A==
X-Forwarded-Encrypted: i=1; AKwUvByUpu8Ab83LmmkvgtSJLmgSp3oy9ULYx0jtF5oIpkCxMAodvfGACIno4LQPhfa+GLl1FFDLWkRWWOs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjW/jUsXNzHYHXQjftFY71hLKOO2lCeuVuJJhCpftmF6bHqVqB
	CDkFQdpNjAKOLGTTe3qFsUTJWjGBOJNPoby+XfmCex6AVNOVuHZ9hE6U
X-Gm-Gg: AYBFou04pd1Jd1E25o3nT08S2MiWZHE1Hr9KBiUD+iceeUq7JNXqO4SIbnztul3PbsV
	PQFx4nZ2ED2nu0ZFH+8hWKfh1r7bH17KI+Z0NPW8clt1QYj640CYwkl95Qg83nifCItWbC4wYQg
	M5qqwkNDwqe2qLRf/LZWVr5Z9GD0IYtHGgFWEzcHA/yWZISw1HctHNDTreh52Qa98bVtabeApvK
	xXCUZN1lav3yBsfmlzJW6RdsvrExMHyPhQM5v19WbtXE/zmJs/z9/oyD4sM7ifev3OJjnbXd55/
	4ZB6wMl33QjyYPWRU11OYjvA91jyDKAumQX136fSCfA8m874pg2t4TcbmsJ+evsFxfiO4OKaeF3
	cLM6gAWR3EWClG50kTM7cOKeRgFUegDf2yqVGia3dYe5Hb5/yzOhQX7lR0rleb8Sa6+gVxxpbOL
	qpNe6fZFxH8el8JU07187n5uNnY9PLTSMf23QfvJMrrqKbEcU+xCzmT8IhG5GKWADRGFY3Drxbd
	4nupb82Ee/EuPwXjyWnMKwbF7HTbF8N9hvQ
X-Received: by 2002:a05:600c:4ecc:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4a1e0156660mr91288055e9.0.1792383505145;
        Sun, 18 Oct 2026 21:18:25 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm20090449f8f.42.2026.10.18.21.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 21:18:23 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: Aurelien DESBRIERES <aurelien@hackers.camp>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	aurelien.desbrieres@gmail.com,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 18/18] MAINTAINERS: add beamfs
Date: Mon, 19 Oct 2026 06:17:28 +0200
Message-ID: <20261019041728.327785-19-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019041728.327785-1-aurelien@hackers.camp>
References: <20261019041728.327785-1-aurelien@hackers.camp>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for beamfs and its documentation.

Assisted-by: LLM
Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 62744835f86f..e5b95458da43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3082,6 +3082,15 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+BEAMFS FILE SYSTEM
+M:	Aurelien DESBRIERES <aurelien@hackers.camp>
+L:	linux-fsdevel@vger.kernel.org
+S:	Maintained
+W:	https://github.com/roastercode/beamfs
+F:	Documentation/ABI/testing/sysfs-fs-beamfs
+F:	Documentation/filesystems/beamfs.rst
+F:	fs/beamfs/
+
 LPC32XX DMAMUX SUPPORT
 M:	J.M.B. Downing <jonathan.downing@nautel.com>
 M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
-- 
2.55.0

