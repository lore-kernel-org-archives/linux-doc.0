Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFR8Iual"
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C42A10FC
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 08:17:00 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50abbb23122so3252058e87.3
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 08:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447418; x=1702052218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8T3cy8rgEEZrjRntl2zyuqB35X2El/CC72UZNbzDOsY=;
        b=AFR8IualhTZYllj1HacTULlVpbMWXZzIOjQJ8PzT2YaTPnwra6Djlj1nm6f55hnWBA
         cbIhvsTn9M1paNXwg0FhlpNlhffWOey5OfaS1+lSFrVQEKb+9Zw9fCoQeywSoopHkL7d
         lbku44pKhlBKiGIOdjxJvtPERlpqbRgNsovd3ZZqL6QOfeMbdoQcNbOg9yrNwh3SI/xB
         ioza7u6woO9Ib4bKW8Xfl/w0cHuiaHLvdxdmr1UKFoSN6L9NrEA191bVmi24m95Gpb+2
         D0eRcnaV1FIIEALntP6NSGjKT8EP249CHl1SD12xoizsZqKLvN9awHfKzsuNbuDv+fih
         q9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447418; x=1702052218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8T3cy8rgEEZrjRntl2zyuqB35X2El/CC72UZNbzDOsY=;
        b=Onod9whhEKSH66Dybcb42ynaJe7WICDfP57B7iQ8hogkcJ9aOSx3OOAFIar/uBCVGr
         Hwo+85NwI/b446WNqv7tp7i+BHfLDMnQrMoUEQ9Khjm7fvyaKgC5O78/SnH2qROgVGEG
         02CPXR4RB0L7IMLdyYCHgf4M76nX/9ku1oPppi7jBWGGAQ2MaoVCAgCiLgJI0ei59xeL
         qOA8mf7c0YGqZscITpfkp17KFeZggIzMVie5ywyQALXTCaH5ihGdTGgK2HYrlFnFbkCl
         0wnD78nQWdNC7Lljk2w5wYQGSQCZ1Swo2OeC/HeOQZYz3WJbAoRZrI2LEo5S9xUouEUf
         /F0A==
X-Gm-Message-State: AOJu0Yz5sfSrnLiWqnh4ejM7scdvS1Wvf6NSIUdMU23QR+oByJYbxkHt
	XsA1tQKV2H9Q5isazV6tdvAsJA==
X-Google-Smtp-Source: AGHT+IHWa6yiW4yOdMoPcmQOVRGPAzzuzOf0mQzGDIhx0xKQxBPgvRsyWwzyP0AnS2rdrwxJMGzn1A==
X-Received: by 2002:a05:6512:239a:b0:509:44bc:8596 with SMTP id c26-20020a056512239a00b0050944bc8596mr1310221lfv.58.1701447418251;
        Fri, 01 Dec 2023 08:16:58 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:6db5:f04:fbd5:88e1])
        by smtp.gmail.com with ESMTPSA id l27-20020a05600c1d1b00b003feae747ff2sm9591398wms.35.2023.12.01.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:16:57 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	corbet@lwn.net,
	alexs@kernel.org,
	siyanteng@loongson.cn,
	qyousef@layalina.io,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: lukasz.luba@arm.com,
	hongyan.xia2@arm.com,
	yizhou.tang@shopee.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 0/2] Simplify Util_est
Date: Fri,  1 Dec 2023 17:16:50 +0100
Message-Id: <20231201161652.1241695-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following comment in [1], I prepared a patch to remove UTIL_EST_FASTUP.
This enables us to simplify util_est behavior as proposed in patch 2.

Changes since v2:
- Add Chinese translation
- Add Tag
- Remove remaining ref to ue.enqueued and move some defines

[1] https://lore.kernel.org/lkml/CAKfTPtCAZWp7tRgTpwJmyEAkyN65acmYrfu9naEUpBZVWNTcQA@mail.gmail.com/

Vincent Guittot (2):
  sched/fair: Remove SCHED_FEAT(UTIL_EST_FASTUP, true)
  sched/fair: Simplify util_est

 Documentation/scheduler/schedutil.rst         |  7 +-
 .../zh_CN/scheduler/schedutil.rst             |  7 +-
 include/linux/sched.h                         | 49 +++--------
 kernel/sched/debug.c                          |  7 +-
 kernel/sched/fair.c                           | 86 +++++++------------
 kernel/sched/features.h                       |  1 -
 kernel/sched/pelt.h                           |  4 +-
 7 files changed, 55 insertions(+), 106 deletions(-)

-- 
2.34.1

