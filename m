Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B903DEAD2
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367334; cv=none; b=l0JOicbt2T2oX/7QccYsJbHY+rZyO8kZSupW8JfXpnvfh4xdnV3WTddx43k03t+mVjM4psvS3TJOL5HlN6s0dZNxttlG9GQ6t6yr2tGndn0DMMQoSFSC6dHXcqJIJpriRVZgFk/6HD5Z0N1Uni59yCdwoWsAwi5NGdPg4IOo3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367334; c=relaxed/simple;
	bh=vBxAOqpXOy3xBw2jLlc1xHZGLUnTc7rwy+EMZmi2RU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bBOEUB7mxguOHNGTcRMAj7iOT3rRjRrpvdmUvvHGN6BK8+ifVTunsu1RlGQB67Wc8Icxb/lupzbdg+8vuRYqyBgunNSwTLJz/A2KHJkImVfuC1rAkxXwsTPYNqRPxz13eSBYRXoNFsMqiFVXXVdGpzgrvNhP978bTx9jTNWDPRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wjfh450M; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wjfh450M"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a22bf0so1888260a12.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 06:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786367331; x=1786972131; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMcbMXyReyKJIZVlqYCZytsphgwWMjfKxVFVMEfDD0k=;
        b=wjfh450MF/lZ9b81aSP9jT08j1BV6UKDes01K8ph9w9uWjq4UOT04fk7nv8/Adlb4M
         hVkB+bi3kjkQzKZvQ0dHAv2eaSCQdo2a/1wC4Mw9R7KSbvp84NtwoiHL9dNRi0DtQbPg
         8v2IFEucuDZvUghWsLduM8J0oqxSK+yUsoiGwDgLE5QTU9vblK2srySjb4rChYmi44Mh
         +lw1MtdtoY0NDjGUrSENEgqyxA9X09Ph+DiAbJI/WNZ0X9e7YrxZiaW5l/UzFHnyryFa
         9L+lc/8LOjLz49QUNCl6xRC4OJzwW3HgVlZO+tc9Kk9u0qmJw4RGT4a1cA6bP+nWVgeQ
         kdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367331; x=1786972131;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMcbMXyReyKJIZVlqYCZytsphgwWMjfKxVFVMEfDD0k=;
        b=V1qCJQ27uzTSi40CkUQ4HLWWrZ3vZwApivQ61fRO41CWUKAe/wu1Xrl6Q4607EHxsG
         6eaigs7raWlG5Y5C3ZFPR+/J6nJE2UuOp2BDrwnq+QjQHyGZWs3VyHjT0SDIG44cB1mA
         anv0lwGU3PINNPnzaT4+E48tTqPvil9v44U0xAEJh7OAQyJYMYHLEMCerMuU3Wfn/6xe
         DQRzbmK2nWY5aYqSGwUac+V4sSrINC6Sz70xNzmvNdnuYKOmhs3sEkE4HaXFqKSoHNbD
         Ha+hrroDNXNX8jrELfpufKfbTG1nPj4HElU6/suuCWJdESAJK1Spx5UFJwPTjOAT7oU9
         5h/Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro5RY3HUhtlTzLb1YNioP3Px6CFq5fncdUfW/6CVEIarhdoW+PpRVMk0NGrV/4IcAqJSIY9B/WS86Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxweRUzZ90/tTIfQ7xVKIM6m0iDdFsSk16Q77GVegFKRqVk0431
	OZBvrKPCCPlUgTprSnFqTBl4QXVFZ5lBbTPxM+jcTMO9bQ8vFZF4j+eDGwWBf8wGXZ1VXoQihja
	Y4Dcbj7BT8spLgq32SQ==
X-Received: from edbek14.prod.google.com ([2002:a05:6402:370e:b0:69f:da3d:dc37])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5048:b0:69a:a4cb:2882 with SMTP id 4fb4d7f45d1cf-6a355db411emr1046692a12.9.1786367331218;
 Mon, 10 Aug 2026 06:08:51 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:08:50 +0000
In-Reply-To: <CAEvNRgHW0P78eL0ip799XF+2geKwz7MQrjSFTgvCdUAuh9oykg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-8-tarunsahu@google.com> <CAEvNRgHW0P78eL0ip799XF+2geKwz7MQrjSFTgvCdUAuh9oykg@mail.gmail.com>
Message-ID: <9huz7bly86n1.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 07/11] KVM: guest_memfd: Add support for freezing mappings
From: tarunsahu@google.com
To: Ackerley Tng <ackerleytng@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> Tarun Sahu <tarunsahu@google.com> writes:
>
>>
>> [...snip...]
>>
>> @@ -273,16 +284,30 @@ static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
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
>>
>
> Continuing from [1], this guard is actually meant for PUNCH_HOLE... I
> wonder if there could be a deeper refactoring to check when actually
> punching a hole, basically the equivalent place as kvm_gmem_get_folio()
> in the flow of fallocating.
>
> Will srcu_read_lock() be taken in a nested way for the fallocate case?
> It can be taken in a nested way with some intricacies, but maybe if the
> freeze check can be done just as the folio is about to be removed (as
> described in the above paragraph), it would avoid this nested locking
> here.
>
> [1] https://lore.kernel.org/all/2vxzzf0kl3dt.fsf@kernel.org/

Instead of avoiding on remove folio, We can just add the freeze check
across the PUNCH_HOLE, So there will be no nested lock anymore. Nested
lock is just with fallocate populate -> kvm_gmem_get_pfn. So this nested
ness will be removed with this update.

~Tarun

>
>>  	if (mode & FALLOC_FL_PUNCH_HOLE)
>>  		ret = kvm_gmem_punch_hole(file_inode(file), offset, len);
>> @@ -291,6 +316,9 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>>
>>  	if (!ret)
>>  		file_modified(file);
>> +
>> +out:
>> +	srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
>>  	return ret;
>>  }
>>
>>
>> [...snip...]
>>
