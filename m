Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0670C299948
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762414738; cv=none; b=OzwL0mepdYnRRZvBbT6m7s4CxnXY9ajsjT67sfQWoxeFODzVcA4mn2nceULWPI5orqwCgj9VKNFq2NgksAsyOEmjJBA8tNPF5ywdF5upGiSfTv+FBlPyzvFTwg+yxFTHjOssl8FOlJ6yHHNJOjmZgI/v+KuGpDxX+wKzKUuUIdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762414738; c=relaxed/simple;
	bh=9WY8TkOVRVvU0etW8GXaJ6y6IJMbzV/8HNDNoXC63/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPtcr8+4X6sDZ8gABvBx60ThqN7JEvcisunRQGI6pVAhoHqPPgFRjLz5X0u41Uz1QyIEKT5t476l8tk99IZdNaYNnFu7uMn/Il8LEoW11HhZSf1JaaCW/xJtE0f5GDvJTtItW7Ts2R0h0TN4v7Vh0dgAWvAFOwEAwmR6ZxL4smA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnjn+WBu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnjn+WBu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-292fd52d527so6523345ad.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 23:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762414736; x=1763019536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EwyKXogPaS7V5uYOqhOp9kneyXDbmoOn+o0TDUIGVY=;
        b=hnjn+WBucjvaOJBk3nctSLxYcsQ4rRHHuJexM4YtGgQAmF3EKLNwy6s6PqUwAT+Xxv
         Oo3YR1Fbbx99WgE7HrQ2S+9rBL7iymuuQNuMemXGm4RmAzZOq6ov/4I7Yt9tIFWhwNOb
         FBae9k0PuC/yAnoKnw9UiVwkgHMQJsmTxB7u9cr85J8DxOq8TniSz+iG/GLa11+TzUG7
         ToodWfkTXI8F5xKYOF29ERQIeZrphXV/UVousdb38r0DfKSIHKOQmc5DjgEkGEt1bRyF
         lLWBbMZYLu+cp9o4p4SH2WppqbGJPIv5IGpXfBmMoXicA663jlAMuu0+ZvdX1TAw+U92
         Wrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762414736; x=1763019536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EwyKXogPaS7V5uYOqhOp9kneyXDbmoOn+o0TDUIGVY=;
        b=KFlavR0Lnw64S27zcNyqEwc15GIrvghPLCvJAvs3h4FLYtwior6yMz5FKnPg/Cb092
         lZHQemd8peNyMotq2uPlBm4Zz3ry4J39j8fcgPunqv13mIk2fscJ9GLp7mwghzxqK+Jl
         /5VsuD9paCFRy3/inWkSQLsCTf0JoHdpsWbKLeMO76qMQwWCgFG2bekKNG2nJb1/SDJg
         jBDOIXRlRaRiduil4ELNldnx5V57ZvfjclNT8DysIFeCIl6O9MWSNuAUF3LIo9ciPsYs
         I/RmV6xQuVRscHDyhE0OrcxJ0c49fYdZ5ZLHLkD4OFSxHD+UoNLWe6pQp98TsWbAmuRj
         PKhA==
X-Forwarded-Encrypted: i=1; AJvYcCU6AeuSfyUDx0tE/5TV6tmK2Yc1MTc37j+YKkzErHM58oCpMgqCqXiNGZK/r2Czn4fAKIYczs+S424=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+X214qN+K4QWcsgyZ9XtKF5EmgRdi5gIAcV96UsTqTsZXdqI8
	NY8DO1/okU5w9PkJpwlezlySgEoZxxlkW8eTIY0q98ut62QBbDwcRIQl
X-Gm-Gg: ASbGncsLJe+brodRM4DKeTpJ7HkWn7zdzKMUGiPHPQUTTAOhKqfR8OTl/cS7Nj1GmMR
	Wm+d54Y9asxL/Yu3C+R0EWd2qtWgDhsCUp04bVXaAhi2/Y16fvcVjaqMIozJJgPtW/NIgZLoJqX
	NrvLVnvW6V7E47PD8oZpgndoDDG4WnEaKWEhY7RAVd4Vz+5B2+Zo9Y6wXNnmhTDss4aGGJJdZ9R
	xzr9bhwSUWZehQEIzbiLFqwtfNTvSOwT2ZGW2wEGm/ZdvhrxdSDth+ExtVFK0wEqTmQxWcLad15
	+G/IYFovkhcdIi5pqOHfucueMBwLpkIoGzUF0QkPfu51FMTf5q4lx9wSNdLVw1HI/y6wafA2UlE
	n4a7H1ja08kKtp/tZvNqi0Tbp4KHoOIemh+o2Ki6jZfsoZUXeVKrMPqG1uBd0YylAJoLhcdHDdl
	oHeaDHsogCRCQ=
X-Google-Smtp-Source: AGHT+IGcetcHDEJ2pWdGp2wrehN+ji6EM3hz8DX0d/sJvq5qjS4UHY5JTdyluUbtQuWersYXiD1kdw==
X-Received: by 2002:a17:903:2a8f:b0:295:62d:503c with SMTP id d9443c01a7336-2962ad193f6mr95598365ad.16.1762414736274;
        Wed, 05 Nov 2025 23:38:56 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cce763sm17981055ad.103.2025.11.05.23.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 23:38:55 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id DF1F0420A6B3; Thu, 06 Nov 2025 14:38:52 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 1/2] Documentation: genpt: Don't use code block marker before iommu_amdv1.c include listing
Date: Thu,  6 Nov 2025 14:38:44 +0700
Message-ID: <20251106073845.36445-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106073845.36445-1-bagasdotme@gmail.com>
References: <20251106073845.36445-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=bagasdotme@gmail.com; h=from:subject; bh=9WY8TkOVRVvU0etW8GXaJ6y6IJMbzV/8HNDNoXC63/M=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJk8/i9Tl93VuN2yjltXa/2B/umzNayvaO7tDs2cw/vnY MOf+f6pHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZgIeyEjwwqBny6GKi7OLBqh V5S0c69YW8UdbAyt063teJb7RO+jGyPD4g/ef74fvxpyufhan2n4Q/PaUwsLs7Ts9dyavtctf9z PCwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reports htmldocs warning when merging iommu tree:

Documentation/driver-api/generic_pt.rst:32: WARNING: Literal block expected; none found. [docutils]

This is because of duplicate double colon code block markers: one after
generic_pt/fmt/iommu_amdv1.c and the one in its preceding paragraph. The
resulting htmldocs, however, only marks the include listing (after the
former) up as it should be.

Drop the latter to fix the warning.

Fixes: ab0b572847ac ("genpt: Add Documentation/ files")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20251106143925.578e411b@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/driver-api/generic_pt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/generic_pt.rst b/Documentation/driver-api/generic_pt.rst
index 210d1229aa1c1f..7a9ca9f2878d4f 100644
--- a/Documentation/driver-api/generic_pt.rst
+++ b/Documentation/driver-api/generic_pt.rst
@@ -27,7 +27,7 @@ compiled into a per-format IOMMU operations kernel module.
 For this to work the .c file for each compilation unit will include both the
 format headers and the generic code for the implementation. For instance in an
 implementation compilation unit the headers would normally be included as
-follows::
+follows:
 
 generic_pt/fmt/iommu_amdv1.c::
 
-- 
An old man doll... just what I always wanted! - Clara

