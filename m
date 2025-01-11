Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B28F17BB21
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569580; cv=none; b=OMLA9kw15ocZ55fsJwo8TqKCj1LyO4E/3BiyNR5vr11fzh2RAQgnapqeWvOxVU7GCGpsthWKV/Dhc5AWVy+LlQR/aLr63uXk8vKu8bsVJsjSP8xZm8dtI6CLBjKZk2s5+ZmsDG7VWRlEbRTkFXcwHVvGH8z+eNN2wyknwGx8DAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569580; c=relaxed/simple;
	bh=t9LvCLfNsf7gW2HQp/USAapAN+m412qBOrN7Y8/AQ98=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VD4m1YZD+lo6EBQRC0NQEfA4Po+w+1paN8uZ/YVOzsEKUdca6YaO19Mo8Et9h8xGOKao6dE4i5nbssn7/SMdqc3xXLDnbzJ5pbSFZFdo1VDgp2krvn5VaMQbZ0jtyYTh5ZuQEAklNYBinLiPezuKWvgOScXrGzDUPIuk6U4bu8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C/AMeDlZ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C/AMeDlZ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216430a88b0so51421765ad.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569578; x=1737174378; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QrBwNMjEBhpbcxWqFk88nlV6Pfhf+HDin7YMebARszw=;
        b=C/AMeDlZ75oo4rgod9o+m4BUXB5Tyo10qS6TiKTqa3H+eeGFJyhTldBrOsKxH979xK
         /iZbO9AWF6Pc+Qi9v4tdCs0FDYJFTuKNK5q1Ooy5APGYITqniJgPjMZ5s5Ywu7v6dLa9
         F5ZZsuc3/cjOhBePVBTBD6rx+UG2RvqT2tpUb5NmfkeYZ0jQ1zeQ2e3krYutiVvHjSFu
         ixQCUIlBsMsc/whq0gucmwdPmbvmUnqK3DbI/9CHClgUudXhPZFSJ36HcLSeiDVQvF4G
         48/UDRyZnyw5a6vPO4M4N2Dn+Ga0Fc94d7p3TZ6mjq2KaVDh0HJbH//KwwH27DQmUoRE
         rqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569578; x=1737174378;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrBwNMjEBhpbcxWqFk88nlV6Pfhf+HDin7YMebARszw=;
        b=c63WTz7oM1m6ce6AGp+dVIvzhVB8yTcxqism6GYdacbnIW3YDkIH82AozrKOzqRgAm
         xidhuOLoQAc+A/42kg6Ty0NI3zcg2YxkO/fa2R+KiCDBRn8A87aaOaPjm6vqvsAYeVtW
         jwZreGQsEf+BV0U/mdS74DNO7upLhMNljrNKmv+cgePLoP8geIjDrqdZ9dFmWAwji58M
         7hwxAKPg7lpSIZOiyLwPW7Gul2dxnXXtwO4JJnaQ0a1aEE2xacj6lfYRUtqAc5mSc56e
         12TvCURYNtgckvCVX2M/b9NEc2KT5Vy7R59lh4Hug0SU5MOjRCOxduw2XyLPd73x4aVV
         uuRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPamrVDFzT+uN+VUm1pwxNwkXoxm2HKY9+XPsIJaYIjiuiwGsBN8VO6UUBhgTbGJ229t/bbZ08vsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkGF025PS7CfGUXWOYd9io/CotJ1SHmFUz2gKe3Y3oONkwMQNy
	pkT5i1WnrYcchJdVi0sIVFMXzroxxKayJr1K9HLM4tjCQN4AJwMXXcrJiKToYxPH7ukIiTvsaQu
	kNw==
X-Google-Smtp-Source: AGHT+IHnRj/SaQAEPl0ebQpZxgzIjgJT++Eb5qi3sriuXSku4L0jGeJRI8Hfnaea64zScjmdjPJijWAPl6E=
X-Received: from plsd17.prod.google.com ([2002:a17:902:b711:b0:211:f320:a598])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f64f:b0:215:5240:bb3d
 with SMTP id d9443c01a7336-21a83fe4915mr197586285ad.42.1736569578687; Fri, 10
 Jan 2025 20:26:18 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:52 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-6-surenb@google.com>
Subject: [PATCH v9 05/17] mm: mark vmas detached upon exit
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

When exit_mmap() removes vmas belonging to an exiting task, it does not
mark them as detached since they can't be reached by other tasks and they
will be freed shortly. Once we introduce vma reuse, all vmas will have to
be in detached state before they are freed to ensure vma when reused is
in a consistent state. Add missing vma_mark_detached() before freeing the
vma.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/vma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index b9cf552e120c..93ff42ac2002 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -413,10 +413,12 @@ void remove_vma(struct vm_area_struct *vma, bool unreachable)
 	if (vma->vm_file)
 		fput(vma->vm_file);
 	mpol_put(vma_policy(vma));
-	if (unreachable)
+	if (unreachable) {
+		vma_mark_detached(vma);
 		__vm_area_free(vma);
-	else
+	} else {
 		vm_area_free(vma);
+	}
 }
 
 /*
-- 
2.47.1.613.gc27f4b7a9f-goog

