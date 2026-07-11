Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEDF1DFDE
	for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783739805; cv=none; b=iDpJpFkQgjtU/HqxJ2UwlcH/tMd4ZylnrZ6FHUHuDfH+hXybK68I/2c47FTh1bj5s9DvjfdjVUwgzTd5wEvOBEbGo4qVwzuUbJ+Z0WOQ0iopjCbuFUh3u1IXrehdCbbkEVOtEb+skCtA3vXkRswXuUDNaCw1UiLu9RIAQaM/YYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783739805; c=relaxed/simple;
	bh=B3DNccZp5dt31xSN8qydp5e80M3HHyRBCHgLNJEVo70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEssx+CEuAAKZ2jhR6QOxJSWLW9VGxKvbdmXdp2CUdGM37arB0t51PBEVFQoW5ZD6hPdfDvV8fSsSYJ8rBz6uZKL3bJlKkyMNV0jOzbHOgCPqCLlXy5730mSPOuQgTjiJSiF2xN+KP9zW6MzZeS9zcx1gFR0R+UeX/E0qDYLRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcLxFmF6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcLxFmF6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8484a0b998fso2286470b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 20:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739804; x=1784344604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FBlRq40n+WQNoah/jqkKv0Mdb6DSXF7flMHY66vmfak=;
        b=KcLxFmF6Yn9X45t/A6xxKDCYHrBSJ41t8fEBK9PkCHLXW/K0gjuF+pSG12tQVenpXI
         N3z4OgZMhVUgrhCG5U+TVI5t8KErmisE08WqJko8sdkfeloCaffPgjPDyfXaA/gjWl9J
         5pBqSNIcy87Uwm9vJ2mbkTghXmS2k6qvfxKk4qLohwOSo/GfAlVNaFa6Q5QUidhTz3uc
         eEDzYFDkJOPdqIx1mwH7enFnVOOSv2zLCNTm8Wmy2hNVfcJmwf/PSC534His1I5bGm4E
         pOOtvYLdgpI+kh5bLvFNDsocLdlhBtfcCKx3sMe4z7CEgfUfFnqEeBEaWYZOTvMjJkP/
         3WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739804; x=1784344604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBlRq40n+WQNoah/jqkKv0Mdb6DSXF7flMHY66vmfak=;
        b=ptoQFc/oGnilP6COzHf5o6kkDdyvbHml1jVmJ6FGO4xLKNEYQ3+H6sMivSmHfIR/hC
         s0DAtRYMSZLqeR49E4BSjYpi+o5mHlvFJju+ToyW+NXsUleotDU5vEDRqswcDx/87lsT
         bJZ6cFvnXNoIDsYVDoAKuI1uWGaW5//EdYtONhXwq/L2rRaSXXkKdWE1LUWfqNX3xDWu
         vGaiF76FIRmdsLJHrpIh1H4GHLPChtxiP1ygOVMXrRw98YfTPsZ3Gv/DdjXyx7h7Soa0
         ajrEzeNug6WbJPVij57P9xr02EWnLagq34M13+uUZWNQxEPPOmpwYUDAsPD69q1a3Hmb
         tE9w==
X-Forwarded-Encrypted: i=1; AHgh+RrVoZekEYcv4v0M17Z43MQvDPnFB2/4nl2DEgaCNJeSaPV+rUCSQD2X36TxmNUt07EFFArR9NzghPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVVI0MXm9+WBVnFkga3MV6z+x5rXe7btnTs8jhXP0lH/Ik0XL8
	fJMaAi1n9FsSrzlTHlPdpga/OM1R0b3gTYxi7mW8VctQaal/WJoMqkdo
X-Gm-Gg: AfdE7ck8+d8bhYKJovRYN6CEZXfkM03A6GLCQ2Uyosbu3sBT9eiitY1U9qq2/JR5xNR
	bDy5FzYfy8XpAYDKGv0jIijVzFlmHsZQ3dYh0g6ArajrGSzar9xIo4rneYlNTt1vqVyT3KJ2biD
	R2t8C7WBU3VOY1NzHUxF3f0NLoUN9pndLZfb14WJS48YtEtDmY7NYnA+r7kio7lX7hr9WUR8OAj
	HIwf8AbgrMCyYfLDqPrusIY0AIJDLMKlZe0t/9k/7+GKnbXoaDA134yc5wHJuV2YbyChiG4VtEY
	ymwrjPaWuPNzpIDSjg5GAXlY3KRu5r8BL62GrrYQpH7xdcy+GmhCEMMYs29kjwhQd0Un+/Q5eKt
	rHQpTm6EtCmMs38lhCKLnvxh0YtIr8MoX2Ur23lAa412g2tlmWTq8GDjGCNZKaxntl93andBmDN
	wI4qHwBoG3Qj/dfykN+zfrEe0tw40mttKDYV2chEOzs3PzuSJhuwU5Ulw=
X-Received: by 2002:a05:6a00:b4f:b0:848:2f77:e2da with SMTP id d2e1a72fcca58-8488979d33dmr1391764b3a.67.1783739803838;
        Fri, 10 Jul 2026 20:16:43 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84870d76ce7sm2041406b3a.55.2026.07.10.20.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:16:40 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:16:35 -0700
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
Subject: Re: [PATCH v8 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-ID: <alG1k3JsoywE2CBM@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881847.900500.8789369230260725500.stgit@skinsburskii>
 <20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>

On Fri, Jul 10, 2026 at 03:12:22PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:58 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > @@ -683,15 +683,11 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
> >  			goto out;
> >  		}
> >  
> > -		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> > -		mmap_read_lock(mm);
> > -		ret = hmm_range_fault(&range);
> > -		mmap_read_unlock(mm);
> > -		if (ret) {
> > -			if (ret == -EBUSY)
> > -				continue;
> > +		ret = hmm_range_fault_unlocked_timeout(&range,
> > +						       max(timeout - jiffies,
> > +							   1L));
> 
> "1UL" here?  I'd have expected min() to warn, as it likes to do.

I'm not sure... The "timeout - jiffies" can become negative.
Won't 1UL convert both of them to "UL" and thus make the comparison
overflow?

Thanks,
Stanislav
