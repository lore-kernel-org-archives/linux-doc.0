Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77241DC74A
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733470719; cv=none; b=MHaGvkE1w+zdnFIQuBU6SNMXFu26C/BOYJ+qJr62ViDbtOde9LQSZE3z4AWS0tmgq93QBYhTdRD0q82hp+ocnNuwra+nObfVxttpcwFVceBDYsn2FPNFkRce+jQTYfAGAcicsdkups75yqbNDB++wt8PzWZfTtG+aBFNonQQg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733470719; c=relaxed/simple;
	bh=QNykjUmeytuOx0G75pMP0LzTrKz7WPi3BleJRHunwwY=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=oecbR7RN5820x5FPgsIreXnzUVJk3thm8WoSO3Ao4ALjTASt6lFWqzzYMyXhcdnkW78NCAlcvzVCEqaBfDimjmb5x6+sbXpnp3bPdimhWw78nmevT+qYRylv5AMyr1qOVp2EUF+hCJdv4+tLViD0BVTLo2DhAuck6n7MVkoxJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=htF7/7Td; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="htF7/7Td"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ef8e4c66ddso17307367b3.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 23:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733470716; x=1734075516; darn=vger.kernel.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=08qPRW9xswRt2OtHroBUTIZrJ7mnuAOFiexcUCiCKeI=;
        b=htF7/7TdmxoF7kK47yxDS3zyco6p2Ap2D3GvIJgHlwSJUXfG2ImQW0QmebYltrtN1G
         Eir3u+XkMsmuTAs2GfQRlMNBKXrt1kbQkL3GqGr1D3F75tBLJKc5p17nwOOmkR9pSQri
         DggKY936cwBSEvWN+psZF2w7n7TEwB5NCMVrUm/IER6RgYIhN6UqD/FbcxOVHCr2jtYz
         44MMzPG6NsnwaIYnT059P0gODf0DY8KDU95egd9GHXq/eBWKVjWGr4IDLRX8ctG9xHCU
         2fPKL2sY3s49CpjoTRPvPsgcf2pYgnVoVHBEWiPKFfeYbGjgLnTgKgX83Qx6DKIH1V4Y
         zXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733470716; x=1734075516;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08qPRW9xswRt2OtHroBUTIZrJ7mnuAOFiexcUCiCKeI=;
        b=p3iCIv9aXwxjesN4dUChJJOZe6fCGZ6BcAj6c1/+1gMJVjbCzHPiMnHAiQgSc5VMjJ
         VJvMSDMnbfhf253TUjhkP5filQs9BzWC5VAsBUinxjR7Stizk9MtK4LtDwGKbe9i1iGe
         aqUtHWfo/xeseueybGUnIZyVTDNt3PX4wN1ZjjfRcY7U7tMzgXnhD/X+AH/wrmx+uah5
         inPrKmNnmDZM/Jrf6ti8I9VUr0eJh4gQOvJShAL7j44Yl9whbKbDbumjvUQE6j8WFLCq
         8v97WxSLnC+3cGpOGQLNly6ROHNc2uTVquagzGfl6iBXQWz9rZeQFIQJsRPQ0jToTg7f
         OFvw==
X-Forwarded-Encrypted: i=1; AJvYcCVj1GkVIrQ0PgaDMxCpAEbMvad8Nb/fY2rhHcjB3grbNQHPpSRisX/SvidLAXsIdNgFCq1eAshITcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuiYkfH8hQFFkURHp6O8ycErjjEMZh7Y+NNKsCAooTIREOODj
	Ocb73uSrK0Vx4Si396ysIvaLty/BDT550OVrG+pbP3phh4pSgoTIUrAJXCRhamWgal721H6s9HZ
	PHFhnGw==
X-Google-Smtp-Source: AGHT+IEDRTiD4aFoP45cgyoosz12ZeHtxiOVt8IhT1Y6gGd2sajlkNmKprLDP9GTdgZBV9Sm7Qm7+AXk6YX4
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:bff4:a354:8911:79b3])
 (user=irogers job=sendgmr) by 2002:a25:fc1c:0:b0:e33:111b:c6a4 with SMTP id
 3f1490d57ef6-e3a0b073bbdmr902276.1.1733470716612; Thu, 05 Dec 2024 23:38:36
 -0800 (PST)
Date: Thu,  5 Dec 2024 23:38:27 -0800
In-Reply-To: <20241206073828.1119464-1-irogers@google.com>
Message-Id: <20241206073828.1119464-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241206073828.1119464-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Subject: [PATCH v5 3/4] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>, "G . Branden Robinson" <g.branden.robinson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Make the sections about eventfd, epoll, signalfd, inotify, fanotify,
timerfd better separated with a clearer subsection header.
---
 man/man5/proc_pid_fdinfo.5 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 2797ae216..c4914f1f3 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -57,6 +57,7 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
+.SS eventfd
 .P
 For eventfd file descriptors (see
 .BR eventfd (2)),
@@ -75,6 +76,7 @@ eventfd\-count:               40
 .P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
+.SS epoll
 .P
 For epoll file descriptors (see
 .BR epoll (7)),
@@ -108,6 +110,7 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
+.SS signalfd
 .P
 For signalfd file descriptors (see
 .BR signalfd (2)),
@@ -133,6 +136,7 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
+.SS inotify
 .P
 For inotify file descriptors (see
 .BR inotify (7)),
@@ -173,6 +177,7 @@ file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-type ,
 and
 .IR f_handle .
+.SS fanotify
 .P
 For fanotify file descriptors (see
 .BR fanotify (7)),
@@ -229,6 +234,7 @@ The mask of events that are ignored for this mark
 .P
 For details on these fields, see
 .BR fanotify_mark (2).
+.SS timerfd
 .P
 For timerfd file descriptors (see
 .BR timerfd (2)),
-- 
2.47.0.338.g60cca15819-goog

