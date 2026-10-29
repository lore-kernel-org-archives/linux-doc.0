Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297429;
	b=uvg7vhfdBdBkk022aGlWjyacoLWVmEkzLMx5f0pki01REhk6lR+fPIeYDqHM1qUlXBgL
	 oTroAB6GPDEauuNOYYXwb6JF2DhqTjP/yvlm1WCjrtnf80zP2bCn/AYEzB54nFfUqqbEB
	 KmaER28IdGwPtsHm4QEaVI4Hw0F3AbP+uRFOo90KsuXck9sHVQ/tFiGTy1+X0KrnsESHl
	 lTZr5V0y8qNFkRpW1VgqjoxHmbuEWWWDg4oM2TopwZgp3gPMowCZquGMWdE71pBSVLUt2
	 8Dn74AuCNZcAX/pEemPDJRWgIRyopMamr07+vC9jG+LnjwNmdaRNwJMBIyiaTj63bQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h/Q9DLGqoDPx/XvjFFuDFe37sX7w21EVwh1yv9Pf91Y=;
	b=r03Lqqgx8Jl4oyejaVaBUfU6/gIsAXNgOjCcn+FShHpRlpEuXbfwUdz/SvxBO2DI1c2K
	 c8oJY6xuTOpL79ncWaFa3Tra0sHHtFHqtHht5mbVbRpguY88nEAAduKuOjKtdr9U0S2L7
	 3eIGog0fQwSLEllESb8rgojlli5t7NmpBOf+XbsCThKUNviySWb9CSAmsjCK/a9+cc9Ob
	 5b+sAmtT+O+G1ofoq2yltyZKXSR2PBWfR+QzRN96g8VFezlUXV3DLxmtFY3r9IB4euH1X
	 aSfXuYinVz3s8wSkCbMbz1T1nGu1o8KrDi5k4QSWgytZcO00AeRh+1AAZG5rpi1WSNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=K9KYxWzC;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EDC60A3839
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 18:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3EDC60A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=K9KYxWzC
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-847ac7ccd85so1647885a34.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297428; x=1793902228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/Q9DLGqoDPx/XvjFFuDFe37sX7w21EVwh1yv9Pf91Y=;
        b=K9KYxWzCPyBeEIuu0xpic15O7tkqjAgj1nlmkbsQeMWvTEey5aLgbok8m4unZflqLY
         rs5fGM87nV69qB8wilEMbeXeAE88KP9x+lNfrUrKwQArfvUXNC2uV/OQZrUUapzQoqms
         vl6mrG6fe9r5iM3347P0w9f4+fd3IuhyxmhGFebTjl8VZR43FAFyIgmRZSZ33LjLmsS4
         OP3WuXl2s/15UqqSNeOKc0PXcccomgQi8PL12E1a2styv3LRLiireJIzjhCmd38KLQC1
         0y1fJALNITtpO1nxWvBnGQDumgMFnQjGS7ppjXFe2g4UxkNjTRViIV9I8CyqKY0Y5IdR
         ZV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297428; x=1793902228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h/Q9DLGqoDPx/XvjFFuDFe37sX7w21EVwh1yv9Pf91Y=;
        b=lZamjFZSn/c50dntTb2JdhwVg7lS3E+0XZoy+FOgdhRc8yTx9qJEJsWDUa/MZTpfF+
         b/ebi3dLxj4phx1tR+f7dpwn//tYbmXD+R/Izl7iPRbYiDs9iu5EvNjBSFFkluGIBcCN
         AuXpsYupU9VP4Bz2sVdTItahtRpU2I64wk4cZaT0eMTmP6UW2/wQ6ROT0OiexJy6qjoj
         4SCVHEtJnl5o3LHkH5YDO/9fi6RTX78N1kJ0c1pPCJtadGyPgruz2OkbeAUSvJnJXvX4
         9/WM4Rqigos3I9tR5MOQ1HGgQGGSD5iPmhyZGlAYyBf/Rttc3mF7mRm2EPMAnQorrpha
         YCXA==
X-Forwarded-Encrypted: i=1; AKwUvBz9lrVLXHhzRvWqD5puK5ZdL7NbnMseOANUl1v/7eF/cyi2NTzZRwm0Ymj2AUs7rLizDTfNlWP+1XQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0zDYXIZhVzBhqHr7yxLUuDrYfFg14oYbDFOlNeZIMD+ll7lJy
	bQinptZtKLmM/fP+oPV+BRpsuI/S9cX9I3EK2/T7MLbj/hqPJleiMVDh2IBXDr7JnxY=
X-Gm-Gg: AYBFou3WKwu8dP1XLYRnKUx6GInxn3xNLC0womOe8puHggkgCy3tW70QY1xuEvnDxk0
	jdQ2tipL67L8fRE+8dkek19xesJ2V9fWVQY6BEZ7fEMk4qPNiDZhkobhsmA+qpz3N7H3MhXd1xn
	m0S0MI3axqYrYodDpdBkWxYlS498tKsbiQ806kj3/HOhW/NbHK5nNYH0tkA08hiHqjqAqPiDId1
	kNZpci/qFV4RBszSIRw7Tx6WFm9GgbeGQDkW8rqDbQ3ksh2sTQvSAm9BIMyyLj6OxY1CqNucfzy
	iQOThEatT8mKAUBiUIR04BxfakNIi44AeQ8CnlRu/y4xpu+4XMKosvFNU/DY+uUXLZ3buWLCgy3
	HJQhH3As1g6qb2Z+wtip08C5Cc4CTs0rqi30zVjuuR8BmwG5F9Da/PWLqf0wofHiLVCqSX7eqhy
	v1hfvyXgUZcZCLgKJ858s76v1wTw9v075sXUsu+nVESa/kjOe2WAXf4NffZKnvsRn+kvlTJpCJl
	7bmQ5bslLVqBaR4XBN/qHWDC38fhmIvXCAi6OV/2OhKeioRcKMbCA8ngNprkbXPsGSU0AtvDuV1
	3kNjIjWvQ3TPFZWn8wSH1gJ2eYhyb5fuMApyP6FidWiTGALJiD/qp2aSeRv63+Uw5PM01m4acw=
	=
X-Received: by 2002:a05:6808:181f:b0:54c:7bef:90d6 with SMTP id 5614622812f47-5640dbd679bmr1506b6e.4.1793297427868;
        Thu, 29 Oct 2026 11:10:27 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5437cfcsm4755474b6e.4.2026.10.29.11.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:10:26 -0700 (PDT)
From: Jonathan Flynn <jonathan.flynn@hammerspace.com>
To: NeilBrown <neil@brown.name>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 12/12] nfs: remove files with the parent directory locked shared on NFSv4
Date: Thu, 29 Oct 2026 12:09:57 -0600
Message-ID: <20261029180957.387138-13-jonathan.flynn@hammerspace.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
References: <20261028041023.3738553-1-neilb@ownmail.net>
 <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let removals of different files in one NFSv4 directory proceed at the
same time, instead of queuing one behind another on the directory's
lock.  The server orders removals of different names.  The client
orders a removal against lookups and opens of the same name through its
cached entry for that name, and against listings through that entry and
a count of such removals kept per directory, as set out in the changes
before this one.  A removal it cannot order that way is done with the
directory locked exclusive, as before.  On a server that reports itself
case-insensitive or not case-preserving, every removal is done that way
from the start.  A server that treats names differing in other ways as
one, as Unicode normalization does, is not detected, and there a
removal is not ordered against a lookup or open of another spelling.

This covers every NFSv4 minor version, NFSv4.0 included: nothing here
depends on sessions.  NFSv2 and NFSv3 are unchanged.

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
 fs/nfs/nfs4proc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index fbf9e97815..0acc03dfe6 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -10860,6 +10860,8 @@ static const struct inode_operations nfs4_dir_inode_operations = {
 	.atomic_open	= nfs_atomic_open,
 	.link		= nfs_link,
 	.unlink		= nfs_unlink,
+	.unlink_shared	= nfs_unlink_shared,
+	.unlink_shared_done = nfs_unlink_shared_done,
 	.symlink	= nfs_symlink,
 	.mkdir		= nfs_mkdir,
 	.rmdir		= nfs_rmdir,
-- 
2.43.0

