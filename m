Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477178;
	b=SaadFf67z4QaKfL+KDbXpRqrrQ5Es6DS+YOZuT1ywiC8uWa3WegjOEQ3MmZGYlgYFN8f
	 DTIhlBwi3JPoCvMmFUs0Fz/rcyY4V8ib+tYnszGjHpGdz0kFUWFD5FTvZD2IG2SN444QF
	 3PRT4JmZ5euMDOSXcoAVDT8fYScJI1HWJ6OJ/7oPW66JL7mHdFTKjs+abqos9knGKWfkg
	 0dPgFt6JC7Y/O0kh+2+tHu3eeYM0itFyl6SwKGtCSIYpfhS3sgdJYF1chxKYdtBx1XXry
	 NX1S7ZxbQweqJgIi5mKXXk8xM61BhMuWyrLOIzPsbHXpbvp11fK4ftg2otbVQGnvdoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/ZHoT97tqf5Dj8g+JDW8nW3DDYyt8I058/DSNhpOZoc=;
	b=Jm+KcRl7PaGVH6Mwoc038ikrjLctvl72evi+xcH1B8EmFtIvNrzYR8xds5lNItER5hCc
	 lIU64evkhvCpxEd2dF2RH6j7kc1wP93TNA2923pdT57n/38kKvSXEN67ZHsAkQqNCw7A0
	 9AyWvLHm7ecuNDbYQLyee0jlCz5MHH+yyAQ5a8IPXpsUZFV/JMD4K+fkqVdGO9TB6C/mT
	 zPYNInvl3NQ9zD/hyLoKxQaH9ioM75BbTUGKm6OMB5s8mfrPKhvbo8mTnPqlAM1gUZUyB
	 awI1RTsW/vwlmxp8DJItaT7eQ8XkRfZENE4rFyI5XAknevwKneYGWVFp8to0XKVDKAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BeXiV+eb;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B3606A69A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 23:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392B3606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BeXiV+eb
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4ae40674bd0so2345178fac.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477177; x=1796081977; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZHoT97tqf5Dj8g+JDW8nW3DDYyt8I058/DSNhpOZoc=;
        b=BeXiV+ebiGblBSHbl8C3EnCOu8ZdOH6ppFi+CKQedy0OS1Zgasu1jBo9gwePSvNCjx
         Jq5dK5JVCYnOe6NtCNWVpZzsY0/f3kWYHcdy0/6/EDewiPUTNSyPx45hP2nKbrPsFzTj
         fit54InunCMRqgpQzS/WUpqtA4pERmV0i6nDmGRJ8gSZPo1BbLFQvdqQgiVYEFX+pzPE
         kmombyJjfV6UCRxidMmrVvKUU2on29che9Z1ak/vbZvHDMohcBtgAdMdO4eQjto0rxJs
         mmn0NRzD0qMACSdG4PysvQW06gbzsMoq4G5OjDIfwFTh+gZB6Rrly8TSXusrdxgx0YU2
         45EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477177; x=1796081977;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZHoT97tqf5Dj8g+JDW8nW3DDYyt8I058/DSNhpOZoc=;
        b=R8HTTDG7brdUT/v26nfx13KIBsZ2UhZ9DCiaNwHiSNl0WQbcYiAAL6/ctBNwjYJ/EG
         pDswY/BPBw6DhGBQ0TmM0PhM6edDpXX/X7L3S2JedHoFTJaU77SKl6FFfuVLqXd8GJ0R
         pl5J+TdeKbrWWRIm2hRPomG5mCXT6TFcgAMb3uJGOzQz45zg381gPFevzV+Rg6w5I9N3
         LWihnii6fDZCfzahhUwQarTUriE3X4Rmjkc0dqmBS1SHJAfguYi+lZ9yxYQYlC5k2GXV
         W7MWr3KU5dz+8A5RCJQ2ZREozxI8bUrEm5KSiGb0IcdFbumB7XO+3qLR9Fq2SKo3B11v
         +R6A==
X-Forwarded-Encrypted: i=1; AL+hErFvkfW8f7jt57qaYRN28GtJGxo0HrVv2BTMCEofItF0qjO0koDYaexrwz0Fn1Mjh1Xtm4o1AcLL1F8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kcZj+NHCQWsCZAgaz2XGkfBejuY8DOiArw99osafR5BVr+Spg
	Wxk/F7dh6RWWuiN9b8/r0oUgyGctB3zQFcdGThPTzQg7W8l+2ZEqcG1yRHTE2JHmc1+b/r/ClAv
	VowVfgiMLIDLtOw==
X-Received: from ioi24-n1.prod.google.com ([2002:a05:6602:c658:10b0:9d3:b408:7991])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2381:b0:50a:7162:87df with SMTP id 5614622812f47-57a06b2491amr12786319b6e.2.1795477176976;
 Mon, 23 Nov 2026 15:39:36 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:11 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-7-dmatlack@google.com>
Subject: [PATCH v5 06/18] liveupdate: Don't WARN if tracking a retrieved file fails
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Handle a failure to add a retrieved file to luo_preserved_files instead
of triggering a WARN_ON(). Make the failure permanent, and keep the file
until the file set is finished, like any other retrieved file. Only warn
if the file is already tracked (-EBUSY), which would be a kernel bug,
since a retrieved file is always a new file.

xa_insert() can fail with -ENOMEM, and userspace can trigger that with
LIVEUPDATE_SESSION_RETRIEVE_FD, so warning about it lets userspace crash
systems with panic_on_warn.

The handler has already consumed the preserved state when this happens,
so the retrieve can't be retried. Keeping the file ensures that its
resources are not released before the file set is finished. When
finishing the file set, only erase successfully retrieved files from
luo_preserved_files, so that the id of a file that was never added
doesn't erase the entry of another file.

Fixes: 00d0b372374f ("liveupdate: prevent double management of files")
Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 kernel/liveupdate/luo_file.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 9d98438b0166..0755a6478aec 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -675,14 +675,28 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return err;
 	}
 
+	err = xa_insert(&luo_preserved_files,
+			luo_get_id(luo_file->fh, args.file), args.file,
+			GFP_KERNEL);
+	if (err) {
+		/* A retrieved file is new, so it can't be tracked already. */
+		WARN_ON_ONCE(err == -EBUSY);
+
+		/*
+		 * The handler has consumed the preserved state, so the retrieve
+		 * can't be retried. Keep the file until the file set is
+		 * finished, so that its resources are released at the same
+		 * time as those of other retrieved files.
+		 */
+		luo_file->file = args.file;
+		luo_file->retrieve_status = err;
+		return err;
+	}
+
 	luo_file->file = args.file;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
 
-	WARN_ON(xa_insert(&luo_preserved_files,
-			  luo_get_id(luo_file->fh, luo_file->file),
-			  luo_file->file, GFP_KERNEL));
-
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
@@ -780,11 +794,12 @@ int luo_file_finish(struct luo_file_set *file_set)
 
 		luo_file_finish_one(file_set, luo_file);
 
-		if (luo_file->file) {
+		/* Only a successfully retrieved file was tracked. */
+		if (luo_file->retrieve_status > 0)
 			xa_erase(&luo_preserved_files,
 				 luo_get_id(luo_file->fh, luo_file->file));
+		if (luo_file->file)
 			fput(luo_file->file);
-		}
 		module_put(luo_file->fh->ops->owner);
 		list_del(&luo_file->list);
 		file_set->count--;
-- 
2.56.1.809.ga0b61035b5-goog

