Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F47385D88
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225379; cv=none; b=bZDCe547xuUFYNXniTaoO/ivqKc9wr55p5sZkoUfIabYEooPStUgsT4vtzQm5nwSAvRw4teDbTLGP9mPj35YPg8Iemhp9F18TWMVPj23zHsNpS0HYQaAaYaqpO0DLpCEkKMM7mQ1L4F84yPnwV90+YxbTch0CpeK5kGboDQbIfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225379; c=relaxed/simple;
	bh=5xvJLFBWrKv1sutwBIRV98gtnRKv+wh/VKJT/0ccjr4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kEqQT6Benah1qFbCDzwvhu4ATKBN6POmEFJQDMQCHg2R6TFCITveLcx1MrB7AsX+cDYbQHZt53Gtgcu8dEuPymQdHmdC6T2vnXJfC45PGh5cj5cEQ47zh1engj/pvX7kFkeOJqTQeyrW/lyvQNB/kP+aSJecvcSRMfagbRaQDKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CXuqAejG; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CXuqAejG"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-69604dfdce2so5444413a12.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 07:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782225377; x=1782830177; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OZXZwKtoljMf9sP4FScDU2dpLN9WIG287qbX6i42q1U=;
        b=CXuqAejGzp0unjUFAJRdkn6EWQjX47AwnVwl0Xkt58ewqEwmET0IyM2McWp1oRjKeM
         /gkfUST/DEtsJc4XPbX1SvALO8h1E1jCvUtMBUx0ie77o/9fvzlih2fBuu8h4MYwmvyJ
         BzrdAGi+xEHY9/y9myK+HfKZCjgaDfFnF1i/OoLuGtFK928gu5EmKM8Zk9yH3aU5g6J+
         YTmxV4/i6hnNZlp59lTkTyHT4e5n+1l4SClNQePcmTXpZoYkv+ceh/8rfGV+JqSqXUg7
         /xh9usPoz+ZX0ElnUTse+9bqHJvxu89UzaOt5mtTuvxYX1+hDH04H6/COV06T0JQA8o4
         GXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225377; x=1782830177;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZXZwKtoljMf9sP4FScDU2dpLN9WIG287qbX6i42q1U=;
        b=crrG6WvT9jPItu3bAG2gyuEBfQRNx3CNaiCUbszb0tVi31obT2nPKtYPfs2S/ovw88
         VzhTMfzwbFlQfIa07gaAKkNHFhe88xZSerWT54tS09kxll0W7FtmwEcGIYy7fJ7ctqjT
         F3hRujJnuHzUqYC/YwgRdioZbguGu+Q6uksmMaFC590nWeor9JfOysS5sY+m08a7lNd6
         3U0i5vMvMdM+97OjkfNZjx5Ro/h7TpW+MtJXeu5ENs++012XVI4CIvWlwIbsajy2t5I2
         W1Y0ie5we7liJRdRfCaDctexB4iPS83AZriAylAhHLWRDhrMDW7uc3CI5Uwm8re6FuVA
         eKiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1aVnZ4AdwwXBF+aoUrt3qPU7tIAWGfqyFjY8mvIvxhmIXtBH2q3PB40z1UopVjuMS06MBC3zDNXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwodP+uuT+WDkuLoxjDQNbFE199TX8HlQLQzG0UG14RBwsb//Rj
	n+mYlHigxV0OnYMlJ6RGI0SVcfgROiNrkwojWSVZYI+0yETHGGSLe4fbSqY4O0J6N7q3NHMmKz9
	SoPZ8beWuAP6qaQo1sQ==
X-Received: from edaa1.prod.google.com ([2002:a05:6402:24c1:b0:695:df16:96c6])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:510a:b0:697:e953:d14d with SMTP id 4fb4d7f45d1cf-697e953d492mr604080a12.17.1782225376632;
 Tue, 23 Jun 2026 07:36:16 -0700 (PDT)
Date: Tue, 23 Jun 2026 14:36:15 +0000
In-Reply-To: <CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1780676742.git.tarunsahu@google.com> <48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
 <CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com>
Message-ID: <9huztsqtmihs.fsf@tarunix.c.googlers.com>
Subject: Re: [RFC PATCH v2 06/10] kvm: guest_memfd: Add support for freezing
 and unfreezing mappings
From: tarunsahu@google.com
To: Ackerley Tng <ackerleytng@google.com>, Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, 
	fvdl@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, aneesh.kumar@kernel.org, 
	skhawaja@google.com, vipinsh@google.com, Pratyush Yadav <pratyush@kernel.org>, 
	david@redhat.com, dmatlack@google.com, mark.rutland@arm.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, axelrasmussen@google.com
Cc: linux-kselftest@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> Tarun Sahu <tarunsahu@google.com> writes:
>
>>  static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>>  			       loff_t len)
>>  {
>> +	struct inode *inode = file_inode(file);
>>  	int ret;
>> +	int idx;
>>
>> -	if (!(mode & FALLOC_FL_KEEP_SIZE))
>> -		return -EOPNOTSUPP;
>> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
>> +	if (kvm_gmem_is_frozen(inode)) {
>> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
>> +		return -EPERM;
>> +	}
>
> fallocate may eventually go to kvm_gmem_get_folio(), so that would check
> kvm_gmem_is_frozen() twice. Is this meant to catch the punch hole case?
>
>>
>> -	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
>> -		return -EOPNOTSUPP;
>> +	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
>> +		ret = -EOPNOTSUPP;
>> +		goto out;
>> +	}
>>
>> -	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
>> -		return -EINVAL;
>> +	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE)) {
>> +		ret = -EOPNOTSUPP;
>> +		goto out;
>> +	}
>> +
>> +	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len)) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>
> There's some reordering here. Why not let the validation happen like
> before, then check kvm_gmem_is_frozen()?

To align with design. "stop the fallocate call if inode is frozen, No
need to go further". I dont have strict opinion on this. I am fine with
taking it across punch hole as well to make it more fine grained. But it
will no longer claims stop the fallocate call (allocation one is stopped
in separate path: fault path) , though functionally it does the same
thing.

WDYT?

~Tarun
