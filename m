Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88338D29B
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 01:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718155304; cv=none; b=YVrHGnHwLx3NzmKM1RetjQwiEQpKPu/+fPKP4pU42+BlJy0vkGR0jI7oNPJjOfX/0SKvFY2gDWKdRuuXR7/oG8CeOm/YBw3W8+Oc4m/m8s1WNn8Nlh9qe1tYXGoWNBQGRA32SuWB1q4xRf3cET84SaG6E1krW1OYAxwtG8HKcKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718155304; c=relaxed/simple;
	bh=GlapdDKhTIPCCJP/VkWHjj68tVw41md0iGY6n3ryj0A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BDrATCu0QiFDdy1sK2BSXOTZXgnVn1X0BjF5lfn2ILnIp+7g1G5e9wkPr6OGBTMhJYgcKNsC0C/RygawoLa6jc3kBgj3ngAIM1QkUcl0sZD9AsuC6c4xaNErTrunoJsXpBRUy+PPP/vyeWcEx9/zl33zVIFZOWp2wlqm6IFXNVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dgokbjKk; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dgokbjKk"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-df796aaa57dso9440837276.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 18:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718155301; x=1718760101; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=949Sco2VRHaNtzMxd2fbftK/o32Oz5QH2yGUJXRf1kk=;
        b=dgokbjKkIQ6Lm4zfYBCgheAKFvMp2cLnqTVO4RDa32JkAVCYkW+wXDbg/xIIK9Flp5
         ZC0VClD+tip33nOL46K4kf3mCTVmJk7x92By8aNQH99Vt12YA5LEepjdsko4Yhi1VTnB
         fozhe5emdudhOBxMOPekPMXki4PNJW14b8uGaUV5ye61sD8sy7lj+4Q06s8w3eFBEgtN
         l/xPHdkhvpJBJ678NAFzjhfwUEET0SBg8PJ89OHUBvvpfo9AsYqzgnh7B2BFd/LtrgWL
         syJO9NGsNkWSlhOWMZ+5SVJBjr627DcCFRJMZmSIaFz1ver8aAwixET45MbJ1clDMWlN
         a/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718155301; x=1718760101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=949Sco2VRHaNtzMxd2fbftK/o32Oz5QH2yGUJXRf1kk=;
        b=FtdzQks3Ho+WhAEPoKikwe7kcUBmqRTc2c19lrGblWUDaU6qokRZp9NTm9wXT7fYxq
         R/XBY41lt4LneiaJpBRQIzmTteB3HiA2X0XhuuKi7tDwa6DUt1iDjqmWEq8QWBR7CePw
         dUyHbgOXod8/QA3oETTeqpVkO9AY9druqd/DpCJp53wjcoQ4xqFY2XAmEEQaxENM3nE/
         zFwD85+thVA5rHb6esILDFSHI43yeUHEdpBIVffoNKvdI4MfDQ/gvJ6eB8ZlU13k+PQR
         /BouuO/AZMjYuFAguXM4+rR1eJNJPOfVSwwajjgUOy7khAoQb5dQtbG4ND7ljdzWfjvA
         qeZA==
X-Forwarded-Encrypted: i=1; AJvYcCWfDx9QLoHp8bxODM3oauljsrEhR9anCdxYtxnhn8hibBsngyDtlaU4m66lQAyzpjd0w4Tjka9I8VEZhUBXLZ1nvzryTV1iSCgr
X-Gm-Message-State: AOJu0YzvlRZedHlzVobPBhpTFPCm9O36eBGMCQcaNUlopJFLwR2+Frha
	LL3mkdbKgUsS0GdX4B82+NOU8D30qGrWgmp1BeWnWfnX6l3NavvFIKIMxwWV1PfgkcdqSDrmGeK
	3aA==
X-Google-Smtp-Source: AGHT+IEV7dvCZCTRpJ744rvbmMY7/LY4nMjTd6+1Xr4TaQMCK/If60QDgbv1vmQQIQ6r1mtLOEulyXxkmDQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:c12:b0:dfb:210f:3ad2 with SMTP id
 3f1490d57ef6-dfe65f78d94mr29693276.2.1718155301449; Tue, 11 Jun 2024 18:21:41
 -0700 (PDT)
Date: Tue, 11 Jun 2024 18:18:36 -0700
In-Reply-To: <20240508132502.184428-1-julian.stecklina@cyberus-technology.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240508132502.184428-1-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <171814098169.327928.5071447429899645642.b4-ty@google.com>
Subject: Re: [PATCH] KVM: x86: add KVM_RUN_X86_GUEST_MODE kvm_run flag
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Julian Stecklina <julian.stecklina@cyberus-technology.de>
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, 08 May 2024 15:25:01 +0200, Julian Stecklina wrote:
> When a vCPU is interrupted by a signal while running a nested guest,
> KVM will exit to userspace with L2 state. However, userspace has no
> way to know whether it sees L1 or L2 state (besides calling
> KVM_GET_STATS_FD, which does not have a stable ABI).
> 
> This causes multiple problems:
> 
> [...]

Applied to kvm-x86 misc.  Note, the capability got number 237, as 236 was
claimed by KVM_CAP_X86_APIC_BUS_CYCLES_NS.  The number might also change again,
e.g. if a different arch adds a capability and x86 loses the race.

Thanks!

[1/1] KVM: x86: add KVM_RUN_X86_GUEST_MODE kvm_run flag
      https://github.com/kvm-x86/linux/commit/85542adb65ec

--
https://github.com/kvm-x86/linux/tree/next
