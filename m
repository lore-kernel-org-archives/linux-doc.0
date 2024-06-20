Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D1E1BA09E
	for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2024 18:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718909348; cv=none; b=baTERQe13w24KNeRAYtBK6wYvKgoKTUW8J+MEDlQ2MwgGK++NMIReXq14DvPVpYP46HDGMHqsPKZhw/NO+7iDs/Uy59N9OFOdJZlDy0ZupPMXySHWSJiADRId+KSSxmE+jFCPImYOipWXZ0TXN9b0KT4TfZD6SQfZZkF89qTeGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718909348; c=relaxed/simple;
	bh=oGrBKUaPPYMt4mq6hQ9WGmkM72JnKKHs67jeHGq/Bl0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tVMgtFo0h/hhK7UaSOU+kzBOuit0RHlfLrwmNcY3S9lNFJUjLSpzNz5MnFvYEJDRjX+AbSajOeb9zppi6lg8oj3QhPtY3smsxUolk6Z+MdQeFRDbhEJkp4AxW8nKDENI1pvyN/CGaWsqISJeUAx4P/2UcDA3ftM2wOAl98bgSXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zJX0UJQ4; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zJX0UJQ4"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfb2fc8ca5dso2174059276.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2024 11:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718909346; x=1719514146; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TWFrrNyw1Nab21+ugVhetla5erwSeVLyLbHLnKsHR/o=;
        b=zJX0UJQ4gCwCPkLhBI7uRvCU0EzGJRxdiNhdqujVfTJgBAnByC221C76Ucf0oMMSUo
         q6FBz/oMvm+uhzzUr+oecJ7xSetfrQGCxaoPV3itjH+nTXLb72qGJujUbCajDw21t6mN
         B6SC8JF+KKwj0sPopwnwHO/bkndzpYhjC3GrT95UZIIrecZvQ3Nc8oO9EDoAbPYjbEg1
         WiiyAiGLzeYn8I0mDzriG30QwpNd5dChka9+En+wuAjHAqzXYjBXptNb66QSjgEOX49L
         aLd0kL+6O+V7wNQ0A5uQPLdUl9oy/IJ8owou/PN5efRA+goxWYMUgOkur4RcxIhUKafW
         /Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718909346; x=1719514146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWFrrNyw1Nab21+ugVhetla5erwSeVLyLbHLnKsHR/o=;
        b=m/XklK+rX2WNiYXzMQFnBc18QKdKJN1UJiEO+ATi2pCiyBAFVeIzZdO7XLZFx2sr2/
         bfa5qAeBptPHd1/Jr9KQFohHb9wWvajJzW4WsL9MOIcdxafuX+lQxMQZWmOWUGqRsISV
         MKEZpDkeRGtVybiFSNCPsj2m/FzJgsOFBpgzlAB9MZ/+A4QKGwdjRJdLh2Z9vWskfZJV
         Pi/OnAwNeHZkxoXJRhpFwtxG4YERKroY/HYkIXS41haSPlhOjk8c0QV2tAqKc2ny3gn5
         kYDGifNwVF29KigOliHwvu8Y/MXkiTQ/HGx+bA6JTJgJ8sSoAT3W5uqv0uIUMJr3Z5lW
         bX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfztF/wAaVM9p837bZduw2deCss7CJqI1McN1q2VOqx3iwBRCkstRJtF7Nshy84DXMA7Y4Yh0/0iEgSK6jQbOcRqX96umMO4Ks
X-Gm-Message-State: AOJu0YwIQihB5yTICN2KwecRBhk86zRYQxqYOo6MnPIAYcs3zqP9nl7S
	Jw0Jv7FM8Iz3UOD54XiG5ZcxpNHzHcdhqIVFU9ZqIS97lMNda5IO3Rp9bs6hTfIOmzPbFyRo4Ax
	7cR6nMPbcfw==
X-Google-Smtp-Source: AGHT+IFRbsaa5YhIAN16G6oBhNsiWnJskLxaqW20TQItpx0rD0HFxamnsxbmBDl6kbfy5DURgNKiHDq5P351hA==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a05:6902:154e:b0:e02:b093:dc1f with SMTP
 id 3f1490d57ef6-e02be0f2578mr634179276.1.1718909345902; Thu, 20 Jun 2024
 11:49:05 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:48:56 +0000
In-Reply-To: <20240620184856.600717-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240620184856.600717-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240620184856.600717-5-jiaqiyan@google.com>
Subject: [PATCH v4 4/4] docs: mm: add enable_soft_offline sysctl
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	osalvador@suse.de
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, rientjes@google.com, duenwen@google.com, fvdl@google.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Add the documentation for soft offline behaviors / costs, and what
the new enable_soft_offline sysctl is for.

Acked-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index e86c968a7a0e..71463a7b3e2a 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -36,6 +36,7 @@ Currently, these files are in /proc/sys/vm:
 - dirtytime_expire_seconds
 - dirty_writeback_centisecs
 - drop_caches
+- enable_soft_offline
 - extfrag_threshold
 - highmem_is_dirtyable
 - hugetlb_shm_group
@@ -267,6 +268,37 @@ used::
 These are informational only.  They do not mean that anything is wrong
 with your system.  To disable them, echo 4 (bit 2) into drop_caches.
 
+enable_soft_offline
+===================
+Correctable memory errors are very common on servers. Soft-offline is kernel's
+solution for memory pages having (excessive) corrected memory errors.
+
+For different types of page, soft-offline has different behaviors / costs.
+- For a raw error page, soft-offline migrates the in-use page's content to
+  a new raw page.
+- For a page that is part of a transparent hugepage,  soft-offline splits the
+  transparent hugepage into raw pages, then migrates only the raw error page.
+  As a result, user is transparently backed by 1 less hugepage, impacting
+  memory access performance.
+- For a page that is part of a HugeTLB hugepage, soft-offline first migrates
+  the entire HugeTLB hugepage, during which a free hugepage will be consumed
+  as migration target.  Then the original hugepage is dissolved into raw
+  pages without compensation, reducing the capacity of the HugeTLB pool by 1.
+
+It is user's call to choose between reliability (staying away from fragile
+physical memory) vs performance / capacity implications in transparent and
+HugeTLB cases.
+
+For all architectures, enable_soft_offline controls whether to soft offline
+memory pages.  When setting to 1, kernel attempts to soft offline the pages
+whenever it thinks needed.  When setting to 0, kernel returns EOPNOTSUPP to
+the request to soft offline the pages.  Its default value is 1.
+
+It is worth mentioning that after setting enable_soft_offline to 0, the
+following requests to soft offline pages will not be performed:
+- Request to soft offline pages from RAS Correctable Errors Collector.
+- On ARM, the request to soft offline pages from GHES driver.
+- On PARISC, the request to soft offline pages from Page Deallocation Table.
 
 extfrag_threshold
 =================
-- 
2.45.2.741.gdbec12cfda-goog

