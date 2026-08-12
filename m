Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F4346E67
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531200; cv=none; b=NgX7NiWvs8TlLEFzfKMgu3C2TDm0zs0/2IfUQmIAp5YJpe5IPrs521LPc0TkIYfk7Ul6vRnrlvaB+ied8hFIhBBbRjABm6y2aBQfy16oPx2Lr/I14KJgX3SlmjywdhvIxtbCvoj+jfE0WXDTWjTAXBiYt/G6hZs3FwJoJx7k1IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531200; c=relaxed/simple;
	bh=w9hf6IY23Ggm7HeC4zUFI1dGoXifCTC/f46vQjCnccc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qlnRdyj+r8Idf9u+CAq/IqCEoLtfaullcKuppvTHHaTnVZG3U/VDnBKx3H/SS85vGO5r/5XFKzuAeeKvbCTHj7r6/IJmQpniSuQmMb4vTq4d+7Vi1w1HVxdZqulNdPNUeHI5fCiEZC5OsbA4JIcyyHiL67sXdVrTCNcoPr0kXzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtgYS+an; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtgYS+an"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbeea240819so194953a12.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786531199; x=1787135999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/zbV338bs86RCvE0uOChgTAyhcecT4O06NPuUtGzAI=;
        b=AtgYS+an+tCo6i1uCzKpqRqeu6Eg+0vs7cSKBYcQv8pVjIbGkJyA8ybGIQWMpFQcnv
         g1AWTStb9YBEQ9GwkNEnyYGufHGT94iTnbM5et6xCqXlCl9k6dHh1x6q3h8xL+XFNxIz
         hVrkf5wTQ7s1bNaAHCdsxa77anT8Z08G1eAWSCubc+u+oIrGMFfRb/ZK6VxBHqepCGW5
         W5CVSk2hsewzQU6rOZLJy2nWoLb+IU/QCITIml+UKui0B9wvUmU0/f/O3XMiX+w9Njim
         vnDULm1iw7jeA3oSu6ZHaSQwDPAGbFlyo3I3Nm4aaSzq0fL5F8pAbAVLypi+fGS83DBH
         9I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531199; x=1787135999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/zbV338bs86RCvE0uOChgTAyhcecT4O06NPuUtGzAI=;
        b=pWrCggx1uB01jFNwXHm2unxESspLTbSOmIZ5PsB+wN4WF9e35xiIlimX+tApqTJKH4
         HXR9SUvYuMov1F8CLmAn+OY33tjm9Lq+gw+t1mM9Gb4JP17cnLwogeZnyrQ1aDUI5SEU
         BvMkHfETJS1Daii034tfx5lFNtnrxcBRMPeb2u2eZu9nvk6sMmCfXT+3RsVxDG03idyC
         jdUP05rJp2Ijf57izKYAja+OQIzOGxOjGvu4oUFIZTpj/1f3JcQP094Wuh0l3vttljdJ
         +P9Mc0FwkjGOaYJb8sBTK45vJ3MFGNBzcQtrTAUZWLrfVcilOmEgUaUJpP05jCPnuMj2
         HxAA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Qadm7ud7vq27LzeL0bf5zmibPq7mHFCwMmGpOC0+Pu9qGJR3g4jx9Y99XVCqdZj+/OaOayGSO+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfwZlZ+nHvXsl6ZV7heBaBD+li2etGHqNtl3IYpRYmZd8hBP3F
	y0jocHwumcSub1T62WMPOs0M5Oqrk1pLEHnNUa3SYDrIqU+ESc7r/TEU
X-Gm-Gg: AR+sD11FInmCKkmPidDmjQlLnIT4JEit4c1wjcVrMbAh+1M6fQBstGox6nmv3QWUEXq
	W0tEJKdW5vC1KxsUa1VPwgCMnYv2fTxksiMVOJaP7BY11NL/Um1IY8eJZGJsCEaGLF3n8dvLmiz
	Y1eEV2u8ZoDmvmwiHWqizdfQ5TXqirDyt8+Bu+KmikJQ60qxVIDAFDPHB7+HG6Y8S0lvSQozDKi
	+hj/wdQ32FZvXi/tlrawfbbiYPYHplu5y77ItE34cXo2yCIekpSYrVcOeE1/eGV4izQiMPc6Fx+
	82Rf38ldZNST1xWFpixh1YKrxm89v6ySbntfUXqZzRu0pK+DAZiS2KmsA4IXGPZ7xvXwI+niZvU
	XPde92fNtZoArBJqPtDkJ2SZ/htGYQL2xUadP0bw4Hq+Hf2v0wxv9h1SXlP9/BAm7oFENuo1ESE
	Sz6/EmAOsUWSUXttjXSDqCxo8j21oQ1SiGwxa13doBS/VQ7PsBVg2K6WWUfn6gpMNuUM9xL68Re
	rtDqK9cMr5/wb4=
X-Received: by 2002:a05:6a21:9cc8:b0:3c3:875d:704d with SMTP id adf61e73a8af0-3cc3f774c67mr4263074637.25.1786531198591;
        Wed, 12 Aug 2026 03:39:58 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3d0b432sm9931990eec.8.2026.08.12.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:39:58 -0700 (PDT)
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
Subject: [PATCH v2 0/3] docs/mm/damon/design: add explanation of nr_snapshots
Date: Wed, 12 Aug 2026 18:39:59 +0800
Message-ID: <20260812104002.15225-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an explanation of nr_snapshots to avoid misunderstandings.

Changes from v1:
- v1: https://lore.kernel.org/damon/20260811101841.804596-1-aethernet65535@gmail.com
- Patch 1 word order adjustment: Repositioned "completely" ("tried to be
  completely applied" -> "completely tried to be applied").
- Patch 2: Use two spaces between sentences.
- Patch 3: Add the "Reviewed-by:" of SJ, because he added this in v1.
- Patch 3: Make some minor modifications, Patch 3 can be applied after
  Patch 2.

Liew Rui Yan (3):
  docs/mm/damon/design: accurate semantics of nr_snapshots
  docs/mm/damon/design: difference between watermarks and nr_snapshots
  docs/mm/damon/design: fix typo of max_nr_snapshots

 Documentation/mm/damon/design.rst | 7 ++++---
 include/linux/damon.h             | 5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.55.0

