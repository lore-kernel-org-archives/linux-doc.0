Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA1382388
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 22:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577908; cv=none; b=bjRM6+SswTnN+l5bbGj+I5ZbyIRKSijvoGa5KsF/DdMap61BPOJp9qdDq6ffpSzT1Ko4a6LlviDXahGoyWB8fzrhL+HlAW+b5Mj994Jcj1rBVGABDLtsT0uudhv0w1AzFAJ5GiLMzZOKtXhV8VgLLI3sDEO1GVCCmTbBeRujj5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577908; c=relaxed/simple;
	bh=gT+4UsZeu87kB1GcB9paauQ5Vo3N9fedCom4NsX5T7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uloCOtJ/MMwOvQATxmfoI0MD9zOhJpG0dahRlVLlk+zy7t9WqOay3yeHbI2cX2n0tdw2BUAFWX/6oAIzQvGZbbh/u/Mg+JHh/b20TPAEvVyUNY+/ztTMPUyEnXlOgqgsd+Nq+TFhWi3QhFim8SEMMWs0m/a9FLoD98h2+NUyK4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4LTncgR; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4LTncgR"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb40030be5so524463485a.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772577906; x=1773182706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGapXhFYPxeYZaB83ey3cJIs7U21VzM4YwAzM0NLpWY=;
        b=Y4LTncgRHL3bgLamKpGiL3zGsQAO2EvB2I43rARmvpiJB2RTCP5jste+cwmzTZMkOm
         /mMvzuqUkAx1jSSgq+0Am6STIJ5TUaXNOZoK3M27AiYjM4S4HSf8G5JHQHa1UwGLFN5u
         yGDb9jcPe6/7+aiYPDQG2QROKPDyseB6OQK9JehDnGG80nt3NL7u8zyYYU8nkOhZkzfa
         9f/Be3nl7ChC/eWKOm53Q2lh12Z5JAfpsoCGNwqypDYuDDZS7hXNtp6+aNxQLLz2nz6M
         fa8drU/jL54BJ42HBzkvPtFoAfJxzfp6Neopvp6UJvOdS8ok0M05auRdw0N5fcECQ0Gl
         oqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577906; x=1773182706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TGapXhFYPxeYZaB83ey3cJIs7U21VzM4YwAzM0NLpWY=;
        b=V6OnPnMonU8xekYWlAW15qttCIYGBoFTNxpd4Kluts7Ojp7mmRbPpKbWzmFyGpEfDR
         +QMAQ5DSrsyTLEJcGs5itkQ5TPAapzM2D2gy2mgFhCkny5fKLO5t/U4aUiH6jV087eys
         DeMQAnpclLQYVuzxyb84rt/aGLi1Kau+e4wiUO9YwlZe3Jgsd1PSSAGq9oV0ZduCA/8c
         PaKJvzjREdffzws773b45s4m+owivThuax0U4dZHDLcIq6cGnGhd1yxKYlQSR4wD8QqK
         jxuAcncH46II2dzBLbMlh6YqrFTrPaB1qA2JsMdqa40JqKH83zAB8E4VqbS5GrjFmhnk
         DCow==
X-Gm-Message-State: AOJu0YyvkCL6GErzuKofVKHMzFLzMVktrDRpM8bVaHJ0bBFIyEyQb42u
	uUWGuqyaayfc/wHZFLcpXt9KSHzoLMPg2v/YttzLgfq/6EPHAU51UUPLFI353w==
X-Gm-Gg: ATEYQzxFIITe1liB60o5zPsX8ngNd8YJ/YrgzjxbIA6vplVFUfRLLHcqPrTBFvoRDqB
	e2B493xOj6OMwJXDOophL70Q8RdmKBXE/jovrBCCA89yKc+21bVjOOjJ0AOsJJ4Io9TPRrQiFfF
	zjc76nPA0yve+hIXnZlcgTnnTL7wgDP38N6pM16t9GRzhNMRff1OGoLWEuZPxTQ4G1V+rxtu7eU
	cfnA75WPJRY3g1S3U87m5dT3pzIZE1xmxIfwtJG4wq2U/ELAHtXUYqCEBFlqIT036emD5QVhT3X
	RXcbFevfvC43UmchAkeD3cVgeQi7bVrcST5ZQGqgparQigyhevMjfVu5YoDv0bkxSrLtlKzsUAu
	bFjpPn4rBBp8TSqA/+II2jO0mYv69iwdEWDi1Ge2xUCRWRhEPxlO4EhiPXwnHYVc2KfMdvy9num
	53fA2WuGLX7efovKpUtl7P4Yep6/qwzH2Bna72srRVLcNA/WWGPNAr
X-Received: by 2002:a05:620a:4686:b0:8c5:311a:2023 with SMTP id af79cd13be357-8cd5af10fc9mr7124885a.22.1772577905875;
        Tue, 03 Mar 2026 14:45:05 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.79.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf7319bdsm1510111385a.43.2026.03.03.14.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:45:05 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fox Chen <foxhlchen@gmail.com>
Cc: NeilBrown <neilb@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 vegard.nossum@oracle.com, viro@zeniv.linux.org.uk, rdunlap@infradead.org,
 grandmaster@al2klimov.de
Subject: [PATCH v2] docs: path-lookup: fix unrenamed WALK_GET
Date: Tue, 03 Mar 2026 17:45:02 -0500
Message-ID: <5332975.31r3eYUQgx@daniel-desktop3>
In-Reply-To: <13098721.O9o76ZdvQC@daniel-desktop3>
References: <13098721.O9o76ZdvQC@daniel-desktop3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Fixes: de9414adafe4 ("docs: path-lookup: update WALK_GET, WALK_PUT desc")
Signed-off-by: Daniel Tang <danielzgtg.opensource@gmail.com>
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



