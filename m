Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8C161FE1
	for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 04:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721708995; cv=none; b=V2alYPBtnQCU2d1/zt90XugmkDSaRDMJQWkQYyFNUkY6k3mZWyXL74nxCcsDjK6bZbwBBbylH8gX/HyCdL/Ppj5hDLaHFxTAz/tGR50ilxJwtO41KvilGjl3NTHWzQ51KfEGXdYuyaIQ8xp7t/0EaQ6D9CeP0XEVg1ChtpXul/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721708995; c=relaxed/simple;
	bh=0nd25H4t0Oz1YTdVUwSBZzgdU0Fm5Oay9NHpxeLRlYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDnRY73IPmLAGhW+jt1j4dcrFk6JDjtgO3J+jd0c9kN1bZSD95Uk/VbcOwnM7XM5rm4Zrtf16LpAxJ277w0ao01FY4NKRGHWG3jT4RpvDpa3SoE69VjBMbL2rPCb8+FOj6PpETfHEqDOsi9YDHvuh4wfWdgBw2JZoTX6kT7Z0UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Th2kt52/; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Th2kt52/"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7a03ada9660so1337518a12.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2024 21:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721708993; x=1722313793; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gE94QWpV1X2qVhImQAatYFDwRF9M2+i4pKBHH+sTZNM=;
        b=Th2kt52/jDp1SFdQRje2A83uQjYknYeCLauymWoACOvgHIfa7i8NzwB+bZ+ciHbdka
         jVLspu4I6W/XT8CqMa6+6VwfvOC9sNm4OoHxWpD7PONyxeww34gFJoPWSf3+2tgEU25x
         fE1GreUnWHhlU82J5l7jWiKAj+3/Bdtt9wQXNywXlTKwWOhBIRmnSdwXtayuqLnR2BIy
         p5Q+j+FHq2/Za4EVv6ADUm+igzIvnFYZ3AFEZVGQvlLkrYOfKQ1POlbYM57/JpPvEwZt
         PZaJ31MlAcAPq6Qx45UUrCK0N7UPtXCIRGt7gwKmSx/99udbTssyUeS9VrtcAEjQGCQG
         Dmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721708993; x=1722313793;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gE94QWpV1X2qVhImQAatYFDwRF9M2+i4pKBHH+sTZNM=;
        b=VDyXYy/YjJjC/s7HKq1bEgzkDHZKZnP5K6abqwsRDCuVkbV+5W5Xu5JYqLnQFChNUe
         PjHWJH9AK0QuqphKVX5jti9hBgp3h6GLR7WWAjv7NKjZhuO/j4aRdROHBzK/+f9OWNIv
         znxU050KDm+3+SOClIHtgxaaubs3MoZo+0Z357VkOFO/NeF6Pz37uQvQ2ThoN5+5/SiX
         t/5IiIL1SXLVA2tmwu5JHq05V7l2aimq3WYxP7HZ+ziyEwKELvjVPJxrbSzQG5qd26TI
         +/0AyZwVHwV45BtsbR1OnqHbX65vTh/eHe88T25e/ujkQA3xHhNPqQI/V9jeMQfvNH1A
         CNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtye0tD35xesid98v1geqKPEnae6Se8keUFosHbj+qrxZlStX0UrNc72PgFdBY1Ms0y26FfBLCrlQcVgO3PMmG6nRWVvfZaMzF
X-Gm-Message-State: AOJu0YxVKPElh56k5qB8m4YT0trgIZV8ATYGSQuLndSibF6jVv0uIbhW
	OAIxdF3XNw4wLTrsaI3KDHT9GCvpCY4M+d1yU0Y2zBIgTMdNb43KKPPYOZPu840=
X-Google-Smtp-Source: AGHT+IHYH/bTuyqUZfGTjr8mCUEaBUU0TkCTGSg1Vbu1icNo3VPW7cJEKI4t6P15SfDndoolUSlqZw==
X-Received: by 2002:a05:6a20:cf90:b0:1bd:1d6e:d444 with SMTP id adf61e73a8af0-1c4285ba4ddmr6428480637.2.1721708993062;
        Mon, 22 Jul 2024 21:29:53 -0700 (PDT)
Received: from gmail.com ([24.130.68.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f25ac9esm63678565ad.20.2024.07.22.21.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 21:29:52 -0700 (PDT)
Date: Mon, 22 Jul 2024 21:29:50 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: corbet@lwn.net
Cc: pbonzini@redhat.com, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, marcus.yu.56@gmail.com,
	chang.yu.56@protonmail.com
Subject: [PATCH] Fix "WARNING: Title underline too short."
Message-ID: <Zp8xvjtQKdRSvJO_@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix "Title underline too short" warning by extending the title line.

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fe722c5dada9..a510ce749c3c 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6368,7 +6368,7 @@ a single guest_memfd file, but the bound ranges must not overlap).
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 4.143 KVM_PRE_FAULT_MEMORY
-------------------------
+---------------------------
 
 :Capability: KVM_CAP_PRE_FAULT_MEMORY
 :Architectures: none
-- 
2.45.2

