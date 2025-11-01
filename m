Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8225D1F5
	for <linux-doc@vger.kernel.org>; Sat,  1 Nov 2025 03:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761968521; cv=none; b=eUYISOrAXN2X2Cb8PAhshKTc4sKglkRfa7mO4csiyY23JAB6bPIVM/55eX8Wmjly+e8p0pwzNHnK5e14WLzLvC6sjPnEe1sHzETPQfNQA8NByxsrhQ7syqNk+OPbLP2FV/ekIAuE44QVlfkITlzp7x59OGpTS13KrhRQ/aNEkOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761968521; c=relaxed/simple;
	bh=9MbVMVWSVrLR86ei77JNmP1zRHJednoWwWBBG+aAt/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7mUI7QEcz7bjSzQ4RRLEZPeqz/ClF2DmwvY+4CFJWl3afLgtXCyleJHn44cS6Em0f+zlH7ermzRpEo0Ym/3LfdhNOVUTW59XYyIxQMHeydmB4a7yr/TA7xLfjqIVDgwmOUqiXRUdUtgX5cVOKyJl5avOtnz05K+dgH2lOo1+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTn6uPdd; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTn6uPdd"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33292adb180so3182312a91.3
        for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761968519; x=1762573319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6DxzGsF0ReGwbytjfaFauugox95ZUf7zrl7UO1KLmU=;
        b=JTn6uPddOWHiarHB0YBXxSWRUg0s2zZHrbLzX65apT8Vq4BeEr8RgTq23b9PyYiKIG
         gbL4/cgaxh3LD6LoUOi4/ti0XEBteqVSHGc5A7Xio45bQZrEVabUmaElStPjWnLNvNcb
         Sz2ZOgAyCcczhFc3ng7yHzHGGnN+3z7Jz3+XnzYNpYPNwWUq4oguujmrOeOnxK3IekYs
         3dAi7zrrsFK/IRKgnzHfu1UmhdeqRItL9kUKI5ajpy/1Nj0iVaVewNCgYbYBL+Ytd4/s
         Nlx1Wkg9eS2TVEwUcY/2G8/3MA3P/wgp0VlN6jnI1V9nj9p3EI1rDIVti8LM/MLMYH2s
         CB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761968519; x=1762573319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6DxzGsF0ReGwbytjfaFauugox95ZUf7zrl7UO1KLmU=;
        b=qwx0yNKt5I/5Kkss+w8ppjqyapUP+Hw5iTfCJ+kEtAA9hstAeo8wj9T9e1nOWI8KPe
         JaDENzxIzN4ud5xQt9S44IGeZcy9qwcH4TdvjoFnG+tN2GQWW2DY7rc7AyjLPrIu+Lg3
         xVajNHomjsBfz/eZvcQHwtIkWhb4NOdxXbjnafYuoPhRo3dfSQfhx48K66+FQNNFAsRn
         rrTZH0Ei/V9shAen3+AQhmOdPWp5Zh0hps1W1G885gkypI19FuHVo4yPwIDF5VlRD6Qy
         4dVo6UrxyUqojrD5o1EXCHjAcGKoFevf+/ZQ1bryoSQ3nZqYiuqiFCHTCRbLkixuH4+r
         CG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXqqtKJ63ocuOswDQ3loTBWPwODDazoygihmr9WxLUjuPS9Z6NLOwq6EOmf+FukKSOzCXMrPuRxkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDCDHCUYOCpDeXlOoOsJJ+mB1/dOt33b6KVnspa1gQa/yGYfSM
	SI3WfvBj6B7fRYVRnbu+pFspcSQwypazcMNJrcKL1jgba0XN7FFsp45A
X-Gm-Gg: ASbGncvDm8LqqZMhiZQOO6UNnX7FmiVGzgn1vXT8s3f7ujXXu8Fy/KXRaFjTl8RXOOs
	3XxI7r9Z0nlOQAq3sb82jEW/ahiusNAknSTvDhNIJwIUTL0McNe5EUMcyMKjMzr9GifmDRt9hMw
	9866wcyaKmrL1rFSocaUHzP/BXmhCe+BeD9gWyM10J65tRq73G7U88qDe6y4TJRUE09w8DAw4GR
	6BBE4rZK4JsMj3XZbZYJ7N0kpdsX7y1EccJ8YqCqAXM5WKZnfJvvK35dbeUoLLtr5iDgUZMNDPR
	r5gQ4bWzTIXcFYcpqAJRw9IAJTOU+jxzEHuK/yc/2fZ8D+aYAZ1w/0ExYYOOWR9KEBu/qsOUS6Z
	i934wBugw89rSM+cy6wIsAuItLNQfHbMDRHWKR1dz7vaxyqRE3lCD5nmlgQpBoFRpW9FVZNyzKJ
	lkQAo76+u8zPVbo5cdrrlxitNNrmdYQM8=
X-Google-Smtp-Source: AGHT+IFTKC+45FAGjBsfJbS2jWqy7zIBFJxN0wNU7A4TaUwJWYWu38/fpztwMnb4h9wTzf56Tf+jgw==
X-Received: by 2002:a17:90b:1d47:b0:31e:cc6b:320f with SMTP id 98e67ed59e1d1-34082fc4ebamr6861404a91.5.1761968519146;
        Fri, 31 Oct 2025 20:41:59 -0700 (PDT)
Received: from localhost.localdomain ([124.156.216.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340bae47beasm652975a91.3.2025.10.31.20.41.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Oct 2025 20:41:58 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: bagasdotme@gmail.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	alexs@kernel.org,
	arnd@arndb.de,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	david@redhat.com,
	dzm91@hust.edu.cn,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	rppt@kernel.org,
	si.yanteng@linux.dev,
	surenb@google.com,
	vbabka@suse.cz,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH] Documentation: treewide: Replace marc.info links with lore
Date: Sat,  1 Nov 2025 11:41:44 +0800
Message-ID: <20251101034145.31515-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251031043358.23709-1-bagasdotme@gmail.com>
References: <20251031043358.23709-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>


On Fri, 31 Oct 2025 11:33:56 +0700, Bagas Sanjaya wrote:
> In the past, people would link to third-party mailing list archives
> (like marc.info) for any kernel-related discussions. Now that there
> is lore archive under kernel.org infrastructure, replace these marc
> links
> 
> Note that the only remaining marc link is "Re: Memory mapping on Cirrus
> EP9315" [1] since that thread is not available at lore [2].
> 
> [1]: https://marc.info/?l=linux-arm-kernel&m=110061245502000&w=2
> [2]: https://lore.kernel.org/linux-arm-kernel/?q=b%3A%22Re%3A+Memory+mapping+on+Cirrus+EP9315%22
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

Thanks! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

>  Documentation/driver-api/usb/writing_musb_glue_layer.rst | 2 +-
>  Documentation/mm/active_mm.rst                           | 2 +-
>  Documentation/translations/zh_CN/mm/active_mm.rst        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/usb/writing_musb_glue_layer.rst b/Documentation/driver-api/usb/writing_musb_glue_layer.rst
> index 0bb96ecdf527b4..b748b9fb1965af 100644
> --- a/Documentation/driver-api/usb/writing_musb_glue_layer.rst
> +++ b/Documentation/driver-api/usb/writing_musb_glue_layer.rst
> @@ -709,7 +709,7 @@ Resources
>  
>  USB Home Page: https://www.usb.org
>  
> -linux-usb Mailing List Archives: https://marc.info/?l=linux-usb
> +linux-usb Mailing List Archives: https://lore.kernel.org/linux-usb
>  
>  USB On-the-Go Basics:
>  https://www.maximintegrated.com/app-notes/index.mvp/id/1822
> diff --git a/Documentation/mm/active_mm.rst b/Documentation/mm/active_mm.rst
> index d096fc091e2330..60d819d7d0435a 100644
> --- a/Documentation/mm/active_mm.rst
> +++ b/Documentation/mm/active_mm.rst
> @@ -92,4 +92,4 @@ helpers, which abstract this config option.
>   and register state is separate, the alpha PALcode joins the two, and you
>   need to switch both together).
>  
> - (From http://marc.info/?l=linux-kernel&m=93337278602211&w=2)
> + (From https://lore.kernel.org/lkml/Pine.LNX.4.10.9907301410280.752-100000@penguin.transmeta.com/)
> diff --git a/Documentation/translations/zh_CN/mm/active_mm.rst b/Documentation/translations/zh_CN/mm/active_mm.rst
> index b3352668c4c850..9496a0bb7d0705 100644
> --- a/Documentation/translations/zh_CN/mm/active_mm.rst
> +++ b/Documentation/translations/zh_CN/mm/active_mm.rst
> @@ -87,4 +87,4 @@ Active MM
>   最丑陋的之一--不像其他架构的MM和寄存器状态是分开的，alpha的PALcode将两者
>   连接起来，你需要同时切换两者）。
>  
> - (文档来源 http://marc.info/?l=linux-kernel&m=93337278602211&w=2)
> + (文档来源 https://lore.kernel.org/lkml/Pine.LNX.4.10.9907301410280.752-100000@penguin.transmeta.com/)
> 
> base-commit: e5e7ca66a7fc6b8073c30a048e1157b88d427980
