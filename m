Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D3479FE
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 03:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754884048; cv=none; b=KWIC96J9alZ5Zd86x/fbH5io519EycYE8r5AZozW8LtoRaUDA6qz/klGYzEgL81ZsHrm47melZPTlyu2f2nfqXzd4Khagc9J+mxjKe3OVareAKgPiuRp5JHA57F7nmy1ddACdaqPz5Kr8LL4H+ItXvQpJy1dceZKb5wCHny9RFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754884048; c=relaxed/simple;
	bh=rs1ZbDTkdXoK18Jlldz/kRW9hBLLB4AUFEUqTZReA0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLS5h+ixKwSHU5QQBaQ77aRcI5VMSZE9YqhdqTcRSspyXeCbyYMuppCDzjyKwCp//XXNOzuT/4OlJ2AAXhjTQPy0yUjpArlB63UUrgxuN3p9MpaK5Op8kneBp9QrvmL8TbbqV0ydcTHlOMmm4wQ8IYlrJ7kJKEwBWVaSGQgFJts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSCS387E; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSCS387E"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76bc5e68e26so3563177b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 10 Aug 2025 20:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754884046; x=1755488846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzgJOorJWfoxagIgZyAmkW/+CgCib8gpyjSc17Nah8o=;
        b=gSCS387EVTeHfcC12IYdtc/WneWgA3lQlP4LYqNhqm/jKcdqNNKZcRKt7SmHrq0/o0
         Tgzi4FmoMi4MfokUdDjFAAgoXkd/AAA5wzqk5XSZJfHy8qV0Wkfs1ZGWRB/zk/69+bAi
         tiEEBvKXXqSxbRLeXmn8ibbzHQH35Joih+cV4muYT1zaxALXR9nWN9hwlPM+dHjaHhpS
         PrjlOEZ1Nv0C6xbfHaoEzXwK0RgE/W3nRLsYMLHzdbw0u0TBtU9C2f67fxYUecWjEpDa
         m6jVlEOfTqyuK/h+yEn4GmabLRFybIl0CG8C8a8JtqQhGwZAXC+MCTRx549Q5UdF/vQU
         fb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754884046; x=1755488846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzgJOorJWfoxagIgZyAmkW/+CgCib8gpyjSc17Nah8o=;
        b=EjjnQXPhlRoCbgLVGR+lxR1b3iie9WXB1HZVWfAbzXLbp4EZ8MU/mvu+hETc9be0zB
         e483UbZZJoYtbi5982VjJUFfpJ2YNRImf8MoULkYTEwC589c5st4+ZAR9j+gB3GAMgyL
         uVWP7oyXeP4mB4SnTsfHCmNGEtMYpmXyu0ScGvhntIkAdp+DJ9vIMh/UNCrfeYMaQfwe
         nca18bcDDIQxYr5+9iBCz4U4VzPBsWXtRAo+tF/J964jTc78TON5AtbmQrO8ZiBtQSr7
         jzsqItFWj9IBtsBhIBxG7ACJQiI4Zb/uvaoP7JJVWzXzxFuY6z3hPN63BbpjqNAUIlzW
         ubQw==
X-Forwarded-Encrypted: i=1; AJvYcCW66XWaTLi7oCkXk2wMH2lmA5TRtWsqhmUzTxk1/B6mBoDr4WCWTCL0DrEudYfSmUJQ6m/6BRVO+jI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6xrHsemIgxWU+wr333JoSqdtq9D9PKDgFW6rGv9bDUz6v6UXk
	Tc2s8xX5O9s/Yh80644CfJvkaIn44wS1cauAz19yf8CfTEM4oD5c4rY=
X-Gm-Gg: ASbGncsHIUeaqtGyBoydBOC8WQQ8KYdv/URNWL8MXXWKZwrB4P+qifwPWxDrnGmOnoH
	4Cs8v2JY77589MKl483L+tpVPa0py2FSO2Rrdb92WPkDUl/DFSueCDEXFvZ8dkG8YHYu81W1dF7
	pB4vyWc4XNDnDZzWpYomnWbr+wg9pnwKjBAPUAcyb9uBzF4y3tJIswZsTlCYcB9/+IlOL5aiwc1
	ZH5ygO/Lly+j1sNoMwrWqALcN9zI3Xf0nN+YIJ/VPkX6rWmpAUXN6J/4OaJoq37Dl6XqsnUw/Oj
	lwRKPGGvfrdimb1uTxtxNR3rmSkpGvxSLT5du155T+T+FvZF1DnUbxt09Q1UEUP47ML9WMEXBPS
	l+QvDns9FX0c99lowxrcDLSTw4WNA9w9cVFok5dc=
X-Google-Smtp-Source: AGHT+IF4oM7SLruPY53gPR20B/yTto/vDJwxwk8SIxnGPvVl634pVWYjl4GCMAz4KqHHBfdvnZx9ng==
X-Received: by 2002:a05:6a21:32a0:b0:240:1a3a:d7ec with SMTP id adf61e73a8af0-2405501258fmr18221624637.4.1754884046009;
        Sun, 10 Aug 2025 20:47:26 -0700 (PDT)
Received: from kerneldocs.. ([117.231.194.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bdf61d092sm22706164b3a.116.2025.08.10.20.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 20:47:25 -0700 (PDT)
From: Nikil <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Nikil <snikilpaul@gmail.com>
Subject: [PATCH] docs: timers: Update dead OLS link in timekeeping docs
Date: Mon, 11 Aug 2025 03:47:17 +0000
Message-ID: <20250811034717.6100-1-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 Documentation/timers/highres.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/timers/highres.rst b/Documentation/timers/highres.rst
index bde5eb7e5c9e..24dcc32f8dcc 100644
--- a/Documentation/timers/highres.rst
+++ b/Documentation/timers/highres.rst
@@ -58,7 +58,7 @@ merged into the 2.6.18 kernel.
 Further information about the Generic Time Of Day framework is available in the
 OLS 2005 Proceedings Volume 1:
 
-	http://www.linuxsymposium.org/2005/linuxsymposium_procv1.pdf
+	https://www.kernel.org/doc/ols/2005/ols2005v1-pages-227-240.pdf
 
 The paper "We Are Not Getting Any Younger: A New Approach to Time and
 Timers" was written by J. Stultz, D.V. Hart, & N. Aravamudan.
-- 
2.43.0

