Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702222C326D
	for <linux-doc@vger.kernel.org>; Sun,  7 Dec 2025 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765100276; cv=none; b=ZuQGAo+UJ7iDav0gl8vedmAybj74MFnxJbI4D62aSI7XKLpixHCd7FZvlAOgjSwx/mOmaYUpLf/Yz84bRfGXfe9rTcSIRuDvzU8B14L+Wf4QzISnr3l4x+IWSovFvnDluqf0KD21Y9eMVoXpNz4QPCecWavJmgcufMD23Uexsn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765100276; c=relaxed/simple;
	bh=diQdspPHPjLNWj4mA10kaph4NKdxDBTovy57VWSMXmg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iph7TlmsaYtEWfDQfmu125QiRrjwPHVbHuVgWjJ3/Amz0RVnxYKZZGkMqUk8rg+8H9pIp5Xk+vTx19zdQoH6BeD22oQg7Vy9SmZjDw6Pf3i9h4ybmIdn732phobuB7yuLDOXNbaFYcHI1hpxW+ylmxMTwhNFRszVTzxNAvAn8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbbbBimR; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbbbBimR"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c750b10e14so1607454a34.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Dec 2025 01:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765100274; x=1765705074; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b8aOGIZ+buACuXLZBe3bB0dfiQfaQBMpsrTcyVxJIBs=;
        b=QbbbBimR1+0FRQPyfzAXYkYwSycX/y/Eqf+W/P7F29ZA4ty5pDddPq9P0g2XeFa+oP
         cSFiuWvww3x47pLFfcPjr7UxEmRAO86vMdUz9cuv98A2jottTDBQ1o5pBx9so6zi1y2i
         ZhL+lBgigTk2/ugW6sIoraBAiHA1R6pfUUl+D+/ZVEwvBMeaA23PdLguneiSDK4vl0WE
         hakD+u51nZNBc6MuGdO9SkXFS/xbHZlfccj8aJtrjwSWQmoYQGhkmKEZJGrmFJy99W9d
         /H7nUOuL/G4B/Nb/+zAn4Y+VN+H56RvUTUBAPxb2lx+akKsU+MHRdyMmIyqa0IBPnuW+
         GAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765100274; x=1765705074;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8aOGIZ+buACuXLZBe3bB0dfiQfaQBMpsrTcyVxJIBs=;
        b=DoOaglD4mhfwsSbRQwWhif9Xb+Nhgn0fBFYvDaJWyH5I1lTuVvnZq53Z99WM3GUjii
         NW4IhYTuqo1tvR6Hb1r+uXiF2Lxpl12j2y9L0g0xIvyXbasO/9IY4F/Hwah7/7b1G8VQ
         QYkfqv6i7Afq6cUFcsgTKqeXVb0a6j6LaSK7eqit2s4MV3kCZfZbgGvnb1k3ZvzKkWVu
         ujKqGNcwYpdMTLccOsuyXPPdY5zTsHUYgEGkejfo/ks8jynPhvQ4aUrCqUDw6rrk7ehg
         kXdisyzr23Kz7rMilNlQNqqmK3hifgY62NoqVYWDGFCKY405XyPf4xAStgFmZTj/bbWK
         IQ+A==
X-Gm-Message-State: AOJu0YwMr1S2xmfJ0HOjoxVkQxZJEuI9NODo+t/BZoAjSLtBm3TDVz/2
	7z/e32cV7yMYJ7dkcvOggh9b3EH22G+cK62YwnJY3/y9CJSVhvE8muJJhtTsnSrwQe8eVr3wbcJ
	Lo2i3bbEkLuMcQ+Wq8QuB7TvNk1f+YVGUIffU5MY=
X-Gm-Gg: ASbGncu6UQxjRD+6Y2EsfIdvE1xtnAShoIEdRiHKMpzsSgsmONl79uyI+cweDpQLqz3
	1dfgqYLfmgyu80M9EVnmuiRxrqc298dTH251oV6nMSj2h7dwL2G5W3SPbWqyRKjdbo+/MHS3XdY
	QqE8EuyPunhkgt/iUfxXd2qT/wSDOpbaWzRDUq5VxdMjU0objQzYsJDYtUPE5bBO85COjVEbWaj
	eNXHmB+cuVEIBFTWU9Cvgmu3jCcrOGZz16gxMihbnmRZ2WLGNHmP4MwLrjedolpIbhc/E+q
X-Google-Smtp-Source: AGHT+IFfSlh7Wvtq1NCJXTuOROOG3uM8MYsxytVE5xcLmfckOXMq+OhYZHFpgLcnQHVwJgJEsJNWW9pnrPEx/rknYWk=
X-Received: by 2002:a05:6808:1a28:b0:450:bf96:29d6 with SMTP id
 5614622812f47-4539df60e75mr1843760b6e.24.1765100274234; Sun, 07 Dec 2025
 01:37:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?4bSL4bSAyoDhtJvJquG0iyBzypzhtIDKnA==?= <kartikpro9599@gmail.com>
Date: Sun, 7 Dec 2025 15:07:43 +0530
X-Gm-Features: AQt7F2pdCexYsLrjfUwW83PBmbKvr98EvLRLAZU4IqOWDsTPhWh46V94d9Vub1Y
Message-ID: <CAOCmVvDcg9d0cNeGqH7+95Wffo4=WXUuSTR_Jbw_Swa3T8xOnQ@mail.gmail.com>
Subject: [PATCH v4] docs: improve introduction wording in howto.rst
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 56985c72f365c7f0e9ba8ae66ba99c198c15128c Mon Sep 17 00:00:00 2001
From: kartikpro9599-hash <kartikpro9599@gmail.com>
Date: Sun, 7 Dec 2025 13:53:02 +0530
Subject: [PATCH v4] docs: improve introduction wording in howto.rst

Signed-off-by: kartikpro9599-hash <kartikpro9599@gmail.com>
---
 Documentation/process/howto.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6..dd840115f 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -3,11 +3,11 @@
 HOWTO do Linux kernel development
 =================================

-This is the be-all, end-all document on this topic.  It contains
-instructions on how to become a Linux kernel developer and how to learn
-to work with the Linux kernel development community.  It tries to not
-contain anything related to the technical aspects of kernel programming,
-but will help point you in the right direction for that.
+This is a complete introductory document on this topic. It
+contains instructions on how to become a Linux kernel developer
+and how to work with the Linux kernel development community. It
+does not cover the technical aspects of kernel programming, but
+will help point you in the right direction for that.

 If anything in this document becomes out of date, please send in patches
 to the maintainer of this file, who is listed at the bottom of the
-- 
2.52.0.windows.1
