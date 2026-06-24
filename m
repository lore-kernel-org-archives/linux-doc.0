Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CB830E0D5
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305031; cv=none; b=ANqVlPdr9gsYdm7s+4LLwj/lDO0VsN9dq1JRAjghUg+A7kdKSyDeqnlzXotwNqhxKxLucFUUBr7CT2H6wnNOXkb9Fdpz+wteYFtDLlf0e90rqu0n9AGhIRox6SfnSKF3VyD54G7MbLILcoUgZjJkH4ioBmXBdDfPLYeb8F/2n0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305031; c=relaxed/simple;
	bh=iTAkXKuXCZABcRKYI+t1I26QjTyeIJhPrFwGAQUWFA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XuApzLHhQltWg+f8dQcywHnLyy/8lTHwG8CXmY39S594QHDMuwWp8iThxd5Ptvqn4Bs8LX/alm/cdKJ3cMEjS3++PH/L+lH4p0GTiKbN00kdoe9n7R9NvvQBgV/j5TZXHDnpJk06NiCmRbxcMT3InEyyo91dVbii6cvEZL1gtNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=iSyNhOFC; arc=none smtp.client-ip=83.166.143.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="iSyNhOFC"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4glhSX524ZzD1k
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 14:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1782305020;
	bh=BVGkX6nUb5OtyGC8SuCZVGg5ZXLxgwpebq71bwi4WGs=;
	h=From:To:Cc:Subject:Date:From;
	b=iSyNhOFC58xZ885cNjerHD5vfVETTc4rt897PxydCEJxEN8sZ3mlmdxqFRBfv6RTG
	 ZB/ZwzfmLVgmE14Jvjv9WMSqgLBvfSNsDK/Q5SjWoXUoMj2zaq5nJdfjEnpWv/XlHm
	 T7Ez3lc4h09WVs8dRZTLRGOtlTFAMSw/tQbOOp8MXu66DX+bCQjHb3XIisWmRjBJIS
	 TRPkyf0JWapUlAiCoxeuyRwVOygTi554um+LVymzkWEFaeDEbj2n3TfsIhUiQ/57LY
	 CZ8dqFLnKQdu82kXjC+vux6UVwCi8rtUtr/UqOcfEjKUh6GuHHeniS5jGKDkHdZ2Y0
	 HH+bytDor+keA==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4glhSX1XHkz44C
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
Subject: [PATCH 0/2] Document amd_pmc delay_suspend quirk
Date: Wed, 24 Jun 2026 14:43:24 +0200
Message-ID: <20260624124326.746525-1-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Recently I submitted patches that work around an EC bug in some Lenovo
IdeaPad laptops by adding a quirk to amd_pmc that is enabled
automatically for detected devices and can be enforced (to test on
possibly affected devices that aren't detected yet) with the
delay_suspend module parameter. The quirk makes the kernel sleep
for 2.5 seconds before actually suspending.

Now that those patches are in mainline and their commit IDs are known,
I submit the documentation for them, which refers the commit IDs.

There's also another small change to the same documentation file that
clarifies how to identify kernel log lines with information from the
reset register, because so far it was only mentioned that this
information is logged, but not how to find it.

See also https://bugzilla.kernel.org/show_bug.cgi?id=221383 and
https://lore.kernel.org/platform-driver-x86/20260611150426.3683372-1-daniel@gibson.sh/T/#u

These documentation changes were last discussed here:
https://lore.kernel.org/platform-driver-x86/20260509013105.816339-5-daniel@gibson.sh/t/#u

Daniel Gibson (2):
  Documentation/arch/x86/amd-debugging: Add example for reset register
  Documentation/arch/x86/amd-debugging: Add section about delay_suspend

 Documentation/arch/x86/amd-debugging.rst | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.48.1

