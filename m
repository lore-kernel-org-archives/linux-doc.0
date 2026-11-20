Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158190;
	b=Mxs03O+rD6sJXAiSQFZ/7eKuMXtoTx9IVle8oJXcid/kZiVtm/dzdh3m8HTr48dUaI5F
	 CP9QVUvgac+mCW2ctkfecKDYphs/cORFg8GHJ2a01b2oevtj+hC724bwWnS3NyhQ8P6US
	 9Db5MWuxU/ZHdT3hd1l0+XhXh0LeNSiSZU21zwFq8IoeQdVO35KoRW/HJ61MmVoGWMsox
	 qV94rwaBGKK+8hQmqV7QzLUwHmwCyXqJHiPvuNIqYkoEiJEpOKA4la7m2Qi7Uo61m2dMM
	 61axGGSlHkGvtypGaQh2UhTQm7QM0VnTZRcHQDtwsLX85rIoqZ0qPONHYrsNreav4zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=58IfPnqHRKLwuXBvAs4GhM8StT1P1xBBygpTTFKoJac=;
	b=zbQt5k/i8mI+6Sb4JBzXRUXuQgrbjwMUDCgT9MEZM0wVPoOLwdFiUq6ZZg45Q9PP7R6f
	 iyz/TntDWf5MPd5aNRiOrK63LV94nUKehW5cq8ni8gsZMdvm4U24A7r3sXN7MinvagKQb
	 W27ZMLtdVxuHowUMV6sYLSr2EKirAbxvD9CC0bkBWLecRicGjQtPBx8xIK1w2K2omNepE
	 lBzQW63WOGXGvtWsuxhUqR7w80s7+K2THgGS1pMfL8++uL8i0zJhR1tZU3qffeHGQWXl8
	 VLIbzYPuJ9NHQTaB/yGtvMA3H/KKoWNfBRCu6Zmwzxxx7FFGFWvA1J/sTyAKRrSlYaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=J9ET1Cs+;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF84606A330;
	Fri, 20 Nov 2026 07:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF84606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=J9ET1Cs+
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jW5rp69Pxz4yjjW;
	Fri, 20 Nov 2026 15:03:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795158186;
	bh=N0NdiKv+Fy5j35Vr2TJujUaTH6LyttgdteR+TV6ffEE=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=J9ET1Cs+YeTtafsH2qkpTj2Ja+FiTot+AvErcBCP0ihkcOrip7hmunydk5lfVivhy
	 7ghYQ1iI1I7pY0noTtsSMM7eDaCW62ZX9reClGP/tsEH1dkiOoApppfl5NfyufTB9z
	 UpUlpQ5mv9mqjIntxvcSwRAX3WUgJ89VhrYrSwgiZYxqYlH77zQ6FUYdYcbAJ8oQTE
	 ywTRWemIfMk35SaMM9sBZQoJkIodxIpfuO5XwwfV3LnZhWPXsOoygRwmBXyY16/zt5
	 JWfFCiAiGSCaShGV+QImPVtC1EephFH4gUvRiRlLyTZ7K/lzR1GCzEagwIMtnt2wJN
	 /gGH/Th2jQdFQ==
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 6AK72o3V000160;
	Fri, 20 Nov 2026 15:02:50 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid16;
	Fri, 20 Nov 2026 15:02:53 +0800 (CST)
X-Zmail-TransId: 2b056afff09d266-70133
X-Mailer: Zmail v1.0
Message-ID: <202611201502530442nEKgTSLcZeyW2tFors4D@zte.com.cn>
In-Reply-To: <20261120145117988UPrFJYA461pgTds3xOCwH@zte.com.cn>
References: 20261120145117988UPrFJYA461pgTds3xOCwH@zte.com.cn
Date: Fri, 20 Nov 2026 15:02:53 +0800 (CST)
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
To: <lv.yating@zte.com.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
        <rdunlap@infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <liu.qingtao2@zte.com.cn>,
        <he.yilin@zte.com.cn>, <ye.zhihao1@zte.com.cn>,
        <zhang.cheng35@zte.com.cn>, <hu.shengming@zte.com.cn>,
        <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyIDEvMl0gcmlzY3Y6IEFkZCBMZWFwUmlzZSBUZWNobm9sb2d5IHRvIHRoZSB2ZW5kb3IgbGlzdA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AK72o3V000160
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 20 Nov 2026 15:03:06 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFFF0AA.002/4jW5rp69Pxz4yjjW

From: Lv Yating <lv.yating@zte.com.cn>

Beijing LeapRise Technology Co., Ltd. has been assigned a JEDEC
manufacturer identity: bank 0x12 with final byte 0x66. Per the
JEP106 encoding used for mvendorid, with the parity bit dropped:

    mvendorid = (bank << 7) | (byte & 0x7f) = 0x966

Add LEAPRISE_VENDOR_ID to the vendor ID list as groundwork for
follow-up patches.

Signed-off-by: Lv Yating <lv.yating@zte.com.cn>
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 7f5030ee1fcf..2d0a8a2e4a67 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -6,6 +6,7 @@
 #define ASM_VENDOR_LIST_H

 #define ANDES_VENDOR_ID		0x31e
+#define LEAPRISE_VENDOR_ID	0x966
 #define MICROCHIP_VENDOR_ID	0x029
 #define MIPS_VENDOR_ID		0x127
 #define SIFIVE_VENDOR_ID	0x489
-- 
2.27.0
