Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CB93D9035
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168093; cv=none; b=ZFHzkOoNeTDpqXdjvxcRJFNUXF8PvBOf/4OI36ycRpv/qG0kbq7qRQJagA/QONcxyEsLqPgfnuLtfCugFdEJJWHeODtPykFd9hrZeoDS/KSSS99MNod3Y1+YXmAJjNxn/GzWBz5qR1W22bEsOrrJLuaSem805o/n7eO0qW2Xoqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168093; c=relaxed/simple;
	bh=Jii8PdsOIpZIIdRiKAExnqrCkL53cGtk6tdaH+cPNhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ngMVw1E/OgjGuLs3llnSLUWlg0uFqyfceJZQOcY//EYUvfOPzQJEKRDrkQiwR58oOpDHxI6fOU6CdxVvi6IAdragOc7EMSb/2JiUdbiVMyhc2xT8IVhv8s3c0tiMiCh6xptLjjYdWhLdm9OWNTRWSc91YvLt5AUr7rUdLeQzRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=csGvuUj9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="csGvuUj9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso24705095e9.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788168090; x=1788772890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=++AemXZH3wuTYoi6t13CCh4OGNnaD2bSLAST23yN5ks=;
        b=csGvuUj9pX5NfxO2kC0CsapOlk0qRuQWV5sHU1UBONiU5VkTBsq/r2wQ92/l4XNkhI
         rOqAJ12sDyNGTunW6hFKSVqGDSc+0LuP3rOm9mOg5lk/YphUEk8jHcW64hDQUeryc70v
         ZzSh4DgpcMfhN/79pOKXL0ZW2+1ae92fQhGJkm6S2tNkMNzwskDGsUX7ElByC3uleMRX
         WGYajvCVFXY8CrnI3A6P+5NJ+zy5Bs3OVYwuYYZttfWQg3ugSYdO0aNHhRk3x3ae/Jlm
         uS5NqfdOweaM7QiOvJ5jaYAlEnvQx2lJK+x18wDOZo4fVu0gQrzja1+n/+39Gjst90YB
         ROxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168090; x=1788772890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++AemXZH3wuTYoi6t13CCh4OGNnaD2bSLAST23yN5ks=;
        b=GOu9UZ7hTc5Jrxnqcyde8MyX2ZdLotXPz2DF2sCMMrb+EYgAbjmtrBsnPqFhd0CvOR
         rvsalcsaimEMXl1n170JPx+Tc/UNfJTRly7gr5Pc5jHUl67BPBuarOBAO+W3zuqHtGl8
         HGBEtuMkhZyEBUSKROgmZqb883pVLsPsLLJFwqkSWJS+3vC3RrRlHsuq5V91KODUPADY
         JzfCpxFvJqpxQ91Zzk0mxrEPYQ0xexEJoWkOCTc+aGFq8bMeJQcLvur3I/bLXykS4yMt
         NTOGW/s5qdGWVQPAeTb7dA/duLjSPC07/Xq/DY80H/kZPJe5gZOGoZXqz7Hj1h3yB3oc
         rdhA==
X-Forwarded-Encrypted: i=1; AHgh+RoGn56NLNLVJXJnbXQYQTpHEOWAXJ3YTOQlBzQsudWyRO2I1k7o38FdhZEzb7riDvhIPG5DTiYXzuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lEgCjAYz/vKc39dHm2WufdbnLHXjFRbddpsMPC6v+DWrTQzjrf
	3qE5vi2nRdkAHe9sa3MjygGUgPGueeSViBLxvSnX6dUEou4P1kie5ff4mdueoKXAt0w=
X-Gm-Gg: AR+sD11joLb8WSwKcvVNuS0zBV+uSrIlvci09u84t5MhnUeKOqon0FMApjBPpjd4EiX
	xDow6ICq1OlkqMFtzd1MqDKabxSxwtUcUy2ShhMX8L5iiAym+paAtjHmoOc7RDG/JTveJIFOttx
	KClQp+8qklmA/ulxzhFV5FD0iFE9PhnmZiQIB5Rlu6qvnXmjwGOB1z6EcWNBYhkzqMyAN5GJyCC
	foeHaHN2FrC2yHhMYeG6OkgjHpfoGToWdisgx2Xg7ruxOOrDgxmCJ9Nt7gTO4FsPdeNib8ReCj0
	jldQSu3AJC/lp/WbJ6U9Khke3l8gyQaGyR1cxKF4ilcNZcAyGgPuMfCBb3Bw4R4zWfuAooFy/Nf
	2SqgPAg2d8A76SsPJXMSmjVvflP5m7bOHiSNaKf5VKX+o9TLC3TaqJ+/byD50p0knBu9b4mPCGK
	o6qs0gD9OCibSU/6B0SgAApEW+Wkkr6oAlJ8EoWcG3Rp/85AEv0r+zt9ISQhyEzR1tXrvRA7zLB
	TT/DknObOYZ
X-Received: by 2002:a05:600c:3e1a:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49ccee2a541mr225610845e9.16.1788168089818;
        Mon, 31 Aug 2026 02:21:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm150432695e9.3.2026.08.31.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:21:29 -0700 (PDT)
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
Subject: [PATCH v2 0/2] doc: Rename dynticks-testing to cpunoise
Date: Mon, 31 Aug 2026 11:21:11 +0200
Message-ID: <20260831092118.124576-1-marco.crivellari@suse.com>
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

The tool announcement can be found at:

  https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/

Thanks,

---
Changes in v2:
- Link to the tool Announcement added in both the patches and cover letter

- Corrected another occurrence reported by Sebastian

Link to v1: https://lore.kernel.org/all/20260831081823.67972-1-marco.crivellari@suse.com/

Marco Crivellari (2):
  doc: Change dynticks-testing repository name
  Documentation/no_hz: Change dynticks-testing repository name

 Documentation/admin-guide/cpu-isolation.rst | 4 ++--
 Documentation/timers/no_hz.rst              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.55.0

