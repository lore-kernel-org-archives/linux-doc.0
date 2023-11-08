Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E230338
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="28g+1mtF"
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666491FFB
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 09:26:51 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da03c5ae220so864522276.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Nov 2023 09:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699464410; x=1700069210; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fcNGmp0bMVeoUVK/kj6RJuJ80bfwKP2JtkyvpFXoMsU=;
        b=28g+1mtFmc1p3pzUrX3+MUEcElyvcMxoKaEtniN85c0fGU1wRsa5JzbjTsz2Lwmf8i
         TJ0WyWMnvgywjRdnIIVOHe8qj9oQ0wsGdJ5eAYl+5MI7adJBPj3LgOSofyvhn7RgJJ+J
         vPqEYrlQI9e0lWU1n7Ke+okhX/I8LzR6+bW1oQC7fIlci8vLXZCCK86kCbP8WUZBCjHP
         Z8preWys1obzEwoh57IkUlMe/a8TKg5roClTHuXbYj311jgPQopQXMYO2XasUMAGyHJw
         nP7GLQerLdnWjGg0OnX5oJHhtYozGw3MwgY4tejM580tG51inlky1sOqPfFTcgAmnzGy
         g8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699464410; x=1700069210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcNGmp0bMVeoUVK/kj6RJuJ80bfwKP2JtkyvpFXoMsU=;
        b=K3YTFbgF+nN2jgQUFowM2p615FS7cWdyP2mx5cFucy0UIloIo0kQzjv8P5viUSeBo3
         7ZjWVWJCANJvKigKd4HioXAGpDqhnexCoxxkUYNcOu6LbWhu6bCblmqY8zkkRdav1YRt
         ZOLqozuYdYhpFumMc4eu/NpbcKhYSKLyyuh7G7aA0rU8Gl013PUS66sqOyZhXsceV4VO
         L6P6WCWByDCFxiE6geoWyDHDpiqDUDHESsBjTTWkdKUNqH+w6uHvTXGQ1VlJDhImStVm
         FE8jp6u1xMFXwuQj/QnFHCG1r/IoP76fdOZZqbgEUQ5f4VgLo1NFH5Cwpy99/MYYRLpo
         mosg==
X-Gm-Message-State: AOJu0YyQ6EPPy8+r2rtRrCrjaksG1KJfZJLUSSjMupQTG9v/ngsCVP2r
	6lwoxtsS9GxrSm7prndhW5C/URjTp6M=
X-Google-Smtp-Source: AGHT+IFxHXaCZqys2v1fdXMGyt4nA5veqhn2zv5LksaAjCX4Ofs8pcVrVl/9acHOhLlQN5myH5bfxC98TFQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2307:0:b0:da0:37e1:558e with SMTP id
 j7-20020a252307000000b00da037e1558emr56047ybj.6.1699464410654; Wed, 08 Nov
 2023 09:26:50 -0800 (PST)
Date: Wed, 8 Nov 2023 09:26:49 -0800
In-Reply-To: <20231108111806.92604-15-nsaenz@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231108111806.92604-1-nsaenz@amazon.com> <20231108111806.92604-15-nsaenz@amazon.com>
Message-ID: <ZUvE2clQI-wOzRBd@google.com>
Subject: Re: [RFC 14/33] KVM: x86: Add VTL to the MMU role
From: Sean Christopherson <seanjc@google.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
	anelkz@amazon.com, graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com, 
	corbert@lwn.net, kys@microsoft.com, haiyangz@microsoft.com, 
	decui@microsoft.com, x86@kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 08, 2023, Nicolas Saenz Julienne wrote:
> With the upcoming introduction of per-VTL memory protections, make MMU
> roles VTL aware. This will avoid sharing PTEs between vCPUs that belong
> to different VTLs, and that have distinct memory access restrictions.
> 
> Four bits are allocated to store the VTL number in the MMU role, since
> the TLFS states there is a maximum of 16 levels.

How many does KVM actually allow/support?  Multiplying the number of possible
roots by 16x is a *major* change.
