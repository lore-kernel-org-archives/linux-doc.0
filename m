Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1252330F927
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 03:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781667496; cv=pass; b=AT8WW2Ohckur5X2Y4m66ywIpBrNEA8FQkah8rpngibIBHe8j03yOS3h0eu1eW3I9NL1i4XCryFrnAmevZG2ZfzEiKnCAsYdiP//5aqxvIsYlREBsxTCvdPe6AE/3Z7ESSs2CoKK+DkNoIAkBmTdS+Nd9Vx+ZkOb7pNnouZsA2Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781667496; c=relaxed/simple;
	bh=1yTH6q/Zk3xLhx171J07NxWvGjiKAaCvxSCklaLl/10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOfMK5Klqy84xxh5MEdNLv/siPaQgmxtwP9PsttVq242eBw/KjFtHNw3KtPKh+WaMFlHgmHs1AgVeg0bqc3ECqsMXVTWW8FvQIbO5wupfB21GNgtMqoR7bXmBcBuXt6FfDlWN6G4+B4+ZWvthsobe59iXa3FPnX1Nu0wo/9kYS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXYJt38k; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXYJt38k"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3967724bed1so60533551fa.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 20:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781667493; cv=none;
        d=google.com; s=arc-20240605;
        b=g5IJyL6CdM9I6CUDpa6bUnx+84nXzxB3wLdEFoM6Zv9JtMvl0wpTQrCgoLO0CKEqAS
         qXbZcbci4HvaRpzADw+c6qMXo4T5rBjM3Op4Pn7H2a8QVhDUnqSiJQwonKRD8p5i0ARE
         EExsrmpCYIJdIQL4EQwRhVBQYa9rW7yptDfSLzpEruyRr/sf1RoAhpu0JdE5K/ZENM8Y
         CjXPheQA3NBYYqV3T/JFoMjcmvR8EhocQrqAQvU3Q28LqfRA6Ct0XSSp9YuHTk8Vjdbn
         54TbulW90J004M3jyPsTXWL7YytQWs6PGv7/I4JyZ9RDflPVL+QU9xl/N0G3BR9SRsdy
         5ibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ml3xcOh2MxfIz5ly++h37MpYhzCflCK0dlrikZM10nE=;
        fh=Mw4/9bJ8EVhIeaeDo5SrSSqohuTq6Nzs3KB09XdM8zY=;
        b=FajQ79QztUzf5w6PdfxgqAnUOw+hoIId3v5gTqhszkykPZhev/NejimA5eESVzRphR
         YU0nLiMdOGDZfUux7R7s6s3xBxb6x4v5+WaXvayeHA4oi1q9V9mtUHsWy5ZWwdBH/w2F
         BzkJSiY5qzd/iYdHw1CyMJkjOvCvGeaXRMnxaZH/UJqGYtK+3YdjB1Hl6UGzT7HaWUCv
         idT7qbAfywGp96ziH5XW3TAvo/62MZpwLz6HiU343ckvvgd5hf+5Uwek8FUXy9cr4fhj
         cuehVYAvcPo8/rVAYHpf/b+wvc05zctdfxoalaQkQu1Q9cCTebDPnmwooqIk0pc7oLJw
         dKKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781667493; x=1782272293; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ml3xcOh2MxfIz5ly++h37MpYhzCflCK0dlrikZM10nE=;
        b=fXYJt38khkmWe722WONWLmEGwvPXRATReoUQ7bMUORtbLjv7adU+Cf2ro+yGg2qTLc
         DhcOdhxKtO5r1QR8v5740T11YNpv4iNzfxOY7F9m4kgGAP7YlS8seIhMPi+wKTer5nwH
         XPSSZGnPMSZPTuoauB97M4YzBVaZPgIlzL6omsDF/kYPK7dFwtdvPZ2cf05TAV7FeOtl
         Lx4dnvFNNB413JD+t/U2g3EEoY9s5QbwvsiuhNDxMcMpY4hC7NvnWvQYdavuVS0EsKoi
         YF308RtlxZD5a1gXA2XQFJWXYEEto8tYQOy2Y2LqNG04vamME496yFoGUZkFaa9+hkKg
         Eycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781667493; x=1782272293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml3xcOh2MxfIz5ly++h37MpYhzCflCK0dlrikZM10nE=;
        b=PXa7B0EHD0K/7HSq89KoWY+2wgsI38E+5gHIE8VWVDGDxonvMcHo9LXNYXnex2/PhR
         6WjStb23+vOXZa41S9bRxG/Glow12Rg8kYDOtPmNBbkcojK35InZZV3dQ2J0ye7vNwb+
         KqPKki80fhb+amsgd2U2G9B3MgjhxW8mhKvkml0xLc1mYnHnfkQlaujKSZ0PHcFKp1Cd
         3JT6qDewNhNSk4bTquI5IWRy3eCvJVqBJsmcEBWnmzQNrVL8kQrUhVVb6E13GV883RsZ
         20MgcaZTPI4pQ4unt2F0lKYREwi8Hey0Qdyhdx0XnArhWoOairvHi6UunB0pG/5h8Vnq
         8t/g==
X-Forwarded-Encrypted: i=1; AFNElJ9vDUmvhAJYElApDu7QbfcRQu5T3PodZKD/NMBhTYOPXTmNJgiQmtLAvFCW7FCe78avwYGYS9eFGPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43LHqpkb4+1WR8OrBMk9bid8LgRPU6FxEHDgSZ0nuduGW4Is8
	Ymw4lidn41z7i70dyv9GOgVyhltQst+7Avanp4Zhhb26RYNSJh+8FTVUrvPSd8J/zlYDvs2K8jT
	HZk1KQgChbng69NCUNZ+SuXaUPvJ2Mj8=
X-Gm-Gg: Acq92OGbvPLqPEQoIYl7D+LeieqkC73LUdgpFd/mMaxBRRaAfMkLTecJ+Ko9gA7joZE
	yC+NVi51/21JhYjoRJKr3c1kaVL/QYMzJnO7QnAtUFTvmo8PDMyJgU7FCRUZlGWH+U3N2fsdtUU
	niep7FGuREtUSRDs0sm/GGLhqt2anY1h6G6M/4CcCwAVCLoMiOTma7iqZqkmhpHEdmuRtZQBXXP
	kEtjcsHigP8Hcm91DWJdcwHP5fZ3uVkJcw5JUfyYb3bs1wGxkhuGmJyEVeguT5MG9NxzT9fEgpj
	vl5aUhlLf4gRzr4TXI96nR4Zkw==
X-Received: by 2002:a05:6512:3990:b0:5aa:500f:7bae with SMTP id
 2adb3069b0e04-5ad4701aa1cmr506325e87.35.1781667493023; Tue, 16 Jun 2026
 20:38:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <20260616123646.GB21024@lst.de>
In-Reply-To: <20260616123646.GB21024@lst.de>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 17 Jun 2026 11:38:02 +0800
X-Gm-Features: AVVi8CciGk9AEKRBRV_ut2Q8RKhgWQ0siGiHzajgiKnai1OCYfaSoTtY1t2d4Zw
Message-ID: <CAJxJ_jhK+zkpjhs3YsQ9RoasKYh+E0NweQci0sPAEY1ne5LmBA@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/zram: route block swap I/O through swap_ops
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christoph,

Thanks for the feedback.

> I fear this is going entirely in the wrong direction.
OK. I was trying to build on your swap_iocb / swap_ops rework
for the zram swap path, but I take your point that compressed swap can
be handled more nicely.

> Yes, we have to keep zram around as a legacy interface for now,
> but the right place to deal with compressed swap is in the core.
I agree compressed swap belongs in the core is better, so not only ram,
but also the block layer can use it.

Before I rework or drop the RFC, could you outline how you see that
core-side model working? In particular:
  - How should a compressed backend like zram or future block device
    plug into swap_iocb / swap_ops?
  - What role do you expect zram to keep while the legacy block interface
    remains: current block swap only, or something else?

I am open to reworking the series toward a core-based approach once
the intended direction is clearer.

Thanks,
Jianyue
