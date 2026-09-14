Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAC734EF0C
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 06:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366143; cv=none; b=IgnQoIpCPrLhCyrRl62qMWEMU9OKnuWPUM/NAFj9WAZqyBp4oTN3qlL2YL6QQ8cuN7o7HZLBWAOdwkQNTLUBUJhEz1JB6vAYUpa7Pnam/gYXp2EYMFLg/DNQ0FI0VO12WfR5IdmfIXLr8JjSj/346p6/CnqzDtZEbnH0/DzXZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366143; c=relaxed/simple;
	bh=vY19FPTkTGgFEXUz7E3y70WuMjZlCOtv+gJ53myAkDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NkIP4Ws9VhLWbY1mGae4r4RAu/dpSOWtV1pZuzsatB5NeEAkC2SPISLR76NVjUGlR7r0FmvjoxXiV2/roRXiR1QUh6Toxb527+dClGh+faorh7l205uEjomtOlnELoBh5YOjHbN6e19GDpasgJrfqFN7g/q7DP/sAXkbNO0Y3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COyYFlfn; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COyYFlfn"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so2229940a12.2
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 23:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789366142; x=1789970942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vY19FPTkTGgFEXUz7E3y70WuMjZlCOtv+gJ53myAkDg=;
        b=COyYFlfnBHB8v/nx/XshDjDVasJem7bV/4x/RJsm5p94eA6I/IuAUEAEZrD0ztYd0V
         KhmmC/WHUenAv0tXqwTk4jxMeoNPMpN8aqYx3sz6ZO0LzgbomykliekNj1d0CdT5DQB+
         D8zv24mPhrzfPM5wpGzT8Xyns9MlaTALyscP5E15sZxXRqQxWFBx+aAsbnJQOCI+Ra8j
         hLH9qw+OATINzvgrsZ36FV4YoxDYsvS5nERzHwT9gQNMQGmddO23GtgELPDGiNF9M7jY
         8Ev0llDmjFg3ZQ8kydEiMPEU9AP0d8vpZhbU8PoNwpu3nd9NwY31WOnJmrogCkEfVP1z
         UATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366142; x=1789970942;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY19FPTkTGgFEXUz7E3y70WuMjZlCOtv+gJ53myAkDg=;
        b=MpUdl1bvfcixLM+aujg3Uqh+QmJEhdX7hGfKf5p3AsAV4OF/dnY4fKG9ZjZoGTx7a1
         PCWfOiyf290dOFv8weB5z2Dv2KciQkPt0buVJ6lbnIxkJRKlCKsyrUwEnEKlu7J0qOSH
         fIC1zJ3819dmsC1COMi2X5XVw/z9HiFDEMzF2Z9Ad/R6qpKbWsX4qqWKNROwcDiGBtbN
         BLyQXLkgrO+b/cQjUqXIzZVtfavruBOPuA3i18BDWagq9R6w1w1gZPdwFs4sJrK/ruVd
         0ISiXIbRiLi0fkdacC0Erl0eBkOnIyIaT1EGawiCAXuf8js+klYSwKU1utjcNSswY6kK
         o6Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzfWJQmqrUtJ2QNgkKWaMwxPlcuX7QFcUjgP8hPHB5V/5pShCJWWZRR6cxpSJ+Dfb2O0RB8sfJEsrI=@vger.kernel.org
X-Gm-Message-State: AFuF++m7EVoMlP+sKBpFOO5DYEpD6KVcj6oKCLsF+Ujqppjqk+lLcioC
	TWNiMEuh+rS/EQsoap3AKmIr4bOLsuEgZGq2dQv9NfqTbdtxW6Iw0wri
X-Gm-Gg: AYBFou0+W3rs/sadw3eaar6RFJuird+5nvLrWHcRmIN715rsi9QB8aSMBmCUDAiw7qi
	mkWVUeCatKRrd5rG/wWDerFKhQ6fd7/bFO4+OssvCkxmQJETnjtSFqueayGSFABdn+7LZuny4Le
	Be68siIpLHBy3b3Xz22XRGwvJS1g9dfiCuyvCjJDVbERbfzLIBOYr9Jl5/ffBT3Z2Ttdz00zkNn
	EhRYr8Hm1dbrP2qkJ2w1EaDyE4JZO6iv1R+NYiagdqYj3emTvmMb1oNG+fvvBX+hsJ5uV0yJwBd
	QQr8F+iPn/EGcKtOaQVly7P+NoVWSHEW+6xcSQILY++HCuGNw8ZdCp0F1hj2xWASzI/VhQe2H3N
	ycm2CQdjaY4j4upZzgxakyuzk9jJXMqERhOBas997OC+iAQeqz7MtNxaq9R1M4IJMCk/a3sUh6D
	yfnLVd7ueuYvovOfPCDCI8aty97uohYqJVxns0j8abEC9N1sO09GIw5U3KME4grZIA5TelxEomm
	LPg/+w4/exwIe0E1Rw60ILBHP5wEzzIls7RBwwL
X-Received: by 2002:a17:90b:264d:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39debf6d6cemr2759878a91.5.1789366142037;
        Sun, 13 Sep 2026 23:09:02 -0700 (PDT)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a252:ce11:2d53:3638])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9959ac65sm18651790a91.16.2026.09.13.23.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:09:01 -0700 (PDT)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Pengfei Li <lipengfei28@xiaomi.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v7 08/10] selftests/ftrace: add a stackmap basic functionality test
Date: Mon, 14 Sep 2026 14:08:24 +0800
Message-Id: <20260914060824.4003131-2-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912090213.C77861F00893@smtp.kernel.org>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20260912083753.3426176-9-lipengfei28@xiaomi.com> <20260912090213.C77861F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

> Should the commit message be revised to reflect the actual test logic that
> intentionally skips this comparison?

Yes, the changelog is stale. I dropped that comparison because the writer
resumes as soon as reset() returns, so the counter is not a stable sample,
and I forgot to update the message. Will fix in v8. No code change.

Pengfei
