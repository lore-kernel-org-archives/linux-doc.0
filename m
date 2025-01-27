Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B766FC5
	for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737987008; cv=none; b=dLsmIEB9c20q7IS+8bU0iekEmAhOo+ZhrlcUm390a9MSqDwbLeDtEcsomzClQgttYk+qcLgdwEM+ollTjOiGZAR2MSkQYrt2iAxNpQK5Lvz5KSkyDUJo/PxnIWa+6b+bze2Du5ESHAr+8W9WxV8tTUPc3Mqctd4eg9GZF+G+VK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737987008; c=relaxed/simple;
	bh=KQRLfBaEDBa5jCtSAySQLmQF0Lj/tkM7lUCVd453Zkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tW/Jjwb4j4lzCTeDpc0UBsqShWERhfZ6flOo7GwH/J06Zj+/sojucDCOBpEEeA8mN5G6gLllpH9I4CMxd4CJ+caYkv+U9Av29JU6kJ6KTMeTYQnwE+XjIG3IbZ63JnLudaspeC694LiWAZv11eGZtPsnW0bHYgIXiET4Lis+ERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D3oKUK2r; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D3oKUK2r"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so46306365e9.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 06:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737987004; x=1738591804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tkD75Ts4CPh70YSx84KfjbKbYHVKyh5q/6VF+3rSAf8=;
        b=D3oKUK2rDm1K/OgyB2BKQvrSkEvIlVD8wof3zqAlJHVmyG92J/sDzPI3fCuEMpoXsU
         PPEUULTBGSkM3GK3yLp0tdOj2d/K1MdNJOka7GOdrKlD5xTdNgEyHDDt8bbLNU2BADfH
         GH+yrgoOX29CwCeEL1kYz9rmrvWv1AmjZ7NL57/If2L2qfapgEz0e9nOTZY2gUlc1tsP
         yqjFz3qFqXpr0PCmwWS+B9meWlhHOkSOmaZrUc7Gus96JfPTU2F3Re4thBKADbv104+0
         TNCiG0l7puEz6tWNur0n0M97bQxhJ3DwoEVI6RQSSqB9sci/yh5kDMvOUx406dYax4Bf
         /Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737987004; x=1738591804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkD75Ts4CPh70YSx84KfjbKbYHVKyh5q/6VF+3rSAf8=;
        b=qKOQgEyifoYE+XR90JeB0W+DEdhDfVl7bO1xgmepT1BUe8MQ/AMBr3rHtKjOaXyROf
         z8rXk2xLIf/BNa9mSQYuDvz/OZz+TBfV1pTP24N1XekJQiBtZe+iT/f8sRpKckkqlWTb
         1ob88HNiRQF5+DkhGRZZmS4pulbis+W18Sbuxne9t7nA5LU6xPeytrjdQIgyriXyeeJo
         9o/JAamWzNLmUSYsmxVSBihTQNYqeNEyUNURl9gj7GeZIgQa0oHrrNFwePOEwZXIC3Ew
         ydytA3lOfDCVDx4YrMK8NY8rUDTWgKn3ribgOLWSSoJIuWS3gQkDYoT0g3pMuDlTG7yP
         qTNg==
X-Forwarded-Encrypted: i=1; AJvYcCXHpjzO6foeIN7YsBAwfc09BfM/UnJkRLDzf6doGevZmzZpu11uBNWgLDbPn0za6d7zF8BxP00rt2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CK2DAXWEYYwGAv+5PRyNMFthP0BDiK8ya/X+aYEkf74FN1H+
	2GaaNSguPuxnJit8e4P5JfOwdLHjwKTR9UvAj23PLn4oBwjamwhNDh+Z3jwCJQ7cYVHaXnF9kMv
	l
X-Gm-Gg: ASbGnct69AgZV+ThLAVMi4DfduAW137YBQQYBcOJO/uR3rl4b4QkT/ExrhIsN6Dnk9D
	H598N6Mpatzovrr2vVVLu8jbJoCqxfn6wlh/LGTJcsLt+5me1wZBr9Yo6FZ/VzHDCk8H8eUdGfq
	HP9V2eaxQQJEI8GwLkiI3D0IqLVJPcB/JzpH3onERG0KeTmZgeMxYxXivHKeKuKV6R0/6Ueqczo
	jtkGKkjLZebwJzF2q/zDBGUNKq8LpXIKGfzwm+e6AW5U0ylqm5BmJ5mEc/evv4MPtxKAvQPoCCF
	/bx2CBk=
X-Google-Smtp-Source: AGHT+IGECP4URarMDrxhpRYgKkpXhOXF8KDgFDwNQc1Cm1K+dMcdFOzgVRq5fGtHk3WsEYeGYOMf5A==
X-Received: by 2002:a05:600c:524c:b0:432:7c08:d0ff with SMTP id 5b1f17b1804b1-4389143768fmr367657635e9.23.1737987004313;
        Mon, 27 Jan 2025 06:10:04 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3fedsm10949249f8f.85.2025.01.27.06.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 06:10:03 -0800 (PST)
Date: Mon, 27 Jan 2025 15:10:02 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Abel Wu <wuyun.abel@bytedance.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Yury Norov <yury.norov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bitao Hu <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] cgroup/rstat: Add run_delay accounting for cgroups
Message-ID: <3wqaz6jb74i2cdtvkv4isvhapiiqukyicuol76s66xwixlaz3c@qr6bva3wbxkx>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
 <20250125052521.19487-4-wuyun.abel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pp2a2dbhnvcuqeeg"
Content-Disposition: inline
In-Reply-To: <20250125052521.19487-4-wuyun.abel@bytedance.com>


--pp2a2dbhnvcuqeeg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] cgroup/rstat: Add run_delay accounting for cgroups
MIME-Version: 1.0

Hello.

On Sat, Jan 25, 2025 at 01:25:12PM +0800, Abel Wu <wuyun.abel@bytedance.com=
> wrote:
> The per-task and per-cpu accounting have already been tracked by
> t->sched_info.run_delay and rq->rq_sched_info.run_delay respectively.
> Extends this to also include cgroups.
>=20
> The PSI indicator, "some" of cpu.pressure, loses the insight into how
> severely that cgroup is stalled. Say 100 tasks or just 1 task that gets
> stalled at a certain point will show no difference in "some" pressure.
> IOW "some" is a flat value that not weighted by the severity (e.g. # of
> tasks).

IIUC below are three examples of when "some" tasks are waiting for CPU:

a)
  t1 |----|
  t2 |xx--|

b)
  t1 |----|
  t2 |x---|
  t3 |-x--|

c)
  t1 |----|
  t2 |xx--|
  t3 |xx--|

(- means runnable on CPU, x means runnable waiting on RQ)

Which pair from a), b), c) is indistinguishable via PSI? (Or can you
please add your illustrative example?)
And how do per-cgroup run_delay distinguishe those?


Thanks,
Michal

--pp2a2dbhnvcuqeeg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ5eTtwAKCRAt3Wney77B
SbcsAQCPV6LsTHPe6Ijw1sdNdZ2nksChYzapP7009NoaOGncxAD/SVqdXU2faOw1
BwrbEVQvfgmZAhRNkdzD9zYBlryolAA=
=sqDX
-----END PGP SIGNATURE-----

--pp2a2dbhnvcuqeeg--
