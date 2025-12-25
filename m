Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9312F5A0D
	for <linux-doc@vger.kernel.org>; Thu, 25 Dec 2025 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766669990; cv=none; b=Z9CSPrcVCZLJbEdvPwl4FzXQkHblwFBLRtnLd3QLRXGDME+rPWzR8vgTkitOgebV0pEwdi24DsKELGWtods3AXCYm2VBosmbRvdpap1QF9pTx7iCMbWSCmkYxROFK2JyDo0c+sEm9WJPrDD2WG2RDpnNJqkovqqwneGddAy44RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766669990; c=relaxed/simple;
	bh=d85C5cknobRyzGSgzTlisDvUpd5eL8+MCyi3MEUOKQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fS7KMhpPE9cvzo/EsHdk5c8AlnO5/FAZ3labIDRf6LjMBO+tSkt4iOA/k5lyZgOgda3Uo9hDuNHpP1F3QWeTOttb2n4tVPCCaR+NnAvFukj2uZf6kfC0jyyrWooVgetl27Lvx/bZS3LdIjS2yw1oSdwvclgs/oAjWOoxhAnOrT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wraedbrh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wraedbrh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so36219065e9.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Dec 2025 05:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766669986; x=1767274786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=01uYXIzfFFAtbx7w33TsFcfcEkJ5v8LSjweshx+qWkY=;
        b=Wraedbrh6R1+APdjEfCtUGPPZbbkRdD4CWr3NBZN7SxEMlzrK/zl+75oE7q6RQiQT9
         uIwsoWNJUxtFORXtva4q4KNcXi1+fFKMZuAH+HFftQohjdibdNQjhCRoeCy5IJn8Whvp
         IIvj/Y8RRdg5aSKFhjtj+XX61kP7ELDMfTwh47X8ND8JSVcRMr1i1+GvGKR50E0edvoT
         O/fmZB3yzMfI15aimwXc3PhUllp8I6U8Lech6PrBSGxf0NlCtxp1i9M3FXSAj0Mm4Ld1
         Y4DcIQyYzeh6bHG3KkdqB4TQSkzXFWsfgjD9C8WE91xPWKm/cUm9f0vzgzHTvGwx5O03
         2L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766669986; x=1767274786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01uYXIzfFFAtbx7w33TsFcfcEkJ5v8LSjweshx+qWkY=;
        b=XwjBjKtQcAk9ywS07V3NRiErZ7WoyAREWB2hLBfWZpCXVYOsOCALczOUuKM1sS0oP6
         qCnC3QPrGzVtGlYCI3Vas79cZ1p7eXdsKvy+g3eihrBOzsU5rzxBST3ThI4jV6MuhNHq
         eRfTJFGXZgIHq8N3Xi00uAugBAEnoWer790ecAq4Ki+PNoSV36f5OPABWQaZ1P+BT3Ge
         toZn0RpEd+Pd6KU4+OtXSrRsgQZZmHlgDLV+9jDQMzqj6CUoilZAFeHqGC0/mxz+DZ1E
         MFHend3aDsKnKts7k/qFJbDSfqk0V+gxDGB2B/dDSEIqZOXhGRKOUPOo+K/fLmFuaUTI
         Mugg==
X-Forwarded-Encrypted: i=1; AJvYcCWl82wj55dsmcStVeQlzBZJOOpCxxtTY4Af+pb8DWEdfrKGG1K7FmjccXZv7qEkXuPRL71jFrLhP+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/gKmgKC/Bxa/zRyXm9lJvmMbVsOOTAjrWj7mk4dQla0mUPy3z
	uvi3K3OBzAG3180JL9aWlH+tVwia4SDn0LYywGfVEXavszBv8jqlqrWJ
X-Gm-Gg: AY/fxX5r6WW5nP2c1Dktja6/mHugE+kuBbCguF1Mb+pyRo3YirhN5+4v1PKNc40YGnG
	MdrzxTOPmaIF90B6QFbnOoiQh4cUVmeL/Esl+Ie/nc150fH2NBOPlgZ5DKViLzWC8vKpQ+lrcbn
	pBtsw5qkXP9eGyMx8wS9z2lYoylg5D6/0A1lyJ3fW+mQ+imfZRgfDmIHS1YpX8KtQ893DqJwc3B
	jws5bOQvGnjH9AhEWDuRJuhAiSRwFgslXFXMf12zS6WnkEg6/V4W+oJSfBY/7b93/i0G9eXAEmM
	OB4vsDr9xvK4KzZ2lVqdzcZmkDbmRypXeYzeXoneNw2rvZ97/SnA0vDIXIRprC0Idyh+ILvuZoZ
	USBJvxXpRfMQBLsqB3j55scjrtKRkMQU/LJkyHH7gsDoEU6z/zFszmi7InkRo9Fz6doOPmaEA6R
	VKcaQddwFgL0rQ2CKXtg==
X-Google-Smtp-Source: AGHT+IHRT4EWptokBZifdGd0JaqURwIpCrPKAlfvk3XFDWS62gm4RQ8NvOP026ZhA40ZYuJhxJESuA==
X-Received: by 2002:a05:600c:8b06:b0:477:a977:b8c5 with SMTP id 5b1f17b1804b1-47d34de6358mr115489665e9.31.1766669986332;
        Thu, 25 Dec 2025 05:39:46 -0800 (PST)
Received: from future ([2a01:4b00:bd00:c100:5e02:757e:4745:96d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d192e88f5sm338859075e9.0.2025.12.25.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 05:39:45 -0800 (PST)
From: Volodymyr Kot <volodymyr.kot.ua@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Volodymyr Kot <volodymyr.kot.ua@gmail.com>
Subject: [PATCH] Doc: correct spelling and wording mistakes
Date: Thu, 25 Dec 2025 13:39:11 +0000
Message-ID: <20251225133911.87512-1-volodymyr.kot.ua@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed capitalization and punctuation in process documentation.

Signed-off-by: Volodymyr Kot <volodymyr.kot.ua@gmail.com>
---
 Documentation/process/1.Intro.rst          | 2 +-
 Documentation/process/2.Process.rst        | 2 +-
 Documentation/process/4.Coding.rst         | 6 +++---
 Documentation/process/7.AdvancedTopics.rst | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/1.Intro.rst b/Documentation/process/1.Intro.rst
index 25ca49f7ae4d..2c93caea069f 100644
--- a/Documentation/process/1.Intro.rst
+++ b/Documentation/process/1.Intro.rst
@@ -194,7 +194,7 @@ include:
   are cloudy at best; quite a few kernel copyright holders believe that
   most binary-only modules are derived products of the kernel and that, as
   a result, their distribution is a violation of the GNU General Public
-  license (about which more will be said below).  Your author is not a
+  License (about which more will be said below).  Your author is not a
   lawyer, and nothing in this document can possibly be considered to be
   legal advice.  The true legal status of closed-source modules can only be
   determined by the courts.  But the uncertainty which haunts those modules
diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index 7bd41838a546..57fa8cac58a6 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -3,7 +3,7 @@
 How the development process works
 =================================
 
-Linux kernel development in the early 1990's was a pretty loose affair,
+Linux kernel development in the early 1990s was a pretty loose affair,
 with relatively small numbers of users and developers involved.  With a
 user base in the millions and with some 2,000 developers involved over the
 course of one year, the kernel has since had to evolve a number of
diff --git a/Documentation/process/4.Coding.rst b/Documentation/process/4.Coding.rst
index 80bcc1cabc23..c0f57d0c4f73 100644
--- a/Documentation/process/4.Coding.rst
+++ b/Documentation/process/4.Coding.rst
@@ -160,12 +160,12 @@ irrelevant.
 Locking
 *******
 
-In May, 2006, the "Devicescape" networking stack was, with great
+In May 2006, the "Devicescape" networking stack was, with great
 fanfare, released under the GPL and made available for inclusion in the
 mainline kernel.  This donation was welcome news; support for wireless
 networking in Linux was considered substandard at best, and the Devicescape
 stack offered the promise of fixing that situation.  Yet, this code did not
-actually make it into the mainline until June, 2007 (2.6.22).  What
+actually make it into the mainline until June 2007 (2.6.22).  What
 happened?
 
 This code showed a number of signs of having been developed behind
@@ -204,7 +204,7 @@ regression in the first place.
 It is often argued that a regression can be justified if it causes things
 to work for more people than it creates problems for.  Why not make a
 change if it brings new functionality to ten systems for each one it
-breaks?  The best answer to this question was expressed by Linus in July,
+breaks?  The best answer to this question was expressed by Linus in July
 2007:
 
 ::
diff --git a/Documentation/process/7.AdvancedTopics.rst b/Documentation/process/7.AdvancedTopics.rst
index 43291704338e..185651d87f2a 100644
--- a/Documentation/process/7.AdvancedTopics.rst
+++ b/Documentation/process/7.AdvancedTopics.rst
@@ -53,7 +53,7 @@ When you are ready to start putting up git trees for others to look at, you
 will, of course, need a server that can be pulled from.  Setting up such a
 server with git-daemon is relatively straightforward if you have a system
 which is accessible to the Internet.  Otherwise, free, public hosting sites
-(Github, for example) are starting to appear on the net.  Established
+(GitHub, for example) are starting to appear on the net.  Established
 developers can get an account on kernel.org, but those are not easy to come
 by; see https://kernel.org/faq/ for more information.
 
-- 
2.51.2

