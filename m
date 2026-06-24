Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B9A34676F
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311922; cv=pass; b=MtBHE7iqJqju3o3kjZR08ZDQolrQqpkEoVjzUohq/Gs74dQL25biLVLdbQCynZuiXj38ACHhYAA3c0Lo3N8fDTl4MK3ezzBC5lInREqjcbkI1iMEt9etOSpj5iWBchzgwaCbV8TsbWSUMUT9SEO/Drtko4BtnCDQ6Cm2ukC67eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311922; c=relaxed/simple;
	bh=+a1qMWWmOM6Y8/o1eN1lz2qoObcQIVgbkHxFmUvd4Kc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiD/9Llv4ePg+5AHwwtaU8DLTSuogMH2qpl+9nLmGWWJEZBHa6muHHXTMvmjIJCwLilNHLm0C8nDiShfZ+SYtzbutKAoWn+WEA/eUGPMTRijpH6Wepc7CJkiTjOpLzZHQK1UpBn9Ns8CPUhAmjnIswyjYbm0CmHKLPstsfKI7oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZCTMx5fg; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZCTMx5fg"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-139a5f4ca15so1298085c88.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 07:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782311921; cv=none;
        d=google.com; s=arc-20240605;
        b=J1Mb0w6pm8iIqhRKgB30GzMi177y4Och0XdqOJ7Uj5aYybTYHmmCf6k2FmsFek5FvS
         rrel21RFWgSQb4g73SM+vBPkZGp2TC478XR0czgRItzPbe3mt+I5IQEpMoQxWxaYjhT9
         0aupJVnTI7Dc2q7xVSkOIEmdsWtBj8TgFDxiZnEp7mjtXXqdEkUwpGQnqfS8GsUC0n0f
         3F76ZETSIQjciqsqoMPE/oB7xdsoAceyHbUGC2EkybwYVE3g42IzNhmGPdME8z0GZgFE
         RqgQa2baFUslj7mFt551iSUpiw+1+S0CM45mlNo36Go2Q70YAufB+V+fHWfRL21EHJCO
         lLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=HpVAzGtumZJ9rywOtX3ITBDfHQ1Vjgs3+apnvgsrs7k=;
        fh=+UxK57Oc/ryY78oZpkiiL0dm4ow2PdyOcf8a0SYnf4g=;
        b=kRpnRZ8Od5sdmZu96y60NNg9tw/TeVBiNzRO9K3+oAVi5WtG2KrOzZ5Hh3rwuDViwA
         u9j/4nRzBHDKXFsjr1kpTL4PFmfhrFCoUm9e7mEofx5C6457nBqzB7n4bYv4TNKgPjyR
         2ixrO8TfqZjNJwqWaIJI31Ng9+dM1q7d0yys0/JyXvL1QNtTNB05miJbFpxFB7WvMQ50
         agOD+sU1VmioICJTd+M9yL3ER709HrgPtf+YxvrlcHrzLAIlqKB49eDir23IEF0hcXkz
         nqb0HnrJqnVmIaTAPb8LHmW3OzEmMPSfFbPP35bxI89reQh79HBwD9gbMTbL1ot44/zd
         blGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782311921; x=1782916721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpVAzGtumZJ9rywOtX3ITBDfHQ1Vjgs3+apnvgsrs7k=;
        b=ZCTMx5fgI20rN/pA7k/vyqqO5H90+Rsinl2ibGRK+spNvRV54C6b5UaUrahaqwy2cD
         kxkBKlSEfGb4gX3zCmTUwKUjSNaqaZALAQv4ALjlw+ZJnCrhzyyKOUB42Zskco1ne/B6
         I1021s+vSW7yaIPKAcaRAP+mGq4yDueR+c2Moi8Rwmr1xoo5YV1aCVzlD6Bm/9clOaTm
         /rLDaTfH2c0j8yRBu6hiaQU3BPUITdTI44zc4qPxyxp8tF9Fzx8QIOZ8h3fSlWxW5Y09
         FOI6UDJ2cn3AIndFuSnzSlarDHpj/Z/+F+2M08K31q2tzJFwl3OMdZea+wcSWxJ41gbM
         R/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311921; x=1782916721;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpVAzGtumZJ9rywOtX3ITBDfHQ1Vjgs3+apnvgsrs7k=;
        b=tOB5W4tGqp3OgnYg8l4lGxAVzy7jtNskFm917WPhPgMPRJJykU3WWa7DOUdEo+L1Im
         MvNe6jbZcwgp6xPUcB4OoJCPZFFrp2dxRUcRRgcyJioA5CyIRarUVrsvyvaM0fRcbEDk
         p3qaCS+eYkQXXuA2a6moH7CE5RnQWV7TcF0+bJkTcT385Nj9ea3IQ/Ivhinm2XTaIryQ
         PLc/1Yaib1LcyG6396NtSlPNW3qOGKqrrSA/3LTyjlJOcqgwGr5rC3fAo0QNmr3RpEa5
         FFS9yZJ6pBEBJb6/lfQ+JS1LtHboi34SYQ6pSGNBTvnmvSZjYPOjyjyQDkZOFeGcdiaA
         sZKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vLGI6ldzpE3EkVBZQXE7S9ZKpehRBcxfr/uE+iHJ9ws1A+9N8J7CZeXKPpmBsdkK/izTXWJPSIxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+EVPa/u/9tiyZN34M9JmjhkxPOvckvClX2kUg/DRJBcG0f8zK
	e+ScQvZUegKC3LuF2G8VWx2+sj1hoGMaaxxArGv5/vhwy0haVzpTuJk17M+nLDBDjVdmGXltcZk
	faRVtnyVRf11wZpE8mN97UrcpssSCK7jvQL6lOTS0
X-Gm-Gg: AfdE7clgKP0+8MPnvZMV5KCBLkGGaQ86EWnJgZcZT2m4Rh7qX3VpA16EFXEcJTS6nXC
	hskjIp/rkUdUW4QwN+SnsPO+VFjmon9erVFCtHV08BNLesRInXMqKugKQ/3MmznXLA5Zn1t+nd+
	kLxW7rX8tO5l9yGuUtdcbaIm1xkl9EqgTC7MUI5lH6KfBQu45LVtech48f8PVWQKyHVf4jmz4hl
	356m5xACZbX7sgxszNSKoD4fiGPhnCkr65upUKDXzK/MQ2mbdd3QXUwXlBF9MY3bGhzao+koWDX
	80m0XfRHBxY4f3SPeGqlWCPEGhGo
X-Received: by 2002:a05:7022:6612:b0:133:3bb1:8d40 with SMTP id
 a92af1059eb24-139d0c24496mr2539007c88.15.1782311919284; Wed, 24 Jun 2026
 07:38:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 07:38:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 07:38:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com> <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 07:38:38 -0700
X-Gm-Features: AVVi8CeozOwjsDHz095RESzI1L73Y_-_c-08wJAGuPOXvsS0FIpnjscm-5zrczA
Message-ID: <CAEvNRgG-WDzHp-15Mig4hiU5Dag0pFCu70-R-9b=PkD69W=ZMg@mail.gmail.com>
Subject: Re: [PATCH v8 09/46] KVM: guest_memfd: Introduce function to check
 GFN private/shared status
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Binbin Wu <binbin.wu@linux.intel.com> writes:

>
> [...snip...]
>
>> +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn)
>> +{
>> +	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>> +	struct inode *inode;
>> +
>> +	/*
>> +	 * If this gfn has no associated memslot, there's no chance of the gfn
>> +	 * being backed by private memory, since guest_memfd must be used for
>> +	 * private memory,
>
> "guest_memfd must be used for private memory" is a bit confusing to me.
>

Hmm good point. Is the source of confusion that guest_memfd can be used
for both shared and private memory?

Perhaps this can be rephrased as:

guest_memfd is the only provider of private memory and guest_memfd must
be used with a memslot, hence if there's no associated memslot, there's
no chance of this gfn being private.

>> and guest_memfd must be associated with some memslot.
>> +	 */
>> +	if (!slot)
>> +		return 0;
>> +
>>
>> [...snip...]
>>
