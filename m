Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640F614D281
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 23:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717544081; cv=none; b=KtVo2fqcQ6lh1RYF9d14AK5bjr5obpoi/RJBjSXS848fMHXMAEpLBtbYY3sU8LM7GUKljr6XNa6cLQVgyFtQ/LP6jvulnRO3EQi6v77H/iaufTRYeuxxZsdMZH8nLaNCyMcXT7cceMl3uaS9ZTmF/NprCwYqWOX+2mvqVp9oTgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717544081; c=relaxed/simple;
	bh=/RyllKS71H+IC820enjmIT75ZvOYvn2A1K/k4ayEGS4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JM78XPaPgE4Auh7pf278Tj7IvqntFU1sXs2mGjbRhr81c+SEWzRC4P0K5FWYT7UknTuGjZptMZ7aIQ6XUoc+MAjCCb+Yju/VsaqPGjezDbnjtWvKO1nvC8VxEMpdaEZANw+ZjhE7YlqJibg13QJxlsn9eMGdDzTPxedwDzTbnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RrbSCWrl; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RrbSCWrl"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-6c554776d0fso321006a12.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 16:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717544079; x=1718148879; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WiOlI2KgvibXBloj2qE38W2kmcg/QICR4XC0NHpgGeA=;
        b=RrbSCWrl7cPBQ679DsI2cMdWhp/tUoKClRowOdGsW2SGFl+twxDxIUPa65t0xPbKcJ
         87QALdPajRHrFubf3hqe7A8p/Rjgk6K8B60gnvbWcacLK+mlRaxMmDWQekmUGjLOxQwX
         p+lx5SEQt1dmdjYtHElpY6FDUPBt7mdJvnRUncVAWIp8E04dm3oIj5iA8gRWkORD6wrh
         eXPLFWWVA3y0wo79qRZodypujBwiWyv7ms60c+8LRofvyF4313MOpBeUYrIZQqgg4DFl
         CbqN80KkVaV5SRUjbi74Q8PSySRtx6OXdnn4bZTeRNEF+y1lDHJIR71k7PRFNe00o5HW
         0s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717544079; x=1718148879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WiOlI2KgvibXBloj2qE38W2kmcg/QICR4XC0NHpgGeA=;
        b=dOnSom8vszu55nLvwPaAu/YB00uN0OXwKVtTlkYrtRXqlarTe186h6OTqz942sN3+W
         Sdi+sotoN0M6+UZa68FGPjktw2c3CMOF6Oa7GKftlKEUFtvxPknCwTy74ufxfT924vv5
         +fHsUxzDEgRoocvJTr39bJPQBMYJJjFAW0xD4eb/4X4HbYtZAvcOTZpZM5p/40c49Oub
         TUGbN2zxzD17gLV+yZF8Hx0Gu6pHl1ImbhwqWPKdNT7U5d7I9ZwWKk7wQnpkHrj/9O6/
         aNQMJhpBqcBfWL0Q7h/YBgBr8mx3fzZxC9dvcA8yjgrLWc8JwQ7VyA31OrMoOIHAqxHt
         mA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4DOu8u90fygBp8PcQIh0NFhO/mPItBB5yUP4UK0WAOHFj0nZO81IH7FwMu5HOrFQacuQghBSK1oF5vfvlXv3Y1ivPebBjbyye
X-Gm-Message-State: AOJu0YzM5NLW8xMI6/qzntdMpmtSFPXQoPHE0y6/74ngXSeDekBn6qBL
	6j8JjD1zL7SfWguTrznKBziOipRGacFGQtrr9QyHolE17MfMmvQdLU/P2WD7vf/OibcZQfIF57q
	Vhg==
X-Google-Smtp-Source: AGHT+IG9/QfGlk3w+QqLKKOftRIh42oh6bp6yqD4YsiF/v3U3LPU8jLyNQQmMLcvrkoGApD1kHD0qQ+VMT4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:2309:b0:2b4:32df:9b7b with SMTP id
 98e67ed59e1d1-2c25300652fmr48802a91.1.1717544079451; Tue, 04 Jun 2024
 16:34:39 -0700 (PDT)
Date: Tue,  4 Jun 2024 16:29:27 -0700
In-Reply-To: <20240520143220.340737-1-julian.stecklina@cyberus-technology.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240520143220.340737-1-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <171754323407.2778815.4127978352090083510.b4-ty@google.com>
Subject: Re: [PATCH 1/2] KVM: fix documentation rendering for KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Julian Stecklina <julian.stecklina@cyberus-technology.de>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 20 May 2024 16:32:18 +0200, Julian Stecklina wrote:
> The documentation for KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM doesn't use the
> correct keyword formatting, which breaks rendering on
> https://www.kernel.org/doc/html/latest/virt/kvm/api.html.
> 
> 

Applied patch 1 to kvm-x86 generic, thanks!

[1/2] KVM: fix documentation rendering for KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM
      https://github.com/kvm-x86/linux/commit/f2362c04752c
[2/2] KVM: fix spelling of KVM_RUN_X86_BUS_LOCK in docs
      (not applied)
--
https://github.com/kvm-x86/linux/tree/next
