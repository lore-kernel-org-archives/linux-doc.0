Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C1446A5E3
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784921740; cv=none; b=JPWagxPbfQlEHooLZcCOBVVuyl+/YJFwhXaPOiQKaNGGGZxSHdrFxd6th2+aooW9l7dfio56xRuEu5vC1qj+CEUjjUAEdd7XNQJK/FrxTojHh5V0ST/7MgJ8IsvqnsRZipnXBf3E1vXLD7vLVTTO/RrkWj4v90QaQsnqx3ugAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784921740; c=relaxed/simple;
	bh=qe2ZGt/7PLvRmph4dApPzDPKqcOW5smLTzzdwKmTn3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fU2oDi9ZBRZnklgyal08ZUtYiuh7Y2/eq90XlbUzuU+MptPqJiNUthdWeMJktR/3IZP1x0vYQtcxJc0G8CDLQQYhQtI1TceYk2u/91w/Ef7/NQa8ClBpnIOpCYO7SdvHyW9govJXorurf6kCPDn31n5nuGUrl3QitjhB33Ax5Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=TKwEiRsj; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="TKwEiRsj"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c05dcdf49so9216391cf.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1784921736; x=1785526536; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=52NE9Ozo8lcWHzI33LM+g+/jHOVCaJk/+w0sPndGSPg=;
        b=TKwEiRsjBVOFlROlAD/xx7FkxgJb6uijW5Iealc4jpdewPbRs6SCMpJAF1KS/C1e14
         hryYU5e1HDRwWFWYNTf9mSu7+ePNAh3QKkX5EpasqYRg7HXuv+pmSAc4JedQhsFbcUW8
         iiPGRHK0QXBVRHHD82KmbOz1VoLSrOwuizDL2n6Buo+xOs+BBm3PTL724Bo14PsnZCHt
         eigabKc8jdoAEpYyfLK9Umc53Kax4qWuHvLcZDioDOJSuXMdLr6yXh2Dz7iGPWsPoPTA
         8VqwjjSUF9/c9jUhiB+xmOIjT6yTKijNdVRZHO/5z9gOLkpVnpQ7dhRSOoJGSjw8Ay2z
         114g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921736; x=1785526536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=52NE9Ozo8lcWHzI33LM+g+/jHOVCaJk/+w0sPndGSPg=;
        b=eEPO2vaY+G5RfjqiwIDC08TUqt5Be3syZ/KRoJgD60EMwbbS9C3qpDzUvC7E3JKCis
         oWa2iakXu8nfw1YzPdi4jynCx96P0xoV+hFqLN8m2eC1qD8xXOAs4CAxtii9QPVY5v9a
         9XJhIUkxG7MCIUu/CUue4BaGYNkVsTfWLcpQtvBwre7+T1sTYdRLrUoERr5gFBZqhQy/
         az06Cr609qzyVbBFeBY4/3ym69uAtQvLI/3xVCyqSX4md5J5VT/Zfpf8Jmt3mOZjkuKE
         attImNAOvQh5NIqDlGlcpMnpN/mra5BhHsZ5rCKMrGn2PnXInqf3J39zVg2+SA158tMY
         XilA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6GXtP/MKsYVB+Yuq2VdD/zUBBXxHDV15Yx94EtKWXWAc52a+3mwmXmhgdtV14QLa3k5A60viRgfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPAQZLbCAWgNuTPwkCMFt3Xi+9D9NRBYwQwlaielEWB7y7adC
	Aig//z2q17D2rGCfo9G+TlhIop9z2InEA2A2ef7HU/LlzrjJWU7G0KMUcTAV6jN87uM=
X-Gm-Gg: AR+sD11s9vIzXyWjOAHuhAD/7I0z6+Rqs/FlkOd5Pi5WzaLTWLgy3tgotAlBGwQAmlA
	KsAoYe3kWvNjrJiA23lzsPA/sms7kMUJF6cQ0VUYfS/mHF5rGz6svM3qAbojQm0Cn3y18yKKXcP
	2zFIyAxqAYKMlSUcyvhqUczAf4OsxJ1ZQuQdYX3Rnescky0coC4nGp3WH80OCz4hGf47CBpudyI
	JRC5ARU0R5oM+QD3uEoOnSA62acV32PklTTxzrVdhzQp0ojTd80pdJrVlmFQVayAxKk4hkMJPKD
	PSB4vIM8k6x2H+5twIVOuHqvgfAfaIb8AhIZYrY+N+J8p6ys8rSa4TSci1szVHBN+sZ+W7PdLyy
	U464+WFK/x21/4JUdWqsJm01ZUAk4hDPpw9EPSBW3FQOtOb79KF5XNmH5BvM59WqQ4acYxdPaz9
	A9
X-Received: by 2002:a05:622a:14c8:b0:51c:7b12:5fd4 with SMTP id d75a77b69052e-5283e012098mr87324891cf.80.1784921736375;
        Fri, 24 Jul 2026 12:35:36 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a280232fsm6175071cf.11.2026.07.24.12.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:35:35 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:35:35 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Hao Jia <jiahao.kernel@gmail.com>,
	akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev,
	mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev,
	muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in
 shrink_memcg()
Message-ID: <amO-hwo8OGV5Goz0@cmpxchg.org>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com>
 <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org>
 <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
 <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com>
 <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
 <CAKEwX=MG0F1+my1krUiOrHCn-Lypq2gq-g8Rv07Mz7sC=YEKaw@mail.gmail.com>
 <CAO9r8zOH93mfdjHq+Ljm7X+ykZS_rjzAvp9OBCzo+uyTbM1fDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zOH93mfdjHq+Ljm7X+ykZS_rjzAvp9OBCzo+uyTbM1fDQ@mail.gmail.com>

On Fri, Jul 24, 2026 at 11:39:41AM -0700, Yosry Ahmed wrote:
> On Fri, Jul 24, 2026 at 11:37 AM Nhat Pham <nphamcs@gmail.com> wrote:
> >
> > On Fri, Jul 24, 2026 at 10:57 AM Yosry Ahmed <yosry@kernel.org> wrote:
> > >
> > > The numbers generally look good, the store rejection rate is
> > > decreasing and we are naturally doing more writeback which makes
> > > sense. The store rejection rate actually increases when the batch size
> > > increases to 64, maybe aggressive writeback is more likely to fail and
> > > cause a store rejection, so that also makes sense.
> > >
> > > The only part I can't immediately reason about is pswpin. How are we
> > > reading from physical swap more than we ever wrote to it?
> >
> > The same page can be swapped out once, and swap in multiple times :)
> >
> > Unlike zswap, physical swap in is not necessarily exclusive. You load
> > the page in memory, but if the swapfile is not full, etc. etc. you
> > don't invalidate the copy of the data on the swapfile. At reclaim
> > time, we notice the page is not dirty, so we just skip (z)swapout.
> 
> Oh right, I forgot about that, thanks.
> 
> I still don't fully understand why pswpin is significantly increased
> with batching here. I would hope that with less LRU inversion we end
> up with less disk swapin. Probably the test access patterns are just
> too random compared to real workloads?

Maybe more time in zswap for those tail entries left behind with the
smaller batch?

That's a 32 entry window that could zswpin with the smaller batch but
pswpin with the larger one.
