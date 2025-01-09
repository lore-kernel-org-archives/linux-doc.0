Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438F205E13
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 20:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455805; cv=none; b=SSBc62BgfrslMwKnrTedyrNiTe1UESt7BIiFjeG30smvFIKcC/lSy4avxj3sODzcnb6DuLj4ZeDDqKZtE5Gie4gRuSG+HgljMtAIJASB0hb0frcz/Kd5rFux8p6C5lvi+RVxn1J1FaFQl8kmIa+W1raRz2czXKjb8L08H6xrnto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455805; c=relaxed/simple;
	bh=wX30xj9sJm8y6Ulhl1IoKeVlsOrKZuVPq174Ef2/lmg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ogXiuK0z06bVVBTdYrpPpFm7D2/Bgbk+Zd4tx0e+mZZJ4sJwIsUw8nQdRhZl23RN9eYVFSeUbNCwFY3WaXHJm5A6Rm5FcIQwlY+kAgheygAvgbQq3JRX6W8Z8cT4a/QC6whUpwWT3b1G7p6Yc3fu0/C9bdOzbYfUooYERBDPMpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WlCdUd61; arc=none smtp.client-ip=209.85.219.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WlCdUd61"
Received: by mail-qv1-f73.google.com with SMTP id 6a1803df08f44-6dfa69e6983so14000946d6.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455802; x=1737060602; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O767jE59AeAMsTglDWemPeR1CkI5EMgHAt7K2sI2JAg=;
        b=WlCdUd619YU8lYk986ZY4xjT3n6gmOwDPGl5+xf/JRzVAaIN7N9QmlRJx0dlHQ4BxR
         eX8r/UJ8YTO2Fglf+hSatu3nSIvBc8kN0o4/C1YK5FYVsyeBjmxecijdFVqZTU/BogUf
         jtbcbgd41FIzi7Tz8wgb9IEs8phkhwf9b6H3PauPzdi3FaKQR/fluydOUL0tJmEEOMRh
         tFHArHoI3yTVHm64fj1JwlHpkbguH9RnUh2pmvz9hgNSC1lsVh5fDTeJ/f/MzghN8ZXf
         V3J10OLS1/zvXt4LA6UyHn9fAAsBx/aziEqsNt3v3pNBJOFZTd/v6ZOP74bJJnlj9tD/
         RsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455802; x=1737060602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O767jE59AeAMsTglDWemPeR1CkI5EMgHAt7K2sI2JAg=;
        b=YQSwNhiqtqz/CFW/kIDtD+EFCfExpPQGbVEhVht+ONJ1N/WB3h+YGwocn4cqRXQcqf
         0nc21bcigdec5L6B2Pr5E7/ub44P1BbkFrtl6FDCx1zqHU+hnt2MItdWqouSEg0C4asZ
         mELN+lH39g1dxhLWuivxGddE1H/42MHpL5GlwtG8rr3+H7xk1EBMKE/F0UotWNcROwQi
         TkGUWXMxJpmHlquLqTNPqaTH655D392q7Ct8TV4VC6zAIP5Plt/A2oWcUoXf7ih2w8j6
         rHT9Nc2Z6S+290PMNIY1Izd3N5nUlvwzlNqC9zkjn8ZoZVZKcpurGD5O2WaQm9RG6M2g
         P37Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT7OSgb8C+mzQGL7uHNkfvwBBEvUEjdP/2d5otF9z2Ui4qoqGeWf+GpadGH1AXZBI/VeJDMNVifsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhhIvvnE1Fge2rsdckrls6uIEgezaKTCz6tO6DX7st40hZdJgx
	x1uSdtyD8SeVNHtGYLIPvn0FWIXcJqrUBNnXgkNMO4i9eU8gUY4xGKJQ9hzfkRr++H2lL12Vq0a
	QE2JPuwmrr6lYOZwvBg==
X-Google-Smtp-Source: AGHT+IFgx6gAPenNPcGigBK2pqFto4Hhpu9WmCDI55SJzVOesvWzc1cj0nZb4kbFOEWQTb6nHd4wPYt7OTvCG9XJ
X-Received: from qvboq1.prod.google.com ([2002:a05:6214:4601:b0:6d8:f326:1f33])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:2688:b0:6d4:1c9d:4f47 with SMTP id 6a1803df08f44-6df9b238643mr125150226d6.13.1736455802071;
 Thu, 09 Jan 2025 12:50:02 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:24 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-9-jthoughton@google.com>
Subject: [PATCH v2 08/13] KVM: selftests: Fix prefault_mem logic
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

The previous logic didn't handle the case where memory was partitioned
AND we were using a single userfaultfd. It would only prefault the first
vCPU's memory and not the rest.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/demand_paging_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index 0202b78f8680..315f5c9037b4 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -172,11 +172,13 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	memset(guest_data_prototype, 0xAB, demand_paging_size);
 
 	if (p->uffd_mode == UFFDIO_REGISTER_MODE_MINOR) {
-		num_uffds = p->single_uffd ? 1 : nr_vcpus;
-		for (i = 0; i < num_uffds; i++) {
+		for (i = 0; i < nr_vcpus; i++) {
 			vcpu_args = &memstress_args.vcpu_args[i];
 			prefault_mem(addr_gpa2alias(vm, vcpu_args->gpa),
 				     vcpu_args->pages * memstress_args.guest_page_size);
+			if (!p->partition_vcpu_memory_access)
+				/* We prefaulted everything */
+				break;
 		}
 	}
 
-- 
2.47.1.613.gc27f4b7a9f-goog

