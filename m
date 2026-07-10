Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9A43B4B9
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 16:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701829; cv=none; b=TCC7DrMYc7qoezmFN3pJZzD2baUGxvGLcvD5jrmTmSDYOEWt54gClHjdVKh+VYI2wuDpVLhlCsNCzlfPOe5Y887WgeLXZnSnTarEE6tgfVGCDdY23K1SdTBXx9myt0MlEbvod8jInmCxn3lUw9MeAR6w28TzcukDR/K/7mDWhAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701829; c=relaxed/simple;
	bh=uIhVIgctXUQcWy00AudXCG6kW+KyBF/3q5iL5v2zEVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qkdg3NQuhztfCyfbGG5w5EvB6CoDc8ssTpnFWTrm9w7mbgwejXPyfqWw4mxR+4D41RK3UNIvRsAX7PwSG9OIt58Rj9NlNoG0GV26rMuQdmikFQPbQFIR9JGJZW1vJ6QKHHY9X7+WkwuIhLf9H+7n/nQeG/LTMPMJLfbyAWNGmDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AyS1Bxmo; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AyS1Bxmo"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e53581361so62424985a.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701827; x=1784306627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXM4slhr2CFKJAVwVD2VemgO6fJY6jlNQ4kyqua9fHY=;
        b=AyS1Bxmo0N6YHkVKH9oyazzctAf/4C32alIBv/QFTAAa8UmyfwpnYGzVReGFWv+DP3
         VcpePWyG1bS/CSWG/+IpVMdTuFeZrVes+MBNYw+9jRJF8pK+0K9aHMt4bLIgaQ/7/9hy
         VEfaWMdWITdKdLpPAeSE7Qtwa29EwC4oxt3cBiOlEwjIPNBgoy3jXc7Geh1fAHMdfQfZ
         Kmmja0r7dBY5Rh+6mWUg0+qVA8QOzx1s2Y0bHZcGk6L+fiUylkBBPLREklZMk2T+VfcS
         x9bojoZx144A8gDBS9ilm5M0wynR0XIEzLUj2z+6xCiHnXv+Il1atWK2ekrdouHfCya1
         A7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701827; x=1784306627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXM4slhr2CFKJAVwVD2VemgO6fJY6jlNQ4kyqua9fHY=;
        b=JE9G1NrW12oxG+6tIx0JVS8dT6JKl7rQiV1Arbt4ZACgcRQq7iQBl5cG8/jD8PCICi
         atR8SiaAzHnk8pQ+KvrCxwwCM/hbyjTMEPD//Hz3s6QITandYOzInoC7lNRIZsQbEJdX
         L+GLR5eVyeqF3W00bz9M65rmYRN1fKofu5BExl2Luz+wCUeMnOZRIdt0ZC/CZibS9KZL
         ODtTBpeUziTh0hcPUGs0UQmkG7GBiyf8IcFKHQHS1/fth1q/J0+0OM4tgLsxIgxgJDn4
         I/QTNnPqfCnILE9MwaPSO+2N+1X+pFAvps7HCIfchxpcFGUK7pagJIDhWzISpgIb1IY8
         9U9A==
X-Forwarded-Encrypted: i=1; AHgh+RqvO5YLyCS9MULIOjqibHVmfXt9FmYnEYPGqZzYRB9VvnCsNFSGzkMYd2sIQPSPEtVmM32yFP3fzso=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6pjnOM0Ln7BopXyRmGqwcS5oyUz/IsGwJseItHwSLJ0xwU+T
	SQwr9sTDtZJUN7B1TUlCm+fFgOwQyrKkpYl9Ug2EAY91lohjf4AHDq9z/0HJQyzA7TA=
X-Gm-Gg: AfdE7cnbcWSPB3uzCLRbQxEZRUylyKcU5SGLbCZ+o/AqS8OgHf8NPtEu7De15viMHoP
	FKegGB7BAqDHb17HpnEY8+H3wMpKfJ9S82wqYXjdh8PqQdZ1uRrJmO26gsnXZ0r+sOIDzxDwXCq
	l23fEPLfV4XkQJU9j1d0bMOsZk4BejJKge+qMKYKc11+K+JRLImGAQO5zSsx3/qB/ioi4WS7jZ2
	f+mdMDl/W2Fb/ET+OYpeFWg0CnQG3RZNBbrO5T6rKXrr6q5qvVklxkdgz8uK8+SB0fGQdnu+JQb
	5hWooLQphsY63HjundDlgLZQR3JtyFhISBar6ds1OvcseEfEQ6LQ2XOTXD7q1uH8eEwEL3Sh1Y/
	9/WelJW2d9q9cgAGNlaS2x0ZdGCbvTuVcQCEzyXq1P561azogfbT9bRS8Qevg6nh3sZfovgE=
X-Received: by 2002:a05:620a:240f:20b0:92e:e569:dc20 with SMTP id af79cd13be357-92ee569e3c8mr347342685a.78.1783701827057;
        Fri, 10 Jul 2026 09:43:47 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee59223e7sm237517985a.0.2026.07.10.09.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:43:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEKH-00000007YpZ-3qzk;
	Fri, 10 Jul 2026 13:43:45 -0300
Date: Fri, 10 Jul 2026 13:43:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
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
Subject: Re: [PATCH v7 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
Message-ID: <20260710164345.GV118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345365679.660027.16671418103486907555.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345365679.660027.16671418103486907555.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:47:36PM -0700, Stanislav Kinsburskii wrote:
> aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
> It keeps a single HMM_RANGE_DEFAULT_TIMEOUT deadline for the populate pass
> and retries -EBUSY until that deadline expires.
> 
> Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
> the mmap lock and refreshes mapp->range.notifier_seq for its internal
> retries. Pass the remaining jiffies from the existing deadline to HMM,
> while preserving the driver's existing outer loop for interval invalidation
> retries and for selecting the next invalid mapping.
> 
> Keep returning -ETIME when the retry budget expires, matching the driver's
> existing timeout error convention.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/accel/amdxdna/aie2_ctx.c |   17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
