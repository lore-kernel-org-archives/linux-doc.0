Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7121D1FC8;
	Sat, 18 Jul 2026 04:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784349633; cv=none; b=mGC2cq0n0c8XE1bRP3XgoKEJ2K3nPY38BaU5k3IQa/PU9TDKWPdk+qNMAQEMAvNOLG6/Wl6fxlY+hhEx3Sa47R06Z5hWgmzjkJdi6wT2OMpxAGOhyG5hB7BmQDygmw8ljzPmcf9kGlRDaC5Q1k3dWXVrxG2o5rjtfFE61ikPIXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784349633; c=relaxed/simple;
	bh=tLZnr12oGIUiGWaa2dqrNfwn1UkSZ10J6hXUanZajdk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZNSFLgJFFDnPUghSkUxz4OZdEv1F9ipzE2R9F4h6yV1Yy3Q5fogPlznP55mZF1g+gWms6w/AOQnWVqaxiDgDFIW0b0P2nStzaZOs5BoDPfjH2T1vKHmQU/Gz4PUPn7Hg+82mArp7X1Uro+lt29lFQZbgxt2nB3v368Q0oS4HxqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S3jQTGJ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S3jQTGJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3E81F000E9;
	Sat, 18 Jul 2026 04:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784349632;
	bh=7UwZwxfQIvF7dO45hR25SAXUiD5MyJStLQfF4eDcfik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=S3jQTGJ7zouDEB1NTgPIkXFpQ70d9aGhVnHD2ckK1/Wz+T44mndburaP7EQWzQLlm
	 SVFNIo+iUguCnmZtsmy35Xk85Ij7ASBe1remrOIyRX12uTKi7y1g2KD/hPpiNyIHBW
	 aUtG3twcnC1vl4+h4EY11swlOSYHdFLEMUmuc+Dg=
Date: Fri, 17 Jul 2026 21:40:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v2 0/2] mm/zswap: Fixes and improves the zswap global
 shrinker
Message-Id: <20260717214031.8b22e9a37ea3b0c564b466f0@linux-foundation.org>
In-Reply-To: <CAO9r8zOrXqsEaCEJUUAxbAhhN_OQb8ejogeUa6k8hX_JV8hxxw@mail.gmail.com>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
	<20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
	<CAO9r8zOrXqsEaCEJUUAxbAhhN_OQb8ejogeUa6k8hX_JV8hxxw@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 18:28:04 -0700 Yosry Ahmed <yosry@kernel.org> wrote:

> >
> > The [1/2] changelog lacks a description of how the flaw impacts users.
> > Please describe this fully and maintain that info within the
> > changelogging.  This info helps -stable maintainers and others
> > understand why we're proposing a backport and helps myself and others
> > with timing decisions.
> 
> The first line in the changelog should be sufficient imo: "Zswap
> writeback on hitting the pool limit is broken when memory cgroup is
> disabled"

"broken"?  Perhaps this means "fails to occur".

But what is the userspace-visible impact?  IOW, why are we proposing a
backport?

