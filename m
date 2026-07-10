Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2386847CC6C
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702129; cv=none; b=BVZjg/gx4boFzueKclcq05lY63mcuc2czTYJh0sNlA8OnmapleS9Iij70RtrGYONOQRKgoPyYOETWNvmj1IEHeoKHYmq0hPpvFozW6KpkXMgjH1j4/2YgdIGKLfmlkkM1wZNH3g+wqG9Bw0Xpo0SE4oyvBZGjtmdkl4EMBqX/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702129; c=relaxed/simple;
	bh=gpGH/Q6yZYnkzQY2k0xRm/7mc5sBuLAhp6W6fGmbMLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlDATP3o9fpIQRRCdnHsbKW+aPGwkPXMhW+6pFWuOB0hQDAfDiQbKn5ZRpbKSXIa5C+07tRua5H0qeCpVUenKxx3OnJRfCi2DmVFweVpIalUopp6blkm+h43H8KDgNUY5USHXM2UtADmF7SaIytbqWag1q5ejLIDzonXRxtyuwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1WlVrvZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1WlVrvZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8486672f03cso1044418b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702127; x=1784306927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/T7cJaVh+vpdnCnVWowF/GJXIiYthZ82xWXxPXNVVI=;
        b=Z1WlVrvZUUSrvSnSylau+EjoBytzRjh0FvlcvopGl/53I/6TMyLyo0K3jdbTWmkxnY
         CeZadAsfKW8dFZdYQ/lr0S7/oM740hhNxhH+JD8OW0CzgH4Rw/btLC30q1Hu166MhLNh
         iOAA5lxfxwKu8ouM8/DC7ktuG2m/23J210FJXd4R+ZudxAkdEl2raRufro+w0mKvaKAl
         awCBXUYKVSyqm7+TkzMjFogHg2hkoyoy2YLjogT9vwuj8K8/JONbigrkt1aPBLIvV7a4
         D+kmxtgEGOHuZeKwUD1isANdpEM6FY+h+Vo5d8V7eWyMjVHIUgDp0glo4ji1AZBWiBB8
         U8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702127; x=1784306927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/T7cJaVh+vpdnCnVWowF/GJXIiYthZ82xWXxPXNVVI=;
        b=KkJ/v27vkZB4W7on6WBrZ9KDZyD9U57fyAN1gw1xUSrG1Km3JZvqN2wDWrYSqttcbl
         hDL+yICzmIqk0ANO+ySXFURRvJr0h7aBANpbodpu8vSof97IaptUWV4ioqiWQaN2V/2Q
         A9Huuqoi2iyk1rGpx/0kPnwzsAP7m23iO4eJ3fTNWqqyFjbHT4DWQjG+Cnhco4ZF8swl
         1aglUcIn7fBzTnSYTs8pURzU/QOqG/rt5VtDzjgSWiWB+1lBA9wL6CIlaA1m5z4Icuyb
         nKZzxYf9YWuutRW1c5fiLVumA7tI0Ye3URSySyuv8OhLltjMAS6n22UzBuU30fT/caU5
         B8nw==
X-Forwarded-Encrypted: i=1; AHgh+RrXodpswAdS7NWjmIxQ8KUemeVRteN203w/+jJE08ynRUfAeJuAcZ8GT+OJKeRapQRpXO/QVsxWAu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlUY7VOb+lzJb56p+nJh3nIXCUmrJ+gVDAKPZUPJ0dt4uKqjva
	QxsBbIv8HO9O0xT/ocGxbHkhbkS0z1O9KRwmQC0zhmwiDGdC0KkkP2o9
X-Gm-Gg: AfdE7cnRg+2dSizGyJpuQsjkYQJ72yoPCMjA/lRMr4DpgQfO0t2bHEoZzFLDWUsoM93
	CyGWjmg3kxa3udTGa6HYgz+9m7+F1J8JHWxaE5dixrsgIrPH0AqHDxt+63DhNy0AGwOGcE5rS1+
	7iCMfXHwcZgMdTVJFclNXlzuKfuJgNZZufZ+uz/lwNijrFchW4g4fx2YG+PO4tCiyrhMmRNcmkm
	4BwDZN0vYArpau064VVQEvde+Vp+SMjq53aJlg1/+Ap3d/tylyi7fwWvDA8CcTE5QXqQ1uwEf6r
	UtLYtYslG8U6x2lHxHGpcc1FkltIFZJlxFUvB86L2Ed3YVPbZIF+R+3qTAMPIZ/jO9ayi9VGH+S
	gGNKpnZ4IwEdkB04Y4fszYy3M9S+SANlyNcRv0/+7m+dWVtN5mZhC1lX9GR33uGu4LsWhr2GK7+
	NM26fhjzI+mhLiRMQnkN53YTWXUopLsXxHSak/1UJYibXTIbjAMs7sesk=
X-Received: by 2002:a05:6a00:6c9a:b0:848:2f7a:2e57 with SMTP id d2e1a72fcca58-848438a63damr12313317b3a.70.1783702127271;
        Fri, 10 Jul 2026 09:48:47 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b609acsm10408336b3a.1.2026.07.10.09.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:48:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:48:44 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <alEibBRYmWQvf1z1@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710162749.GP118978@ziepe.ca>

On Fri, Jul 10, 2026 at 01:27:49PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> 
> > +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> > +				     unsigned long timeout)
> > +{
> > +	struct mm_struct *mm = range->notifier->mm;
> > +	unsigned long deadline = 0;
> > +	int locked, ret;
> > +
> > +	if (timeout)
> > +		deadline = jiffies + timeout;
> > +
> > +	do {
> > +		if (fatal_signal_pending(current))
> > +			return -EINTR;
> > +
> > +		if (timeout && time_after(jiffies, deadline))
> > +			return -EBUSY;
> 
> I really dislike there is a timeout here, HMM is supposed to be more
> deterministic. GUP doesn't have a timeout, what is this about?
> 

The timeout was added because this version makes the unlocked helper own
the internal retry loop, including -EBUSY retries.

Several existing HMM users already bound those retries with
HMM_RANGE_DEFAULT_TIMEOUT, so the timeout argument was meant to avoid
silently turning those call sites into unbounded waits.

That said, I agree this mixes driver retry policy into HMM. A cleaner
split may be to make the new helper timeout-free and have it retry
internally only when mmap_lock was dropped by the fault path, since that
is the part HMM must hide for userfaultfd-style faults.

If the walk fails with the normal HMM invalidation -EBUSY, the helper
would return -EBUSY to the caller, preserving the existing driver
timeout loops and keeping HMM deterministic, closer to GUP.

Is it better from your POV?

THanks,
Stanislav

> Jason
