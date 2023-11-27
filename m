Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErbuYcjT"
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C22FD72
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 06:32:47 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507a3b8b113so5604380e87.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 06:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701095565; x=1701700365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3q1R9G6lEi+npsw/lKpAN9ZaKMnvPi0OuvIH02EHfA=;
        b=ErbuYcjTg94zudsQWK5IjrwDKcvikX6576r5XSjXeZFG9eZ+T3C4gbmr8NE6hiEngx
         ic3yhRkhPkBhxgNXfDFiMsxwt/g6iG6hzpC0W9phMkDD0td59WafayisxLG/XUPiXkJ/
         odS9NWbOryDhjUcPQ0kSBTR1P6rXw+zF6tCBXdD5e2SxSgZjgBlOEc/NVJZBmSaHhVON
         ioNJSzqrh461f32n4gfGnfak41qFJ/9YBXYYuosSrayxftPVfvy3TpH9+771KdGSYQgg
         Vrx4qCyc6f6dKokO/aWDbq7VQAHwaWivunMk+BYkXR+E8VcPmv30NPdm9/GUj6wwOXnd
         HuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701095565; x=1701700365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3q1R9G6lEi+npsw/lKpAN9ZaKMnvPi0OuvIH02EHfA=;
        b=I9TAKaR+fV2ATe3by/+6J1Prm4B7d0nwgvwt4Tl90f+bGceMLPEr3w/oFtXtVhhFhJ
         wj3evMdSoG7HYnOCVqnSSYl3hP3EpIWi6jhy1AongiqQbp8vbwA6ZzQGb99FIvvuORaZ
         bsTN4GEfXSdSIYTzO4c2M96muv1H9D6urydlSUFIsZk11t5E7W63YsGGgtTe3F5vQPgv
         Lj22jgSrYyYu4RwAZ9P6vvtaYqOxxFMQJ8PyzvfsYH/8NHFW0Jfo8bYAws+OK+S/mnIv
         jR1sDXJ8dUm71HXu2Otel/zYujxx7EyxMgiBWeV4muTlMX+1oqruDceOjgVDaZv7MpAG
         br1w==
X-Gm-Message-State: AOJu0YyOgAZa2JRSGBDN7ueyrUbuXcjIXFsZ2/TrA++0/ARJMaEYDWL2
	VLO7DWCLyXqt7pZ5p1dSXvZ8vA==
X-Google-Smtp-Source: AGHT+IEMAUx5BrW7D++3HuEOtz0D8KaYwxeqiB/PU5mG4/gN9yOD+SB4KZf/WRNsSf90SI4Tnl1Nag==
X-Received: by 2002:a05:6512:3996:b0:50a:3c38:778c with SMTP id j22-20020a056512399600b0050a3c38778cmr10150685lfu.12.1701095564776;
        Mon, 27 Nov 2023 06:32:44 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:cc67:4d1a:fe5d:819a])
        by smtp.gmail.com with ESMTPSA id i2-20020adffc02000000b0032f7f4089b7sm12174392wrr.43.2023.11.27.06.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:32:44 -0800 (PST)
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
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 0/2] Simplify Util_est
Date: Mon, 27 Nov 2023 15:32:36 +0100
Message-Id: <20231127143238.1216582-1-vincent.guittot@linaro.org>
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

[1] https://lore.kernel.org/lkml/CAKfTPtCAZWp7tRgTpwJmyEAkyN65acmYrfu9naEUpBZVWNTcQA@mail.gmail.com/

Vincent Guittot (2):
  sched/fair: Remove SCHED_FEAT(UTIL_EST_FASTUP, true)
  sched/fair: Simplify util_est

 Documentation/scheduler/schedutil.rst |  7 +--
 include/linux/sched.h                 | 35 ++----------
 kernel/sched/debug.c                  |  7 +--
 kernel/sched/fair.c                   | 81 ++++++++++-----------------
 kernel/sched/features.h               |  1 -
 kernel/sched/pelt.h                   |  4 +-
 6 files changed, 43 insertions(+), 92 deletions(-)

-- 
2.34.1

