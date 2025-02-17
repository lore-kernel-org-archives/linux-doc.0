Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A22253F7
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 16:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739809011; cv=none; b=uVYy0++uLknwowPsslwKV6TDcsLCJKv8OPzA/liRPlemSXsKlYctayJjC2u7TVKgTD2nr9rp4pyrNauZ15pDgKr8gMEFgTu+oyB7dTxP1/flWGHRyZjNL1Jn/ay1+Ob84M64AlfZBle/Zn6T0tOkUlQspckl2oqjN4UOOMz2Pg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739809011; c=relaxed/simple;
	bh=eNm1u1yD/tJFz/hLpTn/D+kXMNvH4H8jyHqOFpKjcAc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jNRpENg+EgQYQr85M7RvIH8SHpsaOeX6qlousMiuubbomTX0QutRdwzrLfzzsj0iY22jUMdwLD/WyjSBXAB6YVSGh5mBd+maDQEoAWR2TkV6+CFyma8f7ZiA4d+Ln5TKcwL6vndQmk+Agvlaws0Dn4B145ma/d3YSWZQ3Y2xVzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h9n556lQ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h9n556lQ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc1e7efdffso12556182a91.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 08:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739809010; x=1740413810; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5q6MivojjuRSczcqRyW+HMzmo6ZNPyUvZ6S6j+sB8Xw=;
        b=h9n556lQlUNjCudWJsDPKxD/LFp2onGLCZYcfnt/4koV9JPhQtpgt3swzZeMdOCdiZ
         A/SlyXKhrnuji+YQJVECsav4NcOazmbtzeiQcueOG2qQwlih32wF+Z8HxSZmtzhyPGgE
         7ieLA+ZampSZw/3dYgN8JavOuJ5GQp4dF+A3Jr8MMvpSJ/pJomXUhSnkhFAD9sOpEsvJ
         YrFFMrAYo/pELBDs3a2kLHW9n1niOz+sp6DYPKVaUgfYGUmbNnMGaCis+t1ThOkizJgz
         jEtHi37idHhvac64gIaQMdrPdQ5a9BGjIiqrU38eJ+rI+diluPsDMivrZLeG+esg8dLf
         jR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809010; x=1740413810;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5q6MivojjuRSczcqRyW+HMzmo6ZNPyUvZ6S6j+sB8Xw=;
        b=VJu1a4+FyJ3ZFZQixxgXaiXbItdaGh98oAYwi4G4DFQdDWSdDdZCLWErvh6uKJByR0
         M8xkaYzO44ay1lGiCOPUCTqm5F1Yx/M+jNrH1VlGp95jgMelSaorwhU8uqsoIadAURAx
         lhOLt2x21cY/nPqtuUSA0FUvT9O8Sxy4rXF4y91VdYpWCWpiY2Zk3L1vuHzXuuEkFAFW
         JGT2y5SaW7hDDFwHRZ+wfE5RhOWcGiZyFypd59tsIM/ylfXuWpBZUAINBDyqQVwAChAv
         pv1knZvCheQUt0zUFDptLsRGNy0ilyUuZz0vERK+TUeNWx6XJv5326ly5v3YAc+6JoGW
         Qugg==
X-Forwarded-Encrypted: i=1; AJvYcCX15UJ6CYveV73/1FpPIFNW1A2+0HLF9gOHJOtGtFtR8XoO+NEbhS3yVmQFRab7G+g9hqdWhFFOESk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPva4zcnPv+ZmQZbtUtncq7o3NZAUZ5e/k+43wag6UFQbV6+XB
	jCTlgfA2Ywh2YT4UdR/h2HO+HMULsqvKG/g3ygTbokgz0AHL6d7HIwoeZD2bCbwC/ajPq68Qkoi
	r8Q==
X-Google-Smtp-Source: AGHT+IGBglkMg+gN/OfYbI0/G0RB1yR6u09nwC0KxK8TRXKTMyOYGrP0GW8JQQ7P0pyS5IO7JZ2ZKcUkw/o=
X-Received: from pjd6.prod.google.com ([2002:a17:90b:54c6:b0:2fc:8b7:f422])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b84:b0:2ee:9b2c:3253
 with SMTP id 98e67ed59e1d1-2fc4115060dmr14701220a91.30.1739809009706; Mon, 17
 Feb 2025 08:16:49 -0800 (PST)
Date: Mon, 17 Feb 2025 08:16:45 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250217161645.3137927-1-surenb@google.com>
Subject: [PATCH 1/1] fixup! docs: fix title underlines in refcount-vs-atomic.rst
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: sfr@canb.auug.org.au, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fix title underlines for newly updated refcount-vs-atomic.rst

Fixes: 03b412c8b184 ("refcount: provide ops for cases when object's memory can be reused")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 Documentation/core-api/refcount-vs-atomic.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/refcount-vs-atomic.rst b/Documentation/core-api/refcount-vs-atomic.rst
index 9551a7bbfd38..94e628c1eb49 100644
--- a/Documentation/core-api/refcount-vs-atomic.rst
+++ b/Documentation/core-api/refcount-vs-atomic.rst
@@ -87,7 +87,7 @@ Memory ordering guarantee changes:
 
 
 case 2) - non-"Read/Modify/Write" (RMW) ops with release ordering
--------------------------------------------
+-----------------------------------------------------------------
 
 Function changes:
 
@@ -139,7 +139,7 @@ Memory ordering guarantees changes:
 
 
 case 6) - increment-based RMW ops with acquire ordering that return a value
------------------------------------------------------
+---------------------------------------------------------------------------
 
 Function changes:
 

base-commit: b2a64caeafad6e37df1c68f878bfdd06ff14f4ec
-- 
2.48.1.601.g30ceb7b040-goog

