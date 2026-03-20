Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C93016F1
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 05:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773985318; cv=none; b=cu6AdTFXuCWvyuA0nhe1xh9ev1OjcL3lC43myQ0Oo5tb6LvWMhNkLkKcS0jF9wIGCOFg8+Cc0BB7noic7x3AGcMlSAo9CBhlVx5mf6dCF/m1+QRMUYzoSBqDJJo+EI+iHiAejIYNtEZ1p9uMQv18bgW0d4giLayoLo9iB6Hj+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773985318; c=relaxed/simple;
	bh=BGYrJ0QxuzHFARnTiEidMOinf4xSTXUjL5SK4rWgNlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnA3PnA88JXmvcF2ad9cB5i2oyG6k7bdP8fKp/Xw2Nhu6aIhZdVKceAtkx7Zvc+IHKdIsIbfUIlXfw0XUpO3s4Rvyydh75WhIET2I6Xm8cVQIXIjfPXonn/yfKdUjC7AiXDoqfpqmlEvwKgXpMGu7mw4R30w6Fy0y66cRdFmBFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP+m8PC7; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP+m8PC7"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c742882d2a4so93741a12.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 22:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773985316; x=1774590116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGYrJ0QxuzHFARnTiEidMOinf4xSTXUjL5SK4rWgNlg=;
        b=UP+m8PC7aiEee/ERd6YMp1gtdEd7aL3UIu0nJLoGh2M2d8rR6osPZGdOs6KUvRDfqz
         stN7NURkfHIgSpW2EGhlN3315hhweopXlBcMWdgYafzsCDCSYnWbTHdPxEBgvWfCK4xg
         tu7biWF2DeydeilgJAYE4AiBybHfinHmHu5QYk6wOernrDBJnnQlE7RLiwa1xhV0tR8w
         Dj/Y80+h0ShAl5BQInJmvdJWQon8K0wfukl6WMfQPEcxBfk8SJVW6uzTnNpZPExaGRdW
         7n8ktGX0s+VHbbvwv6xejDZuhN1g34X8pClI8F7JOv0opRTHv7Mc0qxjN6exAaemu3Ld
         +XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773985316; x=1774590116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BGYrJ0QxuzHFARnTiEidMOinf4xSTXUjL5SK4rWgNlg=;
        b=gYNS+S2O2qziUumvp+7ucdNtkp1gdXRGLRIhaAIzUtgG6EWhCNdCdURsQFXw4JTTWl
         nT/EYJH9NE5jf7ppKk6I6TrP5wupPHAL+yv5Bb5qj6yhwyiwwUxoh3B5X/niwSG9MxDW
         QYtH6VLFNyyQm/ntos7T2SytQcAB78FwKhiZur0qK+viS3jQpvwd1PE3SuaF/Q6a9LVG
         76c94UO0XyRevFrU6nLS7NwGjWDi4u4al3VPpMXJk1c9vYAuhZdzgfs01Sv/eZhMfSQh
         2OxHk00dS2fKzc1eNSxQsCyklpMS3tN9TTsnuBpcEMyCOHsQidXtw2d4c6+GKF+Rr/iy
         oCCg==
X-Forwarded-Encrypted: i=1; AJvYcCVeVe600G9kfLoCCmLaMQw/UEDBOQKCjIEu68z40z4nAIixiAp+MNl4va5dlUR+VmFkM2mfq1s2ULM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUpi/iLW/8DBO45EwwrsMZOwaIbp0j2KnTOFVi+HFSVUkdA2jH
	DalA9rFeKbZLfV7wPYqgAJ+E0pzxlQVWL1qPtwxLTHLbBSbCBGB7FWN8
X-Gm-Gg: ATEYQzwS5OrgxOAHi8Whnm68RYDw5JQABh1xTQo/HiEqtOMwZRfOgXdRs8ghQlahfkW
	vIbGH/j2LTD+yIyTwQHI8tTPXNZG8lrXo0iQ8P7XUSY6Dx65asb/FAiVtKmha5YddsUWCDA/fhV
	rbfLDhk3nqLcKarNvAxfoMkQVMN/RebLmDjXiCa/Dl4SmDJ5VH/AjDhi4RsbvERz7hX97+Wvlp6
	YAnj1KWEpndvrlnvkPoOJ+m4Sfq1wHZrW83/NTbSHiPQe5es1ITgacy0jewXEmou+ovMBPrepjq
	mikN+a4GrS4XKaTru/QtQrpb5CZfY5KUXO9aIo1WHkim16ljzFq0CNn4NOxQEosiT9MHdtQ258t
	6HvoFGX0yZke5H6aRAh5lfC7klnCBKPihfrMkjz6Qny05FELuf8ckx0d588KirAo0buTSPxeScT
	Weluc1Q18rcUVy+Zz8z+FkqrSeQvowvrHOR4EJG9jZ1ZbtXHBuAYs=
X-Received: by 2002:a05:6300:8b0f:b0:39b:c0b5:b0eb with SMTP id adf61e73a8af0-39bcec38ef1mr1624946637.67.1773985316235;
        Thu, 19 Mar 2026 22:41:56 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:898b:301c:d085:a35:99e7:ffec])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443cc9edsm852792a12.23.2026.03.19.22.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 22:41:55 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] Docs/mm/damon: document min_nr_regions constraint and rationale
Date: Fri, 20 Mar 2026 13:41:45 +0800
Message-ID: <20260320054145.213945-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320052428.213230-1-aethernet65535@gmail.com>
References: <20260320052428.213230-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SeongJae,

I'm sorry for the noise; please ignore my previous reply. I accidentally
sent the commit message instead of my intended message.

What I wanted to ask is regarding tasks 3 and 4 from our earlier plan
[1]: should I wait to start both of them later? Or is it only task 3
that needs to wait until your fix is merged or abandoned?

Also, I'm preparing to post an RFC patch for 'damon_hot_score'
optimization soon. It aims to provide a significant performance
improvement.

[1] https://lore.kernel.org/damon/20260319151528.86490-1-sj@kernel.org/T/#t

Best regards,
Rui Yan
