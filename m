Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC932E54A3
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289002; cv=none; b=Ol68NlLi6D36Kh8ecx1rt3yVNxV3tky4JoO4HFileJiba3vV/h/hckfw4cCBulE17kOTUF+rzk679mqoNdF8qqnwbCBJqfHnLsTz50XXOEuJaqnPg5vUI9B9KHhMRA/M22mWS0iuFeltSIw9Ni/JVpRh924WT3pjQIy31N3uHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289002; c=relaxed/simple;
	bh=jCZOTQ0S4zPGrVewV7zNDwWTEanfwMTrGpGoODy9ROY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=plSB04IywF16nsdR7WUDhisJTnkDzyf9qBmAHjStd7X9fsfQ5S24F/ZtY+NFQa9SUuCx9S8uONa72pSC4WdurbcIATWGnPrF0geiNA64g62ajhhFG25QK3rsia4JWRNwzM9tl6W7f0Zh8zfPkf3eA7bD37A8m4xoSz4Cp6iqQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPfBOJIg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPfBOJIg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-430f57cd471so3534851f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 23:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768288999; x=1768893799; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEbfMOGmFF3KnEiYpptf/1+FNigGAulyjnzCIqxEBOU=;
        b=TPfBOJIgrjKwtS0hbpOa+YFYudKlrR0CPcUtTfdEvzeeGkf75XE8p5OdMCp+xgNSUr
         Em3jDJO4Lsxe5HJ/s68EtWjooy9yuBpYMojRsUEtrcnqb0GlX2/yWNCILSWys35oaI0+
         BY+PokINPAVyhaz73SHbevjePMu4Z0Qc0nHDfHKdF/sscQwpjtciIxVlN3F7njfU7S0z
         BH//oazgL9BxiOsuzX771XeAgdNqgurTA7TGX9AT+BqNK2MYiY+AvAtiliY6YJQiNLSP
         SUNnG3Up14dd+6EQuGcl58SVYqS6LrdLuRdS0wiJ0m2Jk7OsdkAz5H0fimFeyn7gsqgQ
         bodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768288999; x=1768893799;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEbfMOGmFF3KnEiYpptf/1+FNigGAulyjnzCIqxEBOU=;
        b=fDAkmogbacKVqLvM8BbUYD0UIrc2NLegSbFb6Ruw4HUWJygdiDJp11axSeAgmdlv/A
         EvUmmN+QPoO6Cis0tmuRxm1INbK5ZjSV8s1y0quonMHGHRIYhJ++hih8KujxIHo6KlwJ
         pz5MI4eNuZPmOoYn0ftgu/9Ol/GaR5mVq29PEKvmxrglzYbIcPDa18VM8hR6SRjyguGx
         TfTnmGwBxbrrZ4Q+uAVQkbqC2pIzE6SGgRHO8sTffgGaGzcAcLoLv0xBVse5UF61I70T
         DIoyUn/Qoo8XAlY6A0G6Cs/knvdc1HtGWud4icsyJguXEgoxXV8f1xt2zTfZ76qu5H+2
         eCAg==
X-Forwarded-Encrypted: i=1; AJvYcCWljIZvGpP3XFzeAvGLmb8zR9LKCKcIPxOpR1ZBfl0NHd/ExMnOV0dZeeNTpDkOu31TGQub3QpbGK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN29UNtQP1hAA4eHNMJ+JOH+eHmLV6O/LFZUZwL9QQmYAwBOO+
	ybPl4OcAoxK05yosJBXFj3FRjPWE97vfQxb2WkNZHpAiruhC+0uSezVF
X-Gm-Gg: AY/fxX7YzmcwPEmRNEmL9XSJTYeRH3IAy+u4p/1eEW094rNXpg5+GAljtr/beQhTPmi
	lbNB2iTt2/VUeZmmSHIs77rgd59/RQtaaUdyxJCLlhrD5etfbQ3RZK6aBepbQO8EyqZgKcYEwpf
	/v/JlJj/LMk4zQP3Mkr/V9dKU8HvNrblGMEDRvdXJrLOCg878BtQOzsATPab9uhH9ZJWbhp45y/
	WJ3bL7nwifKSsvyDf9ZzLw8A+4f2h7tEuzh9mc09mdoIL2UDXITFCNByrFBF+ZZWVK7Z73/sqwN
	fHvZofL1eSKjz9khPr27WJsbYaEQNb91FLEKeA6ZZrGLkYYACw1k0Anp6lNPQ3M+JkqiOXJL0je
	McTvTASBZalVaGzp39bGTl38phWeW+vJ7RFtj5deo2HhOIJ0aTF4VTZWXnnbujnsD58N1oI83MX
	jDGbM9/is87UHnG2o+aBF4c5QfOa7scDEan8od75KmlrWSuKgPEvsBjnC/lDAbOkpjkRNqFfoZZ
	Z7EhuI9TQOahKhKVbz/PQytx6enGk4kYV9BLNMDu2kqipHlG1iUgg==
X-Google-Smtp-Source: AGHT+IFV42pk/BOqaBnb9I6uBmKsbIDQ/GvcmLOlMRG74oAZupSAMqRvBe/YcWOX7gd+PN5uttt4Jw==
X-Received: by 2002:a05:6000:1448:b0:431:a0:7dea with SMTP id ffacd0b85a97d-432c374ff61mr26596396f8f.40.1768288999226;
        Mon, 12 Jan 2026 23:23:19 -0800 (PST)
Received: from ?IPV6:2003:ea:8f03:3800:3cc9:69c1:1a2a:f175? (p200300ea8f0338003cc969c11a2af175.dip0.t-ipconnect.de. [2003:ea:8f03:3800:3cc9:69c1:1a2a:f175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm42227535f8f.16.2026.01.12.23.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:23:18 -0800 (PST)
Message-ID: <ff8ac321-435c-48d0-b376-fbca80c0c22e@gmail.com>
Date: Tue, 13 Jan 2026 08:23:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Jonathan Corbet <corbet@lwn.net>, Simon Horman <horms@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-doc@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net-next] net: phy: remove unused fixup unregistering
 functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No user of PHY fixups unregisters these. IOW: The fixup unregistering
functions are unused and can be removed. Remove also documentation
for these functions. Whilst at it, remove also mentioning of
phy_register_fixup() from the Documentation, as this function has been
static since ea47e70e476f ("net: phy: remove fixup-related definitions
from phy.h which are not used outside phylib").

Fixup unregistering functions were added with f38e7a32ee4f
("phy: add phy fixup unregister functions") in 2016, and last user
was removed with 6782d06a47ad ("net: usb: lan78xx: Remove KSZ9031 PHY
fixup") in 2024.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- improve commit message
- remove related documentation
- remove also phy_register_fixup from documentation
---
 Documentation/networking/phy.rst | 22 +--------------
 drivers/net/phy/phy_device.c     | 46 --------------------------------
 include/linux/phy.h              |  4 ---
 3 files changed, 1 insertion(+), 71 deletions(-)

diff --git a/Documentation/networking/phy.rst b/Documentation/networking/phy.rst
index b0f2ef83735..0170c9d4dc5 100644
--- a/Documentation/networking/phy.rst
+++ b/Documentation/networking/phy.rst
@@ -524,33 +524,13 @@ When a match is found, the PHY layer will invoke the run function associated
 with the fixup.  This function is passed a pointer to the phy_device of
 interest.  It should therefore only operate on that PHY.
 
-The platform code can either register the fixup using phy_register_fixup()::
-
-	int phy_register_fixup(const char *phy_id,
-		u32 phy_uid, u32 phy_uid_mask,
-		int (*run)(struct phy_device *));
-
-Or using one of the two stubs, phy_register_fixup_for_uid() and
-phy_register_fixup_for_id()::
+The platform code can register the fixup using one of::
 
  int phy_register_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask,
 		int (*run)(struct phy_device *));
  int phy_register_fixup_for_id(const char *phy_id,
 		int (*run)(struct phy_device *));
 
-The stubs set one of the two matching criteria, and set the other one to
-match anything.
-
-When phy_register_fixup() or \*_for_uid()/\*_for_id() is called at module load
-time, the module needs to unregister the fixup and free allocated memory when
-it's unloaded.
-
-Call one of following function before unloading module::
-
- int phy_unregister_fixup(const char *phy_id, u32 phy_uid, u32 phy_uid_mask);
- int phy_unregister_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask);
- int phy_register_fixup_for_id(const char *phy_id);
-
 Standards
 =========
 
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 81984d4ebb7..95f5bb3ab59 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -474,52 +474,6 @@ int phy_register_fixup_for_id(const char *bus_id,
 }
 EXPORT_SYMBOL(phy_register_fixup_for_id);
 
-/**
- * phy_unregister_fixup - remove a phy_fixup from the list
- * @bus_id: A string matches fixup->bus_id (or PHY_ANY_ID) in phy_fixup_list
- * @phy_uid: A phy id matches fixup->phy_id (or PHY_ANY_UID) in phy_fixup_list
- * @phy_uid_mask: Applied to phy_uid and fixup->phy_uid before comparison
- */
-int phy_unregister_fixup(const char *bus_id, u32 phy_uid, u32 phy_uid_mask)
-{
-	struct list_head *pos, *n;
-	struct phy_fixup *fixup;
-	int ret;
-
-	ret = -ENODEV;
-
-	mutex_lock(&phy_fixup_lock);
-	list_for_each_safe(pos, n, &phy_fixup_list) {
-		fixup = list_entry(pos, struct phy_fixup, list);
-
-		if ((!strcmp(fixup->bus_id, bus_id)) &&
-		    phy_id_compare(fixup->phy_uid, phy_uid, phy_uid_mask)) {
-			list_del(&fixup->list);
-			kfree(fixup);
-			ret = 0;
-			break;
-		}
-	}
-	mutex_unlock(&phy_fixup_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL(phy_unregister_fixup);
-
-/* Unregisters a fixup of any PHY with the UID in phy_uid */
-int phy_unregister_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask)
-{
-	return phy_unregister_fixup(PHY_ANY_ID, phy_uid, phy_uid_mask);
-}
-EXPORT_SYMBOL(phy_unregister_fixup_for_uid);
-
-/* Unregisters a fixup of the PHY with id string bus_id */
-int phy_unregister_fixup_for_id(const char *bus_id)
-{
-	return phy_unregister_fixup(bus_id, PHY_ANY_UID, 0xffffffff);
-}
-EXPORT_SYMBOL(phy_unregister_fixup_for_id);
-
 /* Returns 1 if fixup matches phydev in bus_id and phy_uid.
  * Fixups can be set to match any in one or more fields.
  */
diff --git a/include/linux/phy.h b/include/linux/phy.h
index fbbe028cc4b..082612ee954 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2356,10 +2356,6 @@ int phy_register_fixup_for_id(const char *bus_id,
 int phy_register_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask,
 			       int (*run)(struct phy_device *));
 
-int phy_unregister_fixup(const char *bus_id, u32 phy_uid, u32 phy_uid_mask);
-int phy_unregister_fixup_for_id(const char *bus_id);
-int phy_unregister_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask);
-
 int phy_eee_tx_clock_stop_capable(struct phy_device *phydev);
 int phy_eee_rx_clock_stop(struct phy_device *phydev, bool clk_stop_enable);
 int phy_init_eee(struct phy_device *phydev, bool clk_stop_enable);
-- 
2.52.0

