Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A9C254B0B
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891772; cv=none; b=RIXIuA0/6s+1R/o+1r4ACq2U0KisBYMSEjHLQ2/K0vKNm44z4flQQWyY5HUBnzjSdN7ZwwElm/+wfa2DhvzZ5wxr7mockknN+3YvotMrgNVjpRiR8sIV5u90V2zuWJX+8Ia6ejqHVRpO6+DzyCzETuwrWfSDaVN+LkeWTrsbzLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891772; c=relaxed/simple;
	bh=OCleXFn9NZkH1PChKdrM+O63KYl9A/+phnDxXBrrIoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZooGQs45zS9SC/b7rzT2faiEhqOPgVAKbbRNkujmyhA5MkpKxp756ngc3mpye/6jUz9Ghr6RkN0SHsPsjfxUre+P9yvVnSgyNLi5EWxqVq9OOdJvdh5Q8xfsZJRilzcdpCK4WOaIk7QPagyf7D+3usVGFwewtoChlGKyfhjG5/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nq+2PUBp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nq+2PUBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742891769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bXwOjnHMzxUdXRa1xbPJFsVQQAIPiDayu2d6sm6acno=;
	b=Nq+2PUBpUNL+cl8gady2Nyi3jHmFIJohz2GUOS6Az0uIdrxdJ9MLPMHHBi9wWNX0cYQR1f
	Vj25ZBQ7FTR55HGiAq6R0HNpZaW69oBJD0c9EWFMQktM22sH9RzB43nJNg3UZMX6JSirHi
	6UNpgUC6Fo0OJ6Nq5v9B2TgLUqFcNZo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-Ek7WlwT1Phe7My3xxzLdMg-1; Tue, 25 Mar 2025 04:36:02 -0400
X-MC-Unique: Ek7WlwT1Phe7My3xxzLdMg-1
X-Mimecast-MFC-AGG-ID: Ek7WlwT1Phe7My3xxzLdMg_1742891761
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d44a3882a0so50087115ab.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 01:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742891761; x=1743496561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXwOjnHMzxUdXRa1xbPJFsVQQAIPiDayu2d6sm6acno=;
        b=IJwffMohVFfZaSrwiChVcNAFVMexvZC1eHFKs3t08m8De8FqTnqRGp4sNU2bm1xP9c
         s4aZrg1V+VfebiVwITt3vUFWEp6M1ubFXpFTmwhkeiBxwG0ZFsH/mEt+HWOG7xVUjww9
         813VRMu3Lj2moVNVMcFkSbwCfSvCrLbUeLmbmMd+j8EMqyqR0hPtd9dQSgM1TAVwJs5b
         95nZLtQJgw2ii7MWr/987SauyVJ+/sH3lElrKXNxpQJ4QROCRJMhUhqnqK8DnKKehCNX
         ZJWkSTgAr/QHfKBNe735benIZ/u+fFCjvdTLg4OJs1nrl1XkCimOoB1W5kJlJ2JFZxpG
         bH5w==
X-Forwarded-Encrypted: i=1; AJvYcCXu6uSSH8qs0IramM4Sr9wYmEqkiQOhztZUyHuszwJ6jepV8ykDXnI7bRow+9+tKF5FbZwvCF8LHzI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5J9kqnq/lRU8f087Y7RIJKVtC6hKpJWTtAwYbxQObBfDYxxnx
	K1MVebtZyL2HEeS3htFzlfHcStkqPkkp8AwyAWY3BMzScmynvcN7iKHa+ZieH68sEaMwXjisXJQ
	IKs/h881lrgdXhYSmJVgvKhNY355rLPt5WbZgrXIPkQrzFXKhGVdfUDmXknCjf3hbNFjEwZiltq
	6EnjxPA1E41Tsf8+UJjLOnpwZPZr0F5zXr
X-Gm-Gg: ASbGncv7ChP8lVzMGuKLBR0j+RkS68ZXo7eeM72+9ZuwHPC5XcibkK4kd8upqTjYpfE
	U97yLBTaMszCI2+Zvt3i1yWGBAfZs+XrZeu0oBtstpDrpoo0iNGCjt2JRQ+6sIkxScONNyF7/wQ
	==
X-Received: by 2002:a05:6e02:12c9:b0:3d1:4a69:e58f with SMTP id e9e14a558f8ab-3d58e81374emr209274585ab.2.1742891761234;
        Tue, 25 Mar 2025 01:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9E4/EucEBc/+iE2lWu+YyJiDtrud2DOWwH9Ttz3ALKtbFpsWVzZCuYuuSTYSC3OfYElupM2e2tE7hTWgAmd4=
X-Received: by 2002:a05:6e02:12c9:b0:3d1:4a69:e58f with SMTP id
 e9e14a558f8ab-3d58e81374emr209274145ab.2.1742891760802; Tue, 25 Mar 2025
 01:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv>
In-Reply-To: <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv>
From: Dave Young <dyoung@redhat.com>
Date: Tue, 25 Mar 2025 16:36:22 +0800
X-Gm-Features: AQ5f1JqjFlzQ1M_D50CQArcQW8YwNNz0vfJYofXBEYquREvaq-g04uQRlGUrUgs
Message-ID: <CALu+AoQj+mHECTvbuK8CpUTmOYgx6n2oMFm5kQXtSigL+5Ks2w@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Baoquan He <bhe@redhat.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, graf@amazon.com, 
	akpm@linux-foundation.org, luto@kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

> >
> > Have you tested kdump?  In my mind there are two issues,  one is with
> > CMA enabled, it could cause kdump crashkernel memory reservation
> > failures more often due to the fragmented low memory.  Secondly,  in
>
> kho scracth memorys are reserved much later than crashkernel, we may not
> need to worry about it.
> ====================
> start_kernel()
>   ......
>   -->setup_arch(&command_line);
>      -->arch_reserve_crashkernel();
>   ......
>   -->mm_core_init();
>      -->kho_memory_init();
>
> > kdump kernel dump the crazy scratch memory in vmcore is not very
> > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > so please disable this option for kdump.

Ok,  it is fine if this is the case, thanks Baoquan for clearing this worry.

But the other concerns are still need to address, eg. KHO use cases
are not good for kdump.
There could be more to think about.
eg. the issues talked in thread:
https://lore.kernel.org/lkml/Z7dc9Cd8KX3b_brB@dwarf.suse.cz/T/

