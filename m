Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B1A1BF27
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 04:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707279249; cv=none; b=PdGpUcX4YOGzfOzLFZ1a5kU3Cl1B61SzPeThgSzcxMI0gmhLsv0LfEjCIo4FskMOOfBagcl8R6gWiDkZGY8p20DUt66BpwH7RXdrydC1XjRPh3ST89IH5eZSGKeb033Q7GMfvdEhlIimG79U9LNXypYHeh/UuPIeSe4FEPmUSqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707279249; c=relaxed/simple;
	bh=rfUNLTlGw19FsUppZijU0qVdUB0SA34XOGdj75UFOxo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dg10CXeffNKLTEtSzH9ROvweDLhvEYnQv7jVVP/wxcuWwR9oprqOBfmGJ9LnPs6bkT7A25SZsPDzx4u8Y4FwEnyiyKXijcyhjQqGN0Cyfvz0akcPRqZblpPUCM5yZ68Cos7ZpFeJfRpKFay+oqdXy5q26o0D8LhF8/RQLsytjH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BvFTjn0y; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BvFTjn0y"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6cd00633dso291185276.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Feb 2024 20:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707279247; x=1707884047; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=749WbrUv1FQoFjL/H/9KkDdXSpncARgezg9SxCgFfJo=;
        b=BvFTjn0yEtZk1B/Fz4xk6uKt5bam4c9/9dg0dXo2QRGIInZrDeS9tkDCQ2uwyox16+
         O2XZ4ZM8Kyxfydml6jjqo/b4pJfJL3ICxOcO3xLxD0rn5vCAPNHsZFc2B2OEi2reaO6K
         czoYTykCDCUgBHVcC6KAqYSTo8sq40F9qWxFzTvZHsBhTUTYQcJg5hLF1MUNKppC1nXC
         WQ5Jqz7fpn9V0WwGcpQjIwHO0W5Boo6z54q+gRplJ5I+U3FsNZcZK/lK3ZR/MoJnO88L
         xGALxF+gT4rFr38JT40Zy669nn/jylG/TD8xE0IWHjKSz+/yz1Srq7rABfw2oW/wqIvX
         fjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707279247; x=1707884047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=749WbrUv1FQoFjL/H/9KkDdXSpncARgezg9SxCgFfJo=;
        b=knSCZmxNl7Wqg5/94p8Of00+d9ohX3F/pr0w3jluXlcJ+aoadppt06nhfzVjwiawym
         /IobFpm9vb/MNNMjDvqoEJubdrDgcpoxFPIwuo9mjCCMQX0BC5D8d02U2K9capb2f/Nl
         gpzwQxMfL7WYqRFPPrc6SO2pEoXiooGqytSyTq3r8OR29cftU0DmZYb1nmZOLIcDx02+
         Qo5Fe1VDuZ77KkgymS4vKDti5ZQLWClNvPasaWR8iCXhB5C4z6L33CJWUyW3Xir6zdcs
         sHKYtKg+gDfboxtOujCOGr5Iyzzy7jD/VetyP42MfDqWlgSvpKf+PseJCoFQ1m0ePLmU
         05rg==
X-Gm-Message-State: AOJu0YyYkbZ0SGe5b4m7jhpoU496A1XjcyUiXyWQdcSPZ2pN7AO+evNx
	ElpusYJMZs61ShVe4LW6q46Bdkimw9K05heWcX6rD0hM0ZGU66hSrtlc2Vnmee4hWJM5wX0psD2
	99g==
X-Google-Smtp-Source: AGHT+IH+pbET44xcyl9LmoSjIUBSr1gsMyHHpDv3qKym8rEGE3UrAt3fQcAm+ZmYH/Szy3eNuYEcQRazUVM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2186:b0:dc6:ece2:634c with SMTP id
 dl6-20020a056902218600b00dc6ece2634cmr151759ybb.11.1707279247353; Tue, 06 Feb
 2024 20:14:07 -0800 (PST)
Date: Tue, 6 Feb 2024 20:14:05 -0800
In-Reply-To: <20240115125707.1183-14-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240115125707.1183-1-paul@xen.org> <20240115125707.1183-14-paul@xen.org>
Message-ID: <ZcMDjZ2t8XflbIpD@google.com>
Subject: Re: [PATCH v12 13/20] KVM: selftests / xen: map shared_info using HVA
 rather than GFN
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

Please stop making up random scopes.  Yes, I know "KVM: selftests:" is too coarse,
bt everyone doing their own thing is worse.
