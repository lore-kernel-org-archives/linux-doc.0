Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434255;
	b=P0Y71hBPbcU3iJhkgWa/SyBo0vwYqlEuyhfSvCpaAFjtlJa9SeAx6LHbc0QkpxsLN+Oz
	 KQs51LQ9nzersanLj2R3/hXtDReB5ZBBFNG+iop6YaFXk1EHsyUO67XEwSx8r5PzCHlOq
	 0EnNxJVMGuOhCTLA58Nj8oDcjeJJAtvezd2L1pBc3fs+QjshsIjZObIHLazXTSG+6diMD
	 LNPGb2wHcQIxD3q0B1VelfJNlqGTlmcfLU/gXLBLsQm80JhoHERuyGRQR+nQXCr/3xyIL
	 tFJdYEsckrI3vhpQf+7vAUYGMG5Xx57aUSAFdTUlIr5hftIyG6ObyozoORC461CdIKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SpxeEyGCBIe2pmFodowG7QVxBvAwlFcEp0A+XN+w7cc=;
	b=1NvuwUd4PHdDrUMstqVyUp3hFnZoAi65l5mfJxbKdR1KK0cFxQWWQo6xodJEITh/j9KU
	 nhH1KsL9moeLnYqPg8obvAvPSFsrReDQHUM5YrrTJc4q8UoJ5XJnW+iHz2pCbonxGZV1/
	 bmySzfiT/1zwGe2uBxhO3tYDVfUBQo0kMiZC6zGi1OXNv3JaGuIQtZy18yHI82B7N/7l9
	 hEXp3caXQzRI/4o39Hni1s0XsZYDqU+K0BSjOJHKYTwJ1OWRa8Mepo8ZqeiumRI6Tun+O
	 zGSCokm1Ae+9iXIAdr6Frd5JQN7OrEam3rPX1mu+6T2WBgHR82WOW8okArmw6lCSieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEQlVa7S;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8314A606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8314A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEQlVa7S
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36f6295304dso4432220eec.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434255; x=1795039055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpxeEyGCBIe2pmFodowG7QVxBvAwlFcEp0A+XN+w7cc=;
        b=nEQlVa7SBqq5wJgUoTQc0s6JCfis1TV1le55JeVM4syZGTmNngYzCg3Zyltd0lK+Ox
         XTKKuObijblBkqafA7E8qpcMVg62I77jo49rqLT640mDOr9OUoofzd1h8qsHDMTm0q77
         lNm74rfCLHwzuwDMmZo4D5pXFiPlcA6DA6aDeqhT49PhrCpV7+gkzCbpUmap0O8qbkV3
         /EEwLA9ARHl05MSOrb3woRUXjJkDJMF4Z7gvqMCIKQs6ZehuENwy++kvYFoO3pQxKspH
         j3bwqpvBow2fabNc5eoWT0Y+H90vaRhaLbv9TC9dmouPLwV0a5qzRg4XUeOyodmKItH2
         IYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434255; x=1795039055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpxeEyGCBIe2pmFodowG7QVxBvAwlFcEp0A+XN+w7cc=;
        b=QWxCJvDXbJzkpZoBZAHrDV+1uXLVIpt4pl27OpsKFMWaFFYuCRPRy9dovByUYhXoBr
         a6xp9KhUHjITLjspgIW5i2ak4ZdXnASYnFzwVxasVn0w0bYkOqG7Ag1Gk0Hz7dwEfMYJ
         MKbRVjNw+/KvodwlGHTVgOk5/r7AIQNL8NHNZ1icONEVN6OgPGRmNKESc3NMVArAv5p0
         h8CguNuJ5GCrhkmcxYr+lFyL7zgG3fMjUSO/HgIqodz8N0aT3urgMpriRY63C0XiOY9Y
         QlxpukI6OeC/AJoBncrtPBALfNa0U8oUt4L0fa/Aj7OXtfRqFnbVGzF06CWupOpO4W5/
         mkVg==
X-Forwarded-Encrypted: i=1; AL+hErGNqq3zupXRAl0yVccLGKOYZKVGIMOZQtNuYi0XcJ8VRNZnKkd5Y4gAC6XWoslsA6tvJI97c1xTpAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/zYRgqoSrgGTFoOtuXEpMdAaAU2ersp29c51gFYHxRyepU2EF
	Wdzcs0g6mX4sHmTSq76VeHh3CPIooWScUihKxi5zXPc1A3rlUp4OXwYF
X-Gm-Gg: AYBFou0qZ4Nss1LbTsPNiPHEp7ei/MDqZZs/DNg4afOdHY9v2MU2MwHZ/uAS8EcEOpx
	qTiV9JDMW5RfOLCReMO7B9TypHSaqmkeo3eqAPW0DlxJaoq6VjxdX60bIREQIJudsUVQbBaqKGE
	dssiuzWDAOS1O40LNnkJaw0LaNkWm1oI5aVIQOvzG2Q30lb8ZkDy7nSiFyOmLqLtHKjG84hdgVg
	eullA7pxkjn++qjJdvP5W3Qt+AYYZQdYA7y5NfBemO0pjVHGXhcRiGqikvmZejgrBfYxEXihNkF
	uvEMx6fOYVZW+PhobYhyE78A8xTAEIabInWsg0tIWsUTpg08OsHROsGwyIsfrwnpbRsXW7aMgp3
	1UAfTgg02VrSC0ptGVwDqeQNdtNwQYB9Q9/R8wMfMhj47B4bC2j/x6SKGfYA1qnPjtknPsiGZ0n
	zhc9yyRQgZQqW3KkBganlsCe9pSRQSuAcvW9sqtASiphe7OdSW1jsBF9bNHiKqReS0CECkgOAAg
	z8Iy86d2BlO3HvrDgWRfys6EIF8+pXKLXOVeySCIkPWdSvxpxJuZRsufQrLGNLyeOKkMAnB0W4o
	GqGjV23uJ4oqgEwL40BZkSQULWQiQNfxehJzyODok2TIGwEduPEo1DI9liiFYbVhOM/0U5o8iGN
	wOLxarv2/1DFoXq8/2A==
X-Received: by 2002:a05:693c:60cd:b0:369:f18f:3492 with SMTP id 5a478bee46e88-37686d38d9dmr5076667eec.35.1794434254626;
        Wed, 11 Nov 2026 13:57:34 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:eb83:637b:7b26:8dfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm17823523eec.3.2026.11.11.13.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:33 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Henk Vergonet <Henk.Vergonet@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Martin Diehl <m-diehl@gmx.de>,
	"Alfred E . Heggestad" <aeh@db.org>,
	Thomas Reitmayr <treitmayr@devbase.at>,
	Slawomir Stepien <sst@poczta.fm>,
	Jie Wang <jie.wang@intel.com>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	usbb2k-api-dev@nongnu.org,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] powerpc/configs: drop CONFIG_INPUT_YEALINK from ppc6xx_defconfig
Date: Wed, 11 Nov 2026 13:57:22 -0800
Message-ID: <20261111215723.3802209-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
References: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The yealink driver is obsolete and being removed. Drop its module
selection from ppc6xx_defconfig.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 8aab229fb909..29acc77573d6 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -537,7 +537,6 @@ CONFIG_INPUT_PCSPKR=m
 CONFIG_INPUT_ATI_REMOTE2=m
 CONFIG_INPUT_KEYSPAN_REMOTE=m
 CONFIG_INPUT_POWERMATE=m
-CONFIG_INPUT_YEALINK=m
 CONFIG_INPUT_CM109=m
 CONFIG_INPUT_UINPUT=m
 CONFIG_SERIO_RAW=m
-- 
2.56.0.567.gdb80ae8cd5-goog

