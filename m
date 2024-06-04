Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512AE140374
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 23:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717543824; cv=none; b=TM0sGKwppac8Jt8eefwoO4349XH6zUct6YhIRgElnRPUIItOmvEr6uF0wBINnvMsZzSUW8Xv8olY7MeS1vj8L3zJ1U4eNnEXrz11J/c6F8Lyu9/i1OPd7qKVtKm9Ovpk2KWVb73/oyGyuIH+TiHKTXkekbxQPhbrrQKHppQJaV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717543824; c=relaxed/simple;
	bh=VjJmX34+aTYJ+9HTQ5vgX8U5z0y5Ts+H20MVJUkGYKM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bRCpGgcekLmDPjblCcwR2haYmR+EMxVghFZ8lAHllB9sV0QZw6sHuAqiB6kW+umJtV544H7ciUESgSRs+38XipQf43L8amH4/YixmOC/5kjP+yYTYW9qaQFGBHZgtOq0ft3auEDQjAXHvC34oh1HAWWDWJ/GBkPlyWzgifWv/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lk3kajkG; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lk3kajkG"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-627e6fe0303so105699527b3.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 16:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717543822; x=1718148622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfypw/c+5RO0tQuEOThBLk/AkkGlXduiTmVxQ/7nnIE=;
        b=Lk3kajkGkq1zw9xtCwUl23BM+hsOIduU1mq7Gx46PfXj7807AVrc7pn2mUAP6PVqS7
         HR9ke88QLMjLGm8KoE7v5CxDZnlZzNn5a+7BldiFBgIuSPb+VJRaAbeLrOsqmDS0UgOr
         y+J/U9NfIMXE4H20FlppvOPEUlBmAgF3FNyFhKWKy+twE9Z6SkovGq1D1VO9+m9c44ux
         9hWQJLdcv0FWAdVmes4cpe50hYrSkdSeMoQFCJqqa76asb/2K+rd5kBb8lEa1YrJvsfV
         rfT0bIJ7KN+A2AQpsOwqFB/SDVXEpvGgW8gL2s7vd3BllJCRFPyA1Ft7MKUmeoUgPQzi
         khGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717543822; x=1718148622;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xfypw/c+5RO0tQuEOThBLk/AkkGlXduiTmVxQ/7nnIE=;
        b=UIyuQFR1WODCTqAQ14N/42ap9XqESMiugajHt3eo1rN/IrejUtbjb1Rsf6kUoTVP2K
         i9w1IaPiC5WPyn77N5Hjdh7uWZHrb3UqXJQWIblQos1U63Qh4lJicb+uodhjKWNeqnh/
         1qSVob2X/W/jsZ5XHRA+fTv+Ee1ZOWRnD/emS8fmGKBtIGhNMH9FPRYal1jZI67RGOq+
         OjdQp7+utsadPeiiFieYU77ALOAlFd/utTDV6Jsf0a9WfltB6hE5hGQedZjbcLUE6PCG
         vshprbrxZUiCQkXcGcfRIlxcnjSV5ODlB5/MF8pf+qBHyadEFXQtEKvq42nb6jmVBqoc
         Zk5w==
X-Forwarded-Encrypted: i=1; AJvYcCXsYA0YEwohlQEbf2jsKMT9Jtix6f6h23dyo46STgs1FK+r7y1k662G2qLZKDRpWrDWYUumOOJb0M9xx9lWCkCAlT1qCBnjw26y
X-Gm-Message-State: AOJu0Yy90n7nOutyjWktmBTZCLPlCCTNCXlh8sKMJ0vhdXYaietOjtKL
	uj0LaaXKU1AchB/CTUjZIcbdNpZfytDJvAq0QJ4uH1HwEcdJM4KQ27bAXuo+XNeYrEJrNO2YWzp
	dhQ==
X-Google-Smtp-Source: AGHT+IGYHhwobD17I6BcNx47OLoZruHxw9mWITV1BFNUGFWtzbkWqhjasbu6vT69tB03IJERpEy9c90wwX4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:6486:b0:622:c964:a590 with SMTP id
 00721157ae682-62cbb4ba98emr1679267b3.1.1717543822427; Tue, 04 Jun 2024
 16:30:22 -0700 (PDT)
Date: Tue,  4 Jun 2024 16:29:25 -0700
In-Reply-To: <20240424105616.29596-1-clopez@suse.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231116133628.5976-1-clopez@suse.de> <20240424105616.29596-1-clopez@suse.de>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <171754327022.2778929.14475719898493728460.b4-ty@google.com>
Subject: Re: [PATCH v3] KVM: X86: improve documentation for KVM_CAP_X86_BUS_LOCK_EXIT
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, "=?UTF-8?q?Carlos=20L=C3=B3pez?=" <clopez@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2024 12:56:18 +0200, Carlos L=C3=B3pez wrote:
> Improve the description for the KVM_CAP_X86_BUS_LOCK_EXIT capability,
> fixing a few typos, grammarm and clarifying the purpose of the ioctl.
>=20
>=20

Applied to kvm-x86 generic, thanks!

[1/1] KVM: X86: improve documentation for KVM_CAP_X86_BUS_LOCK_EXIT
      https://github.com/kvm-x86/linux/commit/d3f673c86c5b

--
https://github.com/kvm-x86/linux/tree/next
