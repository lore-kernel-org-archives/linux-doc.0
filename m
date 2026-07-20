Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD27311C38
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561267; cv=none; b=akEpA0vZPVOMADz2hLxJzm3nsMxMpxCCGROB7xeA8RJqqmKndOy9N/awIGmGiJ29HQdkLNwZzk02ZHd5sXxIjDnjHREkVsDiuEWPHDGTno6QgDl2TKvKOubkbCEq9MUIMagFLum9uBRiuXw6lofN1NP9PS5NIfP6FuMl+5koHUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561267; c=relaxed/simple;
	bh=jYD4X/IrsAEK+5o07FPNmQBo3eSfFnC1skMmyy2L3Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swcfXtFqQWHfA3KlKrTOYgr5alew88Hbry0CEx7Bn7itY46OsxlGCoxAWe1m6y0P1/wUDdpfcZOm/05zSnSXPLetkihxEjLhPiO+cB1QSdgw/8CQBzzrNNCqji5xrL/J1R48feVzJkxZZWqBTFfhnOR8hJ0OE9UYx5y3K684ryQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8K5AavC; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8K5AavC"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4a451915d8aso4730588b6e.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784561265; x=1785166065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJk23rYw9MlC3iHPJIfHt0WgssN79WwPx4RPlijn9kg=;
        b=j8K5AavC6I44diIfapvexdoHkP4f/22kWNLAMc8yyyIfzfuG9t0q6G0KanA8ARxazx
         NLjGsjbar8Z31z8lSRMdULpUmr8b3zJPxauHKWpTmvSv2SAt9AGMhSh9Ylc3jlL6jGyf
         7oPuu35n0F3IETkWlzDIa6waFvFqgLP3d7o9sD9bhaO+OhwOgzlRcXKI5Zj3Ydzw7fwZ
         uAI7sS0/AwfY1N7QeYJYw5f8YhUHkEHDNt+uQGrJ8YftyfXwnYoGOU9qL96tKsXLQTCy
         2h3hYTwNhYu8rgtJrBVT4Ba8Wvaj5hYCpFpg5coNIMDCoIqtS9KuhsLoVdFmPrjzOGRH
         FsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561265; x=1785166065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJk23rYw9MlC3iHPJIfHt0WgssN79WwPx4RPlijn9kg=;
        b=LVgLkalsRBIFJTlRYSjFAoU5f6YvYiLa0QP7YKtF2iv/pv24rkG6az5+KEzbW8EvV+
         al5AzxlDlJH1Ifwy6SEgpt0u8siLo9j/vsx0Z8cqqilIIZ/lelcR107WauwR1VB1hvwR
         HqSWhLXrtQuSkbDvs3fQwCPuq6Mr7OWX99mBoj0r58zhMsnm1uKztvZ4XuYRButzKvkL
         53a4Se5YPCA3DyFWZVGvIxWU5NsO67Pv1r1DqGDj2KDjOqo+6nBPD3zc1+ziboxgHhsN
         rkY3S/xnTpNYUSlO0YWOPLxGE7WqIs+ww2OolsdkvX9vzUmh6IQhVFiQo8Cq61Y3veuF
         dADA==
X-Forwarded-Encrypted: i=1; AHgh+RpdjDNce6XS0ecTzBwqer/a5jn6tUfb70aWtsRrP3R8AzMv1d2yOxbRdcoDLGFIIH2gyCQ3s948jO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdds9c9B97lkfi5odDbDBqldUDeqJzHTT/UpKHtf2X6XmZGufj
	kSVlBDQJ0/hKxH+5owvu4qs60Y9qFhVgS/yoJ7ck1VUplaNsKQZLm7Mt
X-Gm-Gg: AfdE7cn9LdcDJtXZ6kGgxXzRpT/GtjPA4TdyHPYbQXbKV8fmeKNQ3fomvlDqjvJGWMG
	fx7VkcDNxTaGE+wbj3u/XnU2yHTawXgjSGdUozk32xV6/bgJAReUieQ6MnPJkTxSnJfnOAOiALy
	apvKnM7VfDsr8DFbiE+YjIPOKn/Axzqfg3CWQvCvvyS5x5GAv0PxD9IynDeXsHrmQzOdZnK81JZ
	5hFD5YqveMJU0woV5hYuu/JZ3KczcQidfMEPovnLfbhyEgOCpvrCMLOcULZpZYs7K4JDJGXOb5c
	KDsYhuEd8HRApwPOv4NxoHpfnhexAUQtg8ITgsnEFZVJ4yJ4qDtp0x40uNMVynfy4B3UKGqymXd
	KEGi9g4t9ykJgxyUyQvg421PCzxgtMNjeFhqPqu2G/XCUbKeCLwscC4Gdyqa1Lqcf+7I2vUHic0
	eceOrlomZCIAp4yNdYZMpbE8r4HJsSa6SI
X-Received: by 2002:a05:6808:180a:b0:495:f79d:8bd0 with SMTP id 5614622812f47-4a4d052058fmr8052656b6e.25.1784561265039;
        Mon, 20 Jul 2026 08:27:45 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:73::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3aade16sm7517236b6e.7.2026.07.20.08.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:27:42 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tao Cui <cui.tao@linux.dev>,
	cgroups@vger.kernel.org,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cuitao@kylinos.cn
Subject: Re: [PATCH] cgroup/cpu: document cpu.stat nice_usec and core_sched.force_idle_usec
Date: Mon, 20 Jul 2026 08:27:40 -0700
Message-ID: <20260720152741.1226695-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <al45RUAYKgGt5IYS@localhost.localdomain>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Mon, Jul 20, 2026 at 08:02:26AM -0700, Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> > I have to ask, which tree is this based on? I can't seem to find a single
> > tree that contains the "(including those in descendant cgroups)" section
> > anywhere. 
> 
> It is most likely linux-next which contains a nearby modification from
> [1] (or it was based on that regardless).

Hello Michal,

Thank you, I must have missed linux-next in my searching... that makes
a lot of sense! With that, Tao, please feel free to add my review tag:

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Thanks, have a great day!
Joshua

> HTH,
> Michal
> 
> [1] https://lore.kernel.org/lkml/20260629060636.200118-1-sunshaojie@kylinos.cn/
