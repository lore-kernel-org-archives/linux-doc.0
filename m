Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A720D4E9
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 00:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779322672; cv=none; b=FrNVBzwPu0AM4FS/BNwC8vEG5kLXiywPqNwCvlQ+ZiRrT51qUj3Jlh+ZEoSo/X8iQhALSiI3cHJPjz5/MGpaDhJ6GkExzw2/bDxVDQw665+UjtWJPXKNupGIzlXwgpG7RY6X4UYFtoKniENCNvpTfXb/HTxscneXw/LEH2bz+fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779322672; c=relaxed/simple;
	bh=HRtHHOEjvmTW762UEXwLH23ZntlzxDErqOorLAVh0UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2jGZJ3wO5o++2usEgP+bALRjX/XkMwH5VV+sXP6bnm2oLhqQ6CPBx90yqv0or2Jjpp9yBUwgP+XtJwjZ+O3k9+30Tv8hXGUG6GQJmRAoTr/9jr0dtYEpum7wKiMwzr/akB1JD8+h5d6hqc65S0ffyOJIE1iuH3ONg2tjGG5KLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsukS55l; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsukS55l"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-134fe980658so7300610c88.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 17:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779322670; x=1779927470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHfRiZ9eAyYIM2WmjAuL1bwyh+6hR9i7GK44MUCPHv4=;
        b=PsukS55lba4ADY8xOzDjmDFB85Xef4ndT2HqG+e1wICU23LDEeBRrKSbsAcPsIbbd6
         xRStG21YjHbeG//Np6dLefnO7nyQuSRjsMhJP1XAgEugylcXHKQrYGi+DGGoYnTLtWrM
         BdaREuhzcoFjM65u7x8NNJqPs9NlwZYVlLvQL2jS5irvtTQjW5IryualrQZu7iK6emqT
         SgBnmGY7TZjdNT/vVESSI2bSIowWGOmAirolIXYzh+neX7vXGPB7GipPUWKUxl1tcPLE
         fjBiKmP9e8IHUTjUR9fkykQ0V1ifhEUd3aqDkJBTq+YQLTrAabZxJwBnN4q9bPoQwwox
         awOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779322670; x=1779927470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zHfRiZ9eAyYIM2WmjAuL1bwyh+6hR9i7GK44MUCPHv4=;
        b=WkP8C/gf/GooesDNUlkE7ebGJUz15XrncN0pBqzhO+nDNZuflHWoDDTzs9d/b4G2Ub
         AT1WzE0j1TOMRJJeDI/j0wNYD9eTII8XYrAiuPL1QDbQOHB29nYW1GRGa4i9rDs0/Wyz
         k3AcVUtFioEKZ/MXGw0XlA+TZI6/TAINI9pOsit3s5zaMHdE2nKluxr59jKw8mAMuqiO
         IIcvTPwRWU2mzq+eO+SMm71fRPhMdSx1IuVzFoz0FkphXzQrUdNbj35nuoE20WhdK6Ts
         MLwmdBOQhtkD3FVkwVxjuL4564umh/D8ZEVuycebGVEONMwvKG1sWJof0E9Qn7NcsyZS
         515w==
X-Forwarded-Encrypted: i=1; AFNElJ8qKpa50VD7Fp+IL3PTlI53W5lUnM4M3Kb0AVlnpCkFijSj39XlXlj/1eEHmnvq5URQrfT8X7msW4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3uQpo3PBEltCnkD5ibgTqJYEtP20Y+RiOVVO7ggudGbv95MN8
	2LMt4WhGbEhRH839ndSAUKegnk5DPux1lRe8Yo3AECJ6qyT06HzJegyL
X-Gm-Gg: Acq92OEGzsWy/IJkddWBSh0uKNVEtvKFzz7YnXqsqHZXx+mtgOefp5amP5cg5zbJsfk
	ns0K4+/9XbaGoDjznunENMAOeWSWgxYvT86aoveijrzhboq+j5cu6gtHwCtMK12tVcbikw6XhKB
	jOF823IbWA6A4nT6i9uwwl5COmdtgMsiLHmjlEaw2nTBBiYLlurE4uabFsiZxAw6Vbx68Ij3S63
	Rrq70Z4EuVELchvymMCQnoQPOTjERUWCjXzOOULp+vOmTHEk6D09nASCWOwiMESUCPbwn3Y7gNI
	VfPwt23gTLJsk75PmdmlUzErPW03Dr54Fue28Dbjdo6IK6zgNZcceanJQhCKsGRFIUszN/m8+1F
	jjKpgRaxfI/1bFepD0rx8KhIcCBxvzwWOOyX2sBDCNbFtWRMXSOcqeSI1skSxIrMQ2PqYlKnm5I
	kZ60D4w42QiX1XEoNkOfRD4ypoCtnaRX8u9nNYyZ4e2CZRNGARtow1DlyPYvuDcU9g8Bmv4KtMO
	Wp2zOabtAr15aDOYOOgS1JGIbxyYaec8TQHywb4pOAYV6T0g/eqtHxa2gfA/kfX0+acY9p9srTt
	jaAf0I0n5Zw7CSYvIgsEmI0cmH20
X-Received: by 2002:a05:7022:3843:b0:128:d375:f1d4 with SMTP id a92af1059eb24-13632d36482mr368860c88.28.1779322669804;
        Wed, 20 May 2026 17:17:49 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ed3sm28444410c88.1.2026.05.20.17.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:17:49 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 6/7] docs: net: arcnet: remove outdated/irrelevant information; improve style
Date: Wed, 20 May 2026 17:16:18 -0700
Message-ID: <20260521001631.45434-7-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521001631.45434-1-enelsonmoore@gmail.com>
References: <20260521001631.45434-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARCnet documentation contains a lot of outdated and irrelevant
information (such as changes in decades-old driver versions and
messages from a former maintainer) and has some writing style issues.
Remove this unnecessary information and improve the writing style. Also
remove links to pages that no longer exist.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/networking/arcnet-hardware.rst | 36 +++++-----
 Documentation/networking/arcnet.rst          | 69 +++-----------------
 2 files changed, 26 insertions(+), 79 deletions(-)

diff --git a/Documentation/networking/arcnet-hardware.rst b/Documentation/networking/arcnet-hardware.rst
index 17450e8e6ca7..37c016cee353 100644
--- a/Documentation/networking/arcnet-hardware.rst
+++ b/Documentation/networking/arcnet-hardware.rst
@@ -8,10 +8,8 @@ ARCnet Hardware
 
 .. note::
 
-   1) This file is a supplement to arcnet.rst.  Please read that for general
-      driver configuration help.
-   2) This file is no longer Linux-specific.  It should probably be moved out
-      of the kernel sources.  Ideas?
+   This file is a supplement to arcnet.rst.  Please read that for general
+   driver configuration help.
 
 Because so many people (myself included) seem to have obtained ARCnet cards
 without manuals, this file contains a quick introduction to ARCnet hardware
@@ -134,13 +132,11 @@ And now to the cabling.  What you can connect together:
    network.
 
 2. A card to a passive hub.  Remember that all unused connectors on the hub
-   must be properly terminated with 93 Ohm (or something else if you don't
-   have the right ones) terminators.
+   must be properly terminated with 93 Ohm terminators (or something else if you
+   don't have the right ones), although the network may work without
+   terminators.
 
-	(Avery's note: oops, I didn't know that.  Mine (TV cable) works
-	anyway, though.)
-
-3. A card to an active hub.  Here is no need to terminate the unused
+3. A card to an active hub.  Here there is no need to terminate the unused
    connectors except some kind of aesthetic feeling.  But, there may not be
    more than eleven active hubs between any two computers.  That of course
    doesn't limit the number of active hubs on the network.
@@ -150,7 +146,7 @@ And now to the cabling.  What you can connect together:
 5. An active hub to passive hub.
 
 Remember that you cannot connect two passive hubs together.  The power loss
-implied by such a connection is too high for the net to operate reliably.
+implied by such a connection is too high for the network to operate reliably.
 
 An example of a typical ARCnet network::
 
@@ -163,8 +159,8 @@ An example of a typical ARCnet network::
 		    |
 		    S
 
-The BUS topology is very similar to the one used by Ethernet.  The only
-difference is in cable and terminators: they should be 93 Ohm.  Ethernet
+The BUS topology is very similar to the one used by 10BASE2 Ethernet.  The only
+difference is in cable and terminators: they should be 93 Ohm. 10BASE2 Ethernet
 uses 50 Ohm impedance. You use T connectors to put the computers on a single
 line of cable, the bus. You have to put terminators at both ends of the
 cable. A typical BUS ARCnet network looks like::
@@ -177,7 +173,7 @@ cable. A typical BUS ARCnet network looks like::
   T - T connector
 
 But that is not all! The two types can be connected together.  According to
-the official documentation the only way of connecting them is using an active
+the official documentation, the only way of connecting them is using an active
 hub::
 
 	 A------T------T------TR
@@ -186,7 +182,7 @@ hub::
 	 |
 	 S
 
-The official docs also state that you can use STAR cards at the ends of
+The official docs also state that you can use STAR cards at the ends of a
 BUS network in place of a BUS card and a terminator::
 
      S------T------T------S
@@ -211,7 +207,7 @@ example::
 	   |   |      S------T----H---S   |
 	   S   S             B    R       S
 
-A basically different cabling scheme is used with Twisted Pair cabling. Each
+A completely different cabling scheme is used with Twisted Pair cabling. Each
 of the TP cards has two RJ (phone-cord style) connectors.  The cards are
 then daisy-chained together using a cable connecting every two neighboring
 cards.  The ends are terminated with RJ 93 Ohm terminators which plug into
@@ -292,11 +288,13 @@ Setting the Jumpers
     Make sure you set ETS1 and ETS2 to the SAME VALUE for all cards on your
     network.
 
-Also, on many cards (not mine, though) there are red and green LED's.
-Vojtech Pavlik <vojtech@suse.cz> tells me this is what they mean:
+LED Indicators
+==============
+
+Many cards have red and green LEDs, which have the following meanings:
 
 	=============== =============== =====================================
-	GREEN           RED             Status
+	Green           Red             Status
 	=============== =============== =====================================
 	OFF             OFF             Power off
 	OFF             Short flashes   Cabling problems (broken cable or not
diff --git a/Documentation/networking/arcnet.rst b/Documentation/networking/arcnet.rst
index ce1b009bef96..4e541aa44aec 100644
--- a/Documentation/networking/arcnet.rst
+++ b/Documentation/networking/arcnet.rst
@@ -12,26 +12,6 @@ ARCnet
    and cabling information if you're like many of us and didn't happen to get a
    manual with your ARCnet card.
 
-Since no one seems to listen to me otherwise, perhaps a poem will get your
-attention::
-
-		This driver's getting fat and beefy,
-		But my cat is still named Fifi.
-
-Hmm, I think I'm allowed to call that a poem, even though it's only two
-lines.  Hey, I'm in Computer Science, not English.  Give me a break.
-
-The point is:  I REALLY REALLY REALLY REALLY REALLY want to hear from you if
-you test this and get it working.  Or if you don't.  Or anything.
-
-ARCnet 0.32 ALPHA first made it into the Linux kernel 1.1.80 - this was
-nice, but after that even FEWER people started writing to me because they
-didn't even have to install the patch.  <sigh>
-
-Come on, be a sport!  Send me a success report!
-
-(hey, that was even better than my original poem... this is getting bad!)
-
 ----
 
 These are the ARCnet drivers for Linux.
@@ -62,31 +42,9 @@ netdev@vger.kernel.org and make sure to Cc: maintainer listed in
 Other Drivers and Info
 ----------------------
 
-You can try my ARCNET page on the World Wide Web at:
-
-	http://www.qis.net/~jschmitz/arcnet/
-
-Also, SMC (one of the companies that makes ARCnet cards) has a WWW site you
-might be interested in, which includes several drivers for various cards
-including ARCnet.  Try:
-
-	http://www.smc.com/
-
-Performance Technologies makes various network software that supports
-ARCnet:
-
-	http://www.perftech.com/ or ftp to ftp.perftech.com.
-
-Novell makes a networking stack for DOS which includes ARCnet drivers.  Try
-FTPing to ftp.novell.com.
-
-You can get the Crynwr packet driver collection (including arcether.com, the
-one you'll want to use with ARCnet cards) from
-oak.oakland.edu:/simtel/msdos/pktdrvr. It won't work perfectly on a 386+
-without patches, though, and also doesn't like several cards.  Fixed
-versions are available on my WWW page, or via e-mail if you don't have WWW
-access.
+You can try JoAnne Schmitz's ARCNET page on the World Wide Web at:
 
+	https://www.qis.net/~jschmitz/arcnet/
 
 
 Supported Hardware
@@ -162,9 +120,8 @@ LAN Manager and Windows for Workgroups:
 	are incompatible with the Internet standard.  They try to pretend
 	the cards are Ethernet, and confuse everyone else on the network.
 
-	However, v2.00 and higher of the Linux ARCnet driver supports this
-	protocol via the 'arc0e' device.  See the section on "Multiprotocol
-	Support" for more information.
+	The Linux ARCnet driver supports this protocol via the 'arc0e' device.
+	See the section on "Multiprotocol Support" for more information.
 
 	Using the freeware Samba server and clients for Linux, you can now
 	interface quite nicely with TCP/IP-based WfWg or Lan Manager
@@ -199,7 +156,7 @@ NetBSD/AmiTCP:
 Using Multiprotocol ARCnet
 --------------------------
 
-The ARCnet driver v2.10 ALPHA supports three protocols, each on its own
+The ARCnet driver supports three protocols, each on its own
 "virtual network device":
 
 	======  ===============================================================
@@ -391,7 +348,7 @@ can set up your network then:
 It works: what now?
 -------------------
 
-Send mail following :ref:`arcnet-netdev`. Describe your setup, preferably
+:ref:`Send an email to netdev <arcnet-netdev>`. Describe your setup, preferably
 including driver version, kernel version, ARCnet card model, CPU type, number
 of systems on your network, and list of software in use.
 
@@ -435,16 +392,8 @@ You can change the debug level without recompiling the kernel by typing::
 where "xxx" is the debug level you want.  For example, "metric 1015" would put
 you at debug level 15.  Debug level 7 is currently the default.
 
-Note that the debug level is (starting with v1.90 ALPHA) a binary
-combination of different debug flags; so debug level 7 is really 1+2+4 or
-D_NORMAL+D_EXTRA+D_INIT.  To include D_DURING, you would add 16 to this,
-resulting in debug level 23.
+Note that the debug level is a binary combination of different debug flags;
+debug level 7 is really 1+2+4 or D_NORMAL+D_EXTRA+D_INIT.  To include D_DURING,
+you would add 16 to this, resulting in debug level 23.
 
 If you don't understand that, you probably don't want to know anyway.
-E-mail me about your problem.
-
-
-I want to send money: what now?
--------------------------------
-
-Go take a nap or something.  You'll feel better in the morning.
-- 
2.43.0

