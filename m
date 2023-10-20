Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDBD2032B
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3F5D55;
	Fri, 20 Oct 2023 11:11:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 55E1320108;
	Fri, 20 Oct 2023 20:11:00 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXhLEAKQk6QO; Fri, 20 Oct 2023 20:11:00 +0200 (CEST)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr [83.192.234.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id 2F0F620107;
	Fri, 20 Oct 2023 20:11:00 +0200 (CEST)
Received: from samy by begin.home with local (Exim 4.97-RC1)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1qttxb-0000000Bn3d-2PL5;
	Fri, 20 Oct 2023 20:10:59 +0200
Date: Fri, 20 Oct 2023 20:10:59 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] speakup: Document USB support
Message-ID: <20231020181059.7rtj2csi7t6vorrm@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170609 (1.8.3)

Speakup has been supporting USB for a while already.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

diff --git a/Documentation/admin-guide/spkguide.txt b/Documentation/admin-guide/spkguide.txt
index 74ea7f391942..0d5965138f8f 100644
--- a/Documentation/admin-guide/spkguide.txt
+++ b/Documentation/admin-guide/spkguide.txt
@@ -7,7 +7,7 @@ Last modified on Mon Sep 27 14:26:31 2010
 Document version 1.3
 
 Copyright (c) 2005  Gene Collins
-Copyright (c) 2008  Samuel Thibault
+Copyright (c) 2008, 2023  Samuel Thibault
 Copyright (c) 2009, 2010  the Speakup Team
 
 Permission is granted to copy, distribute and/or modify this document
@@ -83,8 +83,7 @@ spkout -- Speak Out
 txprt -- Transport
 dummy -- Plain text terminal
 
-Note: Speakup does * NOT * support usb connections!  Speakup also does *
-NOT * support the internal Tripletalk!
+Note: Speakup does * NOT * support the internal Tripletalk!
 
 Speakup does support two other synthesizers, but because they work in
 conjunction with other software, they must be loaded as modules after
@@ -94,6 +93,12 @@ These are as follows:
 decpc -- DecTalk PC (not available at boot up)
 soft -- One of several software synthesizers (not available at boot up)
 
+By default speakup looks for the synthesizer on the ttyS0 serial port. This can
+be changed with the device parameter of the modules, for instance for
+DoubleTalk LT:
+
+speakup_ltlk.dev=ttyUSB0
+
 See the sections on loading modules and software synthesizers later in
 this manual for further details.  It should be noted here that the
 speakup.synth boot parameter will have no effect if Speakup has been
