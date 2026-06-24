Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch [185.125.25.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7A62F1FE3
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305030; cv=none; b=TJ2ZxezHtPVWKj+WvMliu8wct6yX2et5oHfdAtI4HuuI7QWJ38aTp4r8h72FEKKMfwgWwcWopZEs9H/HsGmmYCBnr4WJ6AygowhFbdpKHCBOapwZAINRWby92KWU9NW0XqB+/ewqGcqc30LiTfGUSu3aipJR/jEDDTYy1k0DQNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305030; c=relaxed/simple;
	bh=93xAucMBtjd1fDzeARtD8IL9FJ97XH4ZQMS+XET3PlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jP/RchXLEfGj8Zt+ta5o3zAYZntCb8iRdapgnfsxkl+9yP16osUqfVwdl49YIju6n9IGrB1DvzcTgFeZODHI+p7qzWxDpzt4vCl95bc/wtiNoL9C1kiD9gEAmzXYIaCAmcqq+iJ0UAj7Tv10BlEsXLlECtXaREhI0uwAKHc43HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=IkzWcyRN; arc=none smtp.client-ip=185.125.25.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="IkzWcyRN"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4glhSX5M94zWJv
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 14:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1782305020;
	bh=L5bOAmofDyOCPWenU8MN+zV0L0U9/GgdGn6C15oNrZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IkzWcyRN3Xfjlp7ceyFBLuvyI5Re17VOiusiaacjw31HkzBQnKT+Gs28m0PDq5HE6
	 tK9gZ8oohWrGppuraB7vjaH4V3DmY/SQn/D+1ktdoB1dZm8QsNLsQQEiRcruS1OvEN
	 1niOqNGvAOAdcrBQKjzTjr2mdM2jylFp3aoA4kdqOu7K3PH3MKJvnAdb/fZd0JIGF8
	 8iTbv7p5UyjhuQil9l/43BA0vuyE4g8/LeYRhKjBpvPV1XaseMHPwjN6iRHrhcyO1M
	 o0gai+dOfNsPfOLS4AfNDT3uQw0iK/oEjtl0YgCpbcyzLw+LAsUd2yu+epLY6qzZih
	 LdR8SJyX0kBbQ==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4glhSX1RVdzH1G
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 14:43:40 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Wed, 24 Jun 2026 14:43:39 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH 2/2] Documentation/arch/x86/amd-debugging: Add section about delay_suspend
Date: Wed, 24 Jun 2026 14:43:26 +0200
Message-ID: <20260624124326.746525-3-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260624124326.746525-1-daniel@gibson.sh>
References: <20260624124326.746525-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Some Lenovo IdeaPad Slim 3 devices and similar with AMD CPUs (so far
observed with Zen3 and Zen3+ CPUs) have a nonfunctional keyboard and
lid switch after s2idle.

It helps to delay suspend by 2.5 seconds so the EC has some time
to do whatever it needs to get done before suspend.

Devices known to be affected are matched automatically, others can
enforce the delay with a amd_pmc module parameter.

This is now documented in amd-debugging.rst

Signed-off-by: Daniel Gibson <daniel@gibson.sh>
---
 Documentation/arch/x86/amd-debugging.rst | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index 3176a1240fee..3725adb42673 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -249,6 +249,31 @@ state entry.
 
 `commit 40b8c14936bd2 ("drm/amd/display: Disable unneeded hpd interrupts during dm_init") <https://git.kernel.org/torvalds/c/40b8c14936bd2>`_
 
+Keyboard and Lid Switch stop working after resume
+-------------------------------------------------
+On various variants of the Lenovo IdeaPad Slim 3 with Barcelo and Rembrandt CPUs
+the lid switch and keyboard, or at least the Fn/Multimedia keys, stopped working
+after resume, until the next reboot.
+
+This was caused by buggy firmware having timing probles, the EC needed some idle
+time right before the CPU cores are suspended, or it got into an inconsistent state.
+
+For laptops that are known to be affected this workaround is enabled
+automatically, to test this workaround on other machines you can set the
+``delay_suspend`` parameter of the ``amd_pmc`` module.
+
+If you need to set the ``delay_suspend`` parameter to fix your machine, please
+report this at platform-driver-x86@vger.kernel.org for it to be added to the
+list of devices that need this workaround, so in future kernel versions it's
+enabled automatically.
+
+Note that the current workaround isn't perfect: On some devices the problems still
+happen if resume is triggered by a timer (wakealarm).
+
+`commit 9b9e60dd31da0 ("platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops") <https://git.kernel.org/torvalds/c/9b9e60dd31da0>`_
+
+`commit 428b9fd2dce50 ("platform/x86/amd/pmc: Add delay_suspend module parameter") <https://git.kernel.org/torvalds/c/428b9fd2dce50>`_
+
 Runtime power consumption issues
 ================================
 
-- 
2.48.1

