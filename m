Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505C87F499
	for <linux-doc@vger.kernel.org>; Tue,  9 Apr 2024 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712685073; cv=none; b=eBzNnk3PKD04XOXpWOgkab+eRDC5MOQ9ZkyK39nfdvgoWTrOJ8a430ldlXtprfWm6ZPmFfHxxSdRT4HPSZXvFFVzb7Hox2uYoZLsp5q9WnTCGnhCq3VnUU4JvFucL382Bo6zdzOIO335jRatLDliFuQdDU8XSkbJTrHPkXsDZVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712685073; c=relaxed/simple;
	bh=7CKVGLEJOhMrsVcoFnVtIefSpMJClF53TVcgy2tA/2g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EUnLDhFgKXlAnMzys8RBpzYodkp3UJEfxVvy8LbhDBHjKqxJBCPkaNHLVVSAioARgb0Ah69nNpcG5wcLG/aofu6bBn/wJFHInX9U4+cmjXkLzmbBsVxfuGyt0bJoXGU5IJjeEl95/37HYV8bY13BhzIWcPzdmU2Pjk5w1bYPB08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1RgGbTiS; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1RgGbTiS"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61814249649so34566237b3.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Apr 2024 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712685070; x=1713289870; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5eLSr5afbvnu0+fDPQYrl4RtiR5hKH4QirhAQ7AdlA=;
        b=1RgGbTiSWbgC+I/98yIMFAg4KlC9aORwJnHZsSQ8fhyEqaL8k5Y3qv6ZCNpNUQlwft
         HHmUOPEPPihtj656PE8R5s3DOruq+GaHnYTURrO4tL6DquGQkIUrcxsJk34KSrvCEBvT
         zghFcmS2fF3dVYy+mBjU6jbl4Zc9yZ4ttiCbwowLqAZsLMLCPs8BhQ/hUBx5vJdp5MsE
         jcn6H/htWh19xzGvGe1kg79huDQUT1lI6u2bBQ99XWqvVWcvxbdNkTnnNn79oy7D7A8s
         SGk729gtxaseFV/AynVoaus736Myjma8g/1fFoZxRkBHn2FLPqMsra63ZIVqj0O6QftF
         NeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712685070; x=1713289870;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5eLSr5afbvnu0+fDPQYrl4RtiR5hKH4QirhAQ7AdlA=;
        b=cB7u40Axd//HkGBY+a2acyKTb9YN/FgGPLM472DGQShJmcProBs7jkmQOOQsWJYIcO
         Alsfj/i4BNslyWJx1DLJyAX0lLuxklgLwOWFUtqIFgLOXxtWrd20IzyAVRI5XhPdVkBI
         coGD416DdcFH8Jo1+QnskOnNyhY7ND6X2t6kdvqzfdbCcuwX+ULtdudIReYde+7emaCo
         e/3v+0Jtd92gYcfwMg0u9mXZABipZcksVkes7hlkMulbrL9FWp3K7PA76MmbqVRtkJ+g
         XYHm+v6uk3O6/Cjx9CV6IT2mJpQhPzQO2JGR9Nd8YMLr58g/o323hu4LL9z4rou7AUvH
         j7Ng==
X-Gm-Message-State: AOJu0Yz2I0LTzanL9pXvPfaKkXqfqxrw+hN4MzitB1kOhvS8SLtwPUG3
	rrBCKLIaqNKJ0ucB3Tfbyv/rD+gogprGHMavQhqwpBJuggQnv12zjoiRhPMmYzQz0s25LwwNIyx
	Kyg==
X-Google-Smtp-Source: AGHT+IGuj/QQ0/BEcuSpdkZRZJhoXvNvl8rW+Lfime7OMZS8+VMZrjL6Ff0W5H6V+gnKuvGIuG9t7tilq1w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:e6c1:0:b0:615:ca8:6058 with SMTP id
 p184-20020a0de6c1000000b006150ca86058mr52080ywe.5.1712685070361; Tue, 09 Apr
 2024 10:51:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  9 Apr 2024 10:51:04 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240409175108.1512861-1-seanjc@google.com>
Subject: [PATCH 0/3] x86/cpu: Fix SPECULATIVE_MITIGATION=n kernels
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Fix the handling of SPECULATION_MITIGATIONS=n so that it actually does
what it says it does: disable any and all mitigations.

And because I don't see a way to provide sane behavior for overriding
SPECULATION_MITIGATIONS=n at runtime, explicitly disallow doing so via
the "mitigations" kernel parameter, e.g. so that the user at least knows
that their system is still likely vulnerable to a variety of issues.

Sean Christopherson (3):
  x86/cpu: Actually turn off mitigations by default for
    SPECULATION_MITIGATIONS=n
  x86/cpu: Disable BHI mitigation by default when
    SPECULATION_MITIGATIONS=n
  x86/cpu: Ignore "mitigations" kernel parameter if
    SPECULATION_MITIGATIONS=n

 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/x86/Kconfig                                | 10 +++++++---
 arch/x86/kernel/cpu/bugs.c                      |  6 +++---
 kernel/cpu.c                                    |  5 ++++-
 4 files changed, 17 insertions(+), 7 deletions(-)


base-commit: 2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
-- 
2.44.0.478.gd926399ef9-goog

