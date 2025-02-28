Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B80D1F09B3
	for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740762414; cv=none; b=o4Vyphy9uutguEY9GZsOwv5t5uZfUP09v4oj+Aq0+rTy7y0utJddWhSlw9MpyNgw8CHglQbVJnb1TML/F/SPasGBah2srpx5DyxPDAzr5qFyT2vmF1kXzdPiUAEC8Ks3zscA90op/K2YDmEQ/aYaBXIqfwDyQiEJ/D8gHqX0BYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740762414; c=relaxed/simple;
	bh=GhxfjYTlO7PQcwgsyQ90b3skm9cvQU1MOfFdjK9ntnc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kXK4CbCakQWc3UcUO3S9CF8qBYps0MLSj4cFEA1boTKjCTlW4XpwZQA/eXMTed0nJa02bMUxFfCwF7AgLTYyKwpQzuVS5i6FnevpEPx0g9Q07aCXcNFQYQ2ku1If2lfv9JALQGwGMWqonhIZgyPT1DnCF6vTOiQq9ig2W9o6BnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=am4UwQYp; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="am4UwQYp"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2feb019b13aso5932328a91.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 09:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740762412; x=1741367212; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NiD5Cq6lH6pig3uaUeBMc6Aen3xtXFlOq/Rx/GGAE8M=;
        b=am4UwQYpoaoyEJDcpI+XbDgS6/tviKXCnmR1VN5+u8THBMn8idqYjPkDyaGOhYBOIO
         SmcJPptnTi3B18qIwUp8EoSwQETagS9CBZNcnx19QUBrBc2Lf+ZiGTTvKFGwXniDiaeJ
         S7IXYkxr3cCTDTbWNbzp71h59oc+T/Q3ByA1HqKBG2bvPaH2QYadui6jRhGoUkBNervc
         s6w3M17Q5WWWp69v3Hb93y9r72JBAwwFJ7SR1AzQBkEo5IjL+uCWaF0+mo5KnmDTcPzg
         76dIxu6u/I3PMfX8SpMosvIsYdpr7jeX5wkri9lbxo9lMSc5nd+dfbpG0JoGDGAaICtO
         eW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740762412; x=1741367212;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NiD5Cq6lH6pig3uaUeBMc6Aen3xtXFlOq/Rx/GGAE8M=;
        b=CYvD8Pcx/LckyN+jzgLxChXxEry7+u4TcK+K3x3wXWMv+IsatLPzvlkLi7vj2FhHf+
         2QnMM7tX+GibyMtxai1sD5lbS0dw/JllgmctnBrWleZR/gtKEqq6fDrtsA34hxFQTWYK
         2uGLWZ7qSy2McfOLpJhZgyzuNlrYjG/XafRfWhTuueVNvzVgttmcKFE/GDhYJgLkp+7a
         66juP8HT8Y1JER3yGCnFWgJuvCgV+PDoqCsswsxm/9WqLjet4i/ytcEQShPbSsMh2/Ve
         vVygYOAqxWtnIxwY0ABTEpCQ2KkUQLQxNOIM4uPZFROfCvbIYgRMxNsZKJaI7EYhZLyd
         4MEw==
X-Forwarded-Encrypted: i=1; AJvYcCWAG/7wblMstq+iRhaSY3Z6Zyzdfjj648Pj01QT+HK+0EbpXfMAan9LyAl9yooWHKtggN6VJdsu4Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRI9jaQWOEvzFb0gzh0d9AQK5ZjyJNdluwGQ9SK9u9sFqyp4Ed
	AOBqKhREWY1KdIZS4OKMmqkKbKBR3s5QhSW+yzK5IRrO4S6jJj5tLSFzROzvsKAuD5FXBxjyksy
	Hcg==
X-Google-Smtp-Source: AGHT+IEO4OQkgM+IUhtTj2siheuh3+5J9XXD5K0QE0gxXSk5KvQNCy9VBxx6kh2EerS8p7ugyt/FmeViB5Q=
X-Received: from pjn3.prod.google.com ([2002:a17:90b:5703:b0:2fa:e9b:33b7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4990:b0:2fa:2252:f438
 with SMTP id 98e67ed59e1d1-2febabf892cmr6764957a91.30.1740762412656; Fri, 28
 Feb 2025 09:06:52 -0800 (PST)
Date: Fri, 28 Feb 2025 09:06:28 -0800
In-Reply-To: <20241001050110.3643764-1-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241001050110.3643764-1-xin@zytor.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <174050797241.2702151.11096228988534371837.b4-ty@google.com>
Subject: Re: [PATCH v3 00/27] Enable FRED with KVM VMX
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, "Xin Li (Intel)" <xin@zytor.com>
Cc: pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"

On Mon, 30 Sep 2024 22:00:43 -0700, Xin Li (Intel) wrote:
> This patch set enables the Intel flexible return and event delivery
> (FRED) architecture with KVM VMX to allow guests to utilize FRED.
> 
> The FRED architecture defines simple new transitions that change
> privilege level (ring transitions). The FRED architecture was
> designed with the following goals:
> 
> [...]

Applied

[01/27] KVM: x86: Use a dedicated flow for queueing re-injected exceptions
        https://github.com/kvm-x86/linux/commit/b50cb2b1555d

to kvm-x86 misc, and

[02/27] KVM: VMX: Don't modify guest XFD_ERR if CR0.TS=1
        https://github.com/kvm-x86/linux/commit/3ef0df3f760f
[14/27] KVM: VMX: Pass XFD_ERR as pseudo-payload when injecting #NM
        https://github.com/kvm-x86/linux/commit/d62c02af7a96k

to kvm-x86 vmx.

--
https://github.com/kvm-x86/linux/tree/next
