Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CF72C0299
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 03:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781668021; cv=none; b=ARmymA/s8gz8DjXymkxyxnWq2+HpRHiH57KOGuyjEOYKR3hmzJC9HZiA/DS1AseMPM7vx0XILaIFtOTt6PdBr5LsXaTc6LL6RTyWCQ1CEsPGT0kzU4tu1p83NSZFrlZRMQfgSA2ZAOftq3uRUpA3ygdJwkxFQSQY6zPUyLPD3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781668021; c=relaxed/simple;
	bh=MlLmcMBEpf5VC/HPStHpAv6eNdh0B2xImW6HcxFKVZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSAfIs0OIUUDaBWgRyigsGeP79dq9RAfWmyWgAilR3N+K46+qFzTi9GsdzpQatcK46hBNfrQOkKA2LNq6ceInbbYWB9HJgWp4KPLegQ0ADeNWTyRqyKF2xXs7QCIdCCfgM03SFvBNgsBZGE2G6jhiEluOnvgTgE8bHHgcHEfGdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nGOeQ5oz; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nGOeQ5oz"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so407135a91.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 20:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781668019; x=1782272819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pK4PQ1902R80gheBMlvl0pQHw4MWAl4a6tgY9EExy9w=;
        b=nGOeQ5ozKMqgwTKS+VuZ6H8mJ67TnC6ajNByl+jFoaylGo9IHJwbzAhER3HKigDG5+
         a/QQlxzfpD+cGpmzuOzJ7LUqosaQo/PXTLpuUmySKzUbEZ9ke9xBmOFs4s3x+L+ZBvkD
         S1ByYnU1K+EdlNwDufopeih7p+5Gwq4UMnuBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781668019; x=1782272819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK4PQ1902R80gheBMlvl0pQHw4MWAl4a6tgY9EExy9w=;
        b=LRxaUZzBmZEGdf3E9/2+t/p9yp2DcnjEtOeIGl2k4VITH5n0U/+o35d5EGpbDXJLb8
         ox1yN4IDMQFuLXzlXQlWnGJ/EeNzI3FH6Dy3lJvVEcIVUtEVeeg1WaxOw+sas+zWVO0R
         ZEK05LQQStqYhy7iW7yNAsYjvjDqdQajuIH/YESomuv8oURclGq0RP5jSEm9BhCnXH8U
         r8CR6RNe1qhCPOCaBCkbCSkqwKQ7AdJZP9fRoWa/qDg0FeXd2CtioTBhO1NSvBz7XU6v
         alh4XnTJ9iPDZmc0hU0jrHh/vxvZ1NLNWIqVg/xdZc0ZD24NwL+zbLsNebaDewXl4PW7
         ThPw==
X-Forwarded-Encrypted: i=1; AFNElJ9xIvV1xo60p+MZEx4atD66I1w3IJ8anIUkMLYtfVOvjfbbvKdZ1EYcoat1IxSd3zid+4dl1inJhm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27mpLr1ybthBo9dsOAeTNLgy8JMPz8ymq/bz5fykAsBh9rISa
	786Ta8OMjOHrLq35DXPsZI0p2ejeH5llr7Cu7l1WBEWY5EKVXx+2Zbl4N0zsE5+Rog==
X-Gm-Gg: AfdE7cku3T39Kgk4t1xNNSnxKkghm6Wztcvf/pr9vahDXe1MsY2teF96S+4f1SrtQXQ
	18KyUiXIMbiVj0TP3ufcqBHUevWtxynCsAM21RJO5iLC3jZrbv4tF2xmHxoU4QwCFeWQtVTh/pe
	muYqhOutgJdN91cZtrPWqgXVm0PrPVRi0Rn8+VifRiN13B4xSCnDVEhnAw0LBTbT5pdUROK/8B/
	KRxxJTilokuzLzrSKFXIZwp1xMks+hB0nK+98Mj0mn4ZixYWdWz9IVQ1k1Mw2zJeaPGJw197pAI
	sjYvOMjJKVX4XkQLeAXZ3uOwKW3ksXTHCz44YMKN8nL8cVuwmdFjQJLjWE6sn0J5WGnPAAP+dte
	3qHc60xjY9icSCCC9xv3zJTddCc19LEJBmDIyHNxMelRgDbNsGX1D+c3KQ36lAqcsJJJ5Cwmzql
	k01WC8++6Fsi7rgb6XqICGv5DpH2vYtFOTZ31ePVFpzQqq54ZzuWQ=
X-Received: by 2002:a17:90b:350b:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-37ca6843e76mr1031173a91.1.1781668019333;
        Tue, 16 Jun 2026 20:46:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521cac5bsm4446256a91.5.2026.06.16.20.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 20:46:58 -0700 (PDT)
Date: Wed, 17 Jun 2026 12:46:53 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, Baoquan He <bhe@redhat.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Youngjun Park <youngjun.park@lge.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org, Brian Geffon <bgeffon@google.com>
Subject: Re: [PATCH 0/3] mm/zram: route block swap I/O through swap_ops
Message-ID: <ajIYFtADxQDq8q1P@google.com>
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <20260616123646.GB21024@lst.de>
 <CAJxJ_jhK+zkpjhs3YsQ9RoasKYh+E0NweQci0sPAEY1ne5LmBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJxJ_jhK+zkpjhs3YsQ9RoasKYh+E0NweQci0sPAEY1ne5LmBA@mail.gmail.com>

Cc-ing Brian

On (26/06/17 11:38), Jianyue Wu wrote:
> > I fear this is going entirely in the wrong direction.
> OK. I was trying to build on your swap_iocb / swap_ops rework
> for the zram swap path, but I take your point that compressed swap can
> be handled more nicely.
> 
> > Yes, we have to keep zram around as a legacy interface for now,
> > but the right place to deal with compressed swap is in the core.
> I agree compressed swap belongs in the core is better, so not only ram,
> but also the block layer can use it.
> 
> Before I rework or drop the RFC, could you outline how you see that
> core-side model working? In particular:
>   - How should a compressed backend like zram or future block device
>     plug into swap_iocb / swap_ops?
>   - What role do you expect zram to keep while the legacy block interface
>     remains: current block swap only, or something else?

Those are fantastic questions, thank you for asking them.
Can we elaborate on zram being a "legacy interface"?
