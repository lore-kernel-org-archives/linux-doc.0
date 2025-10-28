Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB124E00F
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761615949; cv=none; b=ekBxKZ2Sgu7cjwMJJyw4UETtpLPLmWgPShMyvkgQT4TwinSM2W82QDBXhG/MPg/Vp5Ylvxs38kMoQM48+XyaAsR2GPgcU7CGscVwdy85HVlMNlCFwoIzgZetSMN10SFuK7J67cUxyWVilxGz1zmWILuxh2pP7o74NsenttP9nG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761615949; c=relaxed/simple;
	bh=GF+MC882OMnI8S27LLYciURvp0ZasVg7CZfx3nxVP9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rivlptkbkMXiFDmRfCiI05KQjm9XzSKfnvuTZkfp+JyhlaGIH/i0Ckn+vrxmMqu+w9sLOsg2Xc+UZ/ntofwPGXbMWK21HIy7W9kGBKW412AtWBBEMeSdAZkKcjojoYYIFEMUjLi+yjCxabtbmJib37BAlbLOVx+Oy+WCGNXgpDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4Bte/Aj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4Bte/Aj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so5280658a12.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 18:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761615946; x=1762220746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tpNWD1OK7YuCBqN99mwKFZZzGomTddAkF6+EFAt55o=;
        b=O4Bte/AjRy6+2MxCF80R6ZMqXyqPIOI6u+rKhmJfqcIJvKBY3O9qhEP3ipN0iUeJmc
         mOYn9PiPuowIdXBlasDfRE7m/Un/ljRi2NBGxdceJSESHNH/kGIReIMtihCuy2u1VTlS
         mnkjdU82X2OB4a6fhtouiiX7p841Dc7eyseCSnqpXC50d7OjHivCRt83F/QWXrj0V3XK
         73zgjXA+N4k7l6r/s5ln+NQ+Pbq8qafL475d0VO55rHo8U7kSYrqRu4JisPJsexAxQTB
         G8Uo2AP1A1oboaGyY3a4ukWnmoTRG0eJn4qqT/ob7jpOw7c9lTo806m7s+NVZgnC177W
         T4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761615946; x=1762220746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tpNWD1OK7YuCBqN99mwKFZZzGomTddAkF6+EFAt55o=;
        b=AfgyDwHdbwwCa79dVS8h0AxU0dY2xOe45ceUkQrseZlHS5mxjSBLJ1Pw/Xt1xigN4X
         QqbU+IEg50cxkF39WfIsbzgCf228Qcyy5MUv/vCD1FI4YPyBwqW1CpHrjDyQapQQkS/Y
         +/WuL2J07qzPXABFIWtCiwqX3U53jmkBmRuhDR3fwyWdl2v0E80fv/DWvXZVGHi1D15l
         hh0ZQ7g/7yT6Y6yOZg9RON05YkCc6DPFG5T8YsfqaRPr1q0Y3W9HJ4DnSWlh8K8Bd4Yy
         dY0l4hRnsi7YExrf/H4jb6j4DUfIBIMVXIhWMpCpjNqU1Toy70ELjyolL1brx7tETpnk
         vm6A==
X-Forwarded-Encrypted: i=1; AJvYcCUerPRFxSdCTx1UCiyoCYYfsNm7hbxa+zUxr1lI05bogQcdqALYp3474lDIMK2TtkFBMRDsIOQmGOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvsdBOIiOxl+jNI8/TDWVJZ8KLSRlCicb3gOz3nqJuK2SQgSgV
	9dBD6/w5bS5tW44fH+aX2dJAwmC1lY5dhlLsXZNpNHn5kdYp9OcQRhAL
X-Gm-Gg: ASbGncufYx3SbkwXJWbHzsvHb7ZUfBT4FqxIigJWm3VmWcD8/tGp1+Mr6gLjU6jyso3
	PjB14SvuIE6QCbCk0ejRu4a98T9udnQXSm7p+pt0yhgr6IfRPOYEeD841e1UqBMLP99CAHwne/B
	Eo3Fgc9C5hT5CE7MA9hGnvMo9tb1tiPCp65PcJZ+OUsrl8u/59gK+erC2gwRmcb1i9C2L3iZ1vO
	MHytavx6nfAaLX5gcjRlDD3v449JNvwR1P+bK4UNlEAymM2NZXIqn/ucJ1IuIh5CQN9EtzqI0rb
	rX6LQUwlmdoP38mHgEGuG7QWoUN/Aa2J5j9WEQy2Q4N3hi+rMyknSiUoRa0Ft5hSaRyYFRIlDfA
	gAk2sPqp8z1ho7hTu8FBpvi8dhGQTPZAWYIYM5aTvuUOa80dbMdA4IP62UmBLYXc/qebne/dHtW
	Tr
X-Google-Smtp-Source: AGHT+IH0lOAi/qG58mWc3adb00/uN60NZKYFZ4tDXmtuyg+Eh2qzzh+KgjeO94z2Zpez7W5wBjLdzg==
X-Received: by 2002:a17:903:38c8:b0:27d:6995:990d with SMTP id d9443c01a7336-294cc72935emr14333235ad.19.1761615945478;
        Mon, 27 Oct 2025 18:45:45 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e495e8sm95878565ad.110.2025.10.27.18.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 18:45:44 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A10954209E50; Tue, 28 Oct 2025 08:45:42 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Avery Pennarun <apenwarr@worldvisions.ca>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next v3] Documentation: ARCnet: Update obsolete contact info
Date: Tue, 28 Oct 2025 08:44:52 +0700
Message-ID: <20251028014451.10521-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6570; i=bagasdotme@gmail.com; h=from:subject; bh=GF+MC882OMnI8S27LLYciURvp0ZasVg7CZfx3nxVP9o=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkM8jOl2qfya964IqC5+ljNpGXLn242nnttqu/11EnKG j+knlsKdJSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiNbKMDCvbHDJnccXMaVw3 b39xgEqXqbmmjF/2l2052w+2CB6cYMLwT4vxQsU//rrnk43sOz/0fJn6mWvyMfl96qu8E30vfr9 /hx0A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

ARCnet docs states that inquiries on the subsystem should be emailed to
Avery Pennarun <apenwarr@worldvisions.ca>, for whom has been in CREDITS
since the beginning of kernel git history and her email address is
unreachable (bounce). The subsystem is now maintained by Michael
Grzeschik since c38f6ac74c9980 ("MAINTAINERS: add arcnet and take
maintainership").

In addition, there used to be a dedicated ARCnet mailing list but its
archive at epistolary.org has been shut down. ARCnet discussion nowadays
take place in netdev list. The arcnet.com domain mentioned has become
AIoT (Artificial Intelligence of Things) related Typeform page and
ARCnet info now resides on arcnet.cc (ARCnet Resource Center) instead.

Update contact information.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v2 [1]:

  * Update ARCnet info link (Randy)

[1]: https://lore.kernel.org/linux-doc/20251023025506.23779-1-bagasdotme@gmail.com/

 Documentation/networking/arcnet-hardware.rst | 22 ++++-----
 Documentation/networking/arcnet.rst          | 48 +++++---------------
 2 files changed, 21 insertions(+), 49 deletions(-)

diff --git a/Documentation/networking/arcnet-hardware.rst b/Documentation/networking/arcnet-hardware.rst
index 3bf7f99cd7bbf0..20e5075d0d0e7d 100644
--- a/Documentation/networking/arcnet-hardware.rst
+++ b/Documentation/networking/arcnet-hardware.rst
@@ -4,18 +4,20 @@
 ARCnet Hardware
 ===============
 
+:Author: Avery Pennarun <apenwarr@worldvisions.ca>
+
 .. note::
 
-   1) This file is a supplement to arcnet.txt.  Please read that for general
+   1) This file is a supplement to arcnet.rst.  Please read that for general
       driver configuration help.
    2) This file is no longer Linux-specific.  It should probably be moved out
       of the kernel sources.  Ideas?
 
 Because so many people (myself included) seem to have obtained ARCnet cards
 without manuals, this file contains a quick introduction to ARCnet hardware,
-some cabling tips, and a listing of all jumper settings I can find. Please
-e-mail apenwarr@worldvisions.ca with any settings for your particular card,
-or any other information you have!
+some cabling tips, and a listing of all jumper settings I can find. If you
+have any settings for your particular card, and/or any other information you
+have, do not hesitate to :ref:`email to netdev <arcnet-netdev>`.
 
 
 Introduction to ARCnet
@@ -72,11 +74,10 @@ level of encapsulation is defined by RFC1201, which I call "packet
 splitting," that allows "virtual packets" to grow as large as 64K each,
 although they are generally kept down to the Ethernet-style 1500 bytes.
 
-For more information on the advantages and disadvantages (mostly the
-advantages) of ARCnet networks, you might try the "ARCnet Trade Association"
-WWW page:
+For more information on ARCnet networks, visit the "ARCNET Resource Center"
+WWW page at:
 
-	http://www.arcnet.com
+	https://www.arcnet.cc
 
 
 Cabling ARCnet Networks
@@ -3226,9 +3227,6 @@ Settings for IRQ Selection (Lower Jumper Line)
 Other Cards
 ===========
 
-I have no information on other models of ARCnet cards at the moment.  Please
-send any and all info to:
-
-	apenwarr@worldvisions.ca
+I have no information on other models of ARCnet cards at the moment.
 
 Thanks.
diff --git a/Documentation/networking/arcnet.rst b/Documentation/networking/arcnet.rst
index 82fce606c0f0bc..cd43a18ad1494b 100644
--- a/Documentation/networking/arcnet.rst
+++ b/Documentation/networking/arcnet.rst
@@ -4,6 +4,8 @@
 ARCnet
 ======
 
+:Author: Avery Pennarun <apenwarr@worldvisions.ca>
+
 .. note::
 
    See also arcnet-hardware.txt in this directory for jumper-setting
@@ -30,18 +32,7 @@ Come on, be a sport!  Send me a success report!
 
 (hey, that was even better than my original poem... this is getting bad!)
 
-
-.. warning::
-
-   If you don't e-mail me about your success/failure soon, I may be forced to
-   start SINGING.  And we don't want that, do we?
-
-   (You know, it might be argued that I'm pushing this point a little too much.
-   If you think so, why not flame me in a quick little e-mail?  Please also
-   include the type of card(s) you're using, software, size of network, and
-   whether it's working or not.)
-
-   My e-mail address is: apenwarr@worldvisions.ca
+----
 
 These are the ARCnet drivers for Linux.
 
@@ -59,23 +50,14 @@ ARCnet 2.10 ALPHA, Tomasz's all-new-and-improved RFC1051 support has been
 included and seems to be working fine!
 
 
+.. _arcnet-netdev:
+
 Where do I discuss these drivers?
 ---------------------------------
 
-Tomasz has been so kind as to set up a new and improved mailing list.
-Subscribe by sending a message with the BODY "subscribe linux-arcnet YOUR
-REAL NAME" to listserv@tichy.ch.uj.edu.pl.  Then, to submit messages to the
-list, mail to linux-arcnet@tichy.ch.uj.edu.pl.
-
-There are archives of the mailing list at:
-
-	http://epistolary.org/mailman/listinfo.cgi/arcnet
-
-The people on linux-net@vger.kernel.org (now defunct, replaced by
-netdev@vger.kernel.org) have also been known to be very helpful, especially
-when we're talking about ALPHA Linux kernels that may or may not work right
-in the first place.
-
+ARCnet discussions take place on netdev. Simply send your email to
+netdev@vger.kernel.org and make sure to Cc: maintainer listed in
+"ARCNET NETWORK LAYER" heading of Documentation/process/maintainers.rst.
 
 Other Drivers and Info
 ----------------------
@@ -523,17 +505,9 @@ can set up your network then:
 It works: what now?
 -------------------
 
-Send mail describing your setup, preferably including driver version, kernel
-version, ARCnet card model, CPU type, number of systems on your network, and
-list of software in use to me at the following address:
-
-	apenwarr@worldvisions.ca
-
-I do send (sometimes automated) replies to all messages I receive.  My email
-can be weird (and also usually gets forwarded all over the place along the
-way to me), so if you don't get a reply within a reasonable time, please
-resend.
-
+Send mail following :ref:`arcnet-netdev`. Describe your setup, preferably
+including driver version, kernel version, ARCnet card model, CPU type, number
+of systems on your network, and list of software in use.
 
 It doesn't work: what now?
 --------------------------

base-commit: 5f30bc470672f7b38a60d6641d519f308723085c
-- 
An old man doll... just what I always wanted! - Clara

