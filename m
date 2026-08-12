Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72E53C09E9
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531207; cv=none; b=lNF8gr3akO6I506fqRw9vt6lEHsVUk9xglE8leeRnaNpbFcA++nW6u0OxTvMFXuirrfToiyzU5PzNdd1MOO+BIlL8IZaJTBHAQLCXjk6fGrg7GI5T4hFPkWl4xvShFd9eotx9FKRClG6bzUB9bzsaRDTu6fULyd82cY8MZlfawE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531207; c=relaxed/simple;
	bh=eK0hHCh+yZzclf4rIm6IurXoL5Ts7SzxFMQTEK3zrDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqwDGTcL56rjS3Cxu4g17pyewx6CTWppQgH1/0B2QSzngpUuoUT6y5eduNpKsEYOvltdNXpsEhdcpb54gu6LPEnhWRL8ThhLw0z87S/46Kx7zDR3J9N0gFZ4hKYVCVXd3gLpacrMuoqaN805EUrlKagz8U33T8wWBCh55u2PeEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W38GRUha; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W38GRUha"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso848088a91.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786531205; x=1787136005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CySejvRkZl+O/T2betXJvXb5NuBv/ihH/Yp2vgUVu+0=;
        b=W38GRUhaNpSyUwfoKcMnxnqkGXaIrIv+C5T5+0ni6MmmEKEsMyXkewQ6Eao+JvsUSz
         5cAGF6nTYTnXmhjFOhSThk9fW8U7D1oE20JHDHWfPuqA+nPSh3Okl8HZ9BRAbFyL5XF7
         A7NcsLGsNo8ncnwspwPYOPQpIMMv2pUq9CRK8GPQ/xwazJAZAoq8J0nKtIrQn+SlXLwS
         BtUOKOBUqgD2WhTt1HZbxYHi97YvWmxsoQRE+HVEUN42JCcDjHEZ5jgO7mv5Ij0Jj6xT
         G1Vz/GzZHWTVDA2xKny19gy34DXkpTUiyUzGsLWiPEieXaojhOnhAv/vXdrNl5jTl8EN
         7HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531205; x=1787136005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CySejvRkZl+O/T2betXJvXb5NuBv/ihH/Yp2vgUVu+0=;
        b=YJkrUla9oBBsJ5DzbxrigmovCGCaa0mxiFkEYEGcNz8JHYSuqdzoteY2/WK8/uNlv9
         B98N10UReL6PEm6K/Uw5Z0MEDhuJMBCrwMIHJW0nQVTB7caT2xja6hEbqeh5rt9tDcTb
         ZmKB8i4tuJkVISNe+aGbipJw0teWB/wtBhsZ6S6sj7pQAxEXDERCJcTE6ac/XqvDIRU0
         IbVmu/54qi+dEXScvW9dLN6nZ3Y9j9HBFt772FvjSKlAjXGBWl6trsnJ3dinrPpZST/N
         D+P+MytJc9CaPTJAfokMT8RLcNvnMQSj7qI6ab6Vx+xFPdNS1bBhYIi6Qm5vnTH/RVo1
         9q7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrLUq1/9s3ZhKW3N6poLeZEFUCH78JBTXnLP+b8oPqp2Cm+MuibmGsi7+Af7FVXLeE2HeZpa3rLYFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGF4gvzhzKltYpWRwK1iF0ApRS7P8roWpKCazE1zubPCZMBOCr
	WmM8RRYlZotCgTQuaL0UxI0nfME0ihrblTFHx2Kq08cPEwTbtYGEvA31btOvfg==
X-Gm-Gg: AR+sD10oPtk3CIKx0tnxSAcHNDqtMrU28SMFPugL5E9zYOWrf7XjK5TeAXDi0chGXWt
	r4P+q213+Zt3yeTMRPz5slG6mjF1F8PtJ9XeEp6EJsMigjaB3E/BJCwhtcejYqr6KhHwWl3q2xD
	2Bl0HgE1/LmQFm5xyXj1ne1BPEXc+EF629FQDh8m3mRxBwFyivfxd33oghr/XNw1PtQUhGbj7KR
	4Iies2jbGsaVacku33oj9V5AhKyHEL79cWPBozRL09Fa60YPUhnPtneI4HHQwzkybJIpUEcwxYL
	p3myW3HRb2nrXu3oothmcdw3XHxxXkV7PmR/EuWPQeYsUEWYb7gKyEvPjOU7mcHhwjarhPmt33y
	IhhhajZhRuvzmR/XVdGIoeYdza/i1Pf43/gJWFUY2EBjYr0v/y/ZfdAJowLIGpY+0qGhtrOQ7fF
	J7Y3CO/3jrTf9Xfc7esnhJhfIAYjvtF1XX5seYBnY4kygtJvz1GT3qqmUUKV6smiVMXDg72ZlRl
	xGsiwtY+iSGjBk=
X-Received: by 2002:a17:90b:398c:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39301433f18mr3789699a91.14.1786531205162;
        Wed, 12 Aug 2026 03:40:05 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3d0b432sm9931990eec.8.2026.08.12.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:40:04 -0700 (PDT)
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
Subject: [PATCH v2 1/3] docs/mm/damon/design: accurate semantics of nr_snapshots
Date: Wed, 12 Aug 2026 18:40:00 +0800
Message-ID: <20260812104002.15225-2-aethernet65535@gmail.com>
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

Change "tried to be applied" -> "completely tried to be applied" to
maintain consistency between the documentation and the code.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 Documentation/mm/damon/design.rst | 4 ++--
 include/linux/damon.h             | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index aed6cb1cf483..1739aeec6eb9 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -846,8 +846,8 @@ scheme's execution.
 - ``nr_applied``: Total number of regions that the scheme is applied.
 - ``sz_applied``: Total size of regions that the scheme is applied.
 - ``qt_exceeds``: Total number of times the quota of the scheme has exceeded.
-- ``nr_snapshots``: Total number of DAMON snapshots that the scheme is tried to
-  be applied.
+- ``nr_snapshots``: Total number of DAMON snapshots that the scheme is
+  completely tried to be applied.
 - ``max_nr_snapshots``: Upper limit of ``nr_snapshots``.
 
 "A scheme is tried to be applied to a region" means DAMOS core logic determined
diff --git a/include/linux/damon.h b/include/linux/damon.h
index 0c8b7ddef9ab..33914594fb48 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -357,7 +357,8 @@ struct damos_watermarks {
  *		Total bytes that passed ops layer-handled DAMOS filters.
  * @qt_exceeds: Total number of times the quota of the scheme has exceeded.
  * @nr_snapshots:
- *		Total number of DAMON snapshots that the scheme has tried.
+ *		Total number of DAMON snapshots that the scheme is completely
+ *		tried to be applied.
  *
  * "Tried an action to a region" in this context means the DAMOS core logic
  * determined the region as eligible to apply the action.  The access pattern
-- 
2.55.0

