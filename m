Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A6034D4E2
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473811; cv=pass; b=KzanYLStngfjwk9pQis5sWEac5NN0z+XQ6dyxKw5WPbQwkFxv6DgEHeP1sx6daSb/bwBIlBTQ39wmln/j5aPru5ksXziMdKMBeuTSjSDZMbIbGckXNnypkq8yvWozYbCTYTye8GOXeZpgCvj2Axil36niqZk/xgHRzBbOK7pEiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473811; c=relaxed/simple;
	bh=jIWEmT2kn3M94mxS9fkvjuBivVcWDJW0vt5Ut0aO5NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBRhKQAhHdsY/hQCRokxXwRJsogBmUFYm/aB9py3M6AMxnwlNk5JH99MehjPE4ls9LY+sUB3kBC9+mZo44soZLCEu/MzhI7VO0Mh5VjJK4zq9yaaCTh7rWkKnjZ3i1qpJeovWpqES6B9KM1V8p/hZER54i4oUTa84dMH+SpMdmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DZA64DGd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwqDQ4DK; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DZA64DGd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwqDQ4DK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777473809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OMHYvLIEZUKpZgFTXwdf+A1Vhw+Yb9KxrwCYQMievwc=;
	b=DZA64DGdgWXti8xJLNZC2ggguxBYSBGuLQvNVgk+rCvKGCFIgFuxUhmDmsKK8H2UaNw3AH
	uJgTOMD2InzPz3v5XkelRMtKexuPV8xEMmvVTw2a9EAM/XXp0/pb76u968ytQ3nSjmrZQS
	DbRf1LhJWfC2pYxvymwp9rQ6ed7b4/4=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-1gknFUFbNTmbZNpH8Hv9Rw-1; Wed, 29 Apr 2026 10:43:28 -0400
X-MC-Unique: 1gknFUFbNTmbZNpH8Hv9Rw-1
X-Mimecast-MFC-AGG-ID: 1gknFUFbNTmbZNpH8Hv9Rw_1777473807
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-65079af1ee9so5847324d50.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 07:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777473807; cv=none;
        d=google.com; s=arc-20240605;
        b=dCKRx7gJFm5sFf9K8+JPRtBodHb+0T6o/3YsVcOX41YBN00y85G+w+yckvgv9I0/cv
         jJbMk3SWWDvG92/abQB2IfoaICn4xD3Yt7XYduymDGkIuvLy4CxlDaAlgkBXS8LHi9d9
         4bu/CUOIjJXaT8KTSwd6sxSYISbnr32yOskF3+vsdBIisOHiB65kWjga47wohcUK8RsM
         ha8W4UtsihHItCDL3DwjhC71pxoEJuyIIeLeNdaaz4FGIHk+r6kRlsCa3SqDBpEGVnw+
         e+auKhC6gea7gPKUkfuDqXFn2uqoXtrg7FxeIxhHFh9W4t2hEQFaAK9bcbgym/SFjxkS
         Zq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OMHYvLIEZUKpZgFTXwdf+A1Vhw+Yb9KxrwCYQMievwc=;
        fh=NoiVQ6tEtcYe96bE6r7GnHzTdZfgSx6Vm2AMTqKm11E=;
        b=ATB+dtkU3E8jIayo++4tWPYVXZugo/wM0x9AUzG9ejspfDJcn36q6Q8ihH8hH/jR+1
         FZNCJVif6ydsEAvXniGDIiPQ1qScv1i7lwWRqvYxiIUZnY8+OtryZrrQ+4FAo0E/J389
         daf38pmoJ1zYssw3YqM39rRWLfKGxSJFJpCLk5lQJ4yG3N0moc83c9wqGUijBJBGcR7x
         oqecwnV+7gW0Er2m+KpOXANhQmOF8hhd+IxQWaNh+S840ATrhlcFWVNRjNFSh1DTDLZ2
         49pWHVxgh7eAOaU+WWCICtufWvAQXy8PGFY/dMLbDx6Mlzzw/bMN0DrzUZBk4MNtgahk
         c2wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777473807; x=1778078607; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OMHYvLIEZUKpZgFTXwdf+A1Vhw+Yb9KxrwCYQMievwc=;
        b=fwqDQ4DKMN3Ms0v5V3Jg0PYkvJsLpyZR70qKVx7Ki/1+gOX9BwJEnH3dkOf2ihWHCl
         gzYI4bLFVfBUiUrpBdyS9/FCGuRpX162h7sN35WieGhK4tbiIQy894/arOAqLoLYu72c
         hT2c+w2CjW+t6tT7dVYQNYql5Y4Um5IYGppvXn2tSnFw7SHAV0msEEkTPjM7nbR0HmE4
         TPQXp+MFPN5WfMMVpFqLX56KL+eJYfRNI64vxoVWD0mUPMSCbbwbEadTutEDYwyJx3X8
         okvY36sEy+fpIeeCACBq7muocSTyTbr9qcuM/Wu9XtJ5tqBAKZ25ejzpUjBG7D7MO16J
         FgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473807; x=1778078607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMHYvLIEZUKpZgFTXwdf+A1Vhw+Yb9KxrwCYQMievwc=;
        b=FM+f4qtdJwEn3+p8KI2HJJRuhNDsmpiAg2s0Dc+5IQ9AT0I3iZI6xL3J3Kt0+XazVV
         ccSrkTECSFwuCCPV+jmKsuSDOixR2/iKhD0bk0iLiMmUouba5u/mXhxeN0dAenffXwHp
         Liy3h5HB/vOY7HjdhaWvvLd78V6X/8Woer2he1ilmZyyHYTIIcn7H/GyTNIkov48aLGZ
         +t0bQ7AV0Dh/Fu6uzEq5ItqbE6FJZXhWzeZeFDQXw9TlbWzEClZvKuG20uEceyhLtjfe
         NjEM/U5MPvO8Wx/VIdv8aEFksytlWOqLF7Jnm86Pb5rM/gjVbKhnC/uze575L4A+tcE6
         hRfA==
X-Gm-Message-State: AOJu0YwomStv1Wa4jiZ7cSwHW1NVodNUacECWZaGKi7K5UaH1+W89j2w
	tgSyj/CsMh390onnnrxdhAYdMQ4RPyvHITq/5nZMKb7RYt1R3n0EhvgAQdg670F4X73KEcbhEao
	xECWoNF5H31aj5JrrmzqyL5cpxIFWk5k/EgHrUXwZwwxV1XYZ+771I/1WCDGnbZ2opBewildJy0
	1muzxmMkpaCi1jqtLk1IW8m4xMQJ2ZbSxRc23d
X-Gm-Gg: AeBDieswJSRBSMYmPV/4dlCvRK2WJTcmQSUJaSeENq+XX7aRC8Hc+jT5ApjqXJxBAje
	1yGjLe9fYdyBD3LrH2WiWthqCriyz3aBtafw4TMPsZfXsl62m8kfNciyCX7jxd+FzLbV1uCRyTj
	8U6NY61oacU9HbZi73FAy/RsO3ewe3cWvkbJFx8djaHBvLhirH/ESfjsSCvZ7ZlWObrrvDmzE6I
	+M8VFz9hRCTp1gQ5kPCP1IRRfobr2I1Em0AfGFISXHXLVzEZZM=
X-Received: by 2002:a05:690e:d58:b0:658:1e1d:b8c6 with SMTP id 956f58d0204a3-65bfb71083dmr3655662d50.44.1777473807291;
        Wed, 29 Apr 2026 07:43:27 -0700 (PDT)
X-Received: by 2002:a05:690e:d58:b0:658:1e1d:b8c6 with SMTP id
 956f58d0204a3-65bfb71083dmr3655616d50.44.1777473806821; Wed, 29 Apr 2026
 07:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419185750.260784-4-npache@redhat.com> <20260420131549.3673619-1-usama.arif@linux.dev>
In-Reply-To: <20260420131549.3673619-1-usama.arif@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Apr 2026 08:43:32 -0600
X-Gm-Features: AVHnY4I1QOeoIsPtdFMRgostIrIoED-4ANNwkr8mXezmIk-ShLJX3AJsP5h7kD8
Message-ID: <CAA1CXcBSic27LKezu05-MNZ__KgKiOu2o=ftWhfCks33ts6pcQ@mail.gmail.com>
Subject: Re: [PATCH 7.2 v16 03/13] mm/khugepaged: rework max_ptes_* handling
 with helper functions
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, 
	jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	Liam.Howlett@oracle.com, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"

On 4/20/26 7:15 AM, Usama Arif wrote:
> On Sun, 19 Apr 2026 12:57:40 -0600 Nico Pache <npache@redhat.com> wrote:
>
>> The following cleanup reworks all the max_ptes_* handling into helper
>> functions. This increases the code readability and will later be used to
>> implement the mTHP handling of these variables.
>>
>> With these changes we abstract all the madvise_collapse() special casing
>> (dont respect the sysctls) away from the functions that utilize them. And
>> will later in this series to cleanly restrict mTHP collapses behaviors.
>>
>> Suggested-by: David Hildenbrand <david@kernel.org>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>>   mm/khugepaged.c | 114 +++++++++++++++++++++++++++++++++---------------
>>   1 file changed, 78 insertions(+), 36 deletions(-)
>>
>
> The old code re-read khugepaged_max_ptes_* on every loop iteration; the new
> code snapshots them once per scan call. If userspace writes the sysctl
> mid-scan, old behavior reacted within the scan, new behavior uses the value
> sampled at entry. This is completely ok IMO, but might be good to call out.
>
> Also might be good to write no functional change intended apart from
> above in the commit message?

Ah good point! Ill clear that up

>
> Acked-by: Usama Arif <usama.arif@linux.dev>

Thank you :)


>

