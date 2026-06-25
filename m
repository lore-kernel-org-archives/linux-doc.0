Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5216230BBB9
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411147; cv=none; b=R7vhaeyyvTeuQ32U4CuHN9XkJc4eQ6OrtQlsEtCNFOpPsauVgS+zSr3O/JqPbt583kJloDGJR4d3PF8OA/nMxNtxVSxTS7RIohgR8ErgESYbcj6cf1qpl0p/PXzGZ/AZbuzX2KGDe+Nv51tQhuVqqCL/k0o6bQ9SNvnHVes4zmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411147; c=relaxed/simple;
	bh=1mmqybtyyz3V7YDYArUGJdTCwOdw8wCbGqaGSAkZixQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J8DzhnOD8Uhr7BMC433292v5KDUqW4Z+0Z88aeZ0sCHAdmwLTSOu8BqeYToZzA7vRx/t1F6fpsRD/SWS0JpiVHjnn9yDtV8P7NAVwulBT9YP5/msAjiBrLOCs39WzseSue5Zhi8THUIHhenp1mZbFRaGuZ3ly/e4YLAOGraI/gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bu32jcpu; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bu32jcpu"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c8007ce805so1068195ad.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411146; x=1783015946; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mmqybtyyz3V7YDYArUGJdTCwOdw8wCbGqaGSAkZixQ=;
        b=bu32jcpuh08yhgw6FBAyRKpUGvf8su0H7vYxVqSpLC1t1X7lQwjuAmo4xG179FwziQ
         MUHhGpN0qkQAmhF2ghaRnyv0CqgHXxfn5mLVF+HV6CjRNQvvmMaH6IgyD31WJxQKviLX
         5Ui1wk5Dcw6CH1Vf298gVM0jea9nBf4LR4qmUJkXRQ6TUBHc9y9SYzHzrZm5NvBqD6Se
         rg/IKJIqvtNmTYhkzD7E171dkLIMhYsaURTyYhDqP67Hx+1Buiav2bad/eiA3j/HLNIL
         NQE9Pn3+fI6y1hJXDdZJSQTVHOjONfCyOzoPhpi2v0bK/EvAve5h7UbJ8CmV/s8fTrsd
         RIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411146; x=1783015946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mmqybtyyz3V7YDYArUGJdTCwOdw8wCbGqaGSAkZixQ=;
        b=m5FY0hPnhjwsaUjnO/h53uBrqNpZGNdQeDR+dVtSB5VeEikHWB7xOWunrW7Qb8wFCO
         wIw7vBhVbw7BYsvOBIlduJSEP5nvuxTaLjtAuWUEH6XYs8GMwEljUCNPpSDt8JDz4UcC
         JWMVVs5fwNTDbel7NKvvH3s954gJNyf5zh+6GvrgGpH2FzOotmNjas+CzL2yBksoWbf/
         khaiNP3TDptQf7cilX6b97pJQiGWC0vHsxvPL6hrnDUrNMN6YELS5BTPlN0iFkujAABs
         8e26NnlN69/WgBGOocJhdgQAXnCtH/UpUGZ6aYahCtkINJciwEdfFPF1DGCeCbKDs2R3
         RlDw==
X-Forwarded-Encrypted: i=1; AHgh+RrYbBcupgv1V0JLR2sV4EGICKZ7nF+cDbCiPwMeOO0LhuhMWqgZ4sdRZv7/dJ3wjimWAdEJtmOwetI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk9HZk4C3rDyqFyIMLSUtc+j+hx7CBrbcGGPIHiRNUBRR3LKFY
	LnSBiZBi/m1mAMBlI33/FieHuHMv2ndsSYDXelontEkijgo7yHm6yvQnE/ko4TXQzQBkVEvk7kT
	dqh2F+w==
X-Received: from plsd11.prod.google.com ([2002:a17:902:b70b:b0:2bf:195a:2b9d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a86:b0:2c2:dadd:940
 with SMTP id d9443c01a7336-2c7fc75a039mr38047275ad.2.1782411145490; Thu, 25
 Jun 2026 11:12:25 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:12:24 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-3-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-3-4fe8b602ff47@google.com>
Message-ID: <aj1viF0luJZ0bskh@google.com>
Subject: Re: [PATCH RFC 03/12] Documentation: KVM: Consolidate notes about
 kvm->slots_lock and irq_lock
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, vannapurve@google.com, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, May 27, 2026, Ackerley Tng wrote:
> Move the detail about ordering between kvm->slots_lock and kvm->irq_lock to
> where the two locks are first mentioned.

Why?
