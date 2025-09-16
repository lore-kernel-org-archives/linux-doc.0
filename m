Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEFB1B5EC8
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 00:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757982503; cv=none; b=Ke1Rnu6W2WWlI8VKkC1DzlaFnFo70UEWHq+p4ugHa9SVzddREUmN7YUz5sHvTh74erxvMmTR5ZpKKuSzS+XSetmlTcsTAe27g4EVm8CDGG77tCDPU91MUr7rmqSh0Bxuy9xgUMKQxAxbLwaNMU3KwucYai969szz3uAlJX5vHsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757982503; c=relaxed/simple;
	bh=Hzku54Xz8F3o3FaR02WNtbqHu8t/XDsCXNVgraPSj5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mgIyHWhdHSLEafg6vL3WQx+CvA5I5gdjfsSmHHZlczd4PviXoym+GHiUPc+nPGFjGOPEICan+ZAnwfg97Yn60Q02M+NUi2g7RFs0n5ds3qGUy5TwJ3uMsd7RN0zbmQkeiJ4iizDwrw/D2O6+TGYxvTqYDH/EjLMGv4P0yhqf4WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uLsIzofy; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uLsIzofy"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32e43b0f038so1309107a91.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 17:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757982501; x=1758587301; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7AOkv9hGsWVXFwku0Pf403WUz7STeDqn1uZn/dDK2wQ=;
        b=uLsIzofyDcuExTWu8ZaLXt4dwK8WVlRUKjHb8BCMLT5kqrPVZxN4JQyb1wxG5neC5m
         KzG14cVo9R7DSCgqk7Cy1aU4r8GwXiLpCafc0Do2bdlV+QEufufBAOB+Etsg593HLPOT
         wTPDE7VHvHdd2GY7vxEEmPl4XgovHC7lf8ASM+Y7mr5qF6u1Oh8zQqtwBnhScrzB3OxA
         W9wtRUP+XmdV9lLVdnu6MSalJFe10Pto+z9x8IoCPr+ZyBJOrgsGsB3Aosn2L2zmip5F
         MViWaq8CUvayDKpTY+jfg7arKaTOhzhxc34bCXZEmGyx4J95ZWme+atckTqAvJT2RsoB
         2i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757982501; x=1758587301;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AOkv9hGsWVXFwku0Pf403WUz7STeDqn1uZn/dDK2wQ=;
        b=pmO6e/Fa3PDl9Hh6tHDkVloLlShBsfWSGq/6Th0NEMbTYqUa/QORXDAJLGqp4ldiTB
         Np9BUJF9FBolgGEDv7jtTcFw4l6ubAn22pnEk3CxHkk4NbueBxDYN8wXAajEIm5r8z3A
         T8zckenkowVsMeb/PZkY7P55Id3I1sbr63vZBNozp3RPlu/KqR7lnB1yC8XqEERl5bfd
         26M1b0X4HhLZRQIX2EyTVOLpotdRvR4e72ZdReUkESrOP5chBM+W12rgnNf4TBQApVR2
         2do1Axr3b5e4V5lLEweaG2sQM98jb1GsMeRJN6PP1nbVIwLxc+bATR4gght628DkOHs9
         Uzzw==
X-Forwarded-Encrypted: i=1; AJvYcCUGKcfiUQb9WEfMDM9UyFoizo8Gv/hXVP1Ps+0jOGgGSXTevdikOw607n84eOamt8yUQ+YakD/FEjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmICZpuyUKQXKkKCXyuFeNFZGb3+q9mxfp1Yiq5eXoi/fyuW3/
	+xDrBFNjZWHVk0Gqn8NEV0uxLAkZWe+z+/XdNkbWS+kotIEOVVbqxxCBgTCQL2iA9Mu0FqMEq3a
	iaahEcA==
X-Google-Smtp-Source: AGHT+IGQDEFWS3Y2K8qFkgjTf02yLfsVnbvTS5K/L5DS3VHz/kmL7yZiceoeOwoC6WZrcEtMLZwCDaXUGjM=
X-Received: from pjbsz5.prod.google.com ([2002:a17:90b:2d45:b0:32b:6136:95b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d06:b0:32d:e780:e9d5
 with SMTP id 98e67ed59e1d1-32de780ec01mr14229784a91.22.1757982500941; Mon, 15
 Sep 2025 17:28:20 -0700 (PDT)
Date: Mon, 15 Sep 2025 17:25:43 -0700
In-Reply-To: <20250905174736.260694-1-r772577952@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <00378f4c-ac64-459d-a990-6246a29c0ced@infradead.org> <20250905174736.260694-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <175798208800.624836.165612810420047605.b4-ty@google.com>
Subject: Re: [PATCH v2] Documentation: KVM: Add reference specs for PIT and
 LAPIC ioctls
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, rdunlap@infradead.org, 
	Jiaming Zhang <r772577952@gmail.com>
Cc: corbet@lwn.net, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com
Content-Type: text/plain; charset="utf-8"

On Sat, 06 Sep 2025 01:47:36 +0800, Jiaming Zhang wrote:
> Thanks for your feedback! I have fixed the grammar and put the full URL on a single line.
> 
> Please let me know if any other changes are needed.
> 
> Thanks,
> Jiaming Zhang
> 
> [...]

Applied to kvm-x86 misc, but only for the PIT documentation update.  The LAPIC
ioctls do muck with state, but unlike the PIT behavior, KVM isn't _just_ strictly
following any spec.  The LDR fixup is arguably KVM honoring the architecture,
but the ID fixups for x2apic_format=false are very much the opposite of what the
architecture says should happen.

I honestly don't know how to document the LAPIC ioctls, or even if it's worth
doing so.  But that's not a reason to hold up the PIT documentations.

[1/1] Documentation: KVM: Add reference specs for PIT and LAPIC ioctls
      https://github.com/kvm-x86/linux/commit/3f0bb03b9db7

--
https://github.com/kvm-x86/linux/tree/next
