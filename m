Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75C426EB9
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531213; cv=none; b=Um1hfRHajdCUq1KQCZ6euU6D8b83Of+8F3jts1PIK4jZ2bpU11Kuo7HaJhVIglYW04aIZSr4dXoXzA1vim2NDBtsJSoRgPITvQ9a+qqWmvlADhs0A2SaFRZSBn6RKO1lNtOt3qM+p0DLoVbS2PBVH52+qPk0HrMxfaJYmUJCo6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531213; c=relaxed/simple;
	bh=FgV0EIRlXS2pNv/yLefwn1IDpSp+NZbkwedGH5rjvzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUif23yFozl1qqCAYxu1M8cW2J6lADZdy/i74LbiFaJzKtqwUjTICBxnGNmW9spuETZUf/bwm2/tfTLBULNwsduZQcsIlUEmY20kZdTh/fS5dmOfIXer2RoudomK+saDIvJIGuQxer8MtJSjw8g/cGRQhmY7UGJxWeJ/uNHzcsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DE3/eN4p; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DE3/eN4p"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso692530a91.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786531211; x=1787136011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxZo8B7n4c14lfP0ZG1amHyFP5yaEQUN0LvXnBt5yBg=;
        b=DE3/eN4pHCYhksWvmTLY6B8mEJcQZDS0kkeMixQJxKiasagRfG8Yd/mhPcSWeDcNAW
         OhdB5QcI7l+Zio++Vv2KzHsKr0VP+9242dgpCqjaLzezpDtiC5fkl3SxHOS4rTb1qLr1
         fMI3/WH1JQtnpqvJViAc0DRquk0rht0kId2pAi2Ck4gsCsxnBhKqTEDL8X5DTw56tznb
         aFVD7EGQozfZOxqnD7M/PPZNhbxzHZRePbJLRo6FtUzJEhOrsppGBhNqNWyRoUiIhcFl
         56FJwTWAu8+A8hZQ/Q7qoSASrsph6Etp+SUqnpKXtlZz8miLiVF5Wn1b0a03XVm0V8BC
         hDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531211; x=1787136011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxZo8B7n4c14lfP0ZG1amHyFP5yaEQUN0LvXnBt5yBg=;
        b=DXRpC5x8GPJByEdXdmPx+D7mPmxq0PDPijDVdeX+2gznZoy6QgrWwFR+LplyFv8+cx
         i2HEDGlLaseCeo8r+i751zFy/YeuMCdkmEiG6mjt4oTMN8bNargg4ajm2lAO0Ee5AADN
         qES5TBAkqaSEGQvwVQ0/Fh/J5e3kvyCBfn44eAq5bN8H23vz21ifWi1nhTQNjVA3yOOB
         ANeZu2L8l76VMGz9GbjDtXlwHNC8NTc0WDG9s2IXuvJS5DyFTmKxnbH42E/1p3ZwSfTI
         oCZvsjNU4R7wfqUgj41Y9G2tI14SbiOZUvWTkEAOv5nWGnli1qAIyQ4N/Kug3mUcLJfJ
         AcPA==
X-Forwarded-Encrypted: i=1; AHgh+RpExZbn4VHaz9EjGvyGHJZrS7c+0e/zFoQRL2UrvxWcjrCjFkwOj5YI/N5L3aNvnYKymYp+qH5sbC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx3U05ng04aKc/6Wl9QTv8z7N3euFpXPNc5Oj8x0hBl4oiWMD3
	bpOnJ9y40JEOVxh42nn2R7OjtJ2/Ro0SexgA96vzTdkpnh69qreBtYGd
X-Gm-Gg: AR+sD1077p9nVHtP3MRBBuNvAzIv7pKSjz4Ow3R7mE2r6UPKB0CASlkZooKLGGWbYVr
	A0elj+VX+4MBYQoAvQh729caFIWwP6V+IQQpoMmY8V9vp96kSPJe2twLKrawiBVUd1HZCvK02yo
	sHVAi1Iw0ywFb1tU3Euid+o6CVIKIVlot99xJVdic2jrufcbiwqSCaqupdjUnWmfinxT30hVuGg
	1A4gsV+BdWpxyPnlbt3LRHwGKs+XvkkHrKFAaaunBRgoQQyExO6IYTxHs4vncr4bXbMupYZBU9G
	e7CgAwNf5lxyfgq1+7gYZ6NGYzi1nYmc8tAlSynyaHEQPDi/USjJNRoMKyVapCC+2jZDFSaxf2C
	n5Du8L5Exq5Nn4aHVYrv92HQvrb10hVE67J5bmhNIA2xW9kmcL8Cd+Uz56Tl4Wx9XdTyQ+A6smy
	4Fq7g1eAx6hk8eeLpqVxAhco68TpPMZ090w4f4Ts1iqiIJ1vvCH3ZICTPD6gw8Xlu3s9G5PrpNJ
	SHsUHudqMWtYPA=
X-Received: by 2002:a17:90b:3948:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-393014fa36emr4204547a91.10.1786531211043;
        Wed, 12 Aug 2026 03:40:11 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3d0b432sm9931990eec.8.2026.08.12.03.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:40:10 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH v2 2/3] docs/mm/damon/design: difference between watermarks and nr_snapshots
Date: Wed, 12 Aug 2026 18:40:01 +0800
Message-ID: <20260812104002.15225-3-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812104002.15225-1-aethernet65535@gmail.com>
References: <20260812104002.15225-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explain the difference between nr_snapshots reaches max_nr_snapshots and
watermarks.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 Documentation/mm/damon/design.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 939298f2a9b9..1fcf0b8c044b 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -872,7 +872,8 @@ the action to the region will fail.
 
 Unlike normal stats, ``max_nr_snapshots`` is set by users.  If it is set as
 non-zero and ``nr_snapshots`` be same to or greater than ``nr_snapshots``, the
-scheme is deactivated.
+scheme is deactivated.  Note that, unlike watermarks, even if a scheme's
+``nr_snapshots`` reaches ``max_nr_snapshots``, monitoring will not stop.
 
 To know how user-space can read the stats via :ref:`DAMON sysfs interface
 <sysfs_interface>`, refer to :ref:s`stats <sysfs_stats>` part of the
-- 
2.55.0

