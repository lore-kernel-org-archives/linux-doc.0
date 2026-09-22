Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DA743934D
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111728; cv=none; b=dnLN0JklksUgNaZUTECsOsz6XM5NDjaEPD0R7TN2GZ6u/hxfQGWfU8iSGayquXA+YXgjMZFaiv2kiJIKZx6U65Lx/ONCUuU7JgYSqarzh4NXldQtKx5tVCgZ+bgkC5kY0+b62aNNFtNNAZ4B7oz9sDs90LF905OOB66Ua3Im+Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111728; c=relaxed/simple;
	bh=Lw8Yb7xVAhpvlEPLm9wgPbWJkXwWjEC8r3YDgzZq79k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ru8YS2UFe8I6/+azSlcQXhGGmDMEUEaNihPXjiHT/YaGVc6iTvqL8a2/E0nURqN01/GtZH3jURIMyAPM6UDPBhxVjFfvpwOdA0YQMwuKthEIf1F1lM8Y6zsFvjGKM/pwZlc7KoerLNTs0Uk3D0ipxlwn7qslySYIbMlj1lP4bcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7QNS3qF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7QNS3qF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso2937445e9.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111699; x=1790716499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1EGyKqJGOqV+4gQSvb2+qMerdBN610hrMl24gBiU1U=;
        b=l7QNS3qFVAfv5tDtjmoVb24sAtX3dcWMEso9HiTWJN72YXRdFdZCsDLL+GT5hRUI/g
         Hfa33uzxNB3SO71Y3GoHCYShYIAKPK/k2teOpC3+Om+9s1Q0AYO3njMMzM7buXF+WpMh
         V3oGInOqYOvHCSNGv3A/QKmzp3mWGyytNElvD6yTTe2IHLO2kJYKwFOddvBqN8bpDqUP
         5JbzoqocqKY4dkZdJpJ9gbEFPH47aHn68rGNoIUJJCuDQAXtdb4HhiC+YQfCjRI5CB5Q
         yVg+d1uuzKyrdb04CNLQpnjzcQgDWFN8pS944cUNg9vtLhhmBwXJDmXV3h3Ha4H6pXW0
         k3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111699; x=1790716499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1EGyKqJGOqV+4gQSvb2+qMerdBN610hrMl24gBiU1U=;
        b=Kf8xEHMEPSCQ7kYNjajq4QS7jcuyo0GZMsykFVq3Btd0TRFYoGE0KrMUM/5jVoCqyd
         zZNqd8W0xB9v0baPSunQAjg75IlBYuBuxaoIIhvxyUDq5usWuiIB1F8GUyXuleKXC+YF
         UM/B3uctVwwq+UW8KgXMRAcTsy906BQ4of6Q9t8EVuxs7tSvRbYi58obXyttITTg00Bn
         +UYCbTgFr82pqNqYP5HbNj8su/jPqOzgY+dXVF1yhYqEr6tBbNCz1ITUjYwpPzv2/kvr
         /lCv5wQpYwP3AtqTMNU4XlGANGlhBH+XgdZUnPiNXt8rYXGsE6mGiDDwv5lzUDJXHB7c
         hlSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm0Zbfp5mDRy2TEG8hBbfq/s8gssNpO0toVL6Px5qAKQ/O/3mM/8lflvILOpInyOes0Gk4lpgu/Z8=@vger.kernel.org
X-Gm-Message-State: AFuF++nuQYowX/02HA58Y5xO75uESfkH/8Mv2G6buWFkS9hTWPzCPvzo
	mz6sol3Ugq6BCvYr/7M5Gd1U10nfRzoAmZN+I7zZ/Y1bf8mNBSJcK/cY
X-Gm-Gg: AYBFou3Oj+L4rHHSrcUp5Akb24DpshY2V7RM8DIujY7OH3qqthtmOYRbaFwaCubYM1s
	KKzUN+NGx/ooil5848DxBJs/39fs92ex4p77bquT/13zZ5nZsWwN4XjG+thqlcaLbpSqvDrGuP+
	ACdI549X+j4k4Usag99x5SyWxa5UbWSxEJRBNMxxYCXPv2YhS53jEiTNWmaCiZ0eQcSwL35DOX4
	xilR7/200HhS06JSlXZ1IrRt1kbKWT9ns5ChBqaNwoPLRcTBz6e7LvExxfYBpVbjAo/vDnetEvf
	KCA6cpCY973J1EjSn1CfKTHS75HApuVzlDBLCmq1WJNssE7YY4Z6vCUvC1UR78KW32DOyaGb2ou
	eicvf6V+cU7XDrJfUsxrcbVI4XGPrF2wm2GUmSVzN1O3OJiV3i06gJ9X+086aL+HkYQfEDw13j/
	j0FZ9HXMqOVE0ZRh0c/wuliUdcLnUNzg+TH4MwIJQuX34apaTf/camOvlYu+ftm9C004R3sCt8g
	J/ec99Mc/qhcaEpXzs=
X-Received: by 2002:a05:600c:c492:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49fdf103f38mr5120925e9.13.1790111698725;
        Tue, 22 Sep 2026 14:14:58 -0700 (PDT)
Received: from christian-ThinkPad-T470.. ([2a03:4460:170d:5700:7168:5af1:a975:cf85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm1221672f8f.2.2026.09.22.14.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:14:58 -0700 (PDT)
From: Christian Melendez <chrismelnu@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Melendez <chrismelnu@gmail.com>
Subject: [PATCH 1/2] Documentation: dsa: b53: fix stale tagging-support section
Date: Tue, 22 Sep 2026 23:14:38 +0200
Message-Id: <20260922211439.369917-1-chrismelnu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAOiHx==_ixY-VNWX=XxqCFoJvE-80i+r2y6SNnxwQe9uZQJL6w@mail.gmail.com>
References: <CAOiHx==_ixY-VNWX=XxqCFoJvE-80i+r2y6SNnxwQe9uZQJL6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

5325/5365 were listed under "Configuration without tagging support".
b53_get_tag_protocol() assigns them DSA_TAG_PROTO_BRCM_LEGACY_FCS
(commit c3cf059a4d41), implemented in net/dsa/tag_brcm.c. Move them to
the tagging-supported section.

539x/531x5, the only chips left in that section, get no special case
in b53_get_tag_protocol() either. The section and its config examples
no longer apply to any b53 switch, so remove them.

Link: https://patch.msgid.link/CAOiHx==_ixY-VNWX=XxqCFoJvE-80i+r2y6SNnxwQe9uZQJL6w@mail.gmail.com
Signed-off-by: Christian Melendez <chrismelnu@gmail.com>
---
 Documentation/networking/dsa/b53.rst | 151 +--------------------------
 1 file changed, 3 insertions(+), 148 deletions(-)

diff --git a/Documentation/networking/dsa/b53.rst b/Documentation/networking/dsa/b53.rst
index 1cb3ff648f88..b67864b2d314 100644
--- a/Documentation/networking/dsa/b53.rst
+++ b/Documentation/networking/dsa/b53.rst
@@ -23,9 +23,6 @@ CPU interface, conversely, the CPU network interface should insert a similar
 tag for packets entering the CPU port. The tag format is described in
 ``net/dsa/tag_brcm.c``.
 
-The configuration of the device depends on whether or not tagging is
-supported.
-
 The interface names and example network configuration are used according the
 configuration described in the :ref:`dsa-config-showcases`.
 
@@ -35,149 +32,7 @@ Configuration with tagging support
 The tagging based configuration is desired. It is not specific to the b53
 DSA driver and will work like all DSA drivers which supports tagging.
 
-See :ref:`dsa-tagged-configuration`.
-
-Configuration without tagging support
--------------------------------------
-
-Older models (5325, 5365) support a different tag format that is not supported
-yet. 539x and 531x5 require managed mode and some special handling, which is
-also not yet supported. The tagging support is disabled in these cases and the
-switch need a different configuration.
-
-The configuration slightly differ from the :ref:`dsa-vlan-configuration`.
-
-The b53 tags the CPU port in all VLANs, since otherwise any PVID untagged
-VLAN programming would basically change the CPU port's default PVID and make
-it untagged, undesirable.
-
-In difference to the configuration described in :ref:`dsa-vlan-configuration`
-the default VLAN 1 has to be removed from the user interface configuration in
-single port and gateway configuration, while there is no need to add an extra
-VLAN configuration in the bridge showcase.
-
-single port
-~~~~~~~~~~~
-The configuration can only be set up via VLAN tagging and bridge setup.
-By default packages are tagged with vid 1:
-
-.. code-block:: sh
-
-  # tag traffic on CPU port
-  ip link add link eth0 name eth0.1 type vlan id 1
-  ip link add link eth0 name eth0.2 type vlan id 2
-  ip link add link eth0 name eth0.3 type vlan id 3
-
-  # The conduit interface needs to be brought up before the user ports.
-  ip link set eth0 up
-  ip link set eth0.1 up
-  ip link set eth0.2 up
-  ip link set eth0.3 up
-
-  # bring up the user interfaces
-  ip link set wan up
-  ip link set lan1 up
-  ip link set lan2 up
-
-  # create bridge
-  ip link add name br0 type bridge
-
-  # activate VLAN filtering
-  ip link set dev br0 type bridge vlan_filtering 1
-
-  # add ports to bridges
-  ip link set dev wan master br0
-  ip link set dev lan1 master br0
-  ip link set dev lan2 master br0
-
-  # tag traffic on ports
-  bridge vlan add dev lan1 vid 2 pvid untagged
-  bridge vlan del dev lan1 vid 1
-  bridge vlan add dev lan2 vid 3 pvid untagged
-  bridge vlan del dev lan2 vid 1
-
-  # configure the VLANs
-  ip addr add 192.0.2.1/30 dev eth0.1
-  ip addr add 192.0.2.5/30 dev eth0.2
-  ip addr add 192.0.2.9/30 dev eth0.3
-
-  # bring up the bridge devices
-  ip link set br0 up
-
-
-bridge
-~~~~~~
+Older models (5325, 5365) use a different, legacy tag format, but tagging
+is supported.
 
-.. code-block:: sh
-
-  # tag traffic on CPU port
-  ip link add link eth0 name eth0.1 type vlan id 1
-
-  # The conduit interface needs to be brought up before the user ports.
-  ip link set eth0 up
-  ip link set eth0.1 up
-
-  # bring up the user interfaces
-  ip link set wan up
-  ip link set lan1 up
-  ip link set lan2 up
-
-  # create bridge
-  ip link add name br0 type bridge
-
-  # activate VLAN filtering
-  ip link set dev br0 type bridge vlan_filtering 1
-
-  # add ports to bridge
-  ip link set dev wan master br0
-  ip link set dev lan1 master br0
-  ip link set dev lan2 master br0
-  ip link set eth0.1 master br0
-
-  # configure the bridge
-  ip addr add 192.0.2.129/25 dev br0
-
-  # bring up the bridge
-  ip link set dev br0 up
-
-gateway
-~~~~~~~
-
-.. code-block:: sh
-
-  # tag traffic on CPU port
-  ip link add link eth0 name eth0.1 type vlan id 1
-  ip link add link eth0 name eth0.2 type vlan id 2
-
-  # The conduit interface needs to be brought up before the user ports.
-  ip link set eth0 up
-  ip link set eth0.1 up
-  ip link set eth0.2 up
-
-  # bring up the user interfaces
-  ip link set wan up
-  ip link set lan1 up
-  ip link set lan2 up
-
-  # create bridge
-  ip link add name br0 type bridge
-
-  # activate VLAN filtering
-  ip link set dev br0 type bridge vlan_filtering 1
-
-  # add ports to bridges
-  ip link set dev wan master br0
-  ip link set eth0.1 master br0
-  ip link set dev lan1 master br0
-  ip link set dev lan2 master br0
-
-  # tag traffic on ports
-  bridge vlan add dev wan vid 2 pvid untagged
-  bridge vlan del dev wan vid 1
-
-  # configure the VLANs
-  ip addr add 192.0.2.1/30 dev eth0.2
-  ip addr add 192.0.2.129/25 dev br0
-
-  # bring up the bridge devices
-  ip link set br0 up
+See :ref:`dsa-tagged-configuration`.
-- 
2.34.1

