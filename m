Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40263375AA7
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773594338; cv=none; b=iKgW3JfYJ0kx2hYb7p8BknmshhtB6KnlchEGD9KLzrpcRZRNl04OFKIrI9i+TjdC67HlupftVn8aAdSGENJfgWrUbCGifqbaJjnDAHkUOqhZmq6hqYMMbmscwAFQN8hSNgAc9J5mcXUGeDj629sijHpfRalYnex6ThX6hHbvQ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773594338; c=relaxed/simple;
	bh=lrtTPAi516hgTrXg7wPZY0Wtj7OUxn1boGLKpdkz5J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAqyVVCi4Fop/mCQcMxWK3kOzvqJghxBWTdAlqkVngn8kmhdhWDem7BbxZCyI05dTH+Qubk/Ko3b9FMGgIQ6FxyBiakjz2Y/5S5X/0Tp+enn1iDmfPhExizrRZy9ypawB8P3n2RGU6ztLTGZboNK/exrkOlb58ebYkuWBXu/EAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lu4uQKvX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu4uQKvX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b2965d4bso2611847f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773594336; x=1774199136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pazn65XzPfWs0CxG7DTwrB0Lp9Xs6JQpA928mpHNaLc=;
        b=lu4uQKvXfvpfpaO9KMjb5ZticT/1MTWnLGKG2xntdkTYeFe6fVSoqZb4nk7F6Ht3vH
         1stSUaScmpMTKyg4nH7E+RPGUJBBpM6qnetJyyt2XY+yuER4fdYH1miXDDC8MqHrUHWt
         AvPnAW50m/QEX8/RNwkiSl4MtPRiqSn+SozmgQb5EH8rruTYWzGKbjBv9ssR9E3N5iPB
         HxafYMo0dWSVwTLsDELQD5yA6FKv3cLuN8j24T6i5aGNZ7kz/wylqTIL55nf/Y8stWb2
         b2HuGvEuBCHlzxLJMaLBVxyhrv0VJFllIdOC18mcK0uJlBT22Z/uNo4g1LkU43bSQhyi
         mw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773594336; x=1774199136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pazn65XzPfWs0CxG7DTwrB0Lp9Xs6JQpA928mpHNaLc=;
        b=mwCZUfcYnWoRFsjGKDJd+4MFC28ZVztTBobOjTr5Mqk6YYxGJgMMc9f/Al8N/g0Txy
         BGwNLHMw/o7ZKMlV5ybgG068TSVjOZK4HkilMdzyRPM2Pw7PAhN42eXsfAHGljnsoMUk
         pFdfB33Q1Z4XrXreWHRKw+DxYxThwgRcJxoHyB/sHCFfjrLwfEhkCzZwMwM2AEs9NUKP
         9LTOrV1gVzXgU8BKA5EGxfF22btn/j+wIzZqOnTpaFkWCGu2UkIx3we0CRnwJxxcaycG
         pIz0XzcimzrAKZTLxXB5gl3XLZ1/Ft/qOY7V9X2WEwt168hWLVcaH6sx7a1l+U4TYyqQ
         xt7g==
X-Forwarded-Encrypted: i=1; AJvYcCVayb5t7jk2jndC7r5uAuTYMF9yujLi+hYiyM7kf8ukIu/dZFfGT1xVQeOQz+EZLL4JmuG1yJ4SX1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0aYvXjtPzyChTku62s1wnvn+bwVkYZRgh4GfnObOt19WR43tM
	MUYz1a/54dABmaT7KyK46z8LulBn055+DR6nNTmJdkQ+VyMt3C+4J1Br
X-Gm-Gg: ATEYQzwE2dhsdSIGk4AWM3y3V/S9NTuqA9IygCT4ESQBLuHE5NokvwrtDJ+uoBsKtPP
	4VL3NqIcTrNRKEfGGYmFU0Re+NVXxrm5ZA0vyzlODTjOFkbcJf4O2K5sYoPXxEtWaoeBn1Nu3PO
	UnN9SyLKocg7637OYcWu2VBK4RtFodoPahWozBEiSJjRlFHPPnPiaR4gGhyOU17iVExx83oW+B8
	fEs5jPDWnGHgwQ6OJARnH1WudM/kGBNuoPxZZMDXpOLLZbL9OXCT+XFwMeNO/b5XV75G2Cj3UfI
	4Qn+9nBAS2cqV35VOyUevGmILjT17uEqG37fNj7qRHl+ihaXrVPo7uDdb5ftH4mnOcLiu31dDow
	2GQF7q5O0BwopIr8BTFYDJuZNndBlwphHPslHPtDx71oZBwfRXSEToxpV7lZ2xDkb5G8EWbCJNg
	mEt0UwD+uCadzEqAmlneGzIu8KF52JbO8yUWjXwsZAkf2e243EvETkmClrdMnr+CjRyWHSTEfGZ
	fUwhYvsaPW55la+IKusWTTHU+wRxE6TCycpV3xp
X-Received: by 2002:a05:6000:b08:b0:43b:3cdc:9429 with SMTP id ffacd0b85a97d-43b3cdc9590mr4859719f8f.1.1773594335223;
        Sun, 15 Mar 2026 10:05:35 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a76e5sm34331721f8f.12.2026.03.15.10.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:05:34 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 3/3] docs: process: fix grammatical errors in 2.Process.rst
Date: Sun, 15 Mar 2026 18:05:21 +0100
Message-ID: <20260315170521.63794-4-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315170521.63794-1-xaum.io@gmail.com>
References: <20260315170521.63794-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix five minor grammatical issues:
- Add comma after introductory phrase "At that point"
- Add comma before conditional "if at all possible"
- Change "close to ready" to "close to being ready"
- Add article "a" before "more extensive review"
- Add article "the" before "volume can reach"

Link: https://bugzilla.kernel.org/show_bug.cgi?id=214931
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/process/2.Process.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index 57fa8cac58a6..81dddf0c6ace 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -63,7 +63,7 @@ As fixes make their way into the mainline, the patch rate will slow over
 time.  Linus releases new -rc kernels about once a week; a normal series
 will get up to somewhere between -rc6 and -rc9 before the kernel is
 considered to be sufficiently stable and the final release is made.
-At that point the whole process starts over again.
+At that point, the whole process starts over again.
 
 As an example, here is how the 5.4 development cycle went (all dates in
 2019):
@@ -156,7 +156,7 @@ The stages that a patch goes through are, generally:
  - Design.  This is where the real requirements for the patch - and the way
    those requirements will be met - are laid out.  Design work is often
    done without involving the community, but it is better to do this work
-   in the open if at all possible; it can save a lot of time redesigning
+   in the open, if at all possible; it can save a lot of time redesigning
    things later.
 
  - Early review.  Patches are posted to the relevant mailing list, and
@@ -164,12 +164,12 @@ The stages that a patch goes through are, generally:
    process should turn up any major problems with a patch if all goes
    well.
 
- - Wider review.  When the patch is getting close to ready for mainline
+ - Wider review.  When the patch is getting close to being ready for mainline
    inclusion, it should be accepted by a relevant subsystem maintainer -
    though this acceptance is not a guarantee that the patch will make it
    all the way to the mainline.  The patch will show up in the maintainer's
    subsystem tree and into the -next trees (described below).  When the
-   process works, this step leads to more extensive review of the patch and
+   process works, this step leads to a more extensive review of the patch and
    the discovery of any problems resulting from the integration of this
    patch with work being done by others.
 
@@ -398,7 +398,7 @@ There are lists hosted elsewhere; please check the MAINTAINERS file for
 the list relevant for any particular subsystem.
 
 The core mailing list for kernel development is, of course, linux-kernel.
-This list is an intimidating place to be; volume can reach 500 messages per
+This list is an intimidating place to be; the volume can reach 500 messages per
 day, the amount of noise is high, the conversation can be severely
 technical, and participants are not always concerned with showing a high
 degree of politeness.  But there is no other place where the kernel
-- 
2.53.0

