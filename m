Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102232A3E5
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961777; cv=none; b=qXo+H1xtDeWHu4zQqYWMrQMemZqJkIB+YjrX14+dkgvGDkyXi+c6xa3YGiMvMfV1KLiJxkpRN0IC3KyiI+DdhnX/mxc29vUhK/DZDL339atxYOvCdM09kD4nbPnHyDD6drquP3H78gXClEns43LbZWhve20KWOvga6g44sOeFX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961777; c=relaxed/simple;
	bh=wYe7kym3kczWr73lptfB1bTj81zD5wvAqQaXYZ4DW5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwpLszAuZcRowUgzyIkDfyO4/Fw730uR1YlbVnUHkUv4rlkVr8VcF0aAhpjcT7zQgCjGNPUtZmz8+TIFf/wPwjs+ODhzMoskYRu6dl11X48iOh410zLlYUMyXqSz5x35WY7fK9qaeZ6tNVZXzw0goHE4EAcjrktbzqqttxxxsDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZ6p7Hie; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZ6p7Hie"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc61541f8cso1066995ad.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783961775; x=1784566575; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wyTThpzWI663yfCX7yR0ohXV0bj+fwjL2+oCBrswHw=;
        b=pZ6p7Hie+ZuMyCjYswdbNFYtHYwpTiPQJeBxQDgIy7EmtqA3YwrisiUmulxHWcgh7p
         mSzANG/LXXobjGulyTi2kSjzBvp+JDDbq1wXipDZgrSJWUj1crZjkt2sxlTMK/zueLf7
         5yPmfr75fWWklrWpWcDCcHrcGG157arPtZtcY2FARd/IaVTlv1jRZfHH+eqHXs12qk3G
         A1xBemqKnmwrdUlPtwZs8SH4WDWAbkeFi8shvGawPWatfrORXtRU+Zq89GODYbZc/wYa
         2Pe75HEhtpy9RKIUzBPRBHmH6bodAKIQlnOkVGuH4YWIkHJyDGjDsclp+F/R+JU8qqkD
         UxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961775; x=1784566575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+wyTThpzWI663yfCX7yR0ohXV0bj+fwjL2+oCBrswHw=;
        b=WHeDt2md1abTEs3GtrkEzU8CwwKXWS9Th/FhyZkotV65qwJYzVIZkVcLiYmu8JRx/Z
         +bje7Gfqm/s3j6Got84/D4+XaH859cwX/WnX5Wuj19+X232u6s6FapEYwHiImn/qjXb0
         FvSn6XEJPwg+r/hEisFLmkpWT9P4a2hg0iD8MifMiWX/JxR7lMknY725dwBWcU7+Ws26
         WjqxQ1Hx4d91XIU/qA5FKLXtl/uz0LY+Yr0V6mMhCNwxuSu3ZwVdOL0bm8O7+Q3n9Lxo
         a4PrmyaBAOU7TTbhHqvBLWDMThZHqeZ+IiLTUI4WbLGOk32blSA0WxwJqGGwAPyGPUz6
         FqRg==
X-Forwarded-Encrypted: i=1; AHgh+RqO4NN7Ia/vgPplPWzfxuQChQj7EDRitEUG90nTysEOLO0BKLTU2ajmKpXJp4Wi/vVZvVR35lKvnfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76tDYunMlq+Gx7f1JdWYM59T5YWrfelUh3/BqXysUGWLjknPT
	KqKV8NauXMj8VATdc4sM8/7s2KMMo8VNcu4DzCU1/NVvI9rdLS4o9u36
X-Gm-Gg: AfdE7cnMBY/DAG0H7Q8hcnDzOs7RS2uAdC7TUIArednqAuDjDsIiRuTLHZ9lil16Dzj
	Z09xPFivzU4fv5RERqVm83goQLNCYdMG9l3aqaMQp2XQPzYD6IgDDZvAYO1MGGNOzIKVwchSe4m
	ksfmXVxyKH3R97Dx60FiE7vDtKawlhLhLiMNNaAY8aMFU1F1gdgjbbH+82nx+eXe1b4GEcg/O1C
	SyAbSKblhty3CTmjidwoFO9/KMuEiwg7VnE4gOLCZl8oVOzNAjELNF+/iPiNTdKcuv4fa+qLGV1
	b+p0+/+1c3FUDIZE5+OVnpwca0lMUDSrONlRkVHysjarSGFF33SMc8lPXYZiuANap8m2lmAyb5X
	LVbPV73bMyzCEM2Up4fE2HGliuC3h7jAbcsl7sAiJZIGaa3KGleBUjg7klOqes+tqZAonxlw/Op
	VAfL/3OEXOIUqTGBHla4dlNSA4QI5KrCM9n/p/2hsbhhcHvUZYTygKe2c=
X-Received: by 2002:a17:90b:57cb:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-38dc81978ecmr7351194a91.5.1783961775319;
        Mon, 13 Jul 2026 09:56:15 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a596sm180718a91.15.2026.07.13.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:56:14 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:56:12 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, corbet@lwn.net,
	dakr@kernel.org, david@kernel.org, decui@microsoft.com,
	haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
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
Subject: Re: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-ID: <alUYrESVcHR_p-S_@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881034.900500.5214601525971121683.stgit@skinsburskii>
 <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
 <alG1JwgUK44dCiN4@skinsburskii>
 <20260710224606.69235ab5c49b5987fd33e924@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710224606.69235ab5c49b5987fd33e924@linux-foundation.org>

On Fri, Jul 10, 2026 at 10:46:06PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 20:14:47 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > > > +	mutex_lock(&region->mreg_mutex);
> > > > +
> > > > +	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
> > > > +		mutex_unlock(&region->mreg_mutex);
> > > > +		cond_resched();
> > > > +		goto again;
> > > > +	}
> > > > +
> > > 
> > > If the calling process has realtime scheduling policy and either a)
> > > we're uniprocessor or b) this process and the holder of
> > > interval_sub->invalidate_seq are both pinned to the same CPU then
> > > cond_resched() won't do anything, and this might be an infinite loop?
> > 
> > Yes, looks like it might.
> > What can be done to prevent this?
> 
> Well the best way is remove the polling loop and use a proper sleep/wakeup
> mechanism - mutex_lock()/prepare_to_wait()/etc.
> 
> If the polling loop is to be retained then maybe msleep(1) or
> usleep_range()?

Well, running MSHV - or, I suppose, any other VM - on a uniprocessor host
would not be very efficient.

I’m not sure whether this corner case needs to be handled explicitly.
But even if it does, supporting or explicitly forbidding it would be a
separate change. As Jason noted, this is not a regression introduced by
this series.

Thanks,
Stanislav
