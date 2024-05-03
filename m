Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A9559B4E
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 22:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714774401; cv=none; b=YhUffmIlDRHpZuWbLq6ozT4r69b/2zisG5T9nexF3pmuphZE1znOk5SaJTG/57nQPq4JsHHAq5cH80SWBIRdQ74rQcItOB+0Hyz1w6rIJBXYvow258L/j+MO35nlIeJARxcu3M7wCHKequAz4OhVueVM5qAfeuDONaa18tZHS9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714774401; c=relaxed/simple;
	bh=tTu4T0YSToV5yW1ztczWGRMlzVAablQJ7IdHacuoYhE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l3lOp29elfHylHNjLWVfFCeK29y819i7Fpv28Jvg2Lzb0jzVEBuTF3CQDtOgrWuAi2F0L2UfIi2o+HuylWytfeonea1Keif8so6EFj3nKJqwMIlTJ5JjLZ6kqVdtkasAu48pr7pPRTwuYfVeHpdRhfsu8nqZYVjySwMdgHRupcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uTkfVglz; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uTkfVglz"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-de60321ce6cso335019276.1
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 15:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714774398; x=1715379198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPuqnqlQf1TFbSeYbj5+H2+Mrg1R7W+s6tOfYqt9u3k=;
        b=uTkfVglzYHyJBMbyqCy/8X0psriDURjGmWZPaWZJNvJAY4BHiBAOxT9RgvAqq8+6ab
         ssUH7OVxVir8NFFMWpuuY973La2gOXDLHAslZ+K86ozSO0OU7xQWgwYHANmGoRL3ATgE
         1+VorM1+iD5cQ4R0NNQa1BjNt7Ozki/YTZjFcIAHMbboRT9xHe9K/A11MOf3sMWcSX9B
         LeC43k8tuwpzQ9v7mOMMBlGSr8NqtcrXVLT0QVO8NZJOQi4T3X/9hhDB9TaOMVho4sh1
         6CwPKsNKLcQx9BSsv9WWVt2CBS3ZSYNSyxKf8OOfeMyYnT9KAZrqL1+SCDxIqR36/t6b
         ynGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714774398; x=1715379198;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lPuqnqlQf1TFbSeYbj5+H2+Mrg1R7W+s6tOfYqt9u3k=;
        b=PCkN+XQjRY9SWgjVSMJ/B4KAvXjzZ4HlCg5GPLOPDOW6V09Tw9/Fprf5bNNnMOhW+x
         h2Z2C9YL3Ssiy+gY+wVMf6/Z9mlat11zSGV3Pu/Zxkp6nD+urCkSzTe/NS/SXl531XVI
         l7xb+Vsxa2r31b4CLvGvJW0p7KsG2LPdx0RHkbwL9N2+5naW+DDHHFyW+xABt3+Z7IB+
         krSEZ94Lj8eSF2E0PgdCbZ/z6XO3585rwOw4pk0dyZW4Fo18ySSyboeI+TkVYmNQ1MwX
         VqJxeRnNiNa53y3BvBUN8TqJ73SUkFvlFpY0r9bGZ2KW/75adNfOtIdAX/pfHz/aDqGq
         CL0g==
X-Forwarded-Encrypted: i=1; AJvYcCXzANQ0QCPXdBcVtbnWXc0LAkg5/xo7TGUXkcKrWQvN46yMVYhNQagxIFQYpgma/mAAm7PMMCgK5d2q6CTQBNtsniUtLbJsiNHH
X-Gm-Message-State: AOJu0YxaH/iTXUG/tnv0hfumKvrDvhdjYbojdVSAmqdhJy0SlqpRQrSt
	YeFvR0Z0JxoUCnKaXYrjKs6mGCNYHMxgcdFOQKgAybfle9Z2TQiZrak6b6kaixtnpSsUS0aPv0i
	v6A==
X-Google-Smtp-Source: AGHT+IFTEgkYDtwGLWZJdyovW4tTRZOEDccm5U4FAzOb/u3poMhryEcruOMiy7+Pl9xE3D52TIrnELvR2Fs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1007:b0:dc6:d233:ffdd with SMTP id
 w7-20020a056902100700b00dc6d233ffddmr1277567ybt.0.1714774398707; Fri, 03 May
 2024 15:13:18 -0700 (PDT)
Date: Fri,  3 May 2024 15:13:12 -0700
In-Reply-To: <20240424103317.28522-1-clopez@suse.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240424103317.28522-1-clopez@suse.de>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <171477432131.1257597.4087115549657208837.b4-ty@google.com>
Subject: Re: [PATCH] KVM: fix documentation for KVM_CREATE_GUEST_MEMFD
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, "=?UTF-8?q?Carlos=20L=C3=B3pez?=" <clopez@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2024 12:33:16 +0200, Carlos L=C3=B3pez wrote:
> The KVM_CREATE_GUEST_MEMFD ioctl returns a file descriptor, and is
> documented as such in the description. However, the "Returns" field
> in the documentation states that the ioctl returns 0 on success.
> Update this to match the description.
>=20
>=20

Applied to kvm-x86 generic, thanks!

[1/1] KVM: fix documentation for KVM_CREATE_GUEST_MEMFD
      https://github.com/kvm-x86/linux/commit/2098acaf2445

--
https://github.com/kvm-x86/linux/tree/next
