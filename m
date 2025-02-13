Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869F271268
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 22:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486832; cv=none; b=l2oRZPpJhGFMZ9EB/nHCIAHWAqgzET1l5XYMZxuI6Pa5ud3vPvJfoI5x3KoGqh8dEX0vSnR6lNOnXSAswPv51G8+EM2/s3pdwEM85Lqa++HsT58d7rK6QL+U3IG5/2//hnaAhrgvhgj4OD3/0iaxM+vIkLiLDpRzjIMDuiSuyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486832; c=relaxed/simple;
	bh=ATtmJB9nahc4mob8MkIy5UZyQCyWqmMlFiBDBX7j9Mg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gufAjavZCRb+rxJAJBXI0G7Y/cGW2KLeBvUOCLyFmmPjEVABzW82VxB0olEeJgZ/m5tMhC1KEH4e03yBixjtxNKkakX+/azrxqWdURFwtkzeBN7gEVsu0iCGzjhTZ9mHPf6cLsd8Kiz+Bl2QUCZMj/ZYf1bxgjNPTOesKMwaxYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hFvHVQTv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hFvHVQTv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fa6409c0baso4937618a91.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 14:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739486830; x=1740091630; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hOJYwLimtWGBUdGEfM7iYC8bKir+nyDvGIJQLaOGSbI=;
        b=hFvHVQTvWUSO/aAQy3R4NQszie9FA13Hd0K1EPjbSaoHwdNZMaoGYMqGwkhark0DRV
         HjwMxd12IWRds+Sq2FjbBkTr7Gse4aGCFcGU9wxVkKUaQ0V06QR8i+WZyNiVTKzkezPM
         406oihRqCTWkEwpUYvGDHuGr/S2GmKCmoFQsqxUOJiOFqv9ZnapzTHhbJ8+GP2HKcpFn
         QrBIl7eCowm1M8GRpuFkqe2nu6Cb+7X7C74lOU8xiMRSI9u2Ar1ZKE9OB0gQb0OYEwvg
         8p/ryhPBbKBbqccAqVkPStz586qen0q9YQj3HBPXMHE/FOZZELuf7WTdjII+1wKZDndC
         VihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739486830; x=1740091630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOJYwLimtWGBUdGEfM7iYC8bKir+nyDvGIJQLaOGSbI=;
        b=f1XUfu5RrUxpBNYuOGyDJjfj6iuDBQdXhuVT3T4XZHkSZfHakjSVXBu5yX87h8iTt6
         nER1SEb/PSjylltAPM7tQgE2D3Ea6hMpuqZ4aeMCFuN6PCsI8dlDBjNsLyZWnNpF4H4+
         CUt040lgJoY7p02+5PVHQeR1+3x4nZT2T0i4MRIH38/Ad2bAUTpu544AzWPEWkSMs2W3
         3ROyL0WTmzXk65vXpNConfaKUvPeU1GFO1Eky/9ox2sPyL9pmOR4jnp5OdC99ZW+vvD1
         4s+BRJBxEQjfsRVhuDqQTjm60D0TY4aUlsbmeSch70oRdAZPPJeGl4bI3mfUavQYJSfR
         MFSA==
X-Forwarded-Encrypted: i=1; AJvYcCWLqqjkN/8EIRmeL8DX6Lkd2SfR7wOj9OOK9ylHtNi7ALY+B01/FlcoejBj4pEpfbUuc2mum+u27PA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SExJd4xM7GD05Q134a0ZSGcMPd+CQjLVnQjMWtc2Iuxb/bBU
	CHpjhDtNKQ23SATvPn+BmNSXCrz7bGzSh5bKP7/ZLyOUPsxQqPgbdIg0GneMPBdEQ7d8etO8QOP
	kcg==
X-Google-Smtp-Source: AGHT+IEOMdpbXGqVMbthd+OaRfeUWGsGbBZNR4yGOFrRj8/MuVDw8EpNm8XS12LJXdTQ6lIEpIij678/S+8=
X-Received: from pjur3.prod.google.com ([2002:a17:90a:d403:b0:2fa:27e2:a64d])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5245:b0:2ee:f687:6adb
 with SMTP id 98e67ed59e1d1-2fbf5bc1df4mr12403072a91.3.1739486830202; Thu, 13
 Feb 2025 14:47:10 -0800 (PST)
Date: Thu, 13 Feb 2025 14:46:42 -0800
In-Reply-To: <20250213224655.1680278-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250213224655.1680278-1-surenb@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213224655.1680278-6-surenb@google.com>
Subject: [PATCH v10 05/18] mm: mark vmas detached upon exit
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
Changes since v9 [1]:
- Add Reviewed-by, per Lorenzo Stoakes

[1] https://lore.kernel.org/all/20250111042604.3230628-6-surenb@google.com/

 mm/vma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index f72b73f57451..a16a83d0253f 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -427,10 +427,12 @@ void remove_vma(struct vm_area_struct *vma, bool unreachable)
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
2.48.1.601.g30ceb7b040-goog

