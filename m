Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693349;
	b=lMYU6oXmLSaO/hBXJbqIfL3ysWfONUvr+ZijDTOF29xhASMOGJXeQbjnUdlv0WUazgXJ
	 CT3mJJcVrhzKXUlYHEfSz4TY3hlVZ6q8T7yKPJYOVeN3X7qhSfOhfDWGwfTV154lJT5Th
	 LAWWmQK9GfL+S5RoHj+f9TMO5gnltNF6YLXCW+63O51JBWsFYAHhKIqU9h8HZD5pHIIp1
	 n4d0ZDxWzjUiUD/4ZoHsy7XZ36ggP8ErYedgkcipiGsbD9lcNOmgYzL9EdXjMNCBpSj0k
	 mtur4cGU/WQdB208MYOwjIY+DEEirQMYNYgCc2MWA6q+KE+O1h8Vnbc+9GStyDQ0tpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vOwlBcev1S8HKV7nx+URCpkHr4Kt/un4+8T7BIrH814=;
	b=Zo6K1/1/g7pB6J7XZnJwElRKmaL4KapUTQ0qRxV8smHtTJOB6JsmYdXibMfKiBxn79v0
	 XvCpWRWsY8GwxUwqNMAlg2z0aW+igwK2zDrtvLx4Iu1DX02lL2Yywlm5dYvlQjy/VieCX
	 eRYBcKX8t4CIpmlK4Lx4mOz8nRejMc5ILLFc0cEvEsNAej/23am/7aeMEPBTLqHc7Mxuq
	 ffe+M5F/CoinlRJEmIE5MWFgYO245uSnDgjY3vVLy4Nm7KbOvp0X3PJomkdqVjz+iSbtu
	 omJrV+sWbYFbqevhiv/cIhS8ZHumv6M8oM++w+cg0WvfTm5iY4V66P1utqmVk/8EvUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLAOPlZV;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1259E606D80B
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 08:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1259E606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLAOPlZV
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so8045539eec.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 00:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693348; x=1794298148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOwlBcev1S8HKV7nx+URCpkHr4Kt/un4+8T7BIrH814=;
        b=LLAOPlZV7KPzNmDYlzDokDkrmFSdi2KAjN1Ua8m1mfIGID1L0l7glCXrdPkRLfmK17
         +Enh7KuaBEptKFeoIsmBzqslqMTte/7pdXJKFIo3QmmkwWPrmVBpQ7xxlJmq8NpkJ9fG
         ybuD76d1YsNxzD+bSmLFksuH9hR59zljUaVZk4Mwf3nlQVyCimPSUnecEqQ1a6mJzc6d
         9hYVk9jjVVgcWLCTDjM2z1ty11jjURy45k3SbalYMFPbEyk/Lg+u6pXmWEfF/ZoyEFgY
         A7pnbenVnSvcgvGldM0rtNfyerhDlf1fMP6/5WelSGG8TKAd+zecMXIDVzCFyOrFkWtw
         vQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693348; x=1794298148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOwlBcev1S8HKV7nx+URCpkHr4Kt/un4+8T7BIrH814=;
        b=NodizBl0C4+aBxwhtx4yHlr64SSsNFGgbGkYudAf0qO2gcz8FohqsE0vUCCA5UaF+p
         5PeQ0FSy6W0hPYpVEl/fn6Pa+v2znFikPcoL4Gm6T9WadbJv4m1gLa/lYG0U2GsOFodn
         k5APsF6merakExqK7m3VSQkYWVr2HhTPPvToQaDvIRApJBOBwOinyi/Deq389KCi9/eH
         8ctTpfJbAbUSyFLOBkRkq26T3sqGyb9WAr53FF50X8AUaZmpc0rSIngqyAVm4SKKiQzu
         var8wZbpsqsGpb54QdfVTU2tdYF+reokaQ7LjVdzLTj2a17FlR4Hnqgpn1y5a3AOBVST
         +41A==
X-Forwarded-Encrypted: i=1; AKwUvByEl+lfUih4fUBKeBcdHvauPLQedaY9nCpkxoYkf1EsoZ8zZ9lQOX6JhsAJWVWiwzkKfmYsh0kELQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BLfjjwAnVs+kR6CRBD4MnBz/yCF1OnYzFBiw+CMR5F2IU8+Az
	ndqtvRwGIZBpIIwRuF1WbcKaIc6rkai9tRSpE8VcxGb9ThEYmEcyfaf4
X-Gm-Gg: AYBFou1/H81Fk8AQi9V+5cK1ltyzVX3/YWMQyU1DxsjiaVDerQpQl3gkYD9GOnmlIBu
	QyvpluavxOM+k2QBz2wJW7L01DKrbhl8nMFr3kBIMxXhdYEUd79THty3vlr5O6S1XfCFg8T+pGi
	50eVDISFHfqAqDO/w9i+HHNeT8I/IVJZqMON8qOYKpuWk6/dZuIO3KNA44nQL2JBvTW7oRUi2NH
	ribs3jsTJcFBrEEDWxQMS9OFKzt8thTykafwrguqlSmC+0xa2Ox5eK6JAxOvCt4mwpB7jroYj2v
	0facq6ts/MiHJ3LdWh84IPNrcEXT6xkjw4GqtxkjQVQFC/hD4XYVzBn0GG9B12XcvxEt5BOJgef
	HRlrDQ3XEgmQKuWO7b49ueO9O3DiIHJGxiDVUMVR+YcmNIy60EVC8J4hA0xcMEbpSMZp/TspzBc
	mRElinfT3bYSUbuvO1+f3Wx2Gf+pqIO1aKUcxVQgoxrRQ9oOFeuLaNVBwl96aMeix/K2t3EMrQp
	yN9B5ur02+U1eE+pXFYBvRxBn9ekxdtH/HorACIoR9ea7BiMgGawcnqF9oSlUIKyU8e5VBa4P66
	O8MsZ8SZH5DFfmI5DYAl73rMtJ5/q26luiWD1E/pnwrpoNCYBeksStlb7z3vApLzSkAoxsuBWmY
	ivOUuzte/cm+8WnUjGRnnAVLvLrbTxb2/0QVipc5maqvvM7o=
X-Received: by 2002:a05:693c:638e:20b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36a423624c8mr18389092eec.6.1793693348178;
        Tue, 03 Nov 2026 00:09:08 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.09.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:09:07 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v13 12/12] docs: describe virtio-sound capture options
Date: Tue,  3 Nov 2026 17:08:21 +0900
Message-ID: <20261103080821.16983-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Keep the virtio_snd entries after virtio_mmio in alphabetical order.
Include a diffstat in every mail patch.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 Documentation/admin-guide/kernel-parameters.txt |   30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,36 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
