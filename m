Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833CA415F2E
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341089; cv=none; b=UDzeWldomjWlKDLFV9mbNzUsB9fr64V6YpTxIUHnkw4K92/tscREpiCYB6QCN8f0r2K3isxQo0gtMlDlCHJpufHuVdZHX6ITdBM1ocCREANZraGAyybhRkFReyY8i1t5hhQzmCfM/J9n8bWJ2UAnE7RI1UBSpv9PXD7xxzXh+4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341089; c=relaxed/simple;
	bh=htsA+2Ta+xkPsrznDs+1fwd4+8WtuDMyst6whWczVtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3aN0GLtC/TNix4gPUxkaO0yuLg+PU926TLKvAHovf2oC0XxVatXozjkAvMTl5yelwlXqYjAX1MAxxOuaRtTsRAg07628hJERVhdoZ6mWY+TzgI//e+Dn1WHX6c5LaJ8cBhu22rY5U4f3YZJjY/45V/QkCtAtG/KuvUc5yLfOC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=grsJoZu+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="grsJoZu+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso5850635e9.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788341086; x=1788945886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3fqr5+6od1TZCzN+IFHy0hN1GLZqBToHSX78eyTEKo=;
        b=grsJoZu+twxEB/SGEz2UDKSlqmfCYXM2GbDBdo6JEZ/m5W1g5MxNkDBi9C7p0ibJMC
         q0nO4TWsbTWIvH1KIfiUAZ93NecQxVq6YNBhBFMCyGWCRNYjZc2eNagZCSvxkh1aVpN+
         W/o1iRbY8ppWMo4N0e35e4xmBREaarB2oJOx01PWPkYxQjlAVBedYCx3bszm6PPoeYpW
         5vxtTKpFmOxTYz9KtG5RjC9SO2hbbI1/DYvcevgb/X/9UtaRboSm6AefZts/bhXioBKM
         0kQLGgAArSkyWMHCZzCvcI/aVBr1XfWllMVrQr//1HKm7nBlsYofBFNmj3B5XE5NoPcT
         MLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341086; x=1788945886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u3fqr5+6od1TZCzN+IFHy0hN1GLZqBToHSX78eyTEKo=;
        b=h8BXAGganVbW/Kbc4vppa0DN8WWpx9uywvPkHIa+hwiFdF0Hy2Zc1Yj+P26HNwUqqM
         d75Wth1qmMHb9bsyBcqkhkX1uDvrlxrnaTu7hfwSKab9KrKozPT1Q/y8EaxC5iJg9fec
         2fZTakucQwJq3Si5S3p30dU++bO3KaseB3nfCFxrMw54Kn7Fa5ocN2TiHZQVvnAPP2v5
         8SUAG2eX7fPATbhaw2uSOwxFnKysct/2S4VKtwzASaG3FyH2uTm/n8Hpu24/po8gqU0+
         v7oQTR+y9BGduarQmQ43Lh2j1WHP3UaGSDAjHCzYj0BbGU0tdI6s+2kxrZxJCqlP2Idz
         KaAg==
X-Forwarded-Encrypted: i=1; AHgh+RoYEwPRPRWf1n52IlC/1ItNyTYO3hlnLh2JKBSLvL0SujQ/ay/N6XOUmJCva7zj7LThboOQGP4iLls=@vger.kernel.org
X-Gm-Message-State: AFuF++moA+piRmLRFXL00wakdJqssMmW6UqbHsb+otsOjDSw2SqrD0pE
	Yjtb787K2EmH/NkPEHSkEDII4HccE/+805F0aB5vrhKE8hm4ypC/wZwjIBgcowxunVg=
X-Gm-Gg: AR+sD13+AMIZotZZa1BXGCDJH12JoymPiYZo48ff8mSmp58MH/C0svpJHmsHQNL10qk
	BahvAnFhiUoXJvaF5CZe/ZIZALFZm4vHHfmoBYtgpr67/kjAyZIhn5WBcnxTC07uhgym9WTxbN6
	iThuK2CeL/y0kdQ1YGFkG/nm7GPozPwUwLAnwr/5GyugyUEDvRgrW138hImUJDtTcdAWwWhOZhe
	JAXzp/K+RbQTox5i04cXMM22ZKIBp3VZrJEMTwSb4OiBCBcfklrLG5xi88zbiBAFrLgVbdi0QjS
	mllX1r+hnY2iI8uO2S6K9qoITjLUMGdu0dhJRltYC+JXKLCqAFF1pjtRpl5scnIYiPvjX/dgO8m
	shVBl7+kHa3K0ISxNY8dvZj9lSBW4yzg6JOXlGdech9R0ipqAJygMeEikyMseKVdiCnKG8QM/8m
	bexdwdPRWlF3NCXMc/o5lgF8AAXnlFsjKCbNFxYsX65wLtiaSNxq94fGPG9xbnNFf6mSsmDjfxS
	+so5/NSZck=
X-Received: by 2002:a05:600c:4e4a:b0:49b:9113:e04a with SMTP id 5b1f17b1804b1-49ce55ecde6mr60360315e9.1.1788341085661;
        Wed, 02 Sep 2026 02:24:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46422desm52404145e9.1.2026.09.02.02.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:24:45 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v3 1/2] doc: Change dynticks-testing repository name
Date: Wed,  2 Sep 2026 11:24:24 +0200
Message-ID: <20260902092434.85096-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902092434.85096-1-marco.crivellari@suse.com>
References: <20260902092434.85096-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed
to cpunoise (see Link tag below), so fix the occurrence and
the URL.

Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Link: https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/admin-guide/cpu-isolation.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
index 8c65d03fd28c..b9f13a928673 100644
--- a/Documentation/admin-guide/cpu-isolation.rst
+++ b/Documentation/admin-guide/cpu-isolation.rst
@@ -353,5 +353,5 @@ Some tools may also be useful for higher level analysis:
   latency and noise in the system. For example Documentation/tools/rtla/rtla-osnoise.rst
   runs a kernel tracer that analyzes and output a summary of the noises.
 
-- dynticks-testing does something similar to rtla-osnoise but in userspace. It is available
-  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
+- cpunoise does something similar to rtla-osnoise but in userspace. It is available
+  at https://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
-- 
2.55.0

