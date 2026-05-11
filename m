Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D16337DEB7
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 19:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529196; cv=pass; b=D+SoyH/VGuI8zmh794igg8klwCSnXyy2fFXT+cszFcTWuiRk/0CIJcTbrh9if0wkkXT31w9NpdwOp4k5E9YkbCd9JXIKjiT4UDuaVxQ/1aRYmZYZcTzogo4HMQT9rRjieXZJN1SUTZuXaTgUGdZAICbQfXtyM+1SM951coE4ejs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529196; c=relaxed/simple;
	bh=ZP7FByjj/MPynW/2rM7ALpiB4VnbDXXIxz16fcl4k6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkP8UWeUx5sN4rsNRusO0JaYGXCc+/UdTcsszfEYsCJ4lVL3BEfHXyMCM1RHfqDjGhhRqvBDpuUy6+DgCzhHCL3SZefQdovmw0js7nrxS41GKK66LTB/9NEoNFoID7HVJBSGulJYC/H46HcO1KF0xT6L/adam69oOgArqDS6HIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD4TJV8f; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VD4TJV8f"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44e1860558fso3086776f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 12:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778529194; cv=none;
        d=google.com; s=arc-20240605;
        b=lMA82XlgjjJzXGxZfLH5y5AJUfaUQZQO8t3j2aYqsFo5hdYVXbkYYUhkYNd1rrIt2k
         XVkquIiSxCUhTfHxmbbnVt/ZgJfyQ23PU74L1r3gWSTUflUlCMBQBweHe2KmFKm5pYCK
         vAttAua6p97tnk0seGlrOMhAMpBHb6G4U35AClekW9bef7r+tstXj6KFGan+KLnuM7/R
         pI7zkHikfV1gs3FepIxWdiqH7g4P2s4qPXBNbgQdWbdjU1jawjq+VSsNi5+/gRAvrO3h
         tDpBSLpvtkORn2H5ddiVYUGlBSN2A8s63StWTYD21Cc/cFeLrypT6NLcF8gg/NSI/VIJ
         jaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZP7FByjj/MPynW/2rM7ALpiB4VnbDXXIxz16fcl4k6A=;
        fh=8q2iyu1gLNn58C9XinuwfvzDBZTJzuFWmm+TPd/KJ0Y=;
        b=MhQXBZ9hbVuFdinuwHdFPpySvzRj37v12jhh+7f//ttzyFGl3cVBn5+nRmoGyHH1+1
         68BA5Ypq5riJHszjWjKBzFwBcMr9gPqfY8F/p1aOWGuLpZwXxj0uZC31v6lK7uXreebB
         4J5oF4y4WKnawer5hqLKhBTPD+PH5Futw/dwOhm1jPHEZGPUEpfI0he8Z0nRDOVidQpd
         dHkBagxBHW/QsgMeE3G1HROZNrwO9gOpxch/BlkskgWW01inofwAl2KYtOPt/xx9PbCs
         9BT1ROUPCCFrcFGjxuIj/zAPn7/s60e4Xxa/4UKVZY/KPBITM1iBxC7hfeINZ4Veq0qN
         z9jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778529194; x=1779133994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP7FByjj/MPynW/2rM7ALpiB4VnbDXXIxz16fcl4k6A=;
        b=VD4TJV8fHvDHAiNK3DcfIjLsbvDoasNFsLe4HGrZiThE8nYkoTxUUUJYPTCIW4V5b1
         aRFk2S8etFHeaxdz2Ulym1JRC9sP7s3nspGPfM4sAK/q3XqdCjk8WXNrjhT3RKj3w6PV
         +yfqjOhrx+bIWsburYF8nzV3wjpjVZWpvT9SvS4fmIFmNqVD4VFcnJyGYU3ENzzdDEr7
         68/GJ/ccmh+6HT6VgYqgNMizS2z0Cto8Z2uOtfvtPJ4RnRx/dpn959ExoaiaNGPi6cGR
         vmXFXoPxAKowgglBKMIeJlrfmY38MqcFdQtJ5+sMicQJHIBF8AZSyux+eYjfib0FliR+
         OLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778529194; x=1779133994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZP7FByjj/MPynW/2rM7ALpiB4VnbDXXIxz16fcl4k6A=;
        b=X69bq8ZGdeN6eS7k53pXrTCs4yHNGRmJTHhCBLC9pJ08r7zkekN1KNHv5QF19EdZo4
         a5358FuVm2ustxGn72ZlSotaOc/sItuVUumkrzU8e2j/jF9zTYk4QD8ng4wWTEZydts/
         4A1uaLFpXw6qTBH+dvzomPPtGuV7R7l2AMVVAZCDkNPB6Kd467XlCf4KDDbPmPGtHv8B
         pOoRBQb2p3fbeJfmBcndDLBO3q/K1MFtYnCe8hIt7+idgrT0+f+XSZETSr/JQ3x1/toJ
         jj6WC7Dvzx7NILql04fY9uK4K1wP/KxWTb/yG+XuNurhYo8ArnNFk2gsxWhpCdD2VwZt
         N1kw==
X-Forwarded-Encrypted: i=1; AFNElJ8TFCOlSvgEeAnJ52ei/9Kra0p8uzC1OMQFUK3T9V/zncRsrEQ67Ejm3nU5vKASN3dXXiK24xvv/mA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBLK/KxBm0lQvaPGuX78TQYvnKou1/93+svXq4ZGJWH9L8SJ25
	WPmgyMs3s3idddMQgigyP4166ZUVYOkVLNnDSrxuPeLR4jBSsnfSQAZLdWqu4ESd+dE0cmb2a2a
	mi1z0IWIDeG+DippCMHLm4/f+1SNhKgI=
X-Gm-Gg: Acq92OFf+7gy/YtdGsK/1vtRKaaj3kRP6P/yQxRx8DEEhbVLRqplP1OzRLEJbHg6X77
	TTJDmuYdo6G751o/Oq9oeMBiJTevsY8H4QGJMbHmZtxzXjAes4wc40y7AxOJMsv8/F5jfp34RWq
	a6fp/d7zkop48X+GFFoM63BzQmEQaU2xMG0HYkXvsLE9JqGQyEjPYTlRelhUPEtlY4tVDk9JYRz
	1PxZU/yKDyILLUoVnm1m3RkJbZfpVHuYsRKVNpf9gQUlQy/dpi/1DQt5THcJLe94naoR39cof4W
	5G+Q68TgiWaRJWee6kc6DHPaHypr+mNxv9zzVBY=
X-Received: by 2002:a05:6000:1e46:b0:454:a41f:d082 with SMTP id
 ffacd0b85a97d-454a41fd125mr15238153f8f.3.1778529193707; Mon, 11 May 2026
 12:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
In-Reply-To: <20260511105149.75584-1-jiahao.kernel@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 11 May 2026 12:53:01 -0700
X-Gm-Features: AVHnY4IvNhdPdYI_KTABXX79UzLYn38l9ZW-nKKsalLOW5HyYORSIzprVHs4vdU
Message-ID: <CAKEwX=NqOzcbSyuipFvpPUrBQuB0mLBjoboM=LrijkZAfyamxg@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/zswap: Implement per-cgroup proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 3:52=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> Zswap currently writes back pages to backing swap devices reactively,
> triggered either by memory pressure via the shrinker or by the pool
> reaching its size limit. However, this reactive approach makes writeback
> timing indeterminate and can disrupt latency-sensitive workloads when
> eviction happens to coincide with a critical execution window.

You can make the same argument about ordinary memory reclaim :) That's
why we have kswapd (asynchronous reclaim ahead of time) and proactive
reclaim solutions (memory.reclaim), which would all target zswap as
well.

>
> Furthermore, in certain scenarios, it is desirable to trigger writeback
> in advance to free up memory. For example, users may want to prepare for
> an upcoming memory-intensive workload by flushing cold memory to the
> backing storage when the system is relatively idle.

Would memory.reclaim not work here? Why are we treating zswap memory
footprint as special here, and spare file and anon?
