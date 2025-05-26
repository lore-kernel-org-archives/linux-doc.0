Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9B21F1315
	for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252527; cv=none; b=Qn4F8dJrywi5zdKnTtWYeBi20KV7l+z7+zsjByCOHaZGWkYchvYinO/sY+pZAIM1VEEDmm9Y/7UuCr3Vp43mJZgFnHRyPVuoaX0CYYmnjj2ApRbzYbXRIiE7hmp8aYAssKjyUiHHN0vWzbgHm01z6cGhkntUm9lE7kV+OJTBQLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252527; c=relaxed/simple;
	bh=27+HxxD+Nnzh7/t8b6hLfpxekNp9wQ15a2r2Zx2hs2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bW2uL8s4IIGkkwDQB2fxRwYOSZ4NVPC1iy9bx+9vXdb9mN6MWHqnDhaDe06xdBCQmmmkBdlJNnZcxq0dxpd85m4tQMs8ssKDch9o1FWwJscoyC0zMXDlgeD3TX+z0PVlt/m6GlxdMF5NyazDMQvnBs0tKraSn2H2FO3NhkkSTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=VwSakXoz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="VwSakXoz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0618746bso15691845e9.2
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 02:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1748252524; x=1748857324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27+HxxD+Nnzh7/t8b6hLfpxekNp9wQ15a2r2Zx2hs2E=;
        b=VwSakXozz/3SRJRYu7ybWRUpHuaVIpUyPaMMLFUzLddZLQcVlmmS2jTm9Uomb/61hh
         W4f5Kp4P9d/gig+/H6t/qBsfrUbiZTyX+MioCE8+B/gdw0QoU86SYs8ZgdQv1MoQtNNT
         57pCGXW7oLLs0wQGIWTgPs/JXxxiwTcgt8eyPh8pMFr6V2a3SyGrGlYggcNcxuK7oVrw
         diqdGM9Z7JELko9YskyJjYZufCMUUHb42T6oHUdi9oasXXZwUM/E4ajoHZHy4FqBVivv
         +8IRiuqCDVz81zZE33obk1+M/9TC385hcg/BQ+TqBbGFOql+FkRYBRZvEFnBI4hQqF6M
         PpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252524; x=1748857324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27+HxxD+Nnzh7/t8b6hLfpxekNp9wQ15a2r2Zx2hs2E=;
        b=SxtNV21GaAdK9OEYQF3VlxB0c2TabH3uJ8/v+qT8CxX4JnEZWCiMa+dXVbF4OtzoT0
         8wI6HEsHIP9M6JdBkvq3Cp2or9puiOzo41c4FoBsVH/GvSFesLQuoleZBaK/5NPP966h
         HV4oA1NfEFRxcoujhR1fgnjljKf0rqmmc1YEl7tRxemZ0apIov0AEmgeR+bPwTkEpumV
         gRnSEt/r/8jqQJfrQXG2Y1Y3Ew7tuAX4liVkjIUNE83BpMhmgXYvLCWiBcsdiFwDH2fm
         nsmVKzvkCprksKxGBxguc5xLcJVO8dXgUjmLQDusOd3W7tezVMxjdJ3SzP+PeLbKVFTc
         osjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYKpIDBlmyBs5SrXiuIQLnNbU0A85RTuJ+co0dBn7gSDbHQQepnRPLi3Zb4wx8zVKNaNXxNsbsRws=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkvDhvun+YgGMJiYVKOj10rtButsF4C3QQfVVz/aFlJ+ALhYOG
	6mHNDjSWuW0nYpZZJnY+2h1INyYIZPJbnEoyruez8DNHZOQY7qwDTXI3QmUDoCUG3bo=
X-Gm-Gg: ASbGncsrENGxSkzrzTsfMHecQmWGh1zkCgwkfELwlyosbjOc+123O1Pqdou++0AeXlL
	oGThX5c8TtcTRQ7+f7HK6D2PETN1LhnPDPrWj0BZ7lS/peJl7jqMNSjQIgpk+TwBm47trGnPsrP
	uSnzkG/o92GOuolGYe/c7u/jKliOiA8PkfB9ARWOImb27z+QHs4JKQCp0Xft64hSQNLk97HL3WE
	w4FjsRudXi3ksvJkc0Xjz4ymUXIVJCd9MyWkM1NgGNsSvWXPssZdRg4vSHZHTszJGF74bXxRj5F
	+hS9er1u82h6iE+CoiDygSEgP5fq5bmbmPoLvDhob8bKS+QK0Yu/TzanQoY/795rbJe0qSpAWpU
	v+AQ=
X-Google-Smtp-Source: AGHT+IGj/TCuJ1rymJwAmhwD9hEHb2YavTmDlg3uKm0ah5yuR6f/5Sm9EUvqo4UPAzGWQCJs2xZcoA==
X-Received: by 2002:a05:600c:3c84:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-44c9301660cmr86938965e9.2.1748252524118;
        Mon, 26 May 2025 02:42:04 -0700 (PDT)
Received: from jiri-mlt (37-48-1-197.nat.epc.tmcz.cz. [37.48.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29619sm242667995e9.7.2025.05.26.02.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:42:03 -0700 (PDT)
Date: Mon, 26 May 2025 11:42:01 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	aleksandr.loktionov@intel.com, corbet@lwn.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org, 
	linux-doc@vger.kernel.org, Milena Olech <milena.olech@intel.com>
Subject: Re: [PATCH net-next v4 1/3] dpll: add reference-sync netlink
 attribute
Message-ID: <pu6s2lvqaulyurarklqxumdtcd3tql7djhyun3ylgvyv3lmsf7@oun62hhb5hkk>
References: <20250523172650.1517164-1-arkadiusz.kubalewski@intel.com>
 <20250523172650.1517164-2-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523172650.1517164-2-arkadiusz.kubalewski@intel.com>

Fri, May 23, 2025 at 07:26:48PM +0200, arkadiusz.kubalewski@intel.com wrote:
>Add new netlink attribute to allow user space configuration of reference
>sync pin pairs, where both pins are used to provide one clock signal
>consisting of both: base frequency and sync signal.
>
>Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
>Reviewed-by: Milena Olech <milena.olech@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
