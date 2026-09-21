Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C281EE7B7
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979529; cv=none; b=ui9O+PK0+X89ZF4xE83JQ7PT6JEyHUL/wd3TXqs9Q1U/7Finv9CA4KTYQqlIp8VQtc3RZS4eCXv10QUhhcKsxNu+VGMvUgSZ1NMEeNnZGG9N9QEpIYoCmOoikfcU9dIWKiFOPH0dVLeXG9cWbNLbjGItAkc0OpUz0chQ1E3o6cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979529; c=relaxed/simple;
	bh=860756huuxTsYaOV05Q1CFeg29UL1jF6ZrsU6euO+3g=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=dSTjdl2C39ouLRlQ78X6hfIsbpD0l/PWvgqO1Is5ExKFnTML6g3yE1HUreW2v+y+rF1hkgjuWRl7gkRRvnWXTYa8fzS5AX9fX0raCL/GbAuImrbJmCLSlexIaOFTyLNnCjAM859q5lxwLT29wxMZ3OIh2FC8+LnghDaAAJMZ3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLFtWiKn; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLFtWiKn"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35611so1705492b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789979527; x=1790584327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:to:content-language
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4j/DdDm9e1GlBGFZ0GjXGiaS1V0xkGBQyaHHJnud4q0=;
        b=dLFtWiKn/ZIeCWyYnnqPefNxPNcCwdO11YjIdSF3WVSUYoQuMye3nH5402aY0A47oC
         qPWLXXT9z7LbReTrA6OEMOTAAvDx2DeHJwEdetT74mo0mbbGRQtey04IyfL+0qCtl8vN
         zJung6mDP6ilWc3zbGpI7wCPnbiySFVQghZ19i547EopUG828S/dBzek/9ogsARk9Fl6
         7gMJwexrxBm4C8g7dkR5r/svPf2qFoCdjOWzrRyfn+s4dfYb8ZTcL3WLtGevA5HHyaNe
         aZvcjECovkelsUMiCG0K+uZTHMKc0ihakdYbzuODHVj9C0A2ts+JCRVG4gBDPmukxVY6
         BvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979527; x=1790584327;
        h=content-transfer-encoding:content-type:subject:to:content-language
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4j/DdDm9e1GlBGFZ0GjXGiaS1V0xkGBQyaHHJnud4q0=;
        b=S4nHwjWXpoxMA1F8yP2Yj70SV8HNV2jlHrdZaV5HYo9eFJ6sQWXoM+aw1ZF//gwUbT
         UBER1XgBJsCahiglJ7F7pQeqKWThsroZgXKVejxVNURMIhyN1RksR7z5kNi7G+621zc/
         eCDJiGuUu2EEsNAyqqGCFEn4BlXIC8hkFaXQRX7HE7L6HrGA3MfCwXSS0d6/KH4N0rUZ
         EJZII3X8dMQ4H8YQ/uKXdVWqaRdB0FBrR5HoVh4bNS5/2h2730SFAzhPeegf/BDC62pV
         pnIpd8LYXjNHn2YBIWW4xF9VOr4pImKh2mgCxc6zYvEGKKUGMn8Lc1k5c3JCSzFLgXFK
         H7bA==
X-Gm-Message-State: AFuF++lsfCWbGFqnc9eg3svzw3jWLCHGYfczQl63psTAHznepZ0FBzug
	XM0iCgeUYu0jc+S5mKg154DvgCyGMLeKovuaWlXuHX/bum3AM7NUDyNHyxygog==
X-Gm-Gg: AYBFou2mhSYllFIS+qlUAuzmzQMBNHWsjzBF8sj3CQoRA1KRrq86Ryub+nLC7zCf+tf
	euaa2SYFUfZezlKbOxY6pFUuI3Sy3Zba6iN3/bLhqs8jntZ357m5A28lUSl2JIC0aMLicVRHjGo
	jr7LYpOEcsHE/khWwn0c3+/I8EVOZWjRSvN2Q89RIkcjKCWOEFf3LcFrrE2Nvc6OIkUNlo1lm1V
	CC+FwxaBOZmQOLD2xfRn+rII9eUJADzXVcgriNly10n2YBVzzku7a9BJAv27YxItG+2wPocaXZQ
	XwZR0FTbLBS3gQ17KcmvoKhE/bcRCer0DHKhm1pvNBq/N41T4xNdZLQtTEpQGSdINvzxcLUx7aB
	gdUpmhzdJANHWTCDYdPaM/2co0ATCr3LGRmCD+t4JhKHYIRZYLrbzc/YNx26IwRbMgHAqVRsC5Z
	wM2x1BGTo9hmM4EiBHGieCUL6lRxrz9hnmy1iR0m2odHNFaBP5BioGTog4XuOFEyXdPkNC8MYys
	z9GIMVEJqBOUaiRgA4I
X-Received: by 2002:a05:6a20:7f8a:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3dd8c3d3adcmr16220244637.2.1789979526562;
        Mon, 21 Sep 2026 01:32:06 -0700 (PDT)
Received: from [198.18.0.1] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm22005475eec.30.2026.09.21.01.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:32:06 -0700 (PDT)
Message-ID: <47c04ef4-814e-4055-88ce-8cc9057f9c04@gmail.com>
Date: Mon, 21 Sep 2026 16:32:02 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: [GIT PULL] Chinese-docs changes for v7.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The following changes since commit 322695d64f868da8d1091ea93c7c8f47bcc41220:

   docs: ioctl: fix stale NVMe registry entry and note N conflict 
(2026-09-15 13:44:43 -0600)

are available in the Git repository at:

   git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git 
tags/Chinese-docs-7.4

for you to fetch changes up to 2dc934836234303798c818467c4fe8d254ffc4ab:

   docs/zh_CN: link to Chinese applying-patches translation (2026-09-21 
15:27:30 +0800)

----------------------------------------------------------------
Chinese translation docs for 7.4

Update the Chinese translation subtree for the 7.4 release cycle:

- Refine docs/zh_TW for improved Traditional Chinese phrasing and 
terminology.
- Adding/synchronize doc changes across DAMON, networking, and other 
sections.

Tested with 'make htmldocs'.

Signed-off-by: Alex Shi <alexs@kernel.org>

----------------------------------------------------------------
Chen-Yu Yeh (16):
       docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
       docs/zh_TW: process: localize terminology in 1.Intro.rst
       docs/zh_TW: process: localize terminology in 
code-of-conduct-interpretation.rst
       docs/zh_TW: process: localize terminology in license-rules.rst
       docs/zh_TW: process: localize terminology in email-clients.rst
       docs/zh_TW: process: localize terminology in programming-language.rst
       docs/zh_TW: process: localize terminology in coding-style.rst
       docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
       docs/zh_TW: process: localize terminology in 5.Posting.rst
       docs/zh_TW: process: localize terminology in 2.Process.rst
       docs/zh_TW: process: localize terminology in howto.rst
       docs/zh_TW: process: localize terminology in 
embargoed-hardware-issues.rst
       docs/zh_TW: process: localize terminology in submitting-patches.rst
       docs/zh_TW: process: localize terminology in 8.Conclusion.rst
       docs/zh_TW: process: localize terminology in index.rst
       docs/zh_TW: Add a glossary for Traditional Chinese translations

Doehyun Baek (7):
       docs/zh_CN: update DAMON design translation
       docs/zh_CN: add DAMON_STAT usage translation
       docs/zh_CN: update DAMON index translation
       docs/zh_CN: update DAMON start translation
       docs/zh_CN: update DAMON usage translation
       docs/zh_CN: update DAMON reclaim translation
       docs/zh_CN: update DAMON LRU sort translation

Siwei Chen (5):
       docs/zh_CN: Add networking team documentation Chinese translation
       docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
       docs/zh_CN: Add Softnet Driver Issues Chinese translation
       docs/zh_CN: Add ipv6 Chinese translation
       docs/zh_CN: Add LSM/SELinux secid Chinese translation

Weijie Yuan (2):
       docs/zh_CN: add process/applying-patches Chinese translation
       docs/zh_CN: link to Chinese applying-patches translation

  Documentation/translations/zh_CN/admin-guide/README.rst 
      |   2 +-
  Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst 
      |  15 ++--
  Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst 
      |  68 ++++++++++++++++-
  Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst 
      |  82 ++++++++++++++++++++-
  Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst 
      |  63 +++++++++++++---
  Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst 
      |  94 +++++++++++++++++++++++
  Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst 
      | 523 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------
  Documentation/translations/zh_CN/mm/damon/design.rst 
      | 667 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
  Documentation/translations/zh_CN/networking/driver.rst 
      | 138 ++++++++++++++++++++++++++++++++++
  Documentation/translations/zh_CN/networking/index.rst 
      |  10 +--
  Documentation/translations/zh_CN/networking/ipv6.rst 
      |  76 +++++++++++++++++++
  Documentation/translations/zh_CN/networking/secid.rst 
      |  24 ++++++
  Documentation/translations/zh_CN/networking/sriov.rst 
      |  34 +++++++++
  Documentation/translations/zh_CN/networking/team.rst 
      |  16 ++++
  Documentation/translations/zh_CN/process/applying-patches.rst 
      | 390 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Documentation/translations/zh_CN/process/howto.rst 
      |   2 +-
  Documentation/translations/zh_CN/process/index.rst 
      |   2 +-
  Documentation/translations/zh_TW/glossary.rst 
      | 168 ++++++++++++++++++++++++++++++++++++++++++
  Documentation/translations/zh_TW/index.rst 
      |   5 +-
  Documentation/translations/zh_TW/process/1.Intro.rst 
      | 235 +++++++++++++++++++++++++++++-----------------------------
  Documentation/translations/zh_TW/process/2.Process.rst 
      | 325 
+++++++++++++++++++++++++++++++++++++++-----------------------------------------
  Documentation/translations/zh_TW/process/5.Posting.rst 
      | 235 +++++++++++++++++++++++++++++++++-------------------------
  Documentation/translations/zh_TW/process/7.AdvancedTopics.rst 
      | 110 +++++++++++++--------------
  Documentation/translations/zh_TW/process/8.Conclusion.rst 
      |  58 ++++++++-------
  Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst | 162 ++++++++++++++++++++++++++++------------
  Documentation/translations/zh_TW/process/coding-style.rst 
      | 614 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------------------------
  Documentation/translations/zh_TW/process/email-clients.rst 
      | 185 ++++++++++++++++++++++++----------------------
  Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst 
      | 209 ++++++++++++++++++++++++++++++----------------------
  Documentation/translations/zh_TW/process/howto.rst 
      | 344 
+++++++++++++++++++++++++++++++++++++++++++------------------------------------------
  Documentation/translations/zh_TW/process/index.rst 
      |  99 +++++++++++++++++++++----
  Documentation/translations/zh_TW/process/license-rules.rst 
      | 203 ++++++++++++++++++++++++++------------------------
  Documentation/translations/zh_TW/process/programming-language.rst 
      |  98 +++++++++++-------------
  Documentation/translations/zh_TW/process/stable-kernel-rules.rst 
      | 256 +++++++++++++++++++++++++++++++++++++++++++++++++++------------
  Documentation/translations/zh_TW/process/submitting-patches.rst 
      | 556 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------
  34 files changed, 4282 insertions(+), 1786 deletions(-)
  create mode 100644 
Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst
  create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
  create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
  create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
  create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
  create mode 100644 Documentation/translations/zh_CN/networking/team.rst
  create mode 100644 
Documentation/translations/zh_CN/process/applying-patches.rst
  create mode 100644 Documentation/translations/zh_TW/glossary.rst
