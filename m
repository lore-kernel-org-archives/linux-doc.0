Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9B3EF661
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146833; cv=pass; b=c3K0JO7b+5nPfcWHY3yiUdxcV/mdg2hVynNjUP8sO3jMbljlhEtFDu8mn628RK2qsTL2bi3k+cXNAt/xOLBlMyRIFN7q4NzWEy/50SwaJ8+m9SuTW+ovZRkPGz1u97Cycme1xp2Yt++AvN9o+I3Yc9mVe0YkvgUO/A2V63Cxu/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146833; c=relaxed/simple;
	bh=j18XohxzMi25YcB7luu3u4i4Qqa/vIrjWdtPngyhd4w=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB0+nQ8Tp68ZR+O1JXVv09Yvqwa3QOeUqmz7t6a6TjlIR9cI2maNyUWYmHREkYI6w+neJjtHCeMTkGzN/jZ+RZt8yOBuWyTskyWtISVoRK+ZQM/WnuXTjCdP+oW9f5O1JHpzkU7Yc4yAXlv2fzftU7pxoTeYPLVQCL5VaMbLQ6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AZyuTiMf; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AZyuTiMf"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9519e97c01aso334086241.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 09:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775146832; cv=none;
        d=google.com; s=arc-20240605;
        b=cK3kQP1BAmp2SU67T6yBUB79GwZ5j9sWNdZzWhyH3OnZIQt6mS2+kGiqNpiUmUQmLA
         Fhg6Ip17li4c64CldDTZRzSlYwPL2O/hJ3ppmmQHxjCQcMc9qvHPG3ZMrqeROlHTQcwQ
         us9lvV6kjwxZIqq4osn+fsEkidQRGbfHPFoktVfd3MuCLrr5Nr0EvBWuBBmADdCwco7U
         eR44kQyZZB8ipcQXRH8j7kUAKX28z5CHhJhKwIcYXzUVo2N0RFv3OXrGWTo2c/dyuckU
         owyfFdX//WD/STp4pXeEZOiLuzF3ydxbaZcNR+rWM23WYmRpJkfm+gYuOCLxGATtoP5J
         5JUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=XABnzafTexu8r9STfdSEhkFwL2mOaywT8y1TwNRcZwM=;
        fh=5kKD7ao5Kjkt4oVeKnCH0eecb1chQc+puMuVSE+qHB4=;
        b=O9c2pI1BrCYdVrDS/dMKOdA+G5dPatDb4DXt6Yf5YwgbQs8pKvV89DdEgwUBGhZctr
         i3acH/0guTZXvrtqMeoPSpI0RZG5+ub5dsaPKqLk4u9D8uh8sL+rpB/XqrIgHuU3E/lK
         KNGuoAHXAk9JYIb++biMy5mJFfiayMBc9+VvD5bIinKYLY7cM1nlvzRuyDpPl1dlMzh+
         KXvYbbnR91zLWaWqigwjM3K5ZiJyak3PBaC+B+EYwoGe5hbFbx/uh/SPJFCAos90zkaD
         CXGJQ3g1SNVv7H2hf7mO5ipsHoPmrnZUkDt2gb92hbmn+rF4Ptk2GcO/pZUlR098N0hY
         12pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775146832; x=1775751632; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XABnzafTexu8r9STfdSEhkFwL2mOaywT8y1TwNRcZwM=;
        b=AZyuTiMfgFGzwGTPxESAylW1htWmJDHhf1Zs16KdNQh5hxHHbGrtnmflQrCPAl4nCq
         /uDNTYowOww3WFDzqEWTkyn3PA76/rCXXPEXWCTruzXwWqQyOT1qXgW7TmtbSlHShsNF
         0ygOpkiIAVFciDET59zzAiK5f2tyOCoNHfnQz+geKuDcGYRaLqAMzKfvC0grG7PQImTO
         lMpjxCr/b25cE89ceNfjxhOGwY+RB44pTH0VoVFGMQ2dTJRWODT4wLKjyaZEb1OoPSSE
         Qd2H22a5Lt53F+FsUHkxjK12FXXve5uR+6i2m0KqHXbBkONmLKvRMcifOT3vaEOMc64e
         PIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775146832; x=1775751632;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XABnzafTexu8r9STfdSEhkFwL2mOaywT8y1TwNRcZwM=;
        b=V9ZCz3fA86AwxQjsbijTbrhYr9B8NBOALZidtXjFO+ptGoc2bOVc1uRnpPcNBCKcsp
         EwSx0SWtfCGAmdN6D6PyMI9hsNQNQQwGwKkRC/R9ciVw4dQbVxDYsw5HDOGVzpIVZ1sH
         45nXO22KRMyEHf2CT+hFjin2HHrLlo7Jy3j9pHbwaV/jP7U3yXH+i48OK/m76sf1AOg0
         3X9QviAubzUodW/heje2wQKj2SSeEr0nGNBdjGhvUc9Mo4X7FcAjPPRUE8besxz1FqVm
         6RyLTxaveC/GAta3W4bvazEGrr6TAEFGCw54Fojh5cAacCITkMlxOxO+eOfAHN4OqK4s
         jUtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMe5vUE3NUhYPn1dk+dQcj7VSZ0BeC78WcWYcTpHfNjuLyBsKXCUOfj+wGt4Jqu89YKqwM9sTKxk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu3J3Yyz6Fut1WzxJcTE3xymhfYNUdieWMTwXP4f+QRjgZNMYW
	UcJ4lCmw88P4g/tvoDwNySN22+IeZISxjN9CJA6/eA6bFYmDOFWgzpVCe8Jj6FbdcL6ycgL5hGt
	jEie/EiaHYs0TajWxmA/E2XGC8/8Vafk5+QNqAwVN
X-Gm-Gg: ATEYQzxdg2coIQVJEfME3LlL+zzMopN2qd5u90Rm0CTu6YI8Vu6/jnmbgyRzt7Yy3Qw
	rt8Z8kMzKbdxNRxRHyNmWe16p2mQVL243cmYVHLUjwLFkShPB5JZhqWEWx/HmjnIUEVLZoeg7WL
	ajOm9ezIFzLGQ6k+FIkrwvHBEVUQ3/DiKH8HN01bEjGswk31m07qqG09EYjXaMtHe7Az+AZ12gi
	gPq/3/ug0aDZp4lCz96oOTeqSINiDzcSpTbcIopAvkmAIrceJ71sFBUM/dZAXJrmhXzjjeyNk0I
	u+NxdPxXsWJrO3iT7aw+VQRwxj/1v/2i+qv26EPVCmM6OM/AfLWlnbSKqRQHPZQustaWjw26kcG
	tcVU=
X-Received: by 2002:a05:6102:3912:b0:5ff:9d74:967b with SMTP id
 ada2fe7eead31-60567f98c75mr3137498137.20.1775146830774; Thu, 02 Apr 2026
 09:20:30 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 09:20:30 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 09:20:29 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3> <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 2 Apr 2026 09:20:29 -0700
X-Gm-Features: AQROBzDMmtxznwwWBs0nZ4oqZut-IIYidHQDWkMKzAfittGrfvUDuSGnGYqXsAk
Message-ID: <CAEvNRgGm9icDK8sK5ZfqHEOEqSbvjwtihE4p9d3vpBq-NfVjmw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>

>> In the case of SNP, there is a
>> documentation/parameter check in snp_launch_update() that needs to be
>> relaxed in order for userspace to be able to pass in a NULL 'src'
>> parameter (since, for in-place conversion, it would be initialized in place
>> as shared memory prior to the call, since by the time kvm_gmem_poulate()
>> it will have been set to private and therefore cannot be faulted in via
>> GUP (and if it could, we'd be unecessarily copying the src back on top
>> of itself since src/dst are the same).
>
>
> [...snip...]
>
>
> Btw, if snp_launch_update() is going to accept a NULL src parameter and
> launch-update the src in-place:
>
> + Will userspace have to set that memory to private before calling launch
>   update?
>     + If yes, then would we need some other mode of conversion that is
>       not ZERO and not quite PRESERVE (since PRESERVE is defined as that
>       the guest will see what the host wrote post-encryption, but it
>       sounds like launch update is doing the encryption)
> + Or should launch update be called when that memory is shared? Will
>   launch update then also set that memory to private in guest_memfd?
>

Update after today's guest_memfd biweekly:

guest_memfd's populate will first check that the memory is shared, then
also set the memory to private after the populate.

KVM must not make assumptions about any memory that is private, so it
should actually only be operating on memory that is shared. This is
aligned with pre-in-place-conversion, since before this series, there
was no way to populate from private memory anyway.

>>
>> [...snip...]
>>
