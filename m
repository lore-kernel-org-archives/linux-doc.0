Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9A18DB14
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500527; cv=none; b=GXhZxce9SL5bCtW+x1k6TV9YI/2XTIHLmhU4vZyBA4Klv3b6MnZXsoZy7Asl1zzNZMRZJbrgDAGD7tJ549Yq2196fLpdfYW69OtnnO16FH+oLMQh7oMxj5x7joM/kUh6X26+ugS2slR6H9s2cVWRRVXQp+DzvPXetWjvrfy4sLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500527; c=relaxed/simple;
	bh=jM5sQZeJ8NG2PUq6xbOumgp5f1nJYudVynbtXZmZVOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cpmWD+r8n4/Ixpw9TdGz+gjn5imG0EwCv6KmvkYB79kMLAWgGDFyCxWiA6ykPoVMnYajH8+xgfr/VZdLbEX8NuaSBqsNguGv6i43xuqPzLaAgSXWVDJU/6j6J0+GFRLVaAqRKFB6qopRMKwwil2Bvg27LEnknRom7Z3Lcy8zjJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k7Pnd9rj; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k7Pnd9rj"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-220e04e67e2so165280895ad.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 08:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740500525; x=1741105325; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=srEHHPJ1gbuHEqVaJLaXK3crvBH+hHlIUvswV7lRBmM=;
        b=k7Pnd9rjA+148lq/gxPqt0SFXUlmJr0pUTeg+M2a3IDhHkGtw7cqeSMjRx8BsurWrM
         9xtake6Q9lST2G4axByK2hsPxxi0evpTBCpGkU0WhZmY9NnnJQ3u1c6KS1Gy7ThH2JJ4
         BaS7ZIOtJphchBH/eYt5gsOchwPu6qfI28ZqSY89aGNu0yfk3XYqA2QPTwlBbe6sh4ac
         IUSiDua/S3JM+0A23bXBZBDyAV+2vzSgiofGP7ICh1NHJkAznSUGWY523vXNLedC8it5
         OKZfQp5ItNDcUYJvOS+97m+IeE8Uihx1VqepkonLPDmxmKO5iZcDCHD8DI5bF4tFMaU2
         tZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500525; x=1741105325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srEHHPJ1gbuHEqVaJLaXK3crvBH+hHlIUvswV7lRBmM=;
        b=nrGp95CPTiUf+MMpxlFMJWeHh5m/VjhXmwDd+C9StACLAcNpGOIGuh3q3gIBMUKliH
         xMHB5vb3XH93Bciwp5oycN/pYLgB76mgF9JgRj3tKyTFNlKF4kVWb8jLYwqL+kzw1muZ
         OfQi0KcFdJblWUvKegkEKQpXwtI7zHmShMxc5geJMM3IPeJRhmTkMlr2xlOS4ohbqGKO
         8qzMrosFc71FaiYCoKMlSCMaUjRFmQ/61dHUKj7TPIQJqAeOUhxSynDwnvyTHd6ve+GW
         Qnk+ofjS5NzClE0TIeyGQNxs5JXAaf+Svbgg3aeORJN6il0Bd+/gzQ4sXT/9HKVuvMfC
         KlSg==
X-Forwarded-Encrypted: i=1; AJvYcCVxSKfuE3ZzJ6xsFZwPktoYuG5vjYwmd8UdBDAGkUaUyxeuAktosjnxHDTtCmdXhI2iyakQEuwDhc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfcY6YV2J2P4jzV+quPCBThAi322LkzU2e3FbTowXcB/KHq/YI
	gyVaplrqj0PWoxiz3wSJJ+s6k/aeeNa5LUI3sgHM/+BaBNeny2PlxMXBjg2iITZEwYs7TIhumJV
	Z1Q==
X-Google-Smtp-Source: AGHT+IH27/HQuhUl4nm8ASPw7CT4Y/JWCbdYuVCqkOCpy822McQQGOmUejPqAig7S/UmITePMhyGuWHT7Sg=
X-Received: from plog7.prod.google.com ([2002:a17:902:8687:b0:216:6463:1a1f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d50c:b0:220:e5be:29c8
 with SMTP id d9443c01a7336-223201f7ecfmr1037415ad.32.1740500525271; Tue, 25
 Feb 2025 08:22:05 -0800 (PST)
Date: Tue, 25 Feb 2025 08:22:03 -0800
In-Reply-To: <20241001050110.3643764-25-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241001050110.3643764-1-xin@zytor.com> <20241001050110.3643764-25-xin@zytor.com>
Message-ID: <Z73uK5IzVoBej3mi@google.com>
Subject: Re: [PATCH v3 24/27] KVM: nVMX: Add a prerequisite to existence of
 VMCS fields
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 30, 2024, Xin Li (Intel) wrote:
> Add a prerequisite to existence of VMCS fields as some of them exist
> only on processors that support certain CPU features.
> 
> This is required to fix KVM unit test VMX_VMCS_ENUM.MAX_INDEX.

If making the KVM-Unit-Test pass is the driving force for this code, then NAK.
We looked at this in detail a few years back, and came to the conclusion that
trying to precisely track which fields are/aren't supported would likely do more
harm than good.

https://lore.kernel.org/all/1629192673-9911-4-git-send-email-robert.hu@linux.intel.com
