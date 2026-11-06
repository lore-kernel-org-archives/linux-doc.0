Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981965;
	b=vBPqUpm8BuPxex5QScItucNXRPu5h5pzGOFjs1tKQOIChJ63pFl+wDSWJzHiMW8avO6o
	 aNGWVxop+t93bI638y/1YtcNxmR9GYgzobfdhinb3dRRI6jEklJytdTDg3FYv9EjTXIG9
	 kFUfB0e16BDs2arEq0ZkZdXDMnjuTU53MeqpCGsgdvmR2Vzub7wQA/WzTcOY9YDNAiz3X
	 4jQPJJ58v+j1pncWqqK8H3D3NQ1hxvaeW2nSs0ED71fo6Nuc+K/StUXCyiB5DioUbfXZL
	 0AG41EvbHA++GUC2kZ/s10mDGIPeZHHZYPrvN6xvpf+5CQf5k5AkQTh81tCLW1KZYZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=bOfnQBhSyh0Jv9fPXOTHaMcI0I6qu5kMHMIrD2vUiESlliEQzpNOXqvjlNb3zj2c59Tv
	 Y14IxR73HJetgdrn8Eq2txEUOiR4vhxw8Xi+SI9HJapiHmVGCHloZa2Zurq1KkluKLsoO
	 eDzFGyZ6wa1EK9f9g5PuHRmSoKHCtdHuilDCzDZCSSWIunQ5DgK8B9FLuVU/gpEdqnRSG
	 5UzwqcQh0ypzwxtO2Dmu2Ml+BN2hwRPLS/cnLuVbL5xR0KcQjDpOUsr3G+wdtWhw/p1Rn
	 XJ54XN/MliJ9kIzIye7R6C5JtUAmZxLOK60MtIm3fBgFu7kz+IODVSI5h3EbQ2fCdqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfrE8Cjb;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79EE608363D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 16:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79EE608363D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfrE8Cjb
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so823446c88.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 08:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981964; x=1794586764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=IfrE8CjbKfXBgHyv/oFbCQSS9viFVOpcOupJ7F4rKbJvdypopl9CKbVP9UfoP4cLfQ
         dFMpkeDRm8ELM8uVcxnFdK2nurMQQFDQy1icTEA6GEYR8hEBY2HzFifOEoBSN5+aJ6n3
         e8CeatXd9YN0OHo65HqTNv5bKxhkZIzx0U63io97uZjsusFh1tihnhKDZfByelY8lbR0
         zCfp+P/dEYD1XN7YE82wMryeh/9Yhef7+inhjdBRK4X8lvyomOrdSeR2J9sb9hUB1fk/
         JoaXY60QE/OiA8Y2Q63eazANw81ya/JNhpMpak81rx24WnLOHgVGFsaw1bBLfKgSRvmK
         5l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981964; x=1794586764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=Ktcgj32vl2fGEtguykLjhzP26NFXjrRgkfnVvYBHUnkkEkvQN9goxHKTBzE7QIccFw
         BlPLU0zsieYXCgi7dtXQ9LGnvdKGP/O5XOwdy/3YjJkDn2Jc1Z7f19xTUH/Wx7gbX+Tb
         qK8DOlmqSDCAefMboWJ5djJxLgELnYVsh2j7PUwMg2Bne0T2rKOx8sMVVvI99gvkZ6Bu
         w7CgfCpnGO0gp1TMra2+KiUJDu5yqcDIB2tmmkuRoKzFkAU+vmGknlr7NJUjY71t9PWO
         nBr56zJLyr9SokJzAfnOW45v2otGbhtnsaVnmKTCYAS4LQP8h+Hf/kI1dek5HDjBPk3f
         vSCg==
X-Forwarded-Encrypted: i=1; AKwUvBxcoVz1Fa/PWhGvTo7/cGjwQwBcoWspsUOs9vnmX4n3O8lmKMec8XYe64zsKDXFrmbg41SUfZ+gE34=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KT8dS7bnojtxkiU64qrrP55OYmWbgZlNB/voNa8i7G+OHjUVK
	XQ5kD+OXCzTdeM7w+/mrbjzXEOgp1CXSCoY+yAU6j6ZVdiw4yXNHYAKf0pB6BDQG
X-Gm-Gg: AYBFou0oCW79jCPKaxitDcGqL/2kpoKNWh6Ct4J5KzXKOg5mmeRG8tsQBvK3QQoq+/G
	JC/6SP2kGF6bYzAzScBN3Fkl6J7HJXSERdBIEwPoKBw+flTDJmSXypNmbuInniGEKUGoZQupIXS
	NlfAFZQojpBWrbfaOeOWic9iE+vBPoEMe/7eYt6CqGjHvmsbnsr+S6dnNS2IK4MZzt6+I94vveb
	QWscrslLQq3M7U56lwGWKG4uv/UDsAH8YQvCFte+dRZJwGPJGCu5unCPOgTr9Q57xyE8ItkjyjU
	sFvJGazdyFuY8PXPYs21//6hJZhjZFTXEuK4dhVP9OxeEFyG4tYlxgtlK2jMQvcxbU1ucsF561m
	bRsD6nH/b6dB+GxjbzQ/V3jSabCu41I8TlpMAJwOryKEUPCWGEU+HOpPmsJHg0NQCiFezYQtWEO
	12hCBCWJkuDvzT9t5Kz4Ch6skg8sF4QI9lLSpouHyDd5ng1zxPXCuFcXYx/lczxP1h6RegAPlvq
	aA6GQk6mzJtL1cDTKmL/0YkVbc7v6SuNmxuQPGnONHgUGWPO9o3YZYjHejk3R9cyflqRJdaJ7dX
	xM4wPxeDsSUqn0hjOUQMldRbdRxib18lGPmdcBMx573Qc3Z7sbIekQOV6WL1E9Dy8IjrYRFVegJ
	Y2GFOGxezC+uycVb60jK0yHYtUq+/1Lzc7BVLLHsJ0CTPPg==
X-Received: by 2002:a05:701b:4211:20b0:147:a685:9125 with SMTP id a92af1059eb24-1b25d28c296mr3676583c88.2.1793981963864;
        Fri, 06 Nov 2026 08:19:23 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.19.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:19:23 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v19 12/12] docs: describe virtio-sound capture options
Date: Sat,  7 Nov 2026 01:18:38 +0900
Message-ID: <20261106161838.94308-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State
that capture_allow_empty, capture_allow_short, capture_packed_status and
capture_pause_restart require capture_staging, and use the ALSA kernel
parameter restriction tag for each entry.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,35 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,ALSA]
+			Retry a bounded number of empty startup capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,ALSA]
+			Accept non-empty, frame-aligned short capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read status immediately after the returned capture data
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Release and reprepare capture streams across pause when
+			virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_staging= [HW,ALSA]
+			Enable staged capture using request-owned buffers.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
