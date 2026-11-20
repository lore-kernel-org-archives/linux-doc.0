Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157499;
	b=FS6HVFtnreOaIxPrr+LidWSyhpME+dL0qnY6OAluTmLJlhbEPqAkO5KRBANp37XMb+r4
	 Olg+7wQYzhEB+XoXtwkCvUHOq4cEiDXyEdZk4PV+ANX4bQJH4ZBTDvBlujM0N9bt4tVdO
	 +pmQ43nvEg4ea3omw+20rP96w1QqYdSw+E8Dxlrcayqb6P4mhL342BONR7DnMpXUZ20/A
	 HutqY7ufbf9J6ZZy/dgU3VzWxxLlZKHvtYd8H37GKTuWgD2v5hFjEN/D38Yb0cKp61Aap
	 /+s75jGWrPNhLldArZc99TROKVjXcA3ufBa6TTdht44xmdkbRIlevr/HP727obl2C6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=QkOjyUxFD4iGN3foebl1PNBKbCZy9TF70hJl4VipDQk=;
	b=XPq9/AgC4wNVuqoYZW15k1u1qPIrNtGFCCX1A2JbGBTJ1yuGHkT2Kp4HXJAyLN59J7dg
	 UM3B/6jdr0pIx1vYJkvIkXIWsCKguxnE/t30iit6ik5anxEyRBBdwy95bNX3r3X/vwvzG
	 kZzhUbZKAg+YMSiEsFM5XPzI5SdAr/2H3BflMLefyiZgZUS9Ka1Hg81981ko9zjBPxgEb
	 Zw5CcW+tv4i7MYkxEPpGtqdUZua8++Xh4H8DdzYvdd1WYdSQfFA6iHHEkX29WGdLVT3sU
	 LJgiTK7odLcR2sWZVuaV0X5+xbTb2ImWArWeTDpqQKFhrr66QvFmRpew4TkqAwIJkuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=R91yIs3w;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF14606A325;
	Fri, 20 Nov 2026 06:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF14606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=R91yIs3w
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jW5bW5m47z8Xrrr;
	Fri, 20 Nov 2026 14:51:35 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795157495;
	bh=ssuXCnFeWlBYZvoeFd26ywYVrzitiYp5r2Sm+PSkqho=;
	h=Date:From:To:Cc:Subject;
	b=R91yIs3wUrOQJNN4W42KJkOZ7fwm5dhbhL33EM6gIn+1D7qpB+AVRZCDAb1F7uLM1
	 OXuWx73GsgywOagWgNFtDrHWNIjLQjxDB5z6mws7SNAZ5SZsCPDzQq/bQIOkZPFxA3
	 SJQE8doNGlVALgGmc/h0yCpTclycAP33ThWCREpbQh4vJXsMk+eo065/NLYOwS2xTt
	 3+IplabHhpe/h/OhwOSC3l5T08ezSxhV51NStZN2OISicQq+XLh1ISV2fn6C6ZWwG7
	 vv0ggeUNCbDdChrAji1B94JN5Q+SLz0u453/FGwK5quN5/5TgV3byOgzBc2+CzgiiE
	 Js2MxV6P5cBHQ==
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl1.zte.com.cn with SMTP id 6AK6pFAx086097;
	Fri, 20 Nov 2026 14:51:15 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxl2zmapp05[null])
	by mapi (Zmail) with MAPI id mid16;
	Fri, 20 Nov 2026 14:51:17 +0800 (CST)
X-Zmail-TransId: 2b076affede5677-0a5aa
X-Mailer: Zmail v1.0
Message-ID: <20261120145117988UPrFJYA461pgTds3xOCwH@zte.com.cn>
Date: Fri, 20 Nov 2026 14:51:17 +0800 (CST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <lv.yating@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
        <rdunlap@infradead.org>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <liu.qingtao2@zte.com.cn>, <he.yilin@zte.com.cn>,
        <ye.zhihao1@zte.com.cn>, <zhang.cheng35@zte.com.cn>,
        <hu.shengming@zte.com.cn>, <lv.yating@zte.com.cn>,
        <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyIDAvMl0gcmlzY3Y6IEFkZCBCZWlqaW5nIExlYXBSaXNlIFRlY2hub2xvZ3kgdmVuZG9yIElEIGFuZCB2ZW5kb3IgZXh0ZW5zaW9uIGZyYW1ld29yaw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AK6pFAx086097
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 20 Nov 2026 14:51:35 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFFEDF7.001/4jW5bW5m47z8Xrrr

From: Lv Yating <lv.yating@zte.com.cn>

Hi,

Beijing LeapRise Technology has been assigned a JEDEC manufacturer
identity, encoded as 0x966 in the mvendorid CSR per the JEP106
scheme (bank 0x12, final byte 0x66).

This series lays the kernel groundwork for LeapRise RISC-V cores:

Patch 1 adds the vendor ID constant (LEAPRISE_VENDOR_ID) to the
RISC-V vendor list.

Patch 2 adds the vendor extension framework support: hwprobe key
recognition (RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0) and an empty
extension probe list hooked into the common probing path. The key
reports an empty bitmask for now, allowing userspace to distinguish
it from unknown keys (reported as -1), so LeapRise userspace
libraries can be prepared ahead of the first hardware shipping
vendor extensions. The key is documented in
Documentation/arch/riscv/hwprobe.rst.

Follow-up patches will register extensions as their specifications
are finalized.

---
Changelog:

v2:
- Bumped RISCV_HWPROBE_MAX_KEY to 17 so the new key is valid for
  userspace and in the vDSO data.
- Registered LeapRise in the vendor extension framework: added the entry
  to riscv_isa_vendor_ext_list[], the LEAPRISE_VENDOR_ID switch case,
  riscv_isa_vendor_ext_list_leaprise in leaprise.c, and
  RISCV_ISA_VENDOR_EXT_MAX_LEAPRISE.
- Fixed the build failure in vendor_extensions.c and the wrong
  MIPS_VENDOR_ID case label.
- Fixed the Kconfig.vendor syntax error.
- Unified SPDX on GPL-2.0-only and cleaned up the new files.

v1:
-https://lore.kernel.org/all/202611160811.6AG8B8QM046993@mse-db.zte.com.cn/
-https://lore.kernel.org/all/202611160824.6AG8OXL4051238@mse-db.zte.com.cn/

best regards,
Lv Yating

Lv Yating (2):
  riscv: Add LeapRise Technology to the vendor list
  riscv: hwprobe: Add LeapRise vendor extension framework support

 Documentation/arch/riscv/hwprobe.rst          |  4 ++++
 arch/riscv/Kconfig.vendor                     | 14 +++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  3 ++-
 .../include/asm/vendor_extensions/leaprise.h  | 17 ++++++++++++++++
 .../asm/vendor_extensions/leaprise_hwprobe.h  | 20 +++++++++++++++++++
 arch/riscv/include/asm/vendorid_list.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/leaprise.h |  3 +++
 arch/riscv/kernel/sys_hwprobe.c               |  4 ++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 .../riscv/kernel/vendor_extensions/leaprise.c | 12 +++++++++++
 .../vendor_extensions/leaprise_hwprobe.c      | 19 ++++++++++++++++++
 13 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/leaprise.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c

-- 
2.27.0
