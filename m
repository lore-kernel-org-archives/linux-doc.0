Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19533612E9
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777824287; cv=none; b=IqgMerM+Ob0NvwW16Pyjs3in7a2YW6Er71pLyRtE1gyGUjcEn/l65RZFY5+dxNVcoYolJqMV0Yi2D/8ZinQO8TTc5Jw1PpYhFBPTgJmxtkv0xOcweeSwhl2OmjZvPB18qh/RNZYt1DAMr92S4DmvI0uAH8YycXDBjPVOUOByvec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777824287; c=relaxed/simple;
	bh=bZ713PlyI66Y8baNCt5bU/d4ETaGu0rYRrgUFeTdUFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U3OQ9ZkhWw3hC5JPm/rabEzH3rQLCkm9Ukfr36Lt4KcZCn+pmtT2qIjwK94guRCAzQ6Bf7SrZyWyUksObVD191FIIJ++SLOsoRs3qScXu0zrngLrL8JNjNeQPRvOi5ZIKTSxillc5nK7gwaOBnNTSIJoj9SZhN+vrf6lmC8/Hkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fv8gmclu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QXxr2Ykx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fv8gmclu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QXxr2Ykx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777824285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X+mJ3ULyyTKCXVslNnzkq+GlbrFoX1sf8l7wRqCeWDg=;
	b=Fv8gmcluCsjNakPc5ZWrOM0ZvgcZyIVX28xWcX5gBkxypO6Z7OFdv+4Jmleztqy2IX4IYa
	VcmH0QDMkrb2gH9FtM+cvC4pTTwmBDgkZBx8B/fzq5n38kSPk6rXmFXpFj1O9gNrBnxSbf
	Ay+0Y4AEntuxR2XW6mELCyh+h7la/9E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-hGN1V2qxNd-995w_q6ysSA-1; Sun, 03 May 2026 12:04:43 -0400
X-MC-Unique: hGN1V2qxNd-995w_q6ysSA-1
X-Mimecast-MFC-AGG-ID: hGN1V2qxNd-995w_q6ysSA_1777824282
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-488d8deb75fso27178465e9.3
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777824282; x=1778429082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+mJ3ULyyTKCXVslNnzkq+GlbrFoX1sf8l7wRqCeWDg=;
        b=QXxr2YkxaNoD341tdRmTqSnHShQF+MxBiNDFOCtWefQvK1eUSj9UyW2grGSB4xXkZH
         3dppFtVVyFVgMEKwkLegIpZc6k8Kk/rd4b4aNcVwritvofwKIXbpI78d3UsUXeBTeqg/
         PdtMQw4pj+7/+HfhaV2XrYQAmTawcEtYTrh0T5g9jnVQ0xcF2tuvRVVa44GExv/yOWae
         KcopnmstMLt0nuc6PTRcYyCCx02sPj9YVVRwZQ5me9LSOg0gQc2STVx1maXICc1s0KLt
         HZeexNB9hlA7yAQ+MKckHi4Ytc2ZqtwjCQUbKix/X3r/QTXf5ruCb6Tu7d5h72ygA4W5
         /Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777824282; x=1778429082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+mJ3ULyyTKCXVslNnzkq+GlbrFoX1sf8l7wRqCeWDg=;
        b=pKyAnyGVRYcQpuEcc69bK/oJrBez3SbSph9XWVVoF14a2gKqd23WcxjOr8Hoic9gJS
         62GOcqLzCBetLYsPvYGFY7/dQ5bsQYnY+r8Q6bZQSoBwRHCS2m0EmbI8C0SAKdmIgtD0
         0JGBl5SP/8IYl5Db07xdo+OlGd0ZgbYuLoTCe+ySCp6hjfZ0dyci7X0R1ZfPagbNbW4Y
         cMjRNIpulPFQVX+ihq70B2iohQJb/NAbN2/iz8MPKx6U9dTX6udfyj6k6XAE+0eO0/S4
         XFhnYAwbWUg9RWBpAxGlS9hkzMtd8WcU9meaY+OhwDq0HHxbMxP5MBOt7X2VBAvN+xVd
         l7qg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZpQCuBLgmw2MzHNii4SGYPQVczPqFAdkjTUkdOG4NcCK5yMfJbmuYLsfRgM4Pvy47gzePmggKfXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdi/vKpf3QTUy+hw7I4Qbl2fWq9W8+Tzxu5vVgO+0/wS6a7F2a
	MI7xDiMNzqLFe7tUQcwiG8Q4ofUVVK8qgPZ9D3+j/cJ2WjMyLxERQLGwgy/qfcrdg6ky96W29xb
	QBSkrYoW260AHJfQ8WoJW18A6H2sAP+4z/SZJvLBu2rKkSymE1QJ1i8KhsotgWg==
X-Gm-Gg: AeBDieuHpMP6Eqhk+Ud6RhXyqH4djM8gMfiFWvM6R6ctQpoTbgQuOB91Rc6v2cDwr/A
	ng+a8WXTXIag7vPq2wf3e2pRLxfUeg7IzK8w4DVyxCniQRBWJY5KmwjtbsdC6+Ai/gRJUgQLhFF
	SBcse9c/KIZZ2kUMGqDY7LcLGnKq6uqS0/OdTCNjF6THnyAMqWl0e5LloL6dIuEdYGbnB02z+so
	DAfxM//W5W/AzppK8xsfsBFWZRz4QunjMLfVlUCUcsOvNdV1zODUKHrMsZ5YP+E+1fqK7PJiemp
	dEdIbcfNVvHvS31oRkZGTFpopVwVugSPqy4SnMMDPRx6K1sa/QZ2IOhSr1LyZcLnFy81vPny1dx
	UPezQj+JF/LzHlYfAkKq75ocDj30MEkfcUDA5QowVMsdyf2Pf
X-Received: by 2002:a05:6000:613:b0:445:ed7f:ce84 with SMTP id ffacd0b85a97d-44bb34e71e3mr11488046f8f.10.1777824282476;
        Sun, 03 May 2026 09:04:42 -0700 (PDT)
X-Received: by 2002:a05:6000:613:b0:445:ed7f:ce84 with SMTP id ffacd0b85a97d-44bb34e71e3mr11488010f8f.10.1777824282049;
        Sun, 03 May 2026 09:04:42 -0700 (PDT)
Received: from costa-tp.redhat.com ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981ded99sm19800555f8f.18.2026.05.03.09.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:04:41 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: locking: Fix stale dquot.c path
Date: Sun,  3 May 2026 19:02:22 +0300
Message-ID: <20260503160221.1594319-2-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The quota code was moved from fs/dquot.c to fs/quota/dquot.c
in commit 884d179dff3a ("quota: Move quota files into separate
directory"). Update the reference.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/filesystems/locking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index 8421ea21bd35..277e49314d32 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -584,7 +584,7 @@ write_info:	yes		dqonoff_sem
 FS recursion means calling ->quota_read() and ->quota_write() from superblock
 operations.
 
-More details about quota locking can be found in fs/dquot.c.
+More details about quota locking can be found in fs/quota/dquot.c.
 
 vm_operations_struct
 ====================
-- 
2.53.0

