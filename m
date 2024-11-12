Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88C321A6F6
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442100; cv=none; b=j4dqe7wgmy86MCAK2mhDP8uns1iMSi309Hq9+MtpS+JjZAkNqMQc7uQ9hataG21d4XLQFp9mK1dI6wlAMqDASPUSV+K1UzoDd1ypV9XijtRk8E2Wa4jZpYEqYAKW+YlMM7A5+TuCe/sK+A4mGxhqs6Ey8x4KI3PYi+EB9xWbLMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442100; c=relaxed/simple;
	bh=BZcMip1bKNbU0MtdUd5Um/QIvw5ZzOLApoYfnzoTTh8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b/kHFABBwSi8OG8O+oimwS9cs9GVGlSSjwqa7MsCfwWK4f84451CgpyMsU8yVftqoug4NWrGO2g0HmJKqYRr1xJAOqybxm9SHnjqyWvDiJuwRzGp90Z7QZ2T3j60gTH6vUKGNv3ne7dBi/c5JEjXH/77JVXiEUGeJ5PkgVI8osY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=11vZ99T1; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="11vZ99T1"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ea258fe4b6so110640307b3.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 12:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442098; x=1732046898; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F7eUSGCHQaz0mvFxw9nIvdeT0r5uHAkn6h07yqvZcoQ=;
        b=11vZ99T12k/3EHIeV/EcCTMqw7z/FkoX20BH2vX2VU2+4MtkYLjOejZRjgTLsZCcrv
         LOjzmjKItPSC4Uvbaj8gslAhP5aF4lVOcaVi2PBqIkmVOZzAT8aQnCQhWwQxiuXySZdJ
         U8+OHdBNMgq4Gq9Pa4hVABKG90nphFf0+D9Zr3qI3l4ED+7FdbomrjCXZ+iExXA8cZ5m
         NWAeRW+hWGgOcmExIFIhacTUVAR058BHYIjQtsPeDwILGhD4U3kv9xdBnNzn4JhI86fJ
         N3qoKUC43/deKP/LKfsQfnIBrmm6t5JaFrcF7H1tF2LOM5NYYY8E8ILC5Wp2y/d27BmX
         DdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442098; x=1732046898;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7eUSGCHQaz0mvFxw9nIvdeT0r5uHAkn6h07yqvZcoQ=;
        b=otsa2EMM2OrxYUWphMrYsu5Djdvh2kQyI+t6qQMTk4W17gy1UGb+8uahjplcT5xa1B
         i3UN1K0KwtrZID503rcS4lMZdUX0iRzZmMhxo8mFSxLO0GEXVIa7lsoMjMWbWQhvMqgZ
         ACflFXqosEvU4KjskYCs+YpoGAK63FLky6mMI6ofwgcXrwQ75YTekW4b/ksljuyZ71gr
         V7rhqOgFkqlXY7LfLuV1kHuDdyEEuuF33KNfcWSmUNNylt7GO+sTeIxiuo11CUYC+MvT
         /qfBdeReULTsJUtvwWh7f5WH+7jebwu8jk2p++ViQMx0mcXLuYCiIb/DiAe74R/MWWa2
         hklA==
X-Forwarded-Encrypted: i=1; AJvYcCWe0v+6V+7YQ3Ju0rh3MQAb0O+vYCLpIrP/WPyL97jqSD3jx6nGJ2/KE4d3iwsbBgKRuRh98ZikqvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKVeYl1VEHEwm5WMcnzkvRSKMiWorCmBO7EQz6e12yxkT87QqI
	pF2QLHpXTxkkQVBSQbd3T7+2OjPs+SedrOpYHF5h7FGxIoPC/zHpo2Fj+TVEZ879Cj3+zdXchw=
	=
X-Google-Smtp-Source: AGHT+IEAVxAYdUdYAQubxN8mrbbDw0d3Ds8w2IG/q0VgI/G4c9boud7SVcYUAj1VwuKEfvLwEZTE9bAyMw==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:d3:4d64:ac12:6a5d])
 (user=rmoar job=sendgmr) by 2002:a05:690c:9a0c:b0:6e3:14c3:379a with SMTP id
 00721157ae682-6eadda09a7fmr2383017b3.0.1731442097981; Tue, 12 Nov 2024
 12:08:17 -0800 (PST)
Date: Tue, 12 Nov 2024 20:07:48 +0000
In-Reply-To: <20241112200748.791828-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241112200748.791828-1-rmoar@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112200748.791828-6-rmoar@google.com>
Subject: [PATCH 5/5] ktap_v2: change version to 2 in KTAP specification
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Prepare KTAP specification for the final release of version 2 by
removing "-rc" in the title. This would previously cause a Sphinx
warning.

This series represents the final version of KTAP version 2 that includes
the major addition of test metadata.

Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 496799e7b87a..a8ff15e6d0fa 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 ===================================================
-The Kernel Test Anything Protocol (KTAP), version 2-rc
+The Kernel Test Anything Protocol (KTAP), version 2
 ===================================================
 
 TAP, or the Test Anything Protocol is a format for specifying test results used
-- 
2.47.0.277.g8800431eea-goog

