Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C787265629;
	Fri, 24 Jul 2026 04:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869102; cv=none; b=rsZ0pyUz6IUg6N2jJhXCmKHkbZpJrFFszIiiCYy1ifqQ+OOwwJtJDYbHpHWybvLFVefN3OOZUGI1oFt82CDz2RYm0gi0kA+1Q2RBCvXYva6N6sTr5141WtAj9pegioYZ1hFBcrp7gDDBwbpBi6t31WKcahT5hP8THnegcrPSCuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869102; c=relaxed/simple;
	bh=oA6/AQJWV0j6rmvNuLtiEym/+dnDSCIGbTz9tPn/+XM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0gIkzp9BF6wRU+EkhNkTQMQv318Q4qYtU/gQwQRd+Jv8bpAAcVJ+3du2vdK/0kQo5IpAqnkZctroFBKp8B0WcvjbwZ2YjYeU/cMegmoDTVZySATqbkMxJxKxkgpidt3SZuAAwB/25FSD+DLiLsj11mhOl/Xu9sHNmc3mazUohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=mbz+0f4c; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mbz+0f4c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=zH+ZHg+dFhAWgwwztFJm9Xvf84EonIy8d44y46xsoEs=; b=m
	bz+0f4c/bXcxo2oW0IDSFjmOak9xYPLcPgnogl1uQ0wLnzXGhTUzSSREuTDs2rmrnpd3Xt/9AQ3sW
	8XN/jCCclhX8IQE3Iaf4KAFkMXNgJfNdukpyvmL5bW4HMibwhJt1Wf2c0FSwIqGuFb93AjdG6/USt
	v2oCOWReNPqCf2b24MXIGNbzOGkiw9lsatWKiXIVC197pKwYwOi8vrm1/3pwPQxTI/rbXLEaj5gCd
	zN4os5JKgnMTQoTZtuBpeDB6pXyUY1QQidGt21hSv/M596AR+rh1TX/PEz4F0g2NiNhYj1yGhLxI7
	Ez5QjVkmP8FtC4efkSvZL53jiJ7uAk4iw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1wn7sj-00ERx3-LU;
	Fri, 24 Jul 2026 06:51:33 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
Date: Fri, 24 Jul 2026 06:48:39 +0200
Subject: [PATCH 2/2] Documentation: Add my name to the Kernel Enforcement
 Statement
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-sign-kernel-statements-v1-2-52131fb5affb@fjasle.eu>
References: <20260724-sign-kernel-statements-v1-0-52131fb5affb@fjasle.eu>
In-Reply-To: <20260724-sign-kernel-statements-v1-0-52131fb5affb@fjasle.eu>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nicolas@fjasle.eu>
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=nicolas@fjasle.eu;
 s=20250924; h=from:subject:message-id;
 bh=D86SLZuBWYM/6O7yEB61MVZcROboEWp/wzrXJZOAJI0=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqYu6tsLzpI0E3od6ADRFCn0qwTKvRn1tK3QeE9
 wtcpmIO2RKJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCamLurQAKCRAHUgpwFiYS
 aR6YD/0aanEwfxXk5iZqVRyPt+F5OPd53lgk5keVSwM3iYMmuqmTXy02B3s4TdiQzSqcFhe+Jb1
 GRWg2HJkdRwPwcP9RalHT5uhLqYKIE/QbKr3Xm/CEdH3uTJ4o+r/W7pwINyC5FID5OgXu+PBvV7
 Z5b3SePkFN24deUWlBfQuyqiH1njdd2Zw5g5xjItHwmZafPc282gUHr1bhqDyyTCi4DIeQLeda4
 rqt1ZrzX1NMFDCxLF6uurH0CEztqfHWE+/9uId4vDQivSnUSsq/AmGncvu/XxfNGG7RS1lnMIXC
 FLoL2o97v6xgNXag1O8YGRiGHR3ihqoPcKZh5L5ohXUvFM7KvHcilnXfbGA6AQWZkk3lEa6EMQC
 xH3y7bAGMnuu/LrpBhNEDFHGbtzmtDBG8vb/owIjVhvBU9wm82XNldlrjuEsooAqK+n1FZbC9zC
 AjDgsmkj0A9AkC/u7LoefosHKsEThDO+xK6fi2lxVd9zQAVR1NLHYU/IUHQJeaPqNFTSETB4U58
 KRD/ACbUUcwpQjAkbT3mNQV1WWnUJVGk7TobEyjFf85X7pG4aqpXz3hSryBOXemK2uJX9mXTtYI
 r38Blgw1Bi2+H8sv8M2+B2tMvoHFeZ0JBz2XOtTucjWh0GgarqFXuzHdyjU0GtR3hfRNwBOi8NU
 ANiODoIIe+oHUqg==
X-Developer-Key: i=nicolas@fjasle.eu; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

From: Nicolas Schier <nicolas@fjasle.eu>

I do support the statement.  Add my name to the list.

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
 Documentation/process/kernel-enforcement-statement.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/kernel-enforcement-statement.rst b/Documentation/process/kernel-enforcement-statement.rst
index dc2d813b2e79..d12eb46d94e0 100644
--- a/Documentation/process/kernel-enforcement-statement.rst
+++ b/Documentation/process/kernel-enforcement-statement.rst
@@ -137,6 +137,7 @@ we might work for today, have in the past, or will in the future.
   - Steven Rostedt (VMware)
   - Frank Rowand
   - Ivan Safonov
+  - Nicolas Schier
   - Anna Schumaker
   - Jes Sorensen
   - K.Y. Srinivasan

-- 
2.47.3

