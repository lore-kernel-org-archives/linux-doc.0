Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1F51F4176
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 01:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779066561; cv=none; b=qreG+5r4m+aYaKAeMy+lJWWG+G885K7sWrKwU3yydZxUJkp9cLiM2fMnHvI6FfJFkP2At9XLBXpUs0NBCxAuE4jJO+5FHAIBcQmfp93ZDbLgLmhGBsX1kFgZruZKkx+sE+hXAwmhhu0D9ciBr2xQvbXoSzFUtspOfUcBz5mNehU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779066561; c=relaxed/simple;
	bh=HRtHHOEjvmTW762UEXwLH23ZntlzxDErqOorLAVh0UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZOfVaQmOZlCmEc2aUttJUQ4kLQ/PQjqpo1HVaHgCvcRqqMjDHTIFsPc20jbvyp0bEzMBALGc81vmls6pp7B0lm5WPR1aQALJ/dKwyZLi+yFxPp+afhrdwHLDAsDyJi7dKNM3kQmJbJPrjAi7QPYrk+I/AAyrsqNyhu2xOrjOa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zqxz+AjE; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zqxz+AjE"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-132d1b2519eso5429660c88.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 18:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779066559; x=1779671359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHfRiZ9eAyYIM2WmjAuL1bwyh+6hR9i7GK44MUCPHv4=;
        b=Zqxz+AjEsHPjzyb5jaHsCLZ7pW8cOJSbyD9mevSh5u4UxgducvUHBR5AFJN34KNyMN
         kIjL+HFZt36P/7VuOjHlrd0yTd96FKCfMNZH1X+fVtHlT1PoGsFuLwv0hklBOHFTbDCI
         DqW8q8SIfOJrwQe/7s1XoP6p5WRr/rWNwqwc7lofcQ9sU1V1yOpJVpMJRyXluUIYMkht
         CX55yuSWQNnah5Wi+pKBe1Noo4PHPu0uIrAcwLD15SvOCSXA6MCjvVxYYvuTYGTNhORU
         ol3J9AsqJvxCTEmL7rSjlgPPvF1Af5o0Y1vzfFJnu/rJb1nBiN/jtyUWKnVQRbAHluPw
         LhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779066559; x=1779671359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zHfRiZ9eAyYIM2WmjAuL1bwyh+6hR9i7GK44MUCPHv4=;
        b=J0AApOJ4Gb08i8ItIhLWkiEhXE58vni+L4gSPdRa52B3YjoJ+vuvBEeXu8k3T5ELrd
         nccRnXXjB0OgJwMGVfdGknj868+zd/n65iDaO0U5+8u6zqdhRw6Bz3XrTuQh34xJWh9q
         obAfFynGnQrfc9JmuAH6gtblx0LdQtrMr7D9EUfO97eZC/UhmCZ6nr2jgOU59ktJExzX
         jxyf+Me1bnkg98JepRZG8wFFCuDH6PNczWexz0H/UjgWv6tsIr8Vl+rh/raODqrVyE0H
         dv7w0nBzprcVuGFHMeHC1lmiRwxCVoJu1sy/V8zLBlW+ZQ3cfE4W3pbltEY3IxQYBDY/
         q1AA==
X-Forwarded-Encrypted: i=1; AFNElJ8djxY3VQD6x0it7N8+Ar5vqqKlq9bRzo4E/qxPW6isyxwx3UfBoglN2N29o/Ht3OxiOenI6V9lYIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFSTMVncEbh9TvHlEvOMorA1LeC/IB65PEmL+mfA0+tKKBS1qP
	AQ8ppVGvegxeg9ef4J+tH6oHQNogYfPYY1s+13SORqYmgqQB+V4Zs7SSMCfsfXIX/68=
X-Gm-Gg: Acq92OGawBGi4sfnjq0AsJhEnbQTwApTW1EZ239cpz7SrnQGbCpl6j7b4/DfgRYc1B3
	6fcPmBsMl1rPX4MwTVb4cCaMGJ16MVzhwxly7CmepLBCSHbEdZ3h97heIheZ3X1/f4n1wjure2f
	3VO683a2K8FH9sc2Dib2g+ghS/5+/As8g8FPYDKd2Y5rLScOiEbxIqX8SsMIDvIH8tmY+QctWoC
	t/Kk4RXlGalrlrCrMuWqtVq+eHpgUGZUgx+AssiTx5K+yzVUTU/n0QFmHv2AtT/jTShKf4FxCnL
	s6ES+5aof7ZhGZBYzhHMCtnaWdbLNMknvWXVHwYIskbg43cxyS1nkF1on51p5dbXwXlLRJGkcmS
	g12osX/4i4e992jyLDYojxV1fwj2VvXRsaArZYY7rA+tJvcy7Pcou+IC6xDrWM31Lmf7uRqZQg1
	H59pnomStXRejeBKFF9WIT/HzuMMQJVzV+6Jf7ceqvH6yhHUM7a34X9eU6S3XhY0jgY06AN6dUu
	cB2IQ/83dn1qojGe5dZgg4b/NGR7xEsmAr7v61KtiGsgcSCy+cjC7eeYaSSB4RL5K72eCVmdD7S
	wRFJnOSGWQcYH6Z7bQ==
X-Received: by 2002:a05:7022:128c:b0:124:9dea:188d with SMTP id a92af1059eb24-1350483d04amr6044192c88.30.1779066558609;
        Sun, 17 May 2026 18:09:18 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm18891372c88.0.2026.05.17.18.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 18:09:18 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 6/7] docs: net: arcnet: remove outdated/irrelevant information; improve style
Date: Sun, 17 May 2026 18:07:26 -0700
Message-ID: <20260518010739.80979-7-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518010739.80979-1-enelsonmoore@gmail.com>
References: <20260518010739.80979-1-enelsonmoore@gmail.com>
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

