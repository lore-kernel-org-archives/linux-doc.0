Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE1A326952
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 18:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763144514; cv=none; b=pPNXEYo4upqj5XgoroI8cn+lquERys0FEm19C78jlNq7SRfZAgdD7oaNJcMpH+krsseUInFkJfYkMbZFsF/WppddygvFUYJG69lYT7n0/F5i2fTP2TRpjmkCtRsdlUJp2tlQxovTkBw1Wtgb8V/7Mcl0hGxVFY6faBHFmka+fFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763144514; c=relaxed/simple;
	bh=08YHyxLxXktBFFkSp4yhcpSImQHSDMqN6sOacEYT/n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dHRC8g3jJg/ZlkAMwlrNImS/nB8hcPirl0eTuWSe05d+AYQxUU436kPwXKPtzliezZQPFUgYCVM2O1hREpvfNzFGctIyjHlLMk4ejCUF81CCFHOVZYoCmNBCUlX++OQvezF4fqZm3imJX8AC+LOHEFoRgMUpy+aU7tkEAq/apLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bfQMXj91; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bfQMXj91"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4711810948aso15789535e9.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 10:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763144510; x=1763749310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0Jh/y4rd6bYusl1JR/88Fg9gHoGK00Wwjf0mTqgXuY=;
        b=bfQMXj91woZAI+7gyL9UGVVG4vjjPP5XvAOicjucSdTx3nReZtFNoBPdmtQdMPs8FC
         4YeZhJdT97c6MnMZNsdUPhPXZjSLGMcIdNrWjwnT2ZE51/x6hEFtLxtGkLCNV2DXJbqI
         hZtyi98pgggdB1CkEb1WYCiqkjPyjFok8dnev0ny5H8dPhHT4qpETHSowrpR7sib/67Z
         eE8I6C20S+mQCPaxsHH1wvsHgdf8H6MeUU0fTroL+7Mfwc+afstuoAdqLHc1XR4NJX84
         LTdArOtE1VjOVOy03GY+P1GDa6HQ9Z5ZuwXj+Wn7xHQ0S9ycvZusshXc6ubmd8S+RLrz
         iHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763144510; x=1763749310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c0Jh/y4rd6bYusl1JR/88Fg9gHoGK00Wwjf0mTqgXuY=;
        b=un3XW+gVNyjbAvLvcJiA2+JJF4LkUGIzh1rejMCp23qmS91qyzkT1x4/2EV9moBYUQ
         iJSI5ni00XHfdba99DZpRLogaPLz5tV0smEZMJis1M/kTTTe5uOZ68800eXQWxwJxU9H
         2c8I2sjYzyFvgYUJGv7uDvhMXxKy781CgXtEsyeYtsiT59SI2mSTIZ+i8SzmpvlplFmS
         5C4IpVAT+oS1gDqF03SgFLSD4uWhb3Q3c+cpaRTdgtmu38ZhecEbEPXrWwkY+36KGeI5
         zEiqQxRAwVP6JfSa8PFCxZHLsN1RBX0wja0r4RXgtAswMsJrViqXEL+w3Z93Wa2D8JlX
         y/kg==
X-Forwarded-Encrypted: i=1; AJvYcCWwTMIEXJcoup+izKivekPFEejqQdNgFZQ7jizFMfpiJJy2VmLOVGGRJIq2Pb4LMdHRE0rnG4u178I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmJf72o3mZKNsRU67JWK9rlyM6x4Uw++f64rvEQjvRzkn58X/F
	MUCOg5tmOz7vadblPr2t+vwnTyXfWpeiSr/XgQSrbJUhmODEjKEAldjoODMPa3x3RBc=
X-Gm-Gg: ASbGncu+/gU/veVOJJXAlhackAZgd1Lfd244Q4YfhQbUoym8AXe7zNleQxIjXArRam7
	or3/qvsdyEU8tyKn85dfTBgOyP/RdhoTf1XNUYZusPuaTW4HpBWOpv0zPHX+obZd0KKVA722Jc4
	f6kjC/6FWeAiVxONFjxnOFn4N03SWcKW8xM0MIT2Npfjtawr0+gsvHjVnPqf1zxDZeLg7kYYWIX
	xAz07rorC9gnYXiE6A1J7DZCly40Ke2nRISUw4nIn868vM0ePzMEP+q+AS1aoOPSw2vjkQHMf6I
	yrlEOTDGU3CNfKDlxkPJebAN0oG05K6fjga/b6KvEgRINiQtNO7yZEBII2/gKxxUXXTXwav7CrG
	qR4y39d/9h5m5O52hBJZwb7Iu+kT+R6ZoI9siaBjh57+tU6114Sd2ZyhcEbox/OTu0mu9T24t7J
	qsEcUZAO8clxMBg5MXACQl
X-Google-Smtp-Source: AGHT+IH4LYcmx2WzqwQB8AbvnXVanJ3gtD76gT7XHcpAH1DooanzMDiXV8K06l1AzX/FmT+O/TcBRQ==
X-Received: by 2002:a05:600c:3546:b0:477:7658:571e with SMTP id 5b1f17b1804b1-4778fea2df4mr43176505e9.23.1763144509812;
        Fri, 14 Nov 2025 10:21:49 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm163601805e9.3.2025.11.14.10.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:21:49 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Natalie Vock <natalie.vock@gmx.de>,
	Maarten Lankhorst <dev@lankhorst.se>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 2/3] docs: cgroup: Note about sibling relative reclaim protection
Date: Fri, 14 Nov 2025 19:21:26 +0100
Message-ID: <20251114182130.1549832-3-mkoutny@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114182130.1549832-1-mkoutny@suse.com>
References: <20251114182130.1549832-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 97a9f8a046c5f..e0a659474fa47 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1952,6 +1952,10 @@ When the reclaim targets ancestors of A, the effective protection of B is
 capped by the protection value configured for A (and any other intermediate
 ancestors between A and the target).
 
+To express indifference about relative sibling protection, it is suggested to
+use memory_recursiveprot. Configuring all descendants of a parent with finite
+protection to "max" works but it may unnecessarily skew memory.events:low
+field.
 
 Memory Ownership
 ~~~~~~~~~~~~~~~~
-- 
2.51.1

