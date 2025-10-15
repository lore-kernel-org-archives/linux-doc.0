Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7FB33CE90
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 17:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547748; cv=none; b=Nk22Sz7ZumROtx1q85/J7bmdn6NXF8S8rEw1vkBepySFQGkjC61Q4I4SkhYbXyEhVgnFMXSLhcunhb6kEC0BLpu/Zz3V1WG8rQl2sY6L4IaOjGO9Co8LU0VB7aM+YTrgNQRfBu8LU0flOtPhTr0XRoaW8Owo3p8nJnPFiOM7SxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547748; c=relaxed/simple;
	bh=z7jbkJWCiHJzDsZp2daYSUCdawNKubcfe8rNVKzOBZE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mpvu92MwrNiRQvx7Y18DrPMw9frfR7mVcKffDeudcdMn3jzFb0gU8lmwxjeQxuCD7fy4XdMDwPph7Y5G+qI4d0wDduVEFkMkEMAkjPYSGlSTd1pdzhM4KI1G5Oh2aRkVsyhzBI1BlHjVXt3eidzk+T2/4/HYsnwhYj5HfK0LJ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vMv5tJCP; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vMv5tJCP"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3ece0fd841cso5150094f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760547746; x=1761152546; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qHQ/My45H6NW6pE8FY9S/15tlaPt8FNQ7uHm7Il0FNA=;
        b=vMv5tJCPJZsFH8/dGfay0bq/aeIdA98O86DRMjgS7gHEW3NJN3ktHDgopayy5/X6qh
         jX8fNaCSFH8Ym5AJN420JarURcpVu7P1KpnsKToC0kTxjSyIv4rONzFDrRt0mR86mRXU
         4FQRKkp07j0Y4ZwQrwz9oxCmTQO3pb6zeDT3ZVcTGqNNIMMtONjiamps3O7Dc9OtRvZT
         zpsxLVWfGxVfcewjBnxJ+91aHMd/7Jl/BBDR2YXQiCVnobiMCNEdK/rNBA4SZDFO4Kyw
         5JzJNh3uD9I3NvnO92d8elLtQowXo8CdrRAfk2kLMG8z4A70P+UGlf+U4gFSPfw8aBxx
         wzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760547746; x=1761152546;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHQ/My45H6NW6pE8FY9S/15tlaPt8FNQ7uHm7Il0FNA=;
        b=nCU4hhxcjZ0t827axMcWcva9PUrXslHhn6VcRkXdXUEHHUsvTG2QdewOXucQ8EEnUp
         kIKtCqHYwhrEMmxV4nuXz+5LFLx9VmC0+dqA7Sl2Z1Z+70Iw3QFgDg1F27o+uUE/WqFJ
         GXy921jiMdHDmegzVl3wO4qiQ01+Ga+IFlAvodp6p1ZsE/jZ6u379/JBLZQwuzFOkQEa
         6maCL8AKsmyNwdGT+enAVTYoVXX/+d7kAyzMFdczs1vCc0hv7yAHxKl4jRQ6lk5BcN9t
         P8bfvfhf6SZ8Mktk0CFNl0DUOSSnEjDJRg5hVcX4FSLHqPN+TchdvXpzlieL+7oVwsmM
         ICVQ==
X-Gm-Message-State: AOJu0YxyyZO2OYgpdGjgRScC3+V2ZazBb8X0sDfDdClQP6BsTbvarsQH
	mpR0/CRpQ1AtcTUSQCp2/l5oh+KCTD/bB5S20nm2oKvmNt0m5GIlJTqmrzyASegDx2wFRS3JnK7
	A7iFXoIeccMxuxA==
X-Google-Smtp-Source: AGHT+IHR9hnAt3TkdZgTBDb3KtT9RID/f89jZOUFMT5Pu2QM6neA//FwvD/h9k3LegqwxIgWoIii48dZZ8xSlA==
X-Received: from wrbgw33.prod.google.com ([2002:a05:6000:40e1:b0:3ec:de41:d5be])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2082:b0:3e9:2fea:6795 with SMTP id ffacd0b85a97d-4266e8de1damr21457560f8f.53.1760547745778;
 Wed, 15 Oct 2025 10:02:25 -0700 (PDT)
Date: Wed, 15 Oct 2025 17:02:06 +0000
In-Reply-To: <20251015-l1d-flush-doc-v1-0-f8cefea3f2f2@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251015-l1d-flush-doc-v1-0-f8cefea3f2f2@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251015-l1d-flush-doc-v1-2-f8cefea3f2f2@google.com>
Subject: [PATCH 2/2] Documentation: fix reference to PR_SPEC_L1D_FLUSH
From: Brendan Jackman <jackmanb@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Balbir Singh <sblbir@amazon.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="utf-8"

PR_SET_L1D_FLUSH does not exist.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 Documentation/admin-guide/hw-vuln/l1d_flush.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/hw-vuln/l1d_flush.rst b/Documentation/admin-guide/hw-vuln/l1d_flush.rst
index 210020bc3f5684a4510792aad5d0fcec659ad7d2..35dc25159b28a280793ad147d25d582f31a77999 100644
--- a/Documentation/admin-guide/hw-vuln/l1d_flush.rst
+++ b/Documentation/admin-guide/hw-vuln/l1d_flush.rst
@@ -31,7 +31,7 @@ specifically opt into the feature to enable it.
 Mitigation
 ----------
 
-When PR_SET_L1D_FLUSH is enabled for a task a flush of the L1D cache is
+When PR_SPEC_L1D_FLUSH is enabled for a task a flush of the L1D cache is
 performed when the task is scheduled out and the incoming task belongs to a
 different process and therefore to a different address space.
 

-- 
2.50.1

