Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE7F46BA0
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714748089; cv=none; b=GULISdRWwjfQdXEqtUVmIGgN+Ei1TkGSxmY4GT3USXcFC2Y3zGIwO2l+9SpAeL6g88WQNouF12MkWMwOV0l2MaMMXSIUlf+G8wOCR+YfwW+i16Q42RFuqw2erkFFH44b7RhSKAw/KottiCqkmAEQ6t1Fvy2OXrGAxr0p8qSwi8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714748089; c=relaxed/simple;
	bh=v8kH573V3nLbemGi4DJG1xZ2+1X080JwmMxd/o2exl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEzRZu50kQBnTZ3iq1BvbRoRehSvVQTBFRQb4ImfshtblDdSQ7XwEqt9ecMl6+6HZkdbKrQ9umatrwTwUbII15E3tyBLOBkUvQNKLJqmtJ9Jy7Pe9mmKNI1uOeoOo5hrpplwVu8aPsGJVQd7Weridv0yb8vjeVz0ZSkNet6joI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=EEwiSmqj; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="EEwiSmqj"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78f056f928eso677912085a.0
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 07:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1714748085; x=1715352885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OgnwKfJB3kJ01AY0EqJ3oTDVPySeG9MAN3LYuEwZg9o=;
        b=EEwiSmqjvyH5JN2HY4xW0QKQOg+lpi1pQvJgTLsC87Y+HFMnsNh7FgPPC7eJg9qeh3
         AMQPv2ya26IUuKrfVZ2J1Xn6UPovwODBeUFEvY1xmndCtlLOM6wASzBoAOYE3xaoi0Qs
         B0y6L9WwMkf7gzlSKrf9KsMAc3N/jlokt7G3utma1AbkSDvna1mVTF4T1cO/idwv8sDz
         BSXLF3zGHdFovluYeCibhLrIrbuyuZQFPtF3vgmk4IT/Qxc6OfmDGmHicEsWhhgGI7qJ
         mKASZKT1aFmJ1opiLtTPCeCC5qUCthpJJVZmQkhS/uoHz3v/Cvf9L1u0Tx2CIA5Q40La
         bUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714748085; x=1715352885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgnwKfJB3kJ01AY0EqJ3oTDVPySeG9MAN3LYuEwZg9o=;
        b=i28rC5m3AdSyWxaMKMInYy+/HmXnbJmouHE3ctc8npr7hvhtQiA0VOu7fpYfZyS2x7
         k9jKfSAfN/l1DKpyzOONfV/5Zv3oJxl7erNRTCe6kGiV54pS515dOgertP3fxjDsyjHu
         JPqaQGddixf6/KDka8NiojRhWEH925JXrNnygLD2UCGe+GsmVhDJOozhDypXfKP+iYRg
         J1pX78macwob8ZrEts0YOv0DEFybg3h1K4bvZa3l/yOm39Y+mZX9PmSmeGgiucBJUinn
         yAifkGw/3ZkaCfoMRRZktwiO1w5LOM8IXY04JdARjksPmNW9Ud/X+mQKbW8VFAlQJMcc
         4tmw==
X-Forwarded-Encrypted: i=1; AJvYcCWFV0I/rzVV++JIR1jI+m2tjeqtNwTU+5/rGJVQE/6wUNxnbgbCjOUyeSFi7nXKy+ciZUx19Q1AHd753Oidb/XaHz6Vp6StuRpy
X-Gm-Message-State: AOJu0YyaqVf0LWOL4ud1SWRKOqr8Yv65xEWkVa1KkGQHXjjlgp0CI2hc
	8h1hJ7JBzJgwqYO+UokROzVaDgemM8DJX6F5BLZjFZ+un89smk+grYAbxEgUXMU=
X-Google-Smtp-Source: AGHT+IEtOZyEr24VbO8xFLGbBcJxGsTi5hvCM74iUWTfb4RSHWb9Vplkpo+dXXpzeArp6XXpPQ0+mQ==
X-Received: by 2002:a05:620a:3b8a:b0:78d:61a4:6955 with SMTP id ye10-20020a05620a3b8a00b0078d61a46955mr2685812qkn.67.1714748085468;
        Fri, 03 May 2024 07:54:45 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id p18-20020a05620a22f200b0078edc0a447dsm1297062qki.68.2024.05.03.07.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:54:44 -0700 (PDT)
Date: Fri, 3 May 2024 10:54:44 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: tj@kernel.org, lizefan.x@bytedance.com, nphamcs@gmail.com,
	corbet@lwn.net, linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2 1/1] cgroup: Add documentation for missing zswap
 memory.stat
Message-ID: <20240503145444.GC2538005@cmpxchg.org>
References: <20240502185307.3942173-1-usamaarif642@gmail.com>
 <20240502185307.3942173-2-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502185307.3942173-2-usamaarif642@gmail.com>

On Thu, May 02, 2024 at 07:50:24PM +0100, Usama Arif wrote:
> This includes zswpin, zswpout and zswpwb.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
