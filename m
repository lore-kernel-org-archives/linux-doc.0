Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F22158D7B
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654967; cv=none; b=LcsAI4PL1BPmvGnqnfh6vTKTyIVtZyO4JTDT/BC24FwiLMTY/TvE0WqH+IwrUE4wKY1zYkp+TOjOMi/4o3pURVlfyPluBHsC/HjwfGwOD4qGczUcCh99nkHxn0yech8XSEaYUtUdXqxEiUt6Ew1bVo7KraB9EzPBETLNcUVP7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654967; c=relaxed/simple;
	bh=oWnYdn0BgDHSxRNKslgfesdd9yEejwT/yhYAWEJx0EU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QMU9ikdaQM4MX0qzvW1byvK5S4alYw+YWo4lA71tLlmbLo51+o/3olOmjmq/r+9Tcm7GTj75oJr+4Hugo+bAnWmI/Oic9hpW4zmu24utKeBK+cnqv/j5pS3CLRh+uyPiV/e6WEwXj6YNVqelIaD39enluLhbPE4/XI35bIuHro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQ37ehsA; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cQ37ehsA"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-64b2a73ad0bso4713847b3.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654964; x=1721259764; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1e4HHE4z+5Knov3l2/RvFGqy44M6oXcmkh1U5rufQM=;
        b=cQ37ehsAZHZ/fS5YDkSexvaRxXJno5PLOWbF8zdHMICrqwfOM6TRgcGsE89x2vuS72
         qTVVdk4N0P//WDrPT0pDJTlOK+RrwdLAGNlO552d0ONRNWj/YLYAS18nI8inrML6kk1R
         hgYgHZmesf7EtVfrnnZhNCURHJlggTCyyvHELrCfOKc8W7GX1ToTkM3HAoKtfcFQKtRe
         uwoA01PReifS6nRjBcQqOLDYh81N1ussNCyn7BidgbzR3Pdg3TJ87VPyVb35DSw0E5Bp
         uOmuVaKQayhqV+LX2NXp0cof9ZefM2SSQLQNeCQC9y/++tmRAcMQukN5VYYJkCXOcrzR
         /AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654964; x=1721259764;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1e4HHE4z+5Knov3l2/RvFGqy44M6oXcmkh1U5rufQM=;
        b=nVIsakTF6dWFBvzM07oweXBluQA7iXktgdZZYL9NCIrqZH6WIHN2IvvqMjnxSEsdc1
         PFieTVuSBX3YyPVA7iGHQ04BPzLrrnYkfXN01b6JIxywL03TyOFp29iyBVSQ+JAQ8wmM
         c5A1zXFntNABDvGYZgPFtS8qS7KnEZ0gOA3R5fbWZWbNb7RIRCdIWRbF+KsuWW3JLxWF
         c5pSM11Mu5h7u/6htFugA0WftgTmeRhzAePf/T2CD9PhakCKzwVrj2J2WSMw8FTCfKnV
         M9lLCAlOYmDCIZKYxjMsWYPZWjkvBPbWYUA+jzd2ruwRbKi1K6GMzDD93PhVw1nnrcyX
         RDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxo0SLbmuHvTiD3dAt1DWOgrkrnPmbSawsIKchZZy90rUtVf9QMGToWmSxdP8GlYR0+gxIrIAiGf/hpnMfcqmAx6XkBpYr7HtY
X-Gm-Message-State: AOJu0YxHhEYY9w6xi3EmXCYeLY9mXFPzwsl3tqo9Do8VlIgw1Y0akSFc
	pblmClI2KaUxbI1pfZCc/0UZD4KDOUuo/oCxrvuS95O92eno3/5bh2j8DfIQbwRKrvPPqEistIk
	WFqfG3HyMfdEDTLVZNg==
X-Google-Smtp-Source: AGHT+IH5NTISR7DBZbSKRJUHRXFWyLuVrVBePrqFfNwytKF1BLIU+MNslDD3lgHeZpjWWwkTnE/TGMGwZ5jaEHpH
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:7244:b0:62f:22cd:7082 with
 SMTP id 00721157ae682-658f01f530bmr1591717b3.5.1720654963909; Wed, 10 Jul
 2024 16:42:43 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:42:10 +0000
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240710234222.2333120-7-jthoughton@google.com>
Subject: [RFC PATCH 06/18] KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Peter Xu <peterx@redhat.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	David Matlack <dmatlack@google.com>, James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is needed to support returning to userspace when a vCPU attempts to
access a userfault gfn.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c84c24a9678e..6aa99b4587c6 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -429,6 +429,7 @@ struct kvm_run {
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
 #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+#define KVM_MEMORY_EXIT_FLAG_USERFAULT	(1ULL << 4)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
-- 
2.45.2.993.g49e7a77208-goog

