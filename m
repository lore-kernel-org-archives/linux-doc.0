Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410141;
	b=4Qv2qoEmqv5OQ9MdVdSSz7EdeuTnFJ0sje9g+NvP8oBtlPyaVX9/bzpDAM0UvL5hr++G
	 woNGmEyzgQV3G80rgsAP0KBThh7phOM6K//p19Gsrv0M6ivZpwaCngtRx/MffGmqe5vbc
	 ASt6pf0vCMpvLqGcnsWl1Qyir3ueNC7C9ql8zUuODD2PXvil5kmtfGTLS8KuqQNJONvLm
	 EJxE/W5ZOZ4Byf1y7CYm4mhzrrea3yS2U6tGrTOauiJfCr3bGwcCweq5ZyYV653EXXvvc
	 U2WiaPXUfNMN3nnJCQgbXq50qc8GuU51GbqUDa+Fkf7Mux0UqQspEVt32p8Rujf1V5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=7MN59RS0FEa8Yt1lpkKUAzp9vOqlc0URHQI/8ivhnpE=;
	b=I10eYnxU8xhR1QCpIgats9gQn573GoOs/9XKnon4u9HcrCwt7CnUQccC8v3gpG8TLuMU
	 67f8B+ZQ0/6+O53odqpDgd5703/igk57+iSwIcnxiGEpgORQVlpnjmtElx1ZCRCUMdXmo
	 UQ4C0TWzT050SH5u+yAiioOoJzKuIzeauX5PtePXuHP6OuMzR/6ZRmIido50+cyPCT4VT
	 1Oli385k5NOc+KO3UqEhW4uOMJ7W9GxP+tEOJwvMubPNOsMyt6cVtH1FUPEGBwRm7rCte
	 0joSQeTvfUEmWSceiDvWvKOHgWGB/uR0JUngPcpqAMsyZshmkbUzNDO2/Rx/vn4Bivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=cHMnuriu;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECF6606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 15:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ECF6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=cHMnuriu
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9905d61449cso935081241.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794410139; x=1795014939; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7MN59RS0FEa8Yt1lpkKUAzp9vOqlc0URHQI/8ivhnpE=;
        b=cHMnuriu35D5Qi8d4jwXyCo+yJbOq8O5/wnsbj8z5kgzAG62f9RgxewWFOBGEpYQTo
         PHLS4egxJkUpUeX4oJ5/h0f70BdwcweRs+kqOw7j1705yAMySPkG6OYnk3E15nqkK6pZ
         SO4+PJjEzAw+MRUiw7TudVY/aXeuVd4zQuFVyh3jDVWaqeRcND8N9WrOJhJ4MEFAzBzR
         8s/mBO728gQ5zQANjHJQNKt668NrAfEw4oAurdlzj6f9QvwLt2bPKRosp3TN3pdMobRs
         jShv/tpmtKfAsuF2vIhnyq3By+Z26kO0/pXGlXxfxdwtL9H/Qus3qIILVW/cz6XCQISR
         2pSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410139; x=1795014939;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MN59RS0FEa8Yt1lpkKUAzp9vOqlc0URHQI/8ivhnpE=;
        b=RXY7OzN5rPPwdFyfCxkpFF5XdZw68M2+pqwV0NzF6gwsoAf/meS8M+YUWkm2Lx1GtZ
         bTQvZUIZLRXjOW2NqpOcTq+2LUf/RI+1sp8dTkst9tznQuoawFLUNjRy2X7Q8fLAtYr0
         RoBbOFOqLs8a/vIyPO8i7hQMppKnPCmRHD1ePJkPjwnW3idy5hq8GQtJ3TGnjdg5NlmM
         6/N5aWijP3OD5b0veohnX2CANwvIpBzqBsJjjHyPnAiMvAGAl+DsD7eZL5b+JRu+mYkK
         nvfWKblU7OmXwCdOzM5N3ZBVumrCRLXGCTjZj2+YaJPHrGvi5la4x9/AK0v60WwUaGte
         mB+A==
X-Forwarded-Encrypted: i=1; AL+hErFbF4XoDR+SazgyVsx/D8xXYFQK8aRs2w8/SYhoTwgYE1fVp8xeBWu6kBiGKNmJ/qZBFE74gHMKkO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xXZp8zgxIAHiDqx/rai2VIyq9rbarND/2Eix3oitgPM0dVQYw
	4cxjXtTG/96hlSwNiClRxD1yrInyfNLTOMBHsNw4/tZv8KiFt5qO7aysLpkIo4/z67E=
X-Gm-Gg: AYBFou07nEWIpFXvEsO1f/PEiljMt5TszicBEEQhbCDeEoy9qufJ6NEZketfbdiDsoR
	QYdCZ1hReUXOOqeriKLeYVuxmfTJYtvhdABrH6HkVf0b/J4YqCuIGqAtXiNfmfcaSp0T+v4IQnM
	J84yFEXHF5pARxxd80kpsmpN7chhE38PR2HLVEZNgCOiPkbSh74vHy6JhLBf5R88sFsAFezJiX9
	q8yp4o0i1yAl/7DuwophiOW5HhRSNvI2kRgAfHNWqvKaiysXn8lJXUkAm043EsDUcf2sJzTPB5Z
	8Q+tOW/Lx2++U/MzwtxtmEPY/urfKE+ehiq4pRXVrLPUfMOwKFtfVxc60l75gigxUtCpK4V0l4t
	UEaOmEIerQ50Wy3rMVe2pMj4VtLkvFMl0Ok1acKQVmRsyPm+l7etjyjwFH9VwWNMOi7wdWyrT5x
	8EbqhFoddaUBU9rvrAUMSGI9mkIjFCoztwi9CCyfraQCojiCQcyGLCJ2/AOSQhtv+PuESXSqRsg
	GTqcjBquxtZqfIV/RY2Fwv4ybJNfelt1EsRUnkfQ+RDeXuqDahe1OoSE/XfyVKo5Uf1E7MbiJL4
	DWGJ8rt3L9YXmC9octkj5Pez4GDFQa8624k85R/LsSX6CJ+Lmn9Es7llLONJXJEUtMbKLKDxRPg
	m3o8afgkdgNKBLzF/8+tKJhNzN2zc
X-Received: by 2002:a05:6102:5cc8:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d505fa8765mr836563137.21.1794410138969;
        Wed, 11 Nov 2026 07:15:38 -0800 (PST)
Received: from localhost (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee1dcd3930sm1185914e0c.11.2026.11.11.07.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:15:37 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 10:15:36 -0500
Message-Id: <DMSHB0JBS5V8.1IZD7WPEQGPMA@soleen.com>
Subject: Re: [PATCH v5 2/6] kho: support incremental entry publication in
 kho_block
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-3-pasha.tatashin@soleen.com>
 <179439592040.425130.12391503339294194908.b4-review@b4>
In-Reply-To: <179439592040.425130.12391503339294194908.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> To allow LUO sessions to be frozen and committed into the outgoing KHO
>> subtree from userspace ahead of reboot, kho_block needs to support
>> publishing entries one by one into a live serialized block chain while
>> new blocks may still be preallocated or shrunk for uncommitted sessions.
>>=20
>> Currently, kho_block assumes outgoing block sets are populated in a
>> single batch during reboot() before the chain is exposed: preallocated
>> blocks are linked onto the chain immediately even while empty
>> (ser->count =3D=3D 0), and reserving a slot increments ser->count before=
 the
>> entry is populated.
>>=20
>> Address this by keeping preallocated outgoing blocks unlinked in
>> kho_block_add(), linking blocks lazily only as entries are written. Add
>> kho_block_set_it_append() to copy each entry into its slot before
>> publishing the updated ser->count and next-block link via
>> smp_store_release(), paired with smp_load_acquire() in
>> kho_block_set_it_read_entry().
>>=20
>> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> ---
>>  include/linux/kho_block.h     |  1 +
>>  kernel/liveupdate/kho_block.c | 86 +++++++++++++++++++++++++++++++----
>>  2 files changed, 77 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/kho_block.h b/include/linux/kho_block.h
>> index 93a7cc2be5f51..a9e696ef3e08e 100644
>> --- a/include/linux/kho_block.h
>> +++ b/include/linux/kho_block.h
>> @@ -100,6 +100,7 @@ static inline bool kho_block_set_is_empty(struct kho=
_block_set *bs)
>> =20
>>  void kho_block_set_it_init(struct kho_block_set_it *it, struct kho_bloc=
k_set *bs);
>>  void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it);
>> +void *kho_block_set_it_append(struct kho_block_set_it *it, const void *=
src);
>>  void *kho_block_set_it_read_entry(struct kho_block_set_it *it);
>>  void *kho_block_set_it_prev(struct kho_block_set_it *it);
>> =20
>> diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block=
.c
>> index 0d2a342ef4228..2813c6fd593c4 100644
>> --- a/kernel/liveupdate/kho_block.c
>> +++ b/kernel/liveupdate/kho_block.c
>> @@ -16,6 +16,12 @@
>>   * array of serialized entries. Multiple blocks are linked together via=
 a
>>   * physical pointer in the header, forming a linked list that can be ea=
sily
>>   * traversed in both the current and the next kernel.
>> + *
>> + * Outgoing blocks preallocated via kho_block_set_grow() remain unlinke=
d until
>> + * entries are written into them. Callers publishing entries incrementa=
lly into
>> + * a live KHO subtree can use kho_block_set_it_append(), which populate=
s each
>> + * entry before exposing the updated block count or next-block link via
>> + * release-store ordering.
>
>
>>   */
>> =20
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> @@ -93,9 +99,7 @@ static int kho_block_add(struct kho_block_set *bs,
>>  	list_add_tail(&block->list, &bs->blocks);
>>  	bs->nblocks++;
>> =20
>> -	if (last)
>> -		last->ser->next =3D virt_to_phys(ser);
>> -	else
>> +	if (!last)
>>  		bs->head_pa =3D virt_to_phys(ser);
>
>
>> =20
>>  	return 0;
>> @@ -129,14 +133,15 @@ static void kho_block_set_shrink_one(struct kho_bl=
ock_set *bs)
>>  	last =3D list_last_entry(&bs->blocks, struct kho_block, list);
>>  	list_del(&last->list);
>>  	bs->nblocks--;
>> -	kho_block_free_ser(bs, last->ser);
>> -	kfree(last);
>> =20
>>  	new_last =3D list_last_entry_or_null(&bs->blocks, struct kho_block, li=
st);
>>  	if (new_last)
>> -		new_last->ser->next =3D 0;
>> +		WRITE_ONCE(new_last->ser->next, 0);
>
> Why this is needed? Docs explicitly state that "Synchronization and
> locking are the responsibility of the caller".

This was done as prep for the kho-ro changes: when an uncommitted=20
session closes and shrinks an unused trailing block, new_last may=20
already be published and read concurrently via kho-ro. I will move it=20
into a separate patch in the kho-ro series to clearly explain the=20
intent.

>
>>  	else
>>  		bs->head_pa =3D 0;
>> +
>> +	kho_block_free_ser(bs, last->ser);
>> +	kfree(last);
>
> This change seems unnecessary.

Leftover from the earlier pop support (unlinking last->ser before=20
unpreserving/freeing it). Will drop this change in v6 as well; I have=20
since simplified the logic so adding to KHO is always a one-way trip.

>>  }
>> =20
>>  /**
>> @@ -144,9 +149,9 @@ static void kho_block_set_shrink_one(struct kho_bloc=
k_set *bs)
>>   * @bs:    The block set.
>>   * @count: The target number of valid entries to accommodate.
>>   *
>> - * Dynamically preallocates and links preserved memory blocks if the ta=
rget
>> - * entry count exceeds the current total capacity of the set, ensuring =
they
>> - * are available during serialization/deserialization.
>> + * Dynamically preallocates preserved memory blocks if the target entry=
 count
>> + * exceeds the current total capacity of the set, ensuring they are ava=
ilable
>> + * during serialization/deserialization.
>>   *
>>   * Context: Caller must hold a lock protecting the block set.
>>   * Return: 0 on success, or a negative errno on failure.
>> @@ -318,6 +323,7 @@ void kho_block_set_clear(struct kho_block_set *bs)
>>  	struct kho_block *block;
>> =20
>>  	list_for_each_entry(block, &bs->blocks, list) {
>> +		block->ser->next =3D 0;
>>  		block->ser->count =3D 0;
>>  		memset(block->ser + 1, 0, KHO_BLOCK_SIZE - sizeof(*block->ser));
>>  	}
>> @@ -348,6 +354,7 @@ void kho_block_set_it_init(struct kho_block_set_it *=
it, struct kho_block_set *bs
>>   */
>>  void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it)
>>  {
>> +	struct kho_block *prev =3D NULL;
>>  	void *entry;
>> =20
>>  	if (!it->block)
>> @@ -356,15 +363,73 @@ void *kho_block_set_it_reserve_entry(struct kho_bl=
ock_set_it *it)
>>  	if (it->i =3D=3D it->bs->count_per_block) {
>>  		if (list_is_last(&it->block->list, &it->bs->blocks))
>>  			return NULL;
>> +		prev =3D it->block;
>>  		it->block =3D list_next_entry(it->block, list);
>>  		it->i =3D 0;
>>  	}
>> =20
>> +	if (!it->i)
>> +		it->block->ser->next =3D 0;
>> +
>>  	entry =3D kho_block_entry(it, it->i++);
>>  	it->block->ser->count =3D it->i;
>> +	if (prev)
>> +		prev->ser->next =3D virt_to_phys(it->block->ser);
>
> kernel-doc should mention that this function now links blocks.
>
> And I believe there should be a paragraph about the new flow in the DOC:
> section.

+1, I will update the kernel-doc.

>
>> +
>>  	return entry;
>>  }
>> =20
>> +/**
>> + * kho_block_set_it_append - Write and publish an entry at the next slo=
t.
>> + * @it:  The block iterator.
>> + * @src: Entry data of size @it->bs->entry_size to copy into the slot.
>> + *
>> + * Copies @src into the next available slot before updating the block's=
 entry
>> + * count or linking a newly occupied block to the previous block, so co=
ncurrent
>> + * readers never observe an uninitialized slot or an empty block.
>> + *
>> + * Return: A pointer to the written entry slot, or NULL if the block se=
t's
>> + * capacity is fully exhausted.
>> + */
>> +void *kho_block_set_it_append(struct kho_block_set_it *it, const void *=
src)
>> +{
>> +	struct kho_block *prev =3D NULL;
>> +	void *dst;
>> +
>> +	if (!it->block)
>> +		return NULL;
>> +
>> +	if (it->i =3D=3D it->bs->count_per_block) {
>> +		if (list_is_last(&it->block->list, &it->bs->blocks))
>> +			return NULL;
>> +		prev =3D it->block;
>> +		it->block =3D list_next_entry(it->block, list);
>> +		it->i =3D 0;
>> +	}
>> +
>> +	if (!it->i)
>> +		WRITE_ONCE(it->block->ser->next, 0);
>> +
>> +	dst =3D kho_block_entry(it, it->i++);
>> +	memcpy(dst, src, it->bs->entry_size);
>> +
>> +	/*
>> +	 * Ensure the serialized entry is visible before exposing the
>> +	 * incremented count to concurrent readers.
>> +	 */
>> +	smp_store_release(&it->block->ser->count, it->i);
>> +	if (prev) {
>> +		/*
>> +		 * Ensure the new block's first entry and header are visible
>> +		 * before linking prev->ser->next for concurrent readers.
>> +		 */
>> +		smp_store_release(&prev->ser->next,
>> +				  virt_to_phys(it->block->ser));
>
> Until now the locking model was "the caller is responsible to hold a
> lock".
>
> Using WRITE_ONCE() and smp_store_release() instead of plain assignments
> implies that it is not anymore, or at least not always.
>
> This should be a well documented separate change.

Agreed. I wrote this patch as preparation for both early freeze and=20
kho-ro: mutations to struct kho_block_set itself still require caller=20
locking, while the WRITE_ONCE() and release/acquire ordering allow a=20
concurrent kho-ro reader to walk the live serialized physical block=20
chain while the host continues committing entries under its lock.

In v6, I will remove the kho-ro parts, and submit them together with the=20
next iteration of that series.

--=20
Pasha

