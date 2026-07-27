Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBFB3EC69D
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163584; cv=none; b=orF6d+WeZtdWpoo4m2diyu58DNfgcpiqkzsEgeaqetvbwwAARJp4Sv/ifGyRqwGVM73NngIQjvEVqixFJVjGSk78QRtwNl/ZAp4tHKLwGUIJqpuxs5vFi6vlroNxCWJeGcNZaGGZZnlsVnq+fBsDTXTx+omSKNQ7rtJX0BvvnBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163584; c=relaxed/simple;
	bh=UFgwWFaUDHNfS7pe9YQMo1osWM7ZIU7JHCt0yYbjg5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEAHo4lh6ojOY4tKCyX7eKdu0/vgO9FYBkZpRTCV4kpluoh0/zepeCpwZKaqL7SVGCppkquGYKdULO2AU0ZUk2Gtb7aBKi1/FKnNEGCHKHZpKf788bbEoKTwBtm9cjh/ufAmRgXp6qX5yLliUOYOzroeg6ACiZd1RMDRN+fSgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dpo8gozS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dpo8gozS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so2892535a91.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163582; x=1785768382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ystWRSu0XGzWLVNCp/qZNWLqhKRo+gG6ngoi7HTHAw=;
        b=Dpo8gozS3dYU/VR6/KLEoxEAm57cjEBbrDD/VQiy/a60L6Js1XnloFkx7LYGDNhMLH
         SDSpqP/Xmv95KLbqOHQ1TEEuw9z2mjr4vgf1bA8sdYPtm2QtJG6Y5hmHZBCd7gAgZT6G
         AYeJypJS4pbQgtYDB6c9gr1I1y/EAf8Pwr/p/zV20GgZmGyg1TMviR6ofR87VJfUOn++
         sBkFbBYq9tAnEQ/wmtlB/+nyunLVz66Th4iiYtbdggWz9tH4Beg5hdaLgXk3lcwlTW/v
         9u2UcpBI/BDuh1P0Z8hye2z1jvES3zp9lh2ktEbYWRQL4n0zoMXU5qftD4CmgQysiJKa
         S6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163582; x=1785768382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ystWRSu0XGzWLVNCp/qZNWLqhKRo+gG6ngoi7HTHAw=;
        b=rMWbApLUYPWwaGi0XHjUnMBsHryHyuyOq3i1vhVpNj58FrahZxn+3O7t6/t5yjGnup
         vvwvdAhnQIXtxRJSRmpuJxzdVaRK7FV817bi6EBZfntAofMwfj1WDL7nJQ0LuBqTTJi9
         TbDWGR1UxVOIwCK9svcgph6XQTDTmnavuvCmtg76sPCpsFRp66OsermAI6tW4K2h3XTY
         yL5WB282byo21pHco8se/YcQCjFGX5sv7mQeIkEWdcp8twgh+EkjGOipT9U5ZbGb5peH
         XuCXZ6o7E5C7KxwASrDXEOjdjXc1HwcQ34fjlWQyi4xRPQ/Y/VLYDJRCqa/7mylOugd2
         4JHQ==
X-Forwarded-Encrypted: i=1; AHgh+RopYaT1IRjHac+R9YEJPq0VTp/zO12am8+fmvgiiJFOEqiMWJ/T5IDXudGaYbIIgaI2AtQHTXGVUyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyubfdF2kFB0ROFwGxEZIsblPklP0H1/XPtP7eVXiu79JAo7jHK
	pzAl2K+nCMogvNEBa0U/5d2XDm4vw4rSyfsxktVzmk/3tpuvF4tl75M=
X-Gm-Gg: AR+sD13CdP/RRC38CUjmehyae9JNDv44GQXju2gs4k1zKRrDjra0mGEeCrGsX0C6sNd
	4eO8lLEhJNLZS/RM0YvcwpHEJU7MVCDmWTfhMwQdoVpeuVA7Rqi7bJftM4n8fbZAQAfjMYlZyMn
	6a40SZN5l9GYSTbh6zl4wblzSf//Ste48ogQTS8wZGoF+LGANZP4MVjEdN9DrWf/u0WUGWhCGgo
	wwAapIbm9wWbZhPhp4VJHoerPw6uPD6RLOoyzmQBdE8kS9PbymQq91WRvkPQl9KhAyxGqcNLwmU
	MlrBQh/NAphBXsyMpIuQ8AB5SFi4blmmJotDSQYK4T/MLVco99kr7cIwZPLPB6RkuF0/4sMwBac
	CtA+uo/iqyIZPAuyT/KWjIlC7XX9ALRKANFoRV87oOFwCN8TElcJUUR+dTjHW3tOuRyUqCLWGVZ
	V3O/A6jpB3wfhjQ78=
X-Received: by 2002:a17:90b:2882:b0:38f:23d6:b4a9 with SMTP id 98e67ed59e1d1-38f2960eeacmr8121155a91.21.1785163582082;
        Mon, 27 Jul 2026 07:46:22 -0700 (PDT)
Received: from localhost ([2405:201:8018:1843:e360:cc70:1bc2:d35b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2d1d0d1esm31948578c88.0.2026.07.27.07.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:46:21 -0700 (PDT)
From: Ayananta Paul <ayanantapaul@gmail.com>
To: donald.hunter@gmail.com
Cc: kuba@kernel.org,
	linux-doc@vger.kernel.org,
	Ayananta Paul <ayanantapaul@gmail.com>
Subject: [PATCH] Documentation: netlink: fix spelling in tcp_metrics.yaml
Date: Mon, 27 Jul 2026 20:16:13 +0530
Message-ID: <20260727144613.12381-1-ayanantapaul@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "reordering" which was incorrectly
written as "reodering" on lines 113 and 115.

Issues identified using `codespell -D - -S "*.bin,*.o,*.a,*.so,*.ko,*.gz,*.png,*.jpg" Documentation/`

Signed-off-by: Ayananta Paul <ayanantapaul@gmail.com>
---
 Documentation/netlink/specs/tcp_metrics.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/tcp_metrics.yaml b/Documentation/netlink/specs/tcp_metrics.yaml
index 13144aeed31a..dddf92bedc4d 100644
--- a/Documentation/netlink/specs/tcp_metrics.yaml
+++ b/Documentation/netlink/specs/tcp_metrics.yaml
@@ -110,9 +110,9 @@ attribute-sets:
         type: u32
         doc: Congestion Window.
       -
-        name: reodering
+        name: reordering
         type: u32
-        doc: Reodering metric.
+        doc: Reordering metric.
       -
         name: rtt-us
         type: u32
-- 
2.53.0

