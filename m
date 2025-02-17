Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE465215F49
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797556; cv=none; b=qBU/vygJkE9OozheOPhmzI/1cGN1+DtNvYBKUTQswjWNJUzflBtOVXV1K3iVUPVTg8DTlwNGbAy4QahgMlHhWhMAgxQprtGxEpSixQiMWTxWySwoWOIE9RvdJQYwfVLTxhlXez7MXbNoOaD/6FffQ1UUQz5FAbCOvaXQl46/UWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797556; c=relaxed/simple;
	bh=ZKAxYYLxdNCr5VowdCBtoLawSOPUB9oQdK09VtVgZeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R8x1eY8FzKWzSyEBn1ce+ha6VnzwcCNe8QU44F9aLole5WCV4urDxkFKkg8EWUu1M4CS1U+Ws/IyQbn4BN7LHDtpTtnZzzxAEhQ8qoS/UXxeGPIXHOFmgpQmtZaxrF7IbYRSRtZ0yi4aXF7m8PKfZj0BxWFUb98lSm5ZnIbNm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f1OsVoB7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f1OsVoB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739797553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kSiOdtiiGo1JzX8LMRCdFTwQjInIJfdLf9Cgv1ZJH3g=;
	b=f1OsVoB70dTDcOJkkgi2gcwk1vrdjg6FixWGzHrriUOeAiZOu4gRmcWBCCHtvDUNUOxGL8
	tJ54gFwYOQwmemkNqJD6a7m+PgvZG5/AytNfhrFkyP4Scbc9mhZQxRaFxiTbzoWKDlNw3m
	zAsFyrHwVaw6sL4fLMFM5j+JHMWtl2Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-jwFjHbiYNJWEX-0RosMwHQ-1; Mon, 17 Feb 2025 08:05:52 -0500
X-MC-Unique: jwFjHbiYNJWEX-0RosMwHQ-1
X-Mimecast-MFC-AGG-ID: jwFjHbiYNJWEX-0RosMwHQ_1739797551
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4393535043bso24881265e9.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 05:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739797551; x=1740402351;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSiOdtiiGo1JzX8LMRCdFTwQjInIJfdLf9Cgv1ZJH3g=;
        b=TWqfNFdOLij/A/TIGQTQu07s4bmyRRZDG1KcR1jERj5yeVR+uvVyzVHBq2xlVqytnT
         CTtjryF9w1McqB0h0tufLViKFYP3c2IKAiwerULk3Zm4JwtbnalxwJmRsp5pdDkLgJtN
         EzFRUqqprqp+sVs7L36/B/KnZqpqXXpDu7SKsDDGojmko6e92TQLoIH/ylfaKOkfAETV
         2SbWyARCvxvWIi2rrG6CQcV1ClWpIpNPprA6YDwnvtMrI4RODtciieVSOcnr8IXmWw65
         k/eIrwh7UK132LtSMYR5UajyzYQn/STSRdomjZGyExw5Mc4NVtOBLabWwGMGhtJLSlkN
         EBbA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Ie+dnxEZFWHJlaEz6GOvC4gc11rvyyALL136ddYV6aTG+Ld1Yi3sAHRQzZMnEUomoAzCd1JwQYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvq+RmFNDXeSc3ap9xtsXx3xWNGxG6+q9RvPBUTRY2zICVuZL
	3mU/ebErpDgAfHOu3OQSDB5PcfJP1a17wbw4llfJX0hBONFVqg3pfO2WljnvNrc9jJ1rPxDlFdj
	ialxtQMELftOkCa4ee1ybPeawhPszSnhWQ3i0DyTHdCMIxUtmPYvoClqRi/a7o9g/wg==
X-Gm-Gg: ASbGnctF5Oq9wXxDLJ0RZKtgrW4sBCCWZIzVa+TTBAA/20Vjm1EjfCRTu5ImRjmfjUJ
	RRAVEgT3owt2BB2qiMgfyu8vV9fMsaW0Ro29Jmjop3Av2smxWEEqm2bZO6Zn+CCVvBBaMLH+qoi
	Iexqz5aOmkBsLCPBcljCfapF+LW6nbA6PlcSZ0sGIFyusOC+80u+neyZgwhAPIerdgUa4e8L+eh
	MgIjPgVfDxnaRMc6kEReQuqbKpRSMmQDX5IMGcRIcNsQZs2ybpzpHnEbSMMGhIlIu3TEfNKj/yd
X-Received: by 2002:a05:600d:17:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-4396ec7cb7amr75792085e9.12.1739797551153;
        Mon, 17 Feb 2025 05:05:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSLtEqy93wRPXG9nMCMJ0lRt4GquiQhPG/wEddubWd1+r9Qa8A53oIvQqaL6k/Vn2poTgPqg==
X-Received: by 2002:a05:600c:4e8d:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-4396e7d3b00mr82441835e9.0.1739797516788;
        Mon, 17 Feb 2025 05:05:16 -0800 (PST)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm12383958f8f.56.2025.02.17.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 05:05:16 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Nikita Kalyazin
 <kalyazin@amazon.com>
Cc: pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, xiaoyao.li@intel.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 roypat@amazon.co.uk, xmarcalx@amazon.com
Subject: Re: [PATCH 1/2] KVM: x86: async_pf: remove support for
 KVM_ASYNC_PF_SEND_ALWAYS
In-Reply-To: <Z6ucl7U79RuBsYJt@google.com>
References: <20241127172654.1024-1-kalyazin@amazon.com>
 <20241127172654.1024-2-kalyazin@amazon.com> <Z6ucl7U79RuBsYJt@google.com>
Date: Mon, 17 Feb 2025 14:05:15 +0100
Message-ID: <87frkcrab8.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Nov 27, 2024, Nikita Kalyazin wrote:
>> 3a7c8fafd1b42adea229fd204132f6a2fb3cd2d9 ("x86/kvm: Restrict
>> ASYNC_PF to user space") stopped setting KVM_ASYNC_PF_SEND_ALWAYS in
>> Linux guests.  While the flag can still be used by legacy guests, the
>> mechanism is best effort so KVM is not obliged to use it.
>
> What's the actual motivation to remove it from KVM?  I agreed KVM isn't required
> to honor KVM_ASYNC_PF_SEND_ALWAYS from a guest/host ABI perspective, but that
> doesn't mean that dropping a feature has no impact.  E.g. it's entirely possible
> removing this support could negatively affect a workload running on an old kernel.
>
> Looking back at the discussion[*] where Vitaly made this suggestion, I don't see
> anything that justifies dropping this code.  It costs KVM practically nothing to
> maintain this code.
>
> [*] https://lore.kernel.org/all/20241118130403.23184-1-kalyazin@amazon.com
>

How old is old? :-)

Linux stopped using KVM_ASYNC_PF_SEND_ALWAYS in v5.8: 

commit 3a7c8fafd1b42adea229fd204132f6a2fb3cd2d9
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Fri Apr 24 09:57:56 2020 +0200

    x86/kvm: Restrict ASYNC_PF to user space

and I was under the impression other OSes never used KVM asynchronous
page-fault in the first place (not sure about *BSDs though but certainly
not Windows). As Nikita's motivation for the patch was "to avoid the
overhead ... in case of kernel-originated faults" I suggested we start
by simplifyign the code to not care about 'send_user_only' at all. 

We can keep the code around, I guess, but with no plans to re-introduce
KVM_ASYNC_PF_SEND_ALWAYS usage to Linux I still believe it would be good
to set a deprecation date.

-- 
Vitaly

