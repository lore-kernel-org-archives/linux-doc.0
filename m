Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C823F8808
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332857; cv=none; b=DEeWQumNajX9f6nY2c1zHafNRrtYYFFYZaTy7zPfFhx46QrMmmiCQhz2Qkj+KXRvGLzMiyMoH8U8MS7ce/gCNFWpL4bIggvK/8U91QDuveVvfk5M1Zz1MOdTZKey53da5RG1TIVLnKtnWNPonctf2HtXh2IKiCE6ykgiczwjXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332857; c=relaxed/simple;
	bh=WeQpqP/v10mjvRkvyYzZra3V13Co+TToHr/5ahM3+PY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Je77BFvWr9r6Hu3M8tkaakoiJL9/vC0EUtVSO+xPOmZ+dcOwHSo0R1PfmTlsx8p/XKPIL6sHs0e+5us4DuUOPPj1NjYxn6trDA+dqKlnWVxxJXN9JoSiDpxKd1ggxxZKO/3XjVDiUm1pW4cog7SVLqR1+LqFEquURBJ+SstfhC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKarVSqJ; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKarVSqJ"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d77b179b52so758995a34.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773332850; x=1773937650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kiqYOLmfZfFjTgPDhXLBnWofyj+zIF22cbc29XYNUiY=;
        b=gKarVSqJkvfTCfYntfz4uST/2a7YroBLxxK7YxJoiWVRr2eU3YU7BoEoLl91u4Yrsm
         WfiIB5/gA/s82IVoaLhb36glMSeqHldklUEAx8IyAWGZ6noUzZGMNlnGmkC+Odf7l48Y
         mgEzxg+DVFsyX9KOoRc28yqoicF8l08sYvqs03th8LSD4PIslGDASyQOwevhjkTW7pR0
         RwcXVSvSXIjcuMBdmkdaTg/zFMWPNhSWcKGFE2QjHArQ+NpS8BU52mXEG4qDw3eXHSAf
         blKc7cejTIpaQ4KrHK7p4gDe3PeRuSNEzDSFjB/179FAEswrNNfJ4M81Vmi5yLpKu2js
         P5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773332850; x=1773937650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiqYOLmfZfFjTgPDhXLBnWofyj+zIF22cbc29XYNUiY=;
        b=Ta0lIPHLMu+tKRiOvF8BDZ3ez7dxgsJ/r6PaqbOpHPJsAcDFeX/0ZCm1V/caRFYEEY
         B2Y5ikm5x+Tm+7aWGZYOiJacHaD1FKPTBw9AebuNe6i5kp7ZOKm1ci/sOEpp3cMTz9tE
         dh/YYCybQ7hJHikWwHmVWTnZKRtGQrBwIxnY+oNtgkfhjf39mMQfKBgnuWZwNAa0IUi5
         qG2Fbb/s2tJ9iLBwbkvum4oPo3wlqBewrp0tEZhs+/GHzk4v7p8ro5VKfQkGbi+7kxeD
         bSgKrDkLToE2qvb3O1MNBNE9NoTrkI0wml5h35PdBVSQlkia69vr3CBgW4/PMfVcW2KG
         vBGw==
X-Forwarded-Encrypted: i=1; AJvYcCWBA07VfiA7rnsX6VDMctN7iiJDLjQZjgRFuBv7c5yL9GoYbXfgvm0Fda+UTPNG1cTIjUht7lzDAZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeedPS9UxMmRq0biFD+pniChz3RcQAIbUvhfYfs4+kFftDFV10
	DXbPUw6wlDupr/D4DOZzhYRyMoVfA/L9AU5TNp50DyE6UHoDiriT4hYk
X-Gm-Gg: ATEYQzz79B/gtUlbrDoixHDkGlXBrZoeHLiykSYxhvTi4SGQEp9OvG2Y0Z6s+nOjzGA
	FbvM2/Ljdlj3vXFyeBw1/3HKZj1x7okYnVtWUeXTspLH81oynYRSaIEa/nQUn2NgR3M+yVSCNkK
	uxLgZlIG+iFrO+QjN9H+ZgvdsdLWhdS4SApLJvRe/zvvGna0EytZTXSGX4AVR1ieCJrxIwf41tU
	A8Z/20fMlLcFrmY1boHBKGS26Kw1+MrbVfXvXNa2/2o8ssTU1IR1lU44kzy2HRN7dPl+DKs9azr
	qEz3PehyI6vm2d0SO07WUWkoHv0RGPRR3utlt16jCq4wh32vi1BjsuG5m2LpETZukd1a/oq+qhZ
	FI7XkSVMrAIdEWp4Fs+voP+YaElB6O0uBuhyLBemFaVUTbbwCNEzZyWTwITqZOOzAA+5G/hA68g
	+ToyLxZOjXT6nZSsRWR3QGeOruJOfIz6rnxg0JJCHFOsaPcE+cB5AoaKlSkz8c8/WeE6srrX6/M
	UO8wjD4zfBg
X-Received: by 2002:a05:6830:34a5:b0:7d7:44f2:cf6 with SMTP id 46e09a7af769-7d76a6cd2famr4669737a34.22.1773332849541;
        Thu, 12 Mar 2026 09:27:29 -0700 (PDT)
Received: from ShravyaPC.. (r74-192-25-180.bcstcmta01.clsttx.tl.dh.suddenlink.net. [74.192.25.180])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d77c961e79sm1107766a34.7.2026.03.12.09.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 09:27:29 -0700 (PDT)
From: ShravyaPanchagiri <shravy112@gmail.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sgoutham@marvell.com,
	lcherian@marvell.com,
	gakula@marvell.com,
	hkelam@marvell.com,
	sbhatta@marvell.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ShravyaPanchagiri <shravy112@gmail.com>
Subject: [PATCH v3] docs: octeontx2:Fix typo in documentation
Date: Thu, 12 Mar 2026 11:27:15 -0500
Message-ID: <20260312162715.35408-1-shravy112@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a spelling mistake.
---
v3:
- Moved spelling fix details from the subject line to the changelog.
- Simplified the commit message.
v2:
- Fixed the subject prefix formatting (added space after "docs:").
- Moved the long description into the commit body.
 .../networking/device_drivers/ethernet/marvell/octeontx2.rst    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
index a52850602cd8..c31c6c197cdb 100644
--- a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
+++ b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
@@ -323,7 +323,7 @@ Setup HTB offload
 
         # ethtool -K <interface> hw-tc-offload on
 
-2. Crate htb root::
+2. Create htb root::
 
         # tc qdisc add dev <interface> clsact
         # tc qdisc replace dev <interface> root handle 1: htb offload
-- 
2.43.0

