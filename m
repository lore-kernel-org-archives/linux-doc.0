Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70072335BDB
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 19:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803409; cv=none; b=inCLqXKkvmFuq3+T5njm7tBZxBnz45wnZuXWf/dV5iC22u0UA2MyRdPCzDSGOwaMA2tX9TkU+yecEG1Ew/uaiW24u8h7oYhPi5B/nziuJL/IHrPmSJHbDG+osIpifxQ3wJmNZRbtGaXm1jUWOj2DbE7+bu8GheRJfifodsnk5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803409; c=relaxed/simple;
	bh=W7QWppO42nNFunrHW0x5wrq6A32TuLyhp6ZUGiac+bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=airWJlPPfY2FerQeUtz9B39knV/Co2GCK2x9RsofDKI563wHAdUh4wHF0fLwrIMKOYZRqFIxDHO/jWnjYnTFRu/xn3t37wiKNlr44pWoVOc8T8qQjfE24dw2VS5w44QV0YdeD8CnaBMQ42/h3mIiRsf19ddFR0OTMUDeN0pRoIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Bmtp8f3i; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Bmtp8f3i"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477770019e4so25001005e9.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762803406; x=1763408206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTWCP6bTspm09Lx1U+q7f0BGQls8hOwZj+qwEbwY0Hk=;
        b=Bmtp8f3ihF437cwFJkONx0B0z3nb9BTfIdUZ/AhBRg7D7HpbJAv5crsHZjdQXgOeAA
         MiFifiCKwN691N/naK0GgAf+AEX0SW8TkBtumqkTk8VUPVmu0BN8Ek6bfoUEl2NOvZwZ
         1+vbmjJKUbZCPhIzuIbZ5Z8doWYwBNLaWWwHRpBXfzVE0nozaesXeNoOMOQ/dfcCGdAn
         ijV0M8LOn8zJa63WmV73roZn01oCXnFN9Z8DAmAecfsEfikoWLPGdyJFMbDNcmdXEigD
         1AZOAKeAvKjuklN3446J4X7w7SxVqIqKfSaX0rA0DiJ0QU6uTUv+Py4lNw0p8PgErjQe
         4+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762803406; x=1763408206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTWCP6bTspm09Lx1U+q7f0BGQls8hOwZj+qwEbwY0Hk=;
        b=SsIOK6rBJ9LXNjqEQe7hvRMjBkwsBmmQJA8tRcPzllMFcfsQZvFtmvy9CTbV0gP3L5
         NMD1H8NXAxVpKrS5xyCVHWJZh3217XwVpzOp1Q4MucLdWhbVu47h53Gcx7VPhoY2NyuX
         qtIRUGHjok71vaqHQDlI91F/+StlhXeUwAOyBr4zRiLmboibgGC6lpBC0nKuPQvYzHOb
         cGqXhbikuyWYj2x9CLIfJnMmXpr8/LsMAHdmgiikRs0ivKAdwZzir/VaevzD+Cixpbth
         IRQxm2zvPqeIxwckebO3Occ5Ntk4m//dTx3wF4egAZ3NlvFTHbjJUXyno6LzTUBiOe/T
         26pw==
X-Forwarded-Encrypted: i=1; AJvYcCXyS1T6fKYd+0b3xtuBi4g2PDoeUB4cvlbWrmMp8mF6nkE0pywsuc9wAfte1vFqKK/Q1LJzyb2PvXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhak2pdbvgYwCe8j3jM+Mlw9pJ8vw0Vuevygu5nVSgG3wu+95t
	O7lPBNNQID+sELVsU/9dtNJ/gug1d59+kEzlQM0JOmPjbyKvpD1kHKiU0lDEWHXpG+I=
X-Gm-Gg: ASbGncu0oYiRXAYIoGH6BtFd4fjr9t5MWy2q1etJuLsbaRc3zb+Fcfk6NXZKc7RGj8l
	SrZaonMVKK13/7V4rxodGm0bySZdiHhlB1lro2iF1htuhs77WUSalcfIfoCUUwEb32I5VV3CJjH
	4N5VZqRe8GQpZadwphaEe1849WyvlAnm/43gsIlJ8D4UFdCJIKBGuXduKa1PTDpoI/CnC+g53C6
	VSpVDRBLXPH5XR7tJ6uSQHRLoj53rR76FNSX540wpEG/f78QpKEYLCGR5b3BJJofggbkhRaMH1R
	DUyRszQWusiStcnt3o8Wtp4/FT/lcsYAkjV7dR1TQ52jTolrQoaJIfrJF8P+O0UklQw+NnxXvyJ
	0jp5i8qHPLrQBsLVNnJFHaepDlujDIJqhnOSvlGn/xPhFIN5MdWQ+m0lMshQgHgieFNilwY6Eo8
	FnvbC34igYGE9wCwBNBu7n/dxwFxsT9xs=
X-Google-Smtp-Source: AGHT+IFUxtkfJc5KA5FIRPDpNTMLzR7n8nqQXez/mScawaL2NDNh5hWWSSs2Qhhirt5MIsnvEx4uwA==
X-Received: by 2002:a05:600c:46d0:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-4777327b249mr88103205e9.27.1762803405768;
        Mon, 10 Nov 2025 11:36:45 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce32653sm336766725e9.13.2025.11.10.11.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:36:45 -0800 (PST)
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
Subject: [PATCH RESEND 2/3] docs: cgroup: Note about sibling relative reclaim protection
Date: Mon, 10 Nov 2025 20:36:34 +0100
Message-ID: <20251110193638.623208-3-mkoutny@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110193638.623208-1-mkoutny@suse.com>
References: <20251110193638.623208-1-mkoutny@suse.com>
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
index a6def773a3072..be3d805a929ef 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1952,6 +1952,10 @@ targets ancestors of A, the effective protection of B is capped by the
 protection value configured for A (and any other intermediate ancestors between
 A and the target).
 
+To express indifference about relative sibling protection, it is suggested to
+use memory_recursiveprot. Configuring all descendants of a parent with finite
+protection to "max" works but it may unnecessarily skew memory.events:low
+field.
 
 Memory Ownership
 ~~~~~~~~~~~~~~~~
-- 
2.51.1

