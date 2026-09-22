Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8054A7CA
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091985; cv=none; b=gJK2wI9L+qvjB4mCPcc93EMdypZnijIVFTJpLz1GZGEVFYaNfYbYgXdHxQnh9Kqy3CsabNt0nspagtrGxtVM+zgDyy19YrtF9QsI6uZGtdoo1Qst0AHX1gYEXqahCQtl027K40S3D4hyd2fZyvnrgxeqd2udeUuN4Mbg4jQRKT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091985; c=relaxed/simple;
	bh=e/G+x8EZ1Ezei3fqyde5MtjxhZdcvZ09vtY+lp4RtkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfZ81YSpD4t0rp0JjaFk2udh704oyaytq7xLrtqCGuGC7WGTkfYXwX7XhwFgt5AZbnEb9QvIkSrVPes+TQEfpxrtMcuT3DP2L5iXk7RZxZjKA8n62uO9Sqv/Y0P4Wj9bB+jNcDMJi6g74wnh8pap/TpTDxjprwLrAxX4XOTT02k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=fWnluPAV; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="fWnluPAV"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43f9b119so1264527b3.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790091976; x=1790696776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/G+x8EZ1Ezei3fqyde5MtjxhZdcvZ09vtY+lp4RtkI=;
        b=fWnluPAV150JDAVRdWHGHXPZ1kEXrvrfEzQCYSe/UVNmni4cl19yNf0gZzLHTuvL08
         kBGRA2tsCSTxLE4f1fKgNK60wt9PW0yQ23OrSq40J86+UuGF03/1fCx2fKRNamCRgOXn
         XYlcaEEgKcDhCGJG+2hLB76ygbK1YXh+3oSYwoPEExEzMl9lk0JwxPWgNTKqYkb9UuIS
         Y/p6UuxeMWd4JOo8GoRz6VYTjFxQ+pJHRQaqfQJLP3RU0cCh4cC7/GhgLAc2ZzniT/Vr
         +lZxIbfgW7vrWab5DlmCwdobDU5fAR1DddDKUNJecRM4zGkRMMqON7Wt9v2TDqiFcLNW
         aB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091976; x=1790696776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/G+x8EZ1Ezei3fqyde5MtjxhZdcvZ09vtY+lp4RtkI=;
        b=KEm0uF8VZOoiWpjdGffnShqqGSIslp5OQ1TIBamoPbfXajE52uQl/+EQDpM05c0dNw
         0G/LvQyBQ6PAkzL7ErXMFUHmyd5zrlr9m8nkC+Gox/Fv+bdc9vnP8D1zlF2Lc4UjeMkV
         Qqmrwt1F0fZCwKxTzMmG62P222+qUWZNjMw0l1zTJQxR9WXZdaAgZ8BZV71s2zm4E5DQ
         nn3gCVw6jiNot9CbwsCiG8eoAM2UEPcUj7bBGZG1P2FEl8AzKl7eHjuTTgeeDhuc46BF
         lRUhT14XesAWAGzpP37AzKp3ybzQQL6zgo0UZyH3/wNr7zjpUWnnuH76xa6hQYinzvHX
         3q/A==
X-Forwarded-Encrypted: i=1; AKwUvByLKEFE0N1RxHuIe2f53bakpwb+opcsSZ5NUeSniTVEYbjQMPLXTgIHf3qFT6jDab472u1UpcKLbiU=@vger.kernel.org
X-Gm-Message-State: AFuF++lYA/7VW4cp832v/KfZs+5VqBZdl857Am9jUWAzHjxPc9E5N9IE
	TgXRbbJjGNscCTMRkoi/HxId2Krxe+KprRcsRf3nuQhrTYPOYq6Dd4suaAzVsWoFzJU=
X-Gm-Gg: AYBFou0uRbn6bGhFmoaegh0wgmJxWu1cGYiD05YB2WHqSD2A5A+Wg4EPBF97Nd1Ixgz
	5q51aRxQpN74x6VmeWNYK1DZdrmo8jFlb05DbAZzpOocSYytDrIWgiTFic/3vsr0nMhrep3y8bH
	EIgb7Dz6OSddWeMkizmqoVHGLmT5kGc0pxLS7soGIa3vS6TdTjKzr/DVh1X3brJAj/holoV2E0j
	cKwF7MjjJDu5EQPxcotcQJHGF84wsnRC4jFbuaTYUQjjaWT6zeKN9Z3BxIGFvHDMv6jvDs1sAI9
	rKqIaEpG4oGMIYhe+krIuvYXoGSJ7mSBJcGGgdPif8A+3oyrmulP6IWaYJnBM+dy7NdG6XoNvC/
	gLHabTmL+1avlAHw43OQL4j7GagWW0GBcoa9x3lQLyREIzKuYSH2XnE7eaEDwtwQ0uEn+k3SJdB
	s6zMVI87hsEPPLc90rAjqtUx2KVCjFa1gE4Bow2O/c+G5D8xKNy3F1cz6ZMwXe19fW0+by
X-Received: by 2002:a05:690c:4990:b0:871:cdc:eaa5 with SMTP id 00721157ae682-8973041de06mr56957107b3.1.1790091975385;
        Tue, 22 Sep 2026 08:46:15 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e693f69bsm8080941cf.2.2026.09.22.08.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:46:14 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:46:13 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chris Li <chrisl@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Rik van Riel <riel@surriel.com>, Gregory Price <gourry@gourry.net>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arKixeYuuUKye7bL@cmpxchg.org>
References: <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora>
 <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <arKRdaNEaKvFOtMg@linux.dev>
 <CACePvbX7aM45SE9H0hg1_uXBt1i4W7Pgk+d33Z2sG5bj8cHudA@mail.gmail.com>
 <arKZpJDpsavixjPx@cmpxchg.org>
 <CACePvbUmVLVk=w1sJinBfKVYoXcO57A163RrXv7C_QLzM4yQZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACePvbUmVLVk=w1sJinBfKVYoXcO57A163RrXv7C_QLzM4yQZQ@mail.gmail.com>

On Tue, Sep 22, 2026 at 05:30:44AM -1000, Chris Li wrote:
> In Chinese we have this saying: don't apply things to others that you
> wouldn't want applied to yourself. Do you want to participate in a
> technical meeting at 1 AM?

The only thing I would like less is having somebody else make that
decision for me.
