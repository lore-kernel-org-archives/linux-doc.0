Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3037B1B4130
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339667; cv=none; b=pTsHUU0glVNjuptI0FuYz8hsGMrj08i6ZiJUK1K2uNmWgzdzcbn8f1NjsY6lzjAGYNJjg800gmqiFcW2wxKgMl5Z5EiUP6+jgFblzji3xtymD/xIwqj561gMsQoUx0NfDt3Y0NJw2qN/b8bcXWHTY3OcF/5QDjQyFsFjKWAuuuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339667; c=relaxed/simple;
	bh=+IUtnc1DFoGPVy1DRFRoxmxu2aWJ46Lvmm6jdceQ08U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dw0+nif00QPwq6OMj+rf8MI2CO4JEbpyWGhltv/I7eNRFoPD6tK0iyK/RO9+DFxfo7OrqzAbS2YSKWdVhgNofhqcthukcGtgNQx810ZF5xfd47vxQdmvUweopb0CMbAhTKNF0ZbZK+CDQ4fFobHCBlGPNoN5HJOZwyJ92XhyN4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YZCIZO+D; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YZCIZO+D"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7b67a8cd4d2so19538385a.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 11:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339664; x=1733944464; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gP/1ZRcuFjEEMybT5UMVVNt/puu4fP/kE3PemhzVNvM=;
        b=YZCIZO+DbqhbehBvM69e/tEJJ8i5uXPoksPv/Ke0UFiHSA7MXTrhPGufAqeGVtdTwu
         SwqXXdHmPMagW4HABsEFIIBJezCiRYotazeptUCHcPr8zR303RpnZw7IMYZ8TJySJTVb
         e04Ypoxa+s5hZTPssoLkzp0sZzAp3+SAxVw/vpSghCJTneWTOXOfpMj9xuf0j7xHZFL5
         s11MEDla4jfa0ononUrJ+VA4hzP4lgFI0Dg1rLYcod83Lr23FYaI/bpxjbkApzrg1nH2
         XnbQqhDl7WiLcOSZ6yd7t/NrFFM3f7OOu68l4vyQQsNnGgp35X8U8fM8pX1a2NZr55kv
         HW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339664; x=1733944464;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gP/1ZRcuFjEEMybT5UMVVNt/puu4fP/kE3PemhzVNvM=;
        b=fGsqolOu9HrOaHz+068IlN70nNG/U+j07ws0/kK+sng+Y12kiLlg7tcwc7q8X21+2W
         uev/my7wtBHEopGjs2OytFNt9sr/6MYVkkukNAxl1Vv0LseUnzG3FfpNrzgPnRq0uSfX
         gbJU7aZJ0A30uRu/rVHSFmcqACyHhcln0Wgl7lIoGo2dopjtjjWi1eFf92E/Hd3nplQ6
         TB89cOddoN2Vg2rqnTi5tGoJeX7Ibbd2+EFp5DvakaCs5mSTL8MpXkMKHsDTJoNLk/Tb
         iBv6KG0eqVHrkR7vEdE9Uy36L53fR0scho3E4OX49ENnEcKLFgQoLAr1xapu1VPeYARg
         43CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy3MQB66h014V9hNzqhfz1TopZjjJ0wg1aVspU7cXFwFd9BvgAjR5e0q6HlbFZJVEDa1S+nOzPtcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu8tf4KWaC08mL+EFSqZhH/bOOX0mhHdvwmnwCsiFdKoJ+EFLK
	7Tmh0DahJ+s4ntpZlgY95YcVRPtw2yNCc7+4GmCx0CesLnxP1nwd4jIGo50M/Y5v/DMguFLIz+C
	pjXCqOVwLh/17bo8y4A==
X-Google-Smtp-Source: AGHT+IGl8+Y6jXlfDxpaeYQWcz7MkBYaeVCfdRzcMWgZ4EOOrzmqxMS37+BVzh9ZHq4dtxMyhyVDFBoslVL+V2Wp
X-Received: from uabih6.prod.google.com ([2002:a05:6130:1f06:b0:85b:c307:6bbd])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:44c4:b0:7b1:52a9:ae1a with SMTP id af79cd13be357-7b6a5d2aa5bmr858557685a.4.1733339663968;
 Wed, 04 Dec 2024 11:14:23 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:44 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-10-jthoughton@google.com>
Subject: [PATCH v1 09/13] KVM: selftests: Add va_start/end into uffd_desc
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This will be used for the self-test to look up which userfaultfd we
should be using when handling a KVM Userfault (in the event KVM
Userfault and userfaultfd are being used together).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/include/userfaultfd_util.h | 2 ++
 tools/testing/selftests/kvm/lib/userfaultfd_util.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/userfaultfd_util.h b/tools/testing/selftests/kvm/include/userfaultfd_util.h
index 60f7f9d435dc..b62fecdfe745 100644
--- a/tools/testing/selftests/kvm/include/userfaultfd_util.h
+++ b/tools/testing/selftests/kvm/include/userfaultfd_util.h
@@ -30,6 +30,8 @@ struct uffd_desc {
 	int *pipefds;
 	pthread_t *readers;
 	struct uffd_reader_args *reader_args;
+	void *va_start;
+	void *va_end;
 };
 
 struct uffd_desc *uffd_setup_demand_paging(int uffd_mode, useconds_t delay,
diff --git a/tools/testing/selftests/kvm/lib/userfaultfd_util.c b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
index 7c9de8414462..93004c85bcdc 100644
--- a/tools/testing/selftests/kvm/lib/userfaultfd_util.c
+++ b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
@@ -152,6 +152,8 @@ struct uffd_desc *uffd_setup_demand_paging(int uffd_mode, useconds_t delay,
 		    expected_ioctls, "missing userfaultfd ioctls");
 
 	uffd_desc->uffd = uffd;
+	uffd_desc->va_start = hva;
+	uffd_desc->va_end = (char *)hva + len;
 	for (i = 0; i < uffd_desc->num_readers; ++i) {
 		int pipes[2];
 
-- 
2.47.0.338.g60cca15819-goog

