Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49781346FDA
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 18:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154145; cv=none; b=rg5bMThPtYdHSOzzdMquK71p8alDwegGI3sZfGlqEYCyFQXTAEVj6DfFMtUMm7nIG0NpRyGYtncOyy1nN2g8Bey95HAGj87n27/BPJHNVlXLglSSLmCmvkfNoJzM2KdmjtP0TpBV5ci7EUvzgs3LUvsvPlSZFG+QBTbZmT/DL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154145; c=relaxed/simple;
	bh=/ll0ethd+Y+ejhMqnBHdeN5CKETZ/XI2FbZX/MXGx/Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qp4gFJLpO3OXYYfK9TkaNQLqgiObih1mEPpD/aRgtUCmWnyURST+Oj0VNSuJ0SXERfZCKnEQ86ED7HPYl7GRO+fmsv1eCKW8euaqRqy0AjEFZuipF/FK0Gs9r/HsCLIoX87CBeUh81lQ8i1Ggd+3lcEQYlOPYjW4I96u66R86TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lWnEmNUW; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lWnEmNUW"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-69576b83dc2so4274930a12.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782154142; x=1782758942; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3NnqtfMpo6SzkdI4Y/HSdjjWo3N5TymmoO6c1c+A8Gw=;
        b=lWnEmNUWgiAJuCJ2psJandvmHOGoljVXEmEv3OYvw0DxJprLApw1qjEYX09tdZRrhX
         oUJ24G+STJzQ9IKjsXcX/JbP35nXiyq/igPt8ZrYY5xjK4T083/Z+uU+vArbD1e4ZLPj
         kqjjLTD+pIZQb6fvbRiI5DGMRhxL3gdvAqu5KsHpFhdJhbttdal2xMNMccXTK+Nnj6Aa
         IhplV7KRdWlu3elvPgyiz8fBwedc83mISwlZ5/YoGlSHiXgSqv0BSQxym96tDcSjObay
         /gm3KfITuRGwTY7SKcyHQqN7FKS9SINMc1GvgOfUrGvdTnCACxEiaWQ15STUAeh7CJev
         mQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154142; x=1782758942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NnqtfMpo6SzkdI4Y/HSdjjWo3N5TymmoO6c1c+A8Gw=;
        b=WNqWfN6GQIEcvoymHD6lkxIYPIBTE9jP/iyzrzxa3I0vfT/mJpjy5kQRKyFrFHaE7a
         9AhIlXf8FYDufAzgoG3y4WjYFilXEmfUZAJg1o85RATJ2Wj/t8roxQ9I+ubUkhQvUXJ9
         pPVZOoF775lZ9nyY9/v4QEU2HNrNN6a6q69EExqNgfjemITkBLJEbO8j26h8A0hr3pw+
         aJHHpItykWbjCN/tEe0aKcycyFLp60gVbeOJTCzhh28t9upH7KYFCVad0n0k6qtxOfpR
         0eASxTxgI6z3Wh7TqjLikQ2D2TUW0554lzun1fhZ1HYldYiTnQfKVpUmHqTYUjNweIzK
         PuRA==
X-Forwarded-Encrypted: i=1; AFNElJ+MJy0EVnSKa1ZGsgoiHIcrOy3PzyfbxEDHlIculCVcu08Okbpv+S3i8kJKWJ1t7DfSJcXDQO7C1CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw08iDc6stmhuwMVgNbARLBDOlwnmyOsXnFLpUXN6mNPJT1coeA
	I4fBlfHwXsBKmFdy0IsCZ3KRzHG+d6ZLh6CMNf1oj7XPxdogwtt1x+MBc4SIov1lelnt254dxLm
	kiII5nu5GNHenIwRT3w==
X-Received: from edh3.prod.google.com ([2002:a05:6402:5043:b0:697:8dab:813a])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3548:b0:695:837d:529f with SMTP id 4fb4d7f45d1cf-696e5221662mr7941415a12.20.1782154141503;
 Mon, 22 Jun 2026 11:49:01 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:48:43 +0000
In-Reply-To: <20260622184851.2309827-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622184851.2309827-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260622184851.2309827-2-tarunsahu@google.com>
Subject: [PATCH v3 1/9] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
From: Tarun Sahu <tarunsahu@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Mike Rapoport <rppt@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Introduce the LIVEUPDATE_GUEST_MEMFD Kconfig option. This option
enables live update support for KVM guest_memfd files, enabling
guest_memfd-backed memory preservation across kernel upgrades.

Currently this support only guest_memfd files that are full-shared
and pre-faulted.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 kernel/liveupdate/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index c13af38..2490f9a 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -86,4 +86,19 @@ config LIVEUPDATE_MEMFD
 
 	  If unsure, say N.
 
+config LIVEUPDATE_GUEST_MEMFD
+	bool "Live update support for guest_memfd"
+	depends on LIVEUPDATE
+	depends on KVM_GUEST_MEMFD
+	default LIVEUPDATE
+	help
+	  Enable live update support for KVM guest_memfd files. This allows
+	  preserving VM Memory backed by guest_memfd file across kernel live
+	  updates.
+
+	  This can only be used for the guest_memfd that are fully-shared
+	  and pre-faulted.
+
+	  If unsure, say N.
+
 endmenu
-- 
2.55.0.rc0.786.g65d90a0328-goog

