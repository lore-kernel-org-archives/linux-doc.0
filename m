Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7663D47C2
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164329; cv=none; b=eYGgmOFdG2ZXfshSnDPaRkzymTTPpgOVmTp3aO6l6O+8Jbxj9qooRLlIeYsijDLgJVp0ODslfqNcvl2St8gl3TpGtGp2RkDUUU7/wtxnnAKPS3KVAxZfgXdOLBx0kzwDw+dh3M2CDJK4l1psXNW/OxqF4dgmSNf0dZ2889JArF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164329; c=relaxed/simple;
	bh=RBZSJSyhphc0oapnManjurn6hUbSIbopJ584e/QSqgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZP2AjA7PWguwymSlzf8UjQ52Wzli7mPUjI4YQkYRwgE8ZuslM84V7sHesNDB+lqATFpMTdXy4jDeLsiPlJZ9aei4PRL9+vsqZQmmPbmonzQpZzpykybUHk9olSgcPbqZJGyTVa2RrTTfmNgD61isR9iCw7Jyz/r9CnBStdDouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NdcoMrXl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NdcoMrXl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so36869575e9.2
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 01:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788164326; x=1788769126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5plgAl7fGyMCVcg4uMMhNtS6gctUjSwknArd2v2sNA=;
        b=NdcoMrXlamWz5T+vmvPEqSvbnWp04WT5MkbA7gTpx4eA0ZIsf/7b9dfTm7+3VHDtnn
         BXrG9K58J1o+WoySppWOChVwt5PG9gNOeds5EK6KOa/h7NAISo+NgAenZzWf6Dy8RkY0
         sXY4rtiKqwCa7JMUnXtNBgHYm507GlhsKgZtVUD8YBHNX6TjljCFLhsrk5twfu09r5b8
         c7JiM5XWilIAJgid01AOKrlB55ygJpJvvO7MblcWkgOOEtHAxGpa8Ff4QxuLVPwstZk9
         z4VGVGj25O60NYN5fnMB9HylJBwgIOrtgVqdsfY62tSwbkn51OJo4vpQ3KETRLdc/V2h
         RA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164326; x=1788769126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5plgAl7fGyMCVcg4uMMhNtS6gctUjSwknArd2v2sNA=;
        b=jGRupM3cbElpxMeRWFXuQWlbRur54IYC2qtUDL0M7M7iwz3XxR2XhQeA67TBHwqGBd
         tLe04dSbcRNWq0vLecG7nLW9ZghqF0LxerFcYBQbsdQ6LQ8Brax15sthZ/dHsu1Q5YeS
         lxLtxeUij+bFBfDU/nLtwTKQgpL1qRtartlKL7dIP6dEwrK6VdsfFONNyga+jg3yperh
         93sTJ8akx+kzyISEVXW9duCAo9oE4WsJ9mp7cPKdWQP8T7FuQYt3gFG3jtUjRraKxk0U
         JJSOA4ikQfT8KSEjP+cSRvQ6pH3GNysWaWQ1brhLOTnhAZ6whUKrUNjCBqv/EGcMNtKL
         4wOA==
X-Forwarded-Encrypted: i=1; AHgh+RofDRQlgddehl0L667s8+MOTt8gVRqADeUXpcOiuEvCF1IXJBs1NfsnIFFJLemE8fwT+gAlX4lzLRU=@vger.kernel.org
X-Gm-Message-State: AFuF++k0hM5zfjw9j8OJ2nlQ6txup9+C9gYlflstLlYKn20gImOjDf8B
	RukfVpm0R5RCigaMx8W9hVEaE/ypL8BFuBDEYOy1W2C70ZKPJPskDw5LXB+AM4Stgkw=
X-Gm-Gg: AR+sD10TByThAhPa0UxcA5kI1OEtS7LHQMCYAEBx8La69avp5d8s2o5fgDAIk/4cVja
	uynsPze9By1POWLslCcntO33ZVUao+CLBtaFaV1O0MpufW7wyhEUstPRaNvrVulsrTBNdq2bfvN
	1UzhYy9QlfriuK7n1bguc2fPdUw/YVrMdJgLZZNxjUkyX+4EciSLuAGun9yxGnq+u4AdobanyBe
	khn8lgMdIB/3phMJMp4+u4OYqiH+z9txh7k+2PJg5TvLheeXudJWonZG1lJUu9VRdhBGeaZq0Nm
	cVPb39sPh0EI08H2r0+UJpLdQxVkMDTumCKv6xCCFT24D1VGAM3t2mWLlAeE7cVCYkJ8oad0ZVE
	ItjtMDNqJH+ei7clA9Rmk3KppTYly8MyTlO13Q8ivhqoHFNKW6dOvCKRYZaJwVlz/CCgh/XY21/
	FmdWKf4tp0w8tvZcuOVpkHwi7/HysReB+8m5UItqT7RVI3jDosE7c3HUXiXrSkcUy+qJGUw/W6/
	yV+04hojmDB
X-Received: by 2002:a05:600c:3f06:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49cd9477dc2mr27204415e9.3.1788164325977;
        Mon, 31 Aug 2026 01:18:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm273218065e9.7.2026.08.31.01.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:45 -0700 (PDT)
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
	"Paul E. McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 0/2] doc: Rename dynticks-testing in cpunoise
Date: Mon, 31 Aug 2026 10:18:07 +0200
Message-ID: <20260831081823.67972-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed to cpunoise,
both the patches reflect this change.

Thanks,


Marco Crivellari (2):
  doc: Change dynticks-testing repository name
  Documentation/no_hz: Change dynticks-testing repository name

 Documentation/admin-guide/cpu-isolation.rst | 2 +-
 Documentation/timers/no_hz.rst              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.55.0

