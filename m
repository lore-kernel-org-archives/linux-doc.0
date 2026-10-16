Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2694041DED8
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136494; cv=none; b=j5u6GDEYvm/o/g5qDVzDTGjBcbi9npLbR975NP0KSemQf52XTR4k79PuPa7wT4QDe8lXv/VlNyBgDWC9H8Uz3MqJmpIi/1wl0KZJFcol4RJ6D1GZA23yUYfI4vN4eE/K0ICPjAE0AdRcEmEGmWZNXXvrMjEgfmlElBbPle2kfUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136494; c=relaxed/simple;
	bh=kPWxjPPGP6jtCzLfvrCUv5Tgos0ZJM+YpPBR+U1ld3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVzv87FdQqiuRfXhqdYW/pqI6fpnIJbz9f6l96wr+DOajbtaJft9rHEk2pNjVHlwwmpbFPU9wdSH15DJVXjBCtvJe9Ysc/6edeNwtuIUvAkC0QodRbIXnkZoi6mDyrw6iShbunDYtNYbPrrevwcKsT1nvtOyU4nxoJ4s62BnV4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1rnitbR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1rnitbR"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1010953f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792136491; x=1792741291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOTRRbTqkUt5QQM9REwuEs6V4HIikB0VLV6DTKCbGLE=;
        b=q1rnitbRaE98pF2VdWAg2pjRgF6e2LmA6favMjYHCAxzmstcG1l7dpjpqfmh4LNGOT
         mxNYPixaPt5l7oJKEar8oVUVFFbdGHLy7LbwVpU6XeZIavWgVEfH4Zmdwtq9AuXe+u5p
         CoWT93CeYbEtVC+jp4Msip4mseIjvpepGHQyVsEHRfVI0P57+KTtKza7URwALH5qFbU2
         XtxPc4S+XI2wF+SrM8EqCpUTg2gAHPchhhNpXh3UFfCXreIT5+3o3l5xmS5M2FUacqpQ
         sngDv/M5vpT9i5RsuU+pH5/QUZLvYZRwNDKlQK01P4/4ll23OP5xE/O6tnlz0JPERvRT
         upSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136491; x=1792741291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOTRRbTqkUt5QQM9REwuEs6V4HIikB0VLV6DTKCbGLE=;
        b=WzcXI+R6hmQXN/w2L87D1C7tk+B+3gXMrCEkvlLIeD/lVeI9hjFUGTJ5mhp4WgxnHn
         aptTQrkMESuzjVv96Gs64l/LlLaO8ylL7fpdLmaGQmL/98X9SvpJZoCXjhQK53NJiXWs
         J2JOwmiFBHmU/l7eWsvtzJD/T0bkw8hZfv3V7gcNLjedAEqZhYhp/9XeILw9LBoDEKNb
         ctUAGnoAFs4rT02i8oyye0itmAVaWufN4a5UUW6uNwihWsTawe9Q4Jq8IAdRL3BdyWaN
         sd9uj5LEyjcoNxA68EPfZLPqGYtq9bLFrqcQ9GmnwqWhnQ59oWKIrqwp1TpX2+BgUZkj
         pkww==
X-Forwarded-Encrypted: i=1; AKwUvBxV9ezaZTGYyP55G6Rya3bRGOqt6Qo/E4UpRKhn5KhIoXpg/l72jDro0doJncNnNeK5KkkqX90eYVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfxGrkwaN14zAtzmO8/RcT5eTJJYvRYT36jb5r6olHPpSpKkN8
	v+Pm+wyYqOq6Kdxu+RzCi+C3WvyuKw64rubYoBxvKpveWH/PTo9KvI4U
X-Gm-Gg: AYBFou3KpA/0p8yG5L/dV+GP/qXpeOCgyso9yGh8zocvpchKrGvuamthtTfUUMz/EOF
	pyMOeqmLE48LWMnxcdqgmPfMWTkBL6X6rCRFKMKRsyKv4UUHzrAu3q0B5SuRXYnlrQ8+WTjH01j
	NkRwqPDcMXOC3c7gpgpNS5Uia4pllhZh1JkxsySCFBCfDJaIzAKzxsJ0rhEqBGfcLijLYeYOSmT
	dhuRWrYrmQQXCoJ05XGCge5OnAkKjzvSVA5JNDFcEBU80M+OsAXX/TiZh3+bdCIkyip8fNbtVYX
	qVor7y5U8bQUO6D6NSIsotEXRn3UKL0EKdkV4KcFngenuUOqvY9MXzRqwojyJIylcwB0BGymsBu
	V/i2EMcph7dhSeuQrVQqr4h0G6IkEobfFQmsrs7gd4XKB2k8JcB5lwHQG5dqy85TYFNPL8k9x5+
	DMgeW/wDK9EC84qdytRORjY+NgMpw8HB5dFmptCp/9CO85yFvPWQrAULlpTEUZfAH7a4jVNybru
	il1/CBp58gqzQDM0CM1AHZedFkqdUeSQlK3Ouh2HVXdfFluCE4=
X-Received: by 2002:a05:6000:178a:b0:48d:fd4d:7fbf with SMTP id ffacd0b85a97d-48dfd4d8272mr3048376f8f.4.1792136490979;
        Fri, 16 Oct 2026 00:41:30 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm2822036f8f.7.2026.10.16.00.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 00:41:30 -0700 (PDT)
Message-ID: <f5548d05-5aec-42d0-b9d9-c14fb575dec9@gmail.com>
Date: Fri, 16 Oct 2026 09:41:28 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vma: avoid spurious write locks when mm->mm_lock_seq
 overflows
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daehyeon Ko <4ncienth@gmail.com>,
 stable@vger.kernel.org
References: <20261015-fix-vma-lock-overflow-v1-1-01beb245d9da@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261015-fix-vma-lock-overflow-v1-1-01beb245d9da@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/26 10:31 PM, Lorenzo Stoakes (ARM) wrote:
[snip]

> The reset, performed in reset_vma_seqcounts(), only needs to WRITE_ONCE()
> the value. The stores follow the smp_wmb() in do_raw_write_seqcount_end(),
> so a reader observing a reset value also observes the VMA modifications
> made under the write lock.

the writer side looks fine, but what orders it on the reader side?
raw_read_seqcount() is just an smp_load_acquire() since d0dd066a0fa2,
not the smp_rmb() the comment mentions, so the earlier
READ_ONCE(vma->vm_lock_seq) isn't ordered against the later vma reads.
couldn't a reader on arm64 see the reset 0 with the old odd
mm_lock_seq, pass the parity check and read stale vma fields? would
smp_load_acquire(&vma->vm_lock_seq) be enough?

[snip]

> Cc: stable@vger.kernel.org

the parity check relies on e5e7fb278e59. before that, mm_lock_seq only
increments on unlock, so locked values can be odd or even. should this
be limited to 6.14+, with a note that older trees need a different fix?
a straight backport of the odd check would ignore write locks taken on
even cycles.

[snip]

> +	/*
> +	 * The VMA seqcount is always odd if locked. An even value can only be
> +	 * the zero stored by reset_vma_seqcounts(), never a write lock.
> +	 */

vma_lock_init() now stores 0 too, so this isn't quite true, is it?

[snip]

> -static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> -						    struct vm_area_struct *vma)
> +static struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> +					     struct vm_area_struct *vma)

is dropping the inline intended?

[snip]

> +EXPORT_SYMBOL(reset_vma_seqcounts);

since it has to be exported for the inline mmap_write_unlock(), would a
__ prefix make sense, so nobody calls it outside vma_end_write_all()?

I tested it on x86 in qemu with KASAN, lockdep and DEBUG_VM on top of
mm-unstable and saw no issues, but I'm hesitant about the points above.
happy to give a Tested-by on the next version :)

-- 
cheers,
jose a. p-a
