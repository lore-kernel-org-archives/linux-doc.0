Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C78A1917CD
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 01:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750296438; cv=none; b=loMid6ArYPbGHZCxNDHoKUDuWNSzMAO3ukzYBG3tjzrEXnq3kah7mlLFmW9Bktko1rWzF2c6PqbWVI3sznWsn6O2b70m4KbFfg+WfuGBc45buXZw+gPIOSGyDflc6Yt8XAIlAPpgDxd8Vjqxq+Hzi9xhr19tsC/yit5tWZZw3CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750296438; c=relaxed/simple;
	bh=vm4zc61kQIKBtTJCoGSRV55SShr3qfwIna2hrOexzxU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lUiSBZAGeayQeil4X6St7juNYCM9au0y4+GGQF+L8Hw3ZjtetPHnQi0UhW7Hq6AsVh9xi2mUc+dHRqigOxKGqiwZGvkz12B7xi59FBHe+C7Z2L9iVL9rIbW2kxs/EdnhGJCw5I9a14qf3Ki90PPG9IoIkFJ+LMkFZ183pVdWmcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aNrBfH9+; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aNrBfH9+"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2358ddcb1e3so4107635ad.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 18:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750296437; x=1750901237; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFJAbnmipeJwNloKOstVWAEzz4JfWsiupTDJwINriZo=;
        b=aNrBfH9+7vQpBvjpkC9D5464tuDixZl23TsJBQDcNgLL0KXLkX1t/EjewGgqu5FHyY
         58BNdZtINaZAtWmMnnQ7R6/9qnuSQPVs9UDMlxql+qFhGQwyw3s8xa5Vmfxr28cw6PKy
         Urr9/WbWuTyC97EP0ivHMS1OAEWBklPtw+FeTLOSwqZ1f88VoHEGb+If9nlEkoxYzA4e
         eeVB5QvDLyK4Ogl4z5yJM+URjXnNSsPHT6SjBNM/YAuzj8VDLLXOuCjR1k9WJBQPptuf
         KLpa9yFMS3Tj3ITMErsUuCgsW/NJM8gCsQqiiBiQBf9uxBcg+HEg9SBGq8pYJ7KcJqsg
         Gmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750296437; x=1750901237;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFJAbnmipeJwNloKOstVWAEzz4JfWsiupTDJwINriZo=;
        b=CEQoNbo/G7CziVYA9AXHp6ecF/ok7PxD5Odnul5y30oPeFDzbq7WR4dlHyKb26Qbdq
         VGAMPIpRY9uEclLyCioyKY8yZR8EA2tQ0U7+tOP/VgRQifM+dvE7OwAoCI/+xWqVROW/
         syR0tyAsrnviq5ZHsd1LiGPEP3IX9rAz1Y/aM9t8IXmW33B3L36weXtbbpgNUjKA3sUt
         ZQX4+4oMAW6sxZSLL3cLkbrQFX2bbRE+p6aDI050B4l7Mz0IOQ26qsh+7iSZD4lUElOH
         bRPBPyyyJWH8GSRMRYbSbhj6Tw/v+/2HXlWG07a9G6th+KhX5MaPffjQO7syFjJZKZXu
         ZGYw==
X-Forwarded-Encrypted: i=1; AJvYcCW4MurmRTq8VsK474bO434LnP7yzhQEY6f+Oa15rDy/Yk1UvNKiDiD5V4aoUGbSbQd/hD7bafI2iC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+fG9V6NPxU0xlAGnDdBZD0uAJgeYyHjfv4I7sg4dILcQRpmIA
	KQEVXJ8MzSsmsaCbbLJaNLqnKs6ER82MX0nDApFxu3hHk60a4Kl9S0erDMCmtEUBkm+37inpCVB
	sOreO0Q==
X-Google-Smtp-Source: AGHT+IHfYw3saIGenxdx6hofcNW6m39z+U7j5TjuceZidjPioll6tGDxZ6q1q2NRMsSKefNry3vZpYE+zns=
X-Received: from pgnr29.prod.google.com ([2002:a63:8f5d:0:b0:b1f:dd75:de2a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1ac4:b0:234:9fea:ec5f
 with SMTP id d9443c01a7336-2366afd3a91mr304909275ad.1.1750296436711; Wed, 18
 Jun 2025 18:27:16 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:27:15 -0700
In-Reply-To: <aFNBCaLEdABfybmd@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com> <aFMWQ5_zMXGTCE98@linux.dev>
 <aFMh51vXbTNCf9mv@google.com> <aFNBCaLEdABfybmd@linux.dev>
Message-ID: <aFNnc1hZEWcU0Nh_@google.com>
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM Userfaults
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 18, 2025, Oliver Upton wrote:
> On Wed, Jun 18, 2025 at 01:33:17PM -0700, Sean Christopherson wrote:
> > On Wed, Jun 18, 2025, Oliver Upton wrote:
> > And this path is other motiviation for returning a boolean.  To me, return "success"
> > when a uaccess fails looks all kinds of wrong:
> > 
> > 	if (__get_user(chunk, user_chunk))
> > 		return 0;
> 
> Yeah, that's gross. Although I would imagine we want to express
> "failure" here, game over, out to userspace for resolution. So maybe:
> 
> 	if (__get_user(chunk, user_chunk))
> 		return -EFAULT;

I toyed with that idea too, but if kvm_do_userfault() returns a value, that it
bugs me to no end that the callers blindly convert all failures to -EFAULT.  To
avoid that, callers would have to be:

	r = kvm_do_userfault(vcpu, &fault);
	if (r)
		return r;

And that just annoyed me. :-)  But I'm a-ok with that direction if that's
preferrable to the boolean return.
