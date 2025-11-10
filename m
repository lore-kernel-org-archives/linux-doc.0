Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F984A1E
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 04:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762747220; cv=none; b=Cfh7Tg4I0t9hdtg4myDgruPt0VwZIC8GWPnhVFaHL9aBvYE9oI9Vu35PZGgHnf/9aR1/xpyKMIUWu5FtqeCh7+6xr1KGr7Jip+z+2Q0+1CXywGc3MNS4Rnf4XUKhUs5SrYxkpO/7AJ5nmZ8KPrnfGNzTdIdzqVLuVg6MxbeYZeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762747220; c=relaxed/simple;
	bh=MYUt4S+k12lqQeD8erIncNYSK/N6bNXBnqfxnjwY2Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQQ8tXZGdKLQk7zNbfrYETQ70a1BLwqYuNBlS0jExlZAD+TmhrMgxc+gLeeW2yra+t/EYvTzKqOom0MSYF1owMWrwoQ5WvnGgnKtiFSxRtcdiRIDzEbo5miZgBdRnAuNDjHYjJ05x0bKJ4e6zwZRGzB0abbkWVyNu8P4QvRSX0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpTXSRpx; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpTXSRpx"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-793021f348fso1684198b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 09 Nov 2025 20:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762747218; x=1763352018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARePJZFcum0I2UcsNc1I6X6ypbFo44099GunaYErXsE=;
        b=ZpTXSRpxQE+og2yEVM/jSdQGC8tk8Xt1GqIQfhusg+vv3CLYI1KlCO9gF4TRcETw+q
         xiPzlEPRWSDTr9C0w2K3akUZQ4Y1RkmfUzq7rxQlMd5R2Hes3PrZ+PKvVYXde+dnkI4Q
         IH2uoEGaXJuI/HbzkBcxriGAOzUcQ8jnhSbz4VY5rBoA2hm3/dFjaESEZvR4enNVJ8+K
         pOLNG7jyr0FBBa/JH4N4GRimWrLEBv2OqHx6aKD15EL9mHetnHHztOP8qxCQyr0zK3Um
         6avdFrtYc/kFuC24RXTWJcYwbgkoaZQgUNMz0DJAlcn9QU/yhWsVGjtP4gBoYvaKfMYL
         nqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762747218; x=1763352018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ARePJZFcum0I2UcsNc1I6X6ypbFo44099GunaYErXsE=;
        b=LRhRPyR3yqzEyAGyuWGJmrTUfvHn586+xXNvz7REDz0Eye2gatioMgCAgnRi4MvD3m
         0nl2NNTyxuxtASSfHT8rs3FP83YRYcErW6ejMveP71GhS6MBDQq2oowZ1zMpGhcoNQcp
         c21fpTFn5/1JMAUBmQmj0G5i3OEHFGt/gfq8BOwUVdVIzksZtywkpWVvN4Q8rxbAqOgJ
         c++isVjSNqT9KzErnw8P4QfzXfvDlNZGydUx8ezLH+OoHNgdYQnMXght8w8EmYkKoCMK
         5sCcVQto9sxmajpkM1zHm88mvIVPGtORnf83FNJnmNuZB+pK3d0ntQcYXybHUnGz60KR
         JaLA==
X-Forwarded-Encrypted: i=1; AJvYcCWWo2V93v/cE1Gu+O0U5mqHv6ZYpY96lFJ1Hj3ctI9q0wQqBE3aENsBtBTTUG5C0Kiduz6iQL3w95o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMnuWm/AswQU4yALLAs05XHLQYX1YA3BcDn5226YX2vrh+y6J
	eiko6KzCuOO89K0A7B/aJCxTn+yYps13r1J52AyldqeMGoAg/LL3TCew
X-Gm-Gg: ASbGncs0+VkeDHvEZnwFIE60ihVHOAAj1fsUSJO4zzMbL6+mdjEFBB7bGs7W5FBLnbN
	EznoowemMk7dH026/S8R+0Cf5yYOvHUfpLyH5KIvYjze3mUNyBXMaAAOFrbEreGfdItQVoNOb5Y
	WDBcuwSdG7euh0dkJnNL6Ba+SPD1i0KKqtg6umyFdYjrwEvPLKIGyu5dQwc3Bzj1JxYaRvF26Wq
	RE/huf+CeoOawiEBEcqU9h5SCrWkh0IjCCkSgchUogun+0aoLvP1jTHEQYddNM/ao0DGkV0Ni9h
	ofFl5Y3xBng6TxpGgnUo0hQ4lmQv7+rjNqpTk9UaoHo7DbxfepJAC4j5IWifE1tkWNpEeKs6ZJ5
	87TxF+iLWo0oEWYKiwsuWIXP56h7pJe24M/fTt1WMe0FGjwU6VUjpq6l0avDcbsdCeDgilUbt1z
	Dv
X-Google-Smtp-Source: AGHT+IG3yPz6YTXE7nA7vJNdAshD2gcVhiabblc07+gqriIOoO3eDQGJ9UaYyrZ7ijemvVvAFWSB9w==
X-Received: by 2002:a05:6a00:2d8b:b0:7ab:2fd6:5d42 with SMTP id d2e1a72fcca58-7b22668fd88mr8043382b3a.16.1762747217714;
        Sun, 09 Nov 2025 20:00:17 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09f22sm9978570b3a.20.2025.11.09.20.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 20:00:16 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 10B0B418F1BD; Mon, 10 Nov 2025 11:00:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
	Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 1/2] accel/qaic: Separate DBC_STATE_* definition list
Date: Mon, 10 Nov 2025 10:59:52 +0700
Message-ID: <20251110035952.25778-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110035952.25778-2-bagasdotme@gmail.com>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=bagasdotme@gmail.com; h=from:subject; bh=MYUt4S+k12lqQeD8erIncNYSK/N6bNXBnqfxnjwY2Q4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmCSVlPHn654866fXaGkX/vH67K4Gkd2k9zdJoDwoQT3 p+bFNTTUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIlY5TH8lbIT33DD/n601bro TaYzsh79fvNBrYTVsmn/lBXlDPcCFzD8Fb91IKb6vL9g211jWYVt1/omn5/3nn3rha8PrVLzzCc 3MQMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:

Documentation/accel/qaic/aic100.rst:502: ERROR: Unexpected indentation. [docutils]
Documentation/accel/qaic/aic100.rst:504: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]

Fix these by separating DBC_STATE_* definition list from preceding
paragraph.

Fixes: 9675093acea04c ("accel/qaic: Implement basic SSR handling")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/accel/qaic/aic100.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
index 3b287c3987d269..41331cf580b118 100644
--- a/Documentation/accel/qaic/aic100.rst
+++ b/Documentation/accel/qaic/aic100.rst
@@ -498,6 +498,7 @@ it desires to recover the workload.
 
 When SSR occurs for a specific NSP, the assigned DBC goes through the
 following state transactions in order:
+
 DBC_STATE_BEFORE_SHUTDOWN
 	Indicates that the affected NSP was found in an unrecoverable error
 	condition.
-- 
An old man doll... just what I always wanted! - Clara

