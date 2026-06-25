Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52EC30BF52
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411439; cv=none; b=YMVpQWnkI9HX+lyLigdWOxxctCJNYgrUlHABLEe+Enu0ivimfVNMCOAK8SJyJFTOfGLygxg8BQ+rFoennQG25dlDjNM+jyE1R1P0qI4gSNO5skuQf87RjMhbTnVoGY+pmyTd1p2NETtufe9VkCM+qgUDV8hM47Ny21AuS/9XxjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411439; c=relaxed/simple;
	bh=vKWkUzz4X0bpy1wS1bHDH15EShZ57erHcsR8b8E2gsw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ax2fLfa1yqPHIU6l1YsMSz0FdXL5eTIbdTDFpwZCJdo7GhKnNeIyxX3yL7ExhtkqKgGEqzTJmh2Gq5LmSHKx7A7BKf4TQmO/yMwhOcBzhRP67uLBp4+TsjGoZflID3AjEwD4swZEIo6M9LJ4HOeANvnawbro7joh00QEtWCr2Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hOU0Q2Hm; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hOU0Q2Hm"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-37c9127e316so66795a91.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411437; x=1783016237; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYqoCrzIGCmqpOtcxPfNb8nePoxNc13ha9iTOF4jwXs=;
        b=hOU0Q2HmkNFGUqkZ3FNonKM8lq8EvJdzNGNL3bkZlBCRDSjgfdJ51xm5dfvl4n2BtJ
         BL56tVCv2n9ftbbsdctmVRful09Op/cniXgpKjPEmlxrkQlV3ibEW9lXTk2ugZWqzhya
         2DiqFrIQjvYcwIB/x0qXItDecYyvSMiTyM6Z/nZVOHVGIsZMpBED6N+20gpi9Z1x3Vpu
         eopdn8oSbzC0IBpoK3JW6b8QMay1sMjErrtU4C3jN24xpWaNGU4lnTPiZMg/mk8pgiLM
         FcjyuaPI5MHgRmzuL6LDRwl2thmA/H7G/YeGQrUBjpzYnO8c4Xlh+k+yf2UETWODPdLQ
         5dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411437; x=1783016237;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYqoCrzIGCmqpOtcxPfNb8nePoxNc13ha9iTOF4jwXs=;
        b=rr/wDO56fRWuzqbzv9s8/cGN7cq8c0UVuJpb9PtCVzUgSfZ08PBqsNo/pRDMKWvFFj
         V7wYZQxCUIRY45/PVhrKunA3VYe2TZTHG40jr7xcT6cIzc5HK4abX4z9OZXLhbsv1AwX
         TOekQ0zZsxFoLkPwK/RZrINoY/vo+5G45VMyRK87BBjf7l5dBx4omjVFytglvVvMnfjx
         5JVWMZ1nxu5zDCIroQ9dnJkzzMJNclQbTEfrw5RpgQ114RL+6gnIVIwGTRMWHM4+6nQb
         afY5VhFEHjC/8186UVKefYVQ827MiXUCawhE9+yCgmYr8oxneTiVIfkqdKH0WFXXqRMk
         Kmyw==
X-Forwarded-Encrypted: i=1; AHgh+Rrmc9hGDlKWDS9d/ZDb/J1uHwnnTzMj/1yHAb27XQr/h+17c446+MVAIO33+iqbe4xxTgkyMniLdVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YybyG+cS1Heqt+u0ovfroq+5alqmpenBHpM+9rzKjxjD3I4iljU
	7gHIupFXvhOQeCvnvV/3voxV4i5dTPrTw4bM0Erf8C5jrdlaG+updvROpwmqEXT2OoBRjaHd8MB
	XThmOVg==
X-Received: from pjblx10.prod.google.com ([2002:a17:90b:4b0a:b0:37d:8022:9ef5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5108:b0:36c:e254:4db
 with SMTP id 98e67ed59e1d1-37df9f646f7mr3203405a91.6.1782411436892; Thu, 25
 Jun 2026 11:17:16 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:17:16 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-8-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-8-4fe8b602ff47@google.com>
Message-ID: <aj1wrF93FLkTNRJQ@google.com>
Subject: Re: [PATCH RFC 08/12] Documentation: KVM: Add example for kvm->srcu
 in relation to mutex/lock
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
> Add example of where vcpu->mutex and kvm->slots_lock are held while calling
> synchronize_srcu(&kvm->srcu) to concretely show where the synchronization
> primitives overlap.

Sorry, but NAK.  This is too x86-centric, and IMO the risk of the documentation
becoming stale and confusing outweighs any benefits from providing an incomplete
example.  Because like the kvm_usage_count stuff, I know the code in question,
and the example confused me and makes it harder to understand the rule(s).
