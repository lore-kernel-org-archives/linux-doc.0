Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6953C3DAC11
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729016873; cv=none; b=P0S4f+67CFNwIN9nc+fbZfEeMZf5ESOwdJDAbLpg4rtnC/2iXvZSX8v5+MFOXHpK/h1aQaKQaZdcEeefWmfNQq7uU9Lz9MElksrcff2UJDBcTon2IgFeH+EDelWtGlD3DdNpKAwv2DeR5RWus1pGiSh9jqYEioc2wBbWM3Gh8zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729016873; c=relaxed/simple;
	bh=H4MAbne90wrlHRCK9Y4D+uP2WHYXI/9s5xplsy2qMAs=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=dgXoNEfbbDSIRCk3KjADq/0ToCuOYWScbgcB1JjYJejRadHMA3yihQLIKb0piU879fMpRiAa85zxQWUqmi9e27GDgs1El+4Cn9S88go8MRyVqD4LCdExMefM1vibuTwqzj5T2Wa0bqR1iEbpqXdFRG4kpzl1XRT7cwqWMkWxHLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kc+pie4g; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kc+pie4g"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e32f43c797so1360457b3.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 11:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729016871; x=1729621671; darn=vger.kernel.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gM3YrE4Q9C+Si8Co65mOi5KDwsbx7zuVuDXpGhuB+1o=;
        b=kc+pie4g7SLZobJHsiEilTpCaH+/2/FYQwCacCRagZgozoFJS2yVvpihlJ3zUBuZiK
         JaxbpQe86Mb/s6GjlKAKo0VBBl2QPi3EMefNKxXSUoBcfo3GFYmo4ju5Q3+YGyjzEkdJ
         w/wzQV/xyCoVrFMGXSuPiebohfAzLbqUhcxo+lAkDGNfDiqnBc7EcHCvXpWiPiXxsFJw
         w37PQg3YEz3iYACZPGo9jgwv8IF7voGrDvD2CZzc3omOoqrCm7zk3MxHqJgMEB7TW36h
         DIoTakrmKQvzmoUU6v8pUFVVXSWsqLgqrI+S/JykQlgHNRGYak5kvzM2xQ/yHX9kM5lE
         slZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729016871; x=1729621671;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gM3YrE4Q9C+Si8Co65mOi5KDwsbx7zuVuDXpGhuB+1o=;
        b=hv9a/dTHQibsW6Wjxs2d+7YDVk+NcYR8eTpKR/IQJw8Fz2rHGrOK9oQtV0x57aayTG
         eoWFM2sk5FUEo/j6voIW8n8bE5hJO5sbtsb7HeG9V/RWczMF+XPgysu63Fz6jEyN+x8H
         CMP8KqVfPGpXBLbXKVJczvWEKDy5SlsHLnhBCf/PhFNRaraxlbhLgpslF5RJo3Le8Ygh
         gsL8+4uQlQP3Zw4HwZLln/acKOcHGaOdf5B+q9vco15hbUN5GhqVpUCVfYRdV33yI00h
         Z62+h6YS8P8qDFIIG4Re5OQnzWSr1Q5ujTd9W9EjXpMuCSKmeLD0RaG6KgCVQ2hTIjhr
         wsMA==
X-Forwarded-Encrypted: i=1; AJvYcCWxf6m6bb+0nm1vcAzgJgV3VR3ou6yOD8l1KJ3O6twEJ3YTWumWSMaQ2uAe90KVCp9YJYId2KYTMmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztmUw2P5SigKiOzIdxQwh43rPK/yxqMREvbm/kSwMK3I/XEkyt
	4K391D/u5Fn+ejpRvxjsXfzN5sss/O47WVTGJ7Dgi7Q578/SB8ltulcILIojPHdWL5kRYCFipgq
	rFIH5Jg==
X-Google-Smtp-Source: AGHT+IEAFY2fyFLu1qZ7jkAzDxh/B5nDgk+pHq87dsAFMXXqft5EY45jsumwuefjFJboTq8uj+pIP6i8tkZf
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a05:690c:3587:b0:68e:8de6:617c with SMTP
 id 00721157ae682-6e3d3aacfc0mr155807b3.5.1729016871353; Tue, 15 Oct 2024
 11:27:51 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:27:45 -0700
Message-Id: <20241015182745.1012684-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v1] drm: Fix separator for drm-pdev
From: Ian Rogers <irogers@google.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The PCI slot address for drm-pdev should be a colon not a period. On a
i915 GPU I see:
```
drm-pdev:       0000:00:02.0
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 Documentation/gpu/drm-usage-stats.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index a80f95ca1b2f..f56ca58312fc 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -56,7 +56,7 @@ Optional fully standardised keys
 Identification
 ^^^^^^^^^^^^^^
 
-- drm-pdev: <aaaa:bb.cc.d>
+- drm-pdev: <aaaa:bb:cc.d>
 
 For PCI devices this should contain the PCI slot address of the device in
 question.
-- 
2.47.0.rc1.288.g06298d1525-goog

