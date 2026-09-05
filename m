Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2E43EC69C
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601646; cv=none; b=D5V9dCbd6Tis8DX29sBq4tcxmCCt5SURbfFk2JAn14SMBMBy9nES8vxhrmPvAS+2zDN/Op5TYing/YGcHYuyIfhE8buetTdprOykJ3rQQwG5aq+zcZbUKlW/VnLcRhK+WQtER4al5GDQ372xKDD7RqKmM/ZnLhwUqKA679g0910=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601646; c=relaxed/simple;
	bh=iIEWAYVGI2FzX5iZTyH81lDATptMQacAG0wTPy+abXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KoTksIWoqAQPYv2pRs3ncrtvSehegcfx+vB8Ip4tOwTTRm3s/Jv9sGl/s+tnDoJoSPvWGtOes3MfcHijfSSl41wNNM9RE97uiDHBLA3fT1zLyX+mgK/cFJETZRqc9RIQjScJKK9qTFYw/Z95T59cFhHiF0oj6pdOk29PZN8MFSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyvrpKrH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyvrpKrH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e397f74so2283223f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601635; x=1789206435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=WyvrpKrHJwVM/8ZcX1GSWFju4g14O4oDahiOI0OS+wcnypQuvsomCZxxoNsngGdcpS
         iMNMMyLbpjtmvW/EWl4iZ53rr0WuVL50Je9Pi/ewScX5oXjVlbyTy66vsM00pKJDHekp
         zbXJPoTpg2PVAHDnNeCDSEqB6+IXMYfMRVEYlxkySrV1FIftT3xdeKrCHXTmz2dCvBqi
         G7Nx24hz/S/2cGB8bDg0xlI/4JzXD2cIxs27X9WE+cEHW97xbSD60x2O4TuuUiiEtmMN
         gLz7tKdUexx74iuFiJ5OWz548lW326b3vnw9JZ0uUDJlkfikeabOhE0wjsV0JZs8aZoF
         EjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601635; x=1789206435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=lXuaHEThQKgpmz1NFKJT9s5DY+jCOaCou9g8fCXz+/qh+xIHU8rafsA3gxQuzPqww0
         xfgQhlk7Pqq+5r7Wq045LLuh0yS/ajYDBwpqbB/Gbzwfou6vwqTL4Ro1z4mVBclbIXWq
         qPCROBM7fvNnIDmMHH4+QpXGKyYiEdN5daIysvVzZ4ygIGeD+dQe00w2oPTCIHADj1L3
         mR/U/WKQco3xJTP6amizIO5jiXHmvpHGSfLPskNXsz6A+H05FD12vVzeGuwMTvx5+CnY
         o9n5z1qFtft3KRqDLc2ff/bxesdJ4rZz+ZDY+DsjMkObcQrnOzTr4NJ4DXpdmIArim0l
         CNgg==
X-Forwarded-Encrypted: i=1; AKwUvBy0gLKcrSqPheONzJCHVENsbzHHXHt6eW7sz48RtO17GEP/LlmsNylJgVogTH7IO7FHT1Gopsus7CU=@vger.kernel.org
X-Gm-Message-State: AFuF++mjQPm0T04+2G3tlGiotnI/H8TTe8fqmpyrgb3XxhEj4fLvCdfb
	Bqq7v7w0C4eyzGN4RpQ28WFWjqXeJXeW7dXawIEhKbRcgvfwTb5GqFBG
X-Gm-Gg: AYBFou31TbrBxwbOoV/Wp3ixUuTEwwTVSraYDIFWTkzDpUw0bkFRIuymgww5d0BUXrn
	d3aGKsDoJ3dKSnUbwXICaXfb5JlLHZ0a5ZmeHR84BvqARQdgjMddkDREoveLn6mxP1pXfUADHH+
	bxFiZ2UCVYfRB4Tn9SJTKW0KkINKHfyic8GZRkUkmY5hS4yZuD0eJ++JzyYle3hQNIaAKP84TwB
	MpGzhy7Sj+8jk7bE3g3xNnD2ENEFcvdAqXp/kglh6P5ViLTRW0jNLM5oekB8KFPGRv70Ynd690c
	kxsvPSWlCCQDDWI4xFchiic6z22mu3VVWBe5x2K3jXeEuVaJC/7wxdm6N98QdZfTAO4G8F1V2wo
	KJb80ujwbn34KJgAwD1C5faKxIIXLVlHLDheNoOeheEg4qJYeVTn/UqbtDT774gWHq3I1UeE9/q
	IhtTMiAESt4bcDtY0+GM9xzlUzGz00wvGTJpDGuBGKLbEeyB0Ek9fTk8pnanAre/Bl5Stb0x/yT
	LHAmeV/Tv06e39ElG2MkCsSOSmdABXmga1owaLgO9NZZylenpu+6NNeo7Vmlf2M1F6rnkFeQSqe
	HyQUW7qhw3HDn3mOhKr9ckJvMXQPf1nAQqBAEi+4Oi3l/BVBzpwUqumGysJKuhVGBws=
X-Received: by 2002:adf:ecc6:0:b0:484:49f8:b56a with SMTP id ffacd0b85a97d-4857e4f4adamr18253955f8f.8.1788601634554;
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 11:46:48 +0200
Message-Id: <20260905094649.41996-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0

