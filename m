Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5130D40A
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124053; cv=none; b=AmVcrjGCCzkjPZoE84pbr8UHPIVaxaaDhX4LErLnwENDiP3MYDTvz7PmhKLhvsEOyLurHKDKcPqmOXHOXmpfOu2b4O5jWlqaufKEgRqHrxyuWLMGGB3HgmUjLSvgomqHJvBcouAhHPPOQ1ploUYDalzoOQAa68YNxJjivMclNPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124053; c=relaxed/simple;
	bh=NqH9gBKIbRjL89vi05p9Hog3cwkQA8VspLKF8/hJCJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a934NSCzct+5V98ghr0dIAk7lQxA8PwJylFvOsUL8UixJy/jEVp1Rk2t/Uw9vtWW8gkJITE1/oivy1lBM8PKyAfIAmFtGK17zjZz/K0RzwCGDWg/g+YGqlSAqSy3sm3DKUOfsN7pVwjzn8yzWeU05yuuETTHypIW56jq5937CNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=Xym1z0s0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="Xym1z0s0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-476a130c138so2138914f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1784124049; x=1784728849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NqH9gBKIbRjL89vi05p9Hog3cwkQA8VspLKF8/hJCJs=;
        b=Xym1z0s0Jh+PX4N4RpM4yBobkKyRMv64wzXs1I/S+gRp60tF0vzqW+zA4mmp4OYers
         C+xWFsqifK25kHte28e3mtlr6PSUmmnjpqqR+fVg5pVdKp5TpsndYm6oty6J7TLcLno+
         2YXmMC2p0sm7HdttzcnwpLfxa9G7dQLChOV7oo39dns2Sd3WEyDJnOy5yvuQTWrrHK+a
         Fyt2Sgtu+ByiyTEzCCXcPbqUj6iiVWlcEZRFwLUQGZmIMCBdhyUURXA/nCO1JRlcRPdc
         RZGphOjj1/+hRBrRAJ/gZzoNdFH1257PW51bSpaf5fJTHdItzSlGXUQl6mpK2TezAECR
         4uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124049; x=1784728849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqH9gBKIbRjL89vi05p9Hog3cwkQA8VspLKF8/hJCJs=;
        b=WkAAeEf48mHtZR+Hlo7Rzj29pPbn0xj4ow/f0mCkGFx89vra8CLQwVH/m+jQORFPZk
         Nxj/dO+TRrcGu5WLhzwa3zSn3vBBzUU30S9W61RQZe/E3uHs12YLNaW+AQx2oByboSXA
         mQSuukwaVZjxrDg3Dxi1vyKmwt9npVKMQx/iaxtnXKgtnzPswLnZ9KTtcFx8TPMXb/md
         I3hWiKg+gTjQIU4PDC+X23mYvsYglX6FyDLYgqsvlsjobWnv4uPFkLkc3K0rYIBJYJ/h
         Z1RUAX6un4rm65jZgfP08ujiDBZqCdjaHzZfkbX/1bkXcs8IRutFENYz73iYJe4ppY1V
         Qc7w==
X-Forwarded-Encrypted: i=1; AHgh+RomTPEXtcSiTk91l0LaD+HKHT+yMcSBB95pNhvzATr/mJIH0HWpiv9AiGmUHCE3rk5Nph4GEv744OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkdBohloz6rR5xGl8FR3hcLQdh02VC9Zm68D699rkIqwfcgCHk
	2YG0ODaecvENZvLhEAhE2EhGUDVX47/E8GljS8vyyVfV74ivEDS7Vi70jsxrfVwBbc4=
X-Gm-Gg: AfdE7cnAa7Qqnfc8OnYCrHUZ4uLJsnY1m9gh1N+bjKiG2hrrdY/bnwpZGAO7N2/j9Xf
	44s2wW91RfL9HRqi6k67Q+98kwvADgwudcXwrsdRuU8L4eOGrW1+uyeKENFPe+m4loxT7eRlrnG
	LzONwooOvzfI5NfcC9kJf9FY1avq1L7sjYtDlqA9lX2TpciDRqQeKnJO187IyH7Ul2wUdQyCKBM
	icE2hgTY3mrhnjJSHE2cpqDP7wAwjvurYOGYf+RdhltQV42fkStlDkHef2TrZ7QOmCVqdq+g+hV
	xIOxTQRKR9JvUPSELMW9qLZWsd+l3ZG+ubf1Nka/BugjjPPT7CAjB4Sfp1gL7/Iu+pITdhC0Ijk
	SxOwZ7u1uOKmz7TPh5Blov+bTQ14NY00vBLGi1t/dhOECvAEzLxB5/McOI3w7iIzdbNSC7ytA9H
	bDT0RE2cTLf8LDhA==
X-Received: by 2002:a5d:64eb:0:b0:472:d154:facf with SMTP id ffacd0b85a97d-47f2dd2bd5fmr22313384f8f.42.1784124048779;
        Wed, 15 Jul 2026 07:00:48 -0700 (PDT)
Received: from localhost ([2a02:8071:8280:d6e0:1353:8eb8:c84a:b6d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm17535061f8f.22.2026.07.15.07.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:00:48 -0700 (PDT)
Date: Wed, 15 Jul 2026 16:00:46 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zicheng Wang <wangzicheng@honor.com>
Cc: akpm@linux-foundation.org, yuanchu@google.com, tj@kernel.org,
	mkoutny@suse.com, corbet@lwn.net, kasong@tencent.com,
	qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org,
	axelrasmussen@google.com, weixugc@google.com, david@kernel.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	roman.gushchin@linux.dev, muchun.song@linux.dev,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	willy@infradead.org, denghaojie@honor.com, baoquan.he@linux.dev,
	kaleshsingh@google.com, tjmercier@google.com, tao.wangtao@honor.com,
	zhangji1@honor.com, wangzhen5@honor.com
Subject: Re: [RFC v2 0/3] mm/mglru: proactive aging via memory.aging
Message-ID: <20260715140046.GO276793@cmpxchg.org>
References: <20260714121529.2237261-1-wangzicheng@honor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714121529.2237261-1-wangzicheng@honor.com>

On Tue, Jul 14, 2026 at 08:15:26PM +0800, Zicheng Wang wrote:
> MGLRU inverts the reclaim order when anonymous memory is faulted in
> bulk: anonymous pages sit in the young generations while file pages
> sit in the oldest two, so reclaim evicts hot file pages before cold
> anonymous pages.

An aging inversion in the reclaim algorithm seems like an exceedingly
poor justification for a userspace interface to work around them.
