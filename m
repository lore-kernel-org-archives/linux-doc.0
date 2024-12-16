Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0620C489
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377089; cv=none; b=icCksdmsg4lkchc8oYQbLAaO86hrFiSBnC/1gjb0YZWbj5V/lY2y4Y145TDVrTbdjA1g6npz3ntVbSwsTqVJmsjDdaaWvO07QMCwL8oIHx4Vd9/gyxougfGoicTgdLfJm6UkwOHAVbGsajd7eRooj90BnIi+ItB5Mqi8PM+31Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377089; c=relaxed/simple;
	bh=meptwdKdQlQfWYK30tfEjRISvkkyMSxm37GbBTGDJNk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iMSSWxAs2obqwm70t6HfW6J77KShFZRTUqgN0V8mPB5qrQ7nejvUdIr2AxfaZ94h2convjxvQbFPQKn3M3t9re8FLWhGIz2R94YtHCsgiX9Wzmnd4jiBpMT6zls0W4sziTvSRzaXR4UcjfjWIyYMG8+aQy6if82tOHkBNl/yPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aepi4bD+; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aepi4bD+"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-725e4bee252so3640810b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377088; x=1734981888; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wSQ3mT4u4m7ofM+stpYMvUJpeXhYChT7fq9/vjKfHLA=;
        b=aepi4bD+deWNr6HmgUvSPHEvKqqWUVn+rm0wh60KGTZu/rH8ASHhhDsUYOsmkhPaEu
         nGvr99iWzLWuwdxFcWY9uQPGop79fbK4iqnwv0gPBQKDhEn5F8KiHB+SClo9Ck92Wq+8
         mVIXpjuucYYiUeFBCBgiQVvzfrQPdbDMNrVS3Se+fsOzDm0QMNrqtKc1qd2CApXt09ds
         NDSHv97a7ud4qLCkIL3bBCF415KJi53eVVjgiYAXlhBpeds9hY22TLkjCdx0Bz2ho8FE
         vDmP2BQqGngaCjGcupdp3FwRmUUZ+ca/EosLeoBqOaxiE2RsDx/N3qH1FYPUOihOGyWT
         +99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377088; x=1734981888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSQ3mT4u4m7ofM+stpYMvUJpeXhYChT7fq9/vjKfHLA=;
        b=whsXk9MBkoqJkF+VT/JIGLrf8T6ndcaXWUnWP4F5gJ5U7ulBcCBec+B4BsE0LGY6kT
         8KVROnhcZkTRxcW7w5maTxfb3DwOREt1P50d18s7Iey4sohaH1cgTQX3up+ZMVDnHdJm
         hyXm3rkwkXDyYYbXUw/wf45ruYPATc4V2zMM0MEqevi85ybrv0CYg7+P9RlsYSEZ6gwX
         WR+ftA4SVmDnebPUZE++hQvfeW5BhBgteJ8Xo/h2Bbv20FtonnjyRDgquKyrnZaa+bJ2
         iiqLqBvwHQfjoUHbo2+Ae7aguqHSdwU1hFHUY9wQDDB+iLPMXxTGlYcF37/mYDoBkoQm
         f+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd4qX7/0mqTEuxI6Pazlc316h6CUWACSO5RdrYn37PoZXF3iN9d9aCaXv6hxW3qLKvFi2++Ry46Po=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdA3LI8mTEbmW50zXkyK31snFLnbddVPFuCKI3+t0A3NKDHCv0
	2Caub2Zn8nTUsiRBVjIXs0r/cNCdo613K3EvMfPlZeKF4/9dvpt7NT6xVHsh59z2wHCXluFaQe6
	cQA==
X-Google-Smtp-Source: AGHT+IE4pawsfAUH9TLKs+lZMgX1XervLrLNUWY+S4QjAFjLPVQLu5/+TUucSp06ogqQfpKVSrSRx/CLyDw=
X-Received: from pfop18.prod.google.com ([2002:a05:6a00:b52:b0:727:3c81:f42a])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d8a:b0:1e1:b12e:edb8
 with SMTP id adf61e73a8af0-1e462d60708mr1104953637.30.1734377087952; Mon, 16
 Dec 2024 11:24:47 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:15 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-13-surenb@google.com>
Subject: [PATCH v6 12/16] mm: remove extra vma_numab_state_init() call
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

vma_init() already memset's the whole vm_area_struct to 0, so there is
no need to an additional vma_numab_state_init().

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d9edabc385b3..b73cf64233a4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -949,7 +949,6 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	vma_numab_state_init(vma);
 	vma_lock_init(vma);
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog

