Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DF02F1FF1
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 21:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562302; cv=none; b=lMpn9d3rnVWLELb5JZmiSKoIi+DPlMlL3kYhnmR4VtWkm59TMUg2qsrxrXY5aNQAkyaTpgctSZwL3Z0qF0q4lny/DNzgdJyXmYQX15zXu5WWkVSjNn2wbBbEFQbkbuJXE8DZfWsQD7/xJU4risgk6iCWjs4AMDsSpdyHsC+82Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562302; c=relaxed/simple;
	bh=69vt7Qk2+H3T481tbA+iEUit9KnFrIN5kgrxdXzsY24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A8Axb3AyZyAu0dBf3QsQc1FXcWHlQv2DCars2gYx1S3JPsKG5uaPPuEZhEcMWbo45SLD8uEJDsZ4HkWXtA6Z2725S/nPEYbiprHCJKaziI9m/4EPTysWR+YncdyTHqKeKypvztSiYiQeFkFNi8Hn3NO3g3uuNeyorH3h4PnAysI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew8vqAnY; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew8vqAnY"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b801ff00294so198725766b.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562299; x=1768167099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyVyOVoDpRkrPdb+Fl/hf7lVJIk2hqFvpZtQyF+zJoE=;
        b=Ew8vqAnY4iju3lYMSEMmcqUQoDSrBfxZebl4bDCMP8UCzS0eow7Xs9aFmRq/jlqFy+
         z6J0aQasWrSV695OnWYJGvScYhYVbWxpq3XFfhkfH2bxZRNtJaK9A+frRMBpUzwPhntk
         BZqR2Pj4tq4Y8WxDsO9jEHy03XCq7BIey8/fQ27dHUUDMmjBj4J/fHe0E7OyMLMBZeO1
         +lgkkGMNJt0IXe8vbvoS04ax1iHchKMq0Eq/OWz8v279wEq5TK885DAGUwVA1vIc120E
         ZzhsvfKonNfxXq7CHR8RhM2y0m3esA5VAmeAWdsNUpo6T/kHp9y4opPt49pP/q+Skb5r
         Uy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562299; x=1768167099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iyVyOVoDpRkrPdb+Fl/hf7lVJIk2hqFvpZtQyF+zJoE=;
        b=BFTTiA9m+Uw7HdOp7I1+/v2V7nhK5+Q1acXjRPAQxrdINI4qi86IVn5akYB4i7vL1T
         v2goCbsBz3s5s08YiKqSylyfktMTYP/V0EboNAVHm8w7kLip/J3cYsS88tpN8mfaTK5r
         jwAaIXiuuE+GF5RRewfEi5Hy0NomHCztgVQwl6Vr9vm+HlozWcDLYXEpODmgKDHfq9wJ
         G+pWdN9BmYDpjUxCpWswFoT9eWEfBVvA9zyJzvTtANGPVafMNIZhCBLmmvGKPO4HmC+9
         N8favO8X2bdvKtNK1jgrdAXElkmczjhnQyT6H1h9lu2YphQq2FWt8rDoHLqGrSxqTo1K
         ykWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOAfOAoYq5yTKvW41Buy6U4ALvPOivytDO3HlihNb0W4zlGeHin4A1UFsSn9eEibRz7fn8WP+ob+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHm5IPR8oJJ+WyqkoXFLIEDxXCJC8wakoMSLNXyhjZiMh4S9Wa
	2rgOmT6lEzfW5relXkxd00sjVEKWpEou00bQ06c99Fu+bs+vlHlPeax/
X-Gm-Gg: AY/fxX5JPu3nQVehgBgVjNTEk3vMIlRmWsZrHWJGxsW45IcquDZ/C2m0JM13gIt49m1
	11b6oe9xCDkwe1ucg/SJE7vFUelr+W7HK80+NrdPL3YIlsQ6JhdK2g/oXris8dEYlBNpQ/56Tux
	Q0PhnPI3hp5HCn66MlFQTpNGvIlpbBVvZHWe80b/SmzpBKX4GLRBFMop+7NCVnf8E0/VEL6QEar
	+innQpQkojXeFoOxHdEAOPkNByz/x2KBqk6HV6brTZTnzJ32qJbDMEM5X/ieC62ayeGATLNAwiR
	xsXu8dSv/JVc4Pk6V5cBzagNwtmNPPidxlEBXED85Wxdbowf1s/wptKM3HONhUUP3wR+PsgUx/I
	CKMh0Sb9tHNmen3f65g8zj6ylWMTadfq2DidlER9+lVY9OL3L98e6psNKH7S0klUVG1yMwp2ovY
	9oIELtW8ygKAltQam10yrQCT0r4Og9Ha+LopMfLin2AHKQJwbKtJEGxGMHU1d5e106
X-Google-Smtp-Source: AGHT+IGakCoIAtkpX3G7Cb43Lp8uN8RojeqEyKuH05NK9zjgxJjMdsIxbnKIPtDxZRa3xmkxyc0Rog==
X-Received: by 2002:a05:6402:268a:b0:640:abd5:8646 with SMTP id 4fb4d7f45d1cf-64b8edbd77bmr24808991a12.4.1767562298790;
        Sun, 04 Jan 2026 13:31:38 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:38 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vi@endrift.com,
	linux-kernel@altimeter.info,
	peter.hutterer@who-t.net
Subject: [RFC PATCH 5/6] Input: Realign rest of the HID_UP_BUTTON cases
Date: Sun,  4 Jan 2026 22:31:31 +0100
Message-ID: <20260104213132.163904-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The switch statement here had too much indentation.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-input.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 1c11077b1577..9542829de234 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -770,22 +770,22 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 				code = KEY_RESERVED;
 			break;
 		case HID_GD_GAMEPAD:
-				if (code <= 0xf)
-					code += BTN_GAMEPAD;
-				else
-					code += BTN_TRIGGER_HAPPY - 0x10;
-				break;
+			if (code <= 0xf)
+				code += BTN_GAMEPAD;
+			else
+				code += BTN_TRIGGER_HAPPY - 0x10;
+			break;
 		case HID_CP_CONSUMER_CONTROL:
-				if (hidinput_field_in_collection(device, field,
-								 HID_COLLECTION_NAMED_ARRAY,
-								 HID_CP_PROGRAMMABLEBUTTONS)) {
-					if (code <= 0x1d)
-						code += KEY_MACRO1;
-					else
-						code += BTN_TRIGGER_HAPPY - 0x1e;
-					break;
-				}
-				fallthrough;
+			if (hidinput_field_in_collection(device, field,
+							 HID_COLLECTION_NAMED_ARRAY,
+							 HID_CP_PROGRAMMABLEBUTTONS)) {
+				if (code <= 0x1d)
+					code += KEY_MACRO1;
+				else
+					code += BTN_TRIGGER_HAPPY - 0x1e;
+				break;
+			}
+			fallthrough;
 		default:
 			switch (field->physical) {
 			case HID_GD_MOUSE:
-- 
2.52.0

