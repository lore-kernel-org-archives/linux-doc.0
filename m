Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FDA25A337
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741696629; cv=none; b=sFWrxg+LTO9UIfUjwpUZp6XMD7C6ygkMUZ0TPK4q08wi7cIORVYA/mYJDY0jYZ2VDR03AqtXK8M6J/gGbA7Cu5tvDI7r0EoKtfW0p73nggFAviE6kEGmaGuaHe3pGxKhoZnEoj3IzfBOCWulI8+4T33C5cW8pLrW2th1+si/BSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741696629; c=relaxed/simple;
	bh=zNk+oVMzTrxJrAV3YPS/mCKpQLRaGo/5NfuNYVLO0DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2WZAdv34AN/oI7L9j69WlXqYZD2uYkPwndF8C4a4BCwbRE++BiaDCQd/WgqanLvT0lQtm9QNMCSdtKFl9NovGGW070oVNtUgg8zaWtPZk1RmrYLIR+NqRXHdOckj7HOJjv0DGk7dJAuJyQfErP6ygjYQZyn8DprFSCHdzFlhrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NsLYiDJZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NsLYiDJZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so15482305e9.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741696624; x=1742301424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOohSrQvPqKoJS058lh6ERBfYfFVZu79WxTYWxna9iQ=;
        b=NsLYiDJZXlp7X/saeDGXIS/Eaf+BKJNGesltZPBd8n7nt3ewjAG1USbmbfviciduEl
         sKGNWnhT1w4L1QLII2a2/uDNltVybXrv5eki9+Y4wEEAsqX0oyOgIJZcL8A6mmydItE2
         9UzKt3FhDdPAJUvm2sdwVV/ehIcVTRHtYe/MGvsT1qYtivvYqkXCsNnE95qUt1P1uVjW
         IO8+aTFlGyAJdW6n/SjUE5wOzTHxZUrUfHoRsyrNzuJVaVkm3GtJ4XDh04/VhzlwgpYR
         oA5LIMjNm0Jpat1DUiLsFg/bjQZQrPd0ddW9KQDbxc5bRDE3rfyCEf0n/2JX3yMhaZnf
         7yQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741696624; x=1742301424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOohSrQvPqKoJS058lh6ERBfYfFVZu79WxTYWxna9iQ=;
        b=gDMtkn6L9bnooX+NQ65jVIv75cIbzrEZVe2jxC9SNfjPuj0L4kA/PdvD6nfwlNngbI
         lviUwQWcALoV01icXnDz0t5pqN3TxUo0H37jaw3QIxnF7nkO6GUdnT0waG+leMHRTQxI
         Sg+1oMY6+99TwYAqkIZcQpLX03lWaPHDJ5i5Ugke1GmVfK12XdWpmToZaC+Sh/9HO1hW
         qgC7oLyhB/8aNDmfso/GoLrTvi8yT1XeKZdh/jmWC/3wViayszPEvW0LPjuqyAGG5+F7
         w7R3VUAaqFe/cjg/Ro2fbONWoCj2CYOf9NADoDJMVBnARs7WZba2kxm3JIO375L27xXO
         nM8A==
X-Forwarded-Encrypted: i=1; AJvYcCX+FwbofiLlrhr7skplemjTXBBBH0R/0bh32N47Hteie983zlYIkbV9V+0JtqeJgMYWOVQdAOTLYTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbmst4/OMPf0YjNgmFrPAHtAitwq8j38SHBhYh0UW+DzrOo8Z
	boTg+9kbuKeVu9xZstM0/uHeAE8bFk7GFE+9GbZdg45gEiedPnHC1N6EH0cIormB8gDP/1+8JTN
	8BHA=
X-Gm-Gg: ASbGncuZlDGf4Sa3og+2h3d0SIKlMBhTKM/9cqZ9HkQECwji5eY+BI6mpdkXiNzh0yC
	5rrNGlLoUQTY+ZsIHyzr7PqlIA3TC7AUrqTbnnbgm+9I0OEMPK0ot2rpjiDdfCgn/bvBpZaUxfM
	6LPFEv7HyHjjfiZaA/g54jv/E2vdi09a5MUN4TtGPmx28TvPw8qBoOqfmgsvmZbI0K1tIirP28O
	EqR2G1HHOTEvrs59dEqKVqp8RmK43n611MqmmhYIySDgjDCOysJzpkekOnj3pB89fz1pjGWxFmc
	xzp1n1vFeXfq81xj5oWX+kUgyc9GCRVfSSpCtzCFHdiyZijS0vwFUh3pBA==
X-Google-Smtp-Source: AGHT+IHTfCuQAPhrYhY9GiB9gvVm9rN3p4h2znVxLV21KfH9P21dIalFWV0Oc3AwmyqXz7qhPMYuCg==
X-Received: by 2002:a05:6000:144d:b0:391:139f:61af with SMTP id ffacd0b85a97d-39132d8c768mr12227318f8f.32.1741696624554;
        Tue, 11 Mar 2025 05:37:04 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d04004240sm9742265e9.3.2025.03.11.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 05:37:04 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 09/11] cgroup: Add deprecation message to legacy freezer controller
Date: Tue, 11 Mar 2025 13:36:26 +0100
Message-ID: <20250311123640.530377-10-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311123640.530377-1-mkoutny@suse.com>
References: <20250311123640.530377-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As explained in the commit 76f969e8948d8 ("cgroup: cgroup v2 freezer"),
the original freezer is imperfect, some users may unwittingly rely on it
when there exists the alternative of v2. Print a message when it happens
and explain that in the docs.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 Documentation/admin-guide/cgroup-v1/freezer-subsystem.rst | 4 ++++
 kernel/cgroup/legacy_freezer.c                            | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v1/freezer-subsystem.rst b/Documentation/admin-guide/cgroup-v1/freezer-subsystem.rst
index 582d3427de3f8..a964aff373b19 100644
--- a/Documentation/admin-guide/cgroup-v1/freezer-subsystem.rst
+++ b/Documentation/admin-guide/cgroup-v1/freezer-subsystem.rst
@@ -125,3 +125,7 @@ to unfreeze all tasks in the container::
 
 This is the basic mechanism which should do the right thing for user space task
 in a simple scenario.
+
+This freezer implementation is affected by shortcomings (see commit
+76f969e8948d8 ("cgroup: cgroup v2 freezer")) and cgroup v2 freezer is
+recommended.
diff --git a/kernel/cgroup/legacy_freezer.c b/kernel/cgroup/legacy_freezer.c
index 074653f964c1d..039d1eb2f215b 100644
--- a/kernel/cgroup/legacy_freezer.c
+++ b/kernel/cgroup/legacy_freezer.c
@@ -430,9 +430,11 @@ static ssize_t freezer_write(struct kernfs_open_file *of,
 
 	if (strcmp(buf, freezer_state_strs(0)) == 0)
 		freeze = false;
-	else if (strcmp(buf, freezer_state_strs(CGROUP_FROZEN)) == 0)
+	else if (strcmp(buf, freezer_state_strs(CGROUP_FROZEN)) == 0) {
+		pr_info_once("Freezing with imperfect legacy cgroup freezer. "
+			     "See cgroup.freeze of cgroup v2\n");
 		freeze = true;
-	else
+	} else
 		return -EINVAL;
 
 	freezer_change_state(css_freezer(of_css(of)), freeze);
-- 
2.48.1

