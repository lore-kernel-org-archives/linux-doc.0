Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02F143748
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 06:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742452788; cv=none; b=sByGwdIjuFh8VArmhiwsbBckMwmuoN74tohNb3C5nvGuHRHEZthoZLtRw9CBOgr0ZAiB4pw1M4oZXDOGQ2snC/t4k6XUx+zOfbcaDP+cgLxkhu0bjn+jQtld8zK0wugN1Z9kViRN8av0KLFNLJIMNX/Q6QWwkqJMGRQcB9IFVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742452788; c=relaxed/simple;
	bh=lvHr0xBduL12ILHUgkyvTDkRAIc5TEt9QlLTMcKApCg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GR8+PvpOGqMet4GGH8WIdHcu2ciUsdyUPh3JZYSBKLD9arxx/iGjFSROYCowTsqrFB+8l2F8PmC7prO8zmkYnfVvmHhgvAJg+50HnUwQWWCqNflyXzNmmveA1kowd6kEvOaiXuLjY0r5oGvtfy/rvrMdXg26VqfF+7mbhrcjTFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3UHfLraX; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3UHfLraX"
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3d2a6b4b2d4so8501805ab.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742452785; x=1743057585; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ZuKkdmfZDR1C+3icFeF962+7yJcOI589wOKKi/iF/w=;
        b=3UHfLraXEmNQRRJt+dSZjFQV+eZuZ3VyBV7NOM6LCKhmbBX9kfV592MnsT4SYRCx1/
         WTfPD4xzrTqOpQ0tLjKJ0wmwEFuWuE1hKvGwgdqr97NhxslNcuOMG0z2efLc2bthmkBN
         l03p2o3fb6k9evSwAGwo37tVLQIJyGH1aaoALs2iIwv6poYJpRo6kCfkaaks+5tWdM+Y
         4PlCYDJxTmxHTNamrDg9LEaBJBxcetn1mHT5P+aAs91iNoYjT5tew5AkZw11Yy9oBQ62
         j1RFcRPRtuYymtj+pGHozitDCaKWy14ObPGugGx88l6B2Ag+BQmafET3yKLOSYa9kbeG
         57cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742452785; x=1743057585;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ZuKkdmfZDR1C+3icFeF962+7yJcOI589wOKKi/iF/w=;
        b=MrFp5kxUo/ARcg2aYhrrCYwUj5Z9t2eXBHolDU5F4JpVQwfQCGGT3miHTQ0PtSV3L9
         No8UboJYLIus4kkJHBXfYQyQofv75HaGuX/1351tmiOoAZQlxMtr570yb0335pC5u9j7
         HHj93Ogup/vDqAwa+PlDaMJYfC8etUdnQ/gZy9PQoTA0HSanb+0OEKr2t/Jy6xw0qDeq
         73IkVQvNV+fjXi91v02HbXgI4QItDAcqLCKhYrAk0Rx/EBxSqdO+12q70RoobQo8SvpV
         Okbl0m3l2D8HCfQtkBHxcY2sBfJGzizdfu6xpNDUUazzdAGP80dPatJm8RrRv/A2AD9V
         BhIw==
X-Forwarded-Encrypted: i=1; AJvYcCVAAo3wTBruV09AltIrd7AFLDx/F4E26Gr5L1FxII+t2ZmzkV8NPbkyuKJkmsX++yKp15SpcfNmnto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Ubcfm3MPyGhHCrrtl4CBl3eSIaY1uifDzfcPTF1//YeHqoVS
	qFcj23e4mcLco/nw3dXydT3fvSTxB17yF/sn6qLvc0M1SqppiHzKddjtWKRPA/eTrAKl5qZMked
	gOg==
X-Google-Smtp-Source: AGHT+IHWqodOqFQvUCGpVWIEl082LJUg7feyjPoyDn+FcJqgqu/vvy3kAQRePZCxSlpgiFrJVjN7q7Ot0j4=
X-Received: from ilbck17.prod.google.com ([2002:a05:6e02:3711:b0:3d5:8368:8284])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1c0f:b0:3d0:237e:c29c
 with SMTP id e9e14a558f8ab-3d586b45206mr71026475ab.12.1742452785209; Wed, 19
 Mar 2025 23:39:45 -0700 (PDT)
Date: Thu, 20 Mar 2025 06:39:01 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320063903.2685882-1-avagin@google.com>
Subject: [PATCH 0/2] fs/proc: extend the PAGEMAP_SCAN ioctl to report
From: Andrei Vagin <avagin@google.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrei Vagin <avagin@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce the PAGE_IS_GUARD flag in the PAGEMAP_SCAN ioctl to expose
information about guard regions. This allows userspace tools, such as
CRIU, to detect and handle guard regions.

This series should be applied on top of "[PATCH 0/2] fs/proc/task_mmu:
add guard region bit to pagemap":
https://lore.kernel.org/all/2025031926-engraved-footer-3e9b@gregkh/T/

The series includes updates to the documentation and selftests to
reflect the new functionality.

Andrei Vagin (2):
  fs/proc: extend the PAGEMAP_SCAN ioctl to report guard regions
  selftests/mm: add PAGEMAP_SCAN guard region test

 Documentation/admin-guide/mm/pagemap.rst   |  1 +
 fs/proc/task_mmu.c                         |  8 +++-
 include/uapi/linux/fs.h                    |  1 +
 tools/testing/selftests/mm/guard-regions.c | 53 ++++++++++++++++++++++
 4 files changed, 61 insertions(+), 2 deletions(-)

-- 
2.49.0.rc1.451.g8f38331e32-goog

