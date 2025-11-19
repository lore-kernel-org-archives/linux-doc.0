Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EC62EBB86
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567140; cv=none; b=Mm77oEl7zSaOIo2vlkRooOL+rqx8W4DxNc4ngayQ37L94KStWv7rgUZpBXfl5jdz+7/Mi2suYu5r6M9Jm/QdSusrSF/sMqmSfQ1EnZbOmQyFJ+XKApzMDqvbgAVDlX1MrZBWNkk2qw29TnPqiy4HqgHFq9pvw94qoi+0qYpQ82A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567140; c=relaxed/simple;
	bh=TD1by0OTaP880US48xY3+1tAtbimE4nLFyenW4Dl/t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CP5tLoPREFZOP5y7aHswO10EpTEUhDFlMwS3QmUq6s7e0lBxgcX9mtA4WqQeYUzoG3En7Gu9WYJbdvrJZA2rh9FIe1BarsCtrz2OouOHJqPJ5YiG4SXt//wKHMzmPW/7rEtkM7ir19HOyYAydw2rqApkECOTJmkh4UcjCuB1QPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kmDHNoQu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kmDHNoQu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b2dc17965so5618151f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567132; x=1764171932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THAjTq9x4zT81mmTnIarOvW/kNy7ppuR0bAFxzz05mc=;
        b=kmDHNoQu64HbmUGpkc9vYVbHScLy0U0K3t13WEAzv2EDq8a8uPl0d4aWu6NxEH4N1t
         DYYE8ac89yB69Gol4kY2PYMld6Mj6ywoy/rzvjIZJaK5HRAdqiRUeyuEFTVsLejLbh6W
         3TJ/neVjVhIoqjX30M95snlbaU209rNFQn27MGf9j4vlM2WJL/UQ+DElN6BeNUSNt0m9
         MtOlEDObIPHZ8AQoxYJFwIPUr/dgA/ysyug1orn6TqhN4UiVORtBU+5OYM511Gy710PF
         t+B5gphP+SGCjRgl3wzXRoSe9gTtaPOY3qj52wB5VXVOyBK1swi0MrDrAiE86iSXtahV
         SpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567132; x=1764171932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THAjTq9x4zT81mmTnIarOvW/kNy7ppuR0bAFxzz05mc=;
        b=JJGOge2LQaJ8Szj5ihBg86clk4SmBq8/tB57N06qH7C8Yb8+QzidVmEcE706oo67mW
         PzEof7tjCdrGFeBCHjbpPtpSe4Gzi5rm0bqQ9l1zfveVwDAk116UHjntJSwyBMSRz7AX
         XQhfgaYa5WeX6QpGSgWL1V8OTsql2bd2ysmGWWLl3USACMBokXnpARtMuWdBIYCLK+U5
         oHIXPUgcCtl9ITk+/oYV5sd4gPBWONDpj9VQ7VvDDjkA3J6V72IN9kRAFAJv9KZY7K9A
         XTmI+uh10e4ag5UW1wmGYvM3DEkxyB1WVBlRCHIL+eRsruRVn0tUX8GngKpPVtTmwGmv
         jf6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW53S6oPgA9fUaY4stwcfJSJrayEz+vHQlFuLwE9MKFpK23gG4D4xv82bAdDmPt0kiMivgBeVQZ3+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvs8YGy4YeRB0rgOH3jZ9thPskIrESMzE3YIRBP4+Fv/cUvrSm
	maWctKDajnxysVv9J9sc1vYvgbmXiZ1o4VMiGEfxmcQqxQIisFoQQ04qSbcZN+O8xb4=
X-Gm-Gg: ASbGncunTIGGIQaJovDJ8VIDr/Ox2wdqvIiTrNRiXm1avkh77ijMqwye1KRZfrIkeBa
	wZNZ4S95y7xQGE3jtemZmUL3dcsjysWVLHK/4rFtu/Lg6P7IVfmYKmBoovu2dAhtruFXwXUwYYN
	BoMO7Mo4yMN5lVZA/m5IRNDvJ8AX+YITIpNxFs2FTAswbFpVd19SWhht9VC9NyDflgg36pJp95U
	kCDm6cLLIaBhUu1Yt0TAfVFuF26OhxjTdOUYhno33Ze9mSpCOzyGIL6k+cTJ6b0s1TONsvnSHjp
	5xf0S86+adBlx+apqWY+3RePIQeVfcr46Fwp1rP/p2paLUSqXiQcvb5bg5o22MiIg0nu1WGdxvG
	zHFcyAv/keLsCYNYnX5eMnsnfWKT6m+SWnc2h2t7XV6vlIQHkrUEHX+HpwkopuI0Revfpt7Ukee
	vVvGQlZ9vgo/KOl68/jah4jYq9PrTe6w==
X-Google-Smtp-Source: AGHT+IFM/SLutYeAmIo2p7oRt8B5TNnuLzBZ4qt+3E18Kli5wgQjVTHlMxDsxZxKW/tnJD9yRmbxGA==
X-Received: by 2002:a05:6000:2a0a:b0:42c:a449:d68c with SMTP id ffacd0b85a97d-42ca449da11mr9102186f8f.30.1763567132399;
        Wed, 19 Nov 2025 07:45:32 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:32 -0800 (PST)
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
Subject: [PATCH 09/26] mm/show_mem: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:10 +0200
Message-ID: <20251119154427.1033475-10-eugen.hristev@linaro.org>
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
 - _totalram_pages

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/show_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/show_mem.c b/mm/show_mem.c
index 3a4b5207635d..be9cded4acdb 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -14,12 +14,14 @@
 #include <linux/mmzone.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 
 #include "internal.h"
 #include "swap.h"
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+MEMINSPECT_SIMPLE_ENTRY(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 
-- 
2.43.0

