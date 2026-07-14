Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B862931FE
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 22:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067692; cv=none; b=AfxToYxHMz9ZWBj8JJ5a/sb/9MvwMt00O+FKlKMN/fxdsnwlpxNUFtYxzzwfrDJtbu5tcIQ6bJ7LxxKQGSF0pWQ60sxhoCyh8mIisbCoDAGzmWbQbtnorbmePcbv1IwUlNkrHmyFwcrkJTAZ6aQi8m7yKtGzPNeHGNilGmi9fk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067692; c=relaxed/simple;
	bh=bwr01/9WY7csMe3oixAvNcmOUvWfBdhgJjR3WJyG5E4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bUS3i6CueyLMqcfvy3VIF2+RJPaAv7VDi4o5/izpeG0zVbgymfXvWd3za1/Mkjh2+CLJrL+9obcBLGxAfbCO9ycpDDF9fZJH/cDTG4dTpYvsy2AYzXegosUDUyJXfx6bQLlD48P838Y9JGKzdIiYpOpJGwRWwjD3u1vvIim5QLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pFM+hxXf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFM+hxXf"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383adaa461fso1100673a91.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067691; x=1784672491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vc1a4EA+CKVDZWmxoam2W7gn+VW7+IE4FDUnuymM6t4=;
        b=pFM+hxXfzFnja+aVqNPW9SovupETbvBAdQAZy9VjiPEUkx+xPnbeFY8Sy9DLT8l+RG
         UYtifsORQ6WeMVOcakDxYKwXZk6YM6vujXJyeQGm/Jozr4apH4pwDR0VUQuyYt/m55VG
         4880/fqC2MmP58/NWVVgs6N9dCIIuFF2hcNVU16N2rnbeBCrFvQGVA0zR99UFV/BEqm4
         8RmPxacetvCIjf9FAsfnQH2IoxGUphSZkxRXsaGgXXmh/OS9wS6Pn/9TprTwzTqvBKht
         QI4LCVXsje05oyOd4LlLa/rtoMj10S1a8n58Z8697TLf5jb3SaJ6uCRXhW188Fxc2Ilf
         3YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067691; x=1784672491;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc1a4EA+CKVDZWmxoam2W7gn+VW7+IE4FDUnuymM6t4=;
        b=HNvGqYvK3HNapCLor045agp6DkDIDJrC8Rdwx7U95dv8nwtCmCEb21bhowSAnYXVWb
         Fs9psL1Br3IAEuI86WkiwvurJ850Whsk7KZXPjJmJ29iEulGHAHM+en66VoxlJyiEUi5
         0IyJ9O/eGTjPaKe3DGojhgViV1f1XlW2vH92scLXWZa2fygDropMm/XNs9LXMe5rvfLy
         j+1OfiHrvr2NxRDH6zxP5hYiaT32s1VBHi21kZ/vGX4geha44uU/Vf+fDOs4tiirCnp8
         g5Yk92dUAgFLR2lX4O4WmOANj1ACWc3KjbDFo+WkA688sPDWIvmZMcPGfZo2NRLnZwul
         r5tw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0KeGT+AS4LZ1RGyTyUYtZV1SUpzopJsUnvYd9VwCeVfxrtKNkujPV7fU/TUjOw48WIaH5B8RXx7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn811jOpgD1dZ1+6/V9BPWm+SsucujYMWzGWdhhgWDRYk9ChOk
	w6CRzCVFjuIp0LMXmeriMraVcAVS9FWf98UXvG+N/GCIe1DKGAIlPKup
X-Gm-Gg: AfdE7cmou70Fj/LXpGwG7l5c5dBavpAhxObKOnveIOGTMYCgWE6e8N6Bh8ss5gaOzDY
	s6jCyoIjDv/0z8jiP32wr9akcCnoUq7LxxcCAo9xCMleqGLYtMWKHGfBJSbNojc0crlqYXCGE1f
	JtpYVmKmylsUWYKd6ylTCN/hM2KtBdqSLsCcxKYFgdqEZ30YXZIAheKFltJTTvNtcmgLhghA+vj
	N8Zue6gK3yNIb/A+o+FJcysmQYGlE73F+yHPr+o+N5Zsfgi7aj6Vq5t9RqCZw1H1erRSzt2QBef
	J1h7pjS25XTjcc+d2T8d0yiz9xmj6q5Axu55/bXCkxF8R/p4OdTUILfu/KdvtbJqFG1t2zLNjBs
	wnQNJm0yK/HOVVu9B9KYiVFdI6mq5XVjyOH1BjHVuDEDDC1ku3Me64S/qXG6QHpN2MJ65zdsR7i
	PpsIKCKQNlWxeqBpT7p56nEEiOGqEIEZXKwBNfAqvFZLR3bQOPMv5ntMM+yQY=
X-Received: by 2002:a17:90b:3d4b:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-38dc782ab85mr13404006a91.2.1784067690606;
        Tue, 14 Jul 2026 15:21:30 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6d08sm2132074a91.2.2026.07.14.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:30 -0700 (PDT)
Subject: [PATCH v2 1/4] fixup! mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Date: Tue, 14 Jul 2026 15:21:28 -0700
Message-ID: <178406768885.1106335.9955379956617151440.stgit@skinsburskii>
In-Reply-To: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The hmm_range_fault_unlocked_timeout() example checks for a concurrent
mmu_interval_notifier invalidation after the HMM fault has succeeded.
The sequence number used for that check is stored in range->notifier_seq
by hmm_range_fault_unlocked_timeout(), so the retry check should use the
same notifier stored in range as well.

Update the example to pass range.notifier to mmu_interval_read_retry(),
and spell out that the retry check uses the notifier and sequence number
stored in range by the HMM fault helper. This makes the relationship
between the HMM walk and the later invalidation check explicit.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 Documentation/mm/hmm.rst |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 5c88d2cf0818..fc1b8dc19825 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -206,7 +206,7 @@ The usage pattern is::
           goto out_put;
 
       take_lock(driver->update);
-      if (mmu_interval_read_retry(&interval_sub, range.notifier_seq)) {
+      if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
           release_lock(driver->update);
           goto again;
       }
@@ -225,7 +225,8 @@ The usage pattern is::
 The driver->update lock is the same lock that the driver takes inside its
 invalidate() callback. That lock must be held before calling
 mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
-update.
+update. The retry check must use the same notifier and sequence number stored
+in ``range`` by ``hmm_range_fault_unlocked_timeout()``.
 
 Holding the mmap lock across HMM faults
 =======================================


