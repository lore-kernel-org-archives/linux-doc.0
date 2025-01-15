Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5C2475CD;
	Wed, 15 Jan 2025 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736942737; cv=none; b=R+DeV7Y6v8t9MO5Eh4Fpl+colmDMJilfqmtMWMzRYPgZCrYFIG4EtzmGJgGOSHEeQ1ZF4yiNTAyzSQFLidajap6SbN5igKs8g3I5KDG9MkwzNPxk8xqIziw8fvXiDXTHNBlifLipz9+gCuGTuD9mwHn7OWYfF0rCPtAipr+90Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736942737; c=relaxed/simple;
	bh=4WKFxTI1xoFiofNVust4gtBKtkrlfQdjRigN2+JjQFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz2SsWwI0ROp9dbbWU207p4KLeZBrX9Y8pJnQciID2Bg6eeyJbyK93XG9+HMUJ18njOliMg+ZdyTrIzWB389kXZfxG8DFBWS5alTSFYUSqO0ZwZpZnz+UZaMtQlYWSc5O8VdB3bjM+0oN7rM3fgVhhGmp3iUmH7z2pHTUICLlnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtWZWJ5b; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtWZWJ5b"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso1135112466b.1;
        Wed, 15 Jan 2025 04:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736942734; x=1737547534; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=49MRHwBd9IZJd9oDgHL9CQcP08I5tNHiDFCh2rJXQFc=;
        b=OtWZWJ5bTEzvmsajFtIjDOxnsqMqTNJmJh6ae5+rxNR3tTXJVPrdSraY7w8jdmPOkk
         ym2Kpivf07Exu2PqDhoQNNR5br/r7xbQbC73pG2Ckfta7ASriAIooG1NC5lFhoaIXDU1
         s8f6H1jecdEUhB9UyNotoj3phFg4iHduTAysWu93w27lIVinv1j+Xok4MVkTCY+Rned1
         Z0wOA7vvX0HVd+Taen23LIBUgoyjQfvYl6LY4PphrYcINZZuCOjmkD7yVTjezN54B8u+
         VLSAQA3WSt9+6Co0WvFMcfO+RChHIjKnu2C8WooH4V0SSkLTOqYKl3pSJLGH+6mcMTcj
         Sl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942734; x=1737547534;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49MRHwBd9IZJd9oDgHL9CQcP08I5tNHiDFCh2rJXQFc=;
        b=I4i2EP4JwhbK7hn1ojPaSS57hWIRQEpeL+3SLykAPw/uWFxe9UVc9A2vMXXP7VCL0F
         qjVl1FqWNna3GDY/fClEFovnGhdfnD+GriRs1gJFEzeE1nB0XmyGUPxPWwWvD8Nla3ik
         V2MaJfU0cVF4Ubrkwcr8HcagSXvsklbKr36sE5JQ7BxCclQXQ3kfsayhkro/3ZLT6V9+
         I6DrUhMareZ7m4qwcB/dh4nejtgjhU0he+nZTW+pYqyDE6DY/S5PW41DEV6arnQFbyY2
         Z7xREH5Mm24yXp2teiZP0zzPg1vVoaj1VBnKSTOFtrNCxpQIJZXzuHjKTEE3Tbawld1b
         fzVg==
X-Forwarded-Encrypted: i=1; AJvYcCU61OOjbasc710IY3+9MlHYeXc9fkwO6BXaNLxOZZg2Yguqz6lFo6+CKiTuYyfewD5flxrtSLDDkoVeNYCD@vger.kernel.org, AJvYcCUT4FO2IVQ6iJbzRDYnUtXyF1u1jnm5+mX6uDfL3S5noxPeiGu1QCj9bIyuUmXkPuJB5teTOXAKino=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUtXbIoswFa2PSyBFRcP1CYmnO93qF+3wnss1e97KjGxvRr9ou
	x8RZmKFUzIKAy/J7ZToqN9aFTMwsrJeYcMEGGTYi7OgwkriCNedMHzQRNmnYvPM=
X-Gm-Gg: ASbGncs/nT3HzZxJQQiibv3SWJoHRc00bWatDHdepu08Zc3KDf03tB9v2QsbfEG3iAi
	lvNki25USho5R+x8K5Rawz+Md3FKgszyosQjEWu687NYv5t3IFwHNndRQ4PZYRCxrLJpwObezGO
	wOwP6GDfMiV5KA60Xigv5O2Kpq1iou05nfXrI/xB83aVt3lEYFze3fiMtd5W+85OSktNJmQZwyL
	sDyu+Bf2cOBtRkKe9KF4y+sVQr7tS7KhpIX76Sk8dNcrYffWF42tZhQ
X-Google-Smtp-Source: AGHT+IFJcZ5FVGw0uc+CgabUI5s3STezu9lMtBNc/pf58S/1xZ/lgQcNF8hv654Fd3SMxEAMqY9SOA==
X-Received: by 2002:a17:906:2990:b0:ab2:ea29:b6 with SMTP id a640c23a62f3a-ab2ea2905d2mr1655191366b.35.1736942733599;
        Wed, 15 Jan 2025 04:05:33 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9646bf9sm752754466b.175.2025.01.15.04.05.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 04:05:32 -0800 (PST)
Date: Wed, 15 Jan 2025 12:05:32 +0000
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
Message-ID: <20250115120532.mgvjhcrzvmmjasv7@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <20250115025830.pebmoyerkruqtx5y@master>
 <CAJuCfpEvbCJeQDnMqJK7F9dCLX+4_kx3THuRq5yuf5U9oYoEKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpEvbCJeQDnMqJK7F9dCLX+4_kx3THuRq5yuf5U9oYoEKQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Jan 14, 2025 at 07:12:20PM -0800, Suren Baghdasaryan wrote:
>On Tue, Jan 14, 2025 at 6:58 PM Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
>> >@@ -6354,7 +6422,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>> >       struct vm_area_struct *vma;
>> >
>> >       rcu_read_lock();
>> >-retry:
>> >       vma = mas_walk(&mas);
>> >       if (!vma)
>> >               goto inval;
>> >@@ -6362,13 +6429,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>> >       if (!vma_start_read(vma))
>> >               goto inval;
>> >
>> >-      /* Check if the VMA got isolated after we found it */
>> >-      if (is_vma_detached(vma)) {
>> >-              vma_end_read(vma);
>> >-              count_vm_vma_lock_event(VMA_LOCK_MISS);
>> >-              /* The area was replaced with another one */
>> >-              goto retry;
>> >-      }
>>
>> We have a little behavior change here.
>>
>> Originally, if we found an detached vma, we may retry. But now, we would go to
>> the slow path directly.
>
>Hmm. Good point. I think the easiest way to keep the same
>functionality is to make vma_start_read() return vm_area_struct* on
>success, NULL on locking failure and EAGAIN if vma was detached
>(vm_refcnt==0). Then the same retry with VMA_LOCK_MISS can be done in
>the case of EAGAIN.
>

Looks good to me.

>>
>> Maybe we can compare the event VMA_LOCK_MISS and VMA_LOCK_ABORT
>> to see the percentage of this case. If it shows this is a too rare
>> case to impact performance, we can ignore it.
>>
>> Also the event VMA_LOCK_MISS recording is removed, but the definition is
>> there. We may record it in the vma_start_read() when oldcnt is 0.
>>
>> BTW, the name of VMA_LOCK_SUCCESS confuse me a little. I thought it indicates
>> lock_vma_under_rcu() successfully get a valid vma. But seems not. Sounds we
>> don't have an overall success/failure statistic in vmstat.
>
>Are you referring to the fact that we do not increment
>VMA_LOCK_SUCCESS if we successfully locked a vma but have to retry the

Something like this. I thought we would increase VMA_LOCK_SUCCESS on success.

>page fault (in which we increment VMA_LOCK_RETRY instead)?
>

I don't follow this.

>>
>> >       /*
>> >        * At this point, we have a stable reference to a VMA: The VMA is
>> >        * locked and we know it hasn't already been isolated.
>>
>> --
>> Wei Yang
>> Help you, Help me

-- 
Wei Yang
Help you, Help me
