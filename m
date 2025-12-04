Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A5534A78D
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 18:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764873282; cv=none; b=BcJC4xb+PGr/dw4ciqjToteC0MQas+ZhAGa/HyYTFZmlRDHVGTaEj1YBGevTv7xQ1WdBjV6hg3PPkIoBu0Mw8A31eIZFu59up7isqrdL8HHCOnWT05thoeyC9AbsHv0FM0ONB15vicJefVrMO8UQ5jWSuv/QwBikd0+yyChiaZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764873282; c=relaxed/simple;
	bh=Sl3JdT2I+g4d9oYDPIjAcBnvIjn3v6IZnl/P01qHFbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjJLE2pUmiw2bGDzCAODPBqLeNgexjnptFrVOZQJ2W6dpA6NzSlkJ9uwl8iimDn3toCYsNRmbLMkNAVFy7hdTP6hXzxssJ/rguErwgs2OXZe8woVCnIiAcs/cYyeLWHJYV83TGXdZu3F/g54Ucb8tts+1vxd6+kjFF+mmeZZJxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=EQ0lGO+p; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="EQ0lGO+p"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee0ce50b95so21027751cf.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 10:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1764873279; x=1765478079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WKYmIZsWojJAjggwNZPXMCAVL5haYWj0+8meBT5PJDs=;
        b=EQ0lGO+p6PlDkX9bKMhCV2jsK7w9FZLUwOXoM8nJjurmhR/EcxRBTFZXzMPSAZcNPg
         QEpVWRVepaGLh8w7qjOkUcA/Fc7s3QWJYBCZmyh6qb2Y1vnVRtO2jfm7ZGXo11QH20jt
         BGINML54HgdKUuic3foBYeluB/jbNPUDsK0bLpeUoyEEH58UyQCEUiNncf5qJft6024A
         4ig0uM17uhZevq4QsMAjLFB0Rd9i5oG4aYELqtAnHmPTgBbA++9Oh87eSLTDDK5QT8Cq
         d/fDTyPgCaRYw1W6Dajvysq2WTGb7tHOfuGb3phP7mIZxf1mGe1ELbDtiNqHdv5dOUzE
         AWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764873279; x=1765478079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKYmIZsWojJAjggwNZPXMCAVL5haYWj0+8meBT5PJDs=;
        b=jsAQ9mp0qG1JjnhzDgs8LiYSgsiM5oPZ8cW4ei4YbnRmQmBK8BZFX3Hjj82b5AGqaa
         ssc+fiOFvU9NtrwbumCL8ueABhhh82VxVd990Vtsmb40VbTfl19v4DkQoG7DLTPFj/Dc
         W53hiuv5uz+aWh9qspku7azK6FZ/x1dP6Ecyqjeaa//2F4HblHoOBPsJzzR0cWecYW7h
         B+RTEpXB0BSOgCMFmunm5Ulpi1zlky6744m5NxHEyVcAm+RT/tXAH9y+DpIX4sN2HnSO
         Y8y99GpPY/Mz0XstikOgU2Wjssgwvg+5ZtviqwdHfA8o8Kj6/x5EggfWyR9MUe17bzeN
         lzug==
X-Forwarded-Encrypted: i=1; AJvYcCWKq8rj2IHZ2ZAeKlmRlx83vKwXOYiKoFQJwBqfyz6c2yBKVrZoRVjoW7s2yGv7rfsPwFkZoDiTXkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMUwEnibdN0TUIodP/gA/ZjHCyEQe7mBkmvHNc/X3y5rSDCdC
	49A7eeMf8KQtNYssGhrJpkYAM2uhNKDDJNxhPyCkcmhsMfjjvA5H2aPYf/hciovjtg4=
X-Gm-Gg: ASbGncs1kkuX6p2L2Lc6Yeek/L2Nfg70e59uURD4meDoYvHV7X2zIiQmt8u3RrPYsQP
	2LJ7CtkEcHTXZ4cE6OWoJD7nWkX/UD6dWLaHfl7x6m3hmhp1hrNYqR49BIKjP2JE/+7uuiOp0yR
	BOe55YOaLuE4DzBbWGPjubKLnLX089nYTWGLnMGBxxOwlIm96rmTrrvuRiPvgyLIoYfcqcEN/Fq
	AoQNy59NjYa44zZqAHX0RW9Ga9K1XiHI21zzBUkj/GHg8AobIhv+tXcvyr/3sDr6s1o6uAnRywP
	AdIFHi8itUIi3bDJRZmBTXoICxU8fwJdijNxzRc+PbLKzGD0+DY6/Zrn9kN+AQYePHy4WC7C44z
	r93+VglcWxjqKDy/H/5loWpZe/PNnaRKS5WXw/DOE7U+NR2644u45MGOHQ9T1Z11nGPe5RfLxvO
	3d1g2hEtT23A==
X-Google-Smtp-Source: AGHT+IHGgi2DcmU0+uMFC7b7WSn6eF6QiweV4Jq/1vc1s9yTnvYaa7EwMPS8bTLYiza1IljUAqQW3Q==
X-Received: by 2002:a05:622a:1b89:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4f023085cb0mr70058261cf.14.1764873278678;
        Thu, 04 Dec 2025 10:34:38 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:929a:4aff:fe16:c778])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f027d58edbsm12673751cf.34.2025.12.04.10.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:34:38 -0800 (PST)
Date: Thu, 4 Dec 2025 13:34:37 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, yuzhao@google.com,
	zhengqi.arch@bytedance.com, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, lujialin4@huawei.com,
	chenridong@huawei.com
Subject: Re: [RFC PATCH -next 2/2] mm/mglru: remove memcg lru
Message-ID: <20251204183437.GB481418@cmpxchg.org>
References: <20251204123124.1822965-1-chenridong@huaweicloud.com>
 <20251204123124.1822965-3-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204123124.1822965-3-chenridong@huaweicloud.com>

On Thu, Dec 04, 2025 at 12:31:24PM +0000, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
> Now that the previous patch has switched global reclaim to use
> mem_cgroup_iter, the specialized memcg LRU infrastructure is no longer
> needed. This patch removes all related code:
> 
> Signed-off-by: Chen Ridong <chenridong@huawei.com>

Looks good to me!

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

> ---
>  Documentation/mm/multigen_lru.rst |  30 ------
>  include/linux/mmzone.h            |  89 -----------------
>  mm/memcontrol-v1.c                |   6 --
>  mm/memcontrol.c                   |   4 -
>  mm/mm_init.c                      |   1 -
>  mm/vmscan.c                       | 153 +-----------------------------
>  6 files changed, 1 insertion(+), 282 deletions(-)
