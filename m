Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577768;
	b=EpROfBTR07dvdZIMvVTsG/EhU6zgeApPVybbU/cDzjrLiXtwJGzMNpXY/v5xsznn91HS
	 e8PfSjQ5x2vMn7V6Nir4+9LcbrCopX1VUf6f+CC3ve06IB17hCe15l2D2Mw73MNF8JAkl
	 3uDBuAt0lgRHwk1mRFmipW1IkxxEBnHsnG39RiGe360qOVcmNYVlefh3DObBf8LBmV2Dw
	 x+hzZxGOZeQaSzJNEZ3xCY8kmcwOYyT2tAXCTq34vlmmhQKufHJjwfpvVQVdyYfAuQi++
	 Fc+me7+V/erharGWuOQiMy0+8z01UDu6YBsDo/2HobEX5fTvfvFyeAFC6Np4BNKpJGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3v73r32eIAJAgWPi1LsXT3feGTevyTVBk7sdUb/TcA8=;
	b=39kisx0At2ySKjtxJw+VcjEJZmYGL6Z0bi1ScpfGy4Z8s23O2xFJ+tqs0KIo1pmlrhAu
	 8YqaAmR/tziCFyfYKOo9tHuq/f357feYo1i4HGeDyszEpx8olYZ90tjrZL7xFDhrrtxwQ
	 y7kUsSbR7D1XnwnMqBqtO6nTvNVihAepzblXR82cRzH0OCvRxJNlbpvtkmaI0jFOVtqMm
	 aac2rFZaH8YwrduuFd8BiWw14kCkbIVV1N1/uiEEc/iwjFBKMAAo7VvW96BdayRjl8tRA
	 62YApA6++7H72VucCbykm2uTEjMacQPG32odM7IO2X5QzZlPmv6+IbtOHf7al/p5afg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iYprxckR;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F00606A33F
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F00606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iYprxckR
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso764952a91.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 05:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577767; x=1795182567; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3v73r32eIAJAgWPi1LsXT3feGTevyTVBk7sdUb/TcA8=;
        b=iYprxckRt6x0jveQ7KIO6R+oa6tFiYQfSlMcbZeYNkZElf1SB6bHrK9uNemcL5oERW
         JhBhmjD7LEkzuwclSSGtFi8rLnFij9YqELQAndFPhuWI9gCQC10TQDtD8DoiOnpSH0j2
         HVjFKRqbxI13gzT/MYxeD/jL8356LwhFULpVEx6CDY8d5wA1hfQQpOq6O4L8pqpiDPp6
         HbI63zWl1Ozdh3NXXVXkDOnJO/DgRq1C2QmRF0R3mwzq5LUSDPowEpJb4meLFazbRWGf
         Ez8ljTE+47qpn1tkWgbwYUJo1cThf1QiMHn3kI1ljYZOpvksMa5d85Mf4VwYBml1Ckrq
         a5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577767; x=1795182567;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3v73r32eIAJAgWPi1LsXT3feGTevyTVBk7sdUb/TcA8=;
        b=iWI1d5ZDiqsDobKD7RG6H8C2WmW3/+XMa4MqMaUNE9KhWazkx+T0F9zF7BQrHc4c+k
         EOC070pmKgdL6Kgo9tHE8OOYlODOVpIlKDb8mxT7CkE+grqIxVzlu328DSP/DMr0m7fg
         +M00BuJp6/LQ9aOG4NpG0DXAu41X2nfceRcxH3njERW339o62anOxcsjZWRULoXfB3GG
         ePOIaGH6wu6UQVKqBNBQUlQ8oijJmul4bzMUBrx9ctz1NktGD0VGMr3zYX2gkxQu3T2F
         IpaHyjzLh6zF/NbcRCF57FPh82UzmJ4xM7mE/McqfQb6wlPx+BqGTLZIMqha5tp/JxL9
         Yokg==
X-Forwarded-Encrypted: i=1; AL+hErGdZ8GcKrXuLsScCvfi/oh53cAUgd29NSMupD2kdTdW8WEYYIBmcSantvOBsT1bVOrxoVK4fdL4tIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XLlZpTaKzLrUQzGgwCsPlt8U1Rhvoa6+fqe0X1LshcvT5SCee
	4leGgNKsJYTpaefXEFRmt+q2qpduSWnzPxdq3TsBqBvZ3ywKbJv1aEzdOZKxyvBCpkRbpBWH+zb
	FbSx2jw==
X-Received: from pga12.prod.google.com ([2002:a05:6a02:4f8c:b0:cca:d82:9104])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c8:b0:3ac:7842:bd50
 with SMTP id 98e67ed59e1d1-3b1b0a428admr2241920a91.15.1794577767011; Fri, 13
 Nov 2026 05:49:27 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:40 -0800
In-Reply-To: <20260731150846.1728164-1-dmaluka@chromium.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260731150846.1728164-1-dmaluka@chromium.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441846682.83214.17243719876978660073.b4-ty@b4>
Subject: Re: [PATCH v2 0/4] KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Dmytro Maluka <dmaluka@chromium.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Mathias Krause <minipli@grsecurity.net>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Vineeth Pillai <vineeth@bitbyteword.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, 
	Aashish Sharma <aashish@aashishsharma.net>, Grzegorz Jaszczyk <jaszczyk@chromium.org>
Content-Type: text/plain; charset="utf-8"

On Fri, 31 Jul 2026 15:08:41 +0000, Dmytro Maluka wrote:
> max_vcpu_ids and KVM_CAP_MAX_VCPU_ID are exclusive, i.e. the maximum
> allowed vcpu_id value is max_vcpu_ids minus one, not max_vcpu_ids.
> 
> Fix the sanity checks for KVM_SET_BOOT_CPU_ID and KVM_CAP_MAX_VCPU_ID
> and the selftests for them (added in series [1]) to fail when
> bsp_vcpu_id is incorrectly set to max_vcpu_ids, not to a value below
> max_vcpu_ids.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/4] KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive
      https://github.com/kvm-x86/linux/commit/9b04ebe5c085
[2/4] KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
      https://github.com/kvm-x86/linux/commit/c36d436e7335
[3/4] KVM: selftests: Improve bsp_vcpu_id and max_vcpu_ids out-of-bound tests
      https://github.com/kvm-x86/linux/commit/201aaeb1df8f
[4/4] Documentation: KVM: Clarify that KVM_CAP_MAX_VCPU_ID is exclusive
      https://github.com/kvm-x86/linux/commit/ea6d489ae6c2

--
https://github.com/kvm-x86/linux/tree/next
