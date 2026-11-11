Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434251;
	b=x34A/KqyI1Ots6bbJJp58JesDAGQ14Fksh6VlRt4HgsFgBWT51vUbjVfU8BIsoADdJxR
	 4e4mXLhr/3a8ZXDphCeUQABznDl85sUGWBnQHIuaFlJVyX2sslHyvIMRZHxhgUnyyiRrg
	 mowcHKKWUR9JwxOjEflRo04edNZ2Nx7Kn2QmkfZeMAFYjYMnQiLZvZblUexR9Kv719x0W
	 W+H95okyAipIO8sZtRKmEkbQSRC+KJtr+Dts2vYhkQ/H1KyWS1DCJrO9Nqpps7f+35aEU
	 DfbOEZMlVxTTOwdsJh27GneENguNkDvfN2Za/LZVmqrozaeahq6JlbyTF0UODiBrP4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ggCgsA+NJ3WO/E1t+Aq1JDPeicUUtkRHraZJ7K1wtc=;
	b=ZDm6kZEKqaW3T8Vu/nq2WA4vLUVStTVXOfEg5H+aje/y7j2DclAGlJfqJUcuLUThnUd6
	 ZgTzetIWea8kHBFbt5AC+bU0YM1qvM4/LooYh6fPU74Aq8ITRUdN6lJoupxUyPfmxvMhu
	 VcSuRKK90vWrzkB7Kq4mirKRc4qk3vExDgCRXm1u6GFKRHRh+cVZyspy3BXH4sI5CbOEn
	 HXCe5aTCEFJJf5kuPHxIH0pr2ojCagwMdaWQQQ6C3vdms9lXiLAgMHoNI7PuaZiDKvDP6
	 AArVxMUQtRUiaNrkLaJ+En57z+eknDK+Riu0OmcBkh9u/oqZ87LUPVvxlvPfmI+oEcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpRqHE6w;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06180606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06180606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpRqHE6w
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37071c0f42aso6201222eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434250; x=1795039050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ggCgsA+NJ3WO/E1t+Aq1JDPeicUUtkRHraZJ7K1wtc=;
        b=dpRqHE6wmn5/kypQAavyk2ufy8OymjXbdHszRThOGjX0jhpHZE2qgnjwzT3Vy1/b41
         yQ4Gi3hSMKciusY7qlEJ5+14hX1uBKQfaMxw5cA9h2m6f2Am4HkhyTRKppbGkixO96I9
         4xshsjXZE3rQFOSViTCZVmT9vw1xcGdCrxvzRzieFMx4zhtiRLUIObcxOwBbp+LDcplg
         A6OM9KKLpskJGQyuytSPCIf/ZJCEx7YbYp9PX4Rpv6SrtWlfX1tPBRbZKQWvjwWIf2fz
         TQxHreUPkPkn9Z+C4+hQ+743rtYhXfedsICOSLIje0r6hLPhyzp3psTVzDLlw1t16rGn
         EHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434250; x=1795039050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ggCgsA+NJ3WO/E1t+Aq1JDPeicUUtkRHraZJ7K1wtc=;
        b=cezUyL4pOAIpyBh/VUiAV3VLP3/Lvcq9rYzuPzorhP8TE0OvYWm5YOIL7puBmCmxCQ
         zZ5IQa+09hJTKHEy4GpsdRA1NxV8d+HNAkYe1HdcAaLNUZZH/YadHI0gprsagmk/bznN
         5IxcibMYSKwg9buKNYbQu7LKFyuRMRtaNSOdCBZotvcPMHVT2e/7Ard9JyrkdxdpKWWn
         yhHMrkbZpWkG2AZOFPVXxwxXEqO+0tBLntsw93g+w4DQIPB/MNBNpFlcYpuQubd/RA83
         ymMM+kZ91MEJ6jwsXMxutdWMuei+Bntb72jvuhRtDNMeNMAWUUpzVdJno5Q5CYdRzZwH
         bsyw==
X-Forwarded-Encrypted: i=1; AL+hErFCPV7AjLTziA3aMDb893O8cDTHJ64Fx2bXz0F5PAQ04h1yTLXwLU92GTCAF/sW9Jz729MjREPB/+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A5HzvDLwL1GKkWbZMpGSWqEjoGF3iRqrlRWXCjh7HGos24c+N
	7jie5qgw7HNiWSDB9RKrRDr64LqNCvNMzPr/Cj7DIDaZaOUM6CxJ3Bf1
X-Gm-Gg: AYBFou2lchGOwkHSxpcHJjsUjmdSIeYIhO9NBxkckEWtzw2b742xLIxc/xPgQ4SnJyw
	ZRYVRlVXmTiseZ/nI0CYeCAA15m4WiqxpDJsV0O2cA1PbL/bAYjZezYwYrORDF2+GYO3i9G/sk3
	Rjsw1rliukuRQtI3fk5rqBigJKTcOejjXleZ4nrtQ4VWdkQq/IeU4/zqHHsurJHEyNPhwDnZdhh
	gWyvq9Bp9zyVS84jnqHTTKibQJF4CDUVO9vS62v5FReCRTo+YrRX2y6obJzjVWQ7v9v98UzpRV/
	qoantf0Cy2z+VlMHyWYAUPrIcv2qZy/rsj3lo8hvlxoL38lYiFa7Nu8UACRDCsESTHdsZFeEQ8d
	3CBLqf4dr+VF4uGSgvXlJxxrJ7rVcOsmolJjav3Xk+pIhqV+qMMjA5sA3esO76rK42iKBit+O92
	qNa8n6YjsJzr13d45AXq2qsSuyBJuHnWok8Pr+wFHv+77rVzj9k7YEsdMeFvWim+KBC/ahZKHqe
	WynEmaLPEyaV4VoKHhgS35+7s0/8VdHioP/V1o2GdABpwIWyf8YI+Kv8NjUubAtOPod+VPBYpaV
	+MriKP6rrdW0j33tbP8M7GNoEPLPW0mH1S3fl/I9/nvsYgYUcvqNnK8kpuhzMTZycvJNc20Z62v
	WQ+a4bfwRKNIJMvJFRQ==
X-Received: by 2002:a05:7300:2d2b:b0:36d:2704:6adf with SMTP id 5a478bee46e88-3768579df8bmr5681391eec.11.1794434249909;
        Wed, 11 Nov 2026 13:57:29 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:eb83:637b:7b26:8dfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm17823523eec.3.2026.11.11.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:27 -0800 (PST)
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
Subject: [PATCH 0/2] Input: remove obsolete yealink USB phone driver
Date: Wed, 11 Nov 2026 13:57:21 -0800
Message-ID: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

This short series removes the obsolete yealink driver for the mid-2000s
Yealink USB-P1K (0x6993:0xb001) USB 1.1 Skype/VoIP telephone handset
and drops its module selection from ppc6xx_defconfig.

The hardware relied on dedicated userspace bridge utilities (such as
usbb2k-api / kb2kskype for the defunct legacy Skype desktop API, or
yeaphone for liblinphone) to drive its keypad, segmented LCD, and tones
through custom sysfs attributes. That userspace ecosystem has been
unmaintained for over 15 years, and the driver itself has seen no
functional updates, hardware testing, or new device IDs since 2008
while continuing to attract syzbot USB fuzzing reports and drive-by
cleanup patches.

Thanks.

Dmitry Torokhov (2):
  powerpc/configs: drop CONFIG_INPUT_YEALINK from ppc6xx_defconfig
  Input: yealink - remove driver

 Documentation/.renames.txt              |   1 -
 Documentation/input/devices/yealink.rst | 226 ------
 MAINTAINERS                             |   6 -
 arch/powerpc/configs/ppc6xx_defconfig   |   1 -
 drivers/hid/hid-ids.h                   |   3 -
 drivers/hid/hid-quirks.c                |   1 -
 drivers/input/misc/Kconfig              |  15 -
 drivers/input/misc/Makefile             |   1 -
 drivers/input/misc/yealink.c            | 950 ------------------------
 drivers/input/misc/yealink.h            | 206 -----
 10 files changed, 1410 deletions(-)
 delete mode 100644 Documentation/input/devices/yealink.rst
 delete mode 100644 drivers/input/misc/yealink.c
 delete mode 100644 drivers/input/misc/yealink.h

-- 
2.56.0.567.gdb80ae8cd5-goog

