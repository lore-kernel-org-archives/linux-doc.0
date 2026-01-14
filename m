Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006536D4FD
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768372258; cv=none; b=J9l2v6tzthv+gQ5cWISF4YLNwkl0Iv2VPV8yROEOCUkZKPZzWXpMlZRpOUUnrlGF5bK6cS2qGFAfEcMcRJ5uCq/lurjDK1++ihrrRh0XuDvV9htNcYpSG6oHNWfl/zRLdMI8e7choL39Et2nRIbbdMWfq7M52d5Iz1wxM6qrmSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768372258; c=relaxed/simple;
	bh=wsT/ZmfFtzhm606qNq9BAjdXFdDwemXIaKcdGEE/foc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOBMo/x21XnuDeRiAe5Q4xALbI5hXY4RyNfR5XZFvu5HbPdDZYn9y7BaLIDkQ+FQq2MtiT+RaFHzwqIARwXoXcE5ltTdPlVhzq+vnNvvMGlUUPMw9AWhrcw85HsEG2sGSQ+Z3gP3yfWZQQ7OrNaP6O4A3kkzuzDMhBGzV5IjsVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXaAK8da; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXaAK8da"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2af41f558f5so8833806eec.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 22:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768372246; x=1768977046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsT/ZmfFtzhm606qNq9BAjdXFdDwemXIaKcdGEE/foc=;
        b=CXaAK8da6UbWAf9LTGQVxZ3RjyYPG8HPngE0+0+rBloQ146ukwRHfQGjefTdzVKVVe
         oipdOGRNuperYOUHyTTiQELJoc0ef9T95jahpZ8debVvyE2/iq7AlwZ2RbWybY4mHElV
         lOLTNc521HlxfzN3bXK3fp8W1fPyGnOzawLCCQA4yg+nNB/Cyl83s3MYXdSPK9+jlKP2
         mRwAOvoS64ubsC/0S4tQ6PpAJCIGWsq2bIq15ZCO4BzxDRxrxoyFXHMsVsHn3OGWR5Bo
         9BvwA5Tmv16e0+EvQJ5tiYjAJIdFoJBMsCdjIVgvB7cP9QDa9QtREIMZejRQDdSGfmJ/
         3rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768372246; x=1768977046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsT/ZmfFtzhm606qNq9BAjdXFdDwemXIaKcdGEE/foc=;
        b=dTdepX4Qz47Ciwxee34RuNqC+egR39cmVyy0aVT8gJwMMQ0YQN8pR18svweiWMWHLn
         9tbIVOKWusTgFSTievEWqd66hFIjh5ihZY8zykM3e29A4cjITNDHuhpVOvDjIwUI/14c
         t9aIqz5k+IUesQDNfL2h1vT/1LhQ08Eqy31liYCPpAZv7BYQa9TQYGH2kCHm4Vq7GHHe
         tmwSQXRyFPgzqSLTiWprQvN+t22b+k62NXOSpxXN6m9tmHpAfPQzLf7PmGKBRWaxIBHe
         3h6lZ/6O3A+qOTJnCqXUCpuM8ZZ/j4ALEkDpjcXyMpsxi6o7T1sH5g+Xp3Fz1T4elmq+
         bknA==
X-Forwarded-Encrypted: i=1; AJvYcCXh1rRKAV2mLDU8/VEX8ba5JREYV7NDvndNjWvqODElw6tRvnCz1QMdmHOFgB0nh/dU6boEoLkb/j8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8RpuQ6wCDTLcP5gw6KJYTz2Z7gjpy4XYln/0eWAYkAEMxLYE
	PBLicpabH0eDz/mpBmR5V49jIxR2vUh8sjhseMPEypW7YetLg3V5fz3b
X-Gm-Gg: AY/fxX6LsfpdobgI692YtJHsRrZclmnJplnOFp7gaI4/yrqSrcfPZ+Mh8D1tfu8Enp3
	5mUhfrdXxHogR2+VXNHiRPs01X9K5HiFyL+4cUFaDdOE7PQBGkAIOTLF3HzSLY5fUh4IXwLlUW0
	TFd85CGZ4CuefksYU2zGw5TnJF1bcFhZ+WEhHWaMDgHq230FBTsG2QmyYtYC2VI9dkuC8dpmJP9
	yMmuqYJU3gChjyN3HnW2FNFurYO/6q4WaQXH4RoaNJd1ZbGM/h9iqLBjj1NrCFO+9Hp1AlSWx81
	bPfdx+eDirMm18r7xTXbhbkSPaLwagAtOvn9TDKGv5ETaBE7WAJUBehowECt+xnkstIYjH8TOSO
	0Uegx7WqKbQ5tjV5GJYDtgboYcxFxte/pcpV5OvM1OBvHr9f58T6/ks0xkyonk6ABnTxYVbnLRB
	HE
X-Received: by 2002:a05:7300:a286:b0:2a4:3593:466d with SMTP id 5a478bee46e88-2b486b72a9bmr2703868eec.9.1768372246284;
        Tue, 13 Jan 2026 22:30:46 -0800 (PST)
Received: from localhost.localdomain ([2607:f130:0:11a::31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a5d3dsm18126062eec.13.2026.01.13.22.30.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Jan 2026 22:30:46 -0800 (PST)
From: wang lian <lianux.mm@gmail.com>
To: sj@kernel.org
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@suse.cz,
	wang lian <lianux.mm@gmail.com>
Subject: Re: [PATCH 11/11] Docs/admin-guide/mm/damon/lru_sort: document intervals autotuning
Date: Wed, 14 Jan 2026 14:30:33 +0800
Message-ID: <20260114063033.88885-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113152717.70459-12-sj@kernel.org>
References: <20260113152717.70459-12-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> Document a newly added DAMON_LRU_SORT module parameter for using
> monitoring intervals auto-tuning feature of DAMON.

> Signed-off-by: SeongJae Park <sj@kernel.org>

Acked-by: wang lian <lianux.mm@gmail.com>
--
Best Regards,
wang lian
