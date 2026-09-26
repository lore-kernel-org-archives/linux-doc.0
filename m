Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4905E35200D
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790416469; cv=none; b=YojweD0zgUHvHR8hw4HhzET13e5IfB3NB9x1etZIeXopcyGItg/k93K4x0H8rO6F28490Wr61yPPKXCInnlwLks1yZ+IG7rYAF/CjW4miLFj/y0OE9dA78yEV01ABC/OPoReawWBypnYM28tp+TOefPZFhWG7iljg5ulmXNMlHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790416469; c=relaxed/simple;
	bh=jtzYYt1gnSbpxseTWwyuGoJGtTKrnUjv6uDGmqvVs5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXD0eQW+ZfofsawY7dqSpcQmK+R6T7c6OWYP39A/3WIEWFMc0SLK7inYcpVN4Gk94cmTYU+g7NltVg+PVKQqZ0sH3nDfajisvDTgad/pBfePJFaOr8Kwd2hOfPwQfVPsNFz+3iRVjak6t007llr9eeYBgs4wYfyTrl4nPDKXUjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odwILmkm; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odwILmkm"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25bf832368so17875566b.0
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790416466; x=1791021266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtzYYt1gnSbpxseTWwyuGoJGtTKrnUjv6uDGmqvVs5U=;
        b=odwILmkmjjr7OdOxHtSGcLd1TbFexnxRDpwkbF4lXXuADNF8UsgA1IAIN8zT/U6k+H
         GALsXW5JAT5wukTCwT5oFnlHlbpZ1f1W69fojya6jrVwmfxMblfxTPtPH+X79qaNY2Yk
         PhMEbkM8JWxzlaZsHcbAcD1nVgxP5m+/+mndanbhqyuYVP5bhDYJNbwfTGQsbMkLCJeA
         +P4ZlQzXNlPO3AC09OANNp/C3DNHFiKAth80tBFziyFmdBnFAI7FxuNR4S5WKp3NMZZn
         KkLsXAfY75TP3XiA2hRWRZcoJcdZj1foxsJdfGIXhlZ0SgXhSTZdt0XLGgd4dV1IANei
         /hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790416466; x=1791021266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtzYYt1gnSbpxseTWwyuGoJGtTKrnUjv6uDGmqvVs5U=;
        b=TevYpHlVUhUu0nDrbog9IP5HimE8RzJjNk8eyrbltfkPg3rDqV65WHGUsHfgqEvKEI
         9t+WIy2VexaunQn0kOXrfZr59jOH6fu8cyMGfHqr8V6I/GulzKkZlJ18ebOvzbJizP+j
         qi9iT8HkXWMRWc3sNy9SuTRQ09cd4FRlANBoSTyGqu1ZewJfDdtSiKupT5dzyl/9lNz4
         0ECqmjs6B/llUZmASiCijDrO6sDoplPXZ40hKPGtOfiu+z0g7teD+HsE8HFeMIOGPW8E
         ug2oIitiwSSZibGs5m2R9nqE2QzlYYcaL1MnNFAIIhF5ojqi1IrnXCdIwofTN+vXkwRP
         nymA==
X-Forwarded-Encrypted: i=1; AKwUvBy5EHs/hVo2AUUZeeWXWOY5p5FQ+/jZrsrn2Aid4AVIVbDcaMUkgnM9yk2AuTxtQ/QtSO6kV7hqtKU=@vger.kernel.org
X-Gm-Message-State: AFuF++nPLjrVqvbyWAOD+gakaP2RyfHWaaOQAzI0iC6a5eD8/filqjAT
	WZNIL2cYAam5xcnsck1yQKfI7mhM06g6b5jW/Fx3Svsy0hsTOIqit8Fb
X-Gm-Gg: AYBFou3vRgRPN5YwA1oFTETW2aO5PoLNfob62idRCuBvyafeR8IjY1LBp9Q0ZCCUyEh
	/etO3lOP9csKpFMQv4FUGDgKq5yRo7m5PFhfSbbOH0qClNWEobEeqtWqFz2OmqVTpXlLK8RmlRz
	9EgTV9+vIzmMgXl9juFPbdgM/V9cpK4jDx92fswL0F32vPuWv1+Fl+UDMJjIoetG41d6yaqUQc0
	Hvp4hcZaDpVoB3QQmdAQwn9ACWVEUive/RVa8Db0oaYWq+n/oa3RhSWETGz/4H4+omD0XI9LSXI
	ug1LXPVo6Md7xMGL3KRv82zilE49VFEXXumUWUB6AtXz7H825CShF1aMLOqVsjDFkTYFbO59fmt
	XOPIqUOq5jkwprdPnKNTpe81b/cNMxyOsf6R+riUvUvVdEYb7yB0AEAHnBFvUGzMbhsaOJs/CqH
	dAu+hKOOZmxURW0cuU8pvz0TBLpYwUhWUkhq3GvM4c5d1pTLHkdbeZn4aNY5rG6utQ6mP4u7o9c
	ovUDGnI2utDVRSg1sZL
X-Received: by 2002:a17:907:6090:b0:c29:39e2:4aca with SMTP id a640c23a62f3a-c2adbca5396mr447422666b.1.1790416466310;
        Sat, 26 Sep 2026 02:54:26 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.3.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae77ab08csm224178166b.44.2026.09.26.02.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:54:25 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: bvanassche@acm.org
Cc: peterz@infradead.org,
	elver@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	tudor.ambarus@linaro.org
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct declaration
Date: Sat, 26 Sep 2026 10:54:05 +0100
Message-ID: <20260926095405.56438-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org>
References: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bart,

> Has this alternative been considered: instead of modifying
> tools/lib/python/kdoc/kdoc_parser.py, apply the following change:

Thanks for taking the time to review this. I tried your split
(`context_lock_struct()` above the comment, plain `struct` below), and it
does fix the warning.

> +context_lock_struct(debugfs_cancellation);
> ...
> -context_lock_struct(debugfs_cancellation) {
> +struct debugfs_cancellation {

I still think the tool-side fix is the better route: `debugfs_cancellation`
is the only one with a kernel-doc comment today, but the next comment
added above any of the others would hit the same error, and we'd be
fixing the same warning again.

The part that really sold me on changing the tool was a general ordering
issue in `dump_struct()`: unlike `dump_var()` and `dump_function()`, it
applied the transforms only to the members after `split_struct_proto()`,
so they could never repair the declaration line itself. Moving the
transform earlier fixes that, and a full-tree A/B test removes the
existing warning without adding any new ones.

Would you and Marco prefer the tool-side fix, or should I respin with the
`debugfs.h` change?

Thanks,

Omokefe
