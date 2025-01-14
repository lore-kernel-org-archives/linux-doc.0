Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77C512C7FD
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736867084; cv=none; b=B/K5r9xwlq62rOrLZQSwSdit8QXC8tYBJDz76MsiP5SsuNTm5MIGiifODNTIsm4yI8s9QRisMnLLRmKI/GJe6Y0av9TGGPXBzM+KtBtt9/n9WGLj2xVI+gsRwy59KyfZ8D/ZLT0R+FSZR2+mfTpS07qFOwEzGSslsPMZ0TBmZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736867084; c=relaxed/simple;
	bh=OzBgRFx4fTp6VNlvSBlUWiyBGdW0/IUTfAq6e9k2Cnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/6plDjgRhl5UGpP+yCJkV3tkbxu7TdYTqAdjbs3VT0/JDRf1MzM4If7q+lNgMNZrMc+sRRaSG0fr+R5hQaruvIXOx38R9ywYmF0yMBrvw3xo9nnAwfsDWL+ohzSK+W/n9nqPLUQmOpUWlrf7pHIZETPbGFAsWYyOvBrUR3JZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=QpirACUF; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QpirACUF"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa689a37dd4so1063822966b.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 07:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736867081; x=1737471881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JlzFzz9CnL3cnQzM4bidxHHVsjw7x7xEwR/iZezcWCU=;
        b=QpirACUFvLejNk0XvMp2vLnIzE75dgO7uFuJoAofl5VCscGTgpA72h+Mow+5He7j0+
         rP9j4pJ6CA+n/wvyqq9+EoZu2kpxY75WuWMHTKzWYqwDQx4j0oPQlAQqk8rkSFWRGPj4
         4jyh3JEj0ObfAjT9TQdZEKBkfCvBQkq4eBaow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736867081; x=1737471881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlzFzz9CnL3cnQzM4bidxHHVsjw7x7xEwR/iZezcWCU=;
        b=C0p80wyRO/GnMNLYfKDBCPeyDUU0c/0mcd2AqIStWsnanxRWOsGAOOukLB05idHI09
         hsl6ojmwfEuVlqszftBuBu0WTv8DxdWLt4IXaUNeVDhi+cJNNLuVWTumj5Q1lo0T1njQ
         kr2+x3ZiBpqN+xT6NeACG6UmJl3mOj7ModQNrGnUrZfRHBqBM1sPPXjliwlSh2v3Y10s
         HKYKX+eBnaj6swLpSbMCY78pelrAgHO9wnA+FEAoSFLYro46C3iQCSw7vWlWBHeQuaA8
         ONxHZ//wT+I+t1eiASU9K9YJRLh6xzz8LAsfdr596DwJODPhfwOPy8AHLbINs9SPn1fH
         wCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR2TeUBGRzb7DL4mCNaK/HDWBDuy8N7o1pG2aa+bEpUc6bExzng3gFtWNEUvJQ9R4HkjXZo0cUMnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxOOFi1edUxhOFdEyrHx1ZZdjLpXVXjRtaupoX8A6NR5H2i79Q
	tQcNpfjd0r2gduE13MrnW4RYzGqSsUH4nFDLqVgTFWlecqqs/luEwhRdroJhYBo=
X-Gm-Gg: ASbGncu18c0tzzKLHasYay+Myl1CseBCfSaKKCo+TcM2h/3ONsAg+Qu8V+FRlGWNiaf
	fx8dY59h1+jK4T078MFqYmDxS4pGcnyv2PcjNNy+cFIBxPO18MObHAJo2B67pfeR0PpJVMNC2OJ
	yWmAqERprUZnaYBrmKxMB+TTXrcXAnaxQSGqrl6B/tY3HuxV8tx3gy0XZbr98aE/3Oo05LbztY5
	XzEoAoDB4eOSctXvrsYYaKjhpQh1LbSfNLChzNjuRnwc6hWJwh32KOG4fY6yPx1S4zs
X-Google-Smtp-Source: AGHT+IH+UnsuMwr+XU0+iENq475M2f9Mz3g9fsBiqzqlUj2pYHNplby4nlIPDiPfP8/GQO+NFoPQDA==
X-Received: by 2002:a17:907:3f95:b0:aa6:8bb4:5030 with SMTP id a640c23a62f3a-ab2aad118aamr2488137166b.0.1736867079859;
        Tue, 14 Jan 2025 07:04:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c96468afsm646952566b.170.2025.01.14.07.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 07:04:38 -0800 (PST)
Date: Tue, 14 Jan 2025 16:04:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 4/4] doc/cgroup: Fix title underline length
Message-ID: <Z4Z9BENJm07M-mOO@phenom.ffwll.local>
References: <20250113092608.1349287-1-mripard@kernel.org>
 <20250113092608.1349287-4-mripard@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113092608.1349287-4-mripard@kernel.org>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Mon, Jan 13, 2025 at 10:26:08AM +0100, Maxime Ripard wrote:
> Commit
> 
> Commit b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting
> cgroup") introduced a new documentation file, with a shorter than
> expected underline. This results in a documentation build warning. Fix
> that underline length.
> 
> Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20250113154611.624256bf@canb.auug.org.au/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

On the three doc patches:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  Documentation/core-api/cgroup.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/cgroup.rst b/Documentation/core-api/cgroup.rst
> index 8696e9513f51..734ea21e1e17 100644
> --- a/Documentation/core-api/cgroup.rst
> +++ b/Documentation/core-api/cgroup.rst
> @@ -1,9 +1,9 @@
>  ==================
>  Cgroup Kernel APIs
>  ==================
>  
>  Device Memory Cgroup API (dmemcg)
> -=========================
> +=================================
>  .. kernel-doc:: kernel/cgroup/dmem.c
>     :export:
>  
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
