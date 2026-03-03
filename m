Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3E3559F2
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 22:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577629; cv=none; b=KFV4HgL+V8vnnySqfRxRS2GZuFK28/oe0csceIIWqLEPQqvBcEoDNMEJggj7JaTwZZAKgPPW6u1adFAY2sKrh90PEknNaSzdkWU9RxwoR/RhTm2hJ0W3gCVUEuJqRnTzsv2ilmEjEpQ06DKzF6+tSONTH8B7bgUZ3bFAiWCfBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577629; c=relaxed/simple;
	bh=X3WpDnbnNoKx1p2WZuj8dYLyj7IenOTPLiw2GMtaDQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZwfB2RuHHuNKiuYnwhoFJvu75BZW9Dfg0ICmtEL1uqhNf2/AX/gWoz0BZgLk1X4jVGwyROF/fCVgV4c4QySvYUoNI9+UMWzDQ4fHtQMkzy90IQBUE54erH9jTGoZaYxh2GXywxqo2PGgQnO97fqMExuzVgPJ0ByNMrEfnQvibp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvF1cy5T; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvF1cy5T"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5069b3e0c66so98957561cf.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 14:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772577627; x=1773182427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg9uYfe6pN1Ub/RndC6QSgAdpkYFGdsISivzOGdjaU8=;
        b=XvF1cy5T12nRohW32ED3f5XVtHNYzqtcsSN8TinWRAf6q+nhbP3/A7oDd0yH0HhjRz
         lNc6XI22psDNyF7LuJJIcACMO3QMQUcfbW1h3hNXSa5mDpLre21ZATEsEa0GDFClkpD+
         tQc6Q9mqfjMgMQ2rLP98X39qr0XzMcNts31k9FvlzqNfeFv2tBDNJ6cY7fNR1/hPFQPe
         bS3dfVgg4Vz5vxZgQaDwJpFCYYQmq7GvktCymKyHsqcQIIFaQEgU2eZCWokDX6IwibpG
         wNX5TGd4m4urv+qmMCNpkPqD0smnLjD02vhBBMyh3k9SkD1knD0rvmMRz/on40d/Tw8N
         Y2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577627; x=1773182427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg9uYfe6pN1Ub/RndC6QSgAdpkYFGdsISivzOGdjaU8=;
        b=Mbc/n8kp/3p5qfXXuDFqbSz1wL6lWVrMxut6AGFYZH81IPhvHuijYPtqqlsRBguXHw
         eZXRPa+S2CdZGWzsV7KSFaH+9ldxZg5PiPvZdj4CxY/cpSbWMH0YpTzL3N3CZqS3B+rR
         Y2Jolw4DQLy1XtooSLiBdnqex8c6YBu8WTGXr3yU181usXL90Y804LhsAp+UQ6fNKXHY
         owoxb9hP0DiBX+qmdoxnYyEFQruRh72OB9b+Rgg1GPjjie98AaT1Qd+VF9zAbVNg9QPl
         qphqCwxE/7ixJKLMMWkiXf/5PL4HzKMnLk/GqMFTd/ecx3jyp5dl0CDywIdbO4JffW5B
         QWqw==
X-Gm-Message-State: AOJu0YwLHRosoRGz2NuXGq3FopwGstfyoWFUcYCC1t8n/cSmjfAeVxZL
	wG+r8KQ+DFOOiGswm2pYsb+tMbWb4N1V1HAKxPobjoWWeWc76J3wUiOAWgPW7w==
X-Gm-Gg: ATEYQzyAooL1mFt6Ws/Td92SwGwB6H7KsKiOflI/WoKf7QoqGukD02nYrbeMAGDvNBD
	CfoLSiF/QIo30rNRZX2lC85g9LLW9zj/T+gPxke5RF2GjiIh1Ref4P4btEjGoe//U7JRyu5132D
	7uxFiE59/k5vNrLGOyAyr1dsuxmSu5Jl5qN2ih+FSfOZQ3NrOKZl8UU16JYenfR4Gr9R0mt6nNe
	AVIoR+L7SU5DgPuKg05ONTqY31fdOAEeCRopKw2Fgj4NCqnIaLtYq5vTY+nP5sKYFo9X3x3etAc
	JE9zrpsHOkKV79Ju0fE5Jv0pN6b9AbqSRRGXF7AsDDbRbFErVpsKOg5vHyIpieSIr9XBxmkvzGq
	ZEosmyDvUaTImboADTM2l1J1aO1m0QpTgIh3mnb6CZQGKjtPjxxuwuRZjNT9tPaUSCg4SNHxs34
	JDOfSkBIqSCQku5I+EmeAOOwLPLc5l5bG8ZnaZNOsjtvGNZdjffXLJAg==
X-Received: by 2002:ac8:5a84:0:b0:4ee:232e:4950 with SMTP id d75a77b69052e-508ce9a38dfmr45275631cf.8.1772577626801;
        Tue, 03 Mar 2026 14:40:26 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.79.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449874b7sm136424621cf.9.2026.03.03.14.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:40:26 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fox Chen <foxhlchen@gmail.com>
Cc: NeilBrown <neilb@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 vegard.nossum@oracle.com, viro@zeniv.linux.org.uk, rdunlap@infradead.org,
 grandmaster@al2klimov.de
Subject: [PATCH] docs: path-lookup: fix unrenamed WALK_GET
Date: Tue, 03 Mar 2026 17:40:24 -0500
Message-ID: <13098721.O9o76ZdvQC@daniel-desktop3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Fixes: de9414adafe4 ("docs: path-lookup: update WALK_GET, WALK_PUT desc")
---
 Documentation/filesystems/path-lookup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
index 9ced1135608e..6957c70f18db 100644
--- a/Documentation/filesystems/path-lookup.rst
+++ b/Documentation/filesystems/path-lookup.rst
@@ -1364,7 +1364,7 @@ it sets ``LOOKUP_AUTOMOUNT``, as does "``quotactl()``" and the handling of
 symlinks.  Some system calls set or clear it implicitly, while
 others have API flags such as ``AT_SYMLINK_FOLLOW`` and
 ``UMOUNT_NOFOLLOW`` to control it.  Its effect is similar to
-``WALK_GET`` that we already met, but it is used in a different way.
+``WALK_TRAILING`` that we already met, but it is used in a different way.
 
 ``LOOKUP_DIRECTORY`` insists that the final component is a directory.
 Various callers set this and it is also set when the final component
-- 
2.51.0




