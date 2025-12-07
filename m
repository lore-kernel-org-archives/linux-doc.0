Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711122D7DF2
	for <linux-doc@vger.kernel.org>; Sun,  7 Dec 2025 06:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765088090; cv=none; b=BRQknV33Ejq0RbIPFPIADinnnMdZ7JL/+dEk627W7T9n+yjADlDLfw6uvRqGLMKa9UJVpgSB8MWCL4Sid8B/0z2njN0gQ8bgRAa7LIVy6KhH5yU7q1KXAQU4iyswwmn+eGPkFJmmaiXLxerFaNRsc7G+e/c/r9FEftGtMr4Qyfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765088090; c=relaxed/simple;
	bh=5c4Pym+UbhBrUpgvSqALQJMmmSoOtGcABYkK5yf1Yf0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ffZBgPw7GK5so1TYdKkjgXVw1QZ89d4tS2Z9o62qHVz2xLtUIfpEKyBhH0mSaNX00U9U/1OQzE2yhMpYz/rT2dn+cLDiQ+OorNt3PwHUWgPhiQDIvKB+NPSWHxhGm9rlco8lpCmmjFIcbRv6IKkQ7HMrWujE7irvKMYyilMWgW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clZRNGdV; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clZRNGdV"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45090ef26c6so962325b6e.2
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 22:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765088087; x=1765692887; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zk/N52GKc6Wm0+4KTuRfW4uDJ2hlyzOHAr/pCYy8qAE=;
        b=clZRNGdV3tVVMSH7UUfWJ3669S5WywrHu4BgQHb6TwTyaLQv8uS5zg2azr+WQAVxn3
         agI7PGCrnkG8ufNQ9gG8NeAUuZwcX3HoCF48YRU1QigvIsTee0Qudcgac/IhmMiQOfGs
         t6nOYDwybTrYIb5mYkrYzXYBk6zw0H611eWegpfAzOG/kZz2AGcQ1R9LB6URTCx9bOAx
         Abi1mvU4DH02WY7S8WSxB5Bc990T7bekAQ6DYzz9eNR8RUV57iQgnMLJqWjsK+3LQH9R
         +I1JCZqZHZC415XyBawyO/WymEUJhbMWPqs1eyFCEta7ynUUqvHiqJZjGzaQcP2h1xCM
         i53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765088087; x=1765692887;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zk/N52GKc6Wm0+4KTuRfW4uDJ2hlyzOHAr/pCYy8qAE=;
        b=QJBywf4TaTj9haaIRCpmqUmSCTGMV/Js8J9hCPLGH6GQIJWSlLgxsM7DysNQztsXyS
         81En8mqpDooKnoyYCP0a31otEH8qupnMpKCdcU2yQUxIDsgcFb2hTDhMIU0z0RlMaEBw
         g/7aOJYW2QnuIw/c7D/dEaIoybw2TjlF40iFna1dXicOFs0I4Wh3RWcVESQVapoTAGjq
         gC6BA/ZnGVZzqVObq77E83MqAG7BNz7LdAIBMLDBbFr25/LWuyLP39Sbn09lhoHKurMN
         5SRgMT09AXpHJeib3d+Pe8JldkS4I6QmPYX5aNiQ7YhJAPBOB12sxf50+7+a270pi/sa
         3G8w==
X-Gm-Message-State: AOJu0Yxfd1fE0RlEtVBObz0WdcyMyTULXkyU+T5R8BP2Bi3h38BZB94o
	GtaOM8rYIKOWL4HJ7woxZ2t2zAZQMzrRPyWv4POE/EJaK8q63ZOpkg6x9zpHwhcv/NDixKKshRV
	qp8SaIjWxJsKI9/mLhfSpwc4rNOqDw3YIUXz5
X-Gm-Gg: ASbGncsFCSpMy/bAW/mqI+gzOE+nhh4Ggjz5IZYTaQQGJTrTmEmUZ8a9l3k5aQewjih
	RyaGj6qvPlen+1hyBbgpo5psrDPfvbf1+R/cG9vm2+AGRQGIK6JrLQbiat7IPxLc+s1iTuoaK3E
	YmWqNCMq13Fn+uZpLhGQ8n/x8Jx7t6NWMkXWQI6LQPJCljb5UeZij6R9oOn/AJ8MFZK8j+LsGcp
	/cbbnJNdScMLidQT8qdaUdsecyFXvVnptPvwcefwYiNWKy8cW/Pf9r2plqmaux0gkxj7SBo
X-Google-Smtp-Source: AGHT+IGFCxsNYfCj89N39yowMiP9hZaghs7RyctXnuZCFEX/MaqLUQYHrigMRNIY1gw1OYVYoahreYvWGc6tUcJ6Wpk=
X-Received: by 2002:a05:6808:124a:b0:450:7fc9:3709 with SMTP id
 5614622812f47-4539e0bba96mr1544473b6e.48.1765088087293; Sat, 06 Dec 2025
 22:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?4bSL4bSAyoDhtJvJquG0iyBzypzhtIDKnA==?= <kartikpro9599@gmail.com>
Date: Sun, 7 Dec 2025 11:44:48 +0530
X-Gm-Features: AQt7F2rfoom-6ufMfB2_X1CFMl_aAyTFbgMEV0xs1Yr9eIbT3eS-b1H_2ZapExk
Message-ID: <CAOCmVvBR_7KnXwShGmjp-hpxVd18tbLJHY-+pWqjWz_qO9=qjA@mail.gmail.com>
Subject: [PATCH] docs: improve introduction wording in howto.rst
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 48d7e03ca7278705283d95b7da75739b97996a66 Mon Sep 17 00:00:00 2001
From: kartikpro9599-hash <kartikpro9599@gmail.com>
Date: Sun, 7 Dec 2025 11:35:19 +0530
Subject: [PATCH] docs: improve introduction wording in howto.rst

Signed-off-by: kartikpro9599-hash <kartikpro9599@gmail.com>
---
 Documentation/process/howto.rst | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6..7c7fc331c 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -2,16 +2,8 @@

 HOWTO do Linux kernel development
 =================================
-
-This is the be-all, end-all document on this topic.  It contains
-instructions on how to become a Linux kernel developer and how to learn
-to work with the Linux kernel development community.  It tries to not
-contain anything related to the technical aspects of kernel programming,
-but will help point you in the right direction for that.
-
-If anything in this document becomes out of date, please send in patches
-to the maintainer of this file, who is listed at the bottom of the
-document.
+This is a complete introductory document on this topic. It contains
instructions on how to become a Linux kernel developer and how to work
with the Linux kernel development community. It does not cover the
technical aspects of kernel programming, but will help point you in
the right direction for that.
+If anything in this document becomes out of date, please send in
patches to the maintainer of this file, who is listed at the bottom of
the document.


 Introduction
-- 
2.52.0.windows.1
