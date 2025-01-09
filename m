Received: from mail-vs1-f74.google.com (mail-vs1-f74.google.com [209.85.217.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8DE204F8A
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455801; cv=none; b=hkU6h8Os+qAOxGGwwtGFwCM4N07qVSscVV3LwzEVjQyPcQtpCu8/JlSYwBTS22jXPDlYrCz6XN5GrT5TbhuA86XPguVSWTbCtvGpBlbKbMr4lRZICBKsndNTaJhHgbTxygpW6XJvMOQiVIKQMS+OYnTJLrmSxSP7Ox6oY+vAJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455801; c=relaxed/simple;
	bh=CmgtQ2eKueuvA0O3zOIgnVmBoSBMqtMP0Wab4N434t0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dghJwht9aDd/fJqsQGXuAQWsMziGAwOAS5MetVkH/LoDveEyUpeJ8Mt1hr97Vwn4FKMM4queFT+P0iyFJaOdfpYClqr5qQAYzFvOJG2NtvBz2HLZQ3CkC3gd+v1MHej7fe5VoWNksLpUdp/uzyZeSEMedGih9qjf0EsgTUB8fUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p2Ypn3us; arc=none smtp.client-ip=209.85.217.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p2Ypn3us"
Received: by mail-vs1-f74.google.com with SMTP id ada2fe7eead31-4b115b28adbso227643137.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 12:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455797; x=1737060597; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=inJmWA70Ac+hZHw9fDPSAlORU93rduBYUNSCVpvyraE=;
        b=p2Ypn3us1MoEIQVIpqufx0haf3J6pgjd9V2/GtF2sO68+YNnC23rxFKfkjWfS0oKgc
         MMnUCB+BpokOcbPoLsDZxp3Jgldm3aqzvTVMjljvRh/xyEwK/H2ro7tQ3iAAKpJCp25C
         oXKh/CvoLYzoTnaGXubOoMbAiak9H3D/N2wNB/wA1gel+JVmkhEcPBztebSMDB0e4Q8w
         Da4YpwDuTktoVv5NW/ofp+vz41YgyQ98BFsrwUqnyxxz6IMHo7052eQaNzHM+TtecsI0
         5L4ZaOCeqh4Srsbqmu9gAX9ucOED+i4EdfCMyxeX0eagK5OoCXVo2MGG3zze8gjNdA76
         eYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455797; x=1737060597;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inJmWA70Ac+hZHw9fDPSAlORU93rduBYUNSCVpvyraE=;
        b=aiDNEfhFmixb3mG4OkSb6OLgWNJo/SBj3JKyOS0gAoFoEKjtzBZEFfeYuKnjhHwdfd
         fPW98g6dvDX9XUr7CDJVSRKHtt4SzOKc85a8jyJftfcCMdOgP2/JZg2TbbkHS3oGoe2m
         ksSlthRRSLYS2SR7eiodftZAR7v04h/wR2wbEMFR5CW4YPCPsanz6odFx8J9kli1Ka2o
         8ti4ecM2bS3KMVnhINxlwa/vXmynLNTZehdZDC36e0lC0qNOyavSm0mFGsHT5/Nol4E4
         muojt1duCnTAopgrTIqTuX+YPlxYFRSkcIFtYJ7aUMGQUzM3bi7Db0L97bN/DPNAcJNd
         v5Og==
X-Forwarded-Encrypted: i=1; AJvYcCWyCkpYOMVlVnRogOQSFp+Hfw0632wvSAxmosiR+EPxToyTwIvCVepbihHlVEeX/VNqJm2ymcJ6+0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywej7xitQ0/WhbJgVO73a68WY8rHuO7M/DoR8tksFxd5/S+Thbl
	XhfVrhtFwbJNAXEkuw8vzpZ4qW0TpQzFERuTxzQqgXVO4Ajd/K9CYmuLuADVU6s698zU4O0kPpR
	rr0x9wrMs7E1ngrzTbA==
X-Google-Smtp-Source: AGHT+IGmWC0I9uhGcwdr2Gd8ZWKOxj9FqNl2pt1I3pHNzlZaCTTUBXu0xZZz+qkK1VqDCdKw56Aw4mYDSrKY0XUr
X-Received: from vsbka9.prod.google.com ([2002:a05:6102:8009:b0:4b4:eb7c:c900])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:38cd:b0:4b2:adca:c13a with SMTP id ada2fe7eead31-4b3d0f05fbamr8311073137.12.1736455797065;
 Thu, 09 Jan 2025 12:49:57 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:18 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-3-jthoughton@google.com>
Subject: [PATCH v2 02/13] KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This flag is used for vCPU memory faults caused by KVM Userfault; i.e.,
the bit in `userfault_bitmap` corresponding to the faulting gfn was set.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 7ade5169d373..c302edf1c984 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -444,6 +444,7 @@ struct kvm_run {
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
 #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+#define KVM_MEMORY_EXIT_FLAG_USERFAULT	(1ULL << 4)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
-- 
2.47.1.613.gc27f4b7a9f-goog

