Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71679197A7F;
	Thu, 16 Jan 2025 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018627; cv=none; b=Ua79hm740KYJzeGYl+NJwHr8mzeOgD0bg8m5WgE3dwt3deg+NLF2UwZarykTu9oOjgg+uZl2Aefh192ZGUWW4kLiLQ4VWLR0URT4ZpfmJTku4KZpDHT/XpF05LevInog768NP/ulwRd3eYjAka3AfErI3uM2tEUL0WN3o4IesUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018627; c=relaxed/simple;
	bh=TRX5xTgOn7rwL39gnsc2ehzn24I/LA7Kx+VUZmytV8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0w28y9xm+qOUXi6BJqLHZn2sDUoUBGeJcstcSd1rLBHhTKAFfHkJakrS2p9bdPuafHfmB4iucv9ruCvR4fhn0CH+Oxbr4aBk2A1OgI3lcEkkqdklChdEoZ18rL14Lxvshd8TuuwEuV8ln9UPgCEHSfg9Nve9QzaRmCC9WDYILw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJaCAjc4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJaCAjc4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeef97ff02so127408566b.1;
        Thu, 16 Jan 2025 01:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737018624; x=1737623424; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4JyQQHQJLVQEARFvbU2326/Dhgvadbwh58wVTtEmVI=;
        b=mJaCAjc4x5hUZHV5INF/FDwkDn9G1vk9HW+RshNbR71UrRXBCbBFoWyosxG+ms4NoO
         ApCa78OoZ0Dof8C4paeee//2Z7xvJC91vXgxOwYaUzoScstQg3Jop0WSycHSYsgoVFX7
         /4GgwV3o/SUqfZfulthdTnpl/A9NXlCRk5uIwA+CC3lJsLhjUgqYpXj2WxqipsBUaaR4
         /nqX/jqgGHPcOgN94RLhY8zkoPb7fiVW6d1PgbS5PUipH4zzJoCHrT68sH2igCFiG8hw
         QdjSzvAdTP8aG1UtfDNT7pV+2lR5fazYgnyXIh1L/gzBgtezUIHYshRuZ2u8dAW3mERN
         182A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018624; x=1737623424;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A4JyQQHQJLVQEARFvbU2326/Dhgvadbwh58wVTtEmVI=;
        b=QbQA+BPtECvwyxU3woQTKaYM77o0RzCYuAozFLLuko7cLw46orMI+mu56+30KZf74Y
         qMQg2f3PH52RiDJljBB8L0o14mPbX1LHYpiAKPgntktAoimy8VrlwTxrni7R5/gTU0J3
         38loZJtTKEQxCMjPm8X6Y3+/mdyTvpPNzX/6mn1XRLSUj0X84l/NufOw/psEHs0SnT9U
         4Yf/EwxjIxPBaxVBBZ9cvHqVQxSrd9r3UThrunvYYsYr3hDO8A5MmVdyk6NDc6ZGJ+YY
         rYbozMp8ILT8h10FTmEspkPNis4RMgK+c0pb/JnohZ7tyKiaheQdFxU4gfRo7PTbMbqc
         ZLgg==
X-Forwarded-Encrypted: i=1; AJvYcCVsj5dwKYf2vvGmssG+Cnaybc+vulL7jQYrc7ZuRK1jKwjcjDaDDMdWN8sOHEqx+BfW402ObmAe5UXWger6@vger.kernel.org, AJvYcCXaYriYuyKWx+B2SpJagGUPx+uHxqhBREoEmm3RUikf9FDqJ0FaJplYMPuc+pA/yAxN/Wp5iQcpV7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3inMGVjB/OlFfDpz+EBhYnDuf7D6i5njMIfQ22XmsCAqatHM
	BObmCq2NR+8PHhcxgA7z/TVDhmruXqpW+s97lUOWqOapKCOS5vFD
X-Gm-Gg: ASbGncs7GSuLTVojKivzWNONbTLVRsFmlDSAUqrbZD4TgS6ZnfTuAxdKF7qLxP+Qp2z
	QQ4TaEdHqM9tZDNUZDsHFDiHBY8agdIqVUvmBbQwtaDuBR79mmu72iJp2Y0Kl5FiR5fYVqLBVju
	RPVj9zKVm8FlDlZ72n6QmJQPGG4uBw25lBfV0L40njL313w16aVNKoAXOf/Vf8h46bSOKhwwPrY
	CKUdOyUf2fsVHFpA+d8AdQXZ8sBJxEEk1Sm5OpmV5GxfXPqfvkCoMvD
X-Google-Smtp-Source: AGHT+IEgaLbnrjVv6I1Y7EY9cH+2jSO0oSHlg4dYQEAvICQBnLuGdXy6+f6dgsSlEJGV/JBAFg2eBQ==
X-Received: by 2002:a17:906:d553:b0:ab3:ed0:cda with SMTP id a640c23a62f3a-ab30ed00dc1mr1793003366b.9.1737018623416;
        Thu, 16 Jan 2025 01:10:23 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9564857sm889892766b.96.2025.01.16.01.10.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 01:10:22 -0800 (PST)
Date: Thu, 16 Jan 2025 09:10:21 +0000
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
Message-ID: <20250116091021.nm3nmmk2b2sd6hjj@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <20250115025830.pebmoyerkruqtx5y@master>
 <CAJuCfpEvbCJeQDnMqJK7F9dCLX+4_kx3THuRq5yuf5U9oYoEKQ@mail.gmail.com>
 <20250115120532.mgvjhcrzvmmjasv7@master>
 <CAJuCfpEboXys9g2sW4Z7vNkkhW2pS0atJZNU6+JX-Fu7Ntvb6Q@mail.gmail.com>
 <20250116013747.akajp2kdwhmbgq5r@master>
 <CAJuCfpHHt7aF6VOCWyrYrT6ws2X9Kcbr+jT7+L+r+=gbyXQmBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHHt7aF6VOCWyrYrT6ws2X9Kcbr+jT7+L+r+=gbyXQmBg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Jan 15, 2025 at 05:41:27PM -0800, Suren Baghdasaryan wrote:
[...]
>> >> >the case of EAGAIN.
>> >> >
>> >>
>> >> Looks good to me.
>> >>
>> >> >>
>> >> >> Maybe we can compare the event VMA_LOCK_MISS and VMA_LOCK_ABORT
>> >> >> to see the percentage of this case. If it shows this is a too rare
>> >> >> case to impact performance, we can ignore it.
>> >> >>
>> >> >> Also the event VMA_LOCK_MISS recording is removed, but the definition is
>> >> >> there. We may record it in the vma_start_read() when oldcnt is 0.
>> >> >>
>> >> >> BTW, the name of VMA_LOCK_SUCCESS confuse me a little. I thought it indicates
>> >> >> lock_vma_under_rcu() successfully get a valid vma. But seems not. Sounds we
>> >> >> don't have an overall success/failure statistic in vmstat.
>> >> >
>> >> >Are you referring to the fact that we do not increment
>> >> >VMA_LOCK_SUCCESS if we successfully locked a vma but have to retry the
>> >>
>> >> Something like this. I thought we would increase VMA_LOCK_SUCCESS on success.
>> >>
>> >> >page fault (in which we increment VMA_LOCK_RETRY instead)?
>> >> >
>> >>
>> >> I don't follow this.
>> >
>> >Sorry, I meant to say "in which case we increment VMA_LOCK_RETRY
>> >instead". IOW, when we successfully lock the vma but have to retry the
>> >pagefault, we increment VMA_LOCK_RETRY without incrementing
>> >VMA_LOCK_SUCCESS.
>> >
>>
>> Yes, this makes me confused about what VMA_LOCK_SUCCESS represents.
>
>I'll need to look into the history of why we account it this way but
>this is out of scope for this patchset.
>

Agree.


-- 
Wei Yang
Help you, Help me
