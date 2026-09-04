Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7636476CC7
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521588; cv=none; b=LzfITu53y2oyBVa+4XefKbrr4esP7Vhz/E2zDydqMNskLG6+BP1mpfMXd4Xapll8hRsaHL7Xm04nlA53TYlxDrGiUd2qkpC/wRm2MDUEjEMmMX+E4Ed8US1+YrweK89CjFzxgaQ/jO8SJG2MRK8hWH1Oj3oYEygKuDlOFxhU6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521588; c=relaxed/simple;
	bh=UwgLMIrmDPHPdVOs4f2CMMUTct58tVKlcy6cqzCatsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mltjja9cd1z/9+heLkwPQeZTOsYWGR2DpYeijwcxftiVIkStTv82VcVDZRiXTkzUsWjJu58N5CMGMsHbh04jXlipreEeAvYIl4qS9RVX3IkE9nIUdAS5f/F2j6xDtu94F0xcnBJTxs4UqsD0T4MJfRtGjLLzLyjLZRGepwEsKS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qm3SQAIo; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qm3SQAIo"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b1bf68b387so392751b6e.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521585; x=1789126385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euVKfdJ7nhmJ+/QxZ/Ovr4SAaOtQvGgHZZQ0sz9pYzY=;
        b=Qm3SQAIoVzmyXvBomgy8GeJL/yMPwD+r+POgVCp0i/Y0e0n7LgegJx8ZJlEmQGUA18
         2dNBB65C+L79WrbCmWAopMRpvM1QMFJ3lr8pqi6TMPk97gg3HD4nM5duddd/XamJmVh+
         XdNr2D1xlEwrYcTN4qnU53gLsGWRFIS4msbYTR3NbJKCHrMpllpVlIskTCHmHpkMu376
         AyEJ4n7ugT49wjFDiZ3bFkniwtplt6xtG0D75t2E3CHkr/MPbrCiyippmoTNyr8Kcxk9
         EGfyBFNjrcF0C5cdiPpwM65BkO54AWvYBpvYQDgwsYGI3Bk8OdbSs1kOPEBxmVzqUHsr
         e3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521585; x=1789126385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euVKfdJ7nhmJ+/QxZ/Ovr4SAaOtQvGgHZZQ0sz9pYzY=;
        b=hXN8tdmozdbnHWtkTrIhP0epn90c4MC0R4P8bGp0x+/qxXwEQKBFW1GmuxDOiTym06
         Url9gd1wP+CmLjzgKaoUTusjHVVN7aFBvY4t+WhDXJw2SjNvPgA325IXVeQ6omr9LoC+
         YMX8D50h5sz9LCbjCn4/aLSnc20ZMAiPHQ7Gw6alud6esLV1i5AQRrbWTAJkQ2r/BnsC
         ZBAdo3TQpjQqRkO9FvZZv8KIbc0uDJBF/+SpzqG6qAcPD3LwNDIjRPhksHRNfky2pj1P
         tFZWQp0Gp3Rs9HmJZQrj3PJPzr9kWbyEatLujUKXP6CRvAdWdz1t53EKX2SDHmmVkq5r
         wASw==
X-Forwarded-Encrypted: i=1; AKwUvBx83tX9ExX43X1cPAgtGr+7T39+5i6cRUXqhfGkUQ3H47EBWpg6tZEog9fULKSptfw7RxuHLv2oGXY=@vger.kernel.org
X-Gm-Message-State: AFuF++nHq646bNxLrNnd+pdDwh7M15TOCwgNk5J66IhkEmxYR0vFyt+8
	QeNTHyBlhohESzoc1eKDsj4YeMPth+lMkdf/o6cE+ljYF/PzKCVrVuZ9
X-Gm-Gg: AYBFou1DPHTnLux+Mj7p1/XdQnAltcQcaE1lo3WSy5vUbD/iIkXW7Es1thnTAR3pMmE
	53N+9bBY3F+KpdMa3cLFE5OIIjDWC0I5jyI+tD6W+53ylwssFpPQiMpvVeTOL8hosouK+WNjbTx
	4g+XvMrDC6Yjex4bVLFkU8xSra6Jah88GqNNIc94aLgVbcLFXVmXRYv7lnqycvuUG0AoJxP/Rec
	eRL1tM3hMQbMJ7Jdn3kogzQkNJk/Dtt/geClMTGOjvSc1Q9WzQrMBpvcuGHaFxFIblt7badZJgY
	jvygaw/2qH80h+yHR0EY2k30XDywAuJijXORmypYvg2rGiK5p5QiBUqsuq4fTBK5cc6FkVVWniB
	PYroCwPdDhe5fmNui1V4oTtGwCcpJ1AdyPh2z4Vp51JNLR9W9jKYswKP8+f0JtNGTZYnYehkH86
	epBQ+et5esugJAOCSGsdx73GtnWHJHyexK+U07xtuCWQkOg4BgB45v+gQv5T1i5ce1ZWw0Aa+tT
	P+SFJ/ctWvViAXQy3L5/AIDuA==
X-Received: by 2002:a05:6820:1996:b0:6b4:96b:3e12 with SMTP id 006d021491bc7-6b6fd7d704bmr4206715eaf.23.1788521585217;
        Fri, 04 Sep 2026 04:33:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6469759eec.8.2026.09.04.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:33:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] Documentation/core-api: fix typo "maintainance" in comment
Date: Fri,  4 Sep 2026 17:02:55 +0530
Message-ID: <20260904113257.13594-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113257.13594-1-hemanth.selam@gmail.com>
References: <20260904113257.13594-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "maintainance" to "maintenance", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/core-api/housekeeping.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
index ccb0a88b9cb3..71ba5d86f249 100644
--- a/Documentation/core-api/housekeeping.rst
+++ b/Documentation/core-api/housekeeping.rst
@@ -9,7 +9,7 @@ extreme workloads can't stand, such as in some DPDK usecases.
 
 The kernel work moved away by CPU isolation is commonly described as
 "housekeeping" because it includes ground work that performs cleanups,
-statistics maintainance and actions relying on them, memory release,
+statistics maintenance and actions relying on them, memory release,
 various deferrals etc...
 
 Sometimes housekeeping is just some unbound work (unbound workqueues,
-- 
2.48.1

