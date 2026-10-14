Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052231B101
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 22:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018047; cv=none; b=nSF9xSeMEpYNtJmqbYrXUMzEap0F7w/tOZhdiW46zrUEhQHjbksmyINxr63hXqqFD2mL8fPLPfLfMD5VwgwJRPmxVVON/2e7l5qUWPJ3T47FKFMyApLFuF9u2uWTOVhWBCudJ7YdzTCoZXI15SS4wLArfRkv8TSetwwVi4//1Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018047; c=relaxed/simple;
	bh=vHMcvKy3pKTwKa8Hattf13WL89UUyhvm53gr9aJVY1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EddIj5gX5NWF53dEBtMtAsJ7L6NLIccbrHgJdMNCtCKn21ezw+BljxhMlC45YNvXKBN3LfR+6dz2Uk7tbkPQdPBjVyaXwF9WuiUdXQm0PPYtMo5/xLIkcMeS8AjNP4sCBq0sHlO66O4wAJFud3QEjtS6PIu/yJ0bM2rQhAlB8d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VL50TiFA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VL50TiFA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd35952so454438f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 15:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792018042; x=1792622842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHMcvKy3pKTwKa8Hattf13WL89UUyhvm53gr9aJVY1k=;
        b=VL50TiFAzlXAPDV2J4V5NHbGoErhby4V54tAUvLB2cbP+H9N0M4Mgi8GmvObAYsokq
         RRqHYLAJ5ZDJzkTZ38HqvGVXHGosYw431sRV9OhfUi1p6FE3lK+GPfq9r7NkytmAI+66
         2WG7cnSdDL5LXG25zTt2Eu3Q+22vYR4t2BX6/7cOgAwV5mFTq4OghzuFxPu5rKnAV51r
         zBym6TAecWDbsZW7K64ketfZGSjxYhKUd42P6PixiEZA5QJLKQ+zbm5LGroDW6py7Rjb
         eXab/ZwsvxdRoJA4fpReLDIiCgBW8QQk70sBwTEsr3OtY6c5k+/OxpezON4Jrh0jKPYE
         deUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792018042; x=1792622842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHMcvKy3pKTwKa8Hattf13WL89UUyhvm53gr9aJVY1k=;
        b=sWB9O81Xi3r2CMW58KSD7RRPZG0gFj+EJkdy0u11eMccJGkYUIJrP774q7YPHa9LYc
         JRko3PzMmyxl+WzGptsXH/9etgVEYeiErfwyGCpIfqYRUaotl6ERItBHVEuT1EirxW4i
         7QhVdIcnNrmFNaTI/FUZUNxS1ym8zg+WFB8Y4igvl5L+ytq0n5eNbBUUMbB5zvwI3uA5
         J8AkoR9nZOFFC6xWbEF8zetH6TyMK9HmO3ULvaNpQqN5SPw39kfbDoshIHAoqi2oKX1g
         qEywz/8ES3ax/Yj+J+QBcY35Vm8rT6PiSmpvWVGmyGcSzNJA9sP1s/SlbnRnEXriZpXR
         iDaA==
X-Gm-Message-State: AFq9FYJQfN1WkJO3Z3E5ro0FPda/CWv6HXXO6a7GqGubJmPqJONO45he
	aJRWXLv3yUgdpMRYNzFjXa7PKC+zdTj8+Yhetm2MNK2AWCQc8shkDrkN
X-Gm-Gg: AYBFou2KnkQB83laHbg5d4WGq2qvWNLj4T2QnOCgPuiNyzP+iuA3f22ldfjldJeKrts
	mvyZA14WzInhDzc+KukPdWmkLMkM0n1HJ7J1VzQqVbujQB1duIh2KfGpx3ALXGOe9s+DsjPjX9X
	FbrituDiyZ5Me8JU8JZx1aUOPbAbEJ3dckLfeghfLq3XWpXyRtVcna35gb8/NnCpQ0N/B33rtrG
	7aa+TQ1Gl1WTPI7sgAi+1qehLsUcEKXcVVMvxogr05jh18Ud2av1MrddlywftUc6EohboFdgFYh
	zsE3kCmWVYHzWjIfPrEwKCDMZbG1Nd+H/xlAUKvrEtfMq6v82VHnSs956gy9GXndC/QRv4pnXNb
	v6eOmYh8nh6ZmPiBz3mBRW70D0rq+trG0Cf2p4CJOXehRBsAs2QTqEAUJl2aq65c4cDKU8q20Ik
	wKyGsW9nbfGRFGed24f0u0Q1nouHeA7QJvR7jznFX8fVOoDbUWpXvf0FYKr8NHJX9oouijuDsA+
	wtZiCsSwR9o/i/LCKNJ
X-Received: by 2002:a05:6000:4696:b0:48d:f1b3:7e82 with SMTP id ffacd0b85a97d-48df1b3802emr1743774f8f.0.1792018041592;
        Wed, 14 Oct 2026 15:47:21 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.9.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm10487119f8f.29.2026.10.14.15.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:47:21 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	bvanassche@acm.org,
	tudor.ambarus@linaro.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH] docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes
Date: Wed, 14 Oct 2026 23:47:13 +0100
Message-ID: <20261014224714.16922-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87qzhsurid.fsf@trenco.lwn.net>
References: <87qzhsurid.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 11:22:02 -0600, Jonathan Corbet <corbet@lwn.net> wrote:
> Neither of these patches applies to docs-next...what did you base them
> on?

Hi Jon,

I had based both patches on mainline rather than docs-next. I have
rebased both patches on top of docs-next and sent a v2 for both:

- https://lore.kernel.org/all/20261014223134.14772-1-emmaonana18@gmail.com/
- https://lore.kernel.org/all/20261014223437.16164-1-emmaonana18@gmail.com/

Apologies for the inconvenience.

Thanks,
Omokefe
