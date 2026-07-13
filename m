Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AABF43900E
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954511; cv=none; b=ZcE62MRY4CFsREFWxfwEvsaWE/+vQ6z4Ty9xv4X0F2e9Mqlm2WCa7XtcOov9s2bETGv75JTRccrZhRBH2VPVziJTIBdFqKJtSPWZ6P0HDw57b2Qw8KZeQIVemv/Z37ZzByekaK6DUnG37vuIwV3CYdr/4u1YIOsxqCWtFepDrPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954511; c=relaxed/simple;
	bh=GEh+g1NiW3mR99aSYCyQ33wt1J/GHPQy/vLk28L6OPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1gMxHPu1pJO0tZ6YcI6Y6hY5DNoBr+U7hQEzdqexDFFKGpk4Pjd4e9WGJCa9m4gSG3dcozrVqLq1msfWwKR8Fy70SZzKOUolGZnr2hm0flz0s9xr86NX/ePddK3GOd6K6NCYXjDqbRJRAaFID5+vzE/yBMGs5hqxzKv3G/fiVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=iXXu18NO; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="iXXu18NO"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51bfbe05683so23733581cf.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783954505; x=1784559305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZhqR4JgKFkSLvdz8vThCe3gL1K7igiBUDMCwA8QSjs=;
        b=iXXu18NOzE/K64fJi0fS7XlUycQSsVxXqPVr+DHylcaFLj1ZBGlqbiKaNjYo6pMNIm
         fSiRCUq6RCQAbt++t9n05E9YILRvIwfGpADmIjWHjg4w9C8rhQ2bV4ZbFCsGOJc2Gi9h
         q0ipGuVIBlXhdX5gvz/3Y3NfqBQ95zhUsKtWVIxTviWCAqHMhe+FlLmMacP5a1uSsAxy
         XCa5CdP+NztGm+lo2TBbweNAKDuzXp3OW20FggC18NySuIIp9GsP7Fts37KEB8YucUz/
         RTJmsqpTBastICdMJa+TDHNa8B0sYSLIawq1pS+VlCcHU8CgR0mFrSEaR9qVNe95TjcZ
         BA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954505; x=1784559305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZhqR4JgKFkSLvdz8vThCe3gL1K7igiBUDMCwA8QSjs=;
        b=OXe2ykHzJDisicQq9xV2QDL7yye/zt7XCcrnkddhadkO8Lb4YL5d0yoxWgpwB6v6fI
         Vm3omaODnNxKfL7LwWHWZIfz9TDrLWjEGQhDmO/CeefsVHcpS+1NUofQTQlxAMX7EJfw
         M4LYiXkp9gB6UOQokvtGJ3QRm7mF2DONY6WKKzNrE3BSdLlJyaE66hGYKbYT2bWHS8ZP
         B17IcOyS1dbVfJx9Iun/+0UFWQaFV4XZdEeV+0pcjZhSEAZWWYc040F0t1usyXPgMSP/
         rWrN1vFlbPihdkGO9Et6/jSl6RtFJ1k/Lv9YVDCgS4Nx/cB+MfTVmfjfx7ooYfC+PcAn
         Bp9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro3mDG5R0nZYGAc2e4mQUl6awniFUIcHMm/tO6W8/LC8tXcPtJIONB+4MX5TQL5+94srnIlEC1BALI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+d0k4LqZN3Ar75gz9jWhy1J6C63UQFqJVfLvEtDKjxg4Tgizy
	SwXDD9Iq34jT8vF/q0uOCKhd8VsaZ/r28TH9M4AAhNXPCiugCBVh6/YP4Wxbv4piEY0=
X-Gm-Gg: AfdE7ckBjFHR4RB1H2eWSQGCc0EuCxvpIEKImpRFQS51mdTPfnMQRGv2hBrcAHSD/qr
	RzuBhsyi1/vViYLZi2YZCVeRwBbZN0LtpeOkMeMMvmPg9FnpHRqdyXtgv0aua8Ubgx6cNLEFkVW
	aDh0CURc395qIWACXwa7UBrGNhq4SNq7V/0ok5krxDqV3KwcP08KADdcmLJ9RVfiW3/QKkS+htZ
	2LxPpknxeWTFZdXHwuV6YgeXtE55s4TDjQUejZYVpSZmIKcZYdV37AznU3JkNe+0Ok167OKgYpX
	dq9S6YoUXHbcPZzXmmiku/G5cgUycXV3IptBxqojhTUusAVaj6NS/jOr9RefaGTrrOXUcJUTk6F
	LnCVEv5iEZ8teJoidVZe5SLIVnjtWfeGn0OLuTK6oqNxMh8LRSEbkRYwfxCeD0v625gjzWr0=
X-Received: by 2002:a05:622a:1911:b0:51c:504:2ef7 with SMTP id d75a77b69052e-51cbf305510mr90471451cf.67.1783954504822;
        Mon, 13 Jul 2026 07:55:04 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6d574sm84876451cf.3.2026.07.13.07.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:55:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjI3j-0000000DQQj-2xH1;
	Mon, 13 Jul 2026 11:55:03 -0300
Date: Mon, 13 Jul 2026 11:55:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stanislav Kinsburskii <skinsburskii@gmail.com>, airlied@gmail.com,
	akhilesh@ee.iitb.ac.in, corbet@lwn.net, dakr@kernel.org,
	david@kernel.org, decui@microsoft.com, haiyangz@microsoft.com,
	kees@kernel.org, kys@microsoft.com, leon@kernel.org,
	liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
	longli@microsoft.com, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mamin506@gmail.com,
	mhocko@suse.com, mripard@kernel.org, nouveau@lists.freedesktop.org,
	ogabbay@kernel.org, oleg@redhat.com, rppt@kernel.org,
	shuah@kernel.org, simona@ffwll.ch, skhan@linuxfoundation.org,
	surenb@google.com, tzimmermann@suse.de, vbabka@kernel.org,
	wei.liu@kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-ID: <20260713145503.GC3133966@ziepe.ca>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881034.900500.5214601525971121683.stgit@skinsburskii>
 <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>

On Fri, Jul 10, 2026 at 03:12:16PM -0700, Andrew Morton wrote:
> > +	mutex_lock(&region->mreg_mutex);
> > +
> > +	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
> > +		mutex_unlock(&region->mreg_mutex);
> > +		cond_resched();
> > +		goto again;
> > +	}
> > +
> 
> If the calling process has realtime scheduling policy and either a)
> we're uniprocessor or b) this process and the holder of
> interval_sub->invalidate_seq are both pinned to the same CPU then
> cond_resched() won't do anything, and this might be an infinite loop?

I think hmm and kvm have had this issue for a long time? I don't see
anything in the mmu notifier locking scheme that would alleviate it at
least

So.. In terms of this series I'd leave it, it is no worse than before?

Jason
