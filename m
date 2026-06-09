Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F735346795
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016694; cv=none; b=DxO2izJMqO6yifj6Kzz1kKMaiJ/YGgd1+W30g1WJzJuxEeq6objUvXFdvtBe7JaJ2W4R4lXrENafai1uuu1i4wgvZzsD25GYUByaVnvUkK1SjMtjwbmGQaSma/y27xA3T45syELYEjuBAp1yO+isuKWaoQwTWCxp6JR1nOelFno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016694; c=relaxed/simple;
	bh=9ow5eCO4P55QDHwrpqpp+90MBe5HvauCdrN0tzFKsN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OfGYXWJvN4MPVF2h51l1A5co08Ar6V0f+KfP/o60pVkF7sYWpY/Mel9NeHlBfudtUVYMpwxFaLJzxNB6ulUw80dJM1rnFbKTgLpzggKXoIX37ilPWCzTJn/A7ltJ9JkpNEzSFyK9ydRuckJkuZotOrrLWZ/Ph3cLqJA6aRQRP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VO5RSOoZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VO5RSOoZ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45fd464d51fso3081641f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781016691; x=1781621491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ieE4XTm7LhuRxaPWgdyzIR361E3MYGI5YIsPYqdQiN0=;
        b=VO5RSOoZexxoOH+zH04pRymUHhDU/tuDI97o01m60tuvDKsmcVhTLyjJFtcVECAOHr
         ZN/GR/V7eYP9eH0eboNzkAIvJrD5CDgAB4qAoki3NtrK5cZnHRhMGHbug2dtfWZz5Fzw
         FCm7YtAYD6Pvrz4aGkYenrfbyHTGS4G62l85Tj1CpuQShrcpGgwp63FGdbvgRzScY1j4
         ZCqN0Nwo2z900wyLoS0I2DnKA1Cx3S+YDBH7Dd/tmrSIxCrPAPgQoePu6+lcuV7ELqPX
         0F0p0NBg9tA7H/q3Sq6Wt+HueoqTMJLSk6TaiW4QpJD1M8sFVEibd5lrpyo/5nk5fD0r
         6mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016691; x=1781621491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieE4XTm7LhuRxaPWgdyzIR361E3MYGI5YIsPYqdQiN0=;
        b=AHMavmQvz5bGh/+9VLLJi5QH1Bg33IxeuV1yj1De0fKU90n3Tjn7DJj6Q5qcVwwYnW
         DdHmN9ysPAePHv9gXLU8910LlpUu3gkujQ98hXeCJWnQJgl7rsdWFTgBa13gZ6brnDD6
         bRQkX19Stt+dc9eYFcHdUvXGA4nHcWbZ00w1rFqbQKTkIJausdGtAHmuf4RbjhJOn6d3
         Lr9+cH/nZx5v+SmpnCcPBTfQCVSLGIM+sktu4c81wB/QNFCZmdK4wXN3Cu8o/pBAt4qv
         MxKvfyQhW46PTesYog5GeDYdbUjlJG8iMaybJTCCxXyJmV9L2Ixgg7qU37EH9lCw8cM7
         /NnA==
X-Forwarded-Encrypted: i=1; AFNElJ/OH4qh5GihROhkYaf34L4ZAEZ18qz3xA/lZB5mDIshhKdibC1vX5oLg0G4ZPA7I4ofZkVsL7PUv7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYFPrXcAX99bvSWChwyhbWScIeBlj2Z7LiSg8asQGxU2sDrAkT
	W2kS1QuoN13jdFwtU76fZdVRAPpQiXoesWTDWotz7oq649bPPqUw1exx1l+QjEhckkQ=
X-Gm-Gg: Acq92OHKEHUzk73Gf10N4TsCnyWBIh1VhKq0XFaQuJ2eOpNUNtMVEBEEuMWowlhHx0y
	ZBN2t+vQ1MyCCGXmSd0wY2y6oXOD9sUl85T++jjDjHlwKHfqUAbipfuozFYT7i+B51fu8nKh24C
	sY2KqBEu+3pqHpRsmJlLWwznzuvNvlEHGees+dnJ0Tz+6+0BudnuoRuZ2OPlTBoUt4aKgQ81ZJP
	J/OwkMLglVTwOUFte8nI280Sp7oCBp7slspEzLnOnltyZpP6PDbx1dhGcPJFPYWX7DzHAHz7UR7
	4iky3OUaBHhl3jApP6KDyf+r470od+03LxKRkDWkysfN+TVJk5qkMgEMtPv3OvZiC9TpNPXZBxU
	MJ5CTNs5/xBUgGGigNXy+t/7zZUhvZLxida3yvTltypORuxbKxneRt+7QN2BmOX73ghBBvlr8FG
	DRDTPzGbu25cjRtVBf04HFyaUBdGh5b9pvJ/84lrpdP4PsTxlbSoh+4mlMTueKcWvsEfO7CnsZj
	nt45p1C49FPhXqOA392wAcq1A==
X-Received: by 2002:a05:600c:45d1:b0:490:b9c3:6c62 with SMTP id 5b1f17b1804b1-490c261007dmr324993625e9.28.1781016690665;
        Tue, 09 Jun 2026 07:51:30 -0700 (PDT)
Received: from localhost (p200300f65f47db045b0dbdd314d8a71f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:5b0d:bdd3:14d8:a71f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46028a6dcbdsm51241582f8f.7.2026.06.09.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:51:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] pnp: Documentation improvements
Date: Tue,  9 Jun 2026 16:51:17 +0200
Message-ID: <20260609145117.1355753-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2362; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=9ow5eCO4P55QDHwrpqpp+90MBe5HvauCdrN0tzFKsN0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqKChmy1oL7qKmM3+ZvlkHqFJ2LKlBTrvhWIUv6 13f6X8/h/SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaigoZgAKCRCPgPtYfRL+ Tig6B/wKCPpRB5L9WZar8ghgkksasaNMs+7S861O16KeG4/9pC03710SJ1u+b8RvkbSjEbjkEIO KZXelVbA/+p/J7IkIYoNs++sbYMMLCg11Ql59Xx2kuKdPaQWVBILiUudXZ898+HeOT+2bQY7X2I ei2IBkZoeyKam8tuo6vYlRrCZMPuHhCBrElggsNPJVL7ua00Mlq+pzTkVAtA6kSTEib9RxvyQut bXbzG+t8UZOIavZsp2ZAN12+M08MX1vEy6PMFhPB48t1w1+URRM1aMeq6941/l1N2McBPOe/CAP 4zK3tHQ/25+X5SY/pJVjzvIwvQbP0m8ChaMnw/wXxsJJLGF8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

 - Consistently use named initializers and simplify sentinel
 - Skip assignment to .driver_data if all are 0
 - Use consistent spacing to match Linux coding style
 - Fix prototype of probe function
 - s/pnp_id/pnp_device_id/
 - Drop non-existing .card_id_table

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 Documentation/admin-guide/pnp.rst | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/pnp.rst b/Documentation/admin-guide/pnp.rst
index 24d80e3eb309..14a0bf400d2d 100644
--- a/Documentation/admin-guide/pnp.rst
+++ b/Documentation/admin-guide/pnp.rst
@@ -203,12 +203,12 @@ The New Way
 
    ex::
 
-	static const struct pnp_id pnp_dev_table[] = {
+	static const struct pnp_device_id pnp_dev_table[] = {
 		/* Standard LPT Printer Port */
-		{.id = "PNP0400", .driver_data = 0},
+		{ .id = "PNP0400" },
 		/* ECP Printer Port */
-		{.id = "PNP0401", .driver_data = 0},
-		{.id = ""}
+		{ .id = "PNP0401" },
+		{ }
 	};
 
    Please note that the character 'X' can be used as a wild card in the function
@@ -217,14 +217,14 @@ The New Way
    ex::
 
 	/* Unknown PnP modems */
-	{	"PNPCXXX",		UNKNOWN_DEV	},
+	{ .id = "PNPCXXX", .driver_data = UNKNOWN_DEV },
 
    Supported PnP card IDs can optionally be defined.
    ex::
 
-	static const struct pnp_id pnp_card_table[] = {
-		{	"ANYDEVS",		0	},
-		{	"",			0	}
+	static const struct pnp_device_id pnp_card_table[] = {
+		{ .id = "ANYDEVS" },
+		{ }
 	};
 
 2. Optionally define probe and remove functions.  It may make sense not to
@@ -234,14 +234,13 @@ The New Way
    ex::
 
 	static int
-	serial_pnp_probe(struct pnp_dev * dev, const struct pnp_id *card_id, const
-			struct pnp_id *dev_id)
+	serial_pnp_probe(struct pnp_dev *dev, const struct pnp_device_id *dev_id)
 	{
 	. . .
 
    ex::
 
-	static void serial_pnp_remove(struct pnp_dev * dev)
+	static void serial_pnp_remove(struct pnp_dev *dev)
 	{
 	. . .
 
@@ -253,7 +252,6 @@ The New Way
 
 	static struct pnp_driver serial_pnp_driver = {
 		.name		= "serial",
-		.card_id_table	= pnp_card_table,
 		.id_table	= pnp_dev_table,
 		.probe		= serial_pnp_probe,
 		.remove		= serial_pnp_remove,

base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
-- 
2.47.3

