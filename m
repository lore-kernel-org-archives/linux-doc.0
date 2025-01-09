Received: from mail-vs1-f73.google.com (mail-vs1-f73.google.com [209.85.217.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BCA204F8E
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 20:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455804; cv=none; b=NeMnFD19iOB4x6sYWYpLkOlp8YC7MIEYFrQbpvAVRlhWgk5pA/I0KU0FouClLAlNHBLucpYTpLgVo6uc95XraiYjzIcl0oHs4u0BnCmTKwyW4YHFB7GOUsqt530QBSHhLfj13oEXxXhN5HGHN6zqB7WyI/liBbkv8ph/bIPRdho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455804; c=relaxed/simple;
	bh=KKi/BUktWZk9+uDC0b8Vh9PzTd/GFa3ygvWEq+T3pcA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z64oy8fLh2Yy9wGy8j+UqbnskhND9oQarvW/3GZy0beczT6D4y/gLlN8eVpL24u/g/Dug9L1o05Gdy52paRAUpCxLB33ymiUkt3WN5+nw/0bmeB0Wmv0HFX6pOkmv5rjTsna5JVV1uCoeRYvUVDYcTkIj+U4+HJx45efz+sWTAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=djQKsJqb; arc=none smtp.client-ip=209.85.217.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="djQKsJqb"
Received: by mail-vs1-f73.google.com with SMTP id ada2fe7eead31-4afb0276095so232744137.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 12:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455801; x=1737060601; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9jDqHEv7geetsXAPhiE7vHc+NbQmOip57zkXZiw1WEE=;
        b=djQKsJqbs5VIG1gVhUTIuTN/g6eKK3136i+atytOCEqL1U5g+mEOTB6EoQEh9Xz8Qe
         YHy0QVTdOwPC6qZMfJDBy5BPjJvXHaiI0qRgZA7EVIOUPoShA+9lDNbxIj3ZIKxE74+B
         tJrpotC9LJoECLlfmtYKnVqzEgEGv84YsfCjD4roiBW6IOWZl9D4Gw1DWRwNVEtiPQpg
         dPMlrlqApuu01qI6N5trVXrSImPaFYj2NAoDs3hdyUKjl/ZcqxPX979Gyx2wfo/Hvjrz
         z1MXVMZREE4r6RGQAcoLftKCBPNHL8BvRyqdXGfuOuaZzLisS3zyNTavnj/zFDhjSfvm
         juYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455801; x=1737060601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jDqHEv7geetsXAPhiE7vHc+NbQmOip57zkXZiw1WEE=;
        b=QNlSHVdTjz6lYOFrgc1RS227z4r6LaF1KnT1rTNVw9uFf83ljnsYB+fddhJm/RhEBj
         SjVVhTLrziMQuh4WXVWGO8Sr3mya1CV4T0ixQg2rSvoXhpFjOVbExwD/SdQuGNHsxNHh
         ar2SQoOCYFMxkIMeO6PCd+s5CaMv0wn8zdIf3yWCmeYfe5G5PooXQbtszYXI1ehdXye6
         fGuuzqrmmQJKFcbEw/6RFq1+yI2hDdkxUVcnx7vAGKh5YoZJ3B2runO5iuYO/e2MY6f7
         gFYleh8BDUsmxG6As7SpzBigZ2zvzLpESxdynXpduWNOxrf96xNsIm7AozUrZrWRVRxd
         7S/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXj988C7KgrNBKN5Sqd/YGg6+sFIkcp8F1d9e0pPZ5y8EQ5lOPNGWwzwEY0wFUMmnqn13Dq8bUojCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxutpbtmxbBsmL1xONMM/a1bu2FS1w0DNdrpdqQtT6oovkSrzxv
	V0nu9WWGhURVurLtypMu6f40MvrPYXgfPhP/TjglQ2UpdWiduIeLJlzrGaNajDZrTlHY1rY358a
	po9Z8qX+tMUPUlTLvKQ==
X-Google-Smtp-Source: AGHT+IFNTRpr21NUpgVvBV6RDqL9+2vcXAZWltadh1brmBLANlrw+WVMeHKDcwijSskNQ4NVBvhEHS4SPdBJrOsp
X-Received: from vsbih13.prod.google.com ([2002:a05:6102:2d0d:b0:4b6:1ac7:43de])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3c8e:b0:4b1:1a9d:ecbc with SMTP id ada2fe7eead31-4b3d0fb68c2mr7939857137.20.1736455801194;
 Thu, 09 Jan 2025 12:50:01 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:23 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-8-jthoughton@google.com>
Subject: [PATCH v2 07/13] KVM: selftests: Fix vm_mem_region_set_flags docstring
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

`flags` is what region->region.flags gets set to.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 33fefeb3ca44..a87988a162f1 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1124,7 +1124,7 @@ memslot2region(struct kvm_vm *vm, uint32_t memslot)
  *
  * Input Args:
  *   vm - Virtual Machine
- *   flags - Starting guest physical address
+ *   flags - Flags for the memslot
  *
  * Output Args: None
  *
-- 
2.47.1.613.gc27f4b7a9f-goog

