Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298738DD8
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 03:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761622283; cv=none; b=srGetvoesRpSe6k774hyfab4KOxJit8T/jaydXgeVuiJmASF5TXZjVUMeJJja9PT65YKHVgHrbtGjqzDlQDwAz3rh3iQSdhelzQz+22CtVU+F2lx2hP/xWxQxlsLFTefj2mzW0FLTZ/WGrVYZDfhnqvqDsXSrsuV0/2Gh9Sx11o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761622283; c=relaxed/simple;
	bh=/WJvY11yZe5DNuh0SmLl84KhyrfL2n7Y6FVCkvFsiMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Njll4cR5Ue49qXwGWEx2qL1Y//HJx3kEqjjn19hi/Y3ChNMdsy8ULIP/RbEo6Th1iA1kRiOOuJIfpYo7pqoyqG2dZpH+23bG0kq8JbWufIXgVywztJXO2+JiYwlFWhKPvd+BDt7vGB3mLipKdNPW2m8iGisEedLI7xkt34zOfeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mr0pPjTK; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mr0pPjTK"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso3733521a12.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 20:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761622281; x=1762227081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WJvY11yZe5DNuh0SmLl84KhyrfL2n7Y6FVCkvFsiMg=;
        b=mr0pPjTKpqmKglIs4NbjktC22qUtAQDnv5F7niBoXR9XL6cq0j8BGWDf1xYaQ4GzNp
         ZqMtTTTmHGkW8/iZTQR2hgm67vDtkBS9v//LIu7KXOPI1zV+hB8mEHSdopPUyvAcVWZo
         M/lxNmOSp4JvdjK/7ouP+R64DZCKANW/dXJI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761622281; x=1762227081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WJvY11yZe5DNuh0SmLl84KhyrfL2n7Y6FVCkvFsiMg=;
        b=rKCnq52hb4vGTjg6Ri//b5OFzFaBTKBFtC6179FZEBz/1qHqOD+GRj2sOmBgDc6g4o
         k7SUNWePd8dLUfsTBwM3ebu0eFrSJkVQD/Dx87wlauuw3GljE7cPqwu/cDQMfkYqzPLT
         FkUiUAr1wGXAkUjqr9WSZMh+Be4hTXIJSKweitq7LPsMOTr8YuJoKhVAb7rjt0VFlpNj
         BDnSACpQnM+4t5lzyNiWNiYjpH9EoI0MjpgMj0h0s1wAJHQ/olzkFGj7OqmSAJGNt+l1
         mj4KwZi94xt1rr72KMz0DjE16ByoOEQmSqb3Swc6N0Iol54c1T1dyde2inGrKajBN4XI
         xVYA==
X-Forwarded-Encrypted: i=1; AJvYcCXt17vPvk0UthwAuAe5YgEmZqjzyBRukspSWe0iQSHnF9Fsto7arLNseFelOKj4hRNWrbQQygyrj98=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BGCokqA+Ix+qSrMmXi70EHzKPZVC+Wsozo8d/69onSMAueuI
	VUYk0758tFkWFkc4iCni4h2uDHIgQM2NfheJw1US9zUS9i7dC9NhI0Z/N5A4W9MHMw==
X-Gm-Gg: ASbGncvcUWpF/Smowqv7oAfoR73TDMnMww8IJimEptB/mu2WBzH77yLrTd7IdL/XrBr
	X1E3lUPTmujehsF5+tIBehDJBzKmCJBaMnr0iHhsNFXRLPAp3kiF0yV8Q+Z9wCVqgPrsGNyaeCB
	xw9XLYLMwc2UNrAo0sevpjOcYv/DgQd60F/G5hCKf2WvBHdzTMz4aeE2T5iE8bMQ/kGzeTDmx04
	1ZUexSjcQAwTjT8er2hZMVQwRMjNOPAKxkW/6BOqtrtdayU7FaqnpK+JsOTvB6BVKFo1zfgOFgp
	7FIYTRENNqNekHdvLYgtN8NblyuC6jhb9CvdFFMSHfcIhhHscZgn/cnkYiJr26Q2xBZlUu4GsUU
	C4TMUwEDITPcWRaqfhx1hf6lHQvEwoBzJvohtOqkqA+rsq3Q9YLrk35caH5wV594GWiTn9jYYLG
	qz2vuW
X-Google-Smtp-Source: AGHT+IG4vfR0LE0WG8LCYJmEN31gkl7hCsYmhmgxpsNHn1XBOsYb/cbkA/Iv5cZPqQ3IQLRXV2PyoQ==
X-Received: by 2002:a17:902:dacd:b0:290:af0e:1183 with SMTP id d9443c01a7336-294cb6746c8mr22090685ad.51.1761622280960;
        Mon, 27 Oct 2025 20:31:20 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:2c65:61c5:8aa8:4b47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a53sm100342125ad.6.2025.10.27.20.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 20:31:20 -0700 (PDT)
Date: Tue, 28 Oct 2025 12:31:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: jinji zhong <jinji.z.zhong@gmail.com>, minchan@kernel.org, 
	senozhatsky@chromium.org, philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	christoph.boehmwalder@linbit.com, corbet@lwn.net, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, axboe@kernel.dk, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, akpm@linux-foundation.org, terrelln@fb.com, dsterba@suse.com, 
	muchun.song@linux.dev, linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com, 
	linux-doc@vger.kernel.org, cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org, zhongjinji@honor.com, liulu.liu@honor.com, feng.han@honor.com, 
	YoungJun Park <youngjun.park@lge.com>
Subject: Re: [RFC PATCH 0/3] Introduce per-cgroup compression priority
Message-ID: <4tqwviq3dmz2536eahhxxw6nj24tbg5am57yybgmmwcf4vtwdn@s7f4n2yfszbe>
References: <cover.1761439133.git.jinji.z.zhong@gmail.com>
 <CAKEwX=MqsyWki+DfzePb3SwXWTZ_2tcDV-ONBQu62=otnBXCiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=MqsyWki+DfzePb3SwXWTZ_2tcDV-ONBQu62=otnBXCiQ@mail.gmail.com>

On (25/10/27 15:46), Nhat Pham wrote:
> Another alternative is to make this zram-internal, i.e add knobs to
> zram sysfs, or extend the recomp parameter. I'll defer to zram
> maintainers and users to comment on this :)

I think this cannot be purely zram-internal, we'd need some "hint"
from upper layers which process/cgroup each particular page belongs
to and what's its priority.
