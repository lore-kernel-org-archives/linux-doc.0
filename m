Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274DD1DE8BF
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 02:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790908741; cv=none; b=tGsThwiZ/rzGwo4lazvC7ktrUg0/jzVGyvcVDLKkWlgJcaHWD3/WOylZpzVySViKq3FUD3WmSGCCJMFVo81xq7jHIDc0glLel27Fe0Tr3dl+d4EUrZ7WnsWS2HY5rEhQOGpUnHM+ORMIVq8ageOv6CYd6I/ExPLU/4uY/aatS0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790908741; c=relaxed/simple;
	bh=c19bk59QINY1kuvBH/nzmxB/WX9HqyJCd38qB52kWUw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h9zp41vEzMpKL+KUiHJRlayMM64HPg413C01RM7zIbiDgNT0xlv1BOqEZba8Mk3Z9k8S6HOlKEcfdXSP/MDBaD0f4fMcrhkpOlod4hT3uQA+XfBbSOLZ1pYbzrsJ3Pj3wvCd3TLQUPFOguMDOvxYBUx0qwtNbo9zZx549KgsW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Seho5LNX; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Seho5LNX"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6d9baf76bso205304a91.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 19:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790908739; x=1791513539; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W0JwbUYYrULzWB47hYNIr342NMFY/RUwXnmibkziqko=;
        b=Seho5LNXBedsqcD7q0ZdV5+fzIVuNSj1kDJsjg4ATz1OTyV/WHCV8nVIYmxacRLVHF
         +CrdUB8gxqCw05vGt0NgMz+MEomeICNO1btZjjFqOFXc7x8GpWD+bfLvw8i0le+XgWMp
         uy/H+ewu8TOzmj8k+PiCnOzvDTlojBwu9HQztOT+5p+kbfQsOBba8mR5USMuyObwcOWc
         3aBIaXIJwDYRJTPGW3phBRz2iqJ7nxtf/sWWYiwiOaNkAhH2i43wqzHE2tDqFx5DGHe1
         1WyRqmB2WtRC7TFBlQZRD6ui8hPmUawTX/wIRv9XQPbvd2ytxvtLStGyTd9CAqEqRMrD
         eW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790908739; x=1791513539;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W0JwbUYYrULzWB47hYNIr342NMFY/RUwXnmibkziqko=;
        b=FtJhpwiJFpyWH/VwlZlY/r4zjRbwfpwQPNQoj3yrdYcHKPcx8+9iffOD0XyJNcQ6aM
         9CsS0xtuz/EE0YliqsYQsbqn85bW8mcowxJKibt+u3LhDk82psWVrHiggA1XnYYQb2Vn
         /QJGNebis0AuxSO9MZYvSy/5gv8OpuLzRrap1ENehvxwQXJ7H3ln2z/8xCjRgTT9FUwI
         G4+2DmD7rJ540zhqgG++gecwsbBgpCf6bdoZEVHpnqOdKSJIm9/yFRksZyCs8XL4lgeW
         cmwnayhtdhTHy+0l8u4/6w8lr1mWOSi03NXUHlhRlCrwu9cP4MfjI37gqOAgefheeY2g
         ZljQ==
X-Forwarded-Encrypted: i=1; AKwUvByG4Buk0yEsiaCADTAvxpaKJzEcqr6UzGxPL0WvYHDivd6Sxg7EfjTrqyY8IBhiiKBELwaIxe8BoCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEaapudM84AZhM4Ov0duJUt2hexKjymqDAv+Xw7k6muWRNX10L
	aOh8i5UO1eIrUvrJo+Dezo6r5pP4eqjXK29f0eFHW+0bSFiIWRRYcgZZ
X-Gm-Gg: AYBFou2wcXzU/tVPIKfQgqio34gaZoLdfFkvx1oGneAmnT5++r8cByYzbSh6WcBMZcX
	xzaD/onxdLZ6fgHt9w5D4ZszWEa7AQKvjJ27U3bqSXRHJaoatuvRdoUhX/3r3b4FrEZTy3YcR8Q
	3qd7sUioHi0q9x8H2LIKoWdN3lBY/WfrtC2EDEJFy97hdBsLqyCtsMQ+SXLRmL2jCKlJ9wQs4EO
	4RbWgbrjD8PJDjjwrEklfO6fY26xleQW+y/L/5IOEEScGWmfNQsIPJW/UvK40DWBSta4WzrAsYw
	riC6PLZo0iEJag5w+mVUpSjwPXq7TgQuHLt6JMhIu5x5+3rWUcV9kqo78M0jYMpzj/J61QSQ8n0
	L8I4o4npNUHcgrWPHp6XyM6OFcvqMjmlV7rWyas/pAmi+4ggr2OUSeNh4vleCrbf+IhjdeQTdoa
	ihmqiQTZg+yHRmsgbv7UeFoHXb94yXPQGKJqrh8S3nlkUHEWQHLJ718qO2bMUMgA0V06G/vS4Pg
	wLLMdD7FCIVDoeK/dOAvFNC2TW3RyC6LEr+/whBsX7bzhXI+Bq5KAUk6tYNDSGKuKulKp3W1zHO
	jnBy9cvPEpPGwDecBXQlUNlQU0VponQlhtaCy5WDZ7MC5BI1+e/f
X-Received: by 2002:a17:90b:4ecc:b0:3a0:ca1d:b40b with SMTP id 98e67ed59e1d1-3a6cec84dffmr1148635a91.50.1790908739319;
        Thu, 01 Oct 2026 19:38:59 -0700 (PDT)
Received: from mars.local.gmail.com ([240a:61:8063:c5f3:3cbb:dbfe:34ef:b37e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bc991sm6682074a91.4.2026.10.01.19.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 19:38:58 -0700 (PDT)
Date: Fri, 02 Oct 2026 11:38:51 +0900
Message-ID: <m2se2o3jyc.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: johannes@sipsolutions.net
Cc: ljs@kernel.org,
	david@kernel.org,
	linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
In-Reply-To: <94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
References: <20260929235711.2287931-1-thehajime@gmail.com>
	<20260929235711.2287931-2-thehajime@gmail.com>
	<bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org>
	<ar4br2vW7yZGd3gt@gremlin>
	<94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


David, Lorenzo, Johannes,

thanks for the comments and inputs.

On Thu, 01 Oct 2026 19:01:45 +0900,
Johannes Berg wrote:
> > >  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu
> > > >  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
> > > >  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
> > > >    -c nommu
> > > 
> > > Is there a way we could derive that from the environment in one of these cases?
> > 
> > I thought maybe uname could help but our LLM overlords tell me no.
> 
> Hajime originally wanted uname to indicate it, but that caused
> regressions elsewhere, so we dropped that commit. I guess we could put
> _something_ back?

systemd uses uname information and our (old) patch changing the format
triggered the regression.  thus, we dropped it.

> > It pointed at something though.
> > 
> > In fs/proc/meminfo.c:
> > 
> > #ifndef CONFIG_MMU
> > 	show_val_kb(m, "MmapCopy:       ",
> > 		    (unsigned long)atomic_long_read(&mmap_pages_allocated));
> > #endif
> > 
> > So MmapCopy in /proc/meminfo tells us definitively, weirdly enough.
> 
> Hyrum's law and all that, but I guess it's not highly likely to (want
> to) change :)

a runtime detection is nice.

scanning /proc/meminfo might be useful. although it requires to mount
procfs (we can actually skip procfs mount as it is optional) so, this
is not 100% portable.

checking ENOSYS like syscall(SYS_mprotect) might be useful but I
wasn't sure if this is always the case of NOMMU or not.

My original attempt was to use include/generated/autoconf.h; with that
we can omit environmental variable or command argument of NOMMU=1,
but gave up with handling standalone build/test case which might miss
the generated file (and complicate the patch only for the NOMMU
detection).

So, specifying NOMMU=1 is my previous, though dirty, conclusion.

-- Hajime

