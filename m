Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F2745D5E4
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605196; cv=none; b=AqM1Otx6lF8UwMeKhIOvJ90H1fpMgFRzAS6lyfrfT0EL7xCsfRXzJPfoSdM6dR56ql11TMk/3THYCmX40/UQKFrFK1l9wn6cth3cYNfWx5qpfmu0rhasbkl5pCmL7dnCe0SG/PClg8zf/tzLuW2p315acDTOXXKUSN5bwGb1Uss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605196; c=relaxed/simple;
	bh=FgEGMIHyi34p6yz3OD6tTYDCoTrdvOj/pRpra1LVBOU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OpCifLWxCW2U8dnC61QstvycEiTY83fMXjNPVxdeNNv05Z/DH9c/9/fX/c4LF8jb2t6OWbkHTRYtQA2rMtU+NKjDzoOQvoI8E5t1g46K3EPgOkvia87iU3FxygA2mi+JwD1y0j5UTRBEmVutImDuttGkgQvrIeEr4Ghgo0QAP0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGgIhS8j; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGgIhS8j"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49954b88fffso13871315e9.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 03:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788605190; x=1789209990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEpc1uNoyEmkilcb6oip3iNpVvRjfV4LqWJo0sBYBR0=;
        b=qGgIhS8jLIkJ9yTY/1nVap7GRgb1j4yVxSFOkVpTOobK9vByQXaiYcNNk2z+i8dCIb
         BwFxznCqr0+JznKYPnalper+d6hp4Syhj0e8qiOKkSp9iN18epnAlaG5ogtU5gqxXIIi
         PEHCZB5djIh2WhrivCuwaMb9v6j/5Cup7bM5XmEdgp6xAsAtfORAvVVcxtEEtqjxbqSJ
         60uJQlKZ8TsKnWN+K+yDJrbT+jNKRKsQc57DZpLa3WQm8lPXvc1UWArLvMgPWjZDnVYo
         VbeQUQYHIOQNeQsqX1EOWMfSFYs41ozpyXAaxftd1WmlmjJFpYQCmM+2q03nQJfuM52v
         3Jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788605190; x=1789209990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEpc1uNoyEmkilcb6oip3iNpVvRjfV4LqWJo0sBYBR0=;
        b=W5A//mx8M/ziY5DVtGAOY0q461D/Pvry70+AurA5dIkOe1OX4405uod5kAxWweAj77
         QpMseMn1R8WoWCFkNDCeJdgQIJlYFaFD9O8rxu6459ZWMZtomm0lOrD1/YGSCQsYCJL7
         6yL/aSiVvi1Z2hxE/jti2aWD1b+r4KRYrMP41RQegXEknG7IFr/Ra7p60TgWUR4FSmtk
         Z30zn4c+Obj+uANrUV5Y1/LhWGE1QsjaCQGbd0z+uTONpefI4jwu0HRZwvq3128iho0G
         9YR8SqbzuUmGaCdKUBEQLIynF8kxnHi/4Kyhca5Pbfcfs0Ci91yIypi/LTjsKx/q8mvN
         Mbsw==
X-Forwarded-Encrypted: i=1; AKwUvBxh7pDoHbHDNOYTSnDQJId3FdOwzg3m1M+LnirbSbm5TPjnmbrvXEnBBwWNKZAVCBLO2lxfW3b+zDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nxWGNrWo5IAzGPnGukpgzTL4CSnwgbA4wjLMYJ1yi6p6BBdzxz
	8Esfp4UnthKqhU0Vq3qqOuzxdF1Y0KCsQLi4sPhZw+UUQWf+1OeNIENU
X-Gm-Gg: AYBFou0eDgMaW9By9a1+IkxTFMiEssNxAjpuCN3IvtUTCmc57vOx2JjCBsCpK4JqBYp
	JSOoIM5tWvq/hzq7bnCcTW26k6NXWdTq5KIpvg9LMmCQMWbXp8HVjwdtyJVEGrw7EfpjkVdg1mt
	T41yJYY0aeSSmoGf8tL1IydfJFdqEWFY3N64qB8KQ7cU54ZfzysHpsACV/23nJWvP7YcorMhjXA
	jLdz2M4h7hyieCR5YEG14Oa1vjoaYDaR/J/5mU1NYjsoPsiuwktLU0zoIaJ1EeAfcl+9Z4Ha8VF
	ILTEnq83CAJwvGq23y0FH4oGX5CAKFsQyyWgusOHdUILFF374UshBxrbV8uakw9m1j39UOKQK9h
	vsuPcod5ZDFclKUjfzymkm7EEnjP9Z+xBmQBKrNNKnJjWmMhNfzGMBWBzYjfBnSvIHGOx/z4/bS
	Nk+QhsS65mMFNY+f3cZI0dWs2kG9Lv/q0yCeEJC//rfCcXUc217Jilkd48rjpUWtFOCZa9CQP6Y
	Y/b/kpS4kWe4zz7ZpEwIxUWqTmJiJPC3GsJQ78lGHRkumHNVWmtTB2b8iO/fUXVRCE2CIvdyDk9
	MFR/z6+WVUQGFV3U4/Pv99mKCaaTeLqEyqKf3GYF+0bUjA7mZioNMaeb6LRJRGkL4tM=
X-Received: by 2002:a05:600c:a0b:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49cf8262133mr122050915e9.16.1788605189720;
        Sat, 05 Sep 2026 03:46:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm219626695e9.15.2026.09.05.03.46.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 03:46:29 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH ipsec-next] docs: xfrm: Fix the two aevent sysctl paths
Date: Sat,  5 Sep 2026 12:46:25 +0200
Message-Id: <20260905104625.43722-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysctls are registered as xfrm_aevent_etime and xfrm_aevent_rseqth
under net.core (net/xfrm/xfrm_sysctl.c). The document calls them
sysctl_xfrm_aevent_etime and sysctl_xfrm_aevent_rseqth; those names
appear nowhere in the code but in a comment in net/xfrm/xfrm_user.c and
were never the proc file names.

Use the proc file names.

Fixes: b8a99520f78e ("[XFRM]: Add documentation for async events.")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/networking/xfrm/xfrm_sync.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/xfrm/xfrm_sync.rst b/Documentation/networking/xfrm/xfrm_sync.rst
index dfc2ec0df380..27e3d151b11e 100644
--- a/Documentation/networking/xfrm/xfrm_sync.rst
+++ b/Documentation/networking/xfrm/xfrm_sync.rst
@@ -120,12 +120,12 @@ in case they are not specified.
 
 the two sysctls/proc entries are:
 
-a) /proc/sys/net/core/sysctl_xfrm_aevent_etime
+a) /proc/sys/net/core/xfrm_aevent_etime
 
    Used to provide default values for the XFRMA_ETIMER_THRESH in incremental
    units of time of 100ms. The default is 10 (1 second)
 
-b) /proc/sys/net/core/sysctl_xfrm_aevent_rseqth
+b) /proc/sys/net/core/xfrm_aevent_rseqth
 
    Used to provide default values for XFRMA_REPLAY_THRESH parameter
    in incremental packet count. The default is two packets.
-- 
2.53.0

