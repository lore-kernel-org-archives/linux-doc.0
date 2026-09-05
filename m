Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BED3DB647
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591843; cv=none; b=eauprNYTTgKlZ9TK3fknbhNAhCD9P2UlfC/8nwnZ7azYhRXeq6KESZUpo2NBr4BRxtk8KDwIoEo9VeTZe8XqYQb44d+jInauH+KzOnXRVUq0YFhr4GANOwIrl3A89jfokRh0cmDrxS7E3l0a59od8R/k0gqG0LVobENeiZbCLjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591843; c=relaxed/simple;
	bh=mhOUqwN3oOeKlzw4AsIblKh3dvC9P48S/odFVVFSApM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UPQ5/dgiv8nB80aLNgQ6/00rCy6z1/5IH0f4JaKmPMd2y1akZJKgJACM2HdzW9dhpXhhZuPKoOmSziEFNdkNuP7tGyAXpShRBC3dDvEGcK2HW5gkPJRr5rj/qZRLE6cdVaY0o0uZjtWabTlHekLEDCCyZcBW8Jw6n+dS+fg120I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTtTkvs6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTtTkvs6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48436216a98so1173855f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591837; x=1789196637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqbG77xAuC4eDU7XlaYrFKEyC2xRrttTZAEX6ejP9/I=;
        b=rTtTkvs6rM4NMcTBt8xaHA01lBlWiXX3jY40M7exjflP2eSuk0fXtdEIVw962mYre4
         Ppkhcmkyfiy99qBQIutIEDXPYrNbMzpER24nQZGdCVpycjI6q5KVdpUKf7835Z626bmN
         0XYU9d3/pG6cwOndupi0QvQi6RdAnlwn51MBcM8TP+BCx+Oj6nw5Wy1oefcXyYw/RX8U
         PlSdHcYzEtkmipy9uv6trEmsh6UITF6Equj/68D50/aotKv+wmjg3xY5J4LrzFrWl1pv
         4ATLBMbxQZg0lwHvXoZGKMF5rEB138MBB7DThJYARD28T63bmsjfq9M9mDodqWNgAR6p
         vVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591837; x=1789196637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqbG77xAuC4eDU7XlaYrFKEyC2xRrttTZAEX6ejP9/I=;
        b=cmrFuLLtuqvbo5tsYCo8I6YyWkV4Uum2ZDUC8FQzwZG+dJEeCJgNYb8ChIsz+bAmoN
         qah1qtF7PY07Flx/geXFjVkZpr8qkeHG8VmdSgfne7aPqCxcm9ePUdMUXAR6ZJzVxWrI
         qcWf70cBfaGRe5IZ1wJZRN9Vazj0LPO1BUE1SrrspLJk2VPGs4CZnPkX1Q7xH8YpkieE
         mr5BUmh+XWukZtdzAAqn3tl0YyXfEnMpcP5uU3B8YCsWa2uvthwwtI21WllldWntK6he
         LqoSo+kimtLfIEU8WHlz6NUFjkuq4NbwaBeXxJBi+m+TSdNAsLE09tOsmBiCE7sphMzQ
         HgNw==
X-Forwarded-Encrypted: i=1; AKwUvByZrUKD9IA9sHrzyqZdbMGhl71XzkrezL2zbezof+GDdXnnjCc6Vj6+NEgLc/ePxSDInwc3ei3PNEM=@vger.kernel.org
X-Gm-Message-State: AFuF++k2frZ8c/aKNYEiWcnpY8Ji4Uop/Ttod2+LIcI0OJ+PBcqYcFjv
	Y9C9Tu9Cis/zDDiaxR0lUKBoktW9OCYriDBLhegB2H9HNuC6Re3hLEJY
X-Gm-Gg: AYBFou0dlB94Rn64UNEwzRJnucmAL2Qrd6jIUaMMMdOTE/vsuB00xqaQS1TbETXaSz/
	SnovE1Z0bBJuMRiS7PxovsUVdyaiSnIu4GI+hEKaJjUfyeE91N32yKwUD2hiyjaJBAzd/8dLPSs
	ddbr0jAvKyjZPHvbpYGvg9x+UY69Tl1d327Xhrq/uwRIC1G7w8hO1b+x6A4yU6bCWLrC9+4RDRa
	R4KiAaunMN/bKp0dJAZhxecfQp7p4cGQVeV0mRK9JsjGYaw89nup3ur7JUBJSNEkpBnnDE82ppR
	jIbDmvtLS/ELiLpYIXCzAX2eK5QvA16KXLvK4IiCbBxQMyvmQeKulDTyfycLOnqt8PhRjOrB221
	ETEX+KoWbIoL/Mm1u+FVfgX3QdwW/STfgyiWM7sDnnu6SIyoxGTmUl7Lg0/M0ZcSOyWPsxZmsAg
	wtk/8W2u1KcxU+HmlKQFuB7tjCanIS1jZ6UsN4lECNTxikJ8DpX4iA1XiDq/5+npr6g13eHr/Ud
	CN1cjettDS/pMXIC2CVjuWjOAdK1RZZZzWhOZ590U1z9CGFcOMKkUzW4+O+i7A8mXSViXT4SQhT
	3ZKSBkEQRsUoyV/Nn7TDvCV5IAWW6LuPptdXh+sYBwr97A0fEVJI6BmgWcz+xRZntg+aYjma
X-Received: by 2002:a05:6000:1a85:b0:485:8c17:9775 with SMTP id ffacd0b85a97d-4858c179a0emr7751270f8f.55.1788591836769;
        Sat, 05 Sep 2026 00:03:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:56 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	linux-ide@vger.kernel.org
Subject: [PATCH 1/9] docs: kernel-parameters: Drop the atarimouse= entry
Date: Sat,  5 Sep 2026 09:03:39 +0200
Message-Id: <20260905070347.25902-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..c8d96de4c00d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,8 +591,6 @@ Kernel parameters
 
 	ataflop=	[HW,M68k]
 
-	atarimouse=	[HW,MOUSE] Atari Mouse
-
 	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
 			EzKey and similar keyboards
 
-- 
2.53.0

