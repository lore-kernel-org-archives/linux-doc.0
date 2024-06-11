Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05F3BB48
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718123275; cv=none; b=qFXwlZQfJ8tMGsRLShh5tfNg9uHFeGoD16uCnYS+O5v5KOXeqrfp4qwOmLCSBxE1Sw1W1qt+fPtQUYkrKu+qj/v9xTLt0ofiS4CBu2FqdB/mBgeEtzHBAj/vHIYrlU/Mw0wJW+GSteqbvTlofqKmnuI8pnIyZQboCW88Ov2kSFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718123275; c=relaxed/simple;
	bh=MGp0DQZa5WkAK57TrA5QegfsQz0WdtsMvA+SLqt36t8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PsAdwAD003zzjaxypc2iorGKYrfxXcS2y4AYCnEdAnC68RmwaY6/RyG/hNB0MEV1ue07k9VsdyHOdhBnpd5UPl/RLk6wvw5J1dei5Ir5DpWi/vHVaYQ23T+tPbV0mEuhoymWJojIQNYEnaLt2oKiFOFfgv1uOzDKNY9Pg3ZiaKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ztgaOMwM; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ztgaOMwM"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62f3c5f5bf7so4350027b3.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718123273; x=1718728073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBtW/SN1QDzI5d7VyA1ik4cNSwUHhHulrBvovSa6A18=;
        b=ztgaOMwMbt0o4QBqLWkG4JkS3Qd9nNuhatvB/h9aC1ShHFelaWEA7iNTBKgcg6zgKz
         mUyawT0kRhuhUuecAdpeHR0Y+z0hi5pFZvAu9BiTj/NOZ99g89BQRdneQf5kIbqA6SYZ
         UTdEMyyO8HIDfb0/me94gLDsTsP92ZVAyQRR6sEjhmo0/XqAiK9PEmO0LN98mtgqQuo8
         QRWWboP8LFE+i1lfA5YfNiCPhIvKsmh6H7imktgEmbSjvRMyyVOM+fQg0U9dPTh62XsL
         EKyLYAYo+oFQNmeD0CibwiRCxnT2hE82heRar6njbCLsLP4iigNC9MwG+3v1Iy8uaC4N
         TKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718123273; x=1718728073;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gBtW/SN1QDzI5d7VyA1ik4cNSwUHhHulrBvovSa6A18=;
        b=MYOSLe7WhRjZkwIUw7GhVI7A9dGHZj/HGTuLNUi34Ff0yggwPq7Kw/ULYP7fqtkb5C
         Y10+hwF90dU5M3V2ORKx/24qvhLSii7D9JsUQFVPl17Sogr9VLwN4aZzUqt4CqKaLVKq
         Bsy0AUBXEPCzIxFMy1/kbxePoUB/aFnY6ipwhzNcrQ8i9O1akW+xwjbKjDAQbVCx2H/E
         AhfO3Mui8pPv+Iw0gPcwiWvv93nHq+nh6tysPvutVm740Xqk/038nS9A9YlVbyAxlz+N
         CZ8KrRowLS3OAvdQ5ik9SI8IhY4fuzFUAebbZjxfKEBeexqA6nVD41eWw3vHrMQc8Sbg
         3rmA==
X-Forwarded-Encrypted: i=1; AJvYcCWsFipFn0F6aY0YVTzSvMOCtkSGY5UjawLGV5wC+czCnrogmJ/TpHqOUL7X52/tRbfXDlNO4eXTNHvrZnWOBgzmbulkiUsdETcs
X-Gm-Message-State: AOJu0YwTYybWsOtoFpqegNJQyI/6tGdjWQSJLhbQeu2RzBcohZTkZ/ec
	2XV9aJdLqCQlTXO1sLJj/skpb3hVD7PuF7EkyAeY99+KG8LblR5Lcdz31doaiTGRlk8oLSWcekB
	L5A==
X-Google-Smtp-Source: AGHT+IFuhSWhkkj9LM8bxMHFkgYcBA/KjivjCRMjaZYzuBPm7Zi4XO4A5opP2YbmYnoSgdSpD3lgFd2vIpk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:6681:b0:62d:48f:30e8 with SMTP id
 00721157ae682-62d048f3220mr19313147b3.1.1718123273373; Tue, 11 Jun 2024
 09:27:53 -0700 (PDT)
Date: Tue, 11 Jun 2024 09:27:51 -0700
In-Reply-To: <171754327022.2778929.14475719898493728460.b4-ty@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231116133628.5976-1-clopez@suse.de> <20240424105616.29596-1-clopez@suse.de>
 <171754327022.2778929.14475719898493728460.b4-ty@google.com>
Message-ID: <Zmh7B4QImxUxMb6F@google.com>
Subject: Re: [PATCH v3] KVM: X86: improve documentation for KVM_CAP_X86_BUS_LOCK_EXIT
From: Sean Christopherson <seanjc@google.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, "Carlos =?utf-8?B?TMOzcGV6?=" <clopez@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024, Sean Christopherson wrote:
> On Wed, 24 Apr 2024 12:56:18 +0200, Carlos L=C3=B3pez wrote:
> > Improve the description for the KVM_CAP_X86_BUS_LOCK_EXIT capability,
> > fixing a few typos, grammarm and clarifying the purpose of the ioctl.
> >=20
> >=20
>=20
> Applied to kvm-x86 generic, thanks!
>=20
> [1/1] KVM: X86: improve documentation for KVM_CAP_X86_BUS_LOCK_EXIT
>       https://github.com/kvm-x86/linux/commit/d3f673c86c5b

FYI, I moved this to `kvm-x86 misc` to avoid a merge conflict down the road=
.

[1/1] KVM: x86: Improve documentation for KVM_CAP_X86_BUS_LOCK_EXIT
      https://github.com/kvm-x86/linux/commit/508f0c7bf6d5
