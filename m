Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0BA346FA8
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 22:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784586468; cv=none; b=qNqP1QeG3yhLQDEav8x48AG1NLy7EQuzkL160YtmTEJ/QgO+ngdc/bRjDytf1o3Aa9GSTAoyAQmBuNn9mg7DZLbJ628H4FaKN8uxBYElj5Q4U5297sfxxL7pK6ICqNA0+jP7lRBn42s6HExLjfSqhYR78+GNx+2023FGJKrI25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784586468; c=relaxed/simple;
	bh=+3zvmdX/AUa5Ass/AisUI0/xOQ7LXZ32buEYAGnRgUs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iY1UZt8jXBYxKrJOcUsfUf84fwsYVWmv9sndJ/QyCI7Dhg4aPt+Hi+7Q4dhZ4yrDeIYgAy7ZRmB6i+2ocWVxCXVbYnuY0oQby5vxkf+G68tfz1paKQ7PYtQ92PVamxZ7Ot2Rby25WKbMAVlWU3KSUmjA+MDqu0SUsqMe96ZKC+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HndPX2dK; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HndPX2dK"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc77a6943eso173840965ad.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784586467; x=1785191267; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=civ8YVfloZNtfpGATb0SeVYinnAw4hyl4f6AMPkBa2I=;
        b=HndPX2dKfmMDzGGxJqtGN1+J4BvIywXSNNFOOfo5Y7vX9+4bgrZ85zdN7gdYbDj9uy
         fTcaJixesqGnhBSIfFg4TyMQg0XmlTIPQZMVRrUKKwega8UJ84T9LgCraDkURRd8+mBz
         2g3zhKcP3RpGttykDHGOZ3ZQDqpp2HQ+BV4rXXaCY7IpZdbr62qTNhIZsyGCfSidtig9
         DvhogN/5CbGLT/4ThMgL/may+6/nW9HJXAZj8oPnZTCT8BxxUBIx+TjcSMwE3BbTHlHm
         NFolAzZfxaeR4Vh5DoxPMeAE2H5JRJsqgtoFn8/ROJ7FRVrnylb5tcJH6m1mMOPPbS1N
         JhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784586467; x=1785191267;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=civ8YVfloZNtfpGATb0SeVYinnAw4hyl4f6AMPkBa2I=;
        b=nKC54V6xDT2Rtmr/KvObZCk/lygWJqjqDyy+38ZBOWfjgECawuogbit0eCkMJT7WAo
         EHafTdxNdHwyRMeSnLrhrLm5iSQCcJ9QStT6MUfpjI9T10dKlKFcH/RR/GZmmMdeARRt
         akdkahC78vHt/Nw20br3W+/kdD8KyexEKo7L4CLMFaqQ2xahDPuRTTyn/cOF5Pyzkmis
         jgyV6eHInQYHbXViSqeGRgi0+MyDcuv/hMnKsnO+6AG/QlSSRpUTwT5IuvCn/TwwnYq5
         ZlVVNLvGXoPfHZ+c353yQbVciG2wAuIUYw/9LyHQEZDt11nWOAAMh8wAA5xNvggbVLQN
         q48A==
X-Forwarded-Encrypted: i=1; AHgh+RrghiFiOOLCeEEhaDCueG0b8EuzBXePTahDarfI5L7YwDv+bIJL5/wo2V1r6F8G/20sGIWPSJz5kIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWAv6EUvEluz2oAvem6IXWajoqj040Lq4KDeQKoK+F0MfAfhky
	yxHXM+6J5Qloh840wG3mg9W2qq7pr7NvxtG/X67Zyc0XLn64bkMjQk3FY1dZQI/A35LQcWSP3ft
	qECyFyA==
X-Received: from plcz4.prod.google.com ([2002:a17:903:4084:b0:2c0:a677:42a6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f705:b0:2c8:1c05:16bb
 with SMTP id d9443c01a7336-2cf3494f91fmr169924915ad.24.1784586466619; Mon, 20
 Jul 2026 15:27:46 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:27:45 -0700
In-Reply-To: <20260720192221.72912-2-absandze@amazon.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260720192221.72912-1-absandze@amazon.de> <20260720192221.72912-2-absandze@amazon.de>
Message-ID: <al6g4VA4l-ZIAr9Q@google.com>
Subject: Re: [RFC PATCH 1/2] KVM: x86/pmu: Add CAP to disable SW accounting of
 emulated instructions
From: Sean Christopherson <seanjc@google.com>
To: Luka Absandze <absandze@amazon.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 20, 2026, Luka Absandze wrote:
> The only functional change for an opted-in VM is reduced accuracy: a
> guest counting instructions-retired or branches-retired undercounts by
> the instructions KVM emulates in host context, i.e. the behavior that
> predates the accounting cited above. Hardware-executed guest
> instructions continue to be counted by the backing perf_event, and its
> overflow/PMI path is unchanged.

Do you *need* per-VM control, or would a module param (or a magic value for
enable_pmu) suffice?  While I mostly buy the "it used to work this way" argument
(just "mostly", because that commit landed 4.5 years ago), I'm not exactly keen
on adding uAPI that is effectively "re-introduce a bug to workaround fundamental
design issues in KVM's emulated PMU implementation".

If we do add proper uAPI, we should extend KVM_CAP_PMU_CAPABILITY, not add a new
CAP entirely.
