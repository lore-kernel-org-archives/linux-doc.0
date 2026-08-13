Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF33FA5F1
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786646452; cv=pass; b=uo51Zk2Xovsqn1111Xq79ahQSWuFlIw7384Y9K2L6cAiJy2Eu5psUfB4jGax7qCHXJbDlxTWe5sYskro80Aep1bL52kIPmKIa3MKlWuwWMMJw0oFKdObYHVajH6Ee26UFVMblCfkJs5LiXe+iBg3j5R1SDftxWD7swQymuyMwYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786646452; c=relaxed/simple;
	bh=SmuHUPl640dUfP/T8wiC16wCTI5Yqb/6dnMHylHeXNU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wo8dJsZNV3L1t5L7Te5uPh24XGZ+SP2NHBm3+JU1OLTqIvHqcYaNeOo8J7fdPdvNdOdL3HFxr/FS35JhqIVCtn+Ju43XVRKeh6M48ibiOZzmsY8ER5vQ+0tehLDtxldAk4ydDyCxbAMXYR6uoGUzeeXORsHNtR01LFQoSDz6LuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rtH/gMxx; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rtH/gMxx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-382ef647e20so165523a91.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 11:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786646450; cv=none;
        d=google.com; s=arc-20260327;
        b=lagc1CtoY/tSaCHvb/WoPbo3hw5rbhB+U/V4cl4Jpm7ci4SrKb34PTo5str4NlmDSd
         QMo888QuXzTgTAqzFQHwKFYS8MwMEkBCwatGN439+5mIbCwGhNDWCZHC+rbEB2rLDIqv
         MNNUsipfQpsSszVvViVF3qzi4Essr0E+WCVpz3bs6n9ppA5Qzv7kZ3JtJLrzjayMxrLv
         M59N8447gfr7IP951U0LZUCJ5ZykoWqN30u+5DhFXj1AwVUi4msU6HyJe1466XYOofok
         OMa1ngJqjZxcJWCJGxM0P1lzJVywmMmhWX1nGpnmnxxj5hu/AJrSwM8DVDmDdPREvuCz
         MRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FfCarHoh7qSi7mQScz0h/iOmFe8yy6xC72Pgonixm98=;
        fh=gL6nX2qGhTG4inUcLNP/ippnTsNPn42wVq9ibbx8qVo=;
        b=bCPWav+HS9+8A/FY/iflBPHW7S+yifXbGzfgZNTa1wXaTIgWTD27GWtdrtAI3cIDH6
         Sz5ZnrrN5EZmi9whvEyfl+veEa9pPzDkEAcXqleDqbmmkGv2CPb4472fnTlvO865Dp8a
         1TTJ+cQkkpk2MoMdUYYbLSK7fLGoZwdoahxLsElrXn3Yvv9lGQhOFNpV5x0w8XCKFDc+
         CqzJBUNrZx7scOxgtXssv+AK5Bv5Vfi4ELEpDbuWPcyXysURSwkDBIvzPgQ0a0TBu9BR
         HxboeR1RG1Kvf7nRBRw+tszJ2mCBsZ9QGKU5JjSwewJJFwHR4weq5yIxwN8rh3ydtLv2
         jSyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786646450; x=1787251250; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfCarHoh7qSi7mQScz0h/iOmFe8yy6xC72Pgonixm98=;
        b=rtH/gMxxvOe2cU1ddqq4AyofAT0g/9O7Nm6G9AFpyc+uZP0jsMvlRGGCAE5IBoNkZB
         0diVPyDQ1x3p14dcs1583lrDRK3j45lg1uw0+J0o8+bRphMPncXVJsOAN17QZEReqvBY
         K8eTzDaGtAHTc6Ps1tEvo41etvQTw1sTDz0fh3MmpoaGm9jPcg7HwjwoYMCEaLtwKga+
         zOfQ+5xL3qxCtUD63k7wyp7KM2uHTzjBxs+tzuphLoCYJZTogggHTYc13cMz7ERNxsPJ
         Q1MakAvGm8oZmjKTMQU2lsN1VuF0xggalJl4t6iSQxs9pMGoeUoJr4OApLPSS5tGyxX4
         /SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786646450; x=1787251250;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfCarHoh7qSi7mQScz0h/iOmFe8yy6xC72Pgonixm98=;
        b=VTLY/H7j1pZJw3IONUvMUFW/xvb3wG2H6ub/LzfXsSZlHH4I/MMGguao5ZgwgLv/Yy
         XgBJZ96JPIoJ4Uy6jIQC7nDpc2d1ruCwdA0djg5KcDJM3Kqqe0nRE8f81AN0aLWC6t7D
         DWgWwepPG63+Ca+J5OH8deR5ohUNIo7ZQNtmq1ftP+hj+wKiWKKw1Dd3sWV4Pp8u1md3
         F8xgxWW+GoYwurov0BsY/uiurJAfie3DqdETb6WHkl8D8TwsDxfdScB2S7REkLJdqAf+
         QJUB0ZEa5I65tB8A9bmgTlcJhE1d1jZg+vk8Rr7jToefJ88lvewMyg7yzlg+MAOKpkbE
         TVuA==
X-Forwarded-Encrypted: i=1; AHgh+Rqp/BBZdmh7qNpyTNn+aVTwrBQ7tV9oCcM6wbWHuxD+0BCK03MeDWkISj6s7bdsiuA4uJp9fB2rDyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4NPxrfkfLaekfzUpWV+gQsgzp4QybILht15edY1TxgmCVTKcZ
	A16z4dPJbIgZqcnfBhBg2926KB6TPQkb2319qjcpF4Fdx4edklQX09yij2AD0kcevkWW3Tpym/R
	8T1uTLvIeDMiQ0La/y24wGdq3V+FL7rYenOKN639Y
X-Gm-Gg: AR+sD12y/tzg7AG0G+BHvhIZw3xh0oAlGBAK/3XPBgzzq8OZKWLsXjsC6g3CegNvK6B
	YcQvTaHrxE9qT/Me7j1+yoDTWk/Jl2vpLDTwK1Y8ZD/33zLOepoQqvy1YDcEgt0My4voM1YEGKx
	JcPtlFvr5DLM5cBLcxstf07BjTjy1H4OwhqgzJN39tcTnk8m9iDGL8MiSjCy6FDmR8x1tIk6wHG
	0KRqiYyzZ6IrJequCH0ppA6c9XaF/78x8AuJvxze61ayT9OJxAr+7+ledOQ6Kcm65x24V+RXpIJ
	cavxgfHz2xVlgmQHWou2cvecrGfOmPKGR4LcW4Z9fUucP4E1q0b4W+H06YfNA15oPHi1LF4ERCY
	ZddhOAsjRb4WPjY2Gnw64wxEK3A5h+c4=
X-Received: by 2002:a17:90b:1c03:b0:38e:2860:253f with SMTP id
 98e67ed59e1d1-3931e25f24fmr8532991a91.12.1786646449351; Thu, 13 Aug 2026
 11:40:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:40:48 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:40:48 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <cc44c9d7-a6cd-40a5-9f68-4822fb9c9d0c@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <ed483d25-d908-4248-b8c7-862dd35dc6d4@kernel.org> <annnrGR1noVuBkCc@google.com>
 <cc44c9d7-a6cd-40a5-9f68-4822fb9c9d0c@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 11:40:48 -0700
X-Gm-Features: AUfX_mwbi2KKm_8JKoJYp71B4rnhRB-DpUSQbtCK9ZlqdFzmBXno1Ngt_qJ6KFA
Message-ID: <CAEvNRgFd-6-QxR7w8SxPRa0UU+AAF7pDupLP8cPbQ9y3m=2QVw@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson <seanjc@google.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 8/10/2026 11:01 PM, Sean Christopherson wrote:
>>> As mentioned in v9, the name is confusing.
>>>
>>> 	kvm_gmem_mem_is_private
>>>
>>> ?
>> Ya, +1 to kvm_gmem_mem_is_private.
>
> So kvm_gmem_mem_is_private() calls kvm_gmem_is_private_mem()
> internallly. Ummmm.

How about

  kvm_gmem_mem_is_private(kvm, gfn)
  __gmem_mem_is_private(inode, index)  <== this is a static function
                                           anyway, though it calls
                                           kvm_gmem_get_attributes(inode, entry)

or

  kvm_gmem_gfn_is_private(kvm, gfn)
  kvm_gmem_is_private_mem(inode, index)

  (rename the vm stuff with the suffix gfn_is_private())

or (current, it is actually weird)

  kvm_gmem_mem_is_private(kvm, gfn)
  kvm_gmem_is_private_mem(inode, index)

or

  kvm_gmem_mem_is_private(kvm, gfn)
  kvm_gmem_index_is_private(inode, index)
