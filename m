Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0536F428;
	Fri, 24 Jul 2026 05:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870883; cv=none; b=snWR9HG0Vf7ds5DgBEFgPmpsaW4fDXYe+FVlfMhHC1edNZ1fhi59PI7cPakQLYdo/s8VPsJe47RM0/+U2BFTBY/CJj+WZZ8AL+CTAMUJ8wNDE2K7UOvNQ1oUw9UkVgLpYIrHcwxhU5Nsx3sAlRxfiR7IjPA91so9KPFy53V+HwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870883; c=relaxed/simple;
	bh=kKCS8Fm5k1SUlySoMYPhw2Gr2SRcd2cYmCda400fiQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MES13y09PbDOoImpv95dNo4TPtyhkdWzyzDqu3D/pDLR/ezbr+rAWCRWbWEtwvbA6Q1d2F/Y+yofcroQaRZyVt97+ikSeFraCZrPdyW29VCAgleFqKrl5GMymoXQZ5xKgCcv3JpFusy6vJQnJWh/bvPFzg/obDpKNNSjOgIoSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=iqTbNJom; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="iqTbNJom"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=Tg9gezfDToBSFBS9E2Mb/EPy4S76EslsouY2QzTTTL0=; b=i
	qTbNJomNVkpqWVMAVX8kIBvxPggLq7QLCd8PgGW60xW+Ty8WxngyoKCWB1lMhdGzT7hOiaN1zd6OB
	OcYOmNJEjaW3w3E1/WlRn6kFXNGer3zIi8gx2dtQ2N7mpGArrXI5nIy6E+pkoW+f5MOlxkEVtXp2R
	BRCyTmU94ZzWyBhYPzVR4APXA1JKvZHqIzh7FLymg2IBchSj66diGnEb4Yk/CtD3MTW51hosdGkF/
	5xcQcJQpREAY2wDh+Ewl65cHY8YcAOyp5Dni8Qz1St9RFDDAqztOM2BQXzPKzQsYHSCn/xUrOa6Ip
	b1G9rncs05ikFgP/dlH8Rq0jrwa1pInAg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1wn7sg-00ERvh-Im;
	Fri, 24 Jul 2026 06:51:30 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
Date: Fri, 24 Jul 2026 06:48:38 +0200
Subject: [PATCH 1/2] Documentation: Add my name to the Kernel Driver
 Statement
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-sign-kernel-statements-v1-1-52131fb5affb@fjasle.eu>
References: <20260724-sign-kernel-statements-v1-0-52131fb5affb@fjasle.eu>
In-Reply-To: <20260724-sign-kernel-statements-v1-0-52131fb5affb@fjasle.eu>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nicolas@fjasle.eu>
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=nicolas@fjasle.eu;
 s=20250924; h=from:subject:message-id;
 bh=9kswOCaJtOhU6Vedr93xOIOYtcgTGuGRh1ITyOK5nz4=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqYu6t+6OvtEkoczJO4xqQfI2AYEBosqGzx0QbZ
 YiRLGOC5fCJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCamLurQAKCRAHUgpwFiYS
 aQZSEADhoEm24zAmyHWXKR2jjHF1dRWt/w59Q2mics68qHuGdcuDmMaeI/7FqdhPrAwfBHquaX3
 3KchJZnUg7oXsk/bdRu+Rj4iE7AQqHN5N53BZXyWI3xScFsh0zS2D5XRfndhi4WG1iCBQMnbX1T
 AaTV9+qU9IkzqqDUG2+e65wkpaKzcdecUYNamdNrwk8BwkSJTyEPIpEeYsVud4EU7XecroB8Kj9
 BJyExGDj6/FX2LM4GbelJ8bhmb8Jk/x7av7UdW5A7nvICl8bxxZaLr76UYOHQ3hIW4kkggdRVlV
 EjkUJkuoPO9+p5Q6MUGoNceUrVPf3OpH6jSANI7bTd2rE6jtNbNPDa2gh9EI/6wLhI4ZaGeG8+r
 2edu0+2AY/cwxNt10WmXQn4ax2ah/mRHjP6br5MGlGW6gcFeRrawERjRYHXU1q83rmxQ+QDELzf
 c5dWP049c9NUbUm1PawRR5p79amh7ltSNbzye+KiTkccJaqCRZYyz7+NjAO/1VKjE+1iOJjMbd2
 kgBh/jMSiEEVTJ5vCRPdefJRu60QckdOzUVhbhXOLfAgb4gYzR9knQvzR2Wm4rA3gdyjzcvZUww
 jYKN5T6gq92Is81tDgqlVhY7zS7G76qPAgIyO+qW2B3Q1cuask9wzpTJbg0TY4mcHupgWZbr8zh
 R90WoY/BeLamFmA==
X-Developer-Key: i=nicolas@fjasle.eu; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

From: Nicolas Schier <nicolas@fjasle.eu>

The Kernel Driver Statement summarizes in short words what I have
experienced again and again, and I gladly sign it as I am backing
and fully supporting it.

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
 Documentation/process/kernel-driver-statement.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/kernel-driver-statement.rst b/Documentation/process/kernel-driver-statement.rst
index a849790a68bc..981324cf514e 100644
--- a/Documentation/process/kernel-driver-statement.rst
+++ b/Documentation/process/kernel-driver-statement.rst
@@ -156,6 +156,7 @@ today, have in the past, or will in the future.
  - Mark Salyzyn
  - Yoshinori Sato
  - Deepak Saxena
+ - Nicolas Schier
  - Holger Schurig
  - Amit Shah
  - Yoshihiro Shimoda

-- 
2.47.3

