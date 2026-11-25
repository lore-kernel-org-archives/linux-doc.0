Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616068;
	b=yordi5SiRj1sGQUxPrYakfK7olYFbp3P6y4dkgXYVMZzq3+8GpGCUF/ViXObG15XaVAX
	 fPah+HQffzurLD/f783gIE72E+SkpyA6pojt7bn5CcXmnkTEdfZ09khIKk0BvREGI0zoY
	 hDACAxQSjm4so+PIm0SYjksBUjeWHBMvASWLbE303By2D+SLGd7bruy3/4CNDvOrAlZvW
	 JPX5gFTy2yIMty1845W4XUCCVJi9A291W2W7WffI0wadBT0uOMBbi5uN/UmQB9BZL6hxB
	 jJTxkjhV1FD/Bl3kiZghRneZ3KQQ7E2UDvtD6v6V7IU7hlYrFlWYMzyNSliZYAC1p4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=I2DpsDtmwlnqqaorb1yvKqGbKiNq2jJLn9vN0lJSvMQ=;
	b=Xp04z1AqHxwljjqXnfRl9Rq9d0BJO/5z/UUPxD6gHPrpdoCO5oDGPheDCq8C765iEuT9
	 5bRTdLvlNHBWhZsyJ1JmugS01E/aSiWxxDxVdBIQUQKm9XzpYIY802e5JG5ygqxuJXTlq
	 G2hjihMy2rrDpluf4FIhFv5HNakvw1TQI/jnWgfCwxY8+iDA/BUhnDPWtvgb/JmqRQAiD
	 WsfeoSzFIilbgXlFS6Z3h8XArzjSlbL/23V4cwqgPdjeep2ywML68oZi6r4hLPZW7qGNJ
	 qpiPOWVEh2iOuJ8b+Da55t47XRcWdqWir4RnhO4+M7ugpGdkexnDg/3EJTv28ZhJeoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDYIHxzo;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7D606A327
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 14:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B7D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDYIHxzo
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdb8dad8ea5so855211a12.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 06:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616067; x=1796220867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I2DpsDtmwlnqqaorb1yvKqGbKiNq2jJLn9vN0lJSvMQ=;
        b=RDYIHxzoMlHxkFOSAbCfAyeuldO+24TCDP30YQu+Dx0GyHEsW4hucRZrhHtVlXY31M
         Y4F8piuLNlZtiMrOzErisYyBUpe/fwRTFHhbhHh00Lx+bMosSD5obxH0dIgoCWd14IAF
         bgTVBqcngPw8hBgMk9B4bByu2Km4GvT78sKue6Hz57gihXg9ffkxfwCa3adR31WfpmtY
         /zUoswsb0vS5Vko1C7oGXhJFIj9+I5RpaT6kBMD9C0vug/HCPmAzZp2+j3kNm6OdY4c0
         9n6WTjCq0EKfqXXCZNLJB+sf+zkyj2VFlIewiJNbePM4JYHRJt230TT6hmkJZLyhXL7j
         5l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616067; x=1796220867;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2DpsDtmwlnqqaorb1yvKqGbKiNq2jJLn9vN0lJSvMQ=;
        b=V3VU81WgFngB9ITuGjtqY0s29iC+Lee/zWgloDARO15J5P4Q4DFCtzaHHrRWjlEgkc
         LgikbdEiRF5DDhMfaUZhICgiVg9y+1tr+rNBarZxMW0syGn47VsXhVE5UzcX4cyuAj+0
         fn+MvG+B/a37IsewfJ3+om/3b9E5KrJ3FHAgccTpk9jjd2EQYxipYzXPQCZT8ZRhuKfI
         2okkR9aq59o/DLSPHUMMxLIm7p99bKCipW6MQ/rtfxJFLDCFTvsQOaU5lu+gil4Tw51k
         ZeBDZ/wKgck5Xy9dpUtvwoqTD71JqoynSWcTz6pSwmlVaKibdpBVm0tRiVonB2Nq1kSk
         Dqrg==
X-Forwarded-Encrypted: i=1; AL+hErGd/b+8Np7mGZnfNqloON+XCDPdKzX+hW1Xo1BKYvSMFKgmVtZOPwazk7a8d0aM0TeimQiHuCBO65M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uutDDRhp3SbW2lftp1YgCz6C8FeZhZwWF3eWAbYqcV/NHTvvJ
	FJuLHyLVMvNyjKN/NsTE9Vgg62HagJO4YL3YvX7CbF7wlkIew6PB2brN
X-Gm-Gg: AZFdTZc3YhUgHaE90u4Jv5XsnZ1fCh79KM03H/SS1QpF1gKSJcYd1DbeeLtWtyuFNzz
	pNqeA6e6chgJoyKAU1EAEgloOmc50Z2Oc6zebq9gw3V4TcdIYVTxk741Gt3vr/stIfsP38yWf1F
	yvB7UEh977YrcxUM6wH0Ue7zK2FcwdVPYMxEtLwJcEjcGJpE3VckPMHderpLbSjKcw9j1W6VF16
	YL/PeIA+FVAU+Ga/nJJ9eNfnW6+jRm4j7j5XcK1XuBPLE7jSVGR8ZodtRUjuCPVH8lGJXsrkXM6
	BlLu+2VWAnbmL7awzE+lWDXMjNiB1m97ZyITn0d7MlboMCXn1nzQjb/RD3VWjKGXYpymBM/t5NT
	iz2UOEz5SvFEaH4bOKVCFVdJxq6TOQlXkolHik7JqJ2srgJvBjy4gHUZA/wT42ZPpT6OhbN4Xm1
	zZQAAHw5jQgdVJE8DVxf6fWGRyZSviK5oM5WfSPKUW/t15L0PvSHZGCdwYP5mWmRPVFmcOIis4l
	fy0v8egc4lgUOucczwDqkcIfY2OctnLakMqwLbRYK3lc4k7WGnQb+zIWSeKNJbhpRBMWyJ5qgOf
	UE7F5Lj0uQfDlo1ozuyj4wfumB0=
X-Received: by 2002:aa7:9311:0:b0:8a0:3ed7:93a7 with SMTP id d2e1a72fcca58-8c87c38b689mr16164612b3a.32.1795616067259;
        Wed, 25 Nov 2026 06:14:27 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87392d408sm8903369b3a.44.2026.11.25.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:14:26 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: frederic@kernel.org
Cc: Zixin Wang <w1355457260@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Documentation: real-time: Add runtime tuning guide
Date: Wed, 25 Nov 2026 14:14:09 +0000
Message-ID: <20261125141409.330411-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <awbgq0xQyJATel0_@localhost.localdomain>
References: <20261125074658.33117-1-w1355457260@gmail.com> <awbgq0xQyJATel0_@localhost.localdomain>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Frederic,

Thanks for the review.  You are correct: the CPU isolation section
duplicated Documentation/admin-guide/cpu-isolation.rst.  I checked the
remaining runtime tuning content for similar overlap with other
documentation and will keep the canonical material referenced instead of
duplicated.

On the second point, I ran a local QEMU test with the PREEMPT_RT kernel
(7.3.5, HZ=1000).  The guest had 8 vCPUs; the test process was pinned to
CPU 6 with:

  isolcpus=domain,nohz,6-7 nohz_full=6-7 rcu_nocbs=6-7 irqaffinity=0-5

The only difference between the two runs was the presence of
rcu_nocb_poll.  The workload repeatedly created and closed perf events and
epoll instances, which enqueued RCU callbacks on CPU 6; I traced
rcu_callback, rcu_invoke_callback, and rcu_nocb_wake, and measured
enqueue-to-invocation latency (including the grace period).  I ran three
80-iteration guest runs per mode, giving 480 callbacks per mode.

  without rcu_nocb_poll:
    median 4.012 ms, p95 4.203 ms, max 7.040 ms
  with rcu_nocb_poll:
    median 7.003 ms, p95 9.971 ms, max 12.542 ms

The polling mode showed Poll/WakeNotPoll events and no WakeEmpty/DoWake
events.  Thus, in this test, polling did not improve real-time response;
it made callback invocation latency worse.

I have updated the guide accordingly: the CPU isolation details now point
to Documentation/admin-guide/cpu-isolation.rst instead of being
duplicated, and the rcu_nocb_poll description no longer claims a real-time
benefit.  It now states that the kthreads poll every jiffy and can delay
callback and grace-period processing.

So far only you and Sebastian have replied to this patch.  I am waiting
for more reviewer feedback before sending v7.

The kernel-parameters.txt entry still says that rcu_nocb_poll improves
real-time response; I left that file untouched in this patch, but it may
need a separate correction.

The test logs and summary are available locally; I can share them if
useful.

Thanks,
Zixin
