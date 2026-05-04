Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0A04266BE
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929540; cv=none; b=abQTfiXpt4tt2zBAKfKPONKi4DMtZM+TU27xwsjlHZi6jWfCzQuC66Qrz00+Mc8WX/nb3134VnRaRTpFREf8OLF7JH9JxFN0aeU4zeij+ukccEj0r6HW+Ltk14+OhFDtAb609OUGUv0sOKZ6Cbo977oPzlXvYjG7svD9sC82VBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929540; c=relaxed/simple;
	bh=/Xt6rnYnGFBq52V4bBzNz6QqRctwemMB97jkZH74ots=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=laB9Hnficpiw28JeDqetdwxoSAALHfJL1BNZo+g8Z9TTJAPKxBmRJP6KpRAIhZbkKzRJl+s+chvHdYCrqRy6hP3ngntG+IrPomMMrt9eimL2k9k36W96MHH1B7b5Yy80T81zcGITA3QDmICx4GtYWmUeS4L265TGcmXZFJ4o2nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GAA6nA7x; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GAA6nA7x"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-68cfc614246so6160230eaf.3
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 14:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929532; x=1778534332; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=59TeqgAKhZvxIms330HaGI06DkqMrz/YA7lL8opNhPQ=;
        b=GAA6nA7xd+hXrpdjcybtVknsF0NI8V4ehjMD8DFQ6IOV0BprIcDwQ7/Pve2krzXgDJ
         k8W7ng9N72p6QUJysxBEiK6mBgZEZC3S4SWueXIKTT/j2UOFG3zbdrG3Tli8RSJpDkZu
         27Z3+aUmi4Frzg09wlDzQDrWw7cLDH7LIgi+s+L+UHSYJAO8gtafX7ENT83uaz5+uAKp
         Um8w+5H07mziO1vDOlU2WlsYGdE3sCSGbhh4/sqfkFG3pZ7B/HZ36Oy/XwNoIk3mCiuz
         67fpBa2FWsRM7eUuZQtennVqoZQ1bKOZsTN8s1/m5GyKOMc2uPoMzkqn+cfRgAzuJNWg
         aQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929532; x=1778534332;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59TeqgAKhZvxIms330HaGI06DkqMrz/YA7lL8opNhPQ=;
        b=p2xZCVa/VORbpQ39rZw9nmehg+V0K74OQ0kOsd1S2Zzuw0lUxyo6LYY5NYsAWLD2a2
         0GRBvN/qWf9b8cDDCq0+8xpi/HXpBadC0EzS3S8nUpOT72wQItI5foQZke0/OpJAQcpx
         EYrWjkH4gBW+J8f6TvT/B0jGa4CbrICwXU4a3q1RJkYKAnAE+LDYNHb/n+LNZr+WsBXF
         +v2HmiFVHu6EjWYnjkm/M4/XabINwa9qbuZkwO/30og2NAHRx+093VvaitlDo0oQnMfF
         fbDMscw5cWp30OF7w1G+f/ZmeGis3Vjj/mVKBKCsK0rtzMFoEISY6SKr1xWkfxFs6sS1
         Wy1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8y2Rhb/ILlCE7hrx1SmJ0cSMddY/PHavJNlvT/pKQ9CTePH5DG/mODm+itIKItnnUINkKJeyWFitg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrI9PW2Ad5WEcDsW2peGVOMoHThgl00BVNxoe2Znih8Ym56qM9
	LgxsK248d50YaKJZ2pplELXl5kwXAM1FIk02FNpGFrrCZk2koF4PYyb5b4fsB7+OhMENOpPVO8J
	ItpDupjE6eyKOXYCaYvhoGIqHNQ==
X-Received: from ildm3.prod.google.com ([2002:a92:8703:0:b0:4fa:5514:a367])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:629:b0:696:757d:1942 with SMTP id 006d021491bc7-69697c60c82mr5023525eaf.32.1777929531976;
 Mon, 04 May 2026 14:18:51 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:11 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-19-coltonlewis@google.com>
Subject: [PATCH v7 18/20] KVM: selftests: Add find_bit to KVM library
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Some selftests have a dependency on find_bit and weren't compiling
separately without it, so I've added it to the KVM library here using
the same method as files like rbtree.c.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm   | 1 +
 tools/testing/selftests/kvm/lib/find_bit.c | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 6471fa214a9f9..79a45807865b5 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -5,6 +5,7 @@ all:
 
 LIBKVM += lib/assert.c
 LIBKVM += lib/elf.c
+LIBKVM += lib/find_bit.c
 LIBKVM += lib/guest_modes.c
 LIBKVM += lib/io.c
 LIBKVM += lib/kvm_util.c
diff --git a/tools/testing/selftests/kvm/lib/find_bit.c b/tools/testing/selftests/kvm/lib/find_bit.c
new file mode 100644
index 0000000000000..67d9d9cbca85c
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/find_bit.c
@@ -0,0 +1 @@
+#include "../../../../lib/find_bit.c"
-- 
2.54.0.545.g6539524ca2-goog

