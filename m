Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FF929A1;
	Thu, 16 Jan 2025 01:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736991474; cv=none; b=i+o91181bJI8ZWGli18juCg8fcOIThpV7RfOyYVlbqXiUo49yJ2qVkaq7dbo/y/Cum4f2H5cXpTGHwkajDhMu43a0rAYrY95MEPQi9+9XTivgMxTxhkeqsJG4SACA8tAniiKFG6SireGLK/EcO80jN/0UKA5yWOv3TIlPR7eHSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736991474; c=relaxed/simple;
	bh=4yT/AIK6XJAu7XrfFtI3SaT45D05AYrbss/TM+y1e8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRyEqCV1YGrybGVIAmCq4RWUgUZ64HKRj8zzzYVSsHsADQsJ1FfOrFXfO8zvzMM7KjN0WSygaF34SLkvD6xhmBzP/CFlDR8jsz18C9M7fXC41XmzF2RpbjUtmP2JmFQ+u+RYdfcuGtaKRpFwwdSWIpDRyqY2NMp8GA/ZKRAgZwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6HcmPqu; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6HcmPqu"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso768173a12.0;
        Wed, 15 Jan 2025 17:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736991471; x=1737596271; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+gLW5ffMlLJHnHlMar0htIKFbkF7g4jGvufIPYktGs4=;
        b=a6HcmPquk1iqktxPRYtX1K2UgKHl8RBPcArFpSL6Q3qZIW1ijSI/h7oKNkEuqoa0Rf
         4yjqygInCZW0JOFizbq+svzLggpTPSgs8Vxk2V7/9bJdzD5luUzKa82vupushkMNqcT8
         aHBLlNyk0t3KunXRy1ChSc+8PaPzVQkH79RnJ+z0bkPzwIamx1O2ZgsmGQvbHnHUWZ5t
         eQ53/O6MrxHpTIK6vWe0qSEZHMbUofUURkFDo/QxruYKCzUavA+vXIBMs1us3V4e8MHw
         fLICZyz8sv7smktHs0VgIXK7G5mdHlAKMYd8LOv5uEIK57guG1ZKmzT0JTbk6W6A3p6o
         dFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736991471; x=1737596271;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gLW5ffMlLJHnHlMar0htIKFbkF7g4jGvufIPYktGs4=;
        b=mQjkfD0jj0Z4CLdw2etbyZz2L7uEfs0A9DCuJII0EMmZSuD86o/DMWtyxnsm00oOh6
         XH24qWIOy9sxrclXyctIHpwl52lBmNI2ys2jsATRWSC3BHUW1Up+/5eMmt3UIqoNmUY1
         LPN3MQyEDM4kwd12yMAPx2fwQAtS1DfUhs65pzdrVD3JhfgHP4GU3cIWjiGrQTS9toFO
         fCGNzSICJcOND5wiEPZpoLCSx5YAetGu/UrblAL9esgIIbimiBkuNbcijvkTmaUTJKsF
         qTpn24DC2TQEglvIarzldt67p7TlKdI+IK/tb2WD4PphaH7QKKHSYUz+mXhcrRbJyOnr
         B1eA==
X-Forwarded-Encrypted: i=1; AJvYcCUiPnlpBpxsbbG5Pen8+fgfsBIAshoOG0HeKX/9AAdcBvY7ESQCercjeKTnY0PoeSAaDRiIWP1G3Yo=@vger.kernel.org, AJvYcCXKP5L9jmau2o5ZAp1Qv9JnGOLQjh0Op1Qip98pTxinssjgQodyebWSuDUGaIY3T7OAmk1VHUcADlSpZghf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9a+L/HKjD86YBzwjoNL7TDWmX8CkfBBijn/m3qTt53vVI3JUt
	FPdkdudLqlzRPvhJpE4Omn/iVX4HdCe74M2IYiI1+dqHG4MukB4M
X-Gm-Gg: ASbGncvRfReDb+ieveVhz2tiAVPgcaLSOdP4DZioj9jteccLXNumk+TO+Cv2tOGaMtA
	bmYoCIVvHqEtHxir6BgZ8YOQ5uoplcwi4VLcUz1ndJMbw19TbUzApQEnLcujdV8JHBgs7GcTdHS
	X0WCrxs7WXlvlZpFghKthKyCcdI6u0tnlpkAx4qOT2Lr2clxkbMfLo/QmwgpuWShO3yuf6vQg5/
	T5pcNmd3vZSgbLBvP6favGAoDcdg8UnWXaKrTUc7lJ3UmfTO+kd5nZh
X-Google-Smtp-Source: AGHT+IHHwk40aGVXkXnzgu8FYr8Kn0JAnVq8YIrAZEO4dENABUgiNmiNYFSaIZHau0A+O70KQ0UxMA==
X-Received: by 2002:a17:907:2cc4:b0:aae:ec01:2de4 with SMTP id a640c23a62f3a-ab2ab5f52efmr2780226666b.30.1736991471104;
        Wed, 15 Jan 2025 17:37:51 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905ec4dsm828953866b.35.2025.01.15.17.37.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 17:37:49 -0800 (PST)
Date: Thu, 16 Jan 2025 01:37:47 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250116013747.akajp2kdwhmbgq5r@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <20250115025830.pebmoyerkruqtx5y@master>
 <CAJuCfpEvbCJeQDnMqJK7F9dCLX+4_kx3THuRq5yuf5U9oYoEKQ@mail.gmail.com>
 <20250115120532.mgvjhcrzvmmjasv7@master>
 <CAJuCfpEboXys9g2sW4Z7vNkkhW2pS0atJZNU6+JX-Fu7Ntvb6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpEboXys9g2sW4Z7vNkkhW2pS0atJZNU6+JX-Fu7Ntvb6Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Jan 15, 2025 at 07:01:56AM -0800, Suren Baghdasaryan wrote:
>On Wed, Jan 15, 2025 at 4:05 AM Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> On Tue, Jan 14, 2025 at 07:12:20PM -0800, Suren Baghdasaryan wrote:
>> >On Tue, Jan 14, 2025 at 6:58 PM Wei Yang <richard.weiyang@gmail.com> wrote:
>> >>
>> >> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
>> >> >@@ -6354,7 +6422,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>> >> >       struct vm_area_struct *vma;
>> >> >
>> >> >       rcu_read_lock();
>> >> >-retry:
>> >> >       vma = mas_walk(&mas);
>> >> >       if (!vma)
>> >> >               goto inval;
>> >> >@@ -6362,13 +6429,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>> >> >       if (!vma_start_read(vma))
>> >> >               goto inval;
>> >> >
>> >> >-      /* Check if the VMA got isolated after we found it */
>> >> >-      if (is_vma_detached(vma)) {
>> >> >-              vma_end_read(vma);
>> >> >-              count_vm_vma_lock_event(VMA_LOCK_MISS);
>> >> >-              /* The area was replaced with another one */
>> >> >-              goto retry;
>> >> >-      }
>> >>
>> >> We have a little behavior change here.
>> >>
>> >> Originally, if we found an detached vma, we may retry. But now, we would go to
>> >> the slow path directly.
>> >
>> >Hmm. Good point. I think the easiest way to keep the same
>> >functionality is to make vma_start_read() return vm_area_struct* on
>> >success, NULL on locking failure and EAGAIN if vma was detached
>> >(vm_refcnt==0). Then the same retry with VMA_LOCK_MISS can be done in
>> >the case of EAGAIN.
>> >
>>
>> Looks good to me.
>>
>> >>
>> >> Maybe we can compare the event VMA_LOCK_MISS and VMA_LOCK_ABORT
>> >> to see the percentage of this case. If it shows this is a too rare
>> >> case to impact performance, we can ignore it.
>> >>
>> >> Also the event VMA_LOCK_MISS recording is removed, but the definition is
>> >> there. We may record it in the vma_start_read() when oldcnt is 0.
>> >>
>> >> BTW, the name of VMA_LOCK_SUCCESS confuse me a little. I thought it indicates
>> >> lock_vma_under_rcu() successfully get a valid vma. But seems not. Sounds we
>> >> don't have an overall success/failure statistic in vmstat.
>> >
>> >Are you referring to the fact that we do not increment
>> >VMA_LOCK_SUCCESS if we successfully locked a vma but have to retry the
>>
>> Something like this. I thought we would increase VMA_LOCK_SUCCESS on success.
>>
>> >page fault (in which we increment VMA_LOCK_RETRY instead)?
>> >
>>
>> I don't follow this.
>
>Sorry, I meant to say "in which case we increment VMA_LOCK_RETRY
>instead". IOW, when we successfully lock the vma but have to retry the
>pagefault, we increment VMA_LOCK_RETRY without incrementing
>VMA_LOCK_SUCCESS.
>

Yes, this makes me confused about what VMA_LOCK_SUCCESS represents.

>>
>> >>
>> >> >       /*
>> >> >        * At this point, we have a stable reference to a VMA: The VMA is
>> >> >        * locked and we know it hasn't already been isolated.
>> >>
>> >> --
>> >> Wei Yang
>> >> Help you, Help me
>>
>> --
>> Wei Yang
>> Help you, Help me

-- 
Wei Yang
Help you, Help me
